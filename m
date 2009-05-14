Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1M4V6f-00043D-IY
	for openembedded-devel@openembedded.org; Thu, 14 May 2009 09:11:55 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1M4V02-0003c4-7m
	for openembedded-devel@openembedded.org; Thu, 14 May 2009 07:05:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 14 May 2009 07:05:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 14 May 2009 07:05:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 14 May 2009 09:00:23 +0200
Message-ID: <gugfi7$hsu$2@ger.gmane.org>
References: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
	<1242207556-15601-38-git-send-email-k.kooi@student.utwente.nl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b5pre) Gecko/20090510 Shredder/3.0b3pre
In-Reply-To: <1242207556-15601-38-git-send-email-k.kooi@student.utwente.nl>
Sender: news <news@ger.gmane.org>
Subject: Re: [STABLE][PATCH 37/37] monit: add patch to remove -s in install.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 May 2009 07:12:01 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13-05-09 11:39, koen.kooi@gmail.com wrote:
> From: Mike Westerhof<mwester@dls.net>

ping

> Signed-off-by: Koen Kooi<koen@openembedded.org>
> ---
>   .../monit/monit-4.10.1/no-strip-in-makefile.patch  |   11 +++++++++++
>   recipes/monit/monit_4.10.1.bb                      |    2 ++
>   2 files changed, 13 insertions(+), 0 deletions(-)
>   create mode 100644 recipes/monit/monit-4.10.1/no-strip-in-makefile.patch
>
> diff --git a/recipes/monit/monit-4.10.1/no-strip-in-makefile.patch b/recipes/monit/monit-4.10.1/no-strip-in-makefile.patch
> new file mode 100644
> index 0000000..26f5108
> --- /dev/null
> +++ b/recipes/monit/monit-4.10.1/no-strip-in-makefile.patch
> @@ -0,0 +1,11 @@
> +--- monit-4.10.1/Makefile.in.orig	2009-05-10 21:19:00.000000000 -0500
> ++++ monit-4.10.1/Makefile.in	2009-05-10 21:19:11.000000000 -0500
> +@@ -39,7 +39,7 @@ MODE_CONF       = 600
> + MODE_DIRS       = 755
> +
> + INSTALL         = @INSTALL@
> +-INSTALL_PROG    = $(INSTALL) -m $(MODE_PROGS) -s
> ++INSTALL_PROG    = $(INSTALL) -m $(MODE_PROGS)
> + INSTALL_FILE    = $(INSTALL) -m $(MODE_FILES)
> + INSTALL_DIR     = $(INSTALL) -m $(MODE_DIRS) -d
> +
> diff --git a/recipes/monit/monit_4.10.1.bb b/recipes/monit/monit_4.10.1.bb
> index bb18491..06d382f 100644
> --- a/recipes/monit/monit_4.10.1.bb
> +++ b/recipes/monit/monit_4.10.1.bb
> @@ -1,7 +1,9 @@
>   LICENSE = "GPL"
>   DEPENDS = "openssl"
> +PR = "r1"
>
>   SRC_URI = "http://www.tildeslash.com/monit/dist/monit-${PV}.tar.gz\
> +	file://no-strip-in-makefile.patch;patch=1 \
>   	file://init"
>
>   INITSCRIPT_NAME = "monit"




