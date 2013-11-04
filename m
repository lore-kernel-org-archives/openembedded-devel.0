Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C46C36D290
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Nov 2013 05:49:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id rA45njg6017676
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 3 Nov 2013 21:49:45 -0800 (PST)
Received: from yow-bashfiel-d3.corp.ad.wrs.com (128.224.130.89) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Sun, 3 Nov 2013 21:49:44 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <joe@deserted.net>
Date: Mon, 4 Nov 2013 00:49:41 -0500
Message-ID: <1383544182-12671-2-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1383544182-12671-1-git-send-email-bruce.ashfield@windriver.com>
References: <1383544182-12671-1-git-send-email-bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 1/2] dnsmasq: uprev to 2.6.3
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
X-List-Received-Date: Mon, 04 Nov 2013 05:49:43 -0000
Content-Type: text/plain

A minimum dnsmasq version of 2.5.9 is required deal with IPv6 link local
addresses. So instead of just going to the minimum version, we can go
all the way to 2.6.3.

As part of this update, the following changes have been made in addition to
the pure version update:

  - PR is dropped in favour of PRSERVER functionality
  - dhcp_release is added to the default build, since it is used in the
    cleanup phase for virtual machines.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta-networking/recipes-support/dnsmasq/dnsmasq.inc     | 8 ++++++++
 meta-networking/recipes-support/dnsmasq/dnsmasq_2.55.bb | 6 ------
 meta-networking/recipes-support/dnsmasq/dnsmasq_2.63.bb | 4 ++++
 3 files changed, 12 insertions(+), 6 deletions(-)
 delete mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.55.bb
 create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.63.bb

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
index 0f5b273..e57ab72 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
@@ -22,6 +22,12 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG[dbus] = "COPTS=-DHAVE_DBUS,,dbus"
 EXTRA_OEMAKE = "${EXTRA_OECONF}"
 
+do_compile_append() {
+    # build dhcp_release
+    cd ${S}/contrib/wrt
+    oe_runmake
+}
+
 do_install () {
     oe_runmake "PREFIX=${D}${prefix}" \
                "BINDIR=${D}${bindir}" \
@@ -34,6 +40,8 @@ do_install () {
     install -d ${D}${systemd_unitdir}/system
     install -m 0644 ${WORKDIR}/dnsmasq.service ${D}${systemd_unitdir}/system
 
+    install -m 0755 ${S}/contrib/wrt/dhcp_release ${D}${bindir}
+
     if [ "${@base_contains('PACKAGECONFIG', 'dbus', 'dbus', '', d)}" != "" ]; then
         install -d ${D}${sysconfdir}/dbus-1/system.d
         install -m 644 dbus/dnsmasq.conf ${D}${sysconfdir}/dbus-1/system.d/
diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.55.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.55.bb
deleted file mode 100644
index ae37db7..0000000
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.55.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require dnsmasq.inc
-
-PR = "r3"
-
-SRC_URI[dnsmasq-2.55.md5sum] = "b093d7c6bc7f97ae6fd35d048529232a"
-SRC_URI[dnsmasq-2.55.sha256sum] = "cf63ecf5977f00474cbda98376a9d8743500a82fd98e13f43d7037bce9f9f929"
diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.63.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.63.bb
new file mode 100644
index 0000000..2df3713
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.63.bb
@@ -0,0 +1,4 @@
+require dnsmasq.inc
+
+SRC_URI[dnsmasq-2.63.md5sum] = "43e771997615ebcd8f6c6ffa60c3e40b"
+SRC_URI[dnsmasq-2.63.sha256sum] = "fd86e3bcc6a63c76e35e4a20baa790e7bbbfc7b43845cae85ca8ffd024467710"
-- 
1.8.1.2


