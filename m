Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2526.1794961618411392405
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Nov 2026 16:26:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=TZMsgPGK;
 spf=pass (domain: gmail.com, ip: 74.125.82.179, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso723724eec.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 16:26:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794961618; x=1795566418; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3B4Qu4YI5uJkPYVHBeyZKB5V30O0C85OzfrSDv7Efbo=;
        b=TZMsgPGKT1wQvvXCAW+uwGKs+ndQc1iSffH/MnvAdJN/oTiXZwYKd8WulkjvL54wl+
         YcYVPeT2T1JaT11x4TSJ8f0dWOao7yUu6URef2TFAZWp/Rl9p4+JlCBFaLUFuyx09Yk1
         Fyhb/gUFekhyP5Luy+AmBHVqthbfj/aW53BYjfzR4u+/QcFZy+lv9dQL5QRuxHgde/bV
         qutER0+xU50WGrKLh8JROTXuoyfLrPdlKKF0dHkfz8afBdFgOghi+KOFHZkpRbFGJ1HV
         vn2PCKYDofxswrsJljGiI4pcp+yvOtITU2byTshltQKbc7RJTjvyXUVBJzjhY4X3BmYF
         GB0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794961618; x=1795566418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3B4Qu4YI5uJkPYVHBeyZKB5V30O0C85OzfrSDv7Efbo=;
        b=Pyp5j47v+72DbCry7dpLzr8kykqW59hpdbSO9KnTwVVZYFg6tRIscHTYBuKyZFzhX+
         7KSKC6ru5S4xixM353LEI/En6D2oeQ/KUvTADu5TrXyzjnVEDdl2cMvezaJgWotqZnqv
         9Z8OgidkRzDj+f8BUYIwQZutH3Tml+BewJjo1oq9oJuFJXQB0R2EUKgqZMUNonwAs9BW
         9wHMDl6Pat4Ey/FtZPchpbYi4mXQUvyL7LmCeBMerAUq1XU++PEUNeST1Y6ejbEQlcB0
         pjATt7yuJ+xfEzCUo9mWxWE4pa8ylmJ6J6rERoGLqV7tuCmpU/3+IOCmKriLcBbVzuqc
         l89w==
X-Gm-Message-State: APuU4Z9KJkeLGREFoy2qmGzskH2gq+3xdcDnw1/01/NlYtckgfBC/av+
	GYVkFOpb306JZbV/HphkkHF2YdrNrJOvgqo3HUC5J+VV7PTlx2sQO1tcCLAF7wm8
X-Gm-Gg: AZFdTZcnb841mCtCYeIMVuF9yACJXI0hKKE0UOmIr6DyNa21bl9/0AvyrLqMdMa6efD
	WKZAgY1Jp0gkwz9WaKhgH4Ym71q4MBxiSZuPRaCGdTvyve5uE5PYnT+xk5gH/0z56bktoWV3ADN
	VugAgPEtO4cu15CKtRrYeNwIk1f3bTw7zuiWsnv6BOGUk5otvJAxjSfEwt9mjIn7XmmOpvWXZCh
	kZwDMP+7U9S5giRkdFCH4hP1iQURNP2d2srGaABEKgWfmjh0JMFz8RcQdAYprBezuUdfprZsCxc
	/gx++QZADV9UiwruOrLVFBgAbyEZqgNEsbb5/o8K1mDc+N5n8XApDzqLTNm2TmXqcPw4EADrEjU
	8xX6npWQfxzwIoChj+9/cB3NmdQp6u5rM6/W7zTe82UWznE77L+3hKvpdhN+GjUYNR91g+gZ77z
	lO5xxEKNM7z0RFV6woGaIvMm+2Lt4vNEDvNAk6pgmanR6EVV4cbbyEK5T2WVJveNryNjijGGagv
	TsZC0omGU4G4AM6hgpXxXZrcSu/SID5cjZ9VWdjmLOT1l20ajMtd2W0H1HxDpTYGsanZ2+hPAzp
	K+GXDASxvD9QP+6fCHBpYy7ZSztaBZZoxmxJb8s23o2cRfpvQFJTjBeTnsOvY0PgIiIPub+U5sw
	DRKZfisygWhj+Kqpt/5dw8Ziazsu7TQdYqSuIdwp2ztNtjmdrn1d7xTP/9+ghquzqpkBd9CZHZx
	q8g/W+zML21W8fi0dmdewPWiRW+Qo+zSUTb1HTWbfO27Xet03wdO24F/VNdKzp56S/dWERyonAn
	rCbNzwP7bW59z0UjB7WgR2ySxzspzfYfYhYA02up4sjbwHqfyeF08p6/mgRtOpMDXJWu9cvYaSB
	tznR
X-Received: by 2002:a05:7301:190a:b0:36a:1e9e:ae61 with SMTP id 5a478bee46e88-38281bfa917mr965977eec.38.1794961617701;
        Tue, 17 Nov 2026 16:26:57 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7fbceffsm1697015eec.28.2026.11.17.16.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 16:26:57 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 11/14] libyui: Fix LICENSE to LGPL-2.1-only OR LGPL-3.0-only
Date: Tue, 17 Nov 2026 16:26:39 -0800
Message-ID: <20261118002643.29829-11-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118002643.29829-1-khem.raj@oss.qualcomm.com>
References: <20261118002643.29829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 00:27:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132612
Content-Type: text/plain; charset="utf-8"

Sources say 'either version 2.1 of the License, or (at your option)
version 3.0 of the License', matching the COPYING.lgpl-2.1 and
COPYING.lgpl-3 files already in LIC_FILES_CHKSUM.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-graphics/libyui/libyui-ncurses_4.7.7.bb | 2 +-
 meta-oe/recipes-graphics/libyui/libyui_4.7.7.bb         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/libyui/libyui-ncurses_4.7.7.bb b/meta-oe/recipes-graphics/libyui/libyui-ncurses_4.7.7.bb
index 43b5afa2f2..a0b5d6746a 100644
--- a/meta-oe/recipes-graphics/libyui/libyui-ncurses_4.7.7.bb
+++ b/meta-oe/recipes-graphics/libyui/libyui-ncurses_4.7.7.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Character Based User Interface for libyui"
-LICENSE = "LGPL-3.0-only"
+LICENSE = "LGPL-2.1-only OR LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://../COPYING.lgpl-3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
     file://../COPYING.lgpl-2.1;md5=4fbd65380cdd255951079008b364516c \
 "
diff --git a/meta-oe/recipes-graphics/libyui/libyui_4.7.7.bb b/meta-oe/recipes-graphics/libyui/libyui_4.7.7.bb
index e48755c80a..8adda15476 100644
--- a/meta-oe/recipes-graphics/libyui/libyui_4.7.7.bb
+++ b/meta-oe/recipes-graphics/libyui/libyui_4.7.7.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Libyui is a widget abstraction library providing Qt, GTK and ncurses frontends."
-LICENSE = "LGPL-3.0-only"
+LICENSE = "LGPL-2.1-only OR LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://../COPYING.gpl-3;md5=d32239bcb673463ab874e80d47fae504 \
                     file://../COPYING.lgpl-2.1;md5=4fbd65380cdd255951079008b364516c \
                     file://../COPYING.lgpl-3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
