Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hrw@juszkiewicz.com.pl>) id 1LetTk-0005OV-TA
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 16:58:09 +0100
Received: (qmail 26494 invoked by uid 813007); 4 Mar 2009 15:53:40 -0000
X-clamdmail: clamdmail 0.18a
Received: from 89.78.173.235 (HELO localhost)
	(smtp?user@juszkiewicz.com.pl@89.78.173.235)
	by 195.149.226.213 with ESMTPA; 4 Mar 2009 15:53:40 -0000
Received: from hrw by localhost with local (Exim 4.69)
	(envelope-from <hrw@hrw.one.pl>)
	id 1LetPY-0001D2-Tv; Wed, 04 Mar 2009 16:53:32 +0100
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Mar 2009 16:52:25 +0100
Message-Id: <1236182004-4523-11-git-send-email-openembedded@haerwu.biz>
X-Mailer: git-send-email 1.6.1.3
In-Reply-To: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
Cc: Richard Purdie <richard@openedhand.com>
Subject: [PATCH 10/70] rpm: Add python module packaging (from Poky)
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
X-List-Received-Date: Wed, 04 Mar 2009 15:59:54 -0000

From: Richard Purdie <richard@openedhand.com>

git-svn-id: https://svn.o-hand.com/repos/poky@5423 311d38ba-8fff-0310-9ca6-ca027cbcb966
---
 packages/rpm/rpm_4.4.2.3.bb |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/packages/rpm/rpm_4.4.2.3.bb b/packages/rpm/rpm_4.4.2.3.bb
index ef60878..3083387 100644
--- a/packages/rpm/rpm_4.4.2.3.bb
+++ b/packages/rpm/rpm_4.4.2.3.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "The RPM Package Manager."
 HOMEPAGE = "http://rpm.org/"
 LICENSE = "LGPL GPL"
 DEPENDS = "zlib beecrypt file popt python"
-PR = "r9"
+PR = "r10"
 
 SRC_URI = "http://www.rpm.org/releases/rpm-4.4.x/rpm-4.4.2.3.tar.gz \
            file://external-tools.patch;patch=1 \
@@ -20,13 +20,16 @@ acpaths = "-I ${S}/db/dist/aclocal -I ${S}/db/dist/aclocal_java"
 
 EXTRA_OECONF = "--with-python=$PYTHONVER \
 		--with-python-incdir=${STAGING_INCDIR}/python$PYTHONVER \
-		--with-python-libdir=${STAGING_LIBDIR}/python$PYTHONVER \
+		--with-python-libdir=${libdir}/python$PYTHONVER \
 		--without-apidocs \
 		--without-selinux \
 		--without-lua \
 		--without-dmalloc \
 		--without-efence"
 
+PACKAGES += "python-rpm"
+FILES_python-rpm = "${libdir}/python*/site-packages/rpm/_*"
+
 # Handle the db MUTEX settings here, the POSIX library is
 # the default - "POSIX/pthreads/library".
 # Don't ignore the nice SWP instruction on the ARM:
-- 
1.6.1.3





