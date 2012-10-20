Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TPXlQ-0000bC-2Q
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Oct 2012 14:02:48 +0200
Received: by mail-pb0-f47.google.com with SMTP id ro12so895575pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Oct 2012 04:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=wGWIck6RoxHDNjube6gXO4m7Imq/b4z3OVAySaSKRVo=;
	b=Dy4xDWAisL0c0/FLNq7xNLh2ZcYm07tM/UUMg/symsJvs4NtaogvhbzuEPAd1LsW07
	B6pbP2VgL2bh7/3AWSA3wptQmS0jv/xt30Z0za3aTzdtd2n0GzmicrnkffqcavTnZotq
	30whga0lw97S9CAFTYwzH7/uW35uR3O/QD0Y0Ur3z9cCBR3CEtcnOkLWpmsrUkmWYrXf
	pIsJa+lJ/1t6jhT08oqX9NcnYX86703ZNQ/cMfhDlHHsmMmJPg3fVwTLRuz5rAKd24qb
	eWzpYBhk9aVirQCTvzl5s6COIpZfb6C1pzJk2BoRnkbXQnrGbqTBKr4kpobSq0fckwS5
	U+ew==
MIME-Version: 1.0
Received: by 10.68.218.226 with SMTP id pj2mr15019987pbc.33.1350733765432;
	Sat, 20 Oct 2012 04:49:25 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.40.201 with HTTP; Sat, 20 Oct 2012 04:49:25 -0700 (PDT)
In-Reply-To: <1350679091-5909-4-git-send-email-morgan.little@windriver.com>
References: <1350679091-5909-1-git-send-email-morgan.little@windriver.com>
	<1350679091-5909-4-git-send-email-morgan.little@windriver.com>
Date: Sat, 20 Oct 2012 08:49:25 -0300
X-Google-Sender-Auth: kKugyCoqcQglfuXKHurt3uzIXVM
Message-ID: <CAP9ODKo9a7mX2cY9AJxBuBpN+E=Ofc8haLpT_0cr_8b3YRsq1g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][meta-networking][PATCH 3/3] ntp: Clean up recipes
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
X-List-Received-Date: Sat, 20 Oct 2012 12:02:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Oct 19, 2012 at 5:38 PM, Morgan Little
<morgan.little@windriver.com> wrote:
> +++ b/meta-networking/recipes-support/ntp/ntp-ssl_4.2.6p5.bb
> @@ -1,11 +1,12 @@
> -require ntp_${PV}.bb
> +require ntp.inc
>  DEPENDS = "openssl"
>
> -S = "${WORKDIR}/ntp-${PV}"
> +PR = "r0"

As you are using an .inc file, please use INC_PR.

> -EXTRA_OECONF = "--with-openssl-libdir=${STAGING_LIBDIR} \
> -               --with-openssl-incdir=${STAGING_INCDIR}/openssl"
> +S = "${WORKDIR}/ntp-${PV}"
>
> +EXTRA_OECONF += "--with-openssl-libdir=${STAGING_LIBDIR} \
> +                --with-openssl-incdir=${STAGING_INCDIR}/openssl \
> +                --with-crypto"
>
> -SRC_URI[md5sum] = "00df80a84ec9528fcfb09498075525bc"
> -SRC_URI[sha256sum] = "d6ab8371f9d31e594eb6922823d5ccd03dcc4e9d84b0e23ea25ac1405432f91c"
> +FILES_${PN} += "${bindir}/sntp ${bindir}/ntp-keygen"
> diff --git a/meta-networking/recipes-support/ntp/ntp.inc b/meta-networking/recipes-support/ntp/ntp.inc
> index 1d740f0..20b9060 100644
> --- a/meta-networking/recipes-support/ntp/ntp.inc
> +++ b/meta-networking/recipes-support/ntp/ntp.inc
> @@ -8,14 +8,17 @@ LICENSE = "ntp"
>  LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=fea4b50c33b18c2194b4b1c9ca512670"
>  RSUGGESTS_${PN} = "iana-etc"
>
> -SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/${P}.tar.gz \
> -       file://ipv6only-workaround.patch \
> +SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.gz \
> +       file://tickadj.c.patch \
> +       file://ntp-4.2.4_p6-nano.patch \
>         file://ntpd \
>         file://ntp.conf \
>         file://ntpdate \
> -       file://ntpd.service \
>  "

Use INC_PR.

