Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TDyla-0001lE-SG
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Sep 2012 16:27:11 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so2999370bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2012 07:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=SABcuU8vHruxhBDeEsycJvxWlURHlUETOshmY26sL/I=;
	b=P6FcI5q4q45pcANt40BAxh+uPUbE8nqL9M7/PPTPfHglpYUjk8fYdD72g3nl3/ZPZu
	6ON5twD5LR9DTyzSHsThiXv49JA09vQvqxfLfJkxVHb7NfDyM6EP7s4XZzK1M1igsC6A
	sE07t8kTKISlf3K9ToL3GcrOpPeOEj3F/Rkkulx+1jF+cENUXzbkzqgZNUMbdsrGsYcL
	vsE2mXB3kk50v+zGWR04VYTDxAuj7zKFWDG7U+Vc0YdPCKA/bTdA+wBoEwr+8ge52+XQ
	Y+aBX8adjN+RBE91/qLhNQPo3nH2Vp9XhxpzDPLQbW4cRsuH7bkNZPrYd7gTFpt5IdMs
	dctg==
Received: by 10.204.149.217 with SMTP id u25mr142582bkv.107.1347977671512;
	Tue, 18 Sep 2012 07:14:31 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-96.unitymediagroup.de.
	[95.222.156.96])
	by mx.google.com with ESMTPS id y20sm8006887bkv.11.2012.09.18.07.14.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Sep 2012 07:14:30 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Sep 2012 16:12:53 +0200
Message-Id: <1347977601-28665-13-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
References: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce/-oe/-multimedia 12/40] xfwm4: update to 4.10.0
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
X-List-Received-Date: Tue, 18 Sep 2012 14:27:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../xfwm4/{xfwm4_4.8.3.bb => xfwm4_4.10.0.bb}      |    7 ++-----
 1 files changed, 2 insertions(+), 5 deletions(-)
 rename meta-xfce/recipes-xfce/xfwm4/{xfwm4_4.8.3.bb => xfwm4_4.10.0.bb} (81%)

diff --git a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.8.3.bb b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.10.0.bb
similarity index 81%
rename from meta-xfce/recipes-xfce/xfwm4/xfwm4_4.8.3.bb
rename to meta-xfce/recipes-xfce/xfwm4/xfwm4_4.10.0.bb
index 304ff66..049ac6f 100644
--- a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.8.3.bb
+++ b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.10.0.bb
@@ -3,14 +3,11 @@ SECTION = "x11/wm"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d791728a073bc009b4ffaf00b7599855"
 DEPENDS = "virtual/libx11 libxpm gtk+ libxfce4util libxfce4ui xfconf libwnck dbus-glib startup-notification"
-PR = "r1"
 
 inherit xfce update-alternatives
 
-SRC_URI[md5sum] = "66cb65797cea8a62563f69b833c7888b"
-SRC_URI[sha256sum] = "0b0e8bea0b257958ad416ab5678cf0cdd7e909943d4d5ab32afc35295a78227e"
-
-EXTRA_OECONF += " --enable-startup-notification"
+SRC_URI[md5sum] = "333e5e25a85411c304e9b4474bf00537"
+SRC_URI[sha256sum] = "492357bf48121ebffabf2bf0d3b84213d19bf81087321175d687c8a68efe1f9c"
 
 python populate_packages_prepend () {
     themedir = bb.data.expand('${datadir}/themes', d)
-- 
1.7.6.5



