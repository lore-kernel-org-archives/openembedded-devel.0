Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8CC1F601F6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Oct 2014 07:17:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9S7HsmC029455
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Oct 2014 00:17:55 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 28 Oct 2014 00:17:54 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 28 Oct 2014 15:19:29 +0800
Message-ID: <1414480769-23034-1-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] krb5: add initscripts-functions to RDEPENDS
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
X-List-Received-Date: Tue, 28 Oct 2014 07:17:59 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

As this recipe doesn't inherit update-rc.d, we need to add to its
runtime dependency initscripts-functions ourselves. Otherwise, we
would spot errors in systemd systems when we execute commands like
`systemctl start krb5-kdc'.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-oe/recipes-connectivity/krb5/krb5_1.12.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.12.2.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.12.2.bb
index d3c643c..f3f16b9 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.12.2.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.12.2.bb
@@ -53,6 +53,9 @@ FILES_${PN} += "${datadir}/gnats"
 FILES_${PN}-doc += "${datadir}/examples"
 FILES_${PN}-dbg += "${libdir}/krb5/plugins/*/.debug"
 
+# As this recipe doesn't inherit update-rc.d, we need to add this dependency here
+RDEPENDS_${PN} += "initscripts-functions"
+
 krb5_do_unpack() {
     # ${P}-signed.tar contains ${P}.tar.gz.asc and ${P}.tar.gz
     tar xzf ${WORKDIR}/${BP}.tar.gz -C ${WORKDIR}/
-- 
1.9.1


