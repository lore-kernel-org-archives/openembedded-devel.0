Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LwMpU-0004os-DB
	for openembedded-devel@openembedded.org; Tue, 21 Apr 2009 22:44:32 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1LwMl8-0001K9-NO
	for openembedded-devel@openembedded.org; Tue, 21 Apr 2009 20:40:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 21 Apr 2009 20:40:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 21 Apr 2009 20:40:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 21 Apr 2009 22:34:06 +0200
Message-ID: <gslaju$mfs$3@ger.gmane.org>
References: <1238753080-8005-1-git-send-email-khimov@altell.ru>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090415 Shredder/3.0b3pre
In-Reply-To: <1238753080-8005-1-git-send-email-khimov@altell.ru>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] ace: New recipe for ACE 5.6.8
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
X-List-Received-Date: Tue, 21 Apr 2009 20:44:32 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03-04-09 12:04, Roman I Khimov wrote:

Acked-by: Koen Kooi <koen@openembedded.org>


> ---
>   conf/checksums.ini       |    4 ++++
>   recipes/ace/ace.inc      |   18 ++++++++++++++++++
>   recipes/ace/ace_5.6.8.bb |    1 +
>   3 files changed, 23 insertions(+), 0 deletions(-)
>   create mode 100644 recipes/ace/ace.inc
>   create mode 100644 recipes/ace/ace_5.6.8.bb
>
> diff --git a/conf/checksums.ini b/conf/checksums.ini
> index 15fff1d..18ea297 100644
> --- a/conf/checksums.ini
> +++ b/conf/checksums.ini
> @@ -58,6 +58,10 @@ sha256=7a960180e7873b1bdb522e76b0423b5c2c1b8efe1d30d7ca80c41eb97d822b2d
>   md5=24b0e5bbfe21ea9c5a5c589bcc79c0f2
>   sha256=ab877846c6caaff32efbf5be6fc5c63b7dec97a2e78c57c525da7705d2052bfc
>
> +[ftp://download.dre.vanderbilt.edu/previous_versions/ACE-5.6.8.tar.bz2]
> +md5=81c1ff761c3431cd12c81337aa80d558
> +sha256=96b70582d931a7e83c3ca31b3bc7e23957391e16dee4ae6ddf938c9574d50b27
> +
>   [http://www.amd.com/files/connectivitysolutions/geode/geode_lx/AES_Linux_LX_02.01.0100.tar.gz]
>   md5=12cb241a9037fffe31ba7c68a48ed614
>   sha256=a6068b4aa0e2330eed6e4741bad3191dc9ca7d7326f7bfab578ac55e2b8b91a2
> diff --git a/recipes/ace/ace.inc b/recipes/ace/ace.inc
> new file mode 100644
> index 0000000..a83eb65
> --- /dev/null
> +++ b/recipes/ace/ace.inc
> @@ -0,0 +1,18 @@
> +DESCRIPTION = "C++ network programming framework"
> +SECTION = "net"
> +LICENSE = "BSD + others"
> +
> +DEPENDS += "openssl gperf-native"
> +
> +SRC_URI = "ftp://download.dre.vanderbilt.edu/previous_versions/ACE-${PV}.tar.bz2"
> +S = "${WORKDIR}/ACE_wrappers"
> +B = "${WORKDIR}/build.${TARGET_SYS}"
> +
> +EXTRA_OECONF += "--disable-ace-tests --disable-gperf"
> +LEAD_SONAME = "libACE-[0-9.]*.so"
> +
> +inherit autotools
> +
> +do_configure_prepend() {
> +	export ace_cv_linux_event_poll=yes
> +}
> diff --git a/recipes/ace/ace_5.6.8.bb b/recipes/ace/ace_5.6.8.bb
> new file mode 100644
> index 0000000..345abe1
> --- /dev/null
> +++ b/recipes/ace/ace_5.6.8.bb
> @@ -0,0 +1 @@
> +require ace.inc




