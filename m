Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E747C3ABC9
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 06:45:12 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.8427.1746773098102856177
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 May 2025 23:44:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PxJG+uM4;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ad1d1f57a01so328575566b.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 May 2025 23:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746773096; x=1747377896; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3voJRkuOgXxmAXpCYhrrWbxJVOoAZokc0WSu3r/O1BI=;
        b=PxJG+uM4HaWxt3r5G0dreDK1nsNmuWMP5jsPQZLNx4esEcsE1bW9Lu31st7ta1sFSA
         PR+OJezTiEczqSSiC8zcCt1Vj5VyhKTeEKeV1mddbssI1GF4rpwfvHC5RQW+dDRB4fwS
         1vYxVp2sXA7QFhNsZo5jVJmc8RmUNP4aTvydcdsL8D7ZNLnHYmzOwiunSC92jxk4xTuS
         CZPRz4EjRxrcd0PBNnMHRbCdsIHMDoM3M70FymxlpwHVd9R53xqMmiHemLuAiX5wT1NP
         RxBsDOHGdsBuafvtapDptEGLgkEH+518hD66+rB7W3izauBjxqgGxxAwgO8g4jYT1HQd
         Vh+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746773096; x=1747377896;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3voJRkuOgXxmAXpCYhrrWbxJVOoAZokc0WSu3r/O1BI=;
        b=PeAn1FMc4vL20q9SBK8dkAJcTezsdoxKiHaHVsqMZIV4XEu3Wzgr9ku+yI2HMh5Q4Y
         q91TXuvuxkJTKegu+cnXyBCssF/NmHEYKQzDPlWIhTEkD6W5xhVkAngBYTTa282iKclq
         K2y6r22O4p4IKtTl1qu5J0i1Vkhd2QJ6LGdvdMK6CIqnwkSv8kV5R+MeXz2AJX5h5w6a
         n4HL4LqTYb+qucAaMAEwOEVy2u5ZV5tuRWwoNQT/V93j+VFFoLBth4vqvXnUH/qDWUgv
         M5xjwyV0XFzCgXhmBv1j0gvD3J0438TcEfaeuf2VyhZttgnZ6nGWaAO7sbiJDyGTL0WQ
         tEtA==
X-Forwarded-Encrypted: i=1; AJvYcCXpV6MYryRG/5PX4SNtm9JJ0w7CrBau6NHSufut/0eFIe5ZbmqYLCqtxok2Gzy8ddhXanlPmgVpNpghVNwIQDsQgAs=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx2LPy3buk0jFnMkx5gpGbR2ocFnKyBZ2j6ZfDoCvlPtbBxEdUi
	4vY/HOydsOIzEEo1okPTnMC9YTlKgsFupcq/NO0NOJE+poDHzX72
X-Gm-Gg: ASbGncswWDBcT4P9bUFinnNx0+oZsVIHaS3wQCBfxRw3A/UJuOwB1+MLi1NXYON+gn1
	w+Dy303c4kbCC58LRIDE+0EV1vMLWDHL+ulsKZV45l4wACPXlp4dhrKhlQN6HK1VmpbgxMLytxh
	/swTK5qVP6gf8tFytG2pkEreo9tg/ZVx+lW9I2DA4xkT3RwQbn4joCZ/3PDmpYM7zTrrGIGZWdM
	/QfhlZNFWinv/WePWJODtiaLPeOuWXUbiwGXV0qD+p1MKJU32dUHmJ7Nyt1v7v23RQnHQN3Zy2w
	i59U62w66mWeM6jggkHV7imZ8StSMY7OeF205B0+tWXeypvy
X-Google-Smtp-Source: AGHT+IHHpLs80qzdCA9yDhJfw0DOcOhvDcfknHru5cgEYq+zfEjOfumpE4uPgIez4uadPFvT0tyyzg==
X-Received: by 2002:a17:907:7d9f:b0:ac3:aae:40c6 with SMTP id a640c23a62f3a-ad218e91c6amr187305366b.8.1746773096134;
        Thu, 08 May 2025 23:44:56 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad219348762sm105283866b.69.2025.05.08.23.44.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 23:44:55 -0700 (PDT)
Message-ID: <812a148d-c138-4f92-8b8b-967bb62f8f3c@gmail.com>
Date: Fri, 9 May 2025 08:44:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-webserver][PATCH] cockpit: Upgrade to 337
To: raj.khem@gmail.com, openembedded-devel@lists.openembedded.org
References: <20250509060628.1082632-1-raj.khem@gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250509060628.1082632-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 May 2025 06:45:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117374

