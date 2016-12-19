Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6FCCB772F0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Dec 2016 19:11:03 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id c4so7888548pfb.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Dec 2016 11:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6WbqpVHblLLEQnLWPJPHIG/I5exI2nBnUa7S+VXb4NE=;
	b=pasWKTgwz+0UjDWk+UfZuqdlZJ6gDtbXDNGjJwvpBIQ+V9Oamy/QXCUPDvYa0ne2kI
	llNq2V2Er098suoVXU6oCpfXKCnsLvmoEqu4D2+qEnX8S2l1nwKLgJUaVy721GZIZCSS
	3Pkz3Ckhiv3b3bccCGasy4WxQZjYpJ5jkhYKTyaTA4JO66kHHokIGgfNxwFluwiruUDn
	EaeQn4mWcxFl0M45bi0Lb+e2kkrnAFaX66SlZzjjSA/2vAagQmDWnR/b2kgv+TDyleC+
	KqAOCzgxe1V1xFWHl5a+4bcCA8gn2ReptLyhUD+wUgZ3j+TN/xQiZiweUWmyHVueexOy
	jOKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6WbqpVHblLLEQnLWPJPHIG/I5exI2nBnUa7S+VXb4NE=;
	b=Iw/RGnWlBHILBBYPKbr3QR7eIftKt1Y6m+6uszIEYkzqJmi8hJvnUNJJPUFAewChxG
	YVPWuI9UoIchUFCCz/4gDZHyJkeN4rzHQGrULwS0SAd8u9g37LSOwsZiClXIgt//JweA
	rDtNT6nYwIDsiEwbUsFs/kDZ40Z95RufQ2QKHgsM6EEZzO53EyAAKgCxHyJtqLqX2CUg
	1mk/ezHK883xrtMEWhK10IhqC3Jq5MmYFU5CifrP3mPM5q+bavYL0Iq5jJMOMpJYDYX/
	dJx/qbV4F5R+qXSLVS5mnX6Zc50KX8Uy6xKobuNDXWPyu712XgDstnP29/lghwHD/O8I
	8IVQ==
X-Gm-Message-State: AKaTC03mhKLmQmMGPUQq2SBtUs9E9+sbMyeIdYrOf4NKOm0Wd348fUU8I6AJ3S+M88MnSA==
X-Received: by 10.99.171.10 with SMTP id p10mr31312498pgf.36.1482174664670;
	Mon, 19 Dec 2016 11:11:04 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	p67sm33309939pfb.2.2016.12.19.11.11.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Dec 2016 11:11:04 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Dec 2016 11:10:53 -0800
Message-Id: <20161219191053.17952-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20161219191053.17952-1-raj.khem@gmail.com>
References: <20161219191053.17952-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] directfb: Disable vdpau x11 spport
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Dec 2016 19:11:03 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/directfb/directfb.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-graphics/directfb/directfb.inc b/meta-oe/recipes-graphics/directfb/directfb.inc
index fc272bd28..bfbd9c29e 100644
--- a/meta-oe/recipes-graphics/directfb/directfb.inc
+++ b/meta-oe/recipes-graphics/directfb/directfb.inc
@@ -51,6 +51,8 @@ EXTRA_OECONF = "\
   --disable-sdl \
   --disable-vnc \
   --disable-x11 \
+  --disable-x11vdpau \
+  --disable-xine-vdpau \
 "
 
 #Once -fno-omit-frame-pointer option of gcc is added into TARGET_CLFAGS as default
-- 
2.11.0


