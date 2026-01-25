Return-Path: <frederikbraendstrup@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D04A8E63C9F
	for <webhook@archiver.kernel.org>; Sun, 25 Jan 2026 10:28:31 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36665.1769336905208106917
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Jan 2026 02:28:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ky2v9v5p;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: frederikbraendstrup@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-65814266b08so6811264a12.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Jan 2026 02:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769336903; x=1769941703; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oMj7Wl8bm1hTDyuOFJdrcCZNq/CtBQSmIjQNBAickGQ=;
        b=ky2v9v5p+ou2pLoTxFg5YCBiHzz5TYacuBw39iwe5+idPlA1yPjn7pJ4mOTXMwZMHV
         /A5H/N3O3Ag1aOo3yoGzKN7FaQo+Qd29672vFsnR/d0mir1FocBzNJCBoMONriOT1Zf7
         jq1lM9J2RpCG+LGlvy00jwNgeinnTRo5PdslRKfotUG9AUL01T/uIqFNgfpYPZDVbmZk
         sM05VEPS3LJX5obtucmeaOFQH66QyA2EsrpJvYFmhg82zbviS/nzfsRiUdZesHDpZFEM
         T0xmvu/0QP8i55UheRveWawVsYjMuTvAWWXJuKBIRh5b1XaYLxYeq3AJLOSF4sSLTlqo
         at3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769336903; x=1769941703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oMj7Wl8bm1hTDyuOFJdrcCZNq/CtBQSmIjQNBAickGQ=;
        b=hfHJo/nwAtEClyoaNpsVQqEb71+cVQTwcwrfq2b70Qn9wgz9XyZIZteWJAl8bD+uTd
         7nZwzwvuFRROejvhXzlruU5WXqyFhqKgzErtTH7w3CqHjctFf7SKO7uM87MChpNro84L
         WnPlTzx4fIM7cwlcE/49Qoo4vmNblJA6BXWq0BOH9ptw4XTqtoBgmecMdDr+2JV+JVp1
         TGIOnogXaahT0ZgynQb5tcC1GLR9S6m56adfNsL1I5Wsh1ko8AKyBe6gOPJGNcxmeDZr
         TsZsfgGCYZK+jt6HoJcjD0lD2WtW+ibk7eDpoWQfH/CQC0nwdA3ms38+GhUD3f0HJELr
         8ydA==
X-Gm-Message-State: AOJu0YzTOj/Zgvo0go7Ar/RoVXZggcNk4JmY94zzcXh/kqj7t84uqsVP
	g7s/UyFYFtJmQwyEMki4e7t7ve/gLGh9Fh6MFqNRX3/Yv/tEOp8gCcSXItVq2w==
X-Gm-Gg: AZuq6aIPQw+CTSQ93clg14LAaOZ5npCYQc/Yz5Bvz3A3xTdbjKpPk2gy3Gf2rswOJMZ
	qOg7diLfSDKoBb9oZzh2yb8C14piUIS8YGwgcXAbgVd1iQNvdqgqEUfRpAD8uFBPCJzHG4xc8pA
	mPWMBP8SBb07hiWwHzTyRdw1kb6aSgPP1awMuPVev8mBO/QefuhLW47q/e3eH41bbTYn5WkHxI+
	5yefrzyZUIxgTkRDTHANlYVzrszRM+PN/GSrZUWCFO13BJYmzw7cS3bRwUSTJ+p5YG3GZXUZas3
	gX0tFNHUH50Xd4bLLpmRf9Yr9+0gdyIGedcIzEBYYMC85vZOKyOD3rcemIqmFYzO0Qwq5ae56TS
	2htRvfNCTckVktdYbo3FHc+A3SQ8u+bVh1a+oINZvyDTBWaV3raXdcLA9K4yA0cPM2Izp+1bOIR
	EMY0GNGOkvpOHfZvYrjYkejxAxahGPn31w6plOT2S/+B/mRu0YMbGLvpFUQaEhveuq
X-Received: by 2002:a17:907:9447:b0:b83:1326:a504 with SMTP id a640c23a62f3a-b8d2e83c6ffmr89013166b.60.1769336903202;
        Sun, 25 Jan 2026 02:28:23 -0800 (PST)
Received: from ws.taila4487.ts.net (77.241.136.110.bredband.3.dk. [77.241.136.110])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b3dbbd1sm437659666b.2.2026.01.25.02.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 02:28:22 -0800 (PST)
From: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
Subject: [meta-oe][PATCH v2 1/2] cjose: Add recipe at 0.6.2.4
Date: Sun, 25 Jan 2026 11:27:42 +0100
Message-ID: <20260125102742.1827360-3-frederikbraendstrup@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260125102742.1827360-2-frederikbraendstrup@gmail.com>
References: <20260125102742.1827360-2-frederikbraendstrup@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 25 Jan 2026 10:28:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123838

Signed-off-by: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
---
 meta-oe/recipes-support/cjose/cjose_0.6.2.4.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-oe/recipes-support/cjose/cjose_0.6.2.4.bb

diff --git a/meta-oe/recipes-support/cjose/cjose_0.6.2.4.bb b/meta-oe/recipes-support/cjose/cjose_0.6.2.4.bb
new file mode 100644
index 0000000000..f6a5d15a9b
--- /dev/null
+++ b/meta-oe/recipes-support/cjose/cjose_0.6.2.4.bb
@@ -0,0 +1,14 @@
+SUMMARY = "C library implementing the Javascript Object Signing and Encryption (JOSE)"
+HOMEPAGE = "https://github.com/OpenIDC/cjose"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7249e2f9437adfb8c88d870438042f0e"
+
+SRC_URI = "git://github.com/OpenIDC/cjose;protocol=https;branch=version-0.6.2.x;tag=v${PV}"
+
+PV = "0.6.2.4"
+SRCREV = "8d94c3ad3237ab6a83d2e92fa541542b1b92c023"
+
+DEPENDS = "openssl libcheck jansson"
+
+inherit pkgconfig autotools
+
-- 
2.52.0


