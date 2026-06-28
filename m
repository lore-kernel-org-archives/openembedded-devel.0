Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52A32C44507
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:11:55 +0000 (UTC)
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14718.1782634306442766777
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:11:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=e4NtIGQN;
 spf=pass (domain: gmail.com, ip: 74.125.82.46, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-139aaba3522so1543130c88.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634306; x=1783239106; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rj+dtqbf0hv2upYd2NmOEsduwyHcYG58BPtDUAFGgtQ=;
        b=e4NtIGQNRHKWriXbi3yrD1vB/i5yBFuS/0+eYmpc2Mr7CbVEnQAWS0zkwcluIYX6wB
         f1ImnK+kYDsSlG/V113WMnymSpCYIuadnMpZwH0YuWCdk4a1pYv5UHlHhNBppNPeznKO
         DaOt/IskbyoieaJ5f6PFODkgmVNfGKjy1QSCYl43PstyKBl+aOQojX1p/JEJIpgJp5kC
         0FKZy6iNlVKZsppMeDm5/85r4UcZkhN6I7cgbtTr7Ff0TWrVm/QiejsFhSQHnGsvCWBP
         CW877xh0VY7qUmetiKhHtLOW8eOY7SNfF1kipf2F7iOv8qrQxrqMRGDzTjpVXwXcDMoX
         rxfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634306; x=1783239106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Rj+dtqbf0hv2upYd2NmOEsduwyHcYG58BPtDUAFGgtQ=;
        b=bJ/5S8UmFrD9/qvRGpV7NfKUnhnlxyn7ciYchgjpkC58pgCPLwELaTmt7bN1cZl7nT
         f309DqiL/dg+iPNhkuu8/s2z378qbM546oE6U14m7rAIjR8j/OCtneX63zJARAgBAgir
         /NHBbgeUZcUTLXyCYa7JfmEVVWnfLtINSUg0ojqhLKygYLN7CS6vDwvw5lGSCXCxiE4C
         WTCOgQ/QmhYJk6tXOEPj7i4MnPldcgz3pwU+lC95U8xrYErFCRcYWdQbm1U7EPDGSTVO
         Z6M9K9Xa0EjtiRKKnyTM9FIaeNrokC+LivUZD+OKLpbjiQrk/REolBIHx/iWl9eXSK7r
         w9zg==
X-Gm-Message-State: AOJu0YxciD+qm8999SjYLbVGJdK0xkS+CToqp3v/tXOAs8cPVUP/esI4
	h+5+r3FLQlNlONqCqaaWC6kscOzTEJnnlz44bvG6GB/raprYMgMChSOtVXt8QIWQ17pgxw==
X-Gm-Gg: AfdE7cniCl3IQeBDhSglIKA/8NWGTUqxc9MgpsZNlGMpqJhqEO4eNMkRhheYyaYK5xb
	tkI+vifiy/fRF+UqrGZCTiF9WrE3XFrdEnDNkKgywSMVCzbMKiNt0jMxQh+Zia5XKvk5kulAiEg
	m4V/DO/KMmsFo5DjzkTCm0r6ry+aYPx1d2VLX1lXPA/pQk78JlYDY1JmrlBQANj5iUOVOI0V4dl
	nmjSg028go698vH2VNkszsY526x+dkbjzT7i2jOFXF82pALZOtllo+7Na8DIEHYFF4Ah3kIvuDf
	Lnv4DIRKllb5CHhrpL1t4VKRVueccRXDdpx5WOgh/4FhPVRL8WkXdV4NmsLhckFDl7gqbCChavN
	gilLdT782UKM9mSKJMYFWZ2QxcjykdGJC0vhql+DPuCQM4YE1mt7IDoaxJkvh8IG1c0mc0Qc2mX
	RPhUyMhiJGL4e17aU24NpMM5JbRftEq5tw8AP2/ENtsRFIMq9x3Sobaxf75E0gg3G4qfAjBE0Vw
	HO7dzWig4dVpDI1AbIhCvPXJebujTKH6Iu3SVv/MI+5e/kfHIV2fPQ7bG8LB1VE3MfcxYV1DiRd
	6jX1I1MDMlCCXBmfLMrZAiQ5D81FHyBo5Cwf84HF
X-Received: by 2002:a05:7022:f9b:b0:139:85c2:d7bc with SMTP id a92af1059eb24-139c3c1f8a7mr17334523c88.6.1782634305770;
        Sun, 28 Jun 2026 01:11:45 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:11:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 022/128] geoipupdate: upgrade 2.5.0 -> 3.1.1
