Received: from mail-px0-f172.google.com ([209.85.212.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QITGz-0001PP-T0
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 May 2011 00:13:22 +0200
Received: by pxi6 with SMTP id 6so2553177pxi.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 May 2011 15:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=Qaoe4g2RQhuNMSB83zk7dCjx45Ug0bcej1+MbMp8nqg=;
	b=XD4lz4bS/IuF29kMGr1B2UDdYLxNwaslpuQeFdHRzea10mV/NZ8ADSaVBaPu7fP5+e
	wGe/4RpZhO1Vq0I71dv4QbffVjllp3D2r7tvFOr7x5UBjrJSrbcTltcMLJP6nwoxk/XY
	gzWTP/395dO2rqcyOSRWjf/L7eoPN2SccLstg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=LePz6lKyfpvci5PBwwUPTIAl4a7eK82+fHrPzSPL4ozQ4KPwNoDyeTDpgDjRqkg92q
	BK9n+iR6MLwRyKMI8EVdxdzn3mDp0TneTTA1l+S/loSFoFg7ugtrW+9CfV7pY9RRv6j6
	B4Whu5/vwVOxDoZuN+dlk/nBQZkTFAYCCTfuo=
Received: by 10.68.6.6 with SMTP id w6mr5772281pbw.512.1304719839497;
	Fri, 06 May 2011 15:10:39 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id a20sm2390273pbu.59.2011.05.06.15.10.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 06 May 2011 15:10:38 -0700 (PDT)
From: raj.khem@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 May 2011 15:10:28 -0700
Message-Id: <1304719828-22697-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [meta-oe][PATCH] conf/layer.conf: conf/layer.conf: Document the operation on BBPATH correctly in the comment
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
X-List-Received-Date: Fri, 06 May 2011 22:13:22 -0000

From: Khem Raj <raj.khem@gmail.com>

Provide additional commentary that should help a bit more

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-efl/conf/layer.conf   |    2 +-
 meta-gnome/conf/layer.conf |    2 +-
 meta-gpe/conf/layer.conf   |    2 +-
 meta-oe/conf/layer.conf    |   18 +++++++++++++++++-
 4 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/meta-efl/conf/layer.conf b/meta-efl/conf/layer.conf
index f019337..272fc04 100644
--- a/meta-efl/conf/layer.conf
+++ b/meta-efl/conf/layer.conf
@@ -1,4 +1,4 @@
-# We have a conf and classes directory, prepend to BBPATH to prefer our versions
+# We have a conf and classes directory, append to BBPATH 
 BBPATH .= ":${LAYERDIR}"
 
 # We have a recipes directory, add to BBFILES
diff --git a/meta-gnome/conf/layer.conf b/meta-gnome/conf/layer.conf
index 6e8ff28..902ab8f 100644
--- a/meta-gnome/conf/layer.conf
+++ b/meta-gnome/conf/layer.conf
@@ -1,4 +1,4 @@
-# We have a conf and classes directory, prepend to BBPATH to prefer our versions
+# We have a conf and classes directory, append to BBPATH
 BBPATH .= ":${LAYERDIR}"
 
 # We have a recipes directory, add to BBFILES
diff --git a/meta-gpe/conf/layer.conf b/meta-gpe/conf/layer.conf
index 006b6af..6c018b1 100644
--- a/meta-gpe/conf/layer.conf
+++ b/meta-gpe/conf/layer.conf
@@ -1,4 +1,4 @@
-# We have a conf and classes directory, prepend to BBPATH to prefer our versions
+# We have a conf and classes directory, append to BBPATH
 BBPATH .= ":${LAYERDIR}"
 
 # We have a recipes directory, add to BBFILES
diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 36137e9..d5c2a17 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -1,4 +1,14 @@
-# We have a conf and classes directory, prepend to BBPATH to prefer our versions
+# It really depends on order of the layers appearing in BBLAYERS
+# variable in toplevel bblayers.conf file, where bitbake will search
+# for .inc files and others where bitbake uses BBPATH since it will
+# search the directories from first to last as specfied in BBPATH
+# Therefore if you want a given layer to be considered high priority
+# for the .inc and .conf etc. then consider it adding at the beginning
+# of BBPATH. For bblayers bitbake will use BBFILES_PRIORITY to resolve
+# the recipe contention so the order of directories in BBFILES does 
+# not matter
+
+# We have a conf and classes directory, append to BBPATH
 BBPATH .= ":${LAYERDIR}"
 
 # We have a recipes directory, add to BBFILES
@@ -6,4 +16,10 @@ BBFILES += "${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/recipes-*/*/*.bbappend"
 
 BBFILE_COLLECTIONS += "openembedded-layer"
 BBFILE_PATTERN_openembedded-layer := "^${LAYERDIR}/"
+
+# Define the priority for recipes (.bb files) from this layer
+# this should be noted when you use this layer since it has
+# to fall into the correct layer priority order that you have decided
+# for you layering model
+
 BBFILE_PRIORITY_openembedded-layer = "6"
-- 
1.7.4.1



