Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16887.1792649007995630876
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 23:03:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OO7MWW8R;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8ac525c1f05so12846487b3.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 23:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792649007; x=1793253807; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1SiiA6wo/zAejuXHI0ifs0O3KWH7NrqqmBQjnbcV/BA=;
        b=OO7MWW8RGXPRoDS8cqarsrrbRDBicit9Jp6RAgt2tC0StMW96Wk8bygSD6XVLSN9+M
         Ia8AZa1j3UfJ0gG0HmbnxcpSRnhMgQyuESWEBreGSwnNCRFDtnex+mYiJPQmLKxIDoii
         G8m7/t6o1s8MOP5wUBB52JEA/XsL8F4qaOQkKxMZOjSELHRxS0JJpdjr5F/OL+dhKVNH
         fsHTGXhhcknfcHVEy1cwi7jKebGiCd5YpacQJDwEIq8hbSfglEztFq8sii6lMPq/NVzW
         VK+HJPxiPBmMK9d8vM/c//J4brRmCmy3hDrzfrL33Mx342EOKNdr/QMidu95/Yk24nqN
         ZgNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792649007; x=1793253807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1SiiA6wo/zAejuXHI0ifs0O3KWH7NrqqmBQjnbcV/BA=;
        b=PqA2BJzTHnfw+KNKrjbImx0Tp4Ql7U0RZoBEoCP8kIQ82kWZA9euvp9pgjVMmIvFXU
         EnO7Ty+SqpH5d1WT64Tuxq1pF3EaJkoaNiI0weSjP4RG/YZEn2nRaRFJt4ejllm0t89F
         KaB5RGRXruAC7XiAB3OMrJFCqNahwFnzGEvaAo1DNX6oCiQzoI3B3P1VcLbOHjFukHgC
         8aeRgRh0+dbRxvgFijW+ADzL/MuhAe4HVsqtz2QQo4ewbpk4e1X7KTh5ogNapzpZJUBN
         4yBKrsCJUj2dDCNJaiMLKKodVr8vcdA5j7slWYlNjvMZyk+o1pJ1I1j6XERT3wnhkgsM
         OgDA==
X-Gm-Message-State: AFq9FYIyBuTqVihr0MYewAdKDvtWuNIr635j/zv2gOXLmAl/jyCEqWMa
	neTPKMfi1DOenwCHNxX3wPomONq/J/krGIO54mDxUxDQAVWZlKxOl5EIGvOODRRh
X-Gm-Gg: AYBFou1mCkRVl1LdGw0eD2m3wqxRHbOUYCBNKOtfW5Yu7ix59Uqu4RPiqTIKPVMH0LB
	2OB7ItJv+I4mgfTUKpMz057ypo6Fsb0WtrH+mJz1xc6Fy0E0j3MNmIkg3Aj6pNgVtwA1tqT+kgq
	bRAnjJ8i2C8J5knLcxxj52nfLRuzQrZcESDdYtlW47VzcDp3QpVr1nxwuK1eypX9gxVVxxbo0/S
	l9JrSlm0vcl4Vvwl0nbo6y9Nd/K/Q8/iTj5gX0yaGT3KcvKAE7AgHNc0LY2HFhh4I6LMntMCUCQ
	1pf+/jVWfn/y8k2kCtZCO2/kjvMjcqb0cdRQJUkWBixwB/Ku4J9kE99ZkVZRlDgEuxe4ABRZgyl
	0j/DOZOPfgi7+IE6cJtWsLhwax+p+zJH38Zk4oGOwy3jBidcy4sM2LKbL9CqK+jVaVHzNuaBEZY
	TtS1E5OZ9D8whlSXahAzitY/skb58PRYzTHDsb5BstfMtRlA5CUBh9u7aW6H7x/gRqNNq4fKDA6
	bt2YrDa+gDPDpglwmdGmwN6AkhCT4NRTNIPF0hhhN6l8Wo0W5bU9FXvYyhv/vImFnA80IsH9Dtm
	Fy0WStnwCzuJbPtbfvyaK7caDKnOv/YQEJGwQJHhNyeLgW/a19hTXY7xbVC6vF0QzM2KP1jYO1i
	h6hASaONTF2pulcBtMIeIBEDp
X-Received: by 2002:a05:690c:f95:b0:8b0:f0cc:db01 with SMTP id 00721157ae682-8b133e03e10mr26227177b3.65.1792649006776;
        Wed, 21 Oct 2026 23:03:26 -0700 (PDT)
Return-Path: <schonm@gmail.com>
Received: from localhost.localdomain ([71.54.204.63])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b13012f91bsm22280927b3.34.2026.10.21.23.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 23:03:25 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH v2] brotli: upgrade 1.2.0 -> 1.2.1
Date: Thu, 22 Oct 2026 02:03:02 -0400
Message-ID: <20261022060302.186084-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 22 Oct 2026 06:03:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131308
Content-Type: text/plain; charset="utf-8"

This is a security release

CVE-2026-111497: out-of-bounds write permits remote code execution

Changelog: https://github.com/google/brotli/releases/tag/v1.2.1

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../brotli/{brotli_1.2.0.bb => brotli_1.2.1.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/brotli/{brotli_1.2.0.bb => brotli_1.2.1.bb} (79%)

diff --git a/meta-oe/recipes-extended/brotli/brotli_1.2.0.bb b/meta-oe/recipes-extended/brotli/brotli_1.2.1.bb
similarity index 79%
rename from meta-oe/recipes-extended/brotli/brotli_1.2.0.bb
rename to meta-oe/recipes-extended/brotli/brotli_1.2.1.bb
index 84495a3236..dca16cb79b 100644
--- a/meta-oe/recipes-extended/brotli/brotli_1.2.0.bb
+++ b/meta-oe/recipes-extended/brotli/brotli_1.2.1.bb
@@ -6,8 +6,8 @@ BUGTRACKER = "https://github.com/google/brotli/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=941ee9cd1609382f946352712a319b4b"
 
-SRC_URI = "git://github.com/google/brotli.git;branch=master;protocol=https"
-SRCREV = "028fb5a23661f123017c060daa546b55cf4bde29"
+SRC_URI = "git://github.com/google/brotli.git;branch=v${@oe.utils.trim_version('${PV}')};protocol=https;tag=v${PV}"
+SRCREV = "db24a98aed38a16de78cc05ca15cdd8dc2a0d92d"
 
 
 inherit cmake lib_package
-- 
2.43.0

