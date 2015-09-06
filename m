Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4F2F776BD7
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  6 Sep 2015 06:39:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t866d5BX022697
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 5 Sep 2015 23:39:05 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Sat, 5 Sep 2015 23:39:04 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 6 Sep 2015 14:33:54 +0800
Message-ID: <1441521234-19902-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] collectd: fix a floating dependence on openldap
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
X-List-Received-Date: Sun, 06 Sep 2015 06:39:06 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta-oe/recipes-extended/collectd/collectd_5.5.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/collectd/collectd_5.5.0.bb b/meta-oe/recipes-extended/collectd/collectd_5.5.0.bb
index fd3b1ab..55d7b38 100644
--- a/meta-oe/recipes-extended/collectd/collectd_5.5.0.bb
+++ b/meta-oe/recipes-extended/collectd/collectd_5.5.0.bb
@@ -45,6 +45,7 @@ PACKAGECONFIG[libvirt] = "--enable-libvirt,--disable-libvirt,libvirt"
 PACKAGECONFIG[libesmtp] = "--with-libesmtp,--without-libesmtp,libesmtp"
 PACKAGECONFIG[libmnl] = "--with-libmnl,--without-libmnl,libmnl"
 PACKAGECONFIG[libatasmart] = "--with-libatasmart,--without-libatasmart,libatasmart"
+PACKAGECONFIG[ldap] = "--enable-openldap --with-libldap,--disable-openldap --without-libldap, openldap"
 
 EXTRA_OECONF = " \
                 ${FPLAYOUT} \
-- 
1.9.1


