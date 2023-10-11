Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAA8DCDB46E
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 17:22:32 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
 by mx.groups.io with SMTP id smtpd.web11.22665.1697044949644049094
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Oct 2023 10:22:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=juOvO9Xc;
 spf=pass (domain: gmail.com, ip: 209.85.161.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-57b9193b1aeso618122eaf.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Oct 2023 10:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697044949; x=1697649749; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nUBomNEq0i/MWkG8Dv1y9q7ZGT9lM5NUhHiL2MTwzDU=;
        b=juOvO9Xc5dsyvYBd/hugwej55G/PQajzc3/PBAo5rD0TkJxMFjL6CfiYSCkTa+gcxE
         OioeznU1GP4nn6xGuX+hbJM0zJbzqk4clxkFpyLp1Dn+fitrZpNPkUY/DdIdqaJ4mV4b
         FAxBLu3kCMXQibMn3EKZfmxTGKLDkJu9fnjCyk7Xe7fOJ7jGvIrttn1PUzMsSVvVJ1YP
         FdFVvjggPUvdkEnfJ0pQP4mzmmG3cm+aKDinX+WXQFm0CPyRTW6OoxgQaUmseYRWDUtv
         xfVGX3Zqx2t2Qqy1zyKGTO4sIshQhCl3wOUnNrEN+ddktsvkGFj6nuJLeKrXdtTwBRYS
         7vcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697044949; x=1697649749;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nUBomNEq0i/MWkG8Dv1y9q7ZGT9lM5NUhHiL2MTwzDU=;
        b=PtcKfW79IRRgLgEM1pNDshu24Tmu2/42y89VQKo3NjaV2skBvOvE8K1R1h8S5wRc/3
         izeiEIIfiwALtRsngUTJ8AsU1S6WJ/Ode+LHFDcXk/5Dj5ChuqKAki+1M/Omju1W8t14
         BCmvj2DDeRxDH83VO4xX3Af/rmkteJEPIDGDpQ20WsDM+Eqn+EYzHzNMAQcnxGm6Dym1
         5ewegJXxM/hGUF2yxwIcim1dcQ++WX6zWCYZoNIdJj4Pth0jCM6Mo6tG8mXSHqyVERo6
         KBh4bsTWHJPUl2F0umGFT7/DLUrYcxx4h2SZAWxkChb4uuirZxcGpigpf2W15TXfh+X+
         S7mA==
X-Gm-Message-State: AOJu0YyKedxJM7bEZw4OWY0Lne+dXxHPNbXxB5OjT7MIHkOhCC4hPGel
	6lUDEKSro1oXyJYJf4xfmHdf7wetvRAOTcw2nhE=
X-Google-Smtp-Source: AGHT+IH0ZtVTBD7wZFlIJiVmHMfPOajtkJWSt7cBJeMLF1SWlH0Xfq7D7crgbLUBFCINul96vGAOgyIlvhJ4HR5ayuw=
X-Received: by 2002:a05:6870:2045:b0:1ba:c1e7:6b00 with SMTP id
 l5-20020a056870204500b001bac1e76b00mr11468579oad.3.1697044948713; Wed, 11 Oct
 2023 10:22:28 -0700 (PDT)
MIME-Version: 1.0
References: <20231011163346.1856498-1-luca.fancellu@arm.com> <20231011163346.1856498-4-luca.fancellu@arm.com>
In-Reply-To: <20231011163346.1856498-4-luca.fancellu@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 Oct 2023 10:22:02 -0700
Message-ID: <CAMKF1so89orai-uOFF3pKRUze2v9BEC6s5Yy7K8DFjWFH_CPyQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 3/3] linuxptp: add systemd services
To: luca fancellu <luca.fancellu@arm.com>
Cc: openembedded-devel@lists.openembedded.org, Diego.Sueiro@arm.com, 
	Rahul.Singh@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Oct 2023 17:22:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105430

On Wed, Oct 11, 2023 at 9:34=E2=80=AFAM luca fancellu <luca.fancellu@arm.co=
m> wrote:
>
> Add systemd services phc2sys@.service and ptp4l@.service,
> these services are taken from the Ubuntu/Debian linuxptp
> package.
>
> Update the recipe to install them when needed using the
> systemd bbclass, the services are disabled by default.
>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>  .../linuxptp/linuxptp/systemd/phc2sys@.service   | 13 +++++++++++++
>  .../linuxptp/linuxptp/systemd/ptp4l@.service     | 11 +++++++++++
>  .../linuxptp/linuxptp_4.1.bb                     | 16 ++++++++++++++++
>  3 files changed, 40 insertions(+)
>  create mode 100644 meta-oe/recipes-connectivity/linuxptp/linuxptp/system=
d/phc2sys@.service
>  create mode 100644 meta-oe/recipes-connectivity/linuxptp/linuxptp/system=
d/ptp4l@.service
>
> diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp/systemd/phc2s=
ys@.service b/meta-oe/recipes-connectivity/linuxptp/linuxptp/systemd/phc2sy=
s@.service
> new file mode 100644
> index 000000000000..dd2512bdca11
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp/systemd/phc2sys@.ser=
vice
> @@ -0,0 +1,13 @@
> +[Unit]
> +Description=3DSynchronize system clock or PTP hardware clock (PHC)
> +Documentation=3Dman:phc2sys
> +Requires=3Dptp4l.service
> +After=3Dptp4l.service
> +Before=3Dtime-sync.target
> +
> +[Service]
> +Type=3Dsimple
> +ExecStart=3D/usr/sbin/phc2sys -w -s %I