> +SRC_URI[md5sum] = "00df80a84ec9528fcfb09498075525bc"
> +SRC_URI[sha256sum] = "d6ab8371f9d31e594eb6922823d5ccd03dcc4e9d84b0e23ea25ac1405432f91c"
> +
>  inherit autotools update-rc.d
>
>  INITSCRIPT_NAME = "ntpd"
> @@ -24,12 +27,46 @@ INITSCRIPT_PARAMS = "defaults"
>
>  # The ac_cv_header_readline_history is to stop ntpdc depending on either
>  # readline or curses
> -EXTRA_OECONF = "--without-openssl --without-crypto ac_cv_header_readline_history_h=no"
> +EXTRA_OECONF += " --with-net-snmp-config=no --without-ntpsnmpd ac_cv_header_readline_history_h=no"
>  CFLAGS_append = " -DPTYS_ARE_GETPT -DPTYS_ARE_SEARCHED"
>
> -PACKAGES += "ntpdate ${PN}-bin ${PN}-tickadj ${PN}-utils"
> +do_configure(){
> +       oe_runconf
> +}
> +
> +do_install_append() {
> +       install -d ${D}/${sysconfdir}/init.d
> +       install -m 644 ${WORKDIR}/ntp.conf ${D}/${sysconfdir}
> +       install -m 755 ${WORKDIR}/ntpd ${D}/${sysconfdir}/init.d
> +       install -d ${D}/${sysconfdir}/network/if-up.d
> +       install -m 755 ${WORKDIR}/ntpdate ${D}/${sysconfdir}/network/if-up.d
> +}
> +
> +FILES_${PN}-bin = "${bindir}/ntp-wait ${bindir}/ntpdc ${bindir}/ntpq ${bindir}/ntptime ${bindir}/ntptrace"
> +FILES_${PN} = "${bindir}/ntpd ${sysconfdir}/ntp.conf ${sysconfdir}/init.d/ntpd ${sbindir} ${libdir}"
> +FILES_${PN}-tickadj = "${bindir}/tickadj"
> +FILES_${PN}-utils = "${bindir}/*"
> +FILES_${PN}-date += "${bindir}/ntpdate ${sysconfdir}/network/if-up.d/ntpdate"
> +
> +# ntp originally includes tickadj. It's split off for inclusion in small firmware images on platforms
> +# with wonky clocks (e.g. OpenSlug)
> +RDEPENDS_${PN} = "${PN}-tickadj"
> +
> +PACKAGES += "${PN}-date ${PN}-bin ${PN}-tickadj ${PN}-utils"
>  # NOTE: you don't need ntpdate, use "ntpd -q -g -x"
>  # or the ntpdate systemd service
>
>  # This should use rc.update
>  FILES_ntpdate = "${bindir}/ntpdate ${sysconfdir}/init.d/ntpdate"
> +
> +pkg_postinst_ntpdate() {
> +if test "x$D" != "x"; then
> +        exit 1
> +else
> +        if ! grep -q -s ntpdate /var/spool/cron/root; then
> +                echo "adding crontab"
> +                test -d /var/spool/cron || mkdir -p /var/spool/cron
> +                echo "30 * * * *    /usr/bin/ntpdate -b -s -u pool.ntp.org" >> /var/spool/cron/root
> +        fi
> +fi
> +}
> diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb b/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb
> index c542873..9c677c3 100644
> --- a/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb
> +++ b/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb
> @@ -2,46 +2,5 @@ require ntp.inc
>
>  PR = "r0"

INC_PR please.

If this didn't use an .inc file, avoid putting PR for r0.

> -SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.gz \
> -        file://tickadj.c.patch \
> -        file://ntp-4.2.4_p6-nano.patch \
> -        file://ntpd \
> -        file://ntp.conf \
> -        file://ntpdate \
> -"
> -
> -SRC_URI[md5sum] = "00df80a84ec9528fcfb09498075525bc"
> -SRC_URI[sha256sum] = "d6ab8371f9d31e594eb6922823d5ccd03dcc4e9d84b0e23ea25ac1405432f91c"
> -
> -EXTRA_OECONF += " --with-net-snmp-config=no --without-ntpsnmpd"
> -
> -do_install_append() {
> -       install -d ${D}/${sysconfdir}/init.d
> -       install -m 644 ${WORKDIR}/ntp.conf ${D}/${sysconfdir}
> -       install -m 755 ${WORKDIR}/ntpd ${D}/${sysconfdir}/init.d
> -       install -d ${D}/${sysconfdir}/network/if-up.d
> -       install -m 755 ${WORKDIR}/ntpdate ${D}/${sysconfdir}/network/if-up.d
> -}
> -
> -FILES_${PN}-bin = "${bindir}/ntp-wait ${bindir}/ntpdc ${bindir}/ntpq ${bindir}/ntptime ${bindir}/ntptrace"
> -FILES_${PN} = "${bindir}/ntpd ${sysconfdir}/ntp.conf ${sysconfdir}/init.d/ntpd"
> -FILES_${PN}-tickadj = "${bindir}/tickadj"
> -FILES_ntp-utils = "${bindir}/*"
> -FILES_ntpdate = "${bindir}/ntpdate ${sysconfdir}/network/if-up.d/ntpdate"
> -
> -# ntp originally includes tickadj. It's split off for inclusion in small firmware images on platforms
> -# with wonky clocks (e.g. OpenSlug)
> -RDEPENDS_${PN} = "${PN}-tickadj"
> -
> -pkg_postinst_ntpdate() {
> -if test "x$D" != "x"; then
> -        exit 1
> -else
> -        if ! grep -q -s ntpdate /var/spool/cron/root; then
> -                echo "adding crontab"
> -                test -d /var/spool/cron || mkdir -p /var/spool/cron
> -                echo "30 * * * *    /usr/bin/ntpdate -b -s -u pool.ntp.org" >> /var/spool/cron/root
> -        fi
> -fi
> -}
> +EXTRA_OECONF += "--without-openssl --without-crypto"
>
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


