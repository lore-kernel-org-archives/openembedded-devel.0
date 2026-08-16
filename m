Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2F84C5DF70
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 23:24:23 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19641.1786922658540817427
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Aug 2026 16:24:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=B1GtuNx9;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cab973140bso43698995ad.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 16 Aug 2026 16:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786922658; x=1787527458; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w9UAQQPedDvkKRjCaYl2Eh0eCTyis7fpz1iNKmx6RJw=;
        b=B1GtuNx9U+XT+BA2+43rkKKrjUdk2d8OIEexIauJzdz+jQXN+Izwbndwt89wIMRLKI
         Q/GM7nT2SK83Ez85u9kns1Tw0W4zVoJmfQaLp0nRBpgPr8BapastKSyDIgtay/wUfqng
         s6x4uq71Os60tiNvSmlkGCJcqTFhByWXlTneMuHwgJBucuVGDkdtQAseC5/+AnqE3Fw0
         esXJDZXiTv9KCJKQkCUHQB3WMkU+PbXIaibiGm2CeyhFi2aclMU77+/g4ztBOy0bo0xY
         KrcG+Rfzw++g/4dkPqzPTIR5STtZgTuW5jk44pIUeRuOCQv9LpKTW1Fb1+dlP8/Wsbq3
         UOnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786922658; x=1787527458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w9UAQQPedDvkKRjCaYl2Eh0eCTyis7fpz1iNKmx6RJw=;
        b=gLEt+PiQGDYVY0ygySAVz3dOdhaNrCOu9oS+1nqVzJb4iZJU3XEWZPHHG/HrjPFcC5
         qxkudeNKEXydWBg0CNnYbUJv59jM2+Hhg4fBvOs+r/LNdykOe1K7c2zc1cYcB1CkT+y7
         m5npc1OGSZUNpc0lmltbaKjxkZHLQp0A4vaeNcF75dzdmNyUu1/qKN2mv9WoGgaOyk7J
         KW6U55jIhAgfjS5ArEwz4ReDtoIL7DlFJLySOUnhgdYt6ozw8LJjFLavzglJ+a8LS4cD
         3b4Trt3Nn36oF1LMtUvVhPL6LJjWLglNLPAWfFJsufROl4WhfHZm21/oa1lBup3BYpxL
         GFtA==
X-Gm-Message-State: AOJu0YwrkYI1/vS/5KwPBa9O6tDbwYZ75GWByspxTs2UC10g6LUj13fZ
	QW4rECoEPBh646iKb1uZAva7oRzrDVuJczrTUQhNQClcCTiE3URdzoVqGTykdmDK
X-Gm-Gg: AR+sD1380oymnMBlhrLHxul3lMvz0pbQ5LBcXdqL5aqC8RqpXIBzF7tfAO767o0I/8o
	fX3YG2qxl2PR27x9AdFuwWdoJRrFFBXf417Sv+q22UAhxbtDYJj2Xs32oupopJMcJCWq2UYrw2t
	xDlnHHk/ghEJDeqNJu1SdyyX/sVay9ATtY31S+/TNd7mCLejN8RxtWmmZd3gShDLGG7kaWCMTi6
	euU2D+jttFClxd36wKTOB2NtmuTXb1VWh7mt605M5KJ0FvB9oN4yruCkTin6/CUkZC5Lk2DxlSs
	Rks9pIru42BuXWt5VzqIhMxE2qwfqIUxfPVilVkLtZ++cJIlbU+e5xFMBaUVnNQ/Jaa3BFhcEFH
	0MRAft62AbSuA4Uc1zaiaeKhlc6/mvRaxyJ96JHiNTjoDjt4iF1Vcniv47MgLKDwfa2JJ9d1SAV
	TUG/zC+zQ5vxZaiOnR/MpuzMBtvSWUlPE59fSrM8dQJPXKSLPjt4g9ZJaQI4Xk6fMGq4mWsiGQd
	2go4etraLninMLRduf/0BWmDxBykUWfyEzCzMeYOsdMBFKf5NOLAaZJAADcjyUyqe+tHfmawnVn
	wUO3A6RwD1UxrX/LAFN5L3nGUv4/83AX2CAYQ39y2utWM6D4CFZEd8wSc2nSCTlbvg3VbvSH8Pk
	+5DWcKPMwJmmY/z7tE3yI7DZh6Ib8RYx7Q4zPblQrtbFyHw==
X-Received: by 2002:a05:6a21:3281:b0:3bf:5539:f93 with SMTP id adf61e73a8af0-3cc71eb2994mr20139208637.38.1786922657750;
        Sun, 16 Aug 2026 16:24:17 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ea8fe3cdsm30368131eec.28.2026.08.16.16.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 16:24:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 11/12] python3-msgpack: add python3-misc for tracemalloc used by test_except.py
Date: Sun, 16 Aug 2026 16:23:57 -0700
Message-ID: <20260816232358.1947922-11-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260816232358.1947922-1-khem.raj@oss.qualcomm.com>
References: <20260816232358.1947922-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Aug 2026 23:24:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129188

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-msgpack_1.2.1.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-msgpack_1.2.1.bb b/meta-python/recipes-devtools/python/python3-msgpack_1.2.1.bb
index 283068a71a..f8154598ac 100644
--- a/meta-python/recipes-devtools/python/python3-msgpack_1.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-msgpack_1.2.1.bb
@@ -12,4 +12,9 @@ RDEPENDS:${PN}:append:class-target = " \
     python3-io \
 "
 
+# python3-misc for tracemalloc (used by test/test_except.py)
+RDEPENDS:${PN}-ptest += " \
+    python3-misc \
+"
+
 BBCLASSEXTEND = "native nativesdk"

