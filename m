Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22517.1792674906773724149
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2026 06:15:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PfTVFdAt;
 spf=pass (domain: gmail.com, ip: 74.125.224.44, mailfrom: schonm@gmail.com)
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-6767d92cde6so1801225d50.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Oct 2026 06:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792674906; x=1793279706; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pYVXGRTJ5QHzxDTVQIeDi2uC4FEidZHXvlVQ1bgeFYM=;
        b=PfTVFdAt7KIMdL2ifp2WtQcpdMehvooB+eNZIFLwL8+nLbFyk2p1BPJho2wfjc/dVP
         RQ8JHpDqsw3YLuwSUsz8Ucm/oXWVK8Wzcm69EC27tWxIGR8OWaOsVs6QSZSDkvLoxR0t
         7avxl9JFFf/MvJig8JbaqCFe6SCoJcNemAG38SAR3JBZADKzgOceiq57ft7kEOHTOb0L
         I/Lsh3NktpidOVRWY5YtblzqbaqcRGsfVA47rycqkzGCmmeKq1Ode11l4GuvW5/buLDV
         aWHKsJNFBd8A8pa1UpxubpJFQMtUhe6o1Az87S3VtEOiYfX33lFOf4vmn11P0JniN6CP
         kxAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792674906; x=1793279706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pYVXGRTJ5QHzxDTVQIeDi2uC4FEidZHXvlVQ1bgeFYM=;
        b=IZslzcV2ORqRvqkg2BUZsZTNdpSi5AFIJLIwx14oCOwx/j5AoCxb07Lmjw71hLEsz3
         57bjUY5pDXbEzqIybU2yPNUOCBhznl3eHYJ7NVxE8gu3ze5SLZitBa4wmFomLfByitA3
         W3k32CkkF0pH0nefvvQprwLLZJ2vsd5Er9wJ7jojg17TdYFThVeHxWanCGKh7NhQEQaL
         YNZRZquaGAU5s1mx2IrU6cD06LGSwEcAxh5Qehe+yZlsuGImgAVBDR5OHTmH6vfzatO8
         IfiP/nNX1mOCywZDyGguPEwKAAQRsY47w8sw98axd9bkMJB16m9Qlmfr/ZYgwYIbq58F
         juCw==
X-Gm-Message-State: AFq9FYIRZ+tKxKsmDX3GFQNqzr2EYd8EyxWWq+t7oPYByQq8WDDGoupq
	6n69xmnwzbwT6TGy+s3fZG2nkre4mCGKDwKTuYQkq2xHJ7bHB0/vazyAEcMXBov6
X-Gm-Gg: AYBFou24LLyPPbKJq34ppWP1YXvkf5KK6uq3GdsnyUqYVAYxuqb687uCCRXeghuf9K6
	aOjIJa8cIaZmyofGYyyNJX/GNYBwcQv0wleBl21ux/Y96Jsir+KlIWvL6zFRv/4SbirAl5BxO7J
	htj2PqkqaYyxMCi9IiiiAn8MQQyafkGLQQQmabfizC2sG/hFzDEFvs80PBz8xXGH2iaUnOqlPoD
	vvvRk6uyF7NqrTwvHJC1MPMDoi+q4J7yhX0yJjmUIjCvYGI435aDZhBjiH41Njt20YO3V8yWRSC
	p47LFEPQxmdcUyM0bZfk8sgy7WgwM3TByB5HxQLEK8VuxjpfHySgm6VA1ADL7h8hlnhgecuHfzh
	fBPvpRXem/3PdirXlw8dOTeSoLpz6wijVNs9oqK0588P9aLP68k+KLPQIXYKE6j7O6Xp8J4VB6y
	LtYb6Gf+xn+xsxZ9V5OkKl/Opn19EgJ3QQSbebkRewgdRajOLaOEehnNvhvfI4+kaL2hI46i9pz
	n8Eyav5X763HLIZH/NjVAx+F9qHKiPQ7q2cHZ993oXSfgIINLxSANUSxew7pT1k3mMCmuDqMad6
	xCuHi24Pj+gKW7lsEex9AGMdCyTs8bzJolht/S3xLL592fR2L6zGck0eJUoUsCpsoYaSMK+DfHY
	gSGA=
X-Received: by 2002:a05:690e:804:10b0:679:c4a2:8bd3 with SMTP id 956f58d0204a3-67a0e50039fmr1723867d50.41.1792674905700;
        Thu, 22 Oct 2026 06:15:05 -0700 (PDT)
Return-Path: <schonm@gmail.com>
Received: from localhost.localdomain ([71.54.204.63])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a0e539f46sm2595850d50.17.2026.10.22.06.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 06:15:05 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][scarthgap][PATCH] brotli: upgrade 1.1.0 -> 1.1.1
Date: Thu, 22 Oct 2026 09:14:46 -0400
Message-ID: <20261022131446.189859-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 22 Oct 2026 13:15:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131314
Content-Type: text/plain; charset="utf-8"

This is a security release

CVE-2026-111497: out-of-bounds write permits remote code execution

Changelog: https://github.com/google/brotli/releases/tag/v1.1.1

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../brotli/{brotli_1.1.0.bb => brotli_1.1.1.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/brotli/{brotli_1.1.0.bb => brotli_1.1.1.bb} (79%)

diff --git a/meta-oe/recipes-extended/brotli/brotli_1.1.0.bb b/meta-oe/recipes-extended/brotli/brotli_1.1.1.bb
similarity index 79%
rename from meta-oe/recipes-extended/brotli/brotli_1.1.0.bb
rename to meta-oe/recipes-extended/brotli/brotli_1.1.1.bb
index 32524094c6..432d1a7d4a 100644
--- a/meta-oe/recipes-extended/brotli/brotli_1.1.0.bb
+++ b/meta-oe/recipes-extended/brotli/brotli_1.1.1.bb
@@ -6,8 +6,8 @@ BUGTRACKER = "https://github.com/google/brotli/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=941ee9cd1609382f946352712a319b4b"
 
-SRC_URI = "git://github.com/google/brotli.git;branch=master;protocol=https"
-SRCREV= "ed738e842d2fbdf2d6459e39267a633c4a9b2f5d"
+SRC_URI = "git://github.com/google/brotli.git;branch=v${@oe.utils.trim_version('${PV}')};protocol=https;tag=v${PV}"
+SECREV = "db0631dfea829194206d269bc7b25d0908cdb97d"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0

