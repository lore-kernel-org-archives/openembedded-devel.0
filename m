Received: from mail-ee0-f43.google.com ([74.125.83.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TqQI8-0000ZT-Qj
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jan 2013 16:31:41 +0100
Received: by mail-ee0-f43.google.com with SMTP id e49so7100468eek.16
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Jan 2013 07:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=ri+4Cm1sFfKAhBFNBgbZaHOAoajFyj/P2wB6efmWN/c=;
	b=Ob9EH9GBDyggD7ASCZarp5Dgf5rlmPoWrGTH2UyA5Oj4pEKOHIA1A0P7grU8o7yt4u
	j1jHRycp3QQ2x4Agh/2ts897SQDH2d9iRU1fIPxTuhyfVKQVJEgzQEcK+8QigP5RyaKv
	Wo3nc8a9Bk0u5EvinSxVLYNUFC2Cma0ZmFXWmiEmP4UmfFtn2hsl4bsUm43qorZ9/q4b
	kJ6EEwVLl4mgZ76tPGEsMzOhrCQGUblbf8DpugcJ/lKzXYwb38YglkTOzECYfLuVbpA1
	Ivclh/1mJyX43ocvIY1XN6i7mDEAfFnDmDsP0CGjcoS+FiYHXnKRBao8lUolP2SSwvzK
	8NWg==
X-Received: by 10.14.194.199 with SMTP id m47mr126176880een.11.1357139798605; 
	Wed, 02 Jan 2013 07:16:38 -0800 (PST)
Received: from localhost.localdomain (p4FDF1C58.dip.t-dialin.net.
	[79.223.28.88])
	by mx.google.com with ESMTPS id b2sm98071345eep.9.2013.01.02.07.16.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Jan 2013 07:16:37 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Jan 2013 16:16:13 +0100
Message-Id: <1357139774-4364-10-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1357139774-4364-1-git-send-email-schnitzeltony@googlemail.com>
References: <1357139774-4364-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce/meta-gnome/V2 09/10] midori: update to 0.4.7
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 02 Jan 2013 15:31:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../midori/{midori_0.4.6.bb => midori_0.4.7.bb}    |    7 ++-----
 1 files changed, 2 insertions(+), 5 deletions(-)
 rename meta-gnome/recipes-connectivity/midori/{midori_0.4.6.bb => midori_0.4.7.bb} (86%)

diff --git a/meta-gnome/recipes-connectivity/midori/midori_0.4.6.bb b/meta-gnome/recipes-connectivity/midori/midori_0.4.7.bb
similarity index 86%
rename from meta-gnome/recipes-connectivity/midori/midori_0.4.6.bb
rename to meta-gnome/recipes-connectivity/midori/midori_0.4.7.bb
index db2c5e6..5b1a959 100644
--- a/meta-gnome/recipes-connectivity/midori/midori_0.4.6.bb
+++ b/meta-gnome/recipes-connectivity/midori/midori_0.4.7.bb
@@ -4,12 +4,10 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 DEPENDS = "webkit-gtk libsoup-2.4 libsexy openssl python-native python-docutils-native librsvg-native libnotify"
 
-PR = "r2"
-
 SRC_URI = "http://archive.xfce.org/src/apps/midori/0.4/midori-${PV}.tar.bz2;name=midori \
           "
-SRC_URI[midori.md5sum] = "3c3f0030611d9126ab90be48d44cab57"
-SRC_URI[midori.sha256sum] = "910f47bd2b5f2998cd4fce45c08f9e282318820b68562d0bade2096b9a17e3ea"
+SRC_URI[midori.md5sum] = "06db7b88a41e9b2265728960d5e98f35"
+SRC_URI[midori.sha256sum] = "65bf9976733597c405492ce91aa664fd10547cb7df16e0a70f260c7a3e97ea5d"
 
 inherit gtk-icon-cache pkgconfig vala
 
@@ -33,7 +31,6 @@ do_configure() {
 }
 
 PARALLEL_MAKE = ""
-LDFLAGS_append = " -ljavascriptcoregtk-1.0 "
 TARGET_CC_ARCH += "${LDFLAGS}"
 
 do_install() {
-- 
1.7.4.4



