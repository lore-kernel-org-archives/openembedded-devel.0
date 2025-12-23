Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC58DE6F06C
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 09:06:42 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.97711.1766480801509944506
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Dec 2025 01:06:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dcRI+8u7;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47aa03d3326so30408545e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 01:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766480800; x=1767085600; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IAUun1l0BkZpzN9HyBa9EAxdNdP900wHrMB0nrIxB5M=;
        b=dcRI+8u7J2gI3fAkSNRCpYEIZ9/c5L3hBlkgvmK/AOH+5YZbNEb3QCPr6E1rM9LSIT
         PsO7SiJGg4aDXdkM5S2yLm69Ogsp2a1mp7mnLVc9OltabhY0BAc/N4mG4/Pj4wcGKmIH
         S8xx0xviO6lIz7MbBSzSY21mYoJWKV+/N2npsPBnS/4QkvPjP6CffjAIQV43n6urTkR+
         sJ1UrFDLxgqJxZiiXGW/2EmD89yCtyLZIp6SLLrkkXeAxdpx9PUNIUq5GUDEe0bx32+1
         sT/A+8mjHDaqNXm1BsGJexWYP6B8IS+O9y5jfOStzR3agewFs98v7zsu2QrL0J1SbO81
         koGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766480800; x=1767085600;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IAUun1l0BkZpzN9HyBa9EAxdNdP900wHrMB0nrIxB5M=;
        b=dE6R5EGt1GsLzGV7/EODXS7iUjgwd7JmlA8UfW1huRnruJOO/Fh/umdJZol7zIVxr/
         40jP1nTjV/21/CEvHVaHdn78TUVyy71IjUqp8Egcce83EENsU7+B6acpU9thyAFsyH89
         Xntb0ZekwNyMWw4zNc0l3Jbd3jWD/zNPa+CjZB+KdTBR4f/l5QUzlI6VnTE5f0+SYM41
         DoPuR8laWZNkPaIJmia9WXOVbvhRQRUWb3R1/ck8P4m1cOc1/x4V0INK6O3X2t1uBNXk
         LRea9gN73S7AVbeup/BrbQZQsK5cq0EmX1IRurIf1dHNxEIog1AtqiEAJ3ST80TurgXn
         8mlg==
X-Forwarded-Encrypted: i=1; AJvYcCUxAKTaG0vXg6vdEzpSzJ2K+p7KtNp9io4obWSSUofBwwtTcYrccgBJXFK7LyB1qTMw1TGFn5nZuUnW6/IIzoihgJ4=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy3qTbJ3EWP3CqvLl78suP2A1MhP8DVKOUrBQjME3UQ2vmO4y5r
	g+QwZ9IK4PKBzDVHauuY0cOKJojJp2SRxWxbN4RqDwVaG/SfQsyp1x7m
X-Gm-Gg: AY/fxX7IPoGFMhGz08Qmxa4Gs4+g9rW72JmEcq3Vx+g5jRyDu5SbP/BOnXttybILNQn
	oFixv+cMtz3rwFHzRClmwlruG3chDFNqERQoByY6cXrkLNZGnC7tii2z3WzjEha2ZsT9fzyvo9O
	qzkulAl+r2xO1O/vq3V+EryvsnrpwO8phnYZH08Uevk80hc9upS1dXEQhla8Ymm+ehBk1EZLGGv
	03TmEjcqr+g68VnB5UDmVPBKhhxcQP5QoYx7+nTd0cKa/h8Z6u4sD2QLzx6VI78yNeASUbw6Ocu
	Qk+dD0zBvD5GRRGuWwBAt8UgiTU3/xe70Hht6LmfBtF5CxtytmtzAfKPIgngiPWpAk8YyOsyjrj
	q+9vfr3cL7eKGQDIaQMzk/7r1+NMXPBAvUP7oGtJjRu2kWRqMWZOyBM13H11STEHpW/o9OlIbTu
	4azkS1QT18XQz5GhpXFSo=
X-Google-Smtp-Source: AGHT+IG5cc7dzzfeBrvXqYZDySzN5aMLwjJ17EivWELmV/y0GfL5xx/ojAaUGwixyjzfh2OWOVd7HQ==
X-Received: by 2002:a05:600c:4fc6:b0:477:8b77:155f with SMTP id 5b1f17b1804b1-47d1953865fmr118377505e9.8.1766480799587;
        Tue, 23 Dec 2025 01:06:39 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d5372sm244393345e9.14.2025.12.23.01.06.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 01:06:37 -0800 (PST)
