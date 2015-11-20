Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D091260112
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Nov 2015 09:32:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tAK9WoUY001325
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Nov 2015 01:32:50 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 20 Nov 2015 01:32:50 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 20 Nov 2015 01:32:43 -0800
Message-ID: <e3d245cfc1e632a96d584e845a82517dbcb6719e.1448011904.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1448011904.git.liezhi.yang@windriver.com>
References: <cover.1448011904.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/8] dracut: fix host-user-contaminated
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Nov 2015 09:32:50 -0000
Content-Type: text/plain

Issue: LIN8-1629

Fixed:
dracut-043+giteab03540cd695d940062af5b55c02e8829aaa526: dracut: /dracut/usr/lib/dracut/modules.d/99img-lib/img-lib.sh is owned by uid 15220, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
lib32-dracut-043+giteab03540cd695d940062af5b55c02e8829aaa526: lib32-dracut: /lib32-dracut/usr/lib/dracut/modules.d/99img-lib/img-lib.sh is owned by uid 15220, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]

Its Makefile uses cp -arx to install modules.d, so fix the owner
to root:root

(LOCAL REV: NOT UPSTREAM) -- Sent to oe-devel on 20151120

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../recipes-devtools/dracut/dracut_git.bb          |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
index 91a8321..e026da7 100644
--- a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
+++ b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
@@ -36,6 +36,9 @@ do_configure() {
 
 do_install() {
     oe_runmake install DESTDIR=${D}
+    # Its Makefile uses cp -arx to install modules.d, so fix the owner
+    # to root:root
+    chown -R root:root ${D}/${prefix}/lib/dracut/modules.d
 }
 
 PACKAGES =+ "${PN}-bash-completion"
-- 
1.7.9.5


