Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CC4DD3C532
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 12:04:32 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14131.1765368265722075899
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 04:04:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dQp8PBU1;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7aa2170adf9so5654771b3a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 04:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765368265; x=1765973065; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1GeXld/IXeXPXKOx6FVRbVCkMthclmpmAnhZdrDIvqs=;
        b=dQp8PBU1vFbwMW9kCClrcs6bThrAghzIpifpXmP+f5IVNaDOQ7ETNJoCzN+tmO8F9f
         R1nFqYz/HiQztJbvxgHjvebX21Sk5ijwq/A/NzGgxzWHLEJRI50x3bqYlSuEUZ/mKN0u
         6URxuj1TZOH/cI6A0/1thoUekZRoAmv0Vpv8t4323W8KsBWTw5e3TMizH/xHtPbqbYw3
         oqwAttjd6p8l6SnLa0wizqBlOsU56LuE3ySqWnvExWQpvfRbj+uByDzdeB1WE5Jssb0F
         FuMFchY14YaLwodAnLB9LBpxqIC2ER6wmycgQDuHgcjZLeHezQMH4Z+sNZxI34zUojOW
         3Mew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765368265; x=1765973065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1GeXld/IXeXPXKOx6FVRbVCkMthclmpmAnhZdrDIvqs=;
        b=VVMuRjn1TxKEL7+aIW1VIXk2RYY4X5iEFiHgB49b0dTQFFl2Dfhsx+BmT1oTH/qNKL
         iSAaxOmnUdHFYW02oJ6CiNACj7v+2t6BHds6Obi4k8RS45D8lwHbEz5JeazvtHexJ2NB
         SiNJqOEc9p4zJAvicCNqOCBN6IDp64NvRzdH2PIDh/jFKLYy/205o/Bp7Rw9YLKf8uFW
         jafan7jnH5BNks4LU5h54jGasKTmb7Zjekju51Khk627ozz+TML9WeBMZPPh4Y7cFv+D
         pA7U1anVU4comgJh2QjTj3TZLP4eUcrVK0kPJkZHfOaXp7Kcx5zyKKbCO4v+51uzny78
         Pmqg==
X-Gm-Message-State: AOJu0YwsaLsZTXhXEkco6Cd5L4OKQBjuzLK11pIVHWBzz1G7Te5LHMtv
	ddCP5mItWakk8+VXtCp4fdpcxDvtNf8o60YKTelpToL5je9a+DZa7QVuHegdbA==
X-Gm-Gg: ASbGncvQBUj+HsCXdqi4lY99Lnxyq0Xo++fwrGTCZgS3KVcUn1NZI+c022VgumQq1qG
	DECvM2/F3Jg2qtimBLL6dUWGlqH77MhkbFr/QqZlmZR8rzlTpR+Jely2B1P92mUQ/+bZMBt8mVb
	oUA4x+LDm0SV/hUMqMFMT3srSOCbqfTVVcAnYnB+c4Udy9AfTMi32elTHC25C1iJ0g8/qTqSOM9
	Qk7GLo9+12M5WzPF92w/53HoEUzA+ioLWxN8f5PNIkk83RCwUyRuzxMtKveGV1HHcVvWBBkaQPr
	ANIvU8PfcfkiU4sSuhiJkrCIFmSgJd5FeDEjbT93bUnvaeavGgTMSfRQYKhhwuacXdSExVqUdWZ
	kWbnUmPPuVn+XboqDGe5pkXZHY8MkvJubExeybQ9hLpT2OwfFaJMrtSqOt6BEYEMFZ2jW6nVowD
	VwBTuniy3w1wb09Xb3a9Enng==
X-Google-Smtp-Source: AGHT+IEIZkecpoeFCpRhH8ROLjhPFG7UrO6jR38DNAQf/V9mNvvDbcMG9/vuhPhZ4PVLyrEpHw9lCw==
X-Received: by 2002:a05:6a20:9389:b0:366:14af:9bd1 with SMTP id adf61e73a8af0-366e30b6cb3mr1872628637.71.1765368264858;
        Wed, 10 Dec 2025 04:04:24 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.251.5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bf686b3bad4sm17767759a12.10.2025.12.10.04.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 04:04:23 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 03/43] sdbus-c++-tools: upgrade 2.1.0 -> 2.2.1
Date: Thu, 11 Dec 2025 01:03:17 +1300
Message-ID: <20251210120402.4179289-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210120402.4179289-1-ankur.tyagi85@gmail.com>
References: <20251210120402.4179289-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 12:04:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122507

From: Liu Yiding <liuyd.fnst@fujitsu.com>

Changelog:
https://github.com/Kistler-Group/sdbus-cpp/releases/tag/v2.2.1

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit aa8fd63b495a82fb727c2ace203fcaa4c0235f5a)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{sdbus-c++-tools_2.1.0.bb => sdbus-c++-tools_2.2.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-core/sdbus-c++/{sdbus-c++-tools_2.1.0.bb => sdbus-c++-tools_2.2.1.bb} (89%)

diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_2.1.0.bb b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_2.2.1.bb
similarity index 89%
rename from meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_2.1.0.bb
rename to meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_2.2.1.bb
index 0467c834b8..13a7b8a45e 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_2.1.0.bb
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_2.2.1.bb
@@ -8,7 +8,7 @@ inherit cmake
 
 DEPENDS += "expat"
 
-SRCREV = "0261d0ec60b68c1f0a6ec9acf63d1379f7d569f8"
+SRCREV = "28b78822cfc5fbec4bd9906168493e9985f586ed"
 SRC_URI = "git://github.com/Kistler-Group/sdbus-cpp.git;protocol=https;branch=master;tag=v${PV};subpath=tools"
 
 S = "${UNPACKDIR}/tools"

