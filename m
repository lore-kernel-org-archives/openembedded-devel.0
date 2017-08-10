Return-Path: <martin.jansa@gmail.com>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id 838CA781FA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Aug 2017 18:39:15 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id w45so806325uac.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Aug 2017 11:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=N+m2rGoM6ODVfyr0T3AKavSPB/cpSiHA+o4MKJS88hA=;
	b=gjqvGSWGbRnH/b7rHFQ6dr0hn8JMr8xtz7FuDdm5p31wcijDTUDEt9MCSu76OvxlfQ
	EhnsIBtgRVT2dC3kAhIZLXEHOXuHU46RogDmJn+TtetCoHtX5gsaecpIgu0ROjkdHUV+
	hdSe+QbDj106fOdu2W+fZo71HGwLXbdbYs/zexfFqRtVGUN8flVzwgPZ2OM5FS3NBNj2
	Uvr7tFoHTT4aq1KHFogaZsJg7Uzq5qHieuZoCgrMAqiaFKBS9KnJeA/Bxt4aVJ/DAYTi
	shSKqmNXmEyQ9uoL3k+DKiFns15i+hn3vKdNjjPmCb/PsAImlug6MWLF1n2o2JkvceYX
	T0zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=N+m2rGoM6ODVfyr0T3AKavSPB/cpSiHA+o4MKJS88hA=;
	b=arAQthUOMLdfBMEUfjy+Gcq/y2I4h76aSXXTb2KitUoH9WL/EkF6+3aBOS7sEOYDu6
	rfxsyDRhPUSNQpybdYbgB2sfQCO3t4yDMjdtaNBmCyIgcSCd6cHqJQaiVq3/cFIsHFjJ
	I8YZ4cMz9OBIVwMWVGKFA6Y5dRw4JlDapE5GSUJ+ykX5GT6h20PgJppTMo6eGAHgfWrY
	p/2Pn8embyldIUfk3wm1xBOCvllXWI2VPJBIr2kAqey5sYqhbAJ2GvWhmsz6ha1fcRNE
	L9g29sKV8PejsUz3JECThCDXHC8zDpBKYb3bfWmd9kw9IB1iKMQAtUhDpCiQ+tOt1ZRq
	WHcA==
X-Gm-Message-State: AHYfb5hH9UYI7iLSvcnibgk7WF6qjkAXFyTlJdY/8DokRM5tp3YPXhED
	jrxJq9u8J2RNMvroOwMveavmh88HdQ==
X-Received: by 10.176.72.208 with SMTP id y16mr9125604uac.103.1502390356662;
	Thu, 10 Aug 2017 11:39:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.122.88 with HTTP; Thu, 10 Aug 2017 11:39:16 -0700 (PDT)
In-Reply-To: <20170726053732.3582-1-jackie.huang@windriver.com>
References: <20170726053732.3582-1-jackie.huang@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 10 Aug 2017 20:39:16 +0200
Message-ID: <CA+chaQdWE2tGVU+NgwKGh0C8X4FViQRHjm0vtXrMEYgF8fs+Xw@mail.gmail.com>
To: JackieHuang <jackie.huang@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] logcheck: update to 1.3.18
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
X-List-Received-Date: Thu, 10 Aug 2017 18:39:15 -0000
Content-Type: text/plain; charset="UTF-8"

This adds runtime dependency on mime-construct which is in meta-perl and
meta-oe cannot depend on meta-perl.

Does it work in runtime without mime-construct?

Either move mime-construct to RRECOMMEND (if it can work in runtime without
it) or move logcheck to meta-perl.

On Wed, Jul 26, 2017 at 7:37 AM, <jackie.huang@windriver.com> wrote:

