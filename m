Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F23EFCCD183
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:52:57 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.18610.1759326771143389786
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:52:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Cevvo5cM;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b3d5088259eso606914366b.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 06:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759326769; x=1759931569; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VcgC7Mozmmyjb1CBpu3Dv4qapWYC9ZUqlfZf/0G7zzM=;
        b=Cevvo5cM6QETGloeTXiL6qMWeTeWV7zSp5u968ez89LaNG9isu9Rd/aVX2K2CQ/52f
         Etlp+HdC1Fkta39wkj/V3xbQckVwolgogtly4J5Dy4dy2Abve7HO8fuG6DOqYhYuXCDR
         c+QLUO7WQm6/v0TEARFIIWQDwUNLEJlc2nLmKOn4vrs7yklOGrvlpeZNLeG8GnGMbZUl
         mgosrqK86VdnhgeSo9Oz13MPXBeI3dYfEpVqJte/Rgm63rUDoGLzLtPq1umQRWhc0TeC
         avFFCMZ7NM+hhdB1p6J1oD7EUU7mPjjRcNUhG9nkf8OW454Ai4RlA72Ya+e8wrwwSkK8
         7XYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759326769; x=1759931569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VcgC7Mozmmyjb1CBpu3Dv4qapWYC9ZUqlfZf/0G7zzM=;
        b=oHWAAhA5a27OJwSvCViJVP1r6WzhTPgzXDOq6LqGqHRh90gdM+eqnDf46vuD70MnjF
         VHc3aJN5zWBlYcGNs/7hl+I+l7sAGGwFGsxvFNM18UeQVO8qJl7GNMemG14LV5OM2OPu
         vwYJT8WHH+alosR32CCIyjruuClyuBisW/avq6VAIW9KaDq24szPH78KVG0mUJCs6O6X
         Z46RBjeA4p9w5jqzBPdVqcQ2DBs+Ah8vLRm8+VPyB6+XQUe++6M54izfDGR6Q7fpL0ln
         A/1gryC0zAHPcD4wBPQsEWVna7gTTmWMmJW/QTG5diKOGn0KkL5bBlizOXQfI31PJIXx
         foZA==
X-Gm-Message-State: AOJu0Yzwsdli3NewedoVb+nsyu1Al/puqXjBOTfG71yudHkpVuuMhYFe
	INBO2GgRlBu8wWFeVdm4fdJ5qWO1ZRERuV4mgGuJXQvaCeUQyIsmhkbH41Cd9Q==
X-Gm-Gg: ASbGncvVCMKw25sy4sx00xJaMnLn/NZhHQ/w0rw7b7UiZaUxaqTXPaoQMVBWBCcS+mA
	64yFNufmyiD3mKEFchwq3gCuxF7B75LYDb9YDqN8gfvpAmk1LlHI27vlxsl/7BMxLxOYwv1TBAj
	Qb4CuwLpaV1MPmC3OaO3msl8B27nawv1DSj9OIy4TdwUykI3zsn0ZNVs6WASUlIgHDnctszXMbJ
	7+rp6mNpoH9VAublCC20sM9q0jhOj00mlBSO9OrAeQHs8EkvOEJDKRfl3eHTs1aqEjybQTQzDCs
	hwPtpEfC6LfFbQz7wO7Rin0Q07hD8sBX3VMvC0b/aOUNsse6mjkTw93dtFtBbe4D2ANvCjJsiyF
	t0dZz09Xhoc5794MNShUzqgXFH4M0ie81wQdfamWncJ+R
X-Google-Smtp-Source: AGHT+IHbeXFWHsEyc3PmnCR4WuQMnZJfdPaAwohPS+goZAPDrdHYj6g9Z5+0zSj7VFVnSSKlu9OyBw==
X-Received: by 2002:a17:907:1c12:b0:b29:b4ac:d2a4 with SMTP id a640c23a62f3a-b46e515fc7dmr383294066b.43.1759326768395;
        Wed, 01 Oct 2025 06:52:48 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3629badsm11507823a12.9.2025.10.01.06.52.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 06:52:48 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 05/25] nicstat: Use SOURCEFORGE_MIRROR in SRC_URI
Date: Wed,  1 Oct 2025 15:52:23 +0200
Message-ID: <20251001135243.1490753-6-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001135243.1490753-1-skandigraun@gmail.com>
References: <20251001135243.1490753-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 13:52:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120121

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 256ea730b030ec18871dada8953cf5f40e6fc4e3)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-extended/nicstat/nicstat_1.95.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/nicstat/nicstat_1.95.bb b/meta-oe/recipes-extended/nicstat/nicstat_1.95.bb
index 3875f0f605..bf742fa062 100644
--- a/meta-oe/recipes-extended/nicstat/nicstat_1.95.bb
+++ b/meta-oe/recipes-extended/nicstat/nicstat_1.95.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://nicstat.sourceforge.net"
 LICENSE = "Artistic-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b4a94da2a1f918b217ef5156634fc9e0"
 
-SRC_URI = "http://softlayer-sng.dl.sourceforge.net/project/${BPN}/${BP}.tar.gz \
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz \
            file://0001-nicstat.c-Do-not-define-uint64_t-and-uint32_t.patch \
            "
 SRC_URI[md5sum] = "9a0b87bbc670c1e738e5b40c7afd184d"

