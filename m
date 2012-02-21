Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Rzu8W-0000Fz-Ke
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Feb 2012 19:08:24 +0100
Received: by eekd41 with SMTP id d41so2336931eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Feb 2012 10:00:05 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.28.71 as permitted sender) client-ip=10.14.28.71; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.28.71 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.28.71])
	by 10.14.28.71 with SMTP id f47mr13642619eea.38.1329847205708 (num_hops
	= 1); Tue, 21 Feb 2012 10:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=Ox2HyQTkC1vwqwdYkHUH0FGWVKbAcvTGTU9KjPjG1QE=;
	b=s5in+XDDHMNGZL0zNkxDBroYwG0dM415OSYyHdVUd6Aj6r864AwsZwWt+hjX4vdZFt
	Urn6Jik0qpyxxa+uSxSlF0gWJbFPUN/bWYoSa79rcLW93kygoXetViYt213IVWgUJsoK
	8wFfYPA0Qh1tgD05cIqz4HIVzlJ4xlGAsPh3o=
Received: by 10.14.28.71 with SMTP id f47mr10883648eea.38.1329847199972;
	Tue, 21 Feb 2012 09:59:59 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n52sm92529822eea.5.2012.02.21.09.59.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 21 Feb 2012 09:59:59 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Feb 2012 18:59:46 +0100
Message-Id: <1329847186-10278-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
Subject: [meta-oe][PATCH] vala: upgrade to newer vala from meta-smartphone/meta-fso layer
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
X-List-Received-Date: Tue, 21 Feb 2012 18:08:25 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...-gen-don-t-append-dirty-if-we-re-not-in-g.patch |   53 ++++++++++++++++++++
 meta-oe/recipes-devtools/vala/vala_0.12.1.bb       |    7 ---
 meta-oe/recipes-devtools/vala/vala_0.14.2.bb       |   14 +++++
 3 files changed, 67 insertions(+), 7 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/vala/vala-0.14.2/0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.patch
 delete mode 100644 meta-oe/recipes-devtools/vala/vala_0.12.1.bb
 create mode 100644 meta-oe/recipes-devtools/vala/vala_0.14.2.bb

diff --git a/meta-oe/recipes-devtools/vala/vala-0.14.2/0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.patch b/meta-oe/recipes-devtools/vala/vala-0.14.2/0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.patch
new file mode 100644
index 0000000..e6c7941
--- /dev/null
+++ b/meta-oe/recipes-devtools/vala/vala-0.14.2/0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.patch
@@ -0,0 +1,53 @@
+From 2460d7b79f7e90dcfeebde5e9c53d9b6798a1f3c Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Tue, 21 Feb 2012 17:12:50 +0100
+Subject: [PATCH] git-version-gen: don't append -dirty if we're not in git
+ repo
+
+* for example if we have some dirty directory and we unpack clean vala tarball in it, then it will append -dirty
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ build-aux/git-version-gen |   25 ++++++++++++++-----------
+ 1 files changed, 14 insertions(+), 11 deletions(-)
+
+diff --git a/build-aux/git-version-gen b/build-aux/git-version-gen
+index 0fa6faa..1d1f9d2 100755
+--- a/build-aux/git-version-gen
++++ b/build-aux/git-version-gen
+@@ -126,18 +126,21 @@ fi
+ 
+ v=`echo "$v" |sed 's/^v//'`
+ 
+-# Don't declare a version "dirty" merely because a time stamp has changed.
+-git status > /dev/null 2>&1
++if test -d .git
++then
++	# Don't declare a version "dirty" merely because a time stamp has changed.
++	git status > /dev/null 2>&1
+ 
+-dirty=`sh -c 'git diff-index --name-only HEAD' 2>/dev/null` || dirty=
+-case "$dirty" in
+-    '') ;;
+-    *) # Append the suffix only if there isn't one already.
+-	case $v in
+-	  *-dirty) ;;
+-	  *) v="$v-dirty" ;;
+-	esac ;;
+-esac
++	dirty=`sh -c 'git diff-index --name-only HEAD' 2>/dev/null` || dirty=
++	case "$dirty" in
++	    '') ;;
++	    *) # Append the suffix only if there isn't one already.
++		case $v in
++		  *-dirty) ;;
++		  *) v="$v-dirty" ;;
++		esac ;;
++	esac
++fi
+ 
+ # Omit the trailing newline, so that m4_esyscmd can use the result directly.
+ echo "$v" | tr -d '\012'
+-- 
+1.7.8.4
+
diff --git a/meta-oe/recipes-devtools/vala/vala_0.12.1.bb b/meta-oe/recipes-devtools/vala/vala_0.12.1.bb
deleted file mode 100644
index 1049ed6..0000000
--- a/meta-oe/recipes-devtools/vala/vala_0.12.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require vala.inc
-SRC_URI = "ftp://ftp.gnome.org/pub/GNOME/sources/vala/0.12/vala-${PV}.tar.bz2"
-
-FILES_${PN} += "${datadir}/vala-0.12/vapi"
-
-SRC_URI[md5sum] = "bf35262cc611de447147d01cbac33767"
-SRC_URI[sha256sum] = "d9a2be21bb8ab88eab838e7f3a4d0aaa2a1fddf35615dca32bef6a0051f58ea8"
diff --git a/meta-oe/recipes-devtools/vala/vala_0.14.2.bb b/meta-oe/recipes-devtools/vala/vala_0.14.2.bb
new file mode 100644
index 0000000..18e6346
--- /dev/null
+++ b/meta-oe/recipes-devtools/vala/vala_0.14.2.bb
@@ -0,0 +1,14 @@
+require recipes-devtools/vala/vala.inc
+
+PR = "r1"
+
+DEPENDS += "gtk+"
+
+SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/vala/0.14/vala-${PV}.tar.xz \
+           file://0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.patch \
+"
+
+FILES_${PN} += "${datadir}/vala-0.14/vapi"
+
+SRC_URI[md5sum] = "f05263a56c1e328637e4c97a61befdad"
+SRC_URI[sha256sum] = "807e6978484f66cab3cf4fefd72f37a4293d2831d7a5fd29119bdf9d38a5b3d0"
-- 
1.7.8.4



