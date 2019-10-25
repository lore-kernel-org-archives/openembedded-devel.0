Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id 7D0857F7C6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 07:21:25 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id r1so1027973wrs.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 00:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Y3Wc3X10pHlgWo+t+rabLO2IyOMnCkJwyHQMrUYZCnU=;
	b=liVFRa3V96hkQdFr73gx0X3O+uIy8bA4b3vW/7+fc3s52ZtGoORENdNjybovDZUgK5
	mCCfYQd8OBjZ/gyl8ksNx1owLM46cGfo5L4oZmSxa3+OFJb8culWKdA0BUml/A2NZ13i
	cdrkpXCwTHuwY1DB7we81I4+RUe/HU8fheuWApLKKO6kcnHuCTv76WqnNBrvoZ/Hdhbz
	QQtNFAJ2/1JCMKWuRxjb//yPKgAaSM7X/k6fgExRx5YHSjQW1y9qcai66thkYrv10ThS
	sWRgVePbFoKBv+p+m9Lg+8Rm+jqVHHLh6VQvjS4Xal8iiIw9lH0C7xI4HXT4DSpapYuq
	oveg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Y3Wc3X10pHlgWo+t+rabLO2IyOMnCkJwyHQMrUYZCnU=;
	b=Zr67a4xVeJEIYodcUADJjpuaiq4cBEJYW0YHEZdNyjUzipCwVB7RdKo7iznsGCKk9G
	Mi0cmWNS4ZEputhA/IPWxTpfLY2J27cJFAz1ovzP915RRuZCyOBVnyPvcU5rsH3WizCe
	K9LZ4nS+/c2x/gCq+ZnMUwU7ud2ztnNOuqsVyjccPryi8pO664ghHsJlPVd0VNwLRWtW
	ABW0pcWP96l5peZksMBzFeybHCS2rEDo3qp9E97PbKfWR+RIKHaG8HEkJP2yg5foGG4y
	eSltkC2cJnEDolU2w6yIYxypNicx6vB5XcmZbEJs7ePBKd+QBGwSl6bhK4oWC3s7BcLW
	kIww==
X-Gm-Message-State: APjAAAVEH8MTmNqC+uxCcrRslOhj+68vCbS4uBb21Cwnl77wYP4JYMss
	ltqlfF7XYxfiDQ48bTWm/dCEh6h0
X-Google-Smtp-Source: APXvYqx/7FNjjFyXr3NZEZDWX7nrFZQg31lXmqOR1toQcubS1/7QJygTikPuAv/rI0H9JpqepI5yFA==
X-Received: by 2002:a5d:55c4:: with SMTP id i4mr1405263wrw.140.1571988085830; 
	Fri, 25 Oct 2019 00:21:25 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F12337293F05085D4C59AB5.dip0.t-ipconnect.de.
	[2003:f0:7f12:3372:93f0:5085:d4c5:9ab5])
	by smtp.gmail.com with ESMTPSA id y5sm1207095wmi.10.2019.10.25.00.21.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 25 Oct 2019 00:21:24 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Oct 2019 09:20:59 +0200
Message-Id: <20191025072113.11172-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191025072113.11172-1-schnitzeltony@gmail.com>
References: <20191025072113.11172-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 01/15] gtkmm3: upgrade 3.24.1 -> 3.24.2
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
X-List-Received-Date: Fri, 25 Oct 2019 07:21:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is a bugfix release - most notable memory leaks.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-gnome/gtk+/{gtkmm3_3.24.1.bb => gtkmm3_3.24.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-gnome/gtk+/{gtkmm3_3.24.1.bb => gtkmm3_3.24.2.bb} (78%)

diff --git a/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.1.bb b/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.2.bb
similarity index 78%
rename from meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.1.bb
rename to meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.2.bb
index 6dd051337..4ded67901 100644
--- a/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.1.bb
+++ b/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.2.bb
@@ -14,8 +14,8 @@ inherit gnomebase distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[archive.md5sum] = "9524ed4e5c821d13eeda49ba2a78f024"
-SRC_URI[archive.sha256sum] = "ddfe42ed2458a20a34de252854bcf4b52d3f0c671c045f56b42aa27c7542d2fd"
+SRC_URI[archive.md5sum] = "e311db484ca9c53f1689d35f5f58a06b"
+SRC_URI[archive.sha256sum] = "6d71091bcd1863133460d4188d04102810e9123de19706fb656b7bb915b4adc3"
 SRC_URI += "file://0001-do-not-build-demos.patch"
 
 EXTRA_OECONF = " --disable-documentation "
-- 
2.21.0


