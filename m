Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3510CA5FCF
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 23:31:16 +0000 (UTC)
Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.125.1790811069971656948
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Sep 2026 16:31:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Al+EnaGs;
 spf=pass (domain: gmail.com, ip: 74.125.228.42, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc797656e5eso2961888a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 16:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790811069; x=1791415869; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XsDpfBdMumRpUMx82HdyOBcC8MXq6xPlGMC2vZcCGfw=;
        b=Al+EnaGsluizlSzdUMsFQitQBVw1UqZt5X2vz24gSjeYvPiVktmNcwJ5CNjCFXpJ7w
         bnl7cvLdmmRGLgz9Z9yPyNwlVYtVyacpuOjx6g0fRSbBFhjI20IbV2aLI4ku1i11ht7q
         M+olvp9nuyG+nU45yM06QBx7gAjk9rLJGWD1Ns7Pir7xltmSiNRewVL8oTBFUgff/vkX
         2K0Tgk3cvH2KL13indTuUMgypSQCvXk8mQBSD8Z5D5bYMBrjGUiF3+HCKokwZWWKS5Gp
         +QL+JNdbkymiEUInMalIV0nqQlctcCZP6ho21vhzBOdX/sTpWbK/RSvq6ZsCUrChsdSC
         dFLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790811069; x=1791415869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XsDpfBdMumRpUMx82HdyOBcC8MXq6xPlGMC2vZcCGfw=;
        b=GHmi0cSp2tXD93wnhOybhCwa8szxtDofzn0Z76lqwQ7TsvGEzTJhQqivlYL6bPvVf3
         1BNB86sZSGgeqivogx2JRgROLiGwlMVexKKFBt1h96cytL5lokV1bDKWpPvRJDju9SnX
         yxX2yBaKKVGtSw/zfHud7Tme9tzcPoMHCNi/VlyLAF40y7XOL/0uazWpk1w1C28aTg/I
         A3t9yi5LhfUgce8Q0XFneFvJ2kZfoZmCwVLklY2HOrKYH5ya3kmTUnj33+bO6Lv+WCyR
         8TRmAOhK+sAQVT83Gwcr408JJYgWaLtNYLUON9T2O9y/uo8NSpV1dPhFnXrNJsQsqxDB
         usew==
X-Gm-Message-State: AFuF++naDF/sslDBXIspBvZEPPomvKbDeq5P8zviIGcP8wqjpxXp0/nu
	cf+u6M7gGb1Udl1D26yxkSEXlftFhtW5psQT8xUmB2c7Lzw2bp6ioNTXMNkiAw==
X-Gm-Gg: AYBFou0MR0oeUMf+P8v6nDyyJwRZP631y0Ep/N6X4QS7Y64BwjxlNWI4/lSOEpQsp/l
	yiwU2p5BMvzsTR+g2mXIOmh7giaADIz/SsK2QzyvdEM714J5NlUane550PVAGLO/DbWDpHDsg9o
	mCiTc4j+G4CDuYW5tHagmBRRlKL37oHfEngSpHKYwocZm8ovHh3YjVosBqDcq1y3dUTTcJ1BqhR
	pWDkXZyhj9fFVu8j/38rJrEreySz5uhC1Xh/NHRLqKV03nR+nyCudfEbaPY6bkMhe4W5ABXpljR
	f0dB+HD/4T87/a1sxHgqnRHR45Z8nqHbaohHW58vZjfNhSR6E7u6xW7Q9jZ5IWQUTWtnkSbK3/H
	xRgDYrkW9EbTPm2j7+TmAgZpr1h8keCKH4HHbm/0VJkViqZeu2MgGl/jN5RY7Z96WYzdQ6WhsmZ
	yyboWagjTGnJLur4Wc/8qhcdhsN+0MktvmSzunl7G6Av5r4fRkj2GiPDhvvOcc63y3g/GN8rN4B
	EZ/7Y1KA3qon8HehyIopiPkb5PBNsHyAQ==
X-Received: by 2002:a05:6a20:918b:b0:3de:6193:4c41 with SMTP id adf61e73a8af0-3de9e850cd5mr2854621637.58.1790811069305;
        Wed, 30 Sep 2026 16:31:09 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8881589a0c3sm231249b3a.7.2026.09.30.16.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 16:31:08 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-filesystems][PATCH 13/14] ufs-utils: upgrade 7.14.12 -> 8.14.12
Date: Thu,  1 Oct 2026 12:30:33 +1300
Message-ID: <20260930233034.659237-13-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930233034.659237-1-ankur.tyagi85@gmail.com>
References: <20260930233034.659237-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 23:31:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130546

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Also dropped UPSTREAM_CHECK_COMMITS as upstream uses release tags.

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../ufs-utils/{ufs-utils_7.14.12.bb => ufs-utils_8.14.12.bb} | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)
 rename meta-filesystems/recipes-utils/ufs-utils/{ufs-utils_7.14.12.bb => ufs-utils_8.14.12.bb} (88%)

diff --git a/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_7.14.12.bb b/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_8.14.12.bb
similarity index 88%
rename from meta-filesystems/recipes-utils/ufs-utils/ufs-utils_7.14.12.bb
rename to meta-filesystems/recipes-utils/ufs-utils/ufs-utils_8.14.12.bb
index fa23718611..216236acab 100644
--- a/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_7.14.12.bb
+++ b/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_8.14.12.bb
@@ -4,13 +4,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 BRANCH ?= "dev"
 
-SRCREV = "bcf4b0dca8e58b8fc8265ba746a7b84af86fc365"
+SRCREV = "82157bb4f4e8f7934bf5ce13cdd7775616151e65"
 
 SRC_URI = "git://github.com/SanDisk-Open-Source/ufs-utils.git;protocol=https;branch=${BRANCH};tag=v${PV}"
 
-UPSTREAM_CHECK_COMMITS = "1"
-
-
 EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX} CC="${CC}" CFLAGS="${CFLAGS}""
 
 CFLAGS:append = " -D_GNU_SOURCE"

