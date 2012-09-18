Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TDylO-0001l8-2l
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Sep 2012 16:26:58 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so2999326bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2012 07:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=aky64+iFApcK0yAo0kmJNgvOMgBjKiyT/eyr3/6K0eU=;
	b=0qZqzdbYcI22H+wGYa36qqBe0My15mTEQXkM5JfBCuVTkVRt2xblVegscOjOCo2EBa
	v8N4xNqcrhzPATWrQH+8wdEGiK8ydewFk0CcLkbeuMjicPi05wIj6E9q/8dWoIgfz/Dn
	0bS7RD+AzxByas6PTbwo3ZV2c7BFNV2bRrUVcuPbgJnM4tyPU8Na68MwKIWomn2jYFMH
	RdHAMvXALOq6ap8rc8aZiUvX6S8Kb5W2fgaAU61qw51Gz5qMRXGFvu8k2yKeZlgs5TKe
	9/m5SUHB1GalljnWFOAQTWKZvjgMGFCXIJxdUr+XaChvuSBW87SvhyxE8zTppUXyCYFI
	cEMw==
Received: by 10.204.133.194 with SMTP id g2mr22507bkt.13.1347977660337;
	Tue, 18 Sep 2012 07:14:20 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-96.unitymediagroup.de.
	[95.222.156.96])
	by mx.google.com with ESMTPS id y20sm8006887bkv.11.2012.09.18.07.14.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Sep 2012 07:14:19 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Sep 2012 16:12:46 +0200
Message-Id: <1347977601-28665-6-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
References: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce/-oe/-multimedia 05/40] libxfce4ui: update to 4.10.0
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
X-List-Received-Date: Tue, 18 Sep 2012 14:26:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{libxfce4ui_4.8.1.bb => libxfce4ui_4.10.0.bb}  |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)
 rename meta-xfce/recipes-xfce/libxfce4ui/{libxfce4ui_4.8.1.bb => libxfce4ui_4.10.0.bb} (56%)

diff --git a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.8.1.bb b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb
similarity index 56%
rename from meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.8.1.bb
rename to meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb
index e2bc81e..32505de 100644
--- a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.8.1.bb
+++ b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb
@@ -3,13 +3,11 @@ SECTION = "x11/libs"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=252890d9eee26aab7b432e8b8a616475"
 DEPENDS = "gtk+ intltool libxfce4util startup-notification xfconf"
-PR = "r1"
 
 inherit xfce
 
 SRC_URI += "file://0001-libxfce4kbd-private-xfce4-keyboard-shortcuts.xml-fix.patch"
 
-FILES_${PN} += "${libdir}/xfce4/modules ${libdir}/libglade/2.0/*.so ${datadir}/xfce4/mime ${datadir}/icons/hicolor"
+SRC_URI[md5sum] = "6df1ce474a3d4885aee31cda9dbc9192"
+SRC_URI[sha256sum] = "a2b9fa288ccb5f16fa13264e507ba3f7b8da0176da259a11239f21538c0ea3e2"
 
-SRC_URI[md5sum] = "30bd432dd0f19305e846a122d4c7c6fe"
-SRC_URI[sha256sum] = "39cbed29da06960074014b74abc2ba57db49dc81ab8995fb2160579c51669956"
-- 
1.7.6.5



