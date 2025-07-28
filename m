Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3538BC83F17
	for <webhook@archiver.kernel.org>; Mon, 28 Jul 2025 15:15:38 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.84055.1753715727833983753
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Jul 2025 08:15:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YLMn3LSX;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4560add6cd2so50795e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Jul 2025 08:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753715726; x=1754320526; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=yeNx+bduPN+C1LZC64mdWxXSkzvclModtP55wW6KQ5I=;
        b=YLMn3LSXOZ7svO+1FrSkXV4fH1nBjZDyaaVH7R7hlXCa5UGmdvpMPNGJKFf0cFl2Ay
         544tHD9pB9LVDVXn2G3YWibyT4DddOPM5DCM6uWbAB3XE6FjgN6xZ/w+5tjKYdbIkwqN
         iDisV4HrwAhiHjOXNYEtPipcOQLUnw9tK6SgbSx1EiFHot+cKvbrRyZCV+LpYTVT9qWi
         L8JtYSocpOzk8ccMxFdoEzSoFD4iOU+VdAG1LE2JmmWZofvEgOGdje+QH+OJeve5S/UJ
         JHrbzTOci4A1axqaNcgx5hhkWKmam1PL9be6y537M2lLnCJ+MuwM2LeHO/MCL1ziSevj
         oELg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753715726; x=1754320526;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yeNx+bduPN+C1LZC64mdWxXSkzvclModtP55wW6KQ5I=;
        b=deYQ10ThL672iLGPT504yFaXkC7SF/iuoPD9pSqa/fS4KbPrVTqNsNZkDtdrVYCPpW
         KZW0C72owdNSeTxV1mGzBgtJQfCknTsKUKpf93pifmWtLlE7r6LUA9L+eUntNkR8YZ1+
         RT6ibqbYGWzurEsb9Wheki3oQ0wDT5cvjdp9mOhvKORYdCjP2Qr90dkepgrHwbYFsHZs
         wSxisRrnwowmZdfd57x4BYxnLWlVgiXtHfU/69prvOFEeBrNR9pBS76Qbb5F4APGTqUF
         Oe8aI+4/UZfPRUGGu0RNFDy1+aX8PQMwWUvPzunJhOrRHQoGjI4q1T2kqqISYUDlVfKP
         SG1A==
X-Gm-Message-State: AOJu0Yy5NiU84ZmbesXTOCqtTA0MQVWN4XBC5Tg4inx1MvG6vn5XGAVM
	ZCZ9+0kqsag4HAYXvIdsAZKEMbfDtDbAYuLJ88MRNL9SO6aA23uXZUmGzzlOjA==
X-Gm-Gg: ASbGncvo01bS8qsL3lVX8NVhhLlRJMpc3AIyOuNbaPozLL99kaPLdBPOZk6aNjzHKj3
	x6X25u/N9esQdunxab+ucBEVPO6tDQeWKS6Mx1vXu+H2Umk8qGAR7Ev11BA6wCPzGhmwPCV7bYB
	AnCI2NZDsjk8CWKGpRHQ7R3XojqzMrta3PCu8yUHun8U3McbKgVG4QDVOqyhxxEah9XmNCChuWd
	eOVhx/mh9fcarw/3rwYmDaBN1BQLkbB4Wggm7RNd/KpT5Rbt/p2izhkxUERoP6KLEfTZ4kNC7rS
	wPz5YCkcYSccWNBQy8u/dL5z6fvMYACXiWKRqyznLn86bPLZpYdkGv+p/CTK3T9sRFV1GZ1J1qe
	iu3FhPIrSMUtxCKioic0=
X-Google-Smtp-Source: AGHT+IFN8HplXDmoeFWkYYFNosJACODUaRuJykTVsYzk2B6zlItR2rvuru1lwY2LwIoGUbTv1E9LHw==
X-Received: by 2002:a05:600c:848d:b0:453:5c7e:a806 with SMTP id 5b1f17b1804b1-4587052e269mr127396545e9.8.1753715725939;
        Mon, 28 Jul 2025 08:15:25 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4586ec529e9sm126558275e9.1.2025.07.28.08.15.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 08:15:25 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] p8platform: update to latest revision
Date: Mon, 28 Jul 2025 17:15:24 +0200
Message-ID: <20250728151524.2903559-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Jul 2025 15:15:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118747

There hasn't been a release since a long time, but there are some
rare commits. One is updating cmake requirements, which allows
removing the CMAKE_POLICY_VERSION_MINIMUM macro.

License-Update: use License.md instead of source code comments

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-extended/p8platform/p8platform_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-extended/p8platform/p8platform_git.bb b/meta-oe/recipes-extended/p8platform/p8platform_git.bb
index 138f396805..4c98de3cd7 100644
--- a/meta-oe/recipes-extended/p8platform/p8platform_git.bb
+++ b/meta-oe/recipes-extended/p8platform/p8platform_git.bb
@@ -2,17 +2,17 @@ SUMMARY = "Platform support library used by libCEC and binary add-ons for Kodi"
 HOMEPAGE = "http://libcec.pulse-eight.com/"
 
 LICENSE = "GPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://src/os.h;md5=752555fa94e82005d45fd201fee5bd33"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=b3a719e97f49e4841e90573f9b1a98ac"
 
 PV = "2.1.0.1+git"
 
 SRC_URI = "git://github.com/Pulse-Eight/platform.git;branch=master;protocol=https"
-SRCREV = "a7cd0d5780ed80a4e70480d1650749f29e8a1fb2"
+SRCREV = "2748be52ae27e6007ef548b697d4a03ff7de4291"
 
 
 inherit cmake pkgconfig
 
-EXTRA_OECMAKE += "-DCMAKE_INSTALL_LIBDIR=${libdir} -DCMAKE_INSTALL_LIBDIR_NOARCH=${libdir} -DCMAKE_POLICY_VERSION_MINIMUM=3.5"
+EXTRA_OECMAKE += "-DCMAKE_INSTALL_LIBDIR=${libdir} -DCMAKE_INSTALL_LIBDIR_NOARCH=${libdir}"
 
 FILES:${PN}-dev += "${libdir}/p8-platform"
 

