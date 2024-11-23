Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C5E1E66885
	for <webhook@archiver.kernel.org>; Sat, 23 Nov 2024 20:45:25 +0000 (UTC)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
 by mx.groups.io with SMTP id smtpd.web11.55371.1732394723147648384
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Nov 2024 12:45:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YgFBW6Hq;
 spf=pass (domain: gmail.com, ip: 209.85.161.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-5f1cec20a77so107470eaf.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 23 Nov 2024 12:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732394722; x=1732999522; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hi18/9paxDvrQWCeqKyw8/Dn63qghUMkW8ogUvY3ejI=;
        b=YgFBW6HqMzTHJH4ZsfUuwCCOabbQB4x8s2jyNITCkT0aB/529vRcof6KNf8hLUKY0u
         5I7xfkaFy9yx2g3sn/KcMAuv0p/xlO5SKhRj7upSACaOeToK20uEgAiHvAtNjKZHGm+o
         PgYpIcv4FpNnPHF4gvpYN2hB2x9zN4l5I2osK6pd/YNQMXEsoVuhBpWiPurc87486v1h
         oCa0Nr4pXNdrX/eAN75CVri9cyWbn6Zzp7Wc6xx1CA1sWkGtY3bdm67+NvJrfMHuJsmZ
         hT6ysXCJsD2wp6amM8k299juh5sjFJDFLPUk+eiRs7v2d0iT5ZnDxaXsKLf9zQgdfL3E
         zd3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732394722; x=1732999522;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hi18/9paxDvrQWCeqKyw8/Dn63qghUMkW8ogUvY3ejI=;
        b=D+FLbFC6XiiMNqmE+s0j3jmrLov/7STaySrBmEmGZjJdNbgyU94lz375NR/iOic+f1
         3uW9mTzkQMEGTgBZBcn7qHtfamUg38sTql1aa58ZCN7zeGMHxvBnmmP39NcLus6xt8R6
         4WufcL7qwAM4/vSIrSqiGVjm1x0PLzALe1Cxa2fJLNfOinFFfYkP+Erk97ZI3ApdUPEs
         oGQ+TxI4QkJS4yJx/aAhMi3zGHtrD/7FwtqWWybtojQWxIgJxXRY2s2/izXneGyk6OgV
         yXx3nkgTWIAo1qoHuTe03MpzJxhq35yxFRAkpRQi1p9eq16RamTWslxrpYudtbCMdeZT
         uw0Q==
X-Gm-Message-State: AOJu0YxVqwwff4TR4+sL0uJBP1AbwGBEpN3f4sNQNr1nnyQ/cX5v9CBN
	mYxQbKHq+HmjeApP04X8qCoPtPcJs65fcuD6U+OPochcsUKZldU9HjEABveNWE692ISq6NNmVgH
	WOrqqqESdTLOmWObUrzGSLO7Igtc=
X-Gm-Gg: ASbGncu71zuBUmGSO3Ijvl+wS57j3Kjvdr9iy5T7cw5EWUHNMTMgCfhMLknbayzesC1
	WaVEH6D+8/fW49veDJtS2bopVTNil0AU=
X-Google-Smtp-Source: AGHT+IGVjIbSdFLmwro+Rs2a10sJhsXe828xDOI0PAxpF17fWUEiMrL0R97EqWOrsMZ10RSEkU5F38E5CwSEYm2akhY=
X-Received: by 2002:a05:6830:6618:b0:710:f8df:33d2 with SMTP id
 46e09a7af769-71c04ad4941mr9220798a34.0.1732394722056; Sat, 23 Nov 2024
 12:45:22 -0800 (PST)
MIME-Version: 1.0
References: <20241122100810.3460864-1-pratheeksha.s.n@ni.com> <CAMKF1sp9mhyEyff5nWPrP9C8VeV_VjNJjePXrrCk-QJjp24Mpw@mail.gmail.com>
In-Reply-To: <CAMKF1sp9mhyEyff5nWPrP9C8VeV_VjNJjePXrrCk-QJjp24Mpw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 23 Nov 2024 12:44:56 -0800
Message-ID: <CAMKF1sqEd2BSv7vUXfpWFki0083s8rOaXib1etOX9nR0vFHPkw@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH] Onboard: Add onboard virtual keyboard
To: pratheeksha.s.n@ni.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Nov 2024 20:45:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114022

