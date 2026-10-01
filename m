Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2810CCA5FD4
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 16:21:12 +0000 (UTC)
Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15310.1790871667838015123
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Oct 2026 09:21:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=P1z8d+dA;
 spf=pass (domain: konsulko.com, ip: 74.125.225.98, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48af4663da5so2493770f8f.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 09:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1790871666; x=1791476466; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fT5fNRa9sTE1JtHLKThW0eenJ0jClpnyVki8Avs9PJo=;
        b=P1z8d+dABpu2Nl59Q4zJdcUqJ4P5wo+hbuV9rdm+rQsBYHfmcuWjHCsWFGvh+3/JJU
         C1sFz0ZxfcMsYpQGtN8zbFuaQenEdTwhsLe6JZDfuJO36JaIZlbLKsKNAxyYqirTD/lI
         Su5NrHx5xuXYo1Vc19hCR7/i1aq0bEBQZLggA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790871666; x=1791476466;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fT5fNRa9sTE1JtHLKThW0eenJ0jClpnyVki8Avs9PJo=;
        b=C0Sapf7rfi31NgWzNFoVFPbMmYoQqGKtT7csNaOVA9DyyzdjmzDs8slPl3OYrjEKUX
         nEQnM/qsW2kR1lILGFcTR5arKlParbLkvNKBtUFz4f+Vq1c1VgyryGZ84WEpeMepVgot
         2n1upYjeqcmEGmRqO8LJrZILM4r08ZLWEvscK/HmlLog4vQQgXBKlUQpTz03VTZQ9eu4
         OfRacVYJczYDjgAM5JW0qZl7qdtdnw00P2EV06eEKhYvtLwOwmUz/Bv3TjOhqLQHp0nf
         3hqX4UXJpQ0dDhEAadWz2U0efigYN3cuNrGmahih0SyEVP/L9l3/IAfaX6gDSD21SYUT
         J75g==
X-Gm-Message-State: AFq9FYKQYm7m8+UNpDr5kN6yeC0z/WCY+tGlfc843W05lwESqWwvV0VP
	bfUZzXx9Yr2dHMVJM/XJJ07CPn2s5bwA8FuQpxHnHv1NLVzPZsFuB6qariKWBEO0UOQxs6xMcUJ
	/GSlh
X-Gm-Gg: AYBFou24WrKuWXg61EQvd28wuC+G3C2UX8EQC/Bs4Ck+GxP5Nl5b9EPKoPqkjQx32id
	+t3CxGdIfQU2BdnAlkeorSCYyiZbycWv2pVL61X+WezdNQZFtxLCkQIgVh7DZlqWI7wygUmMANF
	W6c6ixQb9XKn3jUxYhuVAgFNoBrzmCqlfCwoC3r7l7H3NxaS2nHKSjPjpAUJ+ew+OQIjpKqTNyk
	t+fRlMTpdekkH1yu6zF+R6cVNROxHjd5x45w62wgePzSX3xNoeVlPUP/Bdy0joV2m/kuDKdpZ4j
	Vf7WWdiL8rIWvHi03aS+W8lNtyPVGNAgFjtcVFcQ9hZN9SDKUTzs9UH9CzQJh+5mK6eX65p8sbO
	bIjDEE+2zPqb7DC/FFwTkAvdxeXCVKQGmC81isQETTwF2oiCXWCmACO+hX/hzUnye6292gfrWiQ
	zscpLTWOGBDTsVqKupoxbkOjx0fPXemFlO2V/NHoavR17ngV9pgNnWHZ/ZOLHii/r+opaYMXtVD
	6B82UFmwxZr9OvEH1QKuLdZE8wP3et6PMyGf7tbTIXEOigTs85OQJRPa//WdbocyQsGGF+rfwln
	HaGTXhfji1YSFqtuoLwskcU=
X-Received: by 2002:a05:6000:298e:20b0:488:890f:6f4b with SMTP id ffacd0b85a97d-48b1271cf6bmr165314f8f.10.1790871664739;
        Thu, 01 Oct 2026 09:21:04 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b0db63ef8sm4010344f8f.38.2026.10.01.09.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 09:21:04 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-ping3: Upgrade 5.1.5 -> 5.1.6
Date: Thu,  1 Oct 2026 19:21:01 +0300
Message-ID: <20261001162102.2927672-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 16:21:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130597

Upgrade to release 5.1.6:

- Use Datagram icmp_id and seq_id to match time exceeded messages
- docs: add Russian translation and fix typo in README
- docs: add Russian translation and cross-links
- Also use datagram icmp_id and seq to match destination
  unreachable messages

License-Update: Remains MIT

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-ping3_5.1.5.bb => python3-ping3_5.1.6.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-ping3_5.1.5.bb => python3-ping3_5.1.6.bb} (59%)

diff --git a/meta-python/recipes-devtools/python/python3-ping3_5.1.5.bb b/meta-python/recipes-devtools/python/python3-ping3_5.1.6.bb
similarity index 59%
rename from meta-python/recipes-devtools/python/python3-ping3_5.1.5.bb
rename to meta-python/recipes-devtools/python/python3-ping3_5.1.6.bb
index 84ac72c27c..72543b4445 100644
--- a/meta-python/recipes-devtools/python/python3-ping3_5.1.5.bb
+++ b/meta-python/recipes-devtools/python/python3-ping3_5.1.6.bb
@@ -1,11 +1,11 @@
 SUMMARY = "ICMP ping in pure Python"
 HOMEPAGE = "https://github.com/kyan001/ping3"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3ae28ad230db5766d33276b580887102"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5b1b7571ea8acab651bab228e3ec2907"
 
 DEPENDS += "python3-wheel-native"
 
-SRC_URI[sha256sum] = "6c99bc844e0b7dbc5c9765e8b530140daf1ccd2112c99db01ab79831bd8081cd"
+SRC_URI[sha256sum] = "72588d79400d65dcd39c6c88a8f54b10ec46a9a0ff0a3e167d967e7e9c4fbe02"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.3


