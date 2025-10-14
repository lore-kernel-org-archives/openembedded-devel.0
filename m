Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE191CCD18E
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 21:18:06 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web11.877.1760476678881521912
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 14:17:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DAPNp60v;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-30cce50dfb4so3426189fac.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 14:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760476678; x=1761081478; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l/OSyZl559CNDATnUE/ZeCfNLePOXwCxXttlDQ+PK40=;
        b=DAPNp60vkV7s5rzoFF+isabW4Z8jUYDndJIP3b4jM4glRJygPIBw/So0Zp483u9gO9
         Ray36A3o8+a8XWS02VNeaXGxnJx7ZOfNS7JO4TSxCaFL4DiYl0y1ftZ4O8BqDObVCUOc
         UKwdiKveUDwHlUJG6jCdIq1cqP7XF7L7RvbrcgyhWs4DlpUPalbh0hPwVGSj4lmuiCWn
         vdNXQaaSvT+7Sy0f+91hwrkKVd/Xz2PWJbzyBgv8iMEXpdGJv6iSoMQjoU5GJV0+eVGI
         OLAaBrE7zGeYqKdFd0MTGMk3t/BVjUA0YN+op4ilbLjzWMyeLqQ0aUJLx811SvI0xAG1
         x9kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760476678; x=1761081478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l/OSyZl559CNDATnUE/ZeCfNLePOXwCxXttlDQ+PK40=;
        b=c6SlXzOcweWHWrP8G5k9XHMdtrKehl7UB2ad8EFbTq4CT8OWvJcaKxbJIE8+3NyNrK
         oJxo5bOk7SMBlNO0FF35aMOeYPTYYI0Bmhv3wRaVN7DlzFgpUCqyR+6RXe9SQNelxCM0
         4kLbf9SDqcs1zSbQNaOp9C7RJCbZ6SGFYVViFMVWAf3Pcmj8s9MP2r2OcCzuL9BSYf5a
         J4uehb1un+o1ycoXNnPWuwxSC/bwtXnUOb6QuRkKP9ImJI8SvskwrBCQx3RwfCnZmbMa
         4U9My0WHjLIaF2zdL+r0Re3VCIicn1IuaY17x1PwSYgsK0SI/XdRZNy53ppZniME4a14
         RLzA==
X-Gm-Message-State: AOJu0Yzahe71Sf1RnWnZEwMounQfLxPpawZjN6VzKJgK4Ax6Esy892/H
	7dhw616KClRAl71iw5nAfmSgx2Xl7NxGxfWO+qcPJVxVgHaTzFL6Tz1O3cqOjuQT+ioR1YbWqSA
	NABxfIzwGpC/i2KM7aE+rf5lPRLpEXA4=
X-Gm-Gg: ASbGncuxzx5YINUAMnEUqgNCwJAPLhMIAOhcg59YDViF4/FUal60crOfeU5mKh6/dR1
	vtUyf7sL8a969UNY0yrChXDyllsf5QtwIADKN5xoirdiElJkDi7c5SYlUnyry0ubPaoF3sL/bp1
	oDi1snxchDwttjMGLG7MGG2IhCXTedDnRlFry62+n28m+iSA7jh3F1k+WWf1lRgFuadDCnM1uYb
	6SVlmbv+jK4YL8Ita6Ve1NhWDYI609v4ZZOw3M=
X-Google-Smtp-Source: AGHT+IF6I4mNRuTUgo8MRzUJ8QcF7YVvHW+VgtVX20G2x8EdcV7yqBDlG/8SZZYXEb7qmVeeG6X/g9ipS8fitmmdaFE=
X-Received: by 2002:a05:6871:807:b0:31d:8e95:2f0d with SMTP id
 586e51a60fabf-3c0f62f8497mr14227116fac.2.1760476678085; Tue, 14 Oct 2025
 14:17:58 -0700 (PDT)
