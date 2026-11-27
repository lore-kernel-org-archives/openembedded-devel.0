Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11765.1795762881880963351
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:01:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=h4IoREKJ;
 spf=pass (domain: gmail.com, ip: 74.125.82.48, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1b5786e099cso6541074c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762881; x=1796367681; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KlCLLiI8DmDtXP66u7QzXaeH1242/enbdyXmHN5wP1I=;
        b=h4IoREKJxgnPllAsluRkXdJB+Eb+eAyRJf+Pc98+U8eiwomFjLLIopFEg+4NMHQSsY
         ZUarpqG1kjssS4B82mG85eMDGzxjgczn74szhwy7OZBZf1MOTY5vcjNHLFfS0Z2vGOI1
         QOSJTBImDnlvsBsS4nSlSFG4m2Nrjein1jMCitxj/f8F7Ml+JtXfQHj4T9Ioi30N14FU
         Kdpr9LgWlF5oIxQtucTG8x3Czo6iZ6yseLQhzWwaujo66rwc/OtSDyFuCVm4JZ9zY4w8
         dMnZCdxVWP2RDbzosBKzWzR9Xb4h9a8enc2af9hxf14C6SZesbuCa3/TFYePUHJMYlkf
         V/PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762881; x=1796367681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KlCLLiI8DmDtXP66u7QzXaeH1242/enbdyXmHN5wP1I=;
        b=2l86yWdVxhxitx0Zc5EJwfh0/vxyeAYv4pFPp3tWhtnujt9K+RwOipHTxxAEF6vyBm
         DaKsBLB+7mDzxx4Ym+bL5NpvsYZZtUbnmJh3jiTGydYL1Cc3Exm0V0MmPYtJT1XvBLoN
         6HtddVCq1y58fEVo5OEHqLYr0gedl0o04CqH9GZIC3+sqoRaPaoWPLU2pZPhxiFub30B
         Zkj7yIjXIGzwsL+WhWEWfiJiCJskK1IFrWjJimtImm8VtueRsbBCanLFYHwHZ9SgpqED
         4PY8xV3+RvEQSUrnarnegHaz+HAp7LfQXjdcNWZ40Dos0IrCf/xJK4hXe+IF+/UhY0T8
         U1+A==
X-Gm-Message-State: APuU4Z/4xPVxWBGM91nhG3SOtRrPrLQ4RQRP83O2J0xGMbOjUooADxPN
	L5tuaxDBVFWdcncjRb4zlh/OBFhOQ1jq4wHRag+2Se8K7YDXbhIhDgoraJ2IkDey
X-Gm-Gg: AZFdTZdsTeRcbVhzazBf0mtww2OwqNqUz5erkjMD2ITvNwGOs7iQijy695LZGCNbSpU
	5ByYmcEdIoQvK2iQ2TkD078qaYRb82z6Lkm1MiWLgprSitiKQwEsgAXxTXL5rhPw98Hu+mppv3S
	ZI8yrbsx67elEFNFQF35DOq/mjlQoczuCjNGtUygOZg3bc1RHxLMC1mOnt5Qdii7xTQzMqgVBF+
	rp1G5NCkju/sIt7/AOBamwibQGJN19yahFE2Iu+Zdb2ZRGglDoxLWcE/MfbFSVztRhnCPnKe4N+
	3qkMlNETEin8Fa7wN8yrRmkm/XyI7Mf1IS6Q0kwIRW+RbihGzXx4aRecrv+tv2LcJq/Kx00/AUL
	EK6KPY6HSYyzo75aR+0jeekixlQ8IEUFWQWKQwgUe1Sn1rFvNwR+nXhHIfQzgSIYvUWuFvulRfe
	oIcKSeF7B9sn7h3mQMrCtn8Qan+KvyU+0efHXaWuvNvexx8heoll0Q7Mw/WLlDzohPH1aXQQsU5
	BwNmdn9/IXMZQfwk/9DNBo3g8zkBMe86GCxImPUGoDiAUJCeyWgK2txD/Dim+kTOE2KOuEqcBPK
	Jlzylj2sLGLKKWYNXPs93w1blc4FPOM4/xxQ+czn0E41OHej5xAH9ko923C2BWGqoty97cZjbQQ
	314lD9T2OHS6B64gTeTqfdsb4AoDINM7fU9bK9k/ixoSPnjWFvZmLX2PzWdnJXCZ/kbIPkikbJT
	Dexux/E7N/fKYCZMqYgG7zz+JXOt+WsUGMF5xjJFPk0H5oeUAfnaejA5L+RGs3nwvivWDJ6agwV
	h9Oq7iYE1IsB8dJc7R3mTT3JPS9JvfzBa8Kag6kfJvV64lFipP1bQYsPApP5Lm5k4eWnEqyCrXb
	lOoi
X-Received: by 2002:a05:701b:4583:10b0:185:33ab:4d55 with SMTP id a92af1059eb24-1b5569101fdmr22053700c88.29.1795762881150;
        Thu, 26 Nov 2026 23:01:21 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm61309643c88.13.2026.11.26.23.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:01:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 05/14] vo-amrwbenc: Fix upstream version check
Date: Thu, 26 Nov 2026 23:01:03 -0800
Message-ID: <20261127070112.2273685-6-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127070112.2273685-1-khem.raj@oss.qualcomm.com>
References: <20261127070112.2273685-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:01:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133310
Content-Type: text/plain; charset="utf-8"

The SourceForge mirror URL gave no usable listing, so the check found
nothing. Check the vo-amrwbenc folder of the opencore-amr SourceForge
file listing.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-multimedia/opencore-amr/vo-amrwbenc_0.1.3.bb       | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/opencore-amr/vo-amrwbenc_0.1.3.bb b/meta-multimedia/recipes-multimedia/opencore-amr/vo-amrwbenc_0.1.3.bb
index cc049edb81..5cb3a6306d 100644
--- a/meta-multimedia/recipes-multimedia/opencore-amr/vo-amrwbenc_0.1.3.bb
+++ b/meta-multimedia/recipes-multimedia/opencore-amr/vo-amrwbenc_0.1.3.bb
@@ -10,4 +10,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/opencore-amr/${BP}.tar.gz"
 SRC_URI[md5sum] = "f63bb92bde0b1583cb3cb344c12922e0"
 SRC_URI[sha256sum] = "5652b391e0f0e296417b841b02987d3fd33e6c0af342c69542cbb016a71d9d4e"
 
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/opencore-amr/files/vo-amrwbenc/"
+UPSTREAM_CHECK_REGEX = "vo-amrwbenc-(?P<pver>\d+(\.\d+)+)\.tar\.gz"
+
 inherit autotools
