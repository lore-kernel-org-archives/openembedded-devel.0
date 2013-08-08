Return-Path: <mranostay@gmail.com>
Received: from mail-pb0-f47.google.com (mail-pb0-f47.google.com
	[209.85.160.47])
	by mail.openembedded.org (Postfix) with ESMTP id CDAC8608BF
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Aug 2013 04:03:27 +0000 (UTC)
Received: by mail-pb0-f47.google.com with SMTP id rr4so2664923pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Aug 2013 21:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=XIGdEaWdBS2P4eMLy5sul4GR+dNzKwvA2oi4U9cwGdU=;
	b=Ys4qatZwPyShTVsPo9KH3ydGilZfIAqs6GX38ZX9YorGzP3NpablL+EbUONLBZCK6R
	dFw6BKpRGpIzpdDsxm0CJFp0wDwUxC7hLG59ErJQjuf6Wgo54wbWuLRf8pO33bKkb769
	0BJ5mk16TYPSgHKs4xqTnVYHd6zgmQlKN/F3eGBuNeCr0WMw9GQ+okY38VnI6lFr3OCg
	kgylNmhawAs+njl5fSaEbuIGIYiw2wx0Bi6P6JYEugiOZNa4nT+0mdS1KwYR0Eaz8Z1t
	6SlKYacWphO8J8Zd1+ilrPJ3pYU2w3h8uNbnmzzzK2ndzXz65ovrxJpGUHRmtjHfMsKy
	5fAA==
X-Received: by 10.68.211.194 with SMTP id ne2mr4013342pbc.40.1375934608550;
	Wed, 07 Aug 2013 21:03:28 -0700 (PDT)
Received: from localhost.localdomain (c-76-105-193-198.hsd1.or.comcast.net.
	[76.105.193.198]) by mx.google.com with ESMTPSA id
	xl3sm11516402pbb.17.2013.08.07.21.03.27 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 07 Aug 2013 21:03:28 -0700 (PDT)
From: Matt Ranostay <mranostay@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  8 Aug 2013 04:02:54 +0000
Message-Id: <1375934574-15191-1-git-send-email-mranostay@gmail.com>
X-Mailer: git-send-email 1.8.2.rc3.6.g407929c
Subject: [PATCH] flashrom: Add flashrom recipe
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
X-List-Received-Date: Thu, 08 Aug 2013 04:03:27 -0000

Add flashrom recipe for managing recovery from bad UEFI updates.

Signed-off-by: Matt Ranostay <mranostay@gmail.com>
---
 meta-oe/recipes-extended/flashrom/flashrom_0.9.6.1.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-oe/recipes-extended/flashrom/flashrom_0.9.6.1.bb

diff --git a/meta-oe/recipes-extended/flashrom/flashrom_0.9.6.1.bb b/meta-oe/recipes-extended/flashrom/flashrom_0.9.6.1.bb
new file mode 100644
index 0000000..a1f0b30
--- /dev/null
+++ b/meta-oe/recipes-extended/flashrom/flashrom_0.9.6.1.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "flashrom is a utility for identifying, reading, writing, verifying and erasing flash chips"
+LICENSE = "GPLv2"
+HOMEPAGE = "http://flashrom.org"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+DEPENDS = "pciutils"
+
+SRC_URI = "http://download.flashrom.org/releases/flashrom-${PV}.tar.bz2"
+
+SRC_URI[md5sum] = "407e836c0a2b17ec76583cb6809f65e5"
+SRC_URI[sha256sum] = "6f7b588cce74c90b4fe9c9c794de105de76e0323442fb5770b1aeab81e9d560a"
+
+do_install() {
+    oe_runmake PREFIX=${prefix} DESTDIR=${D} install
+}
-- 
1.8.2.rc3.6.g407929c


