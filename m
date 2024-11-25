Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EADEDD58D73
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 17:52:05 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web10.24741.1732557117848934159
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Nov 2024 09:51:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KUUqPbyK;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6d846307673so14288956d6.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Nov 2024 09:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732557117; x=1733161917; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G8UCB3LSbE4ABk+wYL4CnWDqI0LSpcM5DCfw0n/OQLo=;
        b=KUUqPbyKsBFTBPldBBw6d+5Xb6aCTytUVDSlU46Riw3v3ft9LpbuFR8OOnIKwOYoLz
         AcOIVcvlohvR5oAvhWY8HDaxFyboTRXu7Z0UQUjnGm6qD8NziY8/Ib36WtN7dkMUNdsw
         RlvpyqQbEF4US5yagjZ6+dojVVG1D6F/KmrEE147POgxJjxxonNFkPhdX7sqqBONqTwv
         BTo68Ue27BbZpQrN9Jvtn7tEu01/ULrI+o3knDvs6AnljE3/fTC8RNE6HpaSGF0gxKK+
         P84nqvrbNUPW/vLGGiSnMG/Fh5Z7nlmFaeszqJdMHKkNLL/dK4lNQiZ3ZWl/8nCr9OkI
         6WBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732557117; x=1733161917;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G8UCB3LSbE4ABk+wYL4CnWDqI0LSpcM5DCfw0n/OQLo=;
        b=UNqoTuzw9Ex2cuD0ZtSX/ddIkHe/aCdB8c+uFhDLRQy9kBgjoqB4NY0exMzg7JCcks
         SA4yZ2aUJ+Ar6Q0ZhJq7WWpyIgfmDYpNhMcTxE5Gqg904p5YaMQcCj8pVyvPxxmwqAVS
         35NhHtY0oXqLHWwLJMoboQ7a5f+OiLrutjqFulQStd4kfKvUiMmb+mSbNwxcQBUqJSZR
         gzoII60OXDbkmVMtIGtJJWGsIYFuyS8ADIlDabOjtdBgarq6j2W3Ysv49Hr8D6dXqDei
         qYNawVZDQwbMamVmV5aadNlsg9uft4Xs9pWBjxcC+xbPEB7UHXcf1v+Ut9j5YeS3lhlt
         1Zug==
X-Gm-Message-State: AOJu0YyRo/cBxJneSMgIWQGRMZjzagnyemOhSIJ2JHjek/ueP6KUboVg
	uFPKN5J1rdD0ZC3vmZR0w9XtV6W4Ag6m6BPdMbbKimYq/0a6Gni2b5cINOgt3MVyR737sLEGGVq
	cEzsW4jbC6J7jEeuN03PygEigeEI=
X-Gm-Gg: ASbGncvTs9WmZa2sWKaS5XbTQPEAyac5vQNoktDK0qopf8m6K8EIuJC6HS8TXH9eSOy
	ZjWEWlT2GS9jeoqNWQ8XiYSDa+hZWLgxyi4Wsw/FYDEbZz1qXgEC0V1up9BcAi0VHTA==
X-Google-Smtp-Source: AGHT+IGF6sTnn0M0ZToxoP20vwtem/+x75dEDVDbTd7ujeiPB8qWfqZBs/DYiA2FjRhDRSC4eIud+GgIdV63IAmrAzw=
X-Received: by 2002:ad4:5cac:0:b0:6cc:41cc:cab6 with SMTP id
 6a1803df08f44-6d450ea4648mr247836256d6.23.1732557115336; Mon, 25 Nov 2024
 09:51:55 -0800 (PST)
MIME-Version: 1.0
References: <20241125172401.596324-1-pratheeksha.s.n@ni.com>
In-Reply-To: <20241125172401.596324-1-pratheeksha.s.n@ni.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 25 Nov 2024 18:51:44 +0100
Message-ID: <CANNYZj-=wQAoqATb--x_r9YUnZg_DzLd4ZLHP6yXAvHvpp5d5Q@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH] Onboard: Add onboard virtual keyboard
To: pratheeksha.s.n@ni.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Nov 2024 17:52:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114046

This is a defunct Ubuntu project. Is there a reason it should be added
to meta-gnome, as gnome provides its own implementation of the on
screen keyboard?

Alex

