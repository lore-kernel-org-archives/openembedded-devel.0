Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD68AC55180
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 21:45:45 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13733.1785620739547351136
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Aug 2026 14:45:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YuiryvrJ;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c981c2c37cbso1615603a12.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 14:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785620739; x=1786225539; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AcqKZtPpR2LN0BtP+L170iWR83qIVNRNysxn81cOzdU=;
        b=YuiryvrJ8vXetFE3y/xscXVaAMZCXXwfvwlIPeu13qCc/kaFmVcWZD/6UNaE2Kkuvu
         ELjaEAtXcC2QPyk7ACmkdGT88aXUFR17x93YQH7kbGY/7gTDvylm1EaQVxHDE2x4cNNS
         83Gl87TYJVmJ+27QKGT2uk5NMLRXAhgSb+C7ST7oPDUGjnVNq2mbTyOiCa/Qhc/9mANu
         36PWy81KeWupmT1uxm2TYf1dnuRhPX4OJEIhw/kok0zMTkkUc87fvwZiuplGC7tIhFvo
         Nx6L2iO7+JMoOdUvileK566syk8h1HLt0BNeh7aKt4s/XQNaWXUkIiEYE1TcE9c6ldlY
         vEcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785620739; x=1786225539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AcqKZtPpR2LN0BtP+L170iWR83qIVNRNysxn81cOzdU=;
        b=Hx/0Wr8WtriJ8lijW1nFLRS844B1MqfdCzQxhuanHAsxGMVcQvfWhKareHqx5vykIy
         Vy/z5SLxWl0Ku/2TW+9XlzNIbOmTWkGZlvFWJF7lPTSsLyRcLd0ZSaJ7Ncrd3a/BmpLM
         7utg8dYeW8IRCjVFSKBjFjGVs8zC/FtXnbz/sgJGoroycozsahM/gitWW5Ndr5X1LpCA
         4Lfd55jZbciwj8aq/dXNCzpOD9IiE552XPmlQNHzpHNs0a9LDMLdXoog573TgRvPbXPU
         aXl8Ak1OFe2A/9OlXYRJ9/nkAp1S0Kj9Y2nMHnno/Oo3YDCPaaQ2oxJrQSUYP/AmnnMy
         XI/Q==
X-Gm-Message-State: AOJu0YxWBYYnBZC+vDjHE44KTKDODH1JdQhoD2+W6z615EiAuRbIZuat
	fo/MFcY6TIps3gMeccZOMVidX4LlCJsyQqJGxrUQk9A9c3JCQm22WCYYfyQIjzvK
X-Gm-Gg: AR+sD10ma8lKznGJ65+DMdTj5YhxXhONN9B2iZG/U1AE2yuZtu63nYoz5DAayKl9hdF
	QPVA0rKd+RmWW8MtIxisG8lPjXSzwxLqRvP5zrBYZFKU9EIb4WAdLf9+rDCwXHdcPr3yz+pDd2b
	fpxAfP5E0StkMmEBXYLJ6nMT2BvSiL4urnRnqCL/YNeAs6QClYLruqK3BkTT5zOTJxRpV71jV4c
	hhoaAFbiFp2MdvUsoMI4r11r9R/Q5Ny4FxlMen+pCnVpE4WOZOw8TLMXSGTZnMdCvhoc2TI3GfD
	OhO3GNYnG0Ma5IzNjnRo4gTqr36NCR937EXnwHy8bsgTWYkY5uvHPiRYyrN48Zjr3uhAutec7W+
	Jw1YP8CVsFPrQdWdAG+j+lZQHQMejzRSKIKAbZAE7+UL4Y18K9kCSTUHRBbNLrep1dFl9H5ZaT5
	27slw+E+GgrCiZWiLl4E7ehuWp9VPCx7lPFuepeXojDBH8N2ofxkq5RFCtvKhiL+IxFdU+tRzeV
	Q1QV8SIW6EShbtsPwgl42JX3uI1ivzNA9tGqLP4V1nWxjXCZW19DbB/QqC83pzw9lGBKWoeYE2V
	Ehz2LH2C6DgvHP4/0SVgL3fUuzLZEnSVF1+cCYmkTxk9qP0liFbKCp6hzy30mkZntA7EMATrTHp
	7Jkmo65kj1qCliQ==
X-Received: by 2002:a05:6a21:648b:b0:3c3:9595:57ef with SMTP id adf61e73a8af0-3c92a5bc4f9mr4591022637.31.1785620738851;
        Sat, 01 Aug 2026 14:45:38 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e5b0sm19105102eec.1.2026.08.01.14.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 14:45:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 11/31] gst-shark: upgrade 0.8.1 -> 0.9.1
Date: Sat,  1 Aug 2026 14:45:06 -0700
Message-ID: <20260801214526.788343-11-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260801214526.788343-1-khem.raj@oss.qualcomm.com>
References: <20260801214526.788343-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 21:45:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128628

Upstream changes (git log v0.8.1..v0.9.1):
 * Add base classes to the core shark library.
 * Add an option for subclasses to disable CTF init (enabled by default).
 * Add start/stop monitoring virtual methods to the periodic tracer.
 * Move add-metadata to run after CTF initialization; use absolute paths
   in the graphics script.

0.9.1's configure.ac declares AC_INIT([GstShark], [0.9.1.1], ...) - a
nonzero "nano" component, which gst-shark's own AS_NANO/AG_GST_SET_ERROR_
CFLAGS convention treats as a git/prerelease build and therefore enables
-Werror. That turns gstinterlatency.c's use of the now-deprecated
gst_structure_{id_get,new_id,get_name_id} (superseded by *_id_str
variants in this distro's newer GStreamer core) into hard build
failures. Pass --disable-fatal-warnings to keep these as warnings, same
as a real release build would get.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../gstreamer-1.0/{gst-shark_0.8.1.bb => gst-shark_0.9.1.bb}   | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/gstreamer-1.0/{gst-shark_0.8.1.bb => gst-shark_0.9.1.bb} (92%)

diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_0.8.1.bb b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_0.9.1.bb
similarity index 92%
rename from meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_0.8.1.bb
rename to meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_0.9.1.bb
index e1c903f6ed..d7582f91e6 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_0.8.1.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_0.9.1.bb
@@ -10,7 +10,7 @@ DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad "
 
 SRCBRANCH ?= "master"
 
-SRCREV = "09ba05865dacd2824b5b40ab75a4b9545fcc1366"
+SRCREV = "3e3370e3cc66912f88235c43a3b926ea8fc35313"
 SRCREV_common = "b64f03f6090245624608beb5d2fff335e23a01c0"
 SRCREV_FORMAT = "default_common"
 SRC_URI = " \
@@ -23,6 +23,7 @@ SRC_URI = " \
 EXTRA_OECONF += " \
     --disable-graphviz \
     --enable-gtk-doc=no \
+    --disable-fatal-warnings \
 "
 
 FILES:${PN} += "\

