Return-Path: <jacob.kroon@gmail.com>
Received: from mail-la0-f53.google.com (mail-la0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id 1FE8870621
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jul 2014 14:23:32 +0000 (UTC)
Received: by mail-la0-f53.google.com with SMTP id gl10so4008651lab.40
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jul 2014 07:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:in-reply-to:references;
	bh=sSnItPqIsXU2WGvNTVdku9vrYS3O58TddVKHRl2vH7E=;
	b=g1d2LU5jCTwMv9Aj0dN6DykYLfM0FIflNqwRyUiWbxLSuqZmPrG+ILKvOr1OBM65TE
	XwKDb5PvcRGckwcFZV8y3wPKqcOhJzFOyERZIMqehrQ2/2CnRSA3As4bbnFwYJ+MypGP
	yCXwODUa91Gq3wCtDgRHjVebDNdhwwZ3PqT+x5otqqhfyBx7RHXuWfeJK1qaOpnp27b5
	rekP0tvrrKahZnqb4A3EpAdTQK/r5tr4vJW5ywScLEniUdCK7MVZprWEu5+6jUGIZSL3
	/1amEYaXc5vHJSoXmLajWHzaDXP3IV6DQuL7mY5IIASjdegOmjv/rQQHPQ7oBpsiktqA
	IEQw==
X-Received: by 10.152.8.166 with SMTP id s6mr2642782laa.85.1405866213448;
	Sun, 20 Jul 2014 07:23:33 -0700 (PDT)
Received: from localhost.localdomain (89-253-118-72.customers.ownit.se.
	[89.253.118.72])
	by mx.google.com with ESMTPSA id oy1sm20071060lbb.4.2014.07.20.07.23.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Jul 2014 07:23:32 -0700 (PDT)
Sender: Jacob Kroon <jacob.kroon@gmail.com>
From: Jacob Kroon <jacob.kroon@mikrodidakt.se>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 Jul 2014 16:21:58 +0200
Message-Id: <1405866118-21641-2-git-send-email-jacob.kroon@mikrodidakt.se>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1405866118-21641-1-git-send-email-jacob.kroon@mikrodidakt.se>
References: <1405866118-21641-1-git-send-email-jacob.kroon@mikrodidakt.se>
Subject: [meta-oe][PATCH 2/2] gammu: Add missing glib-2.0 and udev build dependencies
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
X-List-Received-Date: Sun, 20 Jul 2014 14:23:33 -0000

Since they are autodetected they introduce floating dependencies,
so for now just require them at build time.

Signed-off-by: Jacob Kroon <jacob.kroon@mikrodidakt.se>
---
 meta-oe/recipes-connectivity/gammu/gammu_1.32.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/gammu/gammu_1.32.0.bb b/meta-oe/recipes-connectivity/gammu/gammu_1.32.0.bb
index d123d38..0dac7cb 100644
--- a/meta-oe/recipes-connectivity/gammu/gammu_1.32.0.bb
+++ b/meta-oe/recipes-connectivity/gammu/gammu_1.32.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "GNU All Mobile Managment Utilities"
 SECTION = "console/network"
-DEPENDS = "cmake-native virtual/libiconv libdbi mysql5"
+DEPENDS = "cmake-native virtual/libiconv libdbi mysql5 glib-2.0 udev"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a17cb0a873d252440acfdf9b3d0e7fbf"
 HOMEPAGE = "http://www.gammu.org/"
-- 
1.9.3