Message-ID: <a90d0088-cc50-43b7-8ed5-b00a1a6a72b4@gmail.com>
Date: Tue, 23 Dec 2025 10:06:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOWbnuWkjTogW29lXVttZXRhLW9lXVtQQVRDSCAxLzddIGZsYXRw?=
 =?UTF-8?Q?ak=3A_upgrade_1=2E17=2E0_-=3E_1=2E17=2E2?=
To: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <20251223061043.659-1-liuyd.fnst@fujitsu.com>
 <eee72995-6e86-4d6c-aa98-8cd960865afe@gmail.com>
 <OS7PR01MB1148635B51419C643A7704FB89BB5A@OS7PR01MB11486.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <OS7PR01MB1148635B51419C643A7704FB89BB5A@OS7PR01MB11486.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 09:06:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122831

On 12/23/25 09:29, Yiding Liu (Fujitsu) wrote:
> Hi Sarvari
>
>    In 1.17.2 meson.build shows that curl always be a dependency
>
>    libcurl_dep = dependency('libcurl', version : '>=7.29.0').
>
>    So maybe I should add curl to DEPENDS in bb file?
>

Looking at it, I believe appstream brings curl into the recipe sysroot,
which is a standard dependency for this recipe, and that's why it
doesn't fail to compile.
I think it would be nice to add curl explicitly to DEPENDS, but at the
end of the day I wouldn't block this patch because of this.

