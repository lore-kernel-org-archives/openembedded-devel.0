Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E57637327F
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Sep 2016 06:13:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u816DhSX022124
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2016 23:13:44 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 31 Aug 2016 23:13:43 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 1 Sep 2016 14:11:43 +0800
Message-ID: <1472710303-22786-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH v2] samba: fix to package pidl in samba-pidl
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
X-List-Received-Date: Thu, 01 Sep 2016 06:13:45 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

* Use =+ to replace the previous += to let samba-pidl
  do package before samba to guarantee the file /usr/bin/pidl
  packaged in samba-pidl as both samba and samba-pidl have
  rules to package /usr/bin/pidl and the command pidl depends
  on perl modules such as Parse/Pidl.pm resides in samba-pidl

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta-networking/recipes-connectivity/samba/samba_4.4.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
index e35d527..e1b15ea 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
@@ -126,7 +126,7 @@ do_install_append() {
     rm -rf ${D}/run ${D}${localstatedir}/run ${D}${localstatedir}/log
 }
 
-PACKAGES += "${PN}-python ${PN}-python-dbg ${PN}-pidl libwinbind libwinbind-dbg libwinbind-krb5-locator"
+PACKAGES =+ "${PN}-python ${PN}-python-dbg ${PN}-pidl libwinbind libwinbind-dbg libwinbind-krb5-locator"
 PACKAGES =+ "libwbclient libnss-winbind winbind winbind-dbg libnetapi libsmbsharemodes \
              libsmbclient libsmbclient-dev lib${PN}-base ${PN}-base ${PN}-ctdb-tests"
 
-- 
2.8.1


