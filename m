Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2183C5DF72
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:46:28 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24501.1786747580651650344
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:46:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=eSGebmKt;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38dd55ad76cso1611240a91.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747580; x=1787352380; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bn8R7Yj7dvSx9mYehZSnmYZVpmf4+Xqik1Tw5LfF4+A=;
        b=eSGebmKtKQ+X2j4ckKp71ovvLmmjLpF/2KSLdGLiLP3U4C63Ef3SKtBOuzcn4LtFs7
         gHT67qRvudqZLiLEPI9GBTVuwh7to6ICcO5xzns1xwvBAEJs3+aaQqzWjXjtPBMkls+i
         X11YGv1cFRmbzcgNKqhrX3ueBVV/K8V8NrslZ/KuNJI3rx8fF215YK7wzY2xGnL1KUhX
         u567HpTY5yR/4BvzwweJ3ClZ6hURUJosp6FlLyKI7TFNsH7XaJgpS5XBtyXdQTTOjhgF
         S7m6PJbRyS3C5dPiRlwjw6Z5C/zUw/lOWFUW9I0q90nbqXYu9NNWjJshXu+i2rvFMvrz
         WRxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747580; x=1787352380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bn8R7Yj7dvSx9mYehZSnmYZVpmf4+Xqik1Tw5LfF4+A=;
        b=AnDVYKN9ozX4fgOYhyjFshUS0JkyId1UATWbk6UO1GLdglKEPFb2nUj/Wvd6Uuh53a
         SXfkol8+AN6HZPdDU3+CTF5GCgBEpG/Yy6upcbD30rg15zLKwLHO5leoIp7pYTNBWbZH
         u538X0F3Hc6SwZwNx0oSDQx/ebBl5DJNf5alhRzKzjLEmis7z0V1CgEO5oZ+nHXYzqyp
         tBpcOZf0MU3xyAHwXS5nabwgOYAtsPRrGcqxv0uFrKu+Y5BPVbUSXqK1m5iklyqa9mxh
         +pBI8Iq5ALQJt1re+mjFzMA7l4t7g1ja8A29K5xWhhZTteXo2qAwiT6qss8ALKK7OCmp
         o9mg==
X-Gm-Message-State: AOJu0YzoowWVvT+zSqVdE6vo+FpLhWdCJqwMMMmgYvH1kJWy5k+Y677E
	YGNS3fd1AEtOYeAQ482jdpZubEOiQe6aDkOlof1cZDygauxa3jU7auaISXKAvwA+
X-Gm-Gg: AR+sD11I3kJeY6C+S/Zr1bdl1pfSulH2vL808YMqpAgbLaBNhZeSPSgS5XJj9N6AqF9
	qkT3lS6IB5xtrthVTU8cPGVmA1GB5BRhS72yQ3Q5mHfEBeg8aVPft0593XUTHS9b4zI6kjacy+c
	RxW1FDay2yFU0zMoyW+v/KV+8PpQuj1UGLxL743Zo5Kuye/UMjKaOmPSInjG1C5faBiIrgFyoaA
	HCgDan5gQTRFqBFnEVukNTbGGg6ckOws8oI8v5D86tHwqP3zAcYCNUE86lEORN4g4/elFP4Ij8i
	ZUrm4f/qr0cIsTzA5ntN9w3byBVHADHMYufMhS1+yykBkanURd2HxvENXMZDH5sd5hk0PPLfkdo
	O99DHnQ5gZCqLnjJHZK9wbHhri/L8X4LaXn2tScCIa6DFqDFFM6hjo7C191peDZN6U9bXWye7GO
	YqROnX5tUkNJfPKgYYh2hYgQBp7RiEdeoFGCsLd0DJ/0LxvEqpReYMM/JWdA7ocOX+RyvNwaVMI
	kLXX4SCzIlloBeqQ9ZKsb6DgBVXoJHZUJ0qwI5pPt9UrGU9dROa2273Q9al+EXvidY7AMYgr1M/
	digGyIFF4NzML/P/ApoxzYmTg6A1KC5j4exQEiH3OfY8r7Yqt//UzzNk3KMOrxfwLwd2Va7h/hJ
	Cc/P9ZqYa0wF8+PcliMTyPgZXFfZ6BaTO9/6iMcnOf6QKdi7CRtquFisk
X-Received: by 2002:a17:90b:5387:b0:38e:4f31:8412 with SMTP id 98e67ed59e1d1-3931f57bfd8mr13361214a91.11.1786747579934;
        Fri, 14 Aug 2026 15:46:19 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:46:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 034/109] libjs-jquery-globalize: upgrade 1.7.0 -> 1.7.1
Date: Fri, 14 Aug 2026 15:44:20 -0700
Message-ID: <20260814224539.1523174-34-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:46:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129098

Point release with bug fixes and minor improvements.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...query-globalize_1.7.0.bb => libjs-jquery-globalize_1.7.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libjs/{libjs-jquery-globalize_1.7.0.bb => libjs-jquery-globalize_1.7.1.bb} (94%)

diff --git a/meta-oe/recipes-support/libjs/libjs-jquery-globalize_1.7.0.bb b/meta-oe/recipes-support/libjs/libjs-jquery-globalize_1.7.1.bb
similarity index 94%
rename from meta-oe/recipes-support/libjs/libjs-jquery-globalize_1.7.0.bb
rename to meta-oe/recipes-support/libjs/libjs-jquery-globalize_1.7.1.bb
index cbf5700a5b..c91ea729fd 100644
--- a/meta-oe/recipes-support/libjs/libjs-jquery-globalize_1.7.0.bb
+++ b/meta-oe/recipes-support/libjs/libjs-jquery-globalize_1.7.1.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4db68fb4d1d9986d736b35039f2ad9ea"
 
-SRCREV = "771061fb35f7fd8d7c2c37f5d5bb26115be382bc"
+SRCREV = "5e47603c8d2e5bcd61275623fe292d64d6583499"
 SRC_URI = "git://github.com/globalizejs/globalize;protocol=https;nobranch=1"
 
 FILES:${PN} = "${datadir}/javascript/jquery-globalize"

