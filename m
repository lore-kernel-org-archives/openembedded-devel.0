Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7398F78D51
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jul 2018 01:11:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6U1BhnQ019145
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 29 Jul 2018 18:11:44 -0700 (PDT)
Received: from [128.224.162.137] (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Sun, 29 Jul 2018 18:11:43 -0700
To: Khem Raj <raj.khem@gmail.com>, <openembedded-devel@lists.openembedded.org>
References: <20180729074241.17191-1-raj.khem@gmail.com>
From: Yi Zhao <yi.zhao@windriver.com>
Message-ID: <c568b0c1-416c-f712-7702-3c60f38ec955@windriver.com>
Date: Mon, 30 Jul 2018 09:11:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180729074241.17191-1-raj.khem@gmail.com>
X-Originating-IP: [128.224.162.137]
Subject: Re: [meta-networking][PATCH] samba: Update to 4.8.3
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
X-List-Received-Date: Mon, 30 Jul 2018 01:11:45 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



在 2018年07月29日 15:42, Khem Raj 写道:
> diff --git a/meta-networking/recipes-connectivity/samba/samba_4.7.8.bb b/meta-networking/recipes-connectivity/samba/samba_4.8.3.bb
> similarity index 94%
> rename from meta-networking/recipes-connectivity/samba/samba_4.7.8.bb
> rename to meta-networking/recipes-connectivity/samba/samba_4.8.3.bb
> index fc1a2e0fd0..5afb1d1345 100644
> --- a/meta-networking/recipes-connectivity/samba/samba_4.7.8.bb
> +++ b/meta-networking/recipes-connectivity/samba/samba_4.8.3.bb
> @@ -13,25 +13,27 @@ ${SAMBA_MIRROR}    http://www.mirrorservice.org/sites/ftp.samba.org \n \
>   "
>   
>   SRC_URI = "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
> +           file://smb.conf \
>              file://16-do-not-check-xsltproc-manpages.patch \
>              file://20-do-not-import-target-module-while-cross-compile.patch \
>              file://21-add-config-option-without-valgrind.patch \
> -           file://0001-packaging-Avoid-timeout-for-nmbd-if-started-offline-.patch \
> -           file://0006-avoid-using-colon-in-the-checking-msg.patch \
>              file://netdb_defines.patch \
>              file://glibc_only.patch \
>              file://iconv-4.7.0.patch \
>              file://dnsserver-4.7.0.patch \
>              file://smb_conf-4.7.0.patch \
>              file://volatiles.03_samba \
> -          "
> +           file://0001-ldb-Refuse-to-build-Samba-against-a-newer-minor-vers.patch \
> +           file://samba-pam.patch \
> +           file://samba-4.3.9-remove-getpwent_r.patch \
> +           "
>   SRC_URI_append_libc-musl = " \
>              file://samba-pam.patch \
>              file://samba-4.3.9-remove-getpwent_r.patch \
>             "
>   
> -SRC_URI[md5sum] = "16b70fda54cf84521ed976a0856430cc"
> -SRC_URI[sha256sum] = "ca6fca9d7e248bcaa55c54bdcc115eeed10660074da5c54a2b78dd3cccc604de"
> +SRC_URI[md5sum] = "67f271ed6b793c2acfe014b5b8f0cca8"
> +SRC_URI[sha256sum] = "e0569a8a605d5dfb49f1fdd11db796f4d36fe0351c4a7f21387ef253010b82ed"
>   
>   UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.7(\.\d+)+).tar.gz"
Please also update UPSTREAM_CHECK_REGEX to check 4.8 series: 
"samba\-(?P<pver>4\.8(\.\d+)+).tar.gz"

//Yi

>   
> @@ -39,7 +41,7 @@ inherit systemd waf-samba cpan-base perlnative update-rc.d
>   # remove default added RDEPENDS on perl
>   RDEPENDS_${PN}_remove = "perl"
>   
> -DEPENDS += "readline virtual/libiconv zlib popt libtalloc libtdb libtevent libldb libbsd libaio libpam"
> +DEPENDS += "readline virtual/libiconv zlib popt libtalloc libtdb libtevent libbsd libaio libpam"
>   
>   inherit distro_features_check
>   REQUIRED_DISTRO_FEATURES = "pam"
> @@ -104,7 +106,7 @@ SAMBA4_MODULES="${SAMBA4_IDMAP_MODULES},${SAMBA4_PDB_MODULES},${SAMBA4_AUTH_MODU
>   # .so files so there will not be a conflict.  This is not done consistantly, so be very careful
>   # when adding to this list.
>   #
> -SAMBA4_LIBS="heimdal,cmocka,NONE"
> +SAMBA4_LIBS="heimdal,cmocka,ldb,pyldb-util,NONE"
>   
>   EXTRA_OECONF += "--enable-fhs \
>                    --with-piddir=/run \
> @@ -135,7 +137,7 @@ do_install_append() {
>       done
>   
>       install -d ${D}${systemd_system_unitdir}
> -    install -m 0644 packaging/systemd/*.service ${D}${systemd_system_unitdir}
> +    install -m 0644 ${S}/bin/default/packaging/systemd/*.service ${D}${systemd_system_unitdir}/
>       sed -e 's,\(ExecReload=\).*\(/kill\),\1${base_bindir}\2,' \
>           -e 's,/etc/sysconfig/samba,${sysconfdir}/default/samba,' \
>           -i ${D}${systemd_system_unitdir}/*.service
> @@ -159,7 +161,7 @@ do_install_append() {
>   
>       install -d ${D}${sysconfdir}/samba
>       echo "127.0.0.1 localhost" > ${D}${sysconfdir}/samba/lmhosts
> -    install -m644 packaging/RHEL/setup/smb.conf ${D}${sysconfdir}/samba/smb.conf
> +    install -m644 ${WORKDIR}/smb.conf ${D}${sysconfdir}/samba/smb.conf
>       install -D -m 644 ${WORKDIR}/volatiles.03_samba ${D}${sysconfdir}/default/volatiles/03_samba
>   
>       install -d ${D}${sysconfdir}/default
> @@ -268,6 +270,7 @@ FILES_winbind = "${sbindir}/winbindd \
>                    ${libdir}/samba/idmap \
>                    ${libdir}/samba/nss_info \
>                    ${libdir}/winbind_krb5_locator.so \
> +                 ${libdir}/winbind-krb5-localauth.so \
>                    ${sysconfdir}/init.d/winbind \
>                    ${systemd_system_unitdir}/winbind.service"
>   


