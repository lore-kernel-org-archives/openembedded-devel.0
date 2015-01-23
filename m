Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 49F5165C7B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jan 2015 02:29:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0N2TZ6X020752
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Jan 2015 18:29:35 -0800 (PST)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.136) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 22 Jan 2015 18:29:35 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 23 Jan 2015 10:29:34 +0800
Message-ID: <1421980174-22133-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Subject: [PATCH][meta-networking] iscsi-initiator-utils: fix the iscsid path in iscsid.conf
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
X-List-Received-Date: Fri, 23 Jan 2015 02:29:40 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

iscsid is installed into ${sbindir}, which is /usr/sbin, not /sbin/,
so fix it in /etc/iscsi/iscsid.conf

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../iscsi-initiator-utils/iscsi-initiator-utils_2.0-873.bb              | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0-873.bb b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0-873.bb
index d48cf24..f510ce5 100644
--- a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0-873.bb
+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0-873.bb
@@ -69,6 +69,8 @@ do_install () {
     install -p -m 644 ${S}/etc/iscsid.conf ${D}${sysconfdir}/iscsi
     install -p -m 755 ${WORKDIR}/initd.debian ${D}${sysconfdir}/init.d/iscsid
 
+    sed -i -e "s:= /sbin/iscsid:= ${sbindir}/iscsid:" ${D}${sysconfdir}/iscsi/iscsid.conf
+
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
         install -d ${D}${sysconfdir}/tmpfiles.d
         echo "d /run/${BPN}/lock - - - -" \
-- 
2.1.0


