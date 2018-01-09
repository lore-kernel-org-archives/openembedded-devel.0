Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8562378986;
	Tue,  9 Jan 2018 10:07:35 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id r78so19347920wme.5;
	Tue, 09 Jan 2018 02:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gqwPs2RbgZ9gmpoSXghSms9M15LVFXGgOpvGqTbv3nk=;
	b=B2BtYmzS7DtqHshOFTcXmeZS4B1D/F7Lu2IlDL0K9IQ+hYBrYHEb5ovPn6pX4uJYHi
	+7w77sozLulPBj0P6puHyQqXaXOWdEeJMgpUpn1WR1BaqPN9qiDb3n3qZwwljGzneEKU
	bbcn5egnS1w1eFJ8zV7zsli7fU12mrForzpEt5Mo69Rj21K//QIWM0fDopXp8yLtqOSJ
	Ec3nAiifdT3YLt9XDBbPY4Zcc9MO8HERepGt4nQy0COpcilatLS6V9a/TfM7o0G+mfg7
	vJw7BN89Ag1EHd8HSZ/Jh1YKn36q/6C8VHoHTVqMUqDmvThgxqvA6dWC4dU2sNPTTosC
	4XHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gqwPs2RbgZ9gmpoSXghSms9M15LVFXGgOpvGqTbv3nk=;
	b=Njj3GF3H1iy8P0YrkBX02IqoKS2ga/8632dhiv0oDJLcRyOLVheLOXHY2FRjJMXeyD
	KK4kh3S9rsCeOYuXg+K3YSvjmMsJN3LJGab6PC/KU/edSL2UXuqi7RpnBjnOLMphKVG4
	MpQ2+F4X3o07PCI2GGst7Nwe2GQhIIPReCqAi7xz+cKl2f/36Zbi4wLPZD7cyuxCrtRN
	flHZsH55pLreg7ArNtOtuh6I15YMz45/1gJ7jUv/VIjgYzdexVDyN0p2Ml0/0ivmRxrn
	fwj5i0zAXlUmlEG7b5JNMm6+cE5wTLrMvPYLrc7hpVk30x5yam/XiNqReWe+/7GGlNL0
	tYPQ==
X-Gm-Message-State: AKGB3mJZ5NsMZxUzE5nu5gONKnbz+KRrM/qEjnE3WupZyGLTBp6j8BwT
	QFOTdFVE2XAmQQj7ZV6Q6B4soxyXADtEGk80oXjDug==
X-Google-Smtp-Source: ACJfBoviGr/gk0TJjThFkO59uUMztifyWhUhADjbzwuIF79ek6eGnaXQTjm1GASSr74X0LHBWlO/ccAnVWPrwvo7+g8=
X-Received: by 10.28.17.149 with SMTP id 143mr11973406wmr.96.1515492455943;
	Tue, 09 Jan 2018 02:07:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.122.19 with HTTP; Tue, 9 Jan 2018 02:07:35 -0800 (PST)
In-Reply-To: <20180108194035.64962235651@git.openembedded.org>
References: <151544043453.12163.16714961581818540386@git.openembedded.org>
	<20180108194035.64962235651@git.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 9 Jan 2018 11:07:35 +0100
Message-ID: <CA+chaQd30Rqw0hjPKh5_57dKsdCZdeW2Cdj9Sf_Lyj6SPn0=1A@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Yi Zhao <yi.zhao@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [meta-openembedded] 05/35: postfix: fix send mail failure and eliminate warning
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Jan 2018 10:07:36 -0000
Content-Type: text/plain; charset="UTF-8"

It fails here now:

Updating
TOPDIR/BUILD/postfix/3.2.2-r0/image/usr/share/doc/postfix/XFORWARD_README...
newaliases: fatal: chdir /var/spool/postfix: No such file or directory
WARNING: exit code 75 from a shell command.
ERROR: Function failed: do_install (log file is located at
TOPDIR/BUILD/postfix/3.2.2-r0/temp/log.do_install.15748)

On Mon, Jan 8, 2018 at 8:40 PM, <git@git.openembedded.org> wrote:

