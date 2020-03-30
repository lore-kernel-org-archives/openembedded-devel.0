Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web12.40636.1585528304579754132
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Mar 2020 17:31:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QWUNZwHF;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id f206so7743134pfa.10
        for <openembedded-devel@lists.openembedded.org>; Sun, 29 Mar 2020 17:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qx+J677HFQs34uqs110mfvB1leljvjGZpwcm8Sqq16k=;
        b=QWUNZwHFQhBfdmQX5JN4lgOT3XCXzdqG79KF2pd9p2paRUTrE/HNlnVL11p5yb2wQK
         jVx3F+aY1ArKlp0cLgIp+0a51wlgmWYMIyOSpaQoUMO1egGMatQd/zizm2x2IcvUrkEv
         v2DpLOzjpM+GnwKrNMS8VQo+5B6khAjkj4IEq4Su1gyAvmcgjg3VcL5WzQxO0bWLcsNW
         Y4WpzvgNa9dVj0mwQSXMCGkEVKeSl6XPqd/+HzGI/B8x7yaXhHn+C0xZlb0asZO0if3n
         nYUzRKssbc677VRoMPN5MURV0VELUCTs/s+trL9rwSyLqInVyWXr2dGgMm/3EWJVOhGY
         WUEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qx+J677HFQs34uqs110mfvB1leljvjGZpwcm8Sqq16k=;
        b=n1cY8tRqKC6qKTxl4vlc0u235Kx5zW8W2GE8qdzDRFMXMTcqwPSDY3KOBv58VmS4fD
         0wC8eKM2zCkvqKiI8pBwhgKPiBzXT8IuTflxm8rrZIwmJjemUBrIgwYbz5Fn/N+fkjCu
         yPsu8U4XuvGpFV+lq8e80kEMHFcCkPhOePh8CcBT8PdeTGAgYcx1WeMpIZhpkpVCsacF
         0VnxR+xu9Z0xepNFe5rkjPEU7wPm214NSaHJ+d4/pQXvVDP0zN1Zzso5XfvnoRSXxgHY
         KS8O7VVtkM5bwHS5Uec9Y7uJ+BhxXCrehOxQNjdjDb3VYV3lnsOouAkWpr1aIb6Kj0JN
         3RlA==
X-Gm-Message-State: ANhLgQ2zq2ataY69Dqj5lOOgrQJFAY823GfC3lfmxr6Je343xIdHDuZP
	W8UjXaoqapgEfZaCBSy61IX6lXgLyZ8=
X-Google-Smtp-Source: ADFU+vtTEk1g8dx/H23KcST74SC3P90NLGbsTXUmZfGr8759FabHwswCoChIWwuNjNkSH1SnL1ZT9w==
X-Received: by 2002:a63:f95c:: with SMTP id q28mr10321944pgk.321.1585528303612;
        Sun, 29 Mar 2020 17:31:43 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::49c5])
        by smtp.gmail.com with ESMTPSA id i13sm4662317pfa.113.2020.03.29.17.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2020 17:31:43 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/6] ttf-inconsolata: Use cp instead of move in do_configure
Date: Sun, 29 Mar 2020 17:31:51 -0700
Message-Id: <20200330003155.1670457-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200330003155.1670457-1-raj.khem@gmail.com>
References: <20200330003155.1670457-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This helps in re-running do_configure on an existing tree

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb
index 20041bb7b3..bf32fedc3b 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-inconsolata_20100526.bb
@@ -14,7 +14,7 @@ FILES_${PN} = "${datadir}/fonts/truetype/Inconsolata.ttf \
     ${datadir}/doc/ttf-inconsolata/*"
 
 do_configure() {
-    mv ${WORKDIR}/Inconsolata.otf ${S}/Inconsolata.ttf
+    cp -fr ${WORKDIR}/Inconsolata.otf ${S}/Inconsolata.ttf
 }
 
 do_install_append() {
-- 
2.26.0

