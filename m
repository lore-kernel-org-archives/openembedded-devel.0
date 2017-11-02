Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E9D1960119
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Nov 2017 07:54:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vA27sLfU010971
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 2 Nov 2017 00:54:22 -0700 (PDT)
Received: from [128.224.163.244] (128.224.163.244) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Thu, 2 Nov 2017 00:54:18 -0700
To: Joe Slater <jslater@windriver.com>,
	<openembedded-devel@lists.openembedded.org>
References: <20171026214331.174436-1-jslater@windriver.com>
From: Yi Zhao <yi.zhao@windriver.com>
Message-ID: <e90a2749-c231-b1aa-5c45-8cb298082a5f@windriver.com>
Date: Thu, 2 Nov 2017 15:52:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171026214331.174436-1-jslater@windriver.com>
X-Originating-IP: [128.224.163.244]
Subject: Re: [meta-networking][PATCH 1/1] postfix: fix send mail failure and eliminate warning
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
X-List-Received-Date: Thu, 02 Nov 2017 07:54:21 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Joe,

I got an error for do_install after apply this patch:

newaliases: fatal: chdir /var/spool/postfix: No such file or directory


//Yi

在 2017年10月27日 05:43, Joe Slater 写道:
> From: Yi Zhao <yi.zhao@windriver.com>
>
> * Update main.cf for postfix 3.x to eliminate startup warning
> * Set daemon_directory from ${libexecdir} to ${libexecdir}/postfix
> * Using absolute path for newaliases and postmap to generate the correct
>    db file in pkg_postinst
> * Remove duplicate SRC_URI lines in postfix_3.2.2.bb
>
> (LOCAL REV: NOT UPSTREAM) -- will sent to oe-devel later
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>
> * Move use of newaliases and postmap on host to install phase
>    because absolute path might not exist at rootfs build time.
>
> Signed-off-by: Joe Slater <jslater@windriver.com>
> ---
>   .../postfix/files/{main.cf_2.0 => main.cf}         |  3 +++
>   .../recipes-daemons/postfix/postfix.inc            | 28 ++++++++++++----------
>   .../recipes-daemons/postfix/postfix_3.2.2.bb       | 17 ++++---------
>   3 files changed, 22 insertions(+), 26 deletions(-)
>   rename meta-networking/recipes-daemons/postfix/files/{main.cf_2.0 => main.cf} (98%)
>
> diff --git a/meta-networking/recipes-daemons/postfix/files/main.cf_2.0 b/meta-networking/recipes-daemons/postfix/files/main.cf
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
>   # Configure your domain and accounts
>   #mydomain=sample.com
>   #FQDN from gethostname
> diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-networking/recipes-daemons/postfix/postfix.inc
> index a588bd3..8dad45f 100644
> --- a/meta-networking/recipes-daemons/postfix/postfix.inc
> +++ b/meta-networking/recipes-daemons/postfix/postfix.inc
> @@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=64375f37431336ea1b1b3005fe3fa354"
>   SRC_URI = "ftp://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${PV}.tar.gz \
>       file://makedefs.patch \
>       file://install.patch \
> -    file://main.cf_2.0 \
> +    file://main.cf \
>       file://postfix \
>       file://internal_recipient \
>       file://postfix.service \
> @@ -135,7 +135,7 @@ SYSTEMD_SERVICE_${PN} = "postfix.service"
>   do_install () {
>       sh ./postfix-install 'install_root=${D}' \
>           'config_directory=${sysconfdir}/postfix' \
> -        'daemon_directory=${libexecdir}' \
> +        'daemon_directory=${libexecdir}/postfix' \
>           'command_directory=${sbindir}' \
>           'queue_directory=${localstatedir}/spool/postfix' \
>           'sendmail_path=${sbindir}/sendmail.postfix' \
> @@ -149,8 +149,8 @@ do_install () {
>       mv ${D}${sysconfdir}/postfix/main.cf ${D}${sysconfdir}/postfix/sample-main.cf
>       install -m 755 ${S}/bin/smtp-sink ${D}/${sbindir}/
>       install -d ${D}${sysconfdir}/init.d
> -    install -m 644 ${WORKDIR}/main.cf_2.0 ${D}${sysconfdir}/postfix/main.cf
> -    sed -i 's#@LIBEXECDIR@#${libexecdir}#' ${D}${sysconfdir}/postfix/main.cf
> +    install -m 644 ${WORKDIR}/main.cf ${D}${sysconfdir}/postfix/main.cf
> +    sed -i 's#@LIBEXECDIR@#${libexecdir}/postfix#' ${D}${sysconfdir}/postfix/main.cf
>   
>       install -m 755 ${WORKDIR}/check_hostname.sh ${D}${sbindir}/
>   
> @@ -159,11 +159,11 @@ do_install () {
>   
>       install -d ${D}${systemd_unitdir}/system
>       install -m 0644 ${WORKDIR}/postfix.service ${D}${systemd_unitdir}/system
> -    sed -i -e 's#@LIBEXECDIR@#${libexecdir}#g' ${D}${systemd_unitdir}/system/postfix.service
> +    sed -i -e 's#@LIBEXECDIR@#${libexecdir}/postfix#g' ${D}${systemd_unitdir}/system/postfix.service
>       sed -i -e 's#@LOCALSTATEDIR@#${localstatedir}#g' ${D}${systemd_unitdir}/system/postfix.service
>       sed -i -e 's#@SBINDIR@#${sbindir}#g' ${D}${systemd_unitdir}/system/postfix.service
>   
> -    install -m 0755 ${WORKDIR}/aliasesdb ${D}${libexecdir}
> +    install -m 0755 ${WORKDIR}/aliasesdb ${D}${libexecdir}/postfix
>   
>       install -m 770 -d ${D}${localstatedir}/spool/postfix
>       chown postfix:postfix ${D}${localstatedir}/spool/postfix
> @@ -217,6 +217,12 @@ do_install_append_class-native() {
>   do_install_append_class-target() {
>       # Remove references to buildmachine paths in target makedefs.out
>       sed -i 's:-fdebug-prefix-map[^ ]*::g; s:--sysroot=${STAGING_DIR_TARGET}::g' ${D}/etc/postfix/makedefs.out
> +    # Since we are building recipe postfix, newaliases and postmap come from our sysroot_native.
> +    touch ${D}/etc/aliases
> +    newaliases -C ${D}/etc/postfix/main.cf -oA${D}/etc/aliases
> +    touch ${D}/etc/postfix/virtual_alias
> +    postmap -c ${D}/etc/postfix ${D}/etc/postfix/virtual_alias
> +
>   }
>   
>   NATIVE_INSTALL_WORKS = "1"
> @@ -240,13 +246,8 @@ pkg_postinst_${PN} () {
>           touch /etc/postfix/virtual_alias
>           postmap /etc/postfix/virtual_alias
>       else
> -        touch $D/etc/aliases
> -        newaliases -C $D/etc/postfix/main.cf -oA$D/etc/aliases
> -        touch $D/etc/postfix/virtual_alias
> -        postmap -c $D/etc/postfix $D/etc/postfix/virtual_alias
> -
>           if ${@'true' if 'linuxstdbase' in d.getVar('DISTROOVERRIDES', False) else 'false'}; then
> -            # /usr/lib/sendmial is required by LSB core test
> +            # /usr/lib/sendmail is required by LSB core test
>               [ ! -L $D/usr/lib/sendmail ] && ln -sf ${sbindir}/sendmail $D/usr/lib/
>           fi
>       fi
> @@ -255,4 +256,5 @@ pkg_postinst_${PN} () {
>   # Exclude .debug directories from the main package
>   FILES_${PN} = "${sysconfdir} ${localstatedir} ${bindir}/* ${sbindir}/* \
>                  ${libexecdir}/* ${systemd_unitdir}/*"
> -FILES_${PN}-dbg += "${libexecdir}/.debug"
> +CONFFILES_${PN} = "/etc/aliases /etc/postfix/virtual_alias*"
> +FILES_${PN}-dbg += "${libexecdir}/postfix/.debug"
> diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.2.2.bb b/meta-networking/recipes-daemons/postfix/postfix_3.2.2.bb
> index 439ede9..89af406 100644
> --- a/meta-networking/recipes-daemons/postfix/postfix_3.2.2.bb
> +++ b/meta-networking/recipes-daemons/postfix/postfix_3.2.2.bb
> @@ -1,18 +1,9 @@
>   require postfix.inc
>   
> -SRC_URI = "ftp://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${PV}.tar.gz \
> -           file://makedefs.patch \
> -           file://install.patch \
> -           file://main.cf_2.0 \
> -           file://postfix \
> -           file://internal_recipient \
> -           file://postfix.service \
> -           file://aliasesdb \
> -           file://check_hostname.sh \
> -           file://0001-Check-for-glibc-before-setting-CANT_USE_SEND_RECV_MS.patch \
> -           file://0001-makedefs-Use-native-compiler-to-build-makedefs.test.patch \
> -           file://postfix-install.patch \
> -           file://icu-config.patch \
> +SRC_URI += "file://0001-Check-for-glibc-before-setting-CANT_USE_SEND_RECV_MS.patch \
> +            file://0001-makedefs-Use-native-compiler-to-build-makedefs.test.patch \
> +            file://postfix-install.patch \
> +            file://icu-config.patch \
>              "
>   SRC_URI[md5sum] = "aea073a9b0bea5bdb590460a270a4aa0"
>   SRC_URI[sha256sum] = "d06849418d119d09366997b2b481bb23f737629769b4e4a52da42fb3ad8b0576"


