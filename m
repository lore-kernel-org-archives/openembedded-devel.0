Received: from mail-ee0-f50.google.com ([74.125.83.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UZqrw-0003cq-8g
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 May 2013 01:00:36 +0200
Received: by mail-ee0-f50.google.com with SMTP id c41so509900eek.23
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 May 2013 15:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=OiI436uS5d97reLE3+ACXEI51vZLFg9hYs4uYyPntyU=;
	b=gP0CYVedBP7iVnDkF5hkNcUkDzeuBwTyXt9SnqPZtdIkoH7+Ky582HRBk96WwYMgcD
	GaW1MljJCfvqIOIUbvD4eLi9o9VKolyQieA9fXsqI28knWb5xtaXzlbB1H8YttGXFLNh
	2yEFWJS7/hfMjvoCt3nbAZyn8y/Y20NTpw3YX07YOShPvIkQdVs9nRv4jO+AAqVfJGe0
	ZDW/VZyv4mzQ7gB5rWoBcH1Po4TLvrpMwhPO6tRxoK6mM19K6gvAcAECAZMtfDtAD1rG
	4E+ohGZ5AcGsVV42fGiOrJwga6m1WYBTpOhnpcr3G1MyhGb7rXmFJjH1O39czoxPInTI
	u8Rw==
X-Received: by 10.14.109.131 with SMTP id s3mr10047762eeg.26.1367966543114;
	Tue, 07 May 2013 15:42:23 -0700 (PDT)
Received: from localhost.localdomain (p5B0A0896.dip0.t-ipconnect.de.
	[91.10.8.150])
	by mx.google.com with ESMTPSA id i3sm41969409eev.1.2013.05.07.15.42.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 07 May 2013 15:42:22 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 May 2013 00:41:49 +0200
Message-Id: <1367966513-12566-12-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1367966513-12566-1-git-send-email-schnitzeltony@googlemail.com>
References: <1367966513-12566-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe/meta-gnome 11/15] evince: fix/remove postinst by inheriting gsettings
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
X-List-Received-Date: Tue, 07 May 2013 23:00:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-gnome/recipes-gnome/evince/evince_2.32.0.bb |   12 ++----------
 1 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/meta-gnome/recipes-gnome/evince/evince_2.32.0.bb b/meta-gnome/recipes-gnome/evince/evince_2.32.0.bb
index 986cd71..f1c3563 100644
--- a/meta-gnome/recipes-gnome/evince/evince_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_2.32.0.bb
@@ -4,9 +4,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=96f2f8d5ee576a2163977938ea36fa7b"
 SECTION = "x11/office"
 DEPENDS = "gnome-icon-theme gnome-doc-utils-native libgnome-keyring nautilus tiff libxt ghostscript poppler libxml2 gtk+ gconf libglade"
 
-PR = "r3"
+PR = "r4"
 
-inherit gnome pkgconfig gtk-icon-cache
+inherit gnome pkgconfig gtk-icon-cache gsettings
 
 SRC_URI += "file://cross-compile-fix.patch"
 
@@ -36,11 +36,3 @@ FILES_${PN}-dev += "${libdir}/nautilus/extensions-2.0/*.la \
 FILES_${PN}-staticdev += "${libdir}/nautilus/extensions-2.0/*.a \
                           ${libdir}/evince/*/backends/*.a"
 FILES_${PN}-nautilus-extension = "${libdir}/nautilus/*/*so"
-
-pkg_postinst_${PN} () {
-if [ -n "$D" ]; then
-    exit 1
-fi
-
-glib-compile-schemas ${datadir}/glib-2.0/schemas
-}
-- 
1.7.4.4



