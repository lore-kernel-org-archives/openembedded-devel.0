Received: from mail-gx0-f228.google.com ([209.85.217.228])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Nx4YG-0005EU-8w
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Mar 2010 22:30:13 +0200
Received: by gxk28 with SMTP id 28so274367gxk.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Mar 2010 13:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=cbL6gX0kVT74DhS+fSUdo5oUZZGIeWA1EFQNLpi1uA4=;
	b=DWj3KHRfgcqgHxAu0L+cevjcM6HRYV3xPoIqOqXOy8hnYj08gu48k1WETD1kaEjrDC
	j3AecddoawSZ84Hu7m4AK63hUlzMJnxrN/90reQShyTYbPvz27NhDI2SmBWtOOh3swrX
	Yo9zytI1BxtTamLd1xmAfeQh1dF9lmNZUMCNo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=i4pEyg7Zm5sKAwW9eaNFJoElFQ367mQX8Hb/JDmDj8mG5UGQq20YYHm3XmsQMKh+0R
	OW2qbwIQ35FojfERa0AOCWtmGWI9Q3FHDTmuISXXg3cMPifxqmabDiHn4lU/aKdL4KUu
	oBG+rGH3DMC8lXVV3w7LxntiJkHdP8uLqWuXs=
Received: by 10.101.28.7 with SMTP id f7mr249055anj.218.1270067212494;
	Wed, 31 Mar 2010 13:26:52 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 13sm4479298gxk.4.2010.03.31.13.26.51
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 31 Mar 2010 13:26:51 -0700 (PDT)
Date: Wed, 31 Mar 2010 13:27:41 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100331202741.GB21433@gmail.com>
References: <1270061972-5564-1-git-send-email-khimov@altell.ru>
	<1270061972-5564-2-git-send-email-khimov@altell.ru>
MIME-Version: 1.0
In-Reply-To: <1270061972-5564-2-git-send-email-khimov@altell.ru>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.217.228
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/3] postfix: convert to BBCLASSEXTEND and new staging for native
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
X-List-Received-Date: Wed, 31 Mar 2010 20:30:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (31/03/10 22:59), Roman I Khimov wrote:
> Signed-off-by: Roman I Khimov <khimov@altell.ru>
> ---
>  recipes/postfix/postfix-native_2.0.20.bb |   10 ----------
>  recipes/postfix/postfix-native_2.2.12.bb |   10 ----------
>  recipes/postfix/postfix.inc              |   25 ++++++++++++++++++++++---
>  3 files changed, 22 insertions(+), 23 deletions(-)
>  delete mode 100644 recipes/postfix/postfix-native_2.0.20.bb
>  delete mode 100644 recipes/postfix/postfix-native_2.2.12.bb
> 
> diff --git a/recipes/postfix/postfix-native_2.0.20.bb b/recipes/postfix/postfix-native_2.0.20.bb
> deleted file mode 100644
> index 66ff65d..0000000
> --- a/recipes/postfix/postfix-native_2.0.20.bb
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -require postfix_${PV}.bb
> -
> -inherit native
> -FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/postfix-${PV}"
> -DEPENDS = "virtual/db-native libpcre-native"
> -export DIRS = "src/util src/global src/postconf"
> -
> -do_stage () {
> -	install -m 0755 src/postconf/postconf ${STAGING_BINDIR}/
> -}
> diff --git a/recipes/postfix/postfix-native_2.2.12.bb b/recipes/postfix/postfix-native_2.2.12.bb
> deleted file mode 100644
> index 66ff65d..0000000
> --- a/recipes/postfix/postfix-native_2.2.12.bb
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -require postfix_${PV}.bb
> -
> -inherit native
> -FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/postfix-${PV}"
> -DEPENDS = "virtual/db-native libpcre-native"
> -export DIRS = "src/util src/global src/postconf"
> -
> -do_stage () {
> -	install -m 0755 src/postconf/postconf ${STAGING_BINDIR}/
> -}
> diff --git a/recipes/postfix/postfix.inc b/recipes/postfix/postfix.inc
> index 6a5f9bb..5b18cef 100644
> --- a/recipes/postfix/postfix.inc
> +++ b/recipes/postfix/postfix.inc
> @@ -1,5 +1,6 @@
>  SECTION = "console/network"
>  DEPENDS = "virtual/db libpcre postfix-native"
> +DEPENDS_virtclass-native = "virtual/db-native libpcre-native"