> This is an automated email from the git hooks/post-receive script.
>
> joe_macdonald pushed a commit to branch master
> in repository meta-openembedded.
>
> commit e1221e7aa4c66dbd279f4460f3314679f720287f
> Author: Yi Zhao <yi.zhao@windriver.com>
> AuthorDate: Thu Oct 26 14:43:31 2017 -0700
>
>     postfix: fix send mail failure and eliminate warning
>
>     * Update main.cf for postfix 3.x to eliminate startup warning
>     * Set daemon_directory from ${libexecdir} to ${libexecdir}/postfix
>     * Using absolute path for newaliases and postmap to generate the
> correct
>       db file in pkg_postinst
>     * Remove duplicate SRC_URI lines in postfix_3.2.2.bb
>
>     (LOCAL REV: NOT UPSTREAM) -- will sent to oe-devel later
>
>     Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>
>     * Move use of newaliases and postmap on host to install phase
>       because absolute path might not exist at rootfs build time.
>
>     Signed-off-by: Joe Slater <jslater@windriver.com>
>     Signed-off-by: Armin Kuster <akuster808@gmail.com>
>     Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> ---
>  .../postfix/files/{main.cf_2.0 => main.cf}         |  3 +++
>  .../recipes-daemons/postfix/postfix.inc            | 28
> ++++++++++++----------
>  .../recipes-daemons/postfix/postfix_3.2.2.bb       | 17 ++++---------
>  3 files changed, 22 insertions(+), 26 deletions(-)
>
> diff --git a/meta-networking/recipes-daemons/postfix/files/main.cf_2.0
> b/meta-networking/recipes-daemons/postfix/files/main.cf
> similarity index 98%
> rename from meta-networking/recipes-daemons/postfix/files/main.cf_2.0
> rename to meta-networking/recipes-daemons/postfix/files/main.cf
> index dc7feb5..2371ace 100644
> --- a/meta-networking/recipes-daemons/postfix/files/main.cf_2.0
> +++ b/meta-networking/recipes-daemons/postfix/files/main.cf
> @@ -1,3 +1,6 @@
> +compatibility_level = 2
> +smtputf8_enable = no
> +
>  # Configure your domain and accounts
>  #mydomain=sample.com
>  #FQDN from gethostname
> diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc
> b/meta-networking/recipes-daemons/postfix/postfix.inc
> index a588bd3..8dad45f 100644
> --- a/meta-networking/recipes-daemons/postfix/postfix.inc
> +++ b/meta-networking/recipes-daemons/postfix/postfix.inc
> @@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=
> 64375f37431336ea1b1b3005fe3fa354"
>  SRC_URI = "ftp://ftp.porcupine.org/mirrors/postfix-release/
> official/postfix-${PV}.tar.gz \
>      file://makedefs.patch \
>      file://install.patch \
> -    file://main.cf_2.0 \
> +    file://main.cf \
>      file://postfix \
>      file://internal_recipient \
>      file://postfix.service \
> @@ -135,7 +135,7 @@ SYSTEMD_SERVICE_${PN} = "postfix.service"
>  do_install () {
>      sh ./postfix-install 'install_root=${D}' \
>          'config_directory=${sysconfdir}/postfix' \
> -        'daemon_directory=${libexecdir}' \
> +        'daemon_directory=${libexecdir}/postfix' \
>          'command_directory=${sbindir}' \
>          'queue_directory=${localstatedir}/spool/postfix' \
>          'sendmail_path=${sbindir}/sendmail.postfix' \
> @@ -149,8 +149,8 @@ do_install () {
>      mv ${D}${sysconfdir}/postfix/main.cf ${D}${sysconfdir}/postfix/samp
> le-main.cf
>      install -m 755 ${S}/bin/smtp-sink ${D}/${sbindir}/
>      install -d ${D}${sysconfdir}/init.d
> -    install -m 644 ${WORKDIR}/main.cf_2.0 ${D}${sysconfdir}/postfix/main
> .cf
> -    sed -i 's#@LIBEXECDIR@#${libexecdir}#' ${D}${sysconfdir}/postfix/main
> .cf
> +    install -m 644 ${WORKDIR}/main.cf ${D}${sysconfdir}/postfix/main.cf
> +    sed -i 's#@LIBEXECDIR@#${libexecdir}/postfix#'
> ${D}${sysconfdir}/postfix/main.cf
>
>      install -m 755 ${WORKDIR}/check_hostname.sh ${D}${sbindir}/
>
> @@ -159,11 +159,11 @@ do_install () {
>
>      install -d ${D}${systemd_unitdir}/system
>      install -m 0644 ${WORKDIR}/postfix.service
> ${D}${systemd_unitdir}/system
> -    sed -i -e 's#@LIBEXECDIR@#${libexecdir}#g'
> ${D}${systemd_unitdir}/system/postfix.service
> +    sed -i -e 's#@LIBEXECDIR@#${libexecdir}/postfix#g'
> ${D}${systemd_unitdir}/system/postfix.service
>      sed -i -e 's#@LOCALSTATEDIR@#${localstatedir}#g'
> ${D}${systemd_unitdir}/system/postfix.service
>      sed -i -e 's#@SBINDIR@#${sbindir}#g' ${D}${systemd_unitdir}/system/
> postfix.service
>
> -    install -m 0755 ${WORKDIR}/aliasesdb ${D}${libexecdir}
> +    install -m 0755 ${WORKDIR}/aliasesdb ${D}${libexecdir}/postfix
>
>      install -m 770 -d ${D}${localstatedir}/spool/postfix
>      chown postfix:postfix ${D}${localstatedir}/spool/postfix
> @@ -217,6 +217,12 @@ do_install_append_class-native() {
>  do_install_append_class-target() {
>      # Remove references to buildmachine paths in target makedefs.out
>      sed -i 's:-fdebug-prefix-map[^ ]*::g; s:--sysroot=${STAGING_DIR_TARGET}::g'
> ${D}/etc/postfix/makedefs.out
> +    # Since we are building recipe postfix, newaliases and postmap come
> from our sysroot_native.
> +    touch ${D}/etc/aliases
> +    newaliases -C ${D}/etc/postfix/main.cf -oA${D}/etc/aliases
> +    touch ${D}/etc/postfix/virtual_alias
> +    postmap -c ${D}/etc/postfix ${D}/etc/postfix/virtual_alias
> +
>  }
>
>  NATIVE_INSTALL_WORKS = "1"
> @@ -240,13 +246,8 @@ pkg_postinst_${PN} () {
>          touch /etc/postfix/virtual_alias
>          postmap /etc/postfix/virtual_alias
>      else
> -        touch $D/etc/aliases
> -        newaliases -C $D/etc/postfix/main.cf -oA$D/etc/aliases
> -        touch $D/etc/postfix/virtual_alias
> -        postmap -c $D/etc/postfix $D/etc/postfix/virtual_alias
> -
>          if ${@'true' if 'linuxstdbase' in d.getVar('DISTROOVERRIDES',
> False) else 'false'}; then
> -            # /usr/lib/sendmial is required by LSB core test
> +            # /usr/lib/sendmail is required by LSB core test
>              [ ! -L $D/usr/lib/sendmail ] && ln -sf ${sbindir}/sendmail
> $D/usr/lib/
>          fi
>      fi
> @@ -255,4 +256,5 @@ pkg_postinst_${PN} () {
>  # Exclude .debug directories from the main package
>  FILES_${PN} = "${sysconfdir} ${localstatedir} ${bindir}/* ${sbindir}/* \
>                 ${libexecdir}/* ${systemd_unitdir}/*"
> -FILES_${PN}-dbg += "${libexecdir}/.debug"
> +CONFFILES_${PN} = "/etc/aliases /etc/postfix/virtual_alias*"
> +FILES_${PN}-dbg += "${libexecdir}/postfix/.debug"
> diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.2.2.bb
> b/meta-networking/recipes-daemons/postfix/postfix_3.2.2.bb
> index 439ede9..89af406 100644
> --- a/meta-networking/recipes-daemons/postfix/postfix_3.2.2.bb
> +++ b/meta-networking/recipes-daemons/postfix/postfix_3.2.2.bb
> @@ -1,18 +1,9 @@
>  require postfix.inc
>
> -SRC_URI = "ftp://ftp.porcupine.org/mirrors/postfix-release/
> official/postfix-${PV}.tar.gz \
> -           file://makedefs.patch \
> -           file://install.patch \
> -           file://main.cf_2.0 \
> -           file://postfix \
> -           file://internal_recipient \
> -           file://postfix.service \
> -           file://aliasesdb \
> -           file://check_hostname.sh \
> -           file://0001-Check-for-glibc-before-setting-CANT_USE_SEND_RECV_MS.patch
> \
> -           file://0001-makedefs-Use-native-compiler-to-build-makedefs.test.patch
> \
> -           file://postfix-install.patch \
> -           file://icu-config.patch \
> +SRC_URI += "file://0001-Check-for-glibc-before-setting-CANT_USE_SEND_RECV_MS.patch
> \
> +            file://0001-makedefs-Use-native-compiler-to-build-makedefs.test.patch
> \
> +            file://postfix-install.patch \
> +            file://icu-config.patch \
>             "
>  SRC_URI[md5sum] = "aea073a9b0bea5bdb590460a270a4aa0"
>  SRC_URI[sha256sum] = "d06849418d119d09366997b2b481bb
> 23f737629769b4e4a52da42fb3ad8b0576"
>
> --
> To stop receiving notification emails like this one, please contact
> the administrator of this repository.
> --
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>

