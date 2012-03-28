Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SCorM-0001fp-20
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Mar 2012 11:08:04 +0200
Received: by wera1 with SMTP id a1so497902wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Mar 2012 01:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=VKbJARPER0Es1Ww3zgDCBG6RALnd9q6zSVjuFmS/Bso=;
	b=sTEKg4PtV4/MjheJrdRkGAyPcrB81YBVTL/fVKlmDs6PRLcSXmYFRWkU8whHFzt+RD
	2p8rqs6yq8cvhDWNkCy2SvW/UWbnU/xFQS+YaxDHgjLqXTNoTikTHlPW7bbHX4dyCnhY
	pYer6+DNJqi44PYghjD/Ukx4JasvLR1U03GB/uSVjmeZfVLuL7rOE/Na/KOO4otPg3Ua
	midRvej7V6qqgBlsrQ6hJtahStXCTMRbMZ4P1+2vvWqPiJWxIEJNOeJ3DBMM5/bAHV42
	4L5HjMKS/ltbqcNZ8l7XuYTqLfTSAMjmC8tTKXP+x9mmqVuODdrGn57pxPBY7UdA8dzi
	1E7Q==
Received: by 10.180.85.35 with SMTP id e3mr5099906wiz.6.1332925142095;
	Wed, 28 Mar 2012 01:59:02 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-83.unitymediagroup.de.
	[95.222.156.83])
	by mx.google.com with ESMTPS id ex2sm10807133wib.8.2012.03.28.01.59.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Mar 2012 01:59:01 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Mar 2012 10:58:55 +0200
Message-Id: <1332925138-28464-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [meta-oe, v2 1/4] libcgroup: fix QA warnings
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
X-List-Received-Date: Wed, 28 Mar 2012 09:08:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

fix the following warnings:
WARNING: For recipe libcgroup, the following files/directories were installed but not shipped in any package:
WARNING:   /lib/security/pam_cgroup.la
WARNING:   /lib/security/.debug
WARNING:   /lib/security/.debug/pam_cgroup.so.0.0.0
WARNING:   /lib/security/.debug/pam_cgroup.so
WARNING:   /lib/security/.debug/pam_cgroup.so.0

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-core/libcgroup/libcgroup_0.37.1.bb |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta-oe/recipes-core/libcgroup/libcgroup_0.37.1.bb b/meta-oe/recipes-core/libcgroup/libcgroup_0.37.1.bb
index 91829fa..9aba6e1 100644
--- a/meta-oe/recipes-core/libcgroup/libcgroup_0.37.1.bb
+++ b/meta-oe/recipes-core/libcgroup/libcgroup_0.37.1.bb
@@ -3,6 +3,8 @@ SECTION = "libs"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
+PR = "r1"
+
 inherit autotools pkgconfig
 
 DEPENDS = "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
@@ -18,6 +20,8 @@ PARALLEL_MAKE = ""
 
 PACKAGES =+ "cgroups-pam-plugin"
 FILES_cgroups-pam-plugin = "${base_libdir}/security/pam_cgroup.so*"
+FILES_${PN}-dbg += "${base_libdir}/security/.debug"
+FILES_${PN}-dev += "${base_libdir}/security/*.la"
 
 # We really need the symlink so :(
 ERROR_QA = "debug-deps dev-deps debug-files arch la2 pkgconfig la perms"
-- 
1.7.6.5



