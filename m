Return-Path: <Qi.Hou@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 25F3E60722
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Dec 2017 08:30:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vB48UsF4008258
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 4 Dec 2017 00:30:55 -0800
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Mon, 4 Dec 2017 00:30:54 -0800
From: Qi Hou <qi.hou@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 4 Dec 2017 16:29:57 +0800
Message-ID: <1512376197-16055-1-git-send-email-qi.hou@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.75]
Subject: [meta-oe][PATCH] openldap: fix QA Warning
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
X-List-Received-Date: Mon, 04 Dec 2017 08:30:54 -0000
Content-Type: text/plain

While building openldap, there was a warning, like below:

WARNING: QA Issue: openldap: Files/directories were installed but not shipped in any package:
  /usr/libexec
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
openldap: 1 installed and not shipped files. [installed-vs-shipped]

This is because that after openldap all contents of /usr/libexec are split
into subsets or moved into other directory and no one makes use of it.

So, to fix this QA warning, delete /usr/libexec.

Signed-off-by: Qi Hou <qi.hou@windriver.com>
---
 meta-oe/recipes-support/openldap/openldap_2.4.45.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.45.bb b/meta-oe/recipes-support/openldap/openldap_2.4.45.bb
index 06d2467..82d6619 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.4.45.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.4.45.bb
@@ -188,6 +188,7 @@ do_install_append() {
 
     # Installing slapd under ${sbin} is more FHS and LSB compliance
     mv ${D}${libexecdir}/slapd ${D}/${sbindir}/slapd
+    rmdir --ignore-fail-on-non-empty ${D}${libexecdir}
     SLAPTOOLS="slapadd slapcat slapdn slapindex slappasswd slaptest slapauth slapacl slapschema"
     cd ${D}/${sbindir}/
     rm -f ${SLAPTOOLS}
-- 
1.9.1


