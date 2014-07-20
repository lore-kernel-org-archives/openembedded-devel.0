Return-Path: <jacob.kroon@gmail.com>
Received: from mail-la0-f43.google.com (mail-la0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id B85707051A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jul 2014 23:43:08 +0000 (UTC)
Received: by mail-la0-f43.google.com with SMTP id hr17so4305459lab.30
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jul 2014 16:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id;
	bh=TiF586+RJs5UCIXNCAAARM8XHpF5dJIAkTiDGIRb+x8=;
	b=CrDyu9bIqRfGUUnK8lG8yU3ZhldJWIr6+p1g6mLl5ks3VBnPtxZ8aAyij/Clhm0SQT
	o8TwcpLo5Vi8/ml+bU3nLyJvavRZJbq9c8H16G5I/lPUtFuKLvdffTBoXvyOMLi1+07x
	uyZ1JMOa97/ueeht+TclK/EVHkLr1wjPjxugX8s51a/0q2mPqxcUf7/HNMS/Y3pv6ivA
	k9qmbRaOAkIMYfKdjtIqmKme2D/h7dFae8DZAfjWuX1RfB0DcB1OT/46eCL74cxsU4fA
	HaFihDrkl4UB3PqiVztji+hcB0oCzYrOQOEtsQXb0nsmX+FA4sA7BGtpE0hXeD3v8UJH
	moIw==
X-Received: by 10.152.205.99 with SMTP id lf3mr22190644lac.63.1405899788639;
	Sun, 20 Jul 2014 16:43:08 -0700 (PDT)
Received: from localhost.localdomain (89-253-118-72.customers.ownit.se.
	[89.253.118.72])
	by mx.google.com with ESMTPSA id x1sm1461102lae.43.2014.07.20.16.43.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Jul 2014 16:43:08 -0700 (PDT)
Sender: Jacob Kroon <jacob.kroon@gmail.com>
From: Jacob Kroon <jacob.kroon@mikrodidakt.se>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Jul 2014 01:41:34 +0200
Message-Id: <1405899694-18665-1-git-send-email-jacob.kroon@mikrodidakt.se>
X-Mailer: git-send-email 1.9.3
Subject: [meta-oe][PATCH] glade3: Add PACKAGECONFIG for Gnome support
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
X-List-Received-Date: Sun, 20 Jul 2014 23:43:17 -0000

./configure checks for libbonoboui and libgnomeui.
Add a PACKAGECONFIG for it, enabled by default.

Signed-off-by: Jacob Kroon <jacob.kroon@mikrodidakt.se>
---
 meta-oe/recipes-devtools/glade/glade3_3.8.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-devtools/glade/glade3_3.8.2.bb b/meta-oe/recipes-devtools/glade/glade3_3.8.2.bb
index 3f93eba..d0657e4 100644
--- a/meta-oe/recipes-devtools/glade/glade3_3.8.2.bb
+++ b/meta-oe/recipes-devtools/glade/glade3_3.8.2.bb
@@ -16,6 +16,9 @@ SRC_URI[sha256sum] = "f180a5018eee6e3fe574854cb025af897dd9962b01d17d5752e626876d
 
 EXTRA_OECONF += "--disable-scrollkeeper"
 
+PACKAGECONFIG ??= "gnome"
+PACKAGECONFIG[gnome] = "--enable-gnome,--disable-gnome,libbonoboui libgnomeui"
+
 do_configure_prepend() {
     sed -i '/^if HAVE_GNOME_DOC_UTILS/,/^endif/d' ${S}/Makefile.am
 }
-- 
1.9.3


