Return-Path: <chmorgan@gmail.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 95D5A6FE25
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 May 2014 17:15:01 +0000 (UTC)
Received: by mail-ig0-f175.google.com with SMTP id uq10so1058226igb.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 May 2014 10:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=ROA3xWKlfYakYV//3NzDzlvE3WthIIUAZ1Y8+oVuL5A=;
	b=K88CIRH6I6rpQTXnQKx5NNtEqhks2JlhTjDGuwK8ZSrHZb6je9LHl2CF0LK2LaM0Gs
	+53kA5HGZI7umRUbNFMw+9AjFlTnPZwAtbsHYM9qx6dFHhMdGRo//rxMXxSKz1xcHX1T
	T44x6aQqNg4ERb96cR1DIrBE54+xQbBfF+u9VPC4JcoE/0Ld5VZiyatnYkAzMfWoCyyM
	JVFNkw4Oy5eclsA4JauCygsAq0c8hIpA8T00Qz6vTlxrDnPBrzZEuFqn5GiE/pqyy+4t
	hU6XLETdUCyQ/eGYxTWCMHEHu1A5Gotdiuwwf8v+/opYVqmfYwbEybglF955N7WszKaC
	k/zw==
X-Received: by 10.42.91.73 with SMTP id o9mr16905657icm.69.1401470102149; Fri,
	30 May 2014 10:15:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.228.141 with HTTP; Fri, 30 May 2014 10:14:42 -0700 (PDT)
From: Chris Morgan <chmorgan@gmail.com>
Date: Fri, 30 May 2014 13:14:42 -0400
Message-ID: <CAAPegz0qP3=K30n612M=VR2q12M=PMV9omHDGJ-_4DJLYAJ_hw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] Remove old dfu-util 0.1 recipe
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
X-List-Received-Date: Fri, 30 May 2014 17:15:01 -0000
Content-Type: text/plain; charset=UTF-8

Signed-off-by: Chris Morgan <chmorgan@gmail.com>
---
 meta-oe/recipes-support/dfu-util/dfu-util_0.1.bb | 10 ----------
 1 file changed, 10 deletions(-)
 delete mode 100644 meta-oe/recipes-support/dfu-util/dfu-util_0.1.bb

diff --git a/meta-oe/recipes-support/dfu-util/dfu-util_0.1.bb
b/meta-oe/recipes-support/dfu-util/dfu-util_0.1.bb
deleted file mode 100644
index b63d74d..0000000
--- a/meta-oe/recipes-support/dfu-util/dfu-util_0.1.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require dfu-util.inc
-
-PR = "r1"
-
-DEPENDS = "virtual/libusb0 usbpath"
-
-BBCLASSEXTEND = "native"
-
-SRC_URI[md5sum] = "454b931249d29e4a6c2a2ade17858490"
-SRC_URI[sha256sum] =
"a27cc667be9b158fecf0ed066698e30eca0c0b3cd7a85aad2058d47ffe16f0e1"
-- 
1.9.3

