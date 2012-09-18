Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TDylU-0001l8-Lh
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Sep 2012 16:27:04 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so2999326bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2012 07:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=JEC7G6+t2pxkBUtZZPHPTd7xdK6HF1ZPFLdjn6w2tnk=;
	b=L5aLW9gH5adKYmnRd1HuchNX/8jQZyQkxtpgnWkJZosSvL/3rNsFm5yC3XCDbySdNQ
	Lk9jFd/9crzGIT3qziwcSPVdOgjj1rnatTO/JSEdZX+Ni+v3sKtbIsVajb+rbDJtxRLd
	TSjA0TR+RR8DVhm01huSyqIs4ixP2SPVQ2NVmVez5hEr62SwO/os+FL3Vdu0nW6Mr6rK
	hZwx7mzDhe/9ckk+7IxMY/5F8WR73xnphBR8R+W0agBMJo2Ierv4H4JCygQYHN+kCMPB
	lH5UUvrOuf1cMraXM57bVMVEescRhJQkzm0HEAVxADmaWfC5o/eAXtj3GNSWDbl9y2QI
	QhnQ==
Received: by 10.204.147.65 with SMTP id k1mr10571bkv.29.1347977666958;
	Tue, 18 Sep 2012 07:14:26 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-96.unitymediagroup.de.
	[95.222.156.96])
	by mx.google.com with ESMTPS id y20sm8006887bkv.11.2012.09.18.07.14.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Sep 2012 07:14:26 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Sep 2012 16:12:50 +0200
Message-Id: <1347977601-28665-10-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
References: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce/-oe/-multimedia 09/40] xfconf: update to 4.10.0
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
X-List-Received-Date: Tue, 18 Sep 2012 14:27:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../xfconf/{xfconf_4.8.0.bb => xfconf_4.10.0.bb}   |    8 +++-----
 1 files changed, 3 insertions(+), 5 deletions(-)
 rename meta-xfce/recipes-xfce/xfconf/{xfconf_4.8.0.bb => xfconf_4.10.0.bb} (69%)

diff --git a/meta-xfce/recipes-xfce/xfconf/xfconf_4.8.0.bb b/meta-xfce/recipes-xfce/xfconf/xfconf_4.10.0.bb
similarity index 69%
rename from meta-xfce/recipes-xfce/xfconf/xfconf_4.8.0.bb
rename to meta-xfce/recipes-xfce/xfconf/xfconf_4.10.0.bb
index 65efffd..5dceb09 100644
--- a/meta-xfce/recipes-xfce/xfconf/xfconf_4.8.0.bb
+++ b/meta-xfce/recipes-xfce/xfconf/xfconf_4.10.0.bb
@@ -4,12 +4,10 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 DEPENDS = "dbus-glib libxfce4util perl-native"
 
-PR = "r0"
-
 inherit xfce
 
+SRC_URI[md5sum] = "4ed48150a03fb5f42b455494307b7f28"
+SRC_URI[sha256sum] = "175219a441cc7d0f210bbd1a3b0abba41598627cd9db27235811400c3e100576"
+
 FILES_${PN} += "${libdir}/xfce4/xfconf/xfconfd \
                 ${datadir}/dbus-1/services/org.xfce.Xfconf.service"
-
-SRC_URI[md5sum] = "0f11ed1ec7789c5c4c3fcc7cdb3c2940"
-SRC_URI[sha256sum] = "e071d55982238f997a691ff4bb08ef39e4c86bae31cf69b6666bc0cdadd1b85d"
-- 
1.7.6.5