Can these paths be derived from ${sbindir} during do_install.


> +
> +[Install]
> +WantedBy=3Dmulti-user.target
> diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp/systemd/ptp4l=
@.service b/meta-oe/recipes-connectivity/linuxptp/linuxptp/systemd/ptp4l@.s=
ervice
> new file mode 100644
> index 000000000000..1bad2d72df6b
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp/systemd/ptp4l@.servi=
ce
> @@ -0,0 +1,11 @@
> +[Unit]
> +Description=3DPrecision Time Protocol (PTP) service for %I
> +Documentation=3Dman:ptp4l
> +After=3Dsys-subsystem-net-devices-%i.device
> +
> +[Service]
> +Type=3Dsimple
> +ExecStart=3D/usr/sbin/ptp4l -f /etc/linuxptp/ptp4l.conf -i %I

Can these paths be derived from ${sbindir} and ${sysconfdir} bitbake variab=
les
during do_install ? This should make them more portable

> +
> +[Install]
> +WantedBy=3Dmulti-user.target
> diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp_4.1.bb b/meta=
-oe/recipes-connectivity/linuxptp/linuxptp_4.1.bb
> index 3c7efbdeca72..95ed76e621e6 100644
> --- a/meta-oe/recipes-connectivity/linuxptp/linuxptp_4.1.bb
> +++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp_4.1.bb
> @@ -11,11 +11,15 @@ SRC_URI =3D "${LINUXPTP_SRC_URI}/files/v4.1/linuxptp-=
${PV}.tgz \
>             file://build-Allow-CC-and-prefix-to-be-overriden.patch \
>             file://Use-cross-cpp-in-incdefs.patch \
>             file://0001-include-string.h-for-strncpy.patch \
> +           file://systemd/phc2sys@.service \
> +           file://systemd/ptp4l@.service \
>             "
>
>  SRC_URI[md5sum] =3D "1db8699fc155965341759be5e5aad938"
>  SRC_URI[sha256sum] =3D "e1743d44f8208897e30895da3579e670ff919b914feb4b5a=
949f3e421ddde535"
>
> +inherit systemd
> +
>  UPSTREAM_CHECK_URI =3D "${LINUXPTP_SRC_URI}/files/"
>  UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)/"
>
> @@ -23,6 +27,8 @@ EXTRA_OEMAKE =3D "ARCH=3D${TARGET_ARCH} EXTRA_CFLAGS=3D=
'${CFLAGS}' mandir=3D${mandir}"
>
>  export KBUILD_OUTPUT=3D"${RECIPE_SYSROOT}"
>
> +LINUXPTP_SYSTEMD_SERVICES =3D "phc2sys@.service ptp4l@.service"
> +
>  do_install() {
>      oe_runmake install DESTDIR=3D${D} prefix=3D${prefix}
>
> @@ -35,8 +41,18 @@ do_install() {
>      install -d ${D}/${sysconfdir}/linuxptp/
>      install -m 644 ${S}/configs/default.cfg \
>          ${D}${sysconfdir}/linuxptp/ptp4l.conf
> +
> +    # Install systemd services
> +    install -d ${D}/${systemd_unitdir}/system/
> +    for service in ${LINUXPTP_SYSTEMD_SERVICES}; do
> +        install -m 644 ${WORKDIR}/systemd/$service \
> +            ${D}/${systemd_unitdir}/system/$service
> +    done
>  }
>
> +SYSTEMD_SERVICE:${PN} =3D "${LINUXPTP_SYSTEMD_SERVICES}"
> +SYSTEMD_AUTO_ENABLE:${PN} =3D "disable"
> +
>  PACKAGES =3D+ "${PN}-configs"
>
>  FILES:${PN}-configs +=3D "${docdir}"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105429): https://lists.openembedded.org/g/openembedde=
d-devel/message/105429
> Mute This Topic: https://lists.openembedded.org/mt/101900484/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

