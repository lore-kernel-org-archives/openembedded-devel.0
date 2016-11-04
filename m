Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 700AD6FFCE
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Nov 2016 08:37:32 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uA48bUHj004297
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 4 Nov 2016 01:37:30 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Fri, 4 Nov 2016 01:37:29 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 4 Nov 2016 16:36:58 +0800
Message-ID: <20161104083658.27980-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.8.3
MIME-Version: 1.0
Subject: [meta-oe][PATCH] edac-utils: fix systemd service
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
X-List-Received-Date: Fri, 04 Nov 2016 08:37:33 -0000
Content-Type: text/plain

Fix edac-utils systemd service file so that `systemctl stop edac' doesn't
fail.

Remove the ExecStop line as there's no '--unload' option for edac-ctl.
Also, disable edac service by default.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-oe/recipes-support/edac-utils/edac-utils_git.bb  | 1 +
 meta-oe/recipes-support/edac-utils/files/edac.service | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/edac-utils/edac-utils_git.bb b/meta-oe/recipes-support/edac-utils/edac-utils_git.bb
index b3ff1cc..2c0914d 100644
--- a/meta-oe/recipes-support/edac-utils/edac-utils_git.bb
+++ b/meta-oe/recipes-support/edac-utils/edac-utils_git.bb
@@ -44,3 +44,4 @@ do_install_append() {
 }
 
 SYSTEMD_SERVICE_${PN} = "edac.service"
+SYSTEMD_AUTO_ENABLE_${PN} = "disable"
diff --git a/meta-oe/recipes-support/edac-utils/files/edac.service b/meta-oe/recipes-support/edac-utils/files/edac.service
index 9f687a8..f6b211e 100644
--- a/meta-oe/recipes-support/edac-utils/files/edac.service
+++ b/meta-oe/recipes-support/edac-utils/files/edac.service
@@ -4,7 +4,6 @@ Description=Initialize EDAC Drivers For Machine Hardware
 [Service]
 Type=oneshot
 ExecStart=@SBINDIR@/edac-ctl --register-labels
-ExecStop=@SBINDIR@/edac-ctl --unload
 RemainAfterExit=yes
 
 [Install]
-- 
2.8.3


