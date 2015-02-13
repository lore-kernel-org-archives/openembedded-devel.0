Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CB2E5733C9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2015 13:30:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t1DDUNER025657
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2015 05:30:23 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 13 Feb 2015 05:30:23 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 13 Feb 2015 05:30:22 -0800
Message-ID: <1423834223-25626-1-git-send-email-liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 1/2] opensaf: install opensafd.service
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Feb 2015 13:30:24 -0000
Content-Type: text/plain

Fixed when systemd:
ERROR: Function failed: SYSTEMD_SERVICE_opensaf value opensafd.service does not exist

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../recipes-daemons/opensaf/opensaf_4.5.0.bb       |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-daemons/opensaf/opensaf_4.5.0.bb b/meta-networking/recipes-daemons/opensaf/opensaf_4.5.0.bb
index 5b42def..5fe929c 100644
--- a/meta-networking/recipes-daemons/opensaf/opensaf_4.5.0.bb
+++ b/meta-networking/recipes-daemons/opensaf/opensaf_4.5.0.bb
@@ -39,4 +39,7 @@ do_install_append() {
     rm -fr "${D}${localstatedir}/lock"
     rm -fr "${D}${localstatedir}/run"
     rmdir --ignore-fail-on-non-empty "${D}${localstatedir}"
+    install -d ${D}${systemd_unitdir}/system
+    install -m 0644 ${B}/osaf/services/infrastructure/nid/config/opensafd.service \
+        ${D}${systemd_unitdir}/system
 }
-- 
1.7.9.5


