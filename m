Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id D57BE76FB8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Sep 2015 00:41:51 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so6858034wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Sep 2015 17:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=oq2iy7DW5l1a5kquZvd19yA4LTu+QkqWjtn2OJoUk2U=;
	b=LBHILTlvKQE+1Slx+jaOhYasd53NYppxeg/6hqAabkj6LIKDW9vU0ZvCELU/9Uwl7S
	pukhYSEDP+V6wQNU913+kYeKOUECIV7DwMiJOSv+GkIXV8xkV5GoXutORmNSv57AmM36
	l6FiMjR6g1KioLcKVQdWAEzx8FVhMSdbSEgQ5AXKbcqobRez7xulafWvBGsSImnxTZvn
	G3AgPFDfhdEycQqQOnlfiOhTV3WeM4+mUrVLaGG3evVC3x9FDrKz+2VZ1eS8Cxcf0VeK
	mlKLf0fCoaU5Gk4pGHouOo1nP+0U+FCl1g97A4Y3XHdgM1G6BJPn1ozQW5KrMtURCMIo
	1bYA==
X-Received: by 10.194.121.202 with SMTP id lm10mr15345847wjb.98.1442450511624; 
	Wed, 16 Sep 2015 17:41:51 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0F55.dip0.t-ipconnect.de.
	[79.223.15.85]) by smtp.googlemail.com with ESMTPSA id
	sd14sm393216wjb.36.2015.09.16.17.41.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Sep 2015 17:41:50 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Sep 2015 02:41:22 +0200
Message-Id: <1442450491-14912-11-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1442450491-14912-1-git-send-email-schnitzeltony@googlemail.com>
References: <1442450491-14912-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 10/19] upower replace udev by libgudev in DEPENDS
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
X-List-Received-Date: Thu, 17 Sep 2015 00:41:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

fixes:
| configure: error: Package requirements (gudev-1.0 >= 147) were not met:
|
| No package 'gudev-1.0' found

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-support/upower/upower_0.9.14.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/upower/upower_0.9.14.bb b/meta-oe/recipes-support/upower/upower_0.9.14.bb
index 0aa9ec9..8cf8e43 100644
--- a/meta-oe/recipes-support/upower/upower_0.9.14.bb
+++ b/meta-oe/recipes-support/upower/upower_0.9.14.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0de8fbf1d97a140d1d93b9f14dcfbf08"
 
 PR = "r2"
 
-DEPENDS = "libusb1 udev glib-2.0 dbus-glib polkit gobject-introspection-stub"
+DEPENDS = "libusb1 libgudev glib-2.0 dbus-glib polkit gobject-introspection-stub"
 
 SRC_URI = "http://upower.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
 SRC_URI[md5sum] = "18803f82102d56aac90949d1e4251645"
-- 
2.1.0


