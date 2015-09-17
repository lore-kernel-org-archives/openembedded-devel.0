Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 0F9E776DF8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Sep 2015 00:41:46 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so2925737wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Sep 2015 17:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=hZRhduxn8nXSjsP11sk9KGk6ZhtB9Gb+6R/3Zc8I2As=;
	b=rBbXrk5deVhNQnNrHiNp5HxE0N3fTynSwqyBmeZv12oAvrdmI6rmwaxn280+N41kAN
	B/1jvbEaItmZQEb1qFe9KAwGC1yidRb+6fJKxl3icpFWticwSbqZtA58KlUhbdMiglIe
	3StNArUOlM6DAICujVglzLkkrJNrMhy451WHWd4lzdByNXqa9D6wc+97MRfGsaz+lPbQ
	vkPo5HlN8t5Ma+nszFd41FnLZvMqDqd4h9vMysYUOfOEyH+9U6p7Coj7szf8o+oN1r3m
	COITIDz5K9zCto6ykCP1lf0XeQsQoWDNP6shGfvjY8PbrojaT0MHgVWwl/SbFpJJfjA+
	lufg==
X-Received: by 10.180.12.195 with SMTP id a3mr23725458wic.71.1442450506113;
	Wed, 16 Sep 2015 17:41:46 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0F55.dip0.t-ipconnect.de.
	[79.223.15.85]) by smtp.googlemail.com with ESMTPSA id
	sd14sm393216wjb.36.2015.09.16.17.41.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Sep 2015 17:41:45 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Sep 2015 02:41:16 +0200
Message-Id: <1442450491-14912-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1442450491-14912-1-git-send-email-schnitzeltony@googlemail.com>
References: <1442450491-14912-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 04/19] libburn: initial add 1.4.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Sep 2015 00:41:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-multimedia/libburn/libburn_1.4.0.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/libburn/libburn_1.4.0.bb

diff --git a/meta-oe/recipes-multimedia/libburn/libburn_1.4.0.bb b/meta-oe/recipes-multimedia/libburn/libburn_1.4.0.bb
new file mode 100644
index 0000000..91fe693
--- /dev/null
+++ b/meta-oe/recipes-multimedia/libburn/libburn_1.4.0.bb
@@ -0,0 +1,11 @@
+SUMMARY = "Library for reading, mastering and writing optical discs"
+HOMEPAGE = "http://libburnia-project.org/"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=9ac2e7cff1ddaf48b6eab6028f23ef88"
+
+SRC_URI = "http://files.libburnia-project.org/releases/${BPN}-${PV}.tar.gz"
+SRC_URI[md5sum] = "82ff94bb04e78eac9b12c7546f005d6f"
+SRC_URI[sha256sum] = "6c975abae4ae1f80e47fc5d1e235f85157f73e954c84627a5ef85d8b1b95ae94"
+
+inherit autotools pkgconfig
-- 
2.1.0


