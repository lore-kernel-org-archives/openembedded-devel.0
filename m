Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id DC24F7F666
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 13:03:28 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id u20so1117730plq.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 06:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=K7LuPo3g4LHzzqAV/wfconDw4ZSwoC6znY8Y1mzQS+g=;
	b=N1I4ctyisctoXCx1zQ+5oxBL5bXJB5ZcjI5Z/X6yazoGnPJlq/jRH0YXDM+zRFL0bv
	iAEYJfcbuIZ0bKNBWsJ9eHiswkooG/Eb9gban8Ix83FjhcZo1pAAdsdzbN2yKTQvYRuI
	Xc5OZel4rLrLIqFryTt73plARVCmlgaMetXQeP2DkR/1/0VaVDZmxgPuM7DeWAamd3i3
	TvGQiZ7zsafzfO3CeH/ogYxjx0Z4PSbMP2gUwVv/bRs+oAbLJmOwVBEgP/KSo7dSd1bR
	2b3HFloZidbvXgnoLpITFlqkEUU+QOEj6H9xw1Ty5AYLRwc32OfdVZio9BRGIKds5eIY
	3sNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=K7LuPo3g4LHzzqAV/wfconDw4ZSwoC6znY8Y1mzQS+g=;
	b=KLyEe+bRtyyzzbDAJNurG3Ze4YuycvY50ZAGPzVpGHQnK1ZfeLyu7cXjUekNNDc0Qu
	y9BpT7MpxI8L7zoD+B1INUCuzITHQC7MauJvsq98jviemXDJNjxWg6IBX/egnwxFgFbv
	tfiUDEFh8AgyW4XTu+daXbXPUXF+tPa1mJs0Q23WIsoUepebDWUJu81M8WyCfsCkZaQH
	ueMgA6bbcJq2r72RHcHggO73zMY0/4znrL++JcaS8JENm8y/Danby7FC1pzbdfo3+486
	x/xHhLHSLO+9U11AyUOWwiwj9P2sc54wvnzvJAIY9MJ72zDwGXtAviTfMQO/bnDoo+Tz
	pXUg==
X-Gm-Message-State: APjAAAW21uPTKIfpPtXmdjMtAh7VXH6ba+hxRPJ6t9f3R/6ih0Fr5aDp
	EcGzLpitB4B+JvqfquQYfrKSygKeADOufg==
X-Google-Smtp-Source: APXvYqwThXdR1ub6RPvTV4bTjxxbSrs3I2GDu10/7p1E4c+QlTrzVATDQSHSpniySjWpfMBfsuNt8w==
X-Received: by 2002:a17:902:aa8a:: with SMTP id
	d10mr4001410plr.64.1571317409242; 
	Thu, 17 Oct 2019 06:03:29 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::e34d])
	by smtp.gmail.com with ESMTPSA id 14sm2877424pfn.21.2019.10.17.06.03.28
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 17 Oct 2019 06:03:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Oct 2019 06:03:17 -0700
Message-Id: <20191017130318.1978280-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/2] pidgin-sipe: Upgrade to 1.25.0
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
X-List-Received-Date: Thu, 17 Oct 2019 13:03:29 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{pidgin-sipe_1.24.0.bb => pidgin-sipe_1.25.0.bb}       | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-support/pidgin/{pidgin-sipe_1.24.0.bb => pidgin-sipe_1.25.0.bb} (85%)

diff --git a/meta-oe/recipes-support/pidgin/pidgin-sipe_1.24.0.bb b/meta-oe/recipes-support/pidgin/pidgin-sipe_1.25.0.bb
similarity index 85%
rename from meta-oe/recipes-support/pidgin/pidgin-sipe_1.24.0.bb
rename to meta-oe/recipes-support/pidgin/pidgin-sipe_1.25.0.bb
index 7632fd2de7..1d739874be 100644
--- a/meta-oe/recipes-support/pidgin/pidgin-sipe_1.24.0.bb
+++ b/meta-oe/recipes-support/pidgin/pidgin-sipe_1.25.0.bb
@@ -5,14 +5,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 DEPENDS = "pidgin gmime intltool-native glib-2.0-native"
 
-inherit pkgconfig
-inherit autotools
+inherit autotools gettext pkgconfig
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/sipe/pidgin-sipe-${PV}.tar.xz \
 "
 
-SRC_URI[md5sum] = "b91106d28c235b347a63dcb676f7b66a"
-SRC_URI[sha256sum] = "958803722b23d869131f76bd90df9da19116d4ca5a873e5253371479b7390f43"
+SRC_URI[md5sum] = "0e742f021dc8c3f17435aea05c3e0314"
+SRC_URI[sha256sum] = "738b121b11f2b3f1744150c00cb381222eb6cf67161a7742797eb4f03e64a2ba"
 
 PACKAGECONFIG ??= "nss krb5"
 PACKAGECONFIG[nss] = "--enable-nss=yes,--enable-nss=no,nss"
-- 
2.23.0


