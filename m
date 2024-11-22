Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23428E69180
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 16:29:27 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web10.28450.1732292963739383024
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Nov 2024 08:29:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UozcPJGN;
 spf=pass (domain: gmail.com, ip: 209.85.210.54, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7183a3f3beaso1180359a34.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 Nov 2024 08:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732292963; x=1732897763; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6rJfqM/x22uKtv468a8KAlX6tYSdvLyBz+SsLBDSs9Y=;
        b=UozcPJGNwMo7F8FNRiKSDF7e5lKGMSwUdOvQmtoIUZfBO2YlnJ9pSq95wcAEkkoghi
         HMtSZOJTiVVeGnhqWjFNMqKB2iwy12UhLnqLpetouUq+Oz5NHPa7M9eCJ74mDMbUQvZ1
         VOyRuqmp6cU7cg8kZbVtiK3T91z81UQl7+95AdZvHVDVmhaW5algvhTQ1v/7tVNYWll/
         UuwKbntmTbhoK5AL/OWkUeA+dIrydh7B1KDmc1/rOL9lwlyxVFKy3+rCLvabAlXJSQR9
         hoWS01PRjxdNDrbq3H4Vdgh/i4KO+ET62E+VzX0LM3+lkTy4H7EcXk91GxfKSSd/PyQJ
         M9Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732292963; x=1732897763;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6rJfqM/x22uKtv468a8KAlX6tYSdvLyBz+SsLBDSs9Y=;
        b=p5odlk7JjD9XcXJbcs6Q/YDxryYXfa4m41Edf5fc44+rcxgFfO930+gC51qH1H+Y++
         j6D+PIo/03SFrY8Lm2BbYG8zx/833WviaiOsTbwjecyaypH9pVcsBQamod0VbzD28LAN
         OPomqIX4daNf1CNRTsXaPnasloE2Rae2vrlVX7QamsAMxRIXjUJa6Wp4woGbbpGV2Aw1
         2Ov/sLLEx0luvBLiNEqZ7MJgvOIjgA1ccjnlIlToVOtVQytAj+CFzNq+BiIr2orJkgik
         SNNM8qeffSBasFR7N4iwaR0KVXy9FcH7xbNY4kINBHvpwmX/yYK1zujsB1FJfftZ4sJI
         U9tg==
X-Gm-Message-State: AOJu0Yx4DpKfjag/ZisSmdG2o/xfaya9xQdL3Wwvw0LTpK/kHsHjDyoc
	1XxF4re/fR072P5tNxw3CzFg0/s/jRPoR7e9DD+PXYAaGNdRe/N4VlRUEpUoqab6SmPT42dLui/
	BD0uSoWyZXbZptZnqhCTqvjZkMXo=
X-Gm-Gg: ASbGncsoxAlVoZEfXRSc16BgANL9UNJBopeKWK6cgc2hgHPyVYRJ4FtvYBvb/2dLjQI
	IsemnuFsrwMfJLlmFHaWgT02UeC9ToBI/JCyFu/7pdqzBO5fiWPo96kSDlYH5GTs9
X-Google-Smtp-Source: AGHT+IEVbBxmA2nx1xh3AXHMLCAPRoSP2gAT8PSjpLjTHumCnv+F2p8gvi2VwaC66iQLrwy4nzhqaVoqcMHEzRJPR3A=
X-Received: by 2002:a05:6830:670b:b0:718:a7e:85f4 with SMTP id
 46e09a7af769-71c04cd9ed2mr4206564a34.24.1732292962117; Fri, 22 Nov 2024
 08:29:22 -0800 (PST)
MIME-Version: 1.0
References: <20241122100810.3460864-1-pratheeksha.s.n@ni.com>
In-Reply-To: <20241122100810.3460864-1-pratheeksha.s.n@ni.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 Nov 2024 08:28:56 -0800
Message-ID: <CAMKF1sp9mhyEyff5nWPrP9C8VeV_VjNJjePXrrCk-QJjp24Mpw@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH] Onboard: Add onboard virtual keyboard
To: pratheeksha.s.n@ni.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Nov 2024 16:29:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114002

On Fri, Nov 22, 2024 at 2:08=E2=80=AFAM pratheekshasn via
lists.openembedded.org <pratheeksha.s.n=3Dni.com@lists.openembedded.org>
wrote:
>
> Signed-off by: Pratheeksha S N <pratheeksha.s.n@ni.com>
> ---
>  ...ine-error-API-if-platform-does-not-h.patch | 67 +++++++++++++++++++
>  .../0002-onboard-onhover-seg-fault-fix.patch  | 52 ++++++++++++++
>  .../recipes-support/onboard/onboard_1.4.1.bb  | 36 ++++++++++
>  3 files changed, 155 insertions(+)
>  create mode 100644 meta-gnome/recipes-support/onboard/onboard/0001-pypre=
dict-lm-Define-error-API-if-platform-does-not-h.patch
>  create mode 100644 meta-gnome/recipes-support/onboard/onboard/0002-onboa=
rd-onhover-seg-fault-fix.patch
>  create mode 100644 meta-gnome/recipes-support/onboard/onboard_1.4.1.bb
>
> diff --git a/meta-gnome/recipes-support/onboard/onboard/0001-pypredict-lm=
-Define-error-API-if-platform-does-not-h.patch b/meta-gnome/recipes-support=
/onboard/onboard/0001-pypredict-lm-Define-error-API-if-platform-does-not-h.=
patch
> new file mode 100644
> index 000000000..fda37895c
> --- /dev/null
> +++ b/meta-gnome/recipes-support/onboard/onboard/0001-pypredict-lm-Define=
-error-API-if-platform-does-not-h.patch
> @@ -0,0 +1,67 @@
> +From 1c95f64aa342147387ce4b1b7269a5c8b34bd898 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Thu, 13 Jul 2017 09:01:04 -0700
> +Subject: [PATCH] pypredict/lm: Define error API if platform does not hav=
e it
> +
> +error() API is not implemented across all libcs on linux
> +e.g. musl does not provide it.
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
> diff --git a/meta-gnome/recipes-support/onboard/onboard/0002-onboard-onho=
ver-seg-fault-fix.patch b/meta-gnome/recipes-support/onboard/onboard/0002-o=
nboard-onhover-seg-fault-fix.patch
> new file mode 100644
> index 000000000..1ec195cb8
> --- /dev/null
> +++ b/meta-gnome/recipes-support/onboard/onboard/0002-onboard-onhover-seg=
-fault-fix.patch
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
> diff --git a/meta-gnome/recipes-support/onboard/onboard_1.4.1.bb b/meta-g=
nome/recipes-support/onboard/onboard_1.4.1.bb
> new file mode 100644
> index 000000000..359a2134e
> --- /dev/null
> +++ b/meta-gnome/recipes-support/onboard/onboard_1.4.1.bb
> @@ -0,0 +1,36 @@
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
> +       install -d ${D}${sysconfdir}/xdg/autostart
> +
> +       mv ${D}${PYTHON_SITEPACKAGES_DIR}${sysconfdir}/xdg/autostart/onbo=
ard-autostart.desktop ${D}${sysconfdir}/xdg/autostart

Use a single line to create the dir and copy the file.

Install -Dm 0644
${D}${PYTHON_SITEPACKAGES_DIR}${sysconfdir}/xdg/autostart/onboard-autostart=
.desktop
${D}${sysconfdir}/xdg/autostart/onboard-autostart.desktop

> +}
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#113995): https://lists.openembedded.org/g/openembedde=
d-devel/message/113995
> Mute This Topic: https://lists.openembedded.org/mt/109720017/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

