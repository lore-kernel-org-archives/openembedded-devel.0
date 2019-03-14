Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5520B7C699
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Mar 2019 05:58:31 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x2E5wVFR025695
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Mar 2019 22:58:32 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Wed, 13 Mar 2019 22:58:31 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 14 Mar 2019 13:50:49 +0800
Message-ID: <1552542649-8497-1-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH] dnsmasq: avoid conflict with systemd-resolved
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
X-List-Received-Date: Thu, 14 Mar 2019 05:58:31 -0000
Content-Type: text/plain

Add a drop-in configuration file for systemd-resolved to avoid
conflict about port 53. The error message is as below.

  failed to create listening socket for port 53: Address already in us

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-networking/recipes-support/dnsmasq/dnsmasq.inc                 | 3 +++
 meta-networking/recipes-support/dnsmasq/files/dnsmasq-resolved.conf | 3 +++
 2 files changed, 6 insertions(+)
 create mode 100644 meta-networking/recipes-support/dnsmasq/files/dnsmasq-resolved.conf

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
index 4f4bbf1..33678e2 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
@@ -12,6 +12,7 @@ SRC_URI = "http://www.thekelleys.org.uk/dnsmasq/${@['archive/', ''][float(d.getV
            file://dnsmasq.conf \
            file://dnsmasq-resolvconf.service \
            file://dnsmasq-noresolvconf.service \
+           file://dnsmasq-resolved.conf \
 "
 
 inherit pkgconfig update-rc.d systemd
@@ -58,6 +59,8 @@ do_install () {
     else
         install -m 0644 ${WORKDIR}/dnsmasq-noresolvconf.service ${D}${systemd_unitdir}/system/dnsmasq.service
     fi
+    install -d ${D}${sysconfdir}/systemd/resolved.conf.d/
+    install -m 0644 ${WORKDIR}/dnsmasq-resolved.conf ${D}${sysconfdir}/systemd/resolved.conf.d/
 
     install -m 0755 ${S}/contrib/lease-tools/dhcp_release ${D}${bindir}
 
diff --git a/meta-networking/recipes-support/dnsmasq/files/dnsmasq-resolved.conf b/meta-networking/recipes-support/dnsmasq/files/dnsmasq-resolved.conf
new file mode 100644
index 0000000..33f4649
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/files/dnsmasq-resolved.conf
@@ -0,0 +1,3 @@
+# Avoid conflicts between dnsmasq and systemd-resolved about port 53
+[Resolve]
+DNSStubListener=no
-- 
2.7.4


