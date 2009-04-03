Received: from [209.85.198.242] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Lpold-0002KJ-Mb
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Apr 2009 21:09:32 +0200
Received: by rv-out-0708.google.com with SMTP id k29so1175233rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Apr 2009 12:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=8OBXtb2li68LkqBkRfl8N7EjeZu95TD5G2wwO8MXJ48=;
	b=lSnorqq9l7ZDbulGVYAKVJ5zDwyk10rEjdx3hKDbM1TwhxGfEhY/1XsjQj5IClBpps
	spJMCiCmxoJoc9zDSZ/vYeT7luE7mkA075EPpBX8lTwUoTGO/NchMfRu/SfQCaMhuwiP
	DEelOgGJf4udRuBnBu7AO/f5hTqfI/iIanv5w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=JAgWenoLAD4THtHc9rxlRc7wZapxTf2exwUGlCY4OQ0U3ekCC2GYbpqkLSBNVug+ky
	lfAUomoDAkqYqbXVXKVEpjiyMw/G8qLO0qQiGGivdiXjXU5zxuZdE81cJT711NIsPYLZ
	yWQW1jhg6EzzSUy1wg5pCiC55pr+5Xm2TYNw0=
Received: by 10.141.13.13 with SMTP id q13mr678859rvi.163.1238785616381;
	Fri, 03 Apr 2009 12:06:56 -0700 (PDT)
Received: from gmail.com (adsl-71-146-4-184.dsl.pltn13.sbcglobal.net
	[71.146.4.184])
	by mx.google.com with ESMTPS id g14sm7808613rvb.9.2009.04.03.12.06.54
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 03 Apr 2009 12:06:55 -0700 (PDT)
Date: Fri, 3 Apr 2009 12:06:50 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090403190650.GA29161@gmail.com>
References: <1238753080-8005-1-git-send-email-khimov@altell.ru>
MIME-Version: 1.0
In-Reply-To: <1238753080-8005-1-git-send-email-khimov@altell.ru>
User-Agent: Mutt/1.5.17+20080114 (2008-01-14)
X-SA-Exim-Connect-IP: 209.85.198.242
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=AWL,BAYES_20,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
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
X-List-Received-Date: Fri, 03 Apr 2009 19:09:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (03/04/09 14:04), Roman I Khimov wrote:
> ---
>  conf/checksums.ini       |    4 ++++
>  recipes/ace/ace.inc      |   18 ++++++++++++++++++
>  recipes/ace/ace_5.6.8.bb |    1 +
>  3 files changed, 23 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/ace/ace.inc
>  create mode 100644 recipes/ace/ace_5.6.8.bb
> 
> diff --git a/conf/checksums.ini b/conf/checksums.ini
> index 15fff1d..18ea297 100644
> --- a/conf/checksums.ini
> +++ b/conf/checksums.ini
> @@ -58,6 +58,10 @@ sha256=7a960180e7873b1bdb522e76b0423b5c2c1b8efe1d30d7ca80c41eb97d822b2d
>  md5=24b0e5bbfe21ea9c5a5c589bcc79c0f2
>  sha256=ab877846c6caaff32efbf5be6fc5c63b7dec97a2e78c57c525da7705d2052bfc
>  
> +[ftp://download.dre.vanderbilt.edu/previous_versions/ACE-5.6.8.tar.bz2]
> +md5=81c1ff761c3431cd12c81337aa80d558
> +sha256=96b70582d931a7e83c3ca31b3bc7e23957391e16dee4ae6ddf938c9574d50b27
> +
>  [http://www.amd.com/files/connectivitysolutions/geode/geode_lx/AES_Linux_LX_02.01.0100.tar.gz]
>  md5=12cb241a9037fffe31ba7c68a48ed614
>  sha256=a6068b4aa0e2330eed6e4741bad3191dc9ca7d7326f7bfab578ac55e2b8b91a2
> diff --git a/recipes/ace/ace.inc b/recipes/ace/ace.inc
> new file mode 100644
> index 0000000..a83eb65
> --- /dev/null
> +++ b/recipes/ace/ace.inc
> @@ -0,0 +1,18 @@
> +DESCRIPTION = "C++ network programming framework"
> +SECTION = "net"
> +LICENSE = "BSD + others"

I think listing all licenses here would be better. Others is too vague.

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
> -- 
> 1.6.2.1
> 
> 
> -- 
> This message has been scanned for viruses and
> dangerous content by MailScanner, and is
> believed to be clean.
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


