Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1P4ocs-0004bA-Lq
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Oct 2010 07:39:18 +0200
Received: by qwd6 with SMTP id 6so1095168qwd.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Oct 2010 22:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=wi1xGY5ekZC+tYADOFqe+25cgqI17M8JLsSFtXXYHiw=;
	b=g9XqeuV5btsUxXxUUy4j2YimNn8ls3i6ngiedk1XqHd3h06r61iSFNSLjtJOKHUak2
	3aInlXOEQS66ibvlT7kT3zz0lFfhjmebEDD4m1Zk/kV9ySnI5qtjoL1Yva1eqNYizjPF
	WEaLB8+cG4Z4uL2b7jskISARzJ+rjLsg31qBA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=O5lNhS4sHFVZW7lBts4Gbwk0eN8hs2PvzqzqauApBh8UEEHVaLANTIxYVr2Hq0tyj1
	oAaNHoGko8bCm6+EQvZwKk4lc4Tn5c/oLOJ/nETj5C7rkzd4N+c3oeLxCu0mimlXrl4K
	fb5nUBboYWGU6LG1jWeKXJAby4jTTA49M9M4U=
Received: by 10.229.231.3 with SMTP id jo3mr3791844qcb.21.1286689130148;
	Sat, 09 Oct 2010 22:38:50 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-170-95.ph.ph.cox.net
	[24.251.170.95])
	by mx.google.com with ESMTPS id e17sm4368555qcs.46.2010.10.09.22.38.48
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 09 Oct 2010 22:38:49 -0700 (PDT)
From: Chris Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Oct 2010 22:38:39 -0700
Message-Id: <1286689119-25553-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.7.2.3
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH] bitbake.conf: fix pkg-config relocation issue
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
X-List-Received-Date: Sun, 10 Oct 2010 05:39:18 -0000

From: Chris Larson <chris_larson@mentor.com>

By default, pkg-config falls back to checking the default search path for .pc
files, which is the native location.  If you relocate it, it will be unable to
hit that location, which can cause problems in certain cases.  In particular,
gnome-bluetooth requires gtk-doc-native to run its tools, and uses pkg-config
to determine its availability.

Fix by adding the native pkg-config locations to the PKG_CONFIG_PATH.

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 conf/bitbake.conf |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index 4e80d97..71f15a8 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -636,8 +636,9 @@ SLOT = "0"
 
 # Other
 
-export PKG_CONFIG_DIR = "${STAGING_DIR}/${BASE_PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}${libdir}/pkgconfig"
-export PKG_CONFIG_PATH = "${PKG_CONFIG_DIR}:${STAGING_DATADIR}/pkgconfig"
+export PKG_CONFIG_PATH = "${STAGING_LIBDIR}/pkgconfig:${STAGING_DATADIR}/pkgconfig"
+PKG_CONFIG_PATH .= ":${STAGING_LIBDIR_NATIVE}/pkgconfig:${STAGING_DATADIR_NATIVE}/pkgconfig"
+
 export PKG_CONFIG_SYSROOT_DIR = "${STAGING_DIR}/${BASE_PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
 export PKG_CONFIG_DISABLE_UNINSTALLED = "yes"
 
-- 
1.7.2.3