MIME-Version: 1.0
References: <20251014205402.1487867-1-ankur.tyagi85@gmail.com>
 <20251014205402.1487867-16-ankur.tyagi85@gmail.com> <5c327785-0d51-494a-94e5-9f5c97d95e72@gmail.com>
In-Reply-To: <5c327785-0d51-494a-94e5-9f5c97d95e72@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Wed, 15 Oct 2025 10:17:47 +1300
X-Gm-Features: AS18NWCUF86NWYU6xborV9nWVaUqsTZtOFhVKy8lZdj60E-l7iygn-N7GndCmBg
Message-ID: <CADySD0GfS-f3L4onbVBsaoRSQZ4v-0PH1TwnfmeVGcdkR8vuHA@mail.gmail.com>
Subject: Re: [oe][meta-oe][scarthgap][PATCH 16/18] influxdb: Do not remove
 non-existing files
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 21:18:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120657

On Wed, Oct 15, 2025 at 10:15=E2=80=AFAM Gyorgy Sarvari <skandigraun@gmail.=
com> wrote:
>
>
> On 10/14/25 22:53, Ankur Tyagi via lists.openembedded.org wrote:
> > From: Khem Raj <raj.khem@gmail.com>
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > (cherry picked from commit cd6e2d8f53b45108ae9aa7b2a2988452dff4a2eb)
> > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > ---
> >  meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb | 11 ++++++-----
> >  1 file changed, 6 insertions(+), 5 deletions(-)
> >
> > diff --git a/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb b/meta-oe/=
recipes-dbs/influxdb/influxdb_1.8.10.bb
> > index 5301071516..9506d0e55d 100644
> > --- a/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
> > +++ b/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
> > @@ -38,19 +38,20 @@ USERADD_PACKAGES =3D "${PN}"
> >  USERADD_PARAM:${PN} =3D "--system -d /var/lib/influxdb -m -s /bin/nolo=
gin influxdb"
> >
> >  do_install:prepend() {
> > -    rm ${B}/src/${GO_IMPORT}/build.py
> > -    rm ${B}/src/${GO_IMPORT}/build.sh
> > -    rm ${B}/src/${GO_IMPORT}/Dockerfile*
> > +    test -e ${B}/src/${GO_IMPORT}/build.py && rm ${B}/src/${GO_IMPORT}=
/build.py
> > +    test -e ${B}/src/${GO_IMPORT}/build.sh && rm ${B}/src/${GO_IMPORT}=
/build.sh
> > +    rm -rf ${B}/src/${GO_IMPORT}/Dockerfile*
> > +
> >      sed -i -e "s#usr/bin/sh#bin/sh#g" ${B}/src/${GO_IMPORT}/scripts/ci=
/run_perftest.sh
> >  }
> >
> >  do_install:append() {
> >      install -d ${D}${sysconfdir}/influxdb
> > -    install -m 0644 ${WORKDIR}/influxdb.conf ${D}${sysconfdir}/influxd=
b
> > +    install -m 0644 ${UNPACKDIR}/influxdb.conf ${D}${sysconfdir}/influ=
xdb
>
> Careful: ${UNPACKDIR} wasn't a thing in Scarthgap

Ahh right, will fix it in v2
>
> >      chown -R root:influxdb ${D}${sysconfdir}/influxdb
> >
> >      install -d ${D}${sysconfdir}/init.d
> > -    install -m 0755 ${WORKDIR}/influxdb ${D}${sysconfdir}/init.d/influ=
xdb
> > +    install -m 0755 ${UNPACKDIR}/influxdb ${D}${sysconfdir}/init.d/inf=
luxdb
> >
> >      if [ "${@bb.utils.filter('DISTRO_FEATURES', 'sysvinit', d)}" ] ; t=
hen
> >          install -d ${D}${sysconfdir}/logrotate.d
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#120649): https://lists.openembedded.org/g/openembed=
ded-devel/message/120649
> > Mute This Topic: https://lists.openembedded.org/mt/115760530/6084445
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[skandigraun@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

