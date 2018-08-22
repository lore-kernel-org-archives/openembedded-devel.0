Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B875979164
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Aug 2018 00:26:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7M0Qkrm019124
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Aug 2018 17:26:46 -0700
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Tue, 21 Aug 2018 17:26:42 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 22 Aug 2018 08:26:40 +0800
Message-ID: <1534897600-14302-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [meta-networking][PATCH 2/2] samba: upgrade 4.8.3 -> 4.8.4
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
X-List-Received-Date: Wed, 22 Aug 2018 00:26:45 -0000
Content-Type: text/plain

Security fixes:

CVE-2018-1139 (Weak authentication protocol allowed.)
CVE-2018-1140 (Denial of Service Attack on DNS and LDAP server.)
CVE-2018-10858 (Insufficient input validation on client directory listing in libsmbclient.)
CVE-2018-10918 (Denial of Service Attack on AD DC DRSUAPI server.)
CVE-2018-10919 (Confidential attribute disclosure from the AD LDAP server.)

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-connectivity/samba/{samba_4.8.3.bb => samba_4.8.4.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/samba/{samba_4.8.3.bb => samba_4.8.4.bb} (98%)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.8.3.bb b/meta-networking/recipes-connectivity/samba/samba_4.8.4.bb
similarity index 98%
rename from meta-networking/recipes-connectivity/samba/samba_4.8.3.bb
rename to meta-networking/recipes-connectivity/samba/samba_4.8.4.bb
index d244e61..da0ac32 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.8.3.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.8.4.bb
@@ -30,8 +30,8 @@ SRC_URI_append_libc-musl = " \
            file://samba-4.3.9-remove-getpwent_r.patch \
           "
 
-SRC_URI[md5sum] = "67f271ed6b793c2acfe014b5b8f0cca8"
-SRC_URI[sha256sum] = "e0569a8a605d5dfb49f1fdd11db796f4d36fe0351c4a7f21387ef253010b82ed"
+SRC_URI[md5sum] = "ca5bfbebd8d9eb95506e16594b2bbee2"
+SRC_URI[sha256sum] = "f5044d149e01894a08b1d114b8b69aed78171a7bb19608bd1fd771453b9a5406"
 
 UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.8(\.\d+)+).tar.gz"
 
-- 
2.7.4


