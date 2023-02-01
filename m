Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61627C05027
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 06:35:50 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web11.17596.1675233341188172859
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Jan 2023 22:35:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hxtjlH2X;
 spf=pass (domain: gmail.com, ip: 209.85.210.42, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f42.google.com with SMTP id e12-20020a0568301e4c00b0068bc93e7e34so3086510otj.4
        for <openembedded-devel@lists.openembedded.org>; Tue, 31 Jan 2023 22:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dTBanXCkxP1NJsd0VrdhT10D9cVU2fXB8ytG+er9QSU=;
        b=hxtjlH2XGZdmfIPJhfcHVK8/ZE2tTl++ard3k7oAwrWw8Gnp5GGtpN0JLdfoS9QLzJ
         jd5GcoQ849utmZfz3beZGOAmIGhqPnlf8LL0GS4G4RPFNYgXt6R+/wtqngL3iAPRNDfT
         x0xJdyhWQ0Xlb7kDjSWXKKxORnIMDa5wyNv+n3+mDOh5V4lgXHjWp5SOS6qU44a29MNq
         X/KylwLbU+jjhlrbwoRxFFHolYmoyCQQBfdZoMr0lDLkxv8/u99IKDHQm769Ab+hKm81
         x51hyaMNumtXT1ig9ZpxfYo+4X1s4Mtw0bfJRtm+Q8Dx89t5/9JyKRIWHv7bkoHjTLAL
         BcxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dTBanXCkxP1NJsd0VrdhT10D9cVU2fXB8ytG+er9QSU=;
        b=mDNhPuzNj3iRTl4/m/Ev2JZfcoDQh95ATPr/qgFbhnZ5SlrIgOwCvHspTNswHzl7xh
         MqNEpYYgUVcN7ls2jjYy0cegyAE9fzUPYzk7EXOs9cbRHgofH3zebFczJBkRGW3ydNxv
         fXeiOIYKgae8GBela1JPmvoYPszzvQ+fTn2FjZ6hmjOmWps1ok49gglIjhcQiDPPXSEO
         ozEtFeYTfyvtL6yKnixQGk21JUUNHezGWH09N3rPR4VMkH6GgPCObdoHsRP6WbqboJLO
         UoiusWFtA9feGMitX7670rEx3euH3fZz+pnFGOixOr7MvIUCuk7lcrSFUiuD5kQ7FHOQ
         Sn4Q==
X-Gm-Message-State: AO0yUKUoGWklFzqW8xH9YmldJ6YFNs/3UIxgHh4rlUoGMJR0N1juS0Is
	QG1Nt65NENrHK4s4UJeb3XlPOIYSFuQkh9PHnmk=
X-Google-Smtp-Source: AK7set8KMAHFO37ypZCvqWPt41gwMchZlMVRVwf8KLXKQ5QIWhEcda04T+SjnEuBnoUPScn8bp9ZVlvUdzTPZTI3RUI=
X-Received: by 2002:a05:6830:2444:b0:686:6392:ed38 with SMTP id
 x4-20020a056830244400b006866392ed38mr77407otr.22.1675233340288; Tue, 31 Jan
 2023 22:35:40 -0800 (PST)
MIME-Version: 1.0
References: <20230201051919.45856-1-f_l_k@t-online.de> <XVYDPR.BWKRSOYI4AU1@t-online.de>
In-Reply-To: <XVYDPR.BWKRSOYI4AU1@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 31 Jan 2023 22:35:14 -0800
Message-ID: <CAMKF1so_8g+3xAyOPmaz7NHRxcKR4vTmMm7D7t93sOYMuZhMNQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCHv3] system-config-printer: add recipe
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Feb 2023 06:35:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100899

I think a better fix would be to enable it via a packageconfig,
something like this can do it. It will also make it explicit and
deterministic.

PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
PACKAGECONFIG[systemd] =3D ",,systemd"

On Tue, Jan 31, 2023 at 9:21 PM Markus Volk <f_l_k@t-online.de> wrote:
>
> I removed the dependency on systemd to allow to build without. It'll be f=
ound automatically if present
>
> Am Mi, 1. Feb 2023 um 06:19:19 +0100 schrieb Markus Volk <f_l_k@t-online.=
de>:
>
> The OpenPrinting gui for cups configuration Signed-off-by: Markus Volk <f=
_l_k@t-online.de> --- .../system-config-printer_1.5.18.bb | 33 ++++++++++++=
+++++++ 1 file changed, 33 insertions(+) create mode 100644 meta-oe/recipes=
-printing/system-config-printer/system-config-printer_1.5.18.bb diff --git =
a/meta-oe/recipes-printing/system-config-printer/system-config-printer_1.5.=
18.bb b/meta-oe/recipes-printing/system-config-printer/system-config-printe=
r_1.5.18.bb new file mode 100644 index 000000000..ba2fbed98 --- /dev/null +=
++ b/meta-oe/recipes-printing/system-config-printer/system-config-printer_1=
.5.18.bb @@ -0,0 +1,33 @@ +DESCRIPTION =3D "a graphical user interface that=
 allows the user to change print settings" +LICENSE =3D "GPL-2.0-only" +LIC=
_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263" +=
 +SRC_URI =3D "git://github.com/OpenPrinting/system-config-printer.git;prot=
ocol=3Dhttps;branch=3Dmaster" + +SRCREV =3D "895d3dec50c93bfd4f142bac9bfcc1=
3051bf84cb" +S =3D "${WORKDIR}/git" + +inherit autotools gettext pkgconfig =
python3native features_check + +REQUIRED_DISTRO_FEATURES =3D "gobject-intro=
spection-data" + +DEPENDS =3D "cups glib-2.0 libusb xmlto-native intltool-n=
ative desktop-file-utils-native" + +do_configure:prepend() { + # This file =
is not provided if fetching from git but required for configure + touch ${S=
}/ChangeLog +} + +FILES:${PN} +=3D "${libdir} ${datadir}" + +RDEPENDS:${PN}=
 =3D " \ + dbus-x11 \ + gtk+3 \ + libnotify \ + python3-core \ + python3-db=
us \ + python3-firewall \ + python3-pycups \ + python3-pycurl \ + python3-p=
ygobject \ +"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#100898): https://lists.openembedded.org/g/openembedde=
d-devel/message/100898
> Mute This Topic: https://lists.openembedded.org/mt/96670490/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

