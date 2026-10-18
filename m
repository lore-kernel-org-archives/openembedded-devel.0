Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13495CCF2CF
	for <webhook@archiver.kernel.org>; Sun, 18 Oct 2026 05:56:30 +0000 (UTC)
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9808.1792302982757099607
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Oct 2026 22:56:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HM3bS0gw;
 spf=pass (domain: gmail.com, ip: 74.125.82.178, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3535a54bed9so1531062eec.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Oct 2026 22:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792302982; x=1792907782; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Us9rRG88qXRq+qqGDkS6KLe0Lx+6rOlx0rYNdqv3Bfw=;
        b=HM3bS0gwDKvlU3/DZCyw6YVrhtM8GV2bzexBF/88ZkziBvXwQgSDPKO/mQ6ZwS9TjL
         nOWxJDwLERfVyZd6raiQDeQiApUhvwGhPR07+dv6jsT8L/IcTr6wD2uvsT+MbB01IJXK
         IJQYxvfLhCni0uluTQOdkc350aYJZvRC1XVX/t0ox+9cJKRiG6gWvJGD1iOMpLiFnklA
         jt8DjSICRgA0DF41NfiR6vj/8wePgC3aEIZr+scLX4ygwFotxAa9hld+2z8fBXKpKr+Q
         +GT9lNASsaut3JfQl/fBWeBR4DNBaArq3kMgShe3HsOl27sq0w+pVC5QUl8xLSyVxzT1
         dDzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792302982; x=1792907782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Us9rRG88qXRq+qqGDkS6KLe0Lx+6rOlx0rYNdqv3Bfw=;
        b=b/1h21g0Z0FAWPR0LFDibWLnf0SnH6rWe8/dcAHw+wgEmAv5+aLMMZbnyK6DFbxR2F
         R2IM5jNzDr2vrlda8w4U2P6R+pQFgADBY7PWt1ogXx9UO1mYgylIY14GNp2J/wCFhuwC
         SW1hzQrkfYfl+vfHlWs0385KqUKTmF7rWH7Za7oiHCfcDVJo6oBi/8OyY0tdbvCBeOMB
         XT0CmlVq0P4QI3SWT+sigOBCrgmitP4fsHhjJTiuaPPdLQHAoNak8PrKzLnOHBjLC7Gv
         hdVjDdVkCraPuMEC95T2HYV+pLwLQJWU3bRulX5i5S+0b2AX1Of/J1e815phFGMaO7kT
         jzeg==
X-Gm-Message-State: AFq9FYIuL2nopZbzoH04QhNijt3cMpKqObfYQAqAx4rP3napqzkgdrpt
	i2Y5kNlp2y4e3qYQnYZ7MVr+T1HX59MthjPRPkGFAZp+LZ0gSVJ8cLmDrQTLaK62/54=
X-Gm-Gg: AYBFou2AJGLtn3PsTVNrgpOtbzQEZ7a1zhCh/8n+hM8Pnqd/6e4zJnt94RePxr/cYrI
	lqqOfFDF1lMdWZ8g7Zo0ipYTDm2PgThMQ6imCxFeXhGV4n8WwEOdmsKpmpUyv7z+4E/6sWeo0tC
	x9j7p6AOrrpJJmivPnmgUtIiNIXjL5Fmwh0ybYfldexzxGIvf84U+sPK7MghTPqPW/GxszKe/to
	Fv08tKajRsRZbLBahpnvCHNg9sU3FophkNwqcde/g3FSVkOTMF8iLqs3XJKm4Wk2l1B/SpV+uz5
	q9Y6WCROBqAF9QqDGpkYpPHJ89TOIUqZhh2SozFIrH2D2GBLbR34g0RQ9gQ+xwZv2iTHO1Gm+RO
	9AqZHLljh8cQhPtgCXEUmkcC7RAkAnIpuUFKvE1sFMP7XlywsoQjUM41wiGyJxNZ1f7i+MWleUU
	gLYKdrpTu19knirBmImmPZiDalawXt/GT6SXa+xz/aoATNNt5XXSaxIi3UlXmR7Kaxx8X56b9WT
	L6HJAFbQq0Metzq7BmkgdpnN/JQhqAgcqYvrhC2l/Uu+xTpZ+Dy+seTVPp2RY3up3qP5/A2RQE3
	HiucMDpJOmsHdgFVWFozQ8VUdxxdlcySOGdx9MGumhi2T4yYUB5q1gommAHVYjJNQuGmi67PVeA
	aPZWmk60GnfBUg986dTpg3h70bNdRsMb+MqC8j85JLOxKw8RHS5dxc/HTU6uZ6au+uNl56XQrXD
	Jjy28L08QZIIDw0ZFVaFaIrakTuJaQsfw1aABMcuzOWieWpw==
X-Received: by 2002:a05:7301:271c:b0:35d:b452:902a with SMTP id 5a478bee46e88-361a2942d31mr6802570eec.34.1792302982018;
        Sat, 17 Oct 2026 22:56:22 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b684dsm20883415eec.10.2026.10.17.22.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:56:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-gnome][PATCH 10/11] nautilus: Mark incompatible with riscv32
Date: Sat, 17 Oct 2026 22:55:37 -0700
Message-ID: <20261018055605.179605-10-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261018055605.179605-1-khem.raj@oss.qualcomm.com>
References: <20261018055605.179605-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 18 Oct 2026 05:56:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131092

It depends on glycin, which is not available on riscv32.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-gnome/recipes-gnome/nautilus/nautilus_50.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_50.3.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_50.3.bb
index e3a825b0a1..d94adf5b1a 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_50.3.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_50.3.bb
@@ -58,3 +58,5 @@ FILES:${PN} += " \
 # mandatory - not checked during configuration:
 # | (org.gnome.Nautilus:863): GLib-GIO-ERROR **: 21:03:52.326: Settings schema 'org.freedesktop.Tracker.Miner.Files' is not installed
 RDEPENDS:${PN} += "localsearch bubblewrap"
+
+COMPATIBLE_HOST:riscv32 = "null"

