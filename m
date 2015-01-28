Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DFE337147D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jan 2015 03:28:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0S3SphK000045
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jan 2015 19:28:51 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 27 Jan 2015 19:28:50 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 28 Jan 2015 11:23:43 +0800
Message-ID: <1422415423-19807-1-git-send-email-Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] samba: disable service by default
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
X-List-Received-Date: Wed, 28 Jan 2015 03:28:53 -0000
Content-Type: text/plain

Disable smb, nmb, winbind service by default.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta-oe/recipes-connectivity/samba/samba.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-connectivity/samba/samba.inc b/meta-oe/recipes-connectivity/samba/samba.inc
index fd96bbe..b04a9dd 100644
--- a/meta-oe/recipes-connectivity/samba/samba.inc
+++ b/meta-oe/recipes-connectivity/samba/samba.inc
@@ -20,6 +20,8 @@ inherit autotools-brokensep update-rc.d systemd
 SYSTEMD_PACKAGES = "${PN} winbind"
 SYSTEMD_SERVICE_${PN} = "nmb.service smb.service"
 SYSTEMD_SERVICE_winbind = "winbind.service"
+SYSTEMD_AUTO_ENABLE_${PN} = "disable"
+SYSTEMD_AUTO_ENABLE_winbind = "disable"
 
 SAMBAMMAP = "no"
 SAMBAMMAP_libc-glibc = "yes"
-- 
1.9.1


