Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9C39CDB46E
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 15:09:22 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web11.14513.1697123354528788829
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Oct 2023 08:09:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PRFv474+;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-1dd5b98d9aeso529302fac.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Oct 2023 08:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697123354; x=1697728154; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PyjdK1xw2muMv/u51FHx7p8KSfzQ2Li3DVeMSEvRLhs=;
        b=PRFv474+aw6X+y+8Kr2gxRGW3gtQdsTTUqhUZ8oW8yBQNp6cK2jrYW6pe+WfmXuguu
         7e/a6W842B1nNGsU+8EwPD6jRC6nZcUMwDcqfwbbY3SLavcvJnj5MTxEGMhiv4ucuR0Z
         hx+7r2/XGOFgJHqUdFbBpz9ZKPNeJyc6yiU2R5ZceeBDQSDKA8TmYa/cPyJLzx//1C0T
         HkGJLcCqsQMWTw3x+oDBQOvS0fqwQH3Z2kN8tQG/AttVkNPvyfclPkz2nMcLh78jVYtJ
         QBddiOGkQX0N3bGiAAdGy//CCQo2HZDnDrI2rBmnlui/10ClLkQvE4JjU0iI9S1x4p6B
         1Glw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697123354; x=1697728154;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PyjdK1xw2muMv/u51FHx7p8KSfzQ2Li3DVeMSEvRLhs=;
        b=XITS6fim4KXKh5eVRt/onVnY9iYPeDE9bRiYlV8A3haLrAJaVrrlEr/hX2e2oan0Ps
         6AXod3vakhhbgP5FyUH5Ok8QtcLKPgMugLmY30v1syUfc/D/ONaqZgW1DxhTE/TQ3d+V
         X7XJdTLKZN0obcPt7EDn29dHcaq7msI0SHc5w7IVvzSnEJB/B5peC836O5aqGzlPTpDZ
         VbWv4sg9f3tClAgc4/j3DYZBGTdrJSr7Sg1j42k0PfqEkjTBteQlkhifLNJuRPIIglvV
         tgCGB3pcx6lRH+UId1jUhEHNWQoPo9dW6oPhVAISNYaM+3PlEfYm57CGQJiiVSwt7yVV
         o6kg==
X-Gm-Message-State: AOJu0YxGb7dVl1kUc3pNE5T0eXhuHhw00x2fEhMrs2rvZnZDPZSNZFM5
	KM5lYoVO3kMvfKHRoWWZPMD+Z/HLu4MIKgtUsgk=
X-Google-Smtp-Source: AGHT+IHuwBswJV5U9BBnaZIIVQE3Aftybg/baMY3oef4H0Vmi2wWidfcutT3t+ss3w5tZ416OhZMyf5JcFEJRJX3ewc=
X-Received: by 2002:a05:6870:795:b0:1b7:629b:de06 with SMTP id
 en21-20020a056870079500b001b7629bde06mr12376826oab.20.1697123353675; Thu, 12
 Oct 2023 08:09:13 -0700 (PDT)
MIME-Version: 1.0
References: <20231011163346.1856498-1-luca.fancellu@arm.com>
 <20231011163346.1856498-4-luca.fancellu@arm.com> <CAMKF1so89orai-uOFF3pKRUze2v9BEC6s5Yy7K8DFjWFH_CPyQ@mail.gmail.com>
 <0AF6ED9B-AD74-4DC5-B65F-F1EE861818AA@arm.com> <CAMKF1soL+SMx5cHLTBnTZQ5x_YKbYSr2TnCTdBqkEut9Ly=Kug@mail.gmail.com>
 <2E85458C-8CC7-4422-9EC7-48AF2F5A945E@arm.com>
In-Reply-To: <2E85458C-8CC7-4422-9EC7-48AF2F5A945E@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 12 Oct 2023 08:08:47 -0700
Message-ID: <CAMKF1so+WaxYmNF8MF7eOVx4dpeAimpE51xZ+gFXhFn6Zibqrw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 3/3] linuxptp: add systemd services
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Diego Sueiro <Diego.Sueiro@arm.com>, Rahul Singh <Rahul.Singh@arm.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Oct 2023 15:09:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105457