> ------------------------------------------------------------------------
> *发件人:* Gyorgy Sarvari <skandigraun@gmail.com>
> *发送时间:* 2025年12月23日 15:24
> *收件人:* Liu, Yiding/刘 乙丁 <liuyd.fnst@fujitsu.com>;
> openembedded-devel@lists.openembedded.org
> <openembedded-devel@lists.openembedded.org>
> *主题:* Re: [oe][meta-oe][PATCH 1/7] flatpak: upgrade 1.17.0 -> 1.17.2
>  
> On 12/23/25 07:10, Yiding Liu (Fujitsu) via lists.openembedded.org wrote:
> > 1. Changelog:
> >     https://github.com/flatpak/flatpak/releases/tag/1.17.2
> <https://github.com/flatpak/flatpak/releases/tag/1.17.2>
> >
> > 2. Update 0001-flatpak-pc-add-pc_sysrootdir.patch for 1.17.2
> >
> > 3. Remove http_backend related options as they were removed in 1.17.2
> >
> > Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> > ---
> >  .../flatpak/0001-flatpak-pc-add-pc_sysrootdir.patch   | 11 +++++++----
> >  .../flatpak/{flatpak_1.17.0.bb => flatpak_1.17.2.bb}  |  7 ++-----
> >  2 files changed, 9 insertions(+), 9 deletions(-)
> >  rename meta-oe/recipes-extended/flatpak/{flatpak_1.17.0.bb =>
> flatpak_1.17.2.bb} (90%)
> >
> > diff --git
> a/meta-oe/recipes-extended/flatpak/flatpak/0001-flatpak-pc-add-pc_sysrootdir.patch
> b/meta-oe/recipes-extended/flatpak/flatpak/0001-flatpak-pc-add-pc_sysrootdir.patch
> > index 08d5625fa7..6207ae617b 100644
> > ---
> a/meta-oe/recipes-extended/flatpak/flatpak/0001-flatpak-pc-add-pc_sysrootdir.patch
> > +++
> b/meta-oe/recipes-extended/flatpak/flatpak/0001-flatpak-pc-add-pc_sysrootdir.patch
> > @@ -7,22 +7,25 @@ Signed-off-by: Markus Volk <f_l_k@t-online.de>
> >  ---
> >  Upstream-Status: Inappropriate [oe-specific]
> > 
> > +Update for 1.17.2.
> > +Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> > +---
> >   meson.build | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> >  diff --git a/meson.build b/meson.build
> > -index 4a0b865e..5f69b1d9 100644
> > +index e97b8cef..5c8de55f 100644
> >  --- a/meson.build
> >  +++ b/meson.build
> > -@@ -509,7 +509,7 @@ pkgconfig_variables += 'exec_prefix=${prefix}'
> > +@@ -515,7 +515,7 @@ pkgconfig_variables += 'exec_prefix=${prefix}'
> >   pkgconfig_variables += 'datadir=' + ('${prefix}' /
> get_option('datadir'))
> >  
> >   pkgconfig_variables += 'datarootdir=' + ('${prefix}' /
> get_option('datadir'))
> >  -pkgconfig_variables += 'interfaces_dir=${datadir}/dbus-1/interfaces/'
> >  +pkgconfig_variables +=
> 'interfaces_dir=${pc_sysrootdir}${datadir}/dbus-1/interfaces/'
> > - pkgconfig_variables += 'httpbackend=' + get_option('http_backend')
> >  
> >   pkgconfig.generate(
> > +   libflatpak,
> >  --
> > -2.34.1
> > +2.43.0
> > 
> > diff --git a/meta-oe/recipes-extended/flatpak/flatpak_1.17.0.bb
> b/meta-oe/recipes-extended/flatpak/flatpak_1.17.2.bb
> > similarity index 90%
> > rename from meta-oe/recipes-extended/flatpak/flatpak_1.17.0.bb
> > rename to meta-oe/recipes-extended/flatpak/flatpak_1.17.2.bb
> > index a51937ea72..b5803e00a4 100644
> > --- a/meta-oe/recipes-extended/flatpak/flatpak_1.17.0.bb
> > +++ b/meta-oe/recipes-extended/flatpak/flatpak_1.17.2.bb
> > @@ -4,11 +4,11 @@ LICENSE = "LGPL-2.1-only"
> >  LIC_FILES_CHKSUM =
> "[file://COPYING;md5=4fbd65380cdd255951079008b364516c]file://COPYING;md5=4fbd65380cdd255951079008b364516c"
> > 
> >  SRC_URI = " \
> > -    git://github.com/flatpak/flatpak;protocol=https;branch=main \
> > +   
> git://github.com/flatpak/flatpak;protocol=https;branch=main;tag=${PV} \
> >      file://0001-flatpak-pc-add-pc_sysrootdir.patch
> <file://0001-flatpak-pc-add-pc_sysrootdir.patch> \
> >  "
> > 
> > -SRCREV = "0835c0272f3a0389f97b02cad4b208f80fec99ed"
> > +SRCREV = "20599618d623630f7aa38d61a2bb81d86fb25f09"
> > 
> > 
> >  inherit meson pkgconfig gettext systemd gtk-doc
> gobject-introspection python3native mime features_check useradd
> > @@ -49,11 +49,9 @@ GTKDOC_MESON_OPTION = 'gtkdoc'
> >  GTKDOC_MESON_ENABLE_FLAG = 'enabled'
> >  GTKDOC_MESON_DISABLE_FLAG = 'disabled'
> > 
> > -PACKAGECONFIG[curl] = "-Dhttp_backend=curl,,curl"
>
> Didn't curl turn into an unconditional dependency, which should be
> always present now? (Or maybe it is pulled in indirectly by another
> dependency?)
>
> >  PACKAGECONFIG[dconf] = "-Ddconf=enabled,-Ddconf=disabled,dconf"
> >  PACKAGECONFIG[docbook_docs] =
> "-Ddocbook_docs=enabled,-Ddocbook_docs=disabled,xmlto-native"
> >  PACKAGECONFIG[man] = "-Dman=enabled,-Dman=disabled,libxslt-native"
> > -PACKAGECONFIG[soup] = "-Dhttp_backend=soup,,libsoup-2.4"
> >  PACKAGECONFIG[tests] = "-Dtests=true,-Dtests=false,xauth socat-native"
> >  PACKAGECONFIG[xauth] = "-Dxauth=enabled,-Dxauth=disabled,xauth"
> >  PACKAGECONFIG[seccomp] =
> "-Dseccomp=enabled,-Dseccomp=disabled,libseccomp"
> > @@ -62,7 +60,6 @@ PACKAGECONFIG[selinux] =
> "-Dselinux_module=enabled,-Dselinux_module=disabled,lib
> >  PACKAGECONFIG[wayland-security-context] =
> "-Dwayland_security_context=enabled,-Dwayland_security_context=disabled,wayland
> wayland-native wayland-protocols"
> > 
> >  PACKAGECONFIG ?= " \
> > -    curl \
> >      ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xauth', '', d)} \
> >      ${@bb.utils.contains('DISTRO_FEATURES', 'seccomp', 'seccomp',
> '', d)} \
> >      ${@bb.utils.contains('DISTRO_FEATURES', 'wayland',
> 'wayland-security-context', '', d)} \
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#122817):
> https://lists.openembedded.org/g/openembedded-devel/message/122817
> <https://lists.openembedded.org/g/openembedded-devel/message/122817>
> > Mute This Topic: https://lists.openembedded.org/mt/116912723/6084445
> <https://lists.openembedded.org/mt/116912723/6084445>
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe:
> https://lists.openembedded.org/g/openembedded-devel/unsub
> <https://lists.openembedded.org/g/openembedded-devel/unsub> [skandigraun@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>