On 5/9/25 08:06, Khem Raj via lists.openembedded.org wrote:
> Get rid of remoeved configure options
>
> ERROR: QA Issue: cockpit: configure was passed unrecognised options: --disable-pcp --enable-old-bridge --with-cockpit-ws-instance-user --disable-ssh --disable-polkit --with-cockpit-ws-instance-group --with-cockpit-group --with-cockpit-user [unknown-configure-option]
I believe with this also the COCKPIT_WS_USER_GROUP variable became
orphan and could be removed as part of the cleanup
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../{cockpit_304.bb => cockpit_337.bb}        | 40 ++++++++++---------
>  1 file changed, 22 insertions(+), 18 deletions(-)
>  rename meta-webserver/recipes-webadmin/cockpit/{cockpit_304.bb => cockpit_337.bb} (82%)
>
> diff --git a/meta-webserver/recipes-webadmin/cockpit/cockpit_304.bb b/meta-webserver/recipes-webadmin/cockpit/cockpit_337.bb
> similarity index 82%
> rename from meta-webserver/recipes-webadmin/cockpit/cockpit_304.bb
> rename to meta-webserver/recipes-webadmin/cockpit/cockpit_337.bb
> index edd51bc671..29bb771cd2 100644
> --- a/meta-webserver/recipes-webadmin/cockpit/cockpit_304.bb
> +++ b/meta-webserver/recipes-webadmin/cockpit/cockpit_337.bb
> @@ -9,7 +9,7 @@ SRC_URI += " \
>      file://0001-Warn-not-error-if-xsltproc-is-not-found.patch \
>      file://cockpit.pam \
>      "
> -SRC_URI[sha256sum] = "a87d090c930e2058bb3e970ca7f2bafe678687966b5c0b8b42a802977e391ce9"
> +SRC_URI[sha256sum] = "df51ef5920fae69e1b435f657376aa93772c0c1720b954a3bac10ebba26bfedf"
>  
>  inherit gettext pkgconfig autotools systemd features_check
>  inherit ${@bb.utils.contains('PACKAGECONFIG', 'old-bridge', '', 'python3targetconfig', d)}
> @@ -28,11 +28,7 @@ COCKPIT_WS_USER_GROUP ?= "${COCKPIT_USER_GROUP}"
>  
>  EXTRA_AUTORECONF = "-I tools"
>  EXTRA_OECONF = " \
> -    --with-cockpit-user=${COCKPIT_USER_GROUP} \
> -    --with-cockpit-group=${COCKPIT_USER_GROUP} \
>      --with-admin-group=${COCKPIT_USER_GROUP} \
> -    --with-cockpit-ws-instance-user=${COCKPIT_WS_USER_GROUP} \
> -    --with-cockpit-ws-instance-group=${COCKPIT_WS_USER_GROUP} \
>      --disable-doc \
>      --with-systemdunitdir=${systemd_system_unitdir} \
>      --with-pamdir=${base_libdir}/security \
> @@ -40,14 +36,12 @@ EXTRA_OECONF = " \
>  
>  PACKAGECONFIG ??= " \
>      ${@bb.utils.filter('DISTRO_FEATURES', 'polkit', d)} \
> -    old-bridge \
>  "
>  
> -PACKAGECONFIG[pcp] = "--enable-pcp,--disable-pcp,pcp"
> -PACKAGECONFIG[dashboard] = "--enable-ssh,--disable-ssh,libssh"
> -PACKAGECONFIG[storaged] = ",,,udisks2"
> -PACKAGECONFIG[polkit] = "--enable-polkit,--disable-polkit,polkit"
> -PACKAGECONFIG[old-bridge] = "--enable-old-bridge"
> +PACKAGECONFIG[pcp] = ",,pcp"
> +PACKAGECONFIG[dashboard] = ",,libssh"
> +PACKAGECONFIG[storaged] = ",,udisks2"
> +PACKAGECONFIG[polkit] = ",,polkit"
>  
>  PACKAGES =+ " \
>      ${PN}-pcp \
> @@ -83,27 +77,28 @@ FILES:${PN}-systemd = "${datadir}/cockpit/systemd"
>  FILES:${PN}-users = "${datadir}/cockpit/users"
>  FILES:${PN}-kdump = " \
>      ${datadir}/cockpit/kdump \
> -    ${datadir}/metainfo/org.cockpit-project.cockpit-kdump.metainfo.xml \
> +    ${datadir}/metainfo/org.cockpit_project.cockpit_kdump.metainfo.xml \
>  "
>  FILES:${PN}-sosreport = " \
>      ${datadir}/cockpit/sosreport \
> -    ${datadir}/metainfo/org.cockpit-project.cockpit-sosreport.metainfo.xml \
> +    ${datadir}/metainfo/org.cockpit_project.cockpit_sosreport.metainfo.xml \
>      ${datadir}/pixmaps/cockpit-sosreport.png \
> +    ${datadir}/icons/hicolor/64x64/apps/cockpit-sosreport.png \
>  "
>  FILES:${PN}-storaged = " \
>      ${datadir}/cockpit/storaged \
> -    ${datadir}/metainfo/org.cockpit-project.cockpit-storaged.metainfo.xml \
> +    ${datadir}/metainfo/org.cockpit_project.cockpit_storaged.metainfo.xml \
>  "
>  
>  FILES:${PN}-networkmanager = " \
>      ${datadir}/cockpit/networkmanager \
> -    ${datadir}/metainfo/org.cockpit-project.cockpit-networkmanager.metainfo.xml \
> +    ${datadir}/metainfo/org.cockpit_project.cockpit_networkmanager.metainfo.xml \
>  "
>  RDEPENDS:${PN}-networkmanager = "networkmanager"
>  
>  FILES:${PN}-selinux = " \
>      ${datadir}/cockpit/selinux \
> -    ${datadir}/metainfo/org.cockpit-project.cockpit-selinux.metainfo.xml \
> +    ${datadir}/metainfo/org.cockpit_project.cockpit_selinux.metainfo.xml \
>  "
>  FILES:${PN}-playground = "${datadir}/cockpit/playground"
>  FILES:${PN}-dashboard = "${datadir}/cockpit/dashboard"
> @@ -143,6 +138,9 @@ FILES:${PN}-ws = " \
>      ${systemd_system_unitdir}/cockpit-wsinstance-https@.socket \
>      ${systemd_system_unitdir}/cockpit-wsinstance-https@.service \
>      ${systemd_system_unitdir}/system-cockpithttps.slice \
> +    ${systemd_system_unitdir}/cockpit-session-socket-user.service \
> +    ${systemd_system_unitdir}/cockpit-wsinstance-socket-user.service \
> +    ${systemd_system_unitdir}/cockpit-issue.service \
>      ${libdir}/tmpfiles.d/cockpit-tempfiles.conf \
>      ${sbindir}/remotectl \
>      ${base_libdir}/security/pam_ssh_add.so \
> @@ -169,7 +167,8 @@ FILES:${PN} += " \
>      ${datadir}/cockpit/ssh \
>      ${libexecdir}/cockpit-ssh \
>      ${datadir}/cockpit \
> -    ${datadir}/metainfo/cockpit.appdata.xml \
> +    ${datadir}/icons/hicolor/128x128/apps/cockpit.png \
> +    ${datadir}/metainfo/org.cockpit_project.cockpit.appdata.xml \
>      ${datadir}/pixmaps/cockpit.png \
>      ${nonarch_libdir}/tmpfiles.d \
>      ${nonarch_libdir}/firewalld \
> @@ -187,7 +186,12 @@ do_install:append() {
>      install -p -m 0644 ${UNPACKDIR}/cockpit.pam ${D}${sysconfdir}/pam.d/cockpit
>  
>      # provided by firewalld
> -    rm -rf ${D}${libdir}/firewalld
> +    rm -rf ${D}${libdir}/firewalld \
> +    ${D}${PYTHON_SITEPACKAGES_DIR}/*/__pycache__ \
> +    ${D}${PYTHON_SITEPACKAGES_DIR}/*/*/__pycache__ \
> +    ${D}${PYTHON_SITEPACKAGES_DIR}/*/*/*/__pycache__ \
> +    ${D}${PYTHON_SITEPACKAGES_DIR}/*/*/*/*/__pycache__ \
> +    ${D}${PYTHON_SITEPACKAGES_DIR}/${BP}.dist-info/direct_url.json
>  
>      if ! ${@bb.utils.contains('PACKAGECONFIG', 'storaged', 'true', 'false', d)}; then
>          for filename in ${FILES:${PN}-storaged}
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117373): https://lists.openembedded.org/g/openembedded-devel/message/117373
> Mute This Topic: https://lists.openembedded.org/mt/112894260/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


