Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D24CCD5BB8
	for <webhook@archiver.kernel.org>; Sat, 23 May 2026 05:01:12 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3077.1779512465912237755
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 May 2026 22:01:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ca5q/pw8;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-82f9fdfc965so3797323b3a.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 May 2026 22:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779512465; x=1780117265; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hQ+OFGLY9EFUCJpx+fRvDPZFDsXA8YxxbGJ1P501RxU=;
        b=ca5q/pw8EKBVQoTAWHFsATX+9EbcsQqe1JT0a86KXjjtpwcIY7xbHwz7Fnl/3C6mdt
         pbB4i08CMxpZ6mHizol+s2LHklWd5uzQ+XWeI1Ppeu9NTkZo/Un2GnPgUnkXLT2y4fM/
         h+rlNI4+D4MtGy4/OaF+6H2h05hwdrmv7lLg2P5FvdYItH/kqgw42zn2hGmbdSL5KoyW
         bGRUG7nlyGNj2CXU+vN71cortwQxR46CxC3+5do0lYSMwjepUYZK9jX8haqxdXD4+CKN
         cCrbm1zvG/YT4mfySTyikc+MUSaQnXQiNHaGz5D+UtxsFkt1/Z8Uf4O7+/7Z7qlhfty8
         6UNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779512465; x=1780117265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hQ+OFGLY9EFUCJpx+fRvDPZFDsXA8YxxbGJ1P501RxU=;
        b=qxf03tfhYMh6XM7RF1xCMSgqwnoaRQddmVL8ps8wBn/b9a6TJ0CU1ml+lRm1CPVHq+
         zqpdca0oZWDLWulrEuIAyJ97EUWWeJHHbr/xhQMI71sZWMSfs59N1v68NSfHqfJMSzq0
         5rmWuvsnjoppSOfWVlTLY11zMwHsWAOYpT8LeE4X+tf9WBXIa3pxToyfcYCzfcLv/kMR
         59trTMhy8rBYf8vbH67j1Y+Qvvl4QB/ONzqTzPPqsKrboBzYh74rLcOc8tvF+Xx2oGr0
         aUCiM4GwLZtw5Z5z4G9ccbB60bSVxoBjF2BiQrwPnnTpBHLmW80o/BokC1B+G0KMhqh6
         ZBlg==
X-Gm-Message-State: AOJu0Yw7Me80nfLbmiGV/qpps1ZYXt90kmsqRn6l0wbEFoRE7TF1e/wz
	KEqQ8/wwlY4T0uhhtvjwKzMXXGpTpCGwiNdof+JJ5s6Fp+uwCAAIVSp7uSXJNqhY
X-Gm-Gg: Acq92OHDAA7oPsTB4BjRqZcoTko+mMUHXvyH+sq7hrcOui7uNeEEOk+AP9/yKC4/IDe
	b85/n5VsKNU0xFsZJ7NQP44C3qVyTngUgdjTs46mW4wPQHFt4hHLTZpKgOBkKWaOro800rRZ46H
	3A3f0fcBxsUy60rKB1IAhjDcwAwfadgxpv/ayWvxLgpmk+qGvHAKyVInkU/7pYZ4RUG0fsda9tR
	eaTiQBRL3gvMb52LcukkzhmWbpHLCx3w0snkB0utuJrcYjiN4VI/VtVRn/vs5uftFX5QVcWmCr3
	Qatk+vHwU9GnkksCGGyOIu+/ZRHfcqgPMewVeHb8S7lkOJEIK+lDF02mfmwxpkH6B32TaKJvB4U
	9t1yfWNS8cp8m5hAJmcAP8sOPB3t11M06YORTPUdY2FxwKHLdyO40E4+qkTXLwVtJm8ro48682C
	K4fjCAOH08lMPyoD8vdyaxdlQ3Zo6/x5Vzba9m
X-Received: by 2002:a05:6a00:180a:b0:835:405a:7e72 with SMTP id d2e1a72fcca58-8415f141d5fmr6195902b3a.11.1779512465316;
        Fri, 22 May 2026 22:01:05 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.153])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ad2ca6sm3423107b3a.5.2026.05.22.22.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 22:01:04 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][wrynose][PATCH 10/25] swagger-ui: upgrade 5.32.5 -> 5.32.6
Date: Sat, 23 May 2026 17:00:12 +1200
Message-ID: <20260523050028.848327-10-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260523050028.848327-1-ankur.tyagi85@gmail.com>
References: <20260523050028.848327-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 May 2026 05:01:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127160

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit a86ee0d4f6134d08b5873dcd9fcd203550708f59)

Bugfix release
https://github.com/swagger-api/swagger-ui/releases/tag/v5.32.6

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../swagger-ui/{swagger-ui_5.32.5.bb => swagger-ui_5.32.6.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-devtools/swagger-ui/{swagger-ui_5.32.5.bb => swagger-ui_5.32.6.bb} (94%)

diff --git a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.5.bb b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.6.bb
similarity index 94%
rename from meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.5.bb
rename to meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.6.bb
index d494f0ffd6..4f157f1692 100644
--- a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.5.bb
+++ b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.6.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://github.com/swagger-api/swagger-ui;branch=master;protocol=https;tag=v${PV}"
 
-SRCREV = "dcb493cdbf58fa885047513bd176a644f92c4955"
+SRCREV = "dcdca62c8b64a0a54e4decd4e1a6c3c712fdcc60"
 
 CVE_STATUS[CVE-2016-1000229] = "fixed-version: fixed since 2.2.1"
 

