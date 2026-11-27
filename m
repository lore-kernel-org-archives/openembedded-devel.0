Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11792.1795762945944347113
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:02:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=WZ0G5v0z;
 spf=pass (domain: gmail.com, ip: 74.125.82.45, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1b3b4944a0eso5800987c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762945; x=1796367745; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dmnFVOncP9U27qwXgk1pRDA6dZH4XIbLGnRQS/Dc/XM=;
        b=WZ0G5v0z8/jgAOvep0/3FYNB+G47fx1+yActRVMDRbBJ3PhcAaTlQ25igsKUUF3okZ
         A/yPQ/7H/wKbceclk8NCEScUQ4mdkodMcJej2MrJqDVrsavnThNfFZjR/mVs+XBdfHtm
         A5Bz3Jwk4+gWF9arm2zs0C2QRDlBmLNWRW6PCivEBfB5bMFClu6ULC9bx7+5p23i9L/L
         bUI6y+SbK8qLrXx7qmPL0zv63ktl+2D8Aa9KZ1KPxBBJ2gXvT8PxAIOgdgpschR6ZxKI
         9gXQbkTRmYIytsQxuef0wTkaY9fcKHuw8egiJlvP2gJ93YEIENqbiCA7kGq1vrd0cqm1
         KeCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762945; x=1796367745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dmnFVOncP9U27qwXgk1pRDA6dZH4XIbLGnRQS/Dc/XM=;
        b=2L5NBed1YQF2qtqBiI/PVaBLUDbvaHf6jpFUxWL0ixm9qVm3tOr0wgJqm7jZUb+Ni1
         r2bVmW0EXdl41oLjj1H5B3k9PHcRfwsJqE+0M+bWSF0o8MB14gSiiwlTPFXfxapMdTl1
         U8IZ8YVdvcYjaEACL4h1ePX3EnjGLgV8KzE36QQrlnivl6rfGhMTP8FNQs1k55DTKT7Z
         HqZpT3lj/Qo8KVe9P2u5OL7eaiY5ZaRbrtkSLqEba276VZE0UAEC0Ng6bGfWKCX9Ar8k
         EU/bYCGCF4NlxvCA4DFte3sFc02mURlXTxKzTGWEE8iXigkbXCg1lN56LAxJh8VqYLgx
         VYVw==
X-Gm-Message-State: APuU4Z+EvJm+I6TqG3g+RqCCyduWMvOPSvvxHGnT+3Kp/c1mTEI+oKod
	5egTRxe5xbHI5zqCmKgaLfBV/y/lrTcuQrMbDBN7AUmQMqOl/X+bCsWbO3sDYt6y
X-Gm-Gg: AZFdTZeVohykVutKNpWrg2d0tY1fQLAHdcOTDt2GZ+0e7GZg8+Xsy4QKhpKk+yzXeP3
	8UzSAgNxjooeAx51I4vIGntS9qZmfcxthnl577ZwA0pwasO5xc3bkFQUksrz9nQ2agyGT2B8kry
	SrjQwlBWwn0SL98Ytf4nWfQGgoU8ZqmzawJUi5H2u7i7y9wWaTXTJJJYbkugKb8BG3YFmedyGv1
	dodw2aaEYobytjjDzX7MVMbNNrivXEr5AQ0aR+3QK7Or566Fv4GOBf1nhxZ2lFk7vta8U3hRhP7
	wHUwlVeQ++ONht2Q34eWAjaGtwWPMZDXNmwuP/u6mkhv9nvQhKSSYvOjgs75vfLRpu91+XWa6IX
	yXxqVeH9ICepRWi+BNKg+GZFUaulusLaYLQLHLnS/3p4mKd+FRT63u6TeV0F3+5zeGr2789mTFZ
	hpMUXnUcy5L9OEDlW5EiAXIhbualKGnExYy+vTSPzbkOty1eFMa5o/wI/64oCZvUeXiBNm00XB6
	lV9GD0BkWureLz3kl6A5Kt4WCB4fdKR2Uo38OcaFE5vObXPLgh8Xh/6LaPXbGA2vwbR//G2shQC
	XzbaB9HzkP5KeYDpE28BMVItptWpXuuvMyw1w1YtB+GMlo4jN42dGIS/rPYIbI39Jw7zokMnzdR
	Dz15tvClbMud1S8GWsk06c+PuK7tDdh++N7GEGJstMoLmqXujLmK6rdEJaFYnMitEHyQ/lks3tg
	mCLQROpmXRx6v4QqA372S03yo6h9zV9d46X55xzWykot3ba4AwR4COqCmu+XniuNGl3lr8jI9G9
	3iRp4bCsqIVCFSANX8KZTqx7fqT2DnovluA/lKVoX5Ii3dh8I+pFMmx6oYc/7UgOxQjQWp4Jw6T
	P1i/9b3VqEXuuY95YfGbpUFqaw==
X-Received: by 2002:a05:7022:e886:b0:1ac:2f6d:e1c6 with SMTP id a92af1059eb24-1b5568a4f42mr30110967c88.6.1795762944959;
        Thu, 26 Nov 2026 23:02:24 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c3052sm53911395c88.1.2026.11.26.23.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:02:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-gnome][PATCH 09/21] libuser: Fetch from codeberg.org/libuser/libuser
Date: Thu, 26 Nov 2026 23:01:57 -0800
Message-ID: <20261127070211.2329979-10-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127070211.2329979-1-khem.raj@oss.qualcomm.com>
References: <20261127070211.2329979-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:02:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133336
Content-Type: text/plain; charset="utf-8"

releases.pagure.org is gone and upstream moved to Codeberg. The old
tarball was a plain git archive; the libuser-0.64 tag has the same tree
apart from .gitignore. Fetch it with git and check upstream versions
from the git tags.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-gnome/recipes-support/libuser/libuser_0.64.bb | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta-gnome/recipes-support/libuser/libuser_0.64.bb b/meta-gnome/recipes-support/libuser/libuser_0.64.bb
index 27cbb43486..fbece79f12 100644
--- a/meta-gnome/recipes-support/libuser/libuser_0.64.bb
+++ b/meta-gnome/recipes-support/libuser/libuser_0.64.bb
@@ -1,8 +1,8 @@
 SUMMARY = "user and group account administration library"
 DESCRIPTION = "The libuser library implements a standardized interface for manipulating and administering user \
 and group accounts"
-HOMEPAGE = "https://pagure.io/libuser"
-BUGTRACKER = "https://pagure.io/libuser/issues"
+HOMEPAGE = "https://codeberg.org/libuser/libuser"
+BUGTRACKER = "https://codeberg.org/libuser/libuser/issues"
 
 LICENSE = "LGPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
@@ -11,14 +11,16 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
 
 SECTION = "base"
 
-SRC_URI = "https://releases.pagure.org/libuser/libuser-${PV}.tar.gz \
+SRC_URI = "git://codeberg.org/libuser/libuser.git;protocol=https;branch=master;tag=${BP} \
            file://0001-docs-Disable-building.patch \
            file://0002-remove-unused-execinfo.h.patch \
            file://gtkdoc.patch \
            file://0001-configure.ac-update-version-to-0.64.patch \
            "
 
-SRC_URI[sha256sum] = "ea6094c72cb9e60a42fb53509dc98d124a340f1c9222783b503208adc16a0a8f"
+SRCREV = "ce81277cb5cd5235e22be453aa496e3f4190724c"
+
+UPSTREAM_CHECK_GITTAGREGEX = "^libuser-(?P<pver>\d+(\.\d+)+)$"
 
 DEPENDS = "bison-native popt libpam glib-2.0 python3"
 
