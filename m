Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tworaz666@gmail.com>) id 1Rt2aJ-0005vU-BU
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Feb 2012 20:44:43 +0100
Received: by eekd41 with SMTP id d41so754661eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Feb 2012 11:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=FB3zCVfokRK6X6EabhgQRtgYQiTUTZ8zhvjA+4J4PYQ=;
	b=rtuR4Hqg0MLz3CMK/oTCOPjaGMUf/ljXdmFqWfus3vHWzl0NG8DxxYIP8CORWS5HSC
	JkfcxHZxUYGUNCfso+LGWcOc5PKHqaeiI1mQw1OG+Zydib6ky1Nl0vxJcbQGnXqxkQok
	+LBkQwELKMRT46AyNE/4TbvzlV8Vj9D3Ylk6g=
Received: by 10.14.35.84 with SMTP id t60mr1284502eea.126.1328211406938;
	Thu, 02 Feb 2012 11:36:46 -0800 (PST)
Received: from localhost.localdomain (89-77-50-243.dynamic.chello.pl.
	[89.77.50.243])
	by mx.google.com with ESMTPS id n56sm12571930eeh.6.2012.02.02.11.36.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Feb 2012 11:36:46 -0800 (PST)
From: Peter Tworek <tworaz666@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Feb 2012 20:34:39 +0100
Message-Id: <1328211279-8809-1-git-send-email-tworaz666@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-gnome][PATCH] libgsf: Remove unnecessary gconf RDEPENDS.
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
X-List-Received-Date: Thu, 02 Feb 2012 19:44:43 -0000

It's added automatically when including gconf bbclass.

Signed-off-by: Peter Tworek <tworaz666@gmail.com>
---
 meta-gnome/recipes-gnome/libgsf/libgsf_1.14.21.bb |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.21.bb b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.21.bb
index 6119f86..e8cad9c 100644
--- a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.21.bb
+++ b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.21.bb
@@ -19,5 +19,3 @@ EXTRA_OECONF = "\
 		--without-gnome-vfs --without-bonobo \
 		--disable-gtk-doc \
 		--with-bz2"
-
-RDEPENDS_${PN} = "gconf" 
-- 
1.7.3.4