Date: Sun, 28 Jun 2026 01:09:33 -0700
Message-ID: <20260628081122.178348-22-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:11:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127832

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{geoipupdate-2.5.0 => geoipupdate-3.1.1}/GeoIP.conf    | 0
 .../geoipupdate.cron                                       | 0
 .../geoip/{geoipupdate_2.5.0.bb => geoipupdate_3.1.1.bb}   | 7 +++----
 3 files changed, 3 insertions(+), 4 deletions(-)
 rename meta-networking/recipes-support/geoip/{geoipupdate-2.5.0 => geoipupdate-3.1.1}/GeoIP.conf (100%)
 rename meta-networking/recipes-support/geoip/{geoipupdate-2.5.0 => geoipupdate-3.1.1}/geoipupdate.cron (100%)
 rename meta-networking/recipes-support/geoip/{geoipupdate_2.5.0.bb => geoipupdate_3.1.1.bb} (76%)

diff --git a/meta-networking/recipes-support/geoip/geoipupdate-2.5.0/GeoIP.conf b/meta-networking/recipes-support/geoip/geoipupdate-3.1.1/GeoIP.conf
similarity index 100%
rename from meta-networking/recipes-support/geoip/geoipupdate-2.5.0/GeoIP.conf
rename to meta-networking/recipes-support/geoip/geoipupdate-3.1.1/GeoIP.conf
diff --git a/meta-networking/recipes-support/geoip/geoipupdate-2.5.0/geoipupdate.cron b/meta-networking/recipes-support/geoip/geoipupdate-3.1.1/geoipupdate.cron
similarity index 100%
rename from meta-networking/recipes-support/geoip/geoipupdate-2.5.0/geoipupdate.cron
rename to meta-networking/recipes-support/geoip/geoipupdate-3.1.1/geoipupdate.cron
diff --git a/meta-networking/recipes-support/geoip/geoipupdate_2.5.0.bb b/meta-networking/recipes-support/geoip/geoipupdate_3.1.1.bb
similarity index 76%
rename from meta-networking/recipes-support/geoip/geoipupdate_2.5.0.bb
rename to meta-networking/recipes-support/geoip/geoipupdate_3.1.1.bb
index e4dc9dee47..a16936400f 100644
--- a/meta-networking/recipes-support/geoip/geoipupdate_2.5.0.bb
+++ b/meta-networking/recipes-support/geoip/geoipupdate_3.1.1.bb
@@ -6,17 +6,16 @@ SECTION = "net"
 
 DEPENDS = "zlib curl"
 
-SRC_URI = "https://github.com/maxmind/geoipupdate/releases/download/v2.5.0/geoipupdate-2.5.0.tar.gz \
+SRC_URI = "https://github.com/maxmind/geoipupdate/releases/download/v3.1.1/geoipupdate-3.1.1.tar.gz \
            file://GeoIP.conf \
            file://geoipupdate.cron \
           "
-SRC_URI[md5sum] = "28f633c49ec87ab01ad3c0fb0228a696"
-SRC_URI[sha256sum] = "5119fd0e338cd083e886228b26679c64bcbaade8a815be092aecf865a610ab26"
+SRC_URI[sha256sum] = "3de22e3fe3282024288a00807bbea9a1ffa2d1e8fe9c611f4b14a5b4d8ebe08a"
 
 LICENSE = "GPL-2.0-only"
 
 LIC_FILES_CHKSUM = "\
-file://ChangeLog.md;md5=11d2e31df0de2be3ccc3e2286c4dafcb \
+file://ChangeLog.md;md5=30029632df335cb696f68ecc2a428987 \
 "
 FILES:${PN} = "/usr/share/GeoIP \
               /etc/GeoIP.conf \

