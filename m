Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21519CF256C
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 04:44:03 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8010.1763527433796069558
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 20:43:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SzQhtLUI;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7b8eff36e3bso3045281b3a.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 20:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763527432; x=1764132232; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W0kY0mprEGZ2kVFtZHCANdA7DhzCprGanEO9q/VK44Y=;
        b=SzQhtLUIs4Xjd1+a+ypEe1ym2cCM4fp7DMjd7vSngYiTvnLpdFxQ32SBHW+/umPYI6
         nEbTUUTf/nolfJFu66OSXiR1K2qnMLjXmZJ+W5vNCDSLgJulvrC3wAmah3nZhc3YhyDI
         wB3IvWnqqCHXT6TPKLKLbSHJ8MmX0rduKa77r5MddhwGqDjg0n9LdHtu9vSHDfLaO7cG
         ZOCHdvtwLSJQpGVi0A0Ke9dk8Z19A9BeVws0c4bFfW3v2Q6u//KyY1xRaDD9hnLVFvEy
         YK8c2oH1s3lJPVwLErnktj7xVRewKrcvG4bP/HdAoodjd8X8XZ5VdkTXN1KF4Ehxl+EO
         8/Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763527432; x=1764132232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W0kY0mprEGZ2kVFtZHCANdA7DhzCprGanEO9q/VK44Y=;
        b=CchdJ94rWxiJk3/qlhcG4Qh8f4QREDTcgRkQaXI3YQR5mnD2fERGE7o4ZOMsb3EAor
         1aH5jVtlbloNt0+2EIGMLANH8eaogCc4vNVwN6p2Uuqb40VAyFqzlzcuEEQHfqpa9p+2
         TEFzVEtrtU6r3vAKwDyONkqrzL6p0u8emhqkvseOGsfF2REjm1BGJkDjnE9vHFJzSX0n
         13CeGcXiqmv7w2xc7YiKSq37zhn3tKG79YZ91pQUc2XacTNgRVH/ILhp7FMLeZSj/92r
         1mgUI40mKHljE9+oWDoi18r4CzPqgjt7e8nr+NsPdmxeuWA0bOxLxmNoAYGFY/P9CDN+
         hgiQ==
X-Gm-Message-State: AOJu0YzvQRAmYWrxT0T/j6BnZkXlWNnAcXyW91+ohwSgdA0TqSZgaFEC
	3rBHFO+uRVaVp54OzVLtM2VammS1P1YvDHfOjYO0MwBjgDTlE5plVEjZPPcT1Zk5P/k=
X-Gm-Gg: ASbGncthx9VoQyo3mPY9WxXATyjmcRe9D/iSSgjN7b6fLn5MNSRVp6RotK6sl9a7uUS
	dS05gM3B1ZZx+b9gBUehz7CbLrdS0tAOXUWjbGAjn5M4sJPXQCt9w3dPYcMVV3ZL8MZVR3UiIcS
	ca7oJJD1rVZPVaFmqVTgMlysLW/oSgw769/LQIxeCAb05E1Q0INJ+euQYQSxAtIdH4EDzkxLYmd
	pGHVgmMZvsRTUSKgvoY/4AB1vfAyUMOhcOINdp5NX1BeKOoYkQCWU4eAwxZn1YoU5b2qaZ+6Mhn
	3ogEXixqnWvdQS+DmSIZk7vPGqB0qnLxIu1BrNNLM1Xp157Fv5vAYsdly4nE58k2zi3ZTQFt8yJ
	rj9G4EpGWpPEOnuL4nkVK4eTJhrISZCViJvKPJEipZvdS/Pf3lffx9L/LizkTwl+LGKRAgPawI0
	EaM7Gv2nLSebO4hmOWmx5qih6VoYPhEhr+fdhs3mG47IZgvGx+vIDths9uokaBcnwlHzASEhFcm
	EE5Q3+ewp29MtXn0KJN7T7yT+GhlekmyVtgOc9G0HM=
X-Google-Smtp-Source: AGHT+IGiiH+ScjbAbvafkT8cz45k66xet5dKOgLOIgbodNZzD4bMpWG69JfqBJCroLPUlSPcxfkdjw==
X-Received: by 2002:a05:7022:2587:b0:119:e56b:c74a with SMTP id a92af1059eb24-11b40f9335amr8390584c88.15.1763527431501;
        Tue, 18 Nov 2025 20:43:51 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::888a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a49dad0aefsm50079315eec.3.2025.11.18.20.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 20:43:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [meta-gnome][ 2/3] gtksourceview3: Adjust for setting S in gnomebase.bbclass
Date: Tue, 18 Nov 2025 20:43:46 -0800
Message-ID: <20251119044347.2884483-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251119044347.2884483-1-raj.khem@gmail.com>
References: <20251119044347.2884483-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 04:44:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121885

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>
---
 .../recipes-gnome/gtksourceview/gtksourceview3_3.24.11.bb     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.11.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.11.bb
index baf4c33d38..83953316c6 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.11.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.11.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"

 DEPENDS = "gtk+3 libxml2 glib-2.0-native"

-PNAME = "gtksourceview"
+GNOMEBN = "gtksourceview"

 S = "${UNPACKDIR}/${PNAME}-${PV}"

@@ -18,7 +18,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 EXTRA_OECONF += "--disable-glade-catalog --disable-gtk-doc --disable-Werror"

 CFLAGS += "-Wno-error=incompatible-pointer-types"
-SRC_URI = "${GNOME_MIRROR}/gtksourceview/3.24/${PNAME}-${PV}.tar.xz"
+SRC_URI = "${GNOME_MIRROR}/gtksourceview/${@oe.utils.trim_version("${PV}", 2)}/${GNOMEBN}-${PV}.tar.xz"
 SRC_URI[sha256sum] = "691b074a37b2a307f7f48edc5b8c7afa7301709be56378ccf9cc9735909077fd"

 FILES:${PN} += " ${datadir}/gtksourceview-3.0"

