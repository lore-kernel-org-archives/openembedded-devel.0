Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 386156CF27
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Oct 2013 08:34:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9A8YkWe001757
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Oct 2013 01:34:46 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.168) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Thu, 10 Oct 2013 01:34:45 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 10 Oct 2013 16:34:44 +0800
Message-ID: <1381394085-7681-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 1/2 meta-networking] vsftpd: use quotes to wrap variable
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
X-List-Received-Date: Thu, 10 Oct 2013 08:34:44 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

"test -z ${PAMLIB}" in do_install() may report error if ${PAMLIB}
has space chars. This commit added double quotes to wrap it in
case of errors.

Signed-off-by: Qiang Chen <qiang.chen@windriver.com>
Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb
index 2c3e009..7677477 100644
--- a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb
+++ b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb
@@ -60,7 +60,7 @@ do_install() {
 
     install -m 600 ${WORKDIR}/vsftpd.ftpusers ${D}${sysconfdir}/
     install -m 600 ${WORKDIR}/vsftpd.user_list ${D}${sysconfdir}/
-    if ! test -z ${PAMLIB} ; then
+    if ! test -z "${PAMLIB}" ; then
         install -d ${D}${sysconfdir}/pam.d/
         cp ${S}/RedHat/vsftpd.pam ${D}${sysconfdir}/pam.d/vsftpd
         sed -i "s:/lib/security:${base_libdir}/security:" ${D}${sysconfdir}/pam.d/vsftpd
-- 
1.7.10.4


