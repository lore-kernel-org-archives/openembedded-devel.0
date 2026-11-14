Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3105.1794685068994947561
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 11:37:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=RwbeuEyo;
 spf=pass (domain: gmail.com, ip: 74.125.82.49, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so2358508c88.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 11:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794685068; x=1795289868; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lp2/HvCLA10dCM18L+djH9htqmCuiWfYqlwVauwApcc=;
        b=RwbeuEyoDJRlcOeYzLKUccrhYoypyakr2Jwnj0RvamI7LDovnV+tj0aYSPDZ3yOQWW
         y+AUVRO1NBTxmiVzfALBULa1m8BqmzUtbyNI31KkGiLYhPwDbBJ1QBxlRdQYtCPTuwOH
         Ot+ObJ/IQxoB80g1eBfJUH2gK9KYQfOUiyhpv/NntckWQ2S7loFJkplBXIptZAB10pnU
         1nnwHPj37fh/NyI1qrsa7ovDB2KwOT2kcKVrLHvV9bI5KQ9eAY1fRldTigNfUqs9cZSk
         T13s+fe2mfbZ7qayQuGpz16UUHkSeQpkDpoyB0ranHiPRmHhnU7jLgoBHmNG1kdmA1eb
         bCFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794685068; x=1795289868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lp2/HvCLA10dCM18L+djH9htqmCuiWfYqlwVauwApcc=;
        b=nusA2zSBXbXJZLf2CwVK8SRg2aTbe/ypmwWsCEdo3QAJheR8V3clLmgFQsXWxmPlsz
         VvjWw94ob2lsdf2bF11KDlqgzKjMmoue8vvA6YvCA/OI/uAaV57GTC1vOl0+N267JvVt
         yOEZGDWqvOoM0AtOZSfytb1EU+xmYwDSyjtied8RofdUnEkcyscWufJwJC1KFg5uq4VD
         SMx2pIGN+D6Yc7zwcA9V08qh2m9s5y7nSSRnk2Al54KYfTp9MN1qL/C4RkRgFL9bPwWm
         MZPe4WJOI7xiJIwlua062GGT0ZH6fs87vPKzo+Ry/012E1Ud/3L/hXs9Hy7xQ4hEt3tG
         eMlA==
X-Gm-Message-State: APuU4Z/xBNebfYFXb4fB2sjL7og5UFayAMcamZLt6NLAvOn3p44zi7Gb
	d5AlH+IYKek6vJKwVkTaxvj/Fue9DL1BCXUsUVuqoX3cLCxDblpYCkXoBg4H/DXS
X-Gm-Gg: AYBFou3sBTWrA0ic5Vm4+0NdsHGCsbQAT5sGr81oOW2no23j4OFmovCY1Q4Ob3hsIfT
	cdDpokjijiZB18s/HhoF6FaYSGDO3KqhZLY7iYNx/DvJk1D4xm9hd1Vg7mOp2H7LtJWQKceRG1u
	7rKzDaqvO21TVYPuI7BYR3jvvzGFiH7QjV63sNGfr7C8pu/nUFQBF9EjFc351aZYGNOygGeBSzm
	aBGVlVT1zzbZrsp1D1Mx8R9/aS8vo7MM7hiLty56EwlQ6bitCZvn1QnKJJQoVJxiwmRn5Fvn92+
	hk3SHpvmYEtsHiQtOf4XHquavq8wLyfVOtkf8xBLnzZBc7mbhEYfJ4f+XawcEvYaGYhtawRthMq
	+dP9qBjgFHOFM3YEWHhnH94Wh1sELYXieYtAP95uxQZSBqSd+fSEIdLzuXJOOMPNnwyLB+EpqaO
	GcsNgur4L9RvtN4144vSkoSpfy6Z6GhSkPykyO7gzf+yB14SVbKVEVAryu85HtIeYzhfnPexJM+
	Wc2LTxJK3Os9XcP69BEiaToqCSmc/WcXpDwyGeFbxbKWHLRX4GVnd3PpobQ3ZGeU4KfVVYtZMEj
	D5KxGz0E4YnGZYrxR7ivTuCU+Y8L6Vy8b7pY8WMBpzIT8Nok1X/uHpbphX/5aWxVSlljj5/d4c3
	QECZ1iGwu2gkIGHJicB46the9ccK4pbYvdrqL01SoBctrbiCtmHlI8odmbLLAnudzZMH+xTIJsL
	CbuDi6qS11K7rtLB0/lPV8lYp6ZzV9HjnSndnsgdv8xJLOpMmvPoja7Jb8RojHAcpYy2Y6v5r9t
	coSyOJM8bhvsXHO/XRfcQ0ErjvAchQz2TKtsVpL4fF2LczNZDad5oCoNjD6VR/63DI/qnPxRWwd
	FI9d
X-Received: by 2002:a05:7300:4faf:b0:369:f961:ccf8 with SMTP id 5a478bee46e88-37967ad9432mr6144777eec.19.1794685068033;
        Sat, 14 Nov 2026 11:37:48 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332a77sm16855164eec.4.2026.11.14.11.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 11:37:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-gnome][PATCH 10/13] ibus: Fix build without x11
Date: Sat, 14 Nov 2026 11:37:30 -0800
Message-ID: <20261114193733.1743149-10-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114193733.1743149-1-khem.raj@oss.qualcomm.com>
References: <20261114193733.1743149-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 19:37:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132267
Content-Type: text/plain; charset="utf-8"

The upgrade to 1.5.35 made ibus depend on the target libx11 for the X11
compose data that the compose table is generated from, so ibus, and with
it gnome-shell and gnome-control-center, can no longer be built without
x11:

  ERROR: Nothing PROVIDES 'libx11' (but .../ibus_1.5.35.bb DEPENDS on or otherwise requires it)

The compose table is also used without X11. gen-internal-compose-table
reads ./Compose first, so copy it from libx11-native like before the
switch to meson.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-gnome/recipes-support/ibus/ibus_1.5.35.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-support/ibus/ibus_1.5.35.bb b/meta-gnome/recipes-support/ibus/ibus_1.5.35.bb
index 891013ee03..0e2584fa90 100644
--- a/meta-gnome/recipes-support/ibus/ibus_1.5.35.bb
+++ b/meta-gnome/recipes-support/ibus/ibus_1.5.35.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/ibus/ibus/wiki"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"

-DEPENDS = "unicode-ucd libx11 glib-2.0-native glib-2.0 dbus iso-codes"
+DEPENDS = "unicode-ucd libx11-native glib-2.0-native glib-2.0 dbus iso-codes"

 SRC_URI = " \
     git://github.com/ibus/ibus.git;branch=main;protocol=https;tag=${PV} \
@@ -40,6 +40,12 @@ EXTRA_OEMESON = " \
     -Ducd-dir=${STAGING_DATADIR}/unicode/ucd \
 "

+# gen-internal-compose-table reads ./Compose before the X11 locale data,
+# which is not in the sysroot without x11
+do_compile:prepend() {
+    cp ${STAGING_DATADIR_NATIVE}/X11/locale/en_US.UTF-8/Compose ${B}/Compose
+}
+
 do_install:append() {
     sed -i -e 's|${PYTHON}|${bindir}/python3|' ${D}${bindir}/ibus-setup
 }
