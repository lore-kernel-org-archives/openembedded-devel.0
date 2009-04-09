Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Lrwt4-0006U4-5v
	for openembedded-devel@openembedded.org; Thu, 09 Apr 2009 18:14:01 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Lrwpz-0007Nb-QJ
	for openembedded-devel@openembedded.org; Thu, 09 Apr 2009 16:10:48 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 09 Apr 2009 16:10:47 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 09 Apr 2009 16:10:47 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 09 Apr 2009 18:10:31 +0200
Message-ID: <grl6ln$5qt$1@ger.gmane.org>
References: <1239292973.4784.178.camel@alap>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090405 Shredder/3.0b3pre
In-Reply-To: <1239292973.4784.178.camel@alap>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW, RDNS_NONE, SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] zenity: add a new package
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
X-List-Received-Date: Thu, 09 Apr 2009 16:14:01 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09-04-09 18:02, Angus Ainslie wrote:
>> From a1fee691b400a3bc6fd70b01c33802718bacf275 Mon Sep 17 00:00:00 2001
> From: Previdi Roberto<previdi.roberto@gmail.com>
> Date: Thu, 9 Apr 2009 09:50:29 -0600
> Subject: [PATCH] zenity: add a new package
>
> Signed-off-by: Angus Ainslie<nytowl@openmoko.org>
> ---
>   recipes/zenity/files/makefile.patch |   13 +++++++++++++
>   recipes/zenity/zenity_2.20.1.bb     |   10 ++++++++++
>   2 files changed, 23 insertions(+), 0 deletions(-)
>   create mode 100644 recipes/zenity/files/makefile.patch
>   create mode 100644 recipes/zenity/zenity_2.20.1.bb
>
> diff --git a/recipes/zenity/files/makefile.patch b/recipes/zenity/files/makefile.patch
> new file mode 100644
> index 0000000..9bdd5dd
> --- /dev/null
> +++ b/recipes/zenity/files/makefile.patch
> @@ -0,0 +1,13 @@
> +diff -c -r patcher_original/zenity-2.20.1/src/Makefile.am zenity-2.20.1/src/Makefile.am
> +*** patcher_original/zenity-2.20.1/src/Makefile.am     Mon Nov 26 22:57:40 2007
> +--- zenity-2.20.1/src/Makefile.am      Thu Apr  2 00:31:39 2009
> +***************
> +*** 21,27 ****
> +       zenity.h
> +
> +  zenity_CPPFLAGS = \
> +-      -I$(includedir)                                 \
> +       -DGNOMELOCALEDIR=\""$(datadir)/locale"\"        \
> +       -DZENITY_DATADIR=\""$(pkgdatadir)"\"            \
> +       $(AM_CPPFLAGS)
> +--- 21,26 ----
> diff --git a/recipes/zenity/zenity_2.20.1.bb b/recipes/zenity/zenity_2.20.1.bb
> new file mode 100644
> index 0000000..7822ee7
> --- /dev/null
> +++ b/recipes/zenity/zenity_2.20.1.bb
> @@ -0,0 +1,10 @@
> +DESCRIPTION = "A tool to display dialogs from the command line and shell scripts."
> +HOMEPAGE = "http://freshmeat.net/projects/zenity"
> +LICENSE = "GPL"
> +DEPENDS = "libgnomecanvas"
> +SECTION = "console/utils"
> +
> +SRC_URI = "ftp://ftp.gnome.org/pub/gnome/sources/zenity/2.20/zenity-${PV}.tar.bz2 \
> +           file://makefile.patch;patch=1"
> +
> +inherit autotools
> --
> 1.5.6.3

NACK:

* missing checksum
* not using 'inherit gnome'

regards,

Koen



