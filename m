Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 693FBC5DF6A
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:09:28 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28098.1786651760183676539
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:09:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UApUsyXt;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-ca88130e09aso132132a12.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651759; x=1787256559; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CNf174GKCaKfKMxDhBkc5M/djy2d/WIsxuz4TjgfjM0=;
        b=UApUsyXt5/L3+m+hnuVpSeKorL2L6rYTvcmj0eT0bqLqdZVJVMpT+kXXD/tiKLTLxF
         dPNW4pkHb4/d9C+V79MOl0G1ekZVouwH/RvaeT2ToCpXoIO9AFQSu9Q+DW8ep03WzE3U
         5Jzhu4iKP7hFO+k92s1w3cmM4vNHod014rsjZs4uyanfn8K8PF80IglEKlHiQ7MoK0ck
         vcxFxtYhq6f4sVN5dlvAIT0PLUx8ujMzmJ6s/nbWghyplifr0WZKD8bQfSnHY4eVmDH7
         5Wd96H8iAeDpTGJ8hGd7NZQv84bt35gf6gYv3pJt9vJ7uzY8tb4KIN5nyVjmxXVP0bbN
         YL8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651759; x=1787256559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CNf174GKCaKfKMxDhBkc5M/djy2d/WIsxuz4TjgfjM0=;
        b=bi8TVup+GjjgZjNYzIp7tj6OzUAG2xknPpD5dHMNl+rOXdH4By7rZeSKeBAHL3tLJw
         s5a3wPgB2c6y762KLXDTThOdFEOMlbOpIxaor/RQysL0jGigM9xixvMMeU3z8CxW3MKH
         OeTswkdBgEx3iz4UOSSbxQHmkzmtnZG1VXShLpbDgjTiPgwhu12Q4d9OEoLW6QdD0L8K
         m1N/tp8+ZHZXkQ79PM27jAD1jrckYuUoLbiHST1wJrf56g4BDGsX56y+EHbWXT0ZJJwa
         7N9eYt2nu+7RFWOkO9tEwE7gVyGDDm/ASFjPlypqyPr3TjN8ocIcI6rY6bMhz+OHaCXU
         ekNg==
X-Gm-Message-State: AOJu0YzUnNSCsOWiAKdvEIp9t9eTG14/Nh6I+wVB2evnWmCvTOMwCRj3
	PNuw4UgYEjT2y7q1UilhC9ohe9agGoAaNY3AHT3Qtb3KOq4SYVqlTnW+dwLVEqer
X-Gm-Gg: AR+sD10ZDXKsDI2Nt4O1L1b/TSCB5VGxTQrrrYrh06ZunetzpjX07oLaVUIWc7ldgaM
	iZkPk/9drzmMX1xjVLGzY61YG3zcGRnYDUb1muv0In29eQmR1k3Kxyhoz52WesCOe50w+NSQ+W1
	N1r/+JsZtvtxW2UGp7lpRxDWsBDxiz/2pWSCXaPtP3+z+N8tdTbiqi8un4loJyECjS9nTQ348xo
	H9vjKT3EKMSGMkMsDGI+8i1UXMBXyfF3n+3wokzLePYyE1Z3e4DXtDsnWfcsW2qMZfTU0Z9sV/C
	YXorI4YVNL59brggpYHgucocErdvGOEIBg3lt5wyyqkeuVklTdeGp9yJmQmpCwLbBvLvzkyNj77
	yJJUWJCnB7WUyTwDkAEJi++vZvKC83ire3ZrUae341i8/ANFMOGnfwIkvC1TJWUnbXHdZpnNpLC
	oCqfylrIuN/sclpBVt0N3Bns41qcolMVhSV2OFKY7mFyA2XHsX/hxu3L2MmQl9359J6s9G1RssN
	PVokNdyiObDihG+7/COghO5pPwc8XsP0Bu5EZzojvMKETM9wgoKWoI08mSAQ2Ax0mmeGYmDOQE7
	RXWPIu+Iaz0+aPrWwDlOfuYTHhcbyHEbyoj5jzRW+cGPJRY1Yq2A3j6VkrqR63vnbaStE+47x49
	9LQMYY4MHG7/Yc5w8OsoU+7yTy9H5tsH/j/yHWEGgLI8vOA==
X-Received: by 2002:a05:6a20:7343:b0:3c3:a722:59cc with SMTP id adf61e73a8af0-3cc71cc65camr314543637.22.1786651759365;
        Thu, 13 Aug 2026 13:09:19 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:09:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 22/80] python3-flask-httpauth: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:07:36 -0700
Message-ID: <20260813200834.1302829-22-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:09:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128966

setuptools3.bbclass and python_setuptools_build_meta.bbclass no longer
add python3-wheel-native to DEPENDS by default, following oe-core
commit e546c697b7 ("classes/setuptools3: remove wheel dependency"),
since setuptools >= 70.1.0 no longer needs the external wheel package
to build a wheel.

This recipe's pyproject.toml/setup.py still declares wheel as a build
requirement, so pyproject-build's --no-isolation dependency check now
fails:

  ERROR Unmet dependencies (checked against .../recipe-sysroot-native/usr/bin/nativepython3):
  	wheel
  		wanted: any
  		found: not installed

Add python3-wheel-native to DEPENDS directly to satisfy it.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-devtools/python/python3-flask-httpauth_4.8.0.bb     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-flask-httpauth_4.8.0.bb b/meta-python/recipes-devtools/python/python3-flask-httpauth_4.8.0.bb
index 1b43b834c1..f090f1d40f 100644
--- a/meta-python/recipes-devtools/python/python3-flask-httpauth_4.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-httpauth_4.8.0.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b69377f79f3f48c661701236d5a6a85"
 
 inherit pypi python_setuptools_build_meta
 
+DEPENDS += "python3-wheel-native"
+
 PYPI_PACKAGE = "Flask-HTTPAuth"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 

