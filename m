Received: from [206.46.173.1] (helo=vms173001pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1L19VC-0008UG-Cf
	for openembedded-devel@lists.openembedded.org;
	Sat, 15 Nov 2008 01:59:06 +0100
Received: from gandalf.denix.org ([71.255.226.167]) by vms173001.mailsrvcs.net
	(Sun Java System Messaging Server 6.2-6.01 (built Apr  3 2006))
	with ESMTPA id <0KAC00DCYNYUS6IA@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	14 Nov 2008 18:56:55 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 463B96B83A8; Fri,
	14 Nov 2008 19:56:54 -0500 (EST)
Date: Fri, 14 Nov 2008 19:56:54 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20081115005654.GA20517@denix.org>
MIME-version: 1.0
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: [RFC] Update git/git-native
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
X-List-Received-Date: Sat, 15 Nov 2008 00:59:06 -0000
X-Groupsio-MsgNum: 6601
Content-type: multipart/mixed; boundary="ibTvN161/egqYuK8"
Content-disposition: inline

--ibTvN161/egqYuK8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I'd like to propose to update the git recipe (specifically, the native one) to 
something newer than 1.5.3, currently used. The problem with that particular 
version is that it does not work reliably through the proxy. Here is the 
symptom:

$ GIT_PROXY_COMMAND=~/git-proxy.sh /OE/tmp/staging/i686-linux/usr/bin/git --version
git version 1.5.3

$ GIT_PROXY_COMMAND=~/git-proxy.sh /OE/tmp/staging/i686-linux/usr/bin/git clone git://git.infradead.org/mtd-utils.git
Initialized empty Git repository in /tmp/mtd-utils/.git/
fatal: The remote end hung up unexpectedly
fatal: early EOF
fatal: index-pack died with error code 128
fetch-pack from 'git://git.infradead.org/mtd-utils.git' failed.

The first version to work reliably with GIT_PROXY_COMMAND is 1.5.4:

$ GIT_PROXY_COMMAND=~/git-proxy.sh /OE/tmp/staging/i686-linux/usr/bin/git --version
git version 1.5.4

$ GIT_PROXY_COMMAND=~/git-proxy.sh /OE/tmp/staging/i686-linux/usr/bin/git clone git://git.infradead.org/mtd-utils.git
Initialized empty Git repository in /tmp/mtd-utils/.git/
remote: Counting objects: 2308, done.
remote: Compressing objeremote: cts: 100% (676/676), done.
remote: Total 2308 (delta 1592), reused 2308 (delta 1592)
Receiving objects: 100% (2308/2308), 942.42 KiB | 595 KiB/s, done.
Resolving deltas: 100% (1592/1592), done.

I'm not sure if there is some requirement to stick with 1.5.x version of git, 
if not the latest stable version is 1.6.0.4 - I am attaching patches for both 
just in case, with corresponding ticket #4835.

Please provide any comments.

-- 
Denys

--ibTvN161/egqYuK8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="0001-git-move-version-specific-patch-from-inc.patch"

From cb6e360408e35711170614c4a1c05628d11a5df7 Mon Sep 17 00:00:00 2001
From: Denys Dmytriyenko <denis@denix.org>
Date: Fri, 14 Nov 2008 19:33:40 -0500
Subject: [PATCH] git: move version specific git-gui-install-mode-arg-spaces.patch from .inc

---
 packages/git/git-native_1.5.2.3.bb |    3 ++-
 packages/git/git-native_1.5.3.bb   |    3 +++
 packages/git/git.inc               |    1 -
 packages/git/git_1.5.3.bb          |    4 +++-
 4 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/packages/git/git-native_1.5.2.3.bb b/packages/git/git-native_1.5.2.3.bb
index 7ddfee0..34fa87e 100644
--- a/packages/git/git-native_1.5.2.3.bb
+++ b/packages/git/git-native_1.5.2.3.bb
@@ -1,6 +1,7 @@
-
 inherit native
 require git_${PV}.bb
 
+SRC_URI += "file://git-gui-install-mode-arg-spaces.patch;patch=1"
+
 DEPENDS = "openssl-native curl-native zlib-native expat-native"
 RDEPENDS = ""
diff --git a/packages/git/git-native_1.5.3.bb b/packages/git/git-native_1.5.3.bb
index 1ef8eaf..6b9dacb 100644
--- a/packages/git/git-native_1.5.3.bb
+++ b/packages/git/git-native_1.5.3.bb
@@ -1,4 +1,7 @@
 require git.inc
+
+SRC_URI += "file://git-gui-install-mode-arg-spaces.patch;patch=1"
+
 inherit native
 DEPENDS = "openssl-native curl-native zlib-native expat-native"
 PR = "r2"
diff --git a/packages/git/git.inc b/packages/git/git.inc
index de63c54..fb88fd4 100644
--- a/packages/git/git.inc
+++ b/packages/git/git.inc
@@ -4,7 +4,6 @@ LICENSE = "GPL"
 
 SRC_URI = "http://www.kernel.org/pub/software/scm/git/git-${PV}.tar.bz2 \
            file://autotools.patch;patch=1 \
-           file://git-gui-install-mode-arg-spaces.patch;patch=1 \
 	   "
 S = "${WORKDIR}/git-${PV}"
 
diff --git a/packages/git/git_1.5.3.bb b/packages/git/git_1.5.3.bb
index f250bd5..491bb3f 100644
--- a/packages/git/git_1.5.3.bb
+++ b/packages/git/git_1.5.3.bb
@@ -1,5 +1,7 @@
 require git.inc
+
+SRC_URI += "file://git-gui-install-mode-arg-spaces.patch;patch=1"
+
 DEPENDS = "openssl curl zlib expat"
 RDEPENDS = "perl perl-module-file-path cpio findutils sed"
 PR = "r2"
-
-- 
1.5.6.4


--ibTvN161/egqYuK8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="0002-git-add-version-1.5.4.patch"

From b312b30ca9804ba8852feef213de0afc68f56aa4 Mon Sep 17 00:00:00 2001
From: Denys Dmytriyenko <denis@denix.org>
Date: Fri, 14 Nov 2008 19:36:05 -0500
Subject: [PATCH] git: add version 1.5.4

---
 packages/git/git-native_1.5.4.bb |    4 ++++
 packages/git/git_1.5.4.bb        |    4 ++++
 2 files changed, 8 insertions(+), 0 deletions(-)
 create mode 100644 packages/git/git-native_1.5.4.bb
 create mode 100644 packages/git/git_1.5.4.bb

diff --git a/packages/git/git-native_1.5.4.bb b/packages/git/git-native_1.5.4.bb
new file mode 100644
index 0000000..b5bfa02
--- /dev/null
+++ b/packages/git/git-native_1.5.4.bb
@@ -0,0 +1,4 @@
+require git.inc
+inherit native
+DEPENDS = "openssl-native curl-native zlib-native expat-native"
+PR = "r3"
diff --git a/packages/git/git_1.5.4.bb b/packages/git/git_1.5.4.bb
new file mode 100644
index 0000000..e06a4b2
--- /dev/null
+++ b/packages/git/git_1.5.4.bb
@@ -0,0 +1,4 @@
+require git.inc
+DEPENDS = "openssl curl zlib expat"
+RDEPENDS = "perl perl-module-file-path cpio findutils sed"
+PR = "r3"
-- 
1.5.6.4


--ibTvN161/egqYuK8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="0003-git-add-version-1.6.0.4.patch"

From 8146efb42306c21afb5b591e009241a574922489 Mon Sep 17 00:00:00 2001
From: Denys Dmytriyenko <denis@denix.org>
Date: Fri, 14 Nov 2008 19:36:56 -0500
Subject: [PATCH] git: add version 1.6.0.4

---
 packages/git/git-native_1.6.0.4.bb |    4 ++++
 packages/git/git_1.6.0.4.bb        |    4 ++++
 2 files changed, 8 insertions(+), 0 deletions(-)
 create mode 100644 packages/git/git-native_1.6.0.4.bb
 create mode 100644 packages/git/git_1.6.0.4.bb

diff --git a/packages/git/git-native_1.6.0.4.bb b/packages/git/git-native_1.6.0.4.bb
new file mode 100644
index 0000000..b5bfa02
--- /dev/null
+++ b/packages/git/git-native_1.6.0.4.bb
@@ -0,0 +1,4 @@
+require git.inc
+inherit native
+DEPENDS = "openssl-native curl-native zlib-native expat-native"
+PR = "r3"
diff --git a/packages/git/git_1.6.0.4.bb b/packages/git/git_1.6.0.4.bb
new file mode 100644
index 0000000..e06a4b2
--- /dev/null
+++ b/packages/git/git_1.6.0.4.bb
@@ -0,0 +1,4 @@
+require git.inc
+DEPENDS = "openssl curl zlib expat"
+RDEPENDS = "perl perl-module-file-path cpio findutils sed"
+PR = "r3"
-- 
1.5.6.4


--ibTvN161/egqYuK8--
