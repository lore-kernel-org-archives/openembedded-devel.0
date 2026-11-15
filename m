Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3879.1794729042216501148
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:50:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=yFw0Afwd;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so3168194eec.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:50:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729042; x=1795333842; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IziKaMg7vekqlBJkg4bdDQl/ThFRwDS3eio4KNqjzBw=;
        b=yFw0AfwdWYzVB8foqppKWVd+AMecV8Q9PUA04qqB8PTmNVyXMl0b4zmUK8gJSw6NMx
         WMr+T82zLTpjVihcE8r0Uy4xuKgN+++pj7DPh/NGJTWZRSmyMCC0F2Y8nl1J1PcWC4h8
         0rcA0Jz8Bx77xX5CyA1Z0aobrswFfb0RukS93svdnlgWBC6iXKbbkqYrwbYHNk+7IsVt
         ubTmzOMAO7ft3FHFLHSfjXA9okhQFz0kW0j0/9QdtA6iS5H7Wu+VjNSWIlBDmgBzKBjU
         qzQ/AXvSMqwACLcJYVA7Ih3lMu2vSFA8qltR6farcNMmMWm7jatbEv+t0Dr47A4QUXKv
         xhTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729042; x=1795333842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IziKaMg7vekqlBJkg4bdDQl/ThFRwDS3eio4KNqjzBw=;
        b=Hv5JVcdT+XgypXtjCx4wl+dA28YXXRiVdVw8518PHyZBlefRlp2WYKv81yWE8tI1cb
         5PFcOvAA2J8Rp/d2bnq9ENBMdxnEb33f4zRuy1yAa/wnBKn/AMPHONR0NDI1nrpja/rn
         UXmRP8O8CiR7C9P+3n5Jq36YPbW4vYxUubJAiZMQs3XMmlJiZDEVNYVVHbLl+/vKk6bC
         Em98KUsEBXQt3GnCIOTXzSCOQV7VBTfTw0/boIuOKg5aCFAt0q/1oVtb/MNThWSXEZuj
         aaVpZy/o2S4NQHX2ePiAuO2AadY2gDbi2cpSfbmg2b4nFAbeLc2yV/sWVFpiVfnihih0
         EwnQ==
X-Gm-Message-State: APuU4Z+OxWuEmWCKx/6UBzJ9a93Z/iZ7QM0l1TNU49yEZmGD9yxrtmYI
	u3FjecpIriLQSpQMrT3LFcrFejZpEPhmJ7GFz7BjFPwizIrimIpATNALiJyryVfz
X-Gm-Gg: AYBFou28pyuZmF4mbs/vMRTdGQOcAtUTw/TPb6mArLcVIaAYoDdidW19HYsXf0Dnvmc
	tlOgJJ4uwN+dzDdiooGNi2yBvmwyXOI8IX1w+7cEdepVal4xUn0BMcrgpssz5UEpHaI9tdYzsHO
	fiJEpGyFBTGKg/jzIKPBiZ4ErOtKGvog4HYx1ztFtzaNu3SJsr/Ih0IS/r0IxM+KkhObLisaPmF
	ZfLab2tDL/d2n732Xz0BSszR9ekxBH/14tHViDmEOx7tkpbvdvMx91j3PMkoRXE7dm5E0ZALT0/
	KA4Az6y8WbYA5zKBdZSs8con2U0UsgdxXHqNGcuMOgI5s5fisqB++IUlBHFEi2B4FQsatsEU//E
	T4fVAhr+uWTWTf+T0nAR4twQ7E3ilh/pZ6/eku7m5XOa4rtNahQS3QXU/acTgSQJkTKdzlnxqap
	EjdmmtipPEhM+MUd0l16UVpX2e3fWjEG1Y1aahlF0A95+NjNiEVQv55eHsGdbb3WU1JigPlNVlP
	+Xl/QT3drBDmK2c9qvuydcFWBGiIAf5usxlwtoI2y0q8Nc6WmvbLVw/0AzTWUaK4vW/RLCfsI6c
	8S6rNt4+5gGnCPgGs25zTIpi36pGx68qkQHGh6+U1l5XNdgDKML2FZh48GgQOWe7TezuVKfYfu+
	zHP9mzj5N8Od9gcJkrbLdevTnwpJTF2KEvzh6mo9uHU3I/TAlRU5y1Rp4BgF7sYmGVg1JPAJIWN
	WCtmkgA5ec7QBrNZDuNk8XHZwSDyw7vQuD7JqjFuAkue/KjoW9NVG3Ckaf/V9xBjtmKuYzgPgqB
	OlmD5n4I6IQ1K1uFbPLjhHMihPMLd+ikR8B7zKZE/7tPArFlyVpCEBN5EEHGHUeaTrM65wBIlGN
	CXU1
X-Received: by 2002:a05:7301:4c92:b0:36c:ec0:23ef with SMTP id 5a478bee46e88-379675fc906mr6701664eec.16.1794729041629;
        Sat, 14 Nov 2026 23:50:41 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:50:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 51/96] valijson: upgrade 1.1.3 -> 1.1.4
Date: Sat, 14 Nov 2026 23:48:29 -0800
Message-ID: <20261115074918.2932593-51-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:50:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132321
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../valijson/{valijson_1.1.3.bb => valijson_1.1.4.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/valijson/{valijson_1.1.3.bb => valijson_1.1.4.bb} (93%)

diff --git a/meta-oe/recipes-devtools/valijson/valijson_1.1.3.bb b/meta-oe/recipes-devtools/valijson/valijson_1.1.4.bb
similarity index 93%
rename from meta-oe/recipes-devtools/valijson/valijson_1.1.3.bb
rename to meta-oe/recipes-devtools/valijson/valijson_1.1.4.bb
index c2184da92c..8777632342 100644
--- a/meta-oe/recipes-devtools/valijson/valijson_1.1.3.bb
+++ b/meta-oe/recipes-devtools/valijson/valijson_1.1.4.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5c4583a434195e4f3b418e17c8ca2daf"
 
 SRC_URI = "git://github.com/tristanpenman/valijson.git;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "5eac4b66f20b2c189ae40281c29e71cf39a958ec"
+SRCREV = "de232f2ac3798a3c8b2cc5f3b7ebf737e1c0dbd1"
 
 
 inherit cmake
