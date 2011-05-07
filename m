Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QIcY5-0007Uk-2j
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 May 2011 10:07:37 +0200
Received: by pwj9 with SMTP id 9so1802610pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 May 2011 01:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=mAuKh8DRYDBo20rLTgGPDRc8FESKCfHhUantP9VTODM=;
	b=Z4KHP4qRJOzwOb7yPJXQOD2lJNp7MpAiGvMDrmHM1u/zxWz6m8Xde8r3OCQiV9mQmh
	2HXQpkXn7oqcOh52cm2bkcjJbKzm20RhL6N6d7Oxin52KUZqOAY4hmgryB1NFZcWhtPg
	VHp0PHYlJ8+8omWa5/Rby/fYBWNd7jekH/kM8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=PqdepfIS7GB6IzSoyWc6jCfHvSwvgEvxC30YfhPnK+Hx0UUF7LjD8JWgKAGlJLgLSi
	w9+8A7O0Z2TQLQIqtO0vCGjYWi0g432jDtkd5cdqo6f+uvY1ShIT3y8SM7QknA73lDaF
	un6k8J8fS9oCSqNGitEG8E9dUrAEAhoZqNhtU=
Received: by 10.142.231.10 with SMTP id d10mr2373679wfh.33.1304755494581;
	Sat, 07 May 2011 01:04:54 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id s39sm5224270wfc.4.2011.05.07.01.04.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 07 May 2011 01:04:53 -0700 (PDT)
From: raj.khem@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Sat,  7 May 2011 01:04:48 -0700
Message-Id: <1304755488-27517-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [meta-oe][PATCHv2] conf/layer.conf: conf/layer.conf: Document the operation on BBPATH correctly in the comment
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
X-List-Received-Date: Sat, 07 May 2011 08:07:37 -0000

From: Khem Raj <raj.khem@gmail.com>

Provide additional commentary that should help a bit more

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 meta-efl/conf/layer.conf   |    2 +-
 meta-gnome/conf/layer.conf |    2 +-
 meta-gpe/conf/layer.conf   |    2 +-
 meta-oe/conf/layer.conf    |   17 ++++++++++++++++-
 4 files changed, 19 insertions(+), 4 deletions(-)

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
index 36137e9..267616b 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -1,4 +1,14 @@
-# We have a conf and classes directory, prepend to BBPATH to prefer our versions
+# It really depends on order of the layers appearing in BBLAYERS
+# variable in toplevel bblayers.conf file, where bitbake will search
+# for .inc files and others where bitbake uses BBPATH since it will
+# search the directories from first to last as specified in BBPATH
+# Therefore if you want a given layer to be considered high priority
+# for the .inc and .conf etc. then consider it adding at the beginning
+# of BBPATH. For bblayers bitbake will use BBFILES_PRIORITY to resolve
+# the recipe contention so the order of directories in BBFILES does 
+# not matter.
+
+# We have a conf and classes directory, append to BBPATH
 BBPATH .= ":${LAYERDIR}"
 
 # We have a recipes directory, add to BBFILES
@@ -6,4 +16,9 @@ BBFILES += "${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/recipes-*/*/*.bbappend"
 
 BBFILE_COLLECTIONS += "openembedded-layer"
 BBFILE_PATTERN_openembedded-layer := "^${LAYERDIR}/"
+
+# Define the priority for recipes (.bb files) from this layer,
+# choosing carefully how this layer interacts with all of the
+# other layers.
+
 BBFILE_PRIORITY_openembedded-layer = "6"
-- 
1.7.4.1



