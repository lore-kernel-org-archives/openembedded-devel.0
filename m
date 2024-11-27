Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88366D6ACFA
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 17:40:21 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.web10.77363.1732729211843346486
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Nov 2024 09:40:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cMFmnVsD;
 spf=pass (domain: gmail.com, ip: 209.85.210.47, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-71d3e506981so2026501a34.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Nov 2024 09:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732729211; x=1733334011; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yBX1mnG4Bd7b0PhV3gGZWzMiovsAOREzinYMU9Ab204=;
        b=cMFmnVsDmkeND3T2WnPMDi6A65sPPFXWF2wK2EYOxtPlim5xK9521yA2VWjRQAKf34
         O05ayOtLtbLZHrSPNX4YybnVsrCkKwuz9/8Fts1QqE6jYsUwcuecJlvB6yOSEdRarLJP
         Q5t7CG+Ss01gNvYq2qZC7Fg6fxHGc/i4M/oKdBWLwTM/0hb09BrtWNBXQZz0yGB5Wokk
         9fm21N4aE8yp/BiNlg5acgVMuZiZpmQ6xglW8llcpvBNdWHCpqauVNhHxw9wxXmlBMJO
         E+XCgj8op9Cc4BiqQtu6g1y8jFVQHK61ZOlYvBSaGIEuilub4dtwSotlT1iMshjS1fOJ
         LLZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732729211; x=1733334011;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yBX1mnG4Bd7b0PhV3gGZWzMiovsAOREzinYMU9Ab204=;
        b=pTm3WXywFuH5TI9/83KFiYrCVqYPOL94U78PGJaTwPb5E9TzpErAAyaRXQYdZnz+3P
         jM6qKIX2+sOWiL3dxu/BAqbaJy3gTaGqfLTgGvMkyVMlMHezpHgDP+tbZQ3IcgGo3xoo
         T0X43OBcQ9MnIoE5LVxq8T6t0dKUlmycT+QJOPXMFzDQdIOLXG2+xjo1R8842FMkTuyE
         ekLZAXxXQjTixTE0JUCE+Q3UsSmkD2xVeYTCHHmgdryOihv4XdbQYrqutqJocWShVO2k
         Ws1RW5lQgH2d6MmdelR//M5FbtA9Z2cegw2QJWEfdSme4EYipI8xd1vpdyNDilRLwLZv
         1nJw==
X-Gm-Message-State: AOJu0YzAgmIcqxN+ryrcl5JsKmEJ98elDeiwIeXD0DG/XycSw3bGPrOE
	cYsJj5Bp0kq06fxuAhre4l03EiTYI5rL9zsqt8FHVKZws0nljzdfRZ6+aVXWK81KoVnZuIRqn/C
	Aru/G3JiIwMCT14qIyTxkAjrpSSMtkqSj
X-Gm-Gg: ASbGncurVXiy0UgJgl6TVLxEJCPp5k30UWUFywKo1bhGS7KS4TTBt621LHcayZOR8T3
	QCIVwJrU0xYjDJ/mM+JvhlDCIefjgVg==
X-Google-Smtp-Source: AGHT+IHJ+c16PQtiz8Aes9P2Q2qUaO6FaphAJ9QCvZVD+SXqCoirDR+QlExkYYPj+pf4HhR+oQMnbLETMaZLXvejinw=
X-Received: by 2002:a05:6830:448e:b0:71d:50f0:afc5 with SMTP id
 46e09a7af769-71d65cfbe07mr4512206a34.21.1732729210966; Wed, 27 Nov 2024
 09:40:10 -0800 (PST)
MIME-Version: 1.0
References: <20241127105113.2411322-1-pratheeksha.s.n@ni.com>
In-Reply-To: <20241127105113.2411322-1-pratheeksha.s.n@ni.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Nov 2024 09:39:45 -0800
Message-ID: <CAMKF1spz90jiMdgeHY3+o031HdqUWyo6rj8QLC0iFXHQqLPqww@mail.gmail.com>
Subject: Re: [oe] [meta-xfce][PATCH v2] Onboard: Add onboard virtual keyboard
To: pratheeksha.s.n@ni.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Nov 2024 17:40:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114093

On Wed, Nov 27, 2024 at 2:51=E2=80=AFAM pratheekshasn via
lists.openembedded.org <pratheeksha.s.n=3Dni.com@lists.openembedded.org>
wrote:
>
> A lightweight onscreen keyboard for touchscreen devices.
>

where are you needing this recipe ? please describe the usecase, since
its kind of jaded package we need a reason to add and maintain it.

> Signed-off by: Pratheeksha S N <pratheeksha.s.n@ni.com>
> ---
>  ...ine-error-API-if-platform-does-not-h.patch | 70 +++++++++++++++++++
>  .../0002-onboard-onhover-seg-fault-fix.patch  | 52 ++++++++++++++
>  .../recipes-apps/onboard/onboard_1.4.1.bb     | 34 +++++++++
>  3 files changed, 156 insertions(+)
>  create mode 100644 meta-xfce/recipes-apps/onboard/onboard/0001-pypredict=
-lm-Define-error-API-if-platform-does-not-h.patch
>  create mode 100644 meta-xfce/recipes-apps/onboard/onboard/0002-onboard-o=
nhover-seg-fault-fix.patch
>  create mode 100644 meta-xfce/recipes-apps/onboard/onboard_1.4.1.bb
>
> diff --git a/meta-xfce/recipes-apps/onboard/onboard/0001-pypredict-lm-Def=
ine-error-API-if-platform-does-not-h.patch b/meta-xfce/recipes-apps/onboard=
/onboard/0001-pypredict-lm-Define-error-API-if-platform-does-not-h.patch
> new file mode 100644
> index 000000000..3f4145264
> --- /dev/null
> +++ b/meta-xfce/recipes-apps/onboard/onboard/0001-pypredict-lm-Define-err=
or-API-if-platform-does-not-h.patch
> @@ -0,0 +1,70 @@
> +From 1c95f64aa342147387ce4b1b7269a5c8b34bd898 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Thu, 13 Jul 2017 09:01:04 -0700
> +Subject: [PATCH] pypredict/lm: Define error API if platform does not hav=
e it
> +
> +error() API is not implemented across all libcs on linux
> +e.g. musl does not provide it.
> +
> +Upstream-Status: Inactive-Upstream [lastcommit: 2017-10-09]
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +---
> + Onboard/pypredict/lm/lm.cpp         |  1 -
> + Onboard/pypredict/lm/lm.h           | 13 +++++++++++++
> + Onboard/pypredict/lm/lm_dynamic.cpp |  2 --
> + 3 files changed, 13 insertions(+), 3 deletions(-)
> +
> +diff --git a/Onboard/pypredict/lm/lm.cpp b/Onboard/pypredict/lm/lm.cpp
> +index 2e64296..37ae241 100644
> +--- a/Onboard/pypredict/lm/lm.cpp
> ++++ b/Onboard/pypredict/lm/lm.cpp
> +@@ -19,7 +19,6 @@
> +
> + #include <stdlib.h>
> + #include <stdio.h>
> +-#include <error.h>
> + #include <algorithm>
> + #include <cmath>
> + #include <string>
> +diff --git a/Onboard/pypredict/lm/lm.h b/Onboard/pypredict/lm/lm.h
> +index ed4164a..b8b63ee 100644
> +--- a/Onboard/pypredict/lm/lm.h
> ++++ b/Onboard/pypredict/lm/lm.h
> +@@ -32,6 +32,19 @@
> + #include <algorithm>
> + #include <string>
> +
> ++#if defined(HAVE_ERROR_H)
> ++#include <error.h>
> ++#else
> ++#include <err.h>
> ++#define _onboard_error(S, E, F, ...) do { \
> ++       if (E) \
> ++               err(S, F ": %s", ##__VA_ARGS__, strerror(E)); \
> ++       else \
> ++               err(S, F, ##__VA_ARGS__); \
> ++} while(0)
> ++
> ++#define error _onboard_error
> ++#endif
> +
> + // break into debugger
> + // step twice to come back out of the raise() call into known code
> +diff --git a/Onboard/pypredict/lm/lm_dynamic.cpp b/Onboard/pypredict/lm/=
lm_dynamic.cpp
> +index 7c62824..e7c7f40 100644
> +--- a/Onboard/pypredict/lm/lm_dynamic.cpp
> ++++ b/Onboard/pypredict/lm/lm_dynamic.cpp
> +@@ -17,8 +17,6 @@
> +  * along with this program. If not, see <http://www.gnu.org/licenses/>.
> +  */
> +
> +-#include <error.h>
> +-
> + #include "lm_dynamic.h"
> +
> + using namespace std;
> +--
> +2.13.2
> +
> diff --git a/meta-xfce/recipes-apps/onboard/onboard/0002-onboard-onhover-=
seg-fault-fix.patch b/meta-xfce/recipes-apps/onboard/onboard/0002-onboard-o=
nhover-seg-fault-fix.patch
> new file mode 100644
> index 000000000..1ec195cb8
> --- /dev/null
> +++ b/meta-xfce/recipes-apps/onboard/onboard/0002-onboard-onhover-seg-fau=
lt-fix.patch
> @@ -0,0 +1,52 @@
> +From: 1be95325d320122efd5dedf7437839cfcca01f7a
> +From: https://github.com/void-linux/void-packages/commit/1be95325d320122=
efd5dedf7437839cfcca01f7a
> +Date: Mon, 23 Sep 2024
> +Subject: [PATCH] onboard: fix segfault when hovering over the keyboard
> +
> +Currently, if the mouse pointer is hovered over the Onboard keyboard, th=
e application crashes with a segmentation fault.
> +This is because the new_device_event function is not acquiring the GIL b=
efore creating a new object. This patch fixes
> +the issue by acquiring the GIL before creating a new object. It also acq=
uires the GIL before queueing the event.
> +This patch is taken from the fix provided in the following link:
> +https://github.com/void-linux/void-packages/commit/1be95325d320122efd5de=
df7437839cfcca01f7a
> +
> +Signed-off by: Pratheeksha S N <pratheeksha.s.n@ni.com>
> +
> +Upstream-Status: Inactive-Upstream [lastcommit: 2017-10-09]
> +
> +--- a/Onboard/osk/osk_devices.c
> ++++ b/Onboard/osk/osk_devices.c
> +@@ -97,13 +97,15 @@ osk_device_event_dealloc (OskDeviceEvent
> + static OskDeviceEvent*
> + new_device_event (void)
> + {
> +-    OskDeviceEvent *ev =3D PyObject_New(OskDeviceEvent, &osk_device_eve=
nt_type);
> ++    OskDeviceEvent *ev;
> ++    PyGILState_STATE gstate =3D PyGILState_Ensure();
> ++    ev =3D PyObject_New(OskDeviceEvent, &osk_device_event_type);
> +     if (ev)
> +     {
> +         osk_device_event_type.tp_init((PyObject*) ev, NULL, NULL);
> +-        return ev;
> +     }
> +-    return NULL;
> ++    PyGILState_Release(gstate);
> ++    return ev;
> + }
> +
> + static PyObject *
> +@@ -334,6 +336,7 @@ osk_devices_dealloc (OskDevices *dev)
> + static void
> + queue_event (OskDevices* dev, OskDeviceEvent* event, Bool discard_pendi=
ng)
> + {
> ++    PyGILState_STATE state =3D PyGILState_Ensure ();
> +     GQueue* queue =3D dev->event_queue;
> +     if (queue)
> +     {
> +@@ -364,6 +367,7 @@ queue_event (OskDevices* dev, OskDeviceE
> +         Py_INCREF(event);
> +         g_queue_push_head(queue, event);
> +     }
> ++    PyGILState_Release (state);
> + }
> +
> + static gboolean idle_process_event_queue (OskDevices* dev)
> diff --git a/meta-xfce/recipes-apps/onboard/onboard_1.4.1.bb b/meta-xfce/=
recipes-apps/onboard/onboard_1.4.1.bb
> new file mode 100644
> index 000000000..6a6346d8a
> --- /dev/null
> +++ b/meta-xfce/recipes-apps/onboard/onboard_1.4.1.bb
> @@ -0,0 +1,34 @@
> +SUMMARY =3D "An onscreen keyboard"
> +LICENSE =3D "GPL-3.0-only"
> +LIC_FILES_CHKSUM =3D "file://COPYING.GPL3;md5=3D8521fa4dd51909b407c51504=
98d34f4e"
> +
> +DEPENDS +=3D "gtk+3 hunspell libcanberra libxkbfile dconf python3-distut=
ils-extra-native intltool-native"
> +
> +SRC_URI =3D "https://launchpad.net/onboard/1.4/${PV}/+download/${BPN}-${=
PV}.tar.gz \
> +           file://0001-pypredict-lm-Define-error-API-if-platform-does-no=
t-h.patch \
> +              file://0002-onboard-onhover-seg-fault-fix.patch \
> +           "
> +SRC_URI[md5sum] =3D "1a2fbe82e934f5b37841d17ff51e80e8"

Drop md5sum, we do not need it these days.

> +SRC_URI[sha256sum] =3D "01cae1ac5b1ef1ab985bd2d2d79ded6fc99ee04b1535cc1b=
b191e43a231a3865"
> +
> +inherit features_check setuptools3 pkgconfig gtk-icon-cache gsettings mi=
me-xdg
> +
> +REQUIRED_DISTRO_FEATURES =3D "x11"
> +
> +FILES:${PN} +=3D " \
> +    ${datadir}/dbus-1 \
> +    ${datadir}/icons \
> +    ${datadir}/gnome-shell \
> +    ${datadir}/help \
> +"
> +
> +RDEPENDS:${PN} +=3D " \
> +    ncurses \
> +    python3-dbus \
> +    python3-pycairo \
> +    python3-pygobject \
> +"
> +
> +do_install:append() {
> +       install -Dm 0644 ${D}${PYTHON_SITEPACKAGES_DIR}${sysconfdir}/xdg/=
autostart/onboard-autostart.desktop ${D}${sysconfdir}/xdg/autostart/onboard=
-autostart.desktop
> +}
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#114085): https://lists.openembedded.org/g/openembedde=
d-devel/message/114085
> Mute This Topic: https://lists.openembedded.org/mt/109804526/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