> From: Jackie Huang <jackie.huang@windriver.com>
>
> Changes:
> - logcheck should not be run as root, so inherit useradd
>   and add proper user and group.
>
> - Add missing runtime dependencies according to the file
>   debian/control and simple test by running "logcheck -ot".
>
> - For syslog, debian directly depends on rsyslog, but logcheck
>   works with any syslog and we have busybox-syslog, sysklogd,
>   syslog-ng and rsyslog, so use VIRTUAL-RUNTIME_syslog for the
>   syslog dependency and set rsyslog as the default, which can be
>   easily overridden in distro conf file or local.conf.
>
> - Don't install /var/lock when populating rootfs. Do it
>   through volatile.
>
> - install header.txt for generated mails
>
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  .../recipes-extended/logcheck/files/99_logcheck    |  2 +
>  .../{logcheck_1.3.17.bb => logcheck_1.3.18.bb}     | 50
> +++++++++++++++++++---
>  2 files changed, 47 insertions(+), 5 deletions(-)
>  create mode 100644 meta-oe/recipes-extended/logcheck/files/99_logcheck
>  rename meta-oe/recipes-extended/logcheck/{logcheck_1.3.17.bb =>
> logcheck_1.3.18.bb} (46%)
>
> diff --git a/meta-oe/recipes-extended/logcheck/files/99_logcheck
> b/meta-oe/recipes-extended/logcheck/files/99_logcheck
> new file mode 100644
> index 000000000..4de33aca3
> --- /dev/null
> +++ b/meta-oe/recipes-extended/logcheck/files/99_logcheck
> @@ -0,0 +1,2 @@
> +# <type> <owner> <group> <mode> <path> <linksource>
> +d logcheck logcheck 0755 /var/lock/logcheck none
> diff --git a/meta-oe/recipes-extended/logcheck/logcheck_1.3.17.bb
> b/meta-oe/recipes-extended/logcheck/logcheck_1.3.18.bb
> similarity index 46%
> rename from meta-oe/recipes-extended/logcheck/logcheck_1.3.17.bb
> rename to meta-oe/recipes-extended/logcheck/logcheck_1.3.18.bb
> index ba4c2ab9a..24c19b72a 100644
> --- a/meta-oe/recipes-extended/logcheck/logcheck_1.3.17.bb
> +++ b/meta-oe/recipes-extended/logcheck/logcheck_1.3.18.bb
> @@ -10,11 +10,20 @@ SECTION = "Applications/System"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=c93c0550bd3173f4504b2cbd8991e50b"
>
> -SRC_URI = "git://git.debian.org/git/logcheck/logcheck.git"
> -SRCREV = "2429e67ad875fee8a0234c64d504277b038c89cd"
> +SRC_URI = "git://git.debian.org/git/logcheck/logcheck.git \
> +           file://99_logcheck \
> +"
> +SRCREV = "0a5865d80fa34c55387a1917a3e6f885bcff7f1d"
>
>  S = "${WORKDIR}/git"
>
> +inherit useradd
> +
> +USERADD_PACKAGES = "${PN}"
> +USERADD_PARAM_${PN} = "-m -g ${BPN} -G adm -r -d
> ${localstatedir}/lib/${BPN} \
> +                       -s /bin/false -c 'logcheck account' ${BPN}"
> +GROUPADD_PARAM_${PN} = "-r ${BPN}"
> +
>  do_install() {
>      # Fix QA Issue
>      sed -i '/install -d $(DESTDIR)\/var\/lock\/logcheck/s/^/#/' Makefile
> @@ -25,14 +34,45 @@ do_install() {
>      install -m 644 docs/logcheck-test.1 ${D}${mandir}/man1/
>      install -m 644 docs/logtail.8 ${D}${mandir}/man8/
>      install -m 644 docs/logtail2.8 ${D}${mandir}/man8/
> -    sed -i "s/syslog/messages/" etc/logcheck.logfiles
> -    sed -i "s/auth\.log/secure/" etc/logcheck.logfiles
> +
>      install -m 755 -d ${D}${sysconfdir}/cron.d
>      install -m 644 debian/logcheck.cron.d ${D}${sysconfdir}/cron.d/
> logcheck
>      install -m 755 -d ${D}/var/lib/logcheck
> +
>      oe_runmake install DESTDIR=${D}
> +
> +    # install header.txt for generated mails
> +    install -m 0644 ${S}/debian/header.txt ${D}${sysconfdir}/${BPN}
> +
> +    chown -R ${BPN}:${BPN} ${D}${localstatedir}/lib/${BPN}
> +    chown -R root:${BPN} ${D}${sysconfdir}/${BPN}
> +
> +    # Don't install /var/lock when populating rootfs. Do it through
> volatile
> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true',
> 'false', d)}; then
> +        install -d ${D}${sysconfdir}/default/volatiles
> +        install -m 0644 ${WORKDIR}/99_logcheck ${D}${sysconfdir}/default/
> volatiles
> +    fi
> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true',
> 'false', d)}; then
> +        install -d ${D}${sysconfdir}/tmpfiles.d
> +        echo "d /var/lock/logcheck 0755 logcheck logcheck -" \
> +            > ${D}${sysconfdir}/tmpfiles.d/logcheck.conf
> +    fi
>  }
>
> -RDEPENDS_${PN} = "perl"
> +VIRTUAL-RUNTIME_syslog ??= "rsyslog"
> +
> +RDEPENDS_${PN} = "\
> +    bash \
> +    cronie \
> +    debianutils-run-parts \
> +    grep \
> +    lockfile-progs \
> +    mime-construct \
> +    perl \
> +    perl-module-file-basename \
> +    perl-module-getopt-std \
> +    perl-module-file-glob \
> +    ${VIRTUAL-RUNTIME_syslog} \
> +"
>
>  FILES_${PN} += "${datadir}/logtail"
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

