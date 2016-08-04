Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6DE5373259
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Aug 2016 19:47:24 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id q11so13857899qtb.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Aug 2016 12:47:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=KG7d7PzBVxm3RSUmNUdgFkoTBO06D3ZqRoAJ99uFO5w=;
	b=eqP1HQg1lrkbjqyBnaxckmEJZg3fSiLpUiaXuBhVcV6F8Ock1ZR9rNprVXQON/HFbr
	m1sT0POqzieNUXH6ABLg8UlEy+YxEu3ZAc0jiULcoqEY51P8nnosow2PjRT0x+ihYDFs
	z4J47BAfdleHkUvRSpu3tA7OsfOUp7IICi+AAPmKHQhBoAW5BXSw8q/0qUHItS8qFaWC
	fxdc5hbnAG3j/yOhdifRt9hSP53YGB6+sIRrnPCiEQ2yAo7aKkn9ByPxdadM3GfVSxVl
	shCpymo9EUwXhCi3lvAFliCGjD8OA3bEAAF2c7+BwkePj+WpdGVVZR4OpAC2K+geXAgW
	x6wA==
X-Gm-Message-State: AEkoouvL/UegcrWrEun2zO5rYjTfLf/fs5L73QfVg171XovfRIBK1q/q2gGDtyW6SwyMSQ==
X-Received: by 10.200.48.42 with SMTP id f39mr8321085qte.81.1470340044590;
	Thu, 04 Aug 2016 12:47:24 -0700 (PDT)
Received: from lnx-desktop.star.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	a63sm6422471qkb.26.2016.08.04.12.47.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 04 Aug 2016 12:47:24 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Aug 2016 15:47:16 -0400
Message-Id: <1470340036-23939-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] ccid: update to version 1.4.24
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
X-List-Received-Date: Thu, 04 Aug 2016 19:47:25 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-oe/recipes-support/ccid/{ccid_1.4.19.bb => ccid_1.4.24.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/ccid/{ccid_1.4.19.bb => ccid_1.4.24.bb} (68%)

diff --git a/meta-oe/recipes-support/ccid/ccid_1.4.19.bb b/meta-oe/recipes-support/ccid/ccid_1.4.24.bb
similarity index 68%
rename from meta-oe/recipes-support/ccid/ccid_1.4.19.bb
rename to meta-oe/recipes-support/ccid/ccid_1.4.24.bb
index f77e069..49f7a0c 100644
--- a/meta-oe/recipes-support/ccid/ccid_1.4.19.bb
+++ b/meta-oe/recipes-support/ccid/ccid_1.4.24.bb
@@ -6,11 +6,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
 DEPENDS = "virtual/libusb0 pcsc-lite"
 RDEPENDS_${PN} = "pcsc-lite"
 
-SRC_URI = "https://alioth.debian.org/frs/download.php/file/4132/ccid-${PV}.tar.bz2 \
+SRC_URI = "https://alioth.debian.org/frs/download.php/file/4171/ccid-${PV}.tar.bz2 \
 	   file://no-dep-on-libfl.patch "
 
-SRC_URI[md5sum] = "d1eed995ba9a2eb395a65a8a78090f52"
-SRC_URI[sha256sum] = "cccb2c2bb4e56689efe34559f713102d92f94735542e58d3e4334e1459e934e1"
+SRC_URI[md5sum] = "915a03cda85b60fefbe3654cbdc68ca9"
+SRC_URI[sha256sum] = "62cb73c6c009c9799c526f05a05e25f00f0ad86d50f82a714dedcfbf4a7e4176"
 
 inherit autotools pkgconfig
 
-- 
1.9.1


