Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T4mvh-0002xq-ED
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Aug 2012 07:59:37 +0200
Received: by pbcwy7 with SMTP id wy7so2814504pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Aug 2012 22:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=JUqiymmPhDI2gKiuAFzjDxqhcLntdGMAEspKdFKbVGY=;
	b=YWIek2bC/Z2vJR7ipInJ+YT4PNt+gNYx+D1HAqb+UInfXKIIfTRdLt1aMZ+uBxckwa
	C7epZdikP89Ztk9PaIuWTOs7gsAljFQjsi0ki/WkkC9ZtgWT+DjwgLs7JICzJywbnUib
	QHmSaDZfyIixCO7MH7ETYNZN75qKtlMEklqoSeaERruHhnZI4zEC/lAdAZLxFqMcbenF
	cL/wfZGKaWZmyw3FypkgnDAc1UwM1DfnJfTID6h2OXgFf77rcRnNP0ZcwllyH0h6nvrz
	6w/pqZ2hk/gDrKcZtpd0Y/3Z8TRUr96Lb7Us+ZosWBkioVArjzONoubmLYIQ8rJ+KM1U
	8Y/g==
Received: by 10.68.231.10 with SMTP id tc10mr10052687pbc.107.1345787249345;
	Thu, 23 Aug 2012 22:47:29 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id jz4sm7596481pbc.17.2012.08.23.22.47.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Aug 2012 22:47:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Aug 2012 22:46:55 -0700
Message-Id: <1345787215-11917-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-systemd][PATCH] systemd: Refresh the uclibc specific patches
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
X-List-Received-Date: Fri, 24 Aug 2012 05:59:37 -0000

Make sure that patches apply on top of latest systemd
some source files have moved around.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../systemd/systemd/paper-over-mkostemp.patch      |    6 +++---
 meta-systemd/recipes-core/systemd/systemd_git.bb   |    1 +
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-systemd/recipes-core/systemd/systemd/paper-over-mkostemp.patch b/meta-systemd/recipes-core/systemd/systemd/paper-over-mkostemp.patch
index ca10440..ae4f6de 100644
--- a/meta-systemd/recipes-core/systemd/systemd/paper-over-mkostemp.patch
+++ b/meta-systemd/recipes-core/systemd/systemd/paper-over-mkostemp.patch
@@ -2,10 +2,10 @@ uclibc does not have mkostemp() so we redefine it to use mkstemp()
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
-Index: git/src/macro.h
+Index: git/src/shared/macro.h
 ===================================================================
---- git.orig/src/macro.h	2011-06-30 10:33:53.000000000 -0700
-+++ git/src/macro.h	2011-06-30 15:07:28.285270006 -0700
+--- git.orig/src/shared/macro.h	2012-08-23 22:13:18.618931300 -0700
++++ git/src/shared/macro.h	2012-08-23 22:15:05.558935366 -0700
 @@ -27,6 +27,10 @@
  #include <sys/uio.h>
  #include <inttypes.h>
diff --git a/meta-systemd/recipes-core/systemd/systemd_git.bb b/meta-systemd/recipes-core/systemd/systemd_git.bb
index eb66e59..5496512 100644
--- a/meta-systemd/recipes-core/systemd/systemd_git.bb
+++ b/meta-systemd/recipes-core/systemd/systemd_git.bb
@@ -32,6 +32,7 @@ SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;protocol=git \
            file://touchscreen.rules \
            file://modprobe.rules \
            file://var-run.conf \
+           ${UCLIBCPATCHES} \
           "
 UCLIBCPATCHES = ""
 UCLIBCPATCHES_libc-uclibc = "file://paper-over-mkostemp.patch \
-- 
1.7.9.5



