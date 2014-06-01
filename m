Return-Path: <chmorgan@gmail.com>
Received: from mail-ie0-f170.google.com (mail-ie0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id ABCB4660D2
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  1 Jun 2014 17:42:53 +0000 (UTC)
Received: by mail-ie0-f170.google.com with SMTP id to1so2387629ieb.15
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 Jun 2014 10:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=BeW7HwOC5VGdc+pEoYb1V9x0wLsUY6olip8WpBWnmgE=;
	b=jVu0AJxkaJ2G0STtfs9jloDQatiZgbbXfKkd3Q95NzOBJ22BcXfatCPWxUhMnl3vMk
	vO7oI2M2P1Q1Rh4W7WVYWfLQg7g8VqQbHoNyZM2P7nl3IGdbXI32rBGL9rFHyArHeWAz
	HzDTgO2MlqT19JjsXn3LCnBtSYRTjoVUg5hpgp+B6NZ/IQcEqXI/LOFZAjk+kqpgYLlp
	EzwC89L1tBOh1vkM2+GTmP3RMtIcxmqfTYO5L+bJcBcxczJiwOaCB7J8pngHrBaQPgl7
	uwP7LZyGzyTAUkU8b8ERExenCr4qAYq28/i7+yeOmQ0oDM6Izv6/mZZTHfObEgqVu0CO
	xfeQ==
X-Received: by 10.42.127.199 with SMTP id j7mr28349079ics.27.1401644574680;
	Sun, 01 Jun 2014 10:42:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.228.141 with HTTP; Sun, 1 Jun 2014 10:42:34 -0700 (PDT)
From: Chris Morgan <chmorgan@gmail.com>
Date: Sun, 1 Jun 2014 13:42:34 -0400
Message-ID: <CAAPegz1J+4vrvOF3F9Rj11_0-Lhd0ybFFci-_UXgLtVBhxreYg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] dfu-util 0.7 recipe, remove old 0.1 recipe
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
X-List-Received-Date: Sun, 01 Jun 2014 17:43:02 -0000
Content-Type: text/plain; charset=UTF-8

dfu-util 0.7 is the latest release of dfu-util

Remove old dfu-util 0.1 recipe

Signed-off-by: Chris Morgan <chmorgan@gmail.com>
---
 meta-oe/recipes-support/dfu-util/dfu-util_0.1.bb | 10 ----------
 meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb |  6 ++++++
 2 files changed, 6 insertions(+), 10 deletions(-)
 delete mode 100644 meta-oe/recipes-support/dfu-util/dfu-util_0.1.bb
 create mode 100644 meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb

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
diff --git a/meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb
b/meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb
new file mode 100644
index 0000000..c4c030d
--- /dev/null
+++ b/meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb
@@ -0,0 +1,6 @@
+require dfu-util.inc
+
+DEPENDS = "libusb1"
+
+SRC_URI[md5sum] = "56844020177d4db4c1ea2e926fe9d588"
+SRC_URI[sha256sum] =
"f52a2a5489fbf9f3204a6ada05e0b47ee322e19d81c712e0c58a332d80ec3eab"
-- 
1.9.3

