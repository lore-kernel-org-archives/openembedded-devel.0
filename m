Return-Path: <Wenlin.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F25FE605C3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Sep 2016 05:39:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u8S5dM80020354
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Sep 2016 22:39:23 -0700 (PDT)
Received: from wind-k.wrs.com (128.224.162.160) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 27 Sep 2016 22:39:22 -0700
From: Wenlin Kang <wenlin.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 28 Sep 2016 13:39:20 +0800
Message-ID: <1475041160-24120-1-git-send-email-wenlin.kang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH] lvm2: enable option o_direct
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
X-List-Received-Date: Wed, 28 Sep 2016 05:39:26 -0000
Content-Type: text/plain

During some lvm operations, e.g, create many volumes, we notice
a quite big degradation in performance with o_direct disabled,
if enabled the performance get much better, so, here we should
enable this option.

Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index d66daf8..74b7211 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -20,16 +20,17 @@ inherit autotools-brokensep pkgconfig systemd
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
                    thin-provisioning-tools \
+                   odirect \
 "
 
 PACKAGECONFIG[readline] = "--enable-readline,--disable-readline,readline"
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux"
 PACKAGECONFIG[thin-provisioning-tools] = "--with-thin=internal,--with-thin=none,,thin-provisioning-tools"
+PACKAGECONFIG[odirect] = "--enable-o_direct,--disable-o_direct"
 
 # Unset user/group to unbreak install.
 EXTRA_OECONF = "--with-user= \
                 --with-group= \
-                --disable-o_direct \
                 --enable-realtime \
                 --enable-applib \
                 --enable-cmdlib \
-- 
2.7.4