Is this really needed. I thought BBCLASSEXTEND should have converted it for
you and if you wanted to get rid of postfix-native dependency then why is
it that native wont need it and target recipe will.

>  LICENSE = "IPL"
>  
>  INC_PR = "r13"
> @@ -15,6 +16,8 @@ SRC_URI = "ftp://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${PV
>  
>  S = "${WORKDIR}/postfix-${PV}"
>  
> +BBCLASSEXTEND = "native"
> +
>  inherit update-rc.d
>  
>  INITSCRIPT_NAME = "postfix"
> @@ -31,7 +34,7 @@ export SYSLIBS = "-lpcre -ldb ${LIBBDB_EXTRA} -lnsl -lresolv ${LDFLAGS}"
>  export EXPORT = "AUXLIBS='-lpcre' CCARGS='-DHAS_PCRE ${CFLAGS}' OPT='' DEBUG='-g'"
>  export CC_append = " -DHAS_PCRE ${CFLAGS}"
>  export EXTRA_OEMAKE = "-e"
> -export POSTCONF = "${STAGING_BINDIR_NATIVE}/postconf"
> +export POSTCONF = "${STAGING_SBINDIR_NATIVE}/postconf"
>  
>  do_compile () {
>  	unset CFLAGS CPPFLAGS CXXFLAGS
> @@ -39,8 +42,23 @@ do_compile () {
>  	oe_runmake
>  }
>  
> +do_install_prepend_virtclass-native() {
> +	export POSTCONF="bin/postconf"
> +}
> +
>  do_install () {
> -	sh ./postfix-install 'install_root=${D}' -non-interactive
> +	sh ./postfix-install 'install_root=${D}' \
> +		'config_directory=${sysconfdir}/postfix' \
> +		'daemon_directory=${libexecdir}/postfix' \
> +		'command_directory=${sbindir}' \
> +		'queue_directory=${localstatedir}/spool/postfix' \
> +		'sendmail_path=${sbindir}/sendmail.postfix' \
> +		'newaliases_path=${bindir}/newaliases' \
> +		'mailq_path=${bindir}/mailq' \
> +		'manpage_directory=${mandir}' \
> +		'readme_directory=${datadir}/doc/postfix' \
> +		'data_directory=${localstatedir}/lib/postfix' \
> +		-non-interactive
>  	rm -rf ${D}${localstatedir}/spool/postfix
>          mv ${D}${sysconfdir}/postfix/main.cf ${D}${sysconfdir}/postfix/sample-main.cf
>  	install -d ${D}${localstatedir}/tmp
> @@ -50,9 +68,10 @@ do_install () {
>          install -m 644 ${WORKDIR}/volatiles ${D}${sysconfdir}/default/volatiles/01_postfix
>          install -m 755 ${WORKDIR}/postfix ${D}${sysconfdir}/init.d/postfix
>          install -m 644 ${WORKDIR}/internal_recipient ${D}${sysconfdir}/postfix/internal_recipient
> -	mv ${D}${sbindir}/sendmail ${D}${sbindir}/sendmail.${PN}
>  }
>  
> +NATIVE_INSTALL_WORKS = "1"
> +
>  pkg_postinst () {
>  	update-alternatives --install ${sbindir}/sendmail sendmail sendmail.${PN} 40
>          grep postfix /etc/group || addgroup postfix
> -- 
> 1.6.4.2
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


