Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SrbpN-0000f1-J5
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Jul 2012 23:30:37 +0200
Received: by weyr6 with SMTP id r6so1222814wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jul 2012 14:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer;
	bh=rkzfkeTZV4AX0YZVdDgsw0C3ur4ghyXGuA3ydSAKx8k=;
	b=d8ti6FXbZ9HUqLRXcPoKs+BhKer3s8OutGnACqNeatVMIw+3fnzr09TJqI+yVYE2n2
	f9aVZfxtfqse1sofQQwNXwHFNDdnVJcsVc5QMFP1TNZMoIFf9lbu5pEcjCkqmlaY+Y4K
	2YIyOp0i66DaTXUBfPLXt8jGcGxMG6KqJp9EI6ZR5Fpva05M+FrTwhib2/FT3PBF1mp7
	G9rA8h/VXSJ6Fx0cgX6CIyKHcuHi08otnaGi994jeLLz0OBtAJfEce8y42DcDD1FRSTJ
	vE5M8IVuAb2mM/aJ5KUcHZYfL2/Rj9eXgn0Qz0ntjMulsw7slovrQK1iB3XhX+E5nMP/
	owlQ==
Received: by 10.216.138.13 with SMTP id z13mr1357831wei.65.1342646355546;
	Wed, 18 Jul 2012 14:19:15 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id bc2sm379125wib.0.2012.07.18.14.19.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 Jul 2012 14:19:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Jul 2012 23:19:10 +0200
Message-Id: <cover.1342645937.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [meta-efl][RFC 00/14] Newer EFL if someone is interested - just RFC now
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
X-List-Received-Date: Wed, 18 Jul 2012 21:30:37 -0000

It's RFC because I've tested it only with efl-from-svn-recipes.inc in use 
(1.2.1 EFL isn't probably compatible with this new e-wm and stuff..) and
without rebuilding from scratch (will probably force me to fix some other
recipes too because of new automake etc.. :/)

Next EFL release is planed for end of July and first E17 release after that 
so it's time for interested people to test their changes, but I'll probably 
send final pull-request only when there are beta/rc tarballs too (so that 
efl-from-svn-recipes.inc won't be needed).

The following changes since commit df741a297e1190d2dc23a133bc4a0a41118019c6:

  gsettings-desktop-schemas: add SRC_URI checksums (2012-07-18 09:23:08 +0200)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib jansa/efl
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/efl

Martin Jansa (14):
  e-base: bump EFL_SRCREV
  eina: do not remove bindir, it's not created with new automake
  ecore: update fix-ecore-fb-initialization.patch for svn recipe
  efl: update PV in svn recipes to sort higher then release
  efl-from-svn-recipes: update to match PV from svn recipes
  terminology: add recipe for terminal emulator
  evas: package cserve2 and its loaders
  efreet: inherit gettext
  e-wm: update LIC_FILES_CHKSUM
  e-wm: packaging: include flags in PN-images, add catch-all
    PN-backgrounds package
  e-wm: use new update-alternatives syntax
  webkit-efl: upgrade to 1.9.3
  eve: add patch to build against newer webkit-efl
  terminology: add terminology-themes to RDEPENDS

 meta-efl/classes/e-base.bbclass                    |    2 +-
 .../conf/distro/include/efl-from-svn-recipes.inc   |    6 +-
 meta-efl/recipes-efl/e17/e-wm_svn.bb               |   15 +++--
 .../eve/0001-eve-update-for-newer-webkit-efl.patch |   38 ++++++++++
 meta-efl/recipes-efl/e17/eve_svn.bb                |    2 +
 meta-efl/recipes-efl/e17/terminology_svn.bb        |   25 +++++++
 .../ecore-1.2.1/fix-ecore-fb-initialization.patch  |   41 +++++++++++
 .../efl/ecore/fix-ecore-fb-initialization.patch    |   24 +++---
 meta-efl/recipes-efl/efl/ecore_svn.bb              |    2 +-
 meta-efl/recipes-efl/efl/edbus_svn.bb              |    2 +-
 meta-efl/recipes-efl/efl/edje_svn.bb               |    2 +-
 meta-efl/recipes-efl/efl/eet_svn.bb                |    2 +-
 meta-efl/recipes-efl/efl/eeze_svn.bb               |    2 +-
 meta-efl/recipes-efl/efl/efreet_svn.bb             |    4 +-
 meta-efl/recipes-efl/efl/eina.inc                  |    4 -
 meta-efl/recipes-efl/efl/eina_svn.bb               |    2 +-
 meta-efl/recipes-efl/efl/eio_svn.bb                |    2 +-
 meta-efl/recipes-efl/efl/elementary_svn.bb         |    2 +-
 meta-efl/recipes-efl/efl/embryo_svn.bb             |    2 +-
 meta-efl/recipes-efl/efl/emotion_svn.bb            |    2 +-
 meta-efl/recipes-efl/efl/ethumb_svn.bb             |    2 +-
 meta-efl/recipes-efl/efl/evas.inc                  |   17 ++++-
 meta-efl/recipes-efl/efl/evas_svn.bb               |    2 +-
 ...t-pass-P-to-the-preprocessor-when-running.patch |   76 --------------------
 ...ore-add-EINA_LIBRARIES-to-shell-build-for.patch |   28 -------
 .../recipes-efl/webkit/webkit-efl/CMakeLists.txt   |   38 ++++++----
 meta-efl/recipes-efl/webkit/webkit-efl_svn.bb      |   10 +--
 27 files changed, 186 insertions(+), 168 deletions(-)
 create mode 100644 meta-efl/recipes-efl/e17/eve/0001-eve-update-for-newer-webkit-efl.patch
 create mode 100644 meta-efl/recipes-efl/e17/terminology_svn.bb
 create mode 100644 meta-efl/recipes-efl/efl/ecore-1.2.1/fix-ecore-fb-initialization.patch
 delete mode 100644 meta-efl/recipes-efl/webkit/webkit-efl/0001-CMake-Do-not-pass-P-to-the-preprocessor-when-running.patch
 delete mode 100644 meta-efl/recipes-efl/webkit/webkit-efl/0001-JavaScriptCore-add-EINA_LIBRARIES-to-shell-build-for.patch

-- 
1.7.8.6