another failure

ERROR: onboard-1.4.1-r0 do_patch: QA Issue: Missing Upstream-Status in patc=
h
/mnt/b/yoe/master/sources/meta-openembedded/meta-gnome/recipes-support/onbo=
ard/onboard/0001-pypredict-lm-Define-error-API-if-platform-does-
not-h.patch

On Fri, Nov 22, 2024 at 8:28=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> On Fri, Nov 22, 2024 at 2:08=E2=80=AFAM pratheekshasn via
> lists.openembedded.org <pratheeksha.s.n=3Dni.com@lists.openembedded.org>
> wrote:
> >
> > Signed-off by: Pratheeksha S N <pratheeksha.s.n@ni.com>
> > ---
> >  ...ine-error-API-if-platform-does-not-h.patch | 67 +++++++++++++++++++
> >  .../0002-onboard-onhover-seg-fault-fix.patch  | 52 ++++++++++++++
> >  .../recipes-support/onboard/onboard_1.4.1.bb  | 36 ++++++++++
> >  3 files changed, 155 insertions(+)
> >  create mode 100644 meta-gnome/recipes-support/onboard/onboard/0001-pyp=
redict-lm-Define-error-API-if-platform-does-not-h.patch
> >  create mode 100644 meta-gnome/recipes-support/onboard/onboard/0002-onb=
oard-onhover-seg-fault-fix.patch
> >  create mode 100644 meta-gnome/recipes-support/onboard/onboard_1.4.1.bb
> >
> > diff --git a/meta-gnome/recipes-support/onboard/onboard/0001-pypredict-=
lm-Define-error-API-if-platform-does-not-h.patch b/meta-gnome/recipes-suppo=
rt/onboard/onboard/0001-pypredict-lm-Define-error-API-if-platform-does-not-=
h.patch
> > new file mode 100644
> > index 000000000..fda37895c
> > --- /dev/null
> > +++ b/meta-gnome/recipes-support/onboard/onboard/0001-pypredict-lm-Defi=
ne-error-API-if-platform-does-not-h.patch
> > @@ -0,0 +1,67 @@
> > +From 1c95f64aa342147387ce4b1b7269a5c8b34bd898 Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Thu, 13 Jul 2017 09:01:04 -0700
> > +Subject: [PATCH] pypredict/lm: Define error API if platform does not h=
ave it
> > +
> > +error() API is not implemented across all libcs on linux
> > +e.g. musl does not provide it.
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + Onboard/pypredict/lm/lm.cpp         |  1 -
> > + Onboard/pypredict/lm/lm.h           | 13 +++++++++++++
> > + Onboard/pypredict/lm/lm_dynamic.cpp |  2 --
> > + 3 files changed, 13 insertions(+), 3 deletions(-)
> > +
> > +diff --git a/Onboard/pypredict/lm/lm.cpp b/Onboard/pypredict/lm/lm.cpp
> > +index 2e64296..37ae241 100644
> > +--- a/Onboard/pypredict/lm/lm.cpp
> > ++++ b/Onboard/pypredict/lm/lm.cpp
> > +@@ -19,7 +19,6 @@
> > +
> > + #include <stdlib.h>
> > + #include <stdio.h>
> > +-#include <error.h>
> > + #include <algorithm>
> > + #include <cmath>
> > + #include <string>
> > +diff --git a/Onboard/pypredict/lm/lm.h b/Onboard/pypredict/lm/lm.h
> > +index ed4164a..b8b63ee 100644
> > +--- a/Onboard/pypredict/lm/lm.h
> > ++++ b/Onboard/pypredict/lm/lm.h
> > +@@ -32,6 +32,19 @@
> > + #include <algorithm>
> > + #include <string>
> > +
> > ++#if defined(HAVE_ERROR_H)
> > ++#include <error.h>
> > ++#else
> > ++#include <err.h>
> > ++#define _onboard_error(S, E, F, ...) do { \
> > ++       if (E) \
> > ++               err(S, F ": %s", ##__VA_ARGS__, strerror(E)); \
> > ++       else \
> > ++               err(S, F, ##__VA_ARGS__); \
> > ++} while(0)
> > ++
> > ++#define error _onboard_error
> > ++#endif
> > +
> > + // break into debugger
> > + // step twice to come back out of the raise() call into known code
> > +diff --git a/Onboard/pypredict/lm/lm_dynamic.cpp b/Onboard/pypredict/l=
m/lm_dynamic.cpp
> > +index 7c62824..e7c7f40 100644
> > +--- a/Onboard/pypredict/lm/lm_dynamic.cpp
> > ++++ b/Onboard/pypredict/lm/lm_dynamic.cpp
> > +@@ -17,8 +17,6 @@
> > +  * along with this program. If not, see <http://www.gnu.org/licenses/=
>.
> > +  */
> > +
> > +-#include <error.h>
> > +-
> > + #include "lm_dynamic.h"
> > +
> > + using namespace std;
> > +--
> > +2.13.2
> > +
> > diff --git a/meta-gnome/recipes-support/onboard/onboard/0002-onboard-on=
hover-seg-fault-fix.patch b/meta-gnome/recipes-support/onboard/onboard/0002=
-onboard-onhover-seg-fault-fix.patch
> > new file mode 100644
> > index 000000000..1ec195cb8
> > --- /dev/null
> > +++ b/meta-gnome/recipes-support/onboard/onboard/0002-onboard-onhover-s=
eg-fault-fix.patch
> > @@ -0,0 +1,52 @@
> > +From: 1be95325d320122efd5dedf7437839cfcca01f7a
> > +From: https://github.com/void-linux/void-packages/commit/1be95325d3201=
22efd5dedf7437839cfcca01f7a
> > +Date: Mon, 23 Sep 2024
> > +Subject: [PATCH] onboard: fix segfault when hovering over the keyboard
> > +
> > +Currently, if the mouse pointer is hovered over the Onboard keyboard, =
the application crashes with a segmentation fault.
> > +This is because the new_device_event function is not acquiring the GIL=
 before creating a new object. This patch fixes
> > +the issue by acquiring the GIL before creating a new object. It also a=
cquires the GIL before queueing the event.
> > +This patch is taken from the fix provided in the following link:
> > +https://github.com/void-linux/void-packages/commit/1be95325d320122efd5=
dedf7437839cfcca01f7a
> > +
> > +Signed-off by: Pratheeksha S N <pratheeksha.s.n@ni.com>
> > +
> > +Upstream-Status: Inactive-Upstream [lastcommit: 2017-10-09]
> > +
> > +--- a/Onboard/osk/osk_devices.c
> > ++++ b/Onboard/osk/osk_devices.c
> > +@@ -97,13 +97,15 @@ osk_device_event_dealloc (OskDeviceEvent
> > + static OskDeviceEvent*
> > + new_device_event (void)
> > + {
> > +-    OskDeviceEvent *ev =3D PyObject_New(OskDeviceEvent, &osk_device_e=
vent_type);
> > ++    OskDeviceEvent *ev;
> > ++    PyGILState_STATE gstate =3D PyGILState_Ensure();
> > ++    ev =3D PyObject_New(OskDeviceEvent, &osk_device_event_type);
> > +     if (ev)
> > +     {
> > +         osk_device_event_type.tp_init((PyObject*) ev, NULL, NULL);
> > +-        return ev;
> > +     }
> > +-    return NULL;
> > ++    PyGILState_Release(gstate);
> > ++    return ev;
> > + }
> > +
> > + static PyObject *
> > +@@ -334,6 +336,7 @@ osk_devices_dealloc (OskDevices *dev)
> > + static void
> > + queue_event (OskDevices* dev, OskDeviceEvent* event, Bool discard_pen=
ding)
> > + {
> > ++    PyGILState_STATE state =3D PyGILState_Ensure ();
> > +     GQueue* queue =3D dev->event_queue;
> > +     if (queue)
> > +     {
> > +@@ -364,6 +367,7 @@ queue_event (OskDevices* dev, OskDeviceE
> > +         Py_INCREF(event);
> > +         g_queue_push_head(queue, event);
> > +     }
> > ++    PyGILState_Release (state);
> > + }
> > +
> > + static gboolean idle_process_event_queue (OskDevices* dev)
> > diff --git a/meta-gnome/recipes-support/onboard/onboard_1.4.1.bb b/meta=
-gnome/recipes-support/onboard/onboard_1.4.1.bb
> > new file mode 100644
> > index 000000000..359a2134e
> > --- /dev/null
> > +++ b/meta-gnome/recipes-support/onboard/onboard_1.4.1.bb
> > @@ -0,0 +1,36 @@
> > +SUMMARY =3D "An onscreen keyboard"
> > +LICENSE =3D "GPL-3.0-only"
> > +LIC_FILES_CHKSUM =3D "file://COPYING.GPL3;md5=3D8521fa4dd51909b407c515=
0498d34f4e"
> > +
> > +DEPENDS +=3D "gtk+3 hunspell libcanberra libxkbfile dconf python3-dist=
utils-extra-native intltool-native"
> > +
> > +SRC_URI =3D "https://launchpad.net/onboard/1.4/${PV}/+download/${BPN}-=
${PV}.tar.gz \
> > +           file://0001-pypredict-lm-Define-error-API-if-platform-does-=
not-h.patch \
> > +              file://0002-onboard-onhover-seg-fault-fix.patch \
> > +           "
> > +SRC_URI[md5sum] =3D "1a2fbe82e934f5b37841d17ff51e80e8"
> > +SRC_URI[sha256sum] =3D "01cae1ac5b1ef1ab985bd2d2d79ded6fc99ee04b1535cc=
1bb191e43a231a3865"
> > +
> > +inherit features_check setuptools3 pkgconfig gtk-icon-cache gsettings =
mime-xdg
> > +
> > +REQUIRED_DISTRO_FEATURES =3D "x11"
> > +
> > +FILES:${PN} +=3D " \
> > +    ${datadir}/dbus-1 \
> > +    ${datadir}/icons \
> > +    ${datadir}/gnome-shell \
> > +    ${datadir}/help \
> > +"
> > +
> > +RDEPENDS:${PN} +=3D " \
> > +    ncurses \
> > +    python3-dbus \
> > +    python3-pycairo \
> > +    python3-pygobject \
> > +"
> > +
> > +do_install:append() {
> > +       install -d ${D}${sysconfdir}/xdg/autostart
> > +
> > +       mv ${D}${PYTHON_SITEPACKAGES_DIR}${sysconfdir}/xdg/autostart/on=
board-autostart.desktop ${D}${sysconfdir}/xdg/autostart
>
> Use a single line to create the dir and copy the file.
>
> Install -Dm 0644
> ${D}${PYTHON_SITEPACKAGES_DIR}${sysconfdir}/xdg/autostart/onboard-autosta=
rt.desktop
> ${D}${sysconfdir}/xdg/autostart/onboard-autostart.desktop
>
> > +}
> > --
> > 2.43.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#113995): https://lists.openembedded.org/g/openembed=
ded-devel/message/113995
> > Mute This Topic: https://lists.openembedded.org/mt/109720017/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

