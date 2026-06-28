Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EDB3C44503
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:11:34 +0000 (UTC)
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14710.1782634293271155385
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:11:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ketE8aNI;
 spf=pass (domain: gmail.com, ip: 74.125.82.173, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-30e7eb50b83so778364eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634293; x=1783239093; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pn25LGH/WCn/vK2jyLVnzvxBxNtIIap1MwVAPjTGL3g=;
        b=ketE8aNI2JapL6wfIru/52EfiHkKQPywpA0xa0DxKrK95UX9FkkwjWxAzP5L1o5XMc
         u8OTfKNVXi0K4WZMMuMydg1a5n56+02Z6TgI5nbQoEfpob3fpj4lyl9ngYgZadF6IHZE
         Z9SNh7G/IxFuJEu3VcskPghqigJkr4KxFguZFPu93Js5ILsczjHXHxN1rBkbSMs9CLkb
         TGGLbBgpgb6qrEjdAVEQPyGGGS++aze0tALNgNdF1+c+8MkqKfHRaUjvBuUY0pz96sG1
         MGx0LpUb2jZD9Iua8+Fe2NcGsxF3FjnJsBne3+LZBgHjYxKO7q2f4q5sxF52UFyXcJNR
         kSkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634293; x=1783239093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pn25LGH/WCn/vK2jyLVnzvxBxNtIIap1MwVAPjTGL3g=;
        b=hbSWm9/KlJo3Q15IX9O7zeZP1ll/NBAiGtWu053BgJ/YBcmyYtg0nJAhba77pWJ5zJ
         qKRAkCHZcSDlJUbg8pyKxosNxsMPkb6Pei1uqtjebpjfXiWJk8yjNaHABM7ph9OrSH2C
         Nr+lh/zGrhRLVUVFN9pfKW97u/WMYBiCHDkpDxJgi7THt+CPrdKfLmnumoUdMsamAFKQ
         f/Fm5AG4Lwur35BKYMEcoSXsn3icl9Klg/dJBAl2fe/aaibxFDc1o/6xLwSPDN5o34Ji
         drz+PMLbOAGOOWnzSSRQ7YloucxwnNCRFMxaZ01UHOBXW1GQ2StaVKMxDx6TlW41TE4P
         ACcw==
X-Gm-Message-State: AOJu0YxP4ELc6YEghvwL/I/CDl0/BPDExJaFv3fhk3I/RDRWMjIbJvoo
	3ZQKogpATO2fotZ0vzfz/szOr1HN9W61F0Ed1RcAHSugaYenkdGYCIy2JrBgVuuL7vyugg==
X-Gm-Gg: AfdE7ckjARGcoYhjoSFHZRaVN/WmsMslXVSQ8JXU1qUv7GBRKr9KPzB3AHIinWiFVG1
	CFRnsfvsEtUb46df6G54V+oAn3sDHH4fToPI6EhBBaSOcvUBTvisnpt/TKsECrNnhjcbR5gtcOq
	9ls6bDmDTp5TkMASVpi3XQ0O/QYbxhMbJOcqoV3obl8fSIrw4h1TvsxA90ZCv8k9np/sVXJ2uk+
	EeOjswGn0H31cIthO5QoBg22tUWyH/BpMXAzVWi0BY54ancdMJZfxvc4OBPlHWevDnZDdUsFLkP
	8YZTTTVcWcnvoRinbMX9PMyY3ixJKc3W/KBdTFtpieoTVFSBcvolztCwOycVnCiwU4Fxeouj9Rt
	etdWz8HAqWdJlKgKI+fX+mo2ElwJXm34wGQm96hu8ifaRCINw/gQO7+NlNWy6mvJgOCLaEoNtTE
	MHiWSq9zNHUmdxRse+3c4udCVct9Bo/p2dlH4xXmR/pyVbe22iOUtAfPxMTfoj98TQ48om1P+BW
	fD5c08+nEDRgsfYAUCWYxuaHt9B8JJHGBBgeN0JPMctNrRqAVSXWrHxfOz58rFPJd74TCO+X0kr
	ZVgIKwPHVOSQPswCCqRZ3rxEKdshJA==
X-Received: by 2002:a05:7301:7bc2:b0:30c:ab4d:da48 with SMTP id 5a478bee46e88-30cab4ddc52mr5961471eec.44.1782634292540;
        Sun, 28 Jun 2026 01:11:32 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:11:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-webserver][PATCH 008/128] apache2: upgrade 2.4.67 -> 2.4.68
Date: Sun, 28 Jun 2026 01:09:19 -0700
Message-ID: <20260628081122.178348-8-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:11:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127818

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../apache2/{apache2_2.4.67.bb => apache2_2.4.68.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.67.bb => apache2_2.4.68.bb} (99%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.67.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.68.bb
similarity index 99%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.67.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.68.bb
index 082f533c85..dc8c0df12d 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.67.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.68.bb
@@ -27,7 +27,7 @@ SRC_URI:append:class-target = " \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
-SRC_URI[sha256sum] = "66cd206637b0d5c446fa7dabe75fe03525da8fb55855876c46288cd88b136aa4"
+SRC_URI[sha256sum] = "68c74d4df38c26bed4dfbdb8f3baf1eb532f3872357becc1bba5d136f6b63c06"
 
 S = "${UNPACKDIR}/httpd-${PV}"
 

