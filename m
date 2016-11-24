Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 80F376022F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Nov 2016 05:59:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uAO5x7sp003416
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 21:59:07 -0800 (PST)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 23 Nov 2016 21:59:06 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 24 Nov 2016 13:57:13 +0800
Message-ID: <20161124055713.23487-1-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
MIME-Version: 1.0
Subject: [meta-networking][PATCH] samba: fix the hardcoded path in init script
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
X-List-Received-Date: Thu, 24 Nov 2016 05:59:07 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Replace the hardcoded path with base_bindir in init
script to fix the error:
/etc/init.d/samba.sh: line 15: /usr/bin/ps: No such file or directory
/etc/init.d/samba.sh: line 17: /usr/bin/sed: No such file or directory
/etc/init.d/samba.sh: line 16: /usr/bin/grep: No such file or directory

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-networking/recipes-connectivity/samba/samba_4.4.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
index e9694d4..6c1e3ef 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
@@ -111,6 +111,7 @@ do_install_append() {
             -e 's,/opt/samba/smb.conf,${sysconfdir}/samba/smb.conf,g' \
             -e 's,/opt/samba/log,${localstatedir}/log/samba,g' \
             -e 's,/etc/init.d/samba.server,${sysconfdir}/init.d/samba.sh,g' \
+            -e 's,/usr/bin,${base_bindir},g' \
             -i ${D}${sysconfdir}/init.d/samba.sh
     fi
 
-- 
1.9.1