On Mon, 25 Nov 2024 at 18:24, pratheekshasn via lists.openembedded.org
<pratheeksha.s.n=ni.com@lists.openembedded.org> wrote:
>
> Signed-off by: Pratheeksha S N <pratheeksha.s.n@ni.com>
> ---
>  ...ine-error-API-if-platform-does-not-h.patch | 70 +++++++++++++++++++
>  .../0002-onboard-onhover-seg-fault-fix.patch  | 52 ++++++++++++++
>  .../recipes-support/onboard/onboard_1.4.1.bb  | 34 +++++++++
>  3 files changed, 156 insertions(+)
>  create mode 100644 meta-gnome/recipes-support/onboard/onboard/0001-pypredict-lm-Define-error-API-if-platform-does-not-h.patch
>  create mode 100644 meta-gnome/recipes-support/onboard/onboard/0002-onboard-onhover-seg-fault-fix.patch
>  create mode 100644 meta-gnome/recipes-support/onboard/onboard_1.4.1.bb
>
> diff --git a/meta-gnome/recipes-support/onboard/onboard/0001-pypredict-lm-Define-error-API-if-platform-does-not-h.patch b/meta-gnome/recipes-support/onboard/onboard/0001-pypredict-lm-Define-error-API-if-platform-does-not-h.patch
> new file mode 100644
> index 000000000..3f4145264
> --- /dev/null
> +++ b/meta-gnome/recipes-support/onboard/onboard/0001-pypredict-lm-Define-error-API-if-platform-does-not-h.patch
> @@ -0,0 +1,70 @@
> +From 1c95f64aa342147387ce4b1b7269a5c8b34bd898 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Thu, 13 Jul 2017 09:01:04 -0700
> +Subject: [PATCH] pypredict/lm: Define error API if platform does not have it
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
> +diff --git a/Onboard/pypredict/lm/lm_dynamic.cpp b/Onboard/pypredict/lm/lm_dynamic.cpp
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
> diff --git a/meta-gnome/recipes-support/onboard/onboard/0002-onboard-onhover-seg-fault-fix.patch b/meta-gnome/recipes-support/onboard/onboard/0002-onboard-onhover-seg-fault-fix.patch
> new file mode 100644
> index 000000000..1ec195cb8
> --- /dev/null
> +++ b/meta-gnome/recipes-support/onboard/onboard/0002-onboard-onhover-seg-fault-fix.patch
> @@ -0,0 +1,52 @@
> +From: 1be95325d320122efd5dedf7437839cfcca01f7a
> +From: https://github.com/void-linux/void-packages/commit/1be95325d320122efd5dedf7437839cfcca01f7a
> +Date: Mon, 23 Sep 2024
> +Subject: [PATCH] onboard: fix segfault when hovering over the keyboard
> +
> +Currently, if the mouse pointer is hovered over the Onboard keyboard, the application crashes with a segmentation fault.
> +This is because the new_device_event function is not acquiring the GIL before creating a new object. This patch fixes
> +the issue by acquiring the GIL before creating a new object. It also acquires the GIL before queueing the event.
> +This patch is taken from the fix provided in the following link:
> +https://github.com/void-linux/void-packages/commit/1be95325d320122efd5dedf7437839cfcca01f7a
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
> +-    OskDeviceEvent *ev = PyObject_New(OskDeviceEvent, &osk_device_event_type);
> ++    OskDeviceEvent *ev;
> ++    PyGILState_STATE gstate = PyGILState_Ensure();
> ++    ev = PyObject_New(OskDeviceEvent, &osk_device_event_type);
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
> + queue_event (OskDevices* dev, OskDeviceEvent* event, Bool discard_pending)
> + {
> ++    PyGILState_STATE state = PyGILState_Ensure ();
> +     GQueue* queue = dev->event_queue;
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
> diff --git a/meta-gnome/recipes-support/onboard/onboard_1.4.1.bb b/meta-gnome/recipes-support/onboard/onboard_1.4.1.bb
> new file mode 100644
> index 000000000..6a6346d8a
> --- /dev/null
> +++ b/meta-gnome/recipes-support/onboard/onboard_1.4.1.bb
> @@ -0,0 +1,34 @@
> +SUMMARY = "An onscreen keyboard"
> +LICENSE = "GPL-3.0-only"
> +LIC_FILES_CHKSUM = "file://COPYING.GPL3;md5=8521fa4dd51909b407c5150498d34f4e"
> +
> +DEPENDS += "gtk+3 hunspell libcanberra libxkbfile dconf python3-distutils-extra-native intltool-native"
> +
> +SRC_URI = "https://launchpad.net/onboard/1.4/${PV}/+download/${BPN}-${PV}.tar.gz \
> +           file://0001-pypredict-lm-Define-error-API-if-platform-does-not-h.patch \
> +              file://0002-onboard-onhover-seg-fault-fix.patch \
> +           "
> +SRC_URI[md5sum] = "1a2fbe82e934f5b37841d17ff51e80e8"
> +SRC_URI[sha256sum] = "01cae1ac5b1ef1ab985bd2d2d79ded6fc99ee04b1535cc1bb191e43a231a3865"
> +
> +inherit features_check setuptools3 pkgconfig gtk-icon-cache gsettings mime-xdg
> +
> +REQUIRED_DISTRO_FEATURES = "x11"
> +
> +FILES:${PN} += " \
> +    ${datadir}/dbus-1 \
> +    ${datadir}/icons \
> +    ${datadir}/gnome-shell \
> +    ${datadir}/help \
> +"
> +
> +RDEPENDS:${PN} += " \
> +    ncurses \
> +    python3-dbus \
> +    python3-pycairo \
> +    python3-pygobject \
> +"
> +
> +do_install:append() {
> +       install -Dm 0644 ${D}${PYTHON_SITEPACKAGES_DIR}${sysconfdir}/xdg/autostart/onboard-autostart.desktop ${D}${sysconfdir}/xdg/autostart/onboard-autostart.desktop
> +}
> --
> 2.43.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#114045): https://lists.openembedded.org/g/openembedded-devel/message/114045
> Mute This Topic: https://lists.openembedded.org/mt/109720017/1686489
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

