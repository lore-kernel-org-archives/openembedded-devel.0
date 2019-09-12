Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id 27F777E422
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 21:49:37 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id d10so20557517lfi.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 14:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=hvWFZ15UGYDaPiUeTv+pIME51a+/kFKwEsxtrJ667CY=;
	b=Uby2yQrAuZKfbbsAVoXL/RZPXUd+I6cDUZJ9YYAfsE2t2g83UoJ+gzG0wTtEK/1W4m
	G0g3lUkaqeyJvL7bW4BFKNSEjeX01qviulnCr4aFEf1GcRiUaBfiyjZT7Sg5czlARF3P
	AMdPNrZX88d91CaxabAOYnrKeH9yvMsQ3NO/J+Q5w0rxS6+efJhtp+tKTCxhhhlBl0mI
	x1ysEG5HzDswUyLPk0wXlcfNRMbzoVmH/YLPTlpRJjGJPHWo2fhQfILh6WtVNi0pa+pq
	d3RtpDHm8PJTeSnIc3k4Hd5kXbNUFXWTF0SJI8+1Mmi5A504MfuyVjx353ZDnyvupBqI
	H/TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=hvWFZ15UGYDaPiUeTv+pIME51a+/kFKwEsxtrJ667CY=;
	b=WrHI+ZvORSsFETM0fMdJuhV2yRPEEZRE86S4iDhPsfNBx0jXxgSTklOYoFQBAiIsw6
	qlkP+BE9lSGrrJd9/o9eA1bqCNit/sPAQor7Jz6eFTS74wlbraU1hjiVe+jWxiKDbC63
	FRwUFZZXqlnt00n4IdBx8XfStyWI0u+2Fi7WJu2I31RmIpabhup3V7D8ZV6Yoy+Kwk3X
	GKLtQNyo5S9XkfWX0slsnL3Ox2y9/EOyxeXu2KLipWgLmros9kAmnGY67+zSFlUkBG97
	QxUaaT3jmLzWGjFJ0Syd5lO0mBAPZDxW9h2TyhyJiClRmvHH0xN9Kieh48b4fT3McqkV
	bmng==
X-Gm-Message-State: APjAAAWXw631o8e/iC4KH3VEsqtGcwvN4N57dupAOZcPogerpH/EoJLs
	PTsmlH0ewUVlcgFCni5ZjomGBHkfsKo=
X-Google-Smtp-Source: APXvYqywTd1eMTQa4OAq9srsvoP9EesHqZkFmD5O+X1sH2HYRM9kh1cDs1LismeIJNNIckDE9QH8Ow==
X-Received: by 2002:ac2:4308:: with SMTP id l8mr5220664lfh.25.1568324977555;
	Thu, 12 Sep 2019 14:49:37 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115]) by smtp.gmail.com with ESMTPSA id
	r19sm6111929ljd.95.2019.09.12.14.49.36
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Sep 2019 14:49:37 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Sep 2019 23:49:22 +0200
Message-Id: <20190912214922.14271-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] libmodplug: update to 0.8.9.0
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
X-List-Received-Date: Thu, 12 Sep 2019 21:49:37 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{libmodplug_0.8.8.5.bb => libmodplug_0.8.9.0.bb}         | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-multimedia/libmodplug/{libmodplug_0.8.8.5.bb => libmodplug_0.8.9.0.bb} (80%)

diff --git a/meta-oe/recipes-multimedia/libmodplug/libmodplug_0.8.8.5.bb b/meta-oe/recipes-multimedia/libmodplug/libmodplug_0.8.9.0.bb
similarity index 80%
rename from meta-oe/recipes-multimedia/libmodplug/libmodplug_0.8.8.5.bb
rename to meta-oe/recipes-multimedia/libmodplug/libmodplug_0.8.9.0.bb
index 1070246c8..398daae08 100644
--- a/meta-oe/recipes-multimedia/libmodplug/libmodplug_0.8.8.5.bb
+++ b/meta-oe/recipes-multimedia/libmodplug/libmodplug_0.8.9.0.bb
@@ -5,8 +5,8 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c9182faa1f7c316f7b97d404bcbe3685"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/modplug-xmms/libmodplug-${PV}.tar.gz"
-SRC_URI[md5sum] = "5f30241db109d647781b784e62ddfaa1"
-SRC_URI[sha256sum] = "77462d12ee99476c8645cb5511363e3906b88b33a6b54362b4dbc0f39aa2daad"
+SRC_URI[md5sum] = "5ba16981e6515975e9a68a58d5ba69d1"
+SRC_URI[sha256sum] = "457ca5a6c179656d66c01505c0d95fafaead4329b9dbaa0f997d00a3508ad9de"
 
 inherit autotools pkgconfig
 
@@ -18,4 +18,3 @@ do_install_append() {
     install -m 0644 ${S}/src/modplug.h ${D}${includedir}/libmodplug
     install -m 0644 ${S}/src/modplug.h ${D}${includedir}/
 }
-
-- 
2.17.1


