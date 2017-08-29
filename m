Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EAA1077D08
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Aug 2017 08:39:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7T8duCJ014584
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Aug 2017 01:39:56 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Tue, 29 Aug 2017 01:39:55 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 29 Aug 2017 16:28:18 +0800
Message-ID: <20170829082818.25340-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] samba: 4.6.5 -> 4.6.7
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
X-List-Received-Date: Tue, 29 Aug 2017 08:39:56 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Upgrade samba from 4.6.5 to 4.6.7 to fix CVE-2017-11103.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../recipes-connectivity/samba/{samba_4.6.5.bb => samba_4.6.7.bb}    | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/samba/{samba_4.6.5.bb => samba_4.6.7.bb} (98%)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.6.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.6.7.bb
similarity index 98%
rename from meta-networking/recipes-connectivity/samba/samba_4.6.5.bb
rename to meta-networking/recipes-connectivity/samba/samba_4.6.7.bb
index 389a2743e..7f0770bf0 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.6.5.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.6.7.bb
@@ -25,8 +25,9 @@ SRC_URI_append_libc-musl = " \
            file://samba-4.2.7-pam.patch \
            file://samba-4.3.9-remove-getpwent_r.patch \
           "
-SRC_URI[md5sum] = "2ae8ce2862d8bfa95e4681371ebb1623"
-SRC_URI[sha256sum] = "c06901e1d318b425b8c3ecea3ef23a91e7371312a9ea7adbf34fb8eb42ca3b84"
+
+SRC_URI[md5sum] = "c6ee5c766016d59908c8fb672fbbd445"
+SRC_URI[sha256sum] = "9ef24393de08390f236cabccd6a420b5cea304e959cbf1a99ff317325db3ddfa"
 
 inherit systemd waf-samba cpan-base perlnative update-rc.d
 # remove default added RDEPENDS on perl
-- 
2.14.1


