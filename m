Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34343.1794851731058447333
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:55:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=eNtXGn1B;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3791619605cso7087019eec.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:55:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851730; x=1795456530; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r5d+h71In0OCC+limzJOISjBkkPoXmMbriNafSGZ5XI=;
        b=eNtXGn1B7CTadISIvrOuxRYUcs1UZUO+AEx5jqW1f51iirjjDYS3qBWfbYP15iRG3x
         zOA6d95BaedUFCIOYYKdNJ0ajLYNB7ua0K+6D12qJ9MsXr0xI7HKkXksHqidVyYD04oi
         O/a1RO6PRyiottz1HAwJ1H+3diej5tmdjw83wMSRCIoioN9Br3O6myKhaISHMiLKgrQS
         kpAqkwiY0BFWjP5nRad9tyvq51cXPxZvu4zj+7csJ+SaGZblIA5SHNOBE0Is9corNSN6
         nlOyYhLqC5kA4ow83cFeCLqQIGMXm/d5E8udObGry8MrJBsXsxFz38xVcC4h8lznEKZm
         OwNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851730; x=1795456530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r5d+h71In0OCC+limzJOISjBkkPoXmMbriNafSGZ5XI=;
        b=WfK0a3k1VWe+xbJubKvR5MuUeTzNuwzE1ypYxj7HlVHcHr2p+Oo+afRpRWK9Dy6CXs
         b38g13kLzP4Pwb5KhzyqhzkSs4M/nYV0zKmHHofr3S74xRf5B/1nLmk7q201NYCty6l4
         NdLBNFE06D15ampOJ4stflFX2IGULnElLvLtx+RTwmZaexXmbLlwz3Rjw+pfZUvqn71E
         QV+MeIc8br3aDR+ixDhnU+u9I9xnmqRI0c3g3nc/J0UyGhZlR7oWKIH7lzK91V81HP6V
         7ZoIIUPTEoyAJIDu9x0rUDeLtjN4ihmceLHv/p254fuNWgs36oRsGTAVKlopvE9jBGPb
         7kyw==
X-Gm-Message-State: APuU4Z9Ely52iDp/m2rdIMlKqcB15epIw5nGGQBfbEhqmI0pFQX0bNgZ
	lNesLoGgJ4sviSoBvqUie4RCsvmSC+8MxFS0+jwOxxmmLwjT2+DPPt22LDQv4gs0
X-Gm-Gg: AZFdTZeyYIIlIhobfuGE5gV1uiEDe19X5acyubVOG1jJNjen30h2EUoUGQQpbKN/DaU
	X+NaodXCxyo1iwwN0E8Ue8rUjQkY1dMvWucva4ywgcfa5mOICuWQ93UsgNL9vjLo3xy1hgfVpuo
	jJtPVifVgrrn15MGiVhB4tpVHfPuyzHirl+5xMaECHAGkNai0qOh0spUMgfNkkbZPbAgGcg6PCM
	IKq2US8Avb/XA96t3OSADyztiEwp5dWJMGo/xbb8wAX9yKU1BlMlQmXWy4TkBGin1EuZExbtuCk
	8+RKfj2IQs1IJ5u2H8MAcF9+lxTSUtCAJZOe3MB9B7jhGchCD3lMJ+zkZGe+UHGHt1YLRyBqzFh
	bXw6n7qLJS12vPFXCc12sxjoBhcmuzBghwUTUOH03tu8zWJRPCOPgd6gOkSfpm08qqixjXFZxt7
	jAdwlPLiKZYTcx/+sieoCXUPnHRokeF3rIKMDbQIVNlzLKmbJ1gIv7OsKDpPgsHh2ZPeyLY+iEh
	VJki5ERAYkMIHf5qy3q9lfkppws5u1RTN7nk8jUn1AXu6cELIlzDdFbGi2xau8Ufl/w1XB2hSRo
	Moa1ZK7eTcXovRaaBHM6je534ZvE5ODSGVakWgS20tlUDttiLS0hjXnyWpzzyzQR84GAw1Wzcfc
	ZmXekJh5JLugbki3XFkFx7eN6rbHyko29ehKJmpknKg8JNPlGgPOPYQp525svfZ1P1/qpiiO1VG
	ZkGRZDeZThnFg3euGYRHhN3EjohuEecGGw1TodydV/sY+RzRF9oassmidxni3r1ZZ7WRHjjF+PY
	kynM3zXvwR3E8ppJYP5ILG1pt1jz0FnP3dI+6Y5fQTWF3wb+wBALvHEYL75PjMH0w2/jSVWHlk0
	N/Is
X-Received: by 2002:a05:7301:d185:b0:36b:fca0:80b3 with SMTP id 5a478bee46e88-37966961040mr12387085eec.22.1794851730118;
        Mon, 16 Nov 2026 09:55:30 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:55:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 062/105] python3-py7zr: upgrade 1.1.3 -> 1.1.4
Date: Mon, 16 Nov 2026 09:53:14 -0800
Message-ID: <20261116175359.342679-62-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:55:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132518
Content-Type: text/plain; charset="utf-8"

Changes:
- Security: arbitrary file write above the extraction directory via
  a symlink chain (incomplete fix of CVE-2026-23879, GHSA-jwx8-hv8g-
  gjjq); containment now decided on the real path and member names
  with ".." components are rejected.
- Security: memory exhaustion when opening a crafted archive header
  (GHSA-6pr6-cqpq-x889); extraction hang on a crafted COPY stream
  (GHSA-v999-q5cj-95jg).
- Fixes: PasswordRequired raised when writing with a crypto filter
  and no password; extraction workers capped at os.cpu_count();
  archiveinfo() on empty archives; non-seekable WriterFactory
  handles; Bad7zFile on truncated headers; dry_run honored.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../python/{python3-py7zr_1.1.3.bb => python3-py7zr_1.1.4.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-py7zr_1.1.3.bb => python3-py7zr_1.1.4.bb} (95%)

diff --git a/meta-python/recipes-devtools/python/python3-py7zr_1.1.3.bb b/meta-python/recipes-devtools/python/python3-py7zr_1.1.4.bb
similarity index 95%
rename from meta-python/recipes-devtools/python/python3-py7zr_1.1.3.bb
rename to meta-python/recipes-devtools/python/python3-py7zr_1.1.4.bb
index 1cbbe12fe4..102d4964eb 100644
--- a/meta-python/recipes-devtools/python/python3-py7zr_1.1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-py7zr_1.1.4.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "git://github.com/miurahr/py7zr.git;branch=master;protocol=https"
-SRCREV = "e278bc05cc937ecd1ee62bc6a058db3a21e66614"
+SRCREV = "c717d21171bdc66b6370040dc95a6ce9036f4d40"
 
 CVE_PRODUCT = "py7zr"
 
