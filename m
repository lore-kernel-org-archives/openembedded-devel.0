Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BECCAEE368B
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 14:10:34 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46149.1770905425727052485
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Feb 2026 06:10:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RNkLCJnI;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso28062675e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Feb 2026 06:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770905424; x=1771510224; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=tMbjVGE16t/e5LK/4zl63AonuL8xCvoeFXsryLANrWo=;
        b=RNkLCJnIbPHxkJmTyLBP4OUejezgEwLfEV7kSq9Nf+s2EiDxGXXQfUlLh3HiCq3HJF
         8pE36uB/1Zm8lWUpHMZEim06ABPYCWyF+SzKBcF/yeUcETdR7W49eMKW30JHBV5t1ZZT
         UKVJobHfzsVQtglrBmzTyejYK/PBaJdRSxdNvZFy7RgtlOUJC3Ppj0Xg+x2nKviVuMfJ
         lvGu8EE7qohZq3cE664Mw/+Emf6PN0hCYMmSfHmbRggbJjWlU5scFJ8I+7yXvSIyjlqH
         cLmLQ/4NzY0qFdOGl/qRH0PFKfE8H5o0uFpEvPV6EFaqetfru39EPndfVOivfJ40H2D4
         busw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770905424; x=1771510224;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tMbjVGE16t/e5LK/4zl63AonuL8xCvoeFXsryLANrWo=;
        b=g54Etz9yDfDzGwKHfITobQug67nh5Le3OR4cDSu3SG20Cic8rOhVDZfpBbnOKhM9yg
         5TNRL/7CPjDMmVML17A65XwG0uUySquA726F4RWM6Ez9u6HCffMuHWtEVjLI9PaT1eJl
         qbSZDMFer39f3EfnQJgt2yRUKob/IJV9rvXIg6QNF0gZi58JbThX0gBvMw3yYLBCrgl8
         jlJBFkeGuNfF/kZwWOZBn02Ie46vcQVkqkN4mcuf23W98lpUZ+GkVBotCGcu6HW0x6tt
         VGZqGVSJLkPxJhW1HVCPVO0l1dhO+7enCFV4IYhkxrBKpPegTgcRC6SDeo56ZMJ2wpR/
         F05g==
X-Gm-Message-State: AOJu0YwrQ+6G/y2swhlgL7uPcXG57GxXoa9CNplWCrxtb079slzOhEKc
	1ViHiGycVUybOXksFIpFpUvdPlaksv6xRc+YOsIBVrOMzmYsuc9mNxLAiIQTzg==
X-Gm-Gg: AZuq6aJ796kONwKLWtRnf5RwpQ4Gu5WurTMy47FxvT5IcnLTQWncXezDL/+H8spuS8F
	1HUYp+vC9C7S/Q2pVlMDkvEfUJJfImkAa4eo4SIJTDfsJgfFwGBuM9QP2az5A4fzM56yuUAjlmf
	vbzCGDxbF5x96IUeQXzCa3ssykiNE3WMTvnsM+nDTPCVIO8k1d8mQ2L7A7STDrSxs3p8hMKNZ/U
	AN2q+wuJAra8E75+a2oSrhmjNvcAzvgY3JXzqRZFkDA2DtJVitu1JI94yn9W/AeKODpMZsNZXtT
	lc02szoGjSUpewSXHTz0QHzLMgJ5CzPeA1EIw/pCDuGJqZkeohy3aqMjY8GS4m8m1XiOp/cG64J
	vm5OSAxV2uSTpsA394mC8DNlmGctb/HAod6bg3fXXKtz3Hk5Dlqcf4eiS7zXhwyhftgK8gTOB9r
	ZdLDVH+BSmD8b+KXLaclHq
X-Received: by 2002:a05:600c:350f:b0:483:3d42:d04f with SMTP id 5b1f17b1804b1-4836717f016mr31663095e9.37.1770905423721;
        Thu, 12 Feb 2026 06:10:23 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43783d50f24sm12435260f8f.14.2026.02.12.06.10.22
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 06:10:23 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] nginx: upgrade 1.28.1 -> 1.28.2
Date: Thu, 12 Feb 2026 15:10:21 +0100
Message-ID: <20260212141022.1032677-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Feb 2026 14:10:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124356

Changelog:
- Security: an attacker might inject plain text data in the response
  from an SSL backend (CVE-2026-1642).
- Bugfix: use-after-free might occur after switching to the next gRPC
  or HTTP/2 backend.
- Bugfix: fixed warning when compiling with MSVC 2022 x86.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-httpd/nginx/{nginx_1.28.1.bb => nginx_1.28.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/nginx/{nginx_1.28.1.bb => nginx_1.28.2.bb} (66%)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.28.1.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.28.2.bb
similarity index 66%
rename from meta-webserver/recipes-httpd/nginx/nginx_1.28.1.bb
rename to meta-webserver/recipes-httpd/nginx/nginx_1.28.2.bb
index eaaf2b75e9..9699b7189d 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.28.1.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.28.2.bb
@@ -2,6 +2,6 @@ require nginx.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3dc49537b08b14c8b66ad247bb4c4593"
 
-SRC_URI[sha256sum] = "40e7a0916d121e8905ef50f2a738b675599e42b2224a582dd938603fed15788e"
+SRC_URI[sha256sum] = "20e5e0f2c917acfb51120eec2fba9a4ba4e1e10fd28465067cc87a7d81a829a3"
 
 CVE_STATUS[CVE-2025-53859] = "cpe-stable-backport: Fix is included in 1.28.1"

