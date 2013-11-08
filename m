Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B9DB86D467
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Nov 2013 05:08:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id rA858jAu001555
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 7 Nov 2013 21:08:45 -0800 (PST)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.168) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Thu, 7 Nov 2013 21:08:45 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 8 Nov 2013 13:08:44 +0800
Message-ID: <1383887325-8280-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH meta-networking] ntp: fix 60-ntpd.list path
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
X-List-Received-Date: Fri, 08 Nov 2013 05:08:45 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

60-ntpd.list should be installed into the same path as ntp systemd service
file, like Fedora core; Orignal path refers
http://www.freedesktop.org/wiki/Software/systemd/timedated/, but where
systemd_unitdir is assumed as /usr/lib/systemd, not /lib/systemd

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta-networking/recipes-support/ntp/ntp.inc |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-support/ntp/ntp.inc b/meta-networking/recipes-support/ntp/ntp.inc
index 65d90de..9ea24e9 100644
--- a/meta-networking/recipes-support/ntp/ntp.inc
+++ b/meta-networking/recipes-support/ntp/ntp.inc
@@ -67,9 +67,8 @@ do_install_append() {
     install -m 0644 ${WORKDIR}/ntpd.service ${D}${systemd_unitdir}/system/
     install -m 0644 ${WORKDIR}/sntp.service ${D}${systemd_unitdir}/system/
 
-    # see http://www.freedesktop.org/wiki/Software/systemd/timedated/
-    install -d ${D}${libdir}/systemd/ntp-units.d
-    install -m 0644 ${WORKDIR}/ntpd.list ${D}${libdir}/systemd/ntp-units.d/60-ntpd.list
+    install -d ${D}${systemd_unitdir}/ntp-units.d
+    install -m 0644 ${WORKDIR}/ntpd.list ${D}${systemd_unitdir}/ntp-units.d/60-ntpd.list
 }
 
 PACKAGES += "ntpdate sntp ${PN}-tickadj ${PN}-utils"
-- 
1.7.10.4