On Thu, Oct 12, 2023 at 7:39=E2=80=AFAM Luca Fancellu <Luca.Fancellu@arm.co=
m> wrote:
>
>
>
> > On 12 Oct 2023, at 15:22, Khem Raj <raj.khem@gmail.com> wrote:
> >
> >
> >
> > On Thu, Oct 12, 2023 at 2:56 AM Luca Fancellu <Luca.Fancellu@arm.com> w=
rote:
> > Hi Khem,
> >
> > >>
> > >> diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp/systemd/=
phc2sys@.service b/meta-oe/recipes-connectivity/linuxptp/linuxptp/systemd/p=
hc2sys@.service
> > >> new file mode 100644
> > >> index 000000000000..dd2512bdca11
> > >> --- /dev/null
> > >> +++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp/systemd/phc2sys=
@.service
> > >> @@ -0,0 +1,13 @@
> > >> +[Unit]
> > >> +Description=3DSynchronize system clock or PTP hardware clock (PHC)
> > >> +Documentation=3Dman:phc2sys
> > >> +Requires=3Dptp4l.service
> > >> +After=3Dptp4l.service
> > >> +Before=3Dtime-sync.target
> > >> +
> > >> +[Service]
> > >> +Type=3Dsimple
> > >> +ExecStart=3D/usr/sbin/phc2sys -w -s %I
> > >
> > > Can these paths be derived from ${sbindir} during do_install.
> > >
> > >
> > >> +
> > >> +[Install]
> > >> +WantedBy=3Dmulti-user.target
> > >> diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp/systemd/=
ptp4l@.service b/meta-oe/recipes-connectivity/linuxptp/linuxptp/systemd/ptp=
4l@.service
> > >> new file mode 100644
> > >> index 000000000000..1bad2d72df6b
> > >> --- /dev/null
> > >> +++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp/systemd/ptp4l@.=
service
> > >> @@ -0,0 +1,11 @@
> > >> +[Unit]
> > >> +Description=3DPrecision Time Protocol (PTP) service for %I
> > >> +Documentation=3Dman:ptp4l
> > >> +After=3Dsys-subsystem-net-devices-%i.device
> > >> +
> > >> +[Service]
> > >> +Type=3Dsimple
> > >> +ExecStart=3D/usr/sbin/ptp4l -f /etc/linuxptp/ptp4l.conf -i %I
> > >
> > > Can these paths be derived from ${sbindir} and ${sysconfdir} bitbake =
variables
> > > during do_install ? This should make them more portable
> >
> > Yes I can do that, for both ${sbindir} and ${sysconfdir}, I see the mak=
efile sets
> > sbindir =3D $(prefix)/sbin, we already pass ${prefix} in the make comma=
nd line,
> > do you think we should pass also sbindir=3D to ensure consistency?
> >
> > I think it is that we store the origin service file as a template like =
service.in and then when installing it during do_install substitute the pat=
hs with original value of these variables there are many examples of this i=
n metadata
> >
> >
>
> Yes of course, that part is very clear, what I=E2=80=99m asking is:
>
> Since the Makefile hardcode sbindir, is it enough if I replace ${prefix} =
and ${sysconfdir} in the service?
>
> For example here:
> > >> +++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp/systemd/ptp4l@.=
service
> > >> @@ -0,0 +1,11 @@
> > >> +[Unit]
> > >> +Description=3DPrecision Time Protocol (PTP) service for %I
> > >> +Documentation=3Dman:ptp4l
> > >> +After=3Dsys-subsystem-net-devices-%i.device
> > >> +
> > >> +[Service]
> > >> +Type=3Dsimple
> > >> +ExecStart=3D/usr/sbin/ptp4l -f /etc/linuxptp/ptp4l.conf -i %I
>
> It will be: ExecStart=3D@PREFIX@/sbin/ptp4l -f @SYSCONFDIR@/linuxptp/ptp4=
l.conf -i %I

just ensure it keeps working for usrmerge DISTRO_FEATURE as well.

>
> So that in do_install I can do the sed substitution using ${prefix} and $=
{sysconfdir}
>
>

