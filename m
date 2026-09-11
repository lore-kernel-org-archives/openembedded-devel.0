Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 031C4C88E58
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 14:18:06 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40462.1789136282462709907
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Sep 2026 07:18:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gmHLnb0Y;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-381b831d535so1666543a91.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2026 07:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789136282; x=1789741082; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DyQvTwEcwDB3ZYxLxDYrI0rDigmXCzK1vP/gyhVtXco=;
        b=gmHLnb0Yscy6H5Ty31AJutM0V3K3ERcyi66wVrZdMbpQblUd5cWpnPDK3RO86X0KUB
         NH5a64P3HG/+VLu3heyEuN+I7YWGGgsTg+KT6E7Z4AwUE4HgLT0nyneordT4n4TKtBVO
         a/8di9I3+la2ST1CE+6gud7kgF1JLZjWyNPArKWH9KcGctRa9WEjPCLr/DILvsHuTpx2
         sOqOMsW2KDNAXJCd3w4AN+NBufiMthpptkA/MdiVN837KPrfIdZxebp3q9Qj9GUL96FI
         5yCq/LlhptmCB+XOBBQxQPPRCWdvgNPrnuCiBPnb+jsfN93eXy1bQQ6fDGacIHow7GO/
         SaMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789136282; x=1789741082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DyQvTwEcwDB3ZYxLxDYrI0rDigmXCzK1vP/gyhVtXco=;
        b=mAQt9AbvodTz3tMyaHiaKU61/Kx+PWvJ8mnCaGp7ZP9oL24n4KHUHAN//s3hlJ+0Go
         ZLEnV3ZyEu7cVpzbx+M5aqyRwD9w0AOMsNKiLLl6uKxSeoOnQr2+1kOXuB3OfzpNWK68
         /1Un7OgGRMerkfMLNren4r+f+X3xVrdPlQi3Oy/WkvvQnYvj4JrKQSSGDx1UNe3XaEco
         DWCHnbSSTVs+I7ClHUh2KQi6QoRgmQZpIFCvlUgjFAUKFtG0THeu7AD+jDDwgrEb/1wR
         EnGIKUVMNmUyBOFncD8ZeRdJo+PgJ++JB6Inuxrr1oKpN2W/rJRYWsfCVeVDWjKyHD2t
         UWJw==
X-Gm-Message-State: AFuF++mSiahzROd+0mS+MUmf0rtvIRxhKY2IDg5UqhL3DbB+qI+hZKpC
	8DDb94od4bHhUPem+pAO0SA6E0aorquY7A86fQaHAp+smTu/vODzPKp+fOP+SA==
X-Gm-Gg: AYBFou1+V5p1YhezWTvbRl2zyy/+YF/3yedqmJ1ZVj8XmBzAUjhlddNPdheZGC/K7tT
	9nak1d7mfNf8wDwALZW0HyZg2qkeT9b3WJ7xl5wUX2P4R6clP0TKHtqJ5qL5394Ttre++6+NbbS
	m/taYXjcrvuJFFZ+DWioN110yQSfIa8LeI4NT40XX2mJLnlbTk8SQSKDawOhu2e1fAX5FYP20c2
	EDP0eG48BAu51aB78bQL1N05yB80yibFPHQFftWJA7EXlAxMHIZT9rU3SVpfMf1MxLarRjqxeNM
	OeSBbz4DeMlgKap//SCVYuycD6SlxhblcOICZaOKxoS0y3n0NpW4JmgeEMgtZzIyoEUyrHEKl47
	eJMyWSM1nh7b0HAAFKUgvTR8iYXWBSn6H67+HDHUa2kZmamnRzyRDDUVa79O+BrxBJvWbdmEGDw
	BPWuE0TA7U/uQoaDkaTW0zHiTtIC0oMkKk1VRG7Au3yO9ifSAGJGBmt71LAdJQzcxmFvUoJWCw+
	+aEeZi9N07Wr56pCZq5UUKNzvRZnQVK4PF74Ltdl6rbB3eKA4Vc8TfEDWNPIdJZtVlIX0rM0xEV
	d4nHz8FDwWDfKWr5mjLI4ge+zHqkPPIw7Jz3CsLVDVOxV0qgUcE61TuKTbtvCbyGJG2wpsjrIZV
	GMUaA65FsqRqttMX3v4lYdf74qp7M1iiqjaoQ6hdTAibmCPVxylPYGb3x
X-Received: by 2002:a17:90b:514b:b0:39b:ac66:bbc with SMTP id 98e67ed59e1d1-39d9bd5e466mr8163219a91.7.1789136281793;
        Fri, 11 Sep 2026 07:18:01 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4fa50efsm7840791eec.28.2026.09.11.07.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 07:18:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 3/7] mutter: only enable desktop OpenGL when x11 is in DISTRO_FEATURES
Date: Fri, 11 Sep 2026 07:17:52 -0700
Message-ID: <20260911141756.2275517-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911141756.2275517-1-khem.raj@oss.qualcomm.com>
References: <20260911141756.2275517-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2026 14:18:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129967

mutter fails to configure on a wayland-only distro configuration:

  Run-time dependency gl found: NO  (tried pkg-config and system)
  ../sources/mutter-50.4/meson.build:191:11: ERROR: Dependency "gl" not found (tried pkg-config and system)

The recipe enabled the opengl PACKAGECONFIG unconditionally, which
passes -Dopengl=true and makes meson require desktop OpenGL:

  have_gl = get_option('opengl')
  if have_gl
    gl_dep = dependency('gl')

Desktop GL is not available here. libGL.so and gl.pc are products of
mesa's GLX library - see FILES:libgl-mesa-dev in mesa.inc - and mesa
only builds GLX when its x11 PACKAGECONFIG is on, since
PACKAGECONFIG[x11] passes -Dglx=disabled when it is off. Without x11 in
DISTRO_FEATURES mesa is therefore configured -Dopengl=true -Dglx=disabled
-Dplatforms='wayland' and stages only egl.pc, glesv1_cm.pc and
glesv2.pc, with no libGL and no gl.pc.

The dependency looked satisfied because mesa PROVIDES virtual/libgl
unconditionally, so the virtual/libgl entry in PACKAGECONFIG[opengl]
resolves at the bitbake level even though nothing ever lands in the
sysroot. mesa also installs the GL/*.h headers regardless of GLX, so
meson's 'system' fallback clears the header probe before failing on the
missing library.

mutter builds fine against GLESv2 alone - it only errors out if neither
GL nor GLES2 is enabled - and egl plus gles2 are already enabled here,
which is the usual configuration for a wayland-only compositor. Gate
opengl on x11 so it follows the same condition that decides whether
desktop GL exists at all; x11 builds are unaffected.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gnome/mutter/mutter_50.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/mutter/mutter_50.4.bb b/meta-gnome/recipes-gnome/mutter/mutter_50.4.bb
index 91ba3f5489..f9b3e9d5e5 100644
--- a/meta-gnome/recipes-gnome/mutter/mutter_50.4.bb
+++ b/meta-gnome/recipes-gnome/mutter/mutter_50.4.bb
@@ -46,7 +46,7 @@ PACKAGECONFIG ??= " \
     native-backend \
     egl \
     gles2 \
-    opengl \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'opengl', '', d)} \
     fonts \
     bash-completion \
     gnome-desktop \

