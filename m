Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 263787688F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Aug 2015 09:22:20 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t7B9MKCQ026411
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Aug 2015 02:22:20 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Tue, 11 Aug 2015 02:22:20 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 11 Aug 2015 17:19:04 +0800
Message-ID: <1439284744-14709-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-networking] netcf: align the systemd file path with Makefile
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
X-List-Received-Date: Tue, 11 Aug 2015 09:22:23 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

systemd service file is installed under ${prefix}/lib/ which is not same
as ${libdir}, so align the path with Makefile, and remove it if it is not
same as ${libdir}

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta-networking/recipes-support/netcf/netcf_git.bb | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-support/netcf/netcf_git.bb b/meta-networking/recipes-support/netcf/netcf_git.bb
index d47bb3b..19e85a0 100644
--- a/meta-networking/recipes-support/netcf/netcf_git.bb
+++ b/meta-networking/recipes-support/netcf/netcf_git.bb
@@ -11,7 +11,6 @@ PV = "0.2.8+git${SRCPV}"
 
 SRC_URI = "git://git.fedorahosted.org/netcf.git;protocol=git \
 "
-
 DEPENDS += "augeas libnl libxslt libxml2 gnulib"
 
 S = "${WORKDIR}/git"
@@ -32,8 +31,11 @@ do_configure_prepend() {
 do_install_append() {
     if ${@base_contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
        install -d ${D}${systemd_unitdir}/system
-       mv ${D}${libdir}/systemd/system/* ${D}${systemd_unitdir}/system/
-       rm -rf ${D}${libdir}/systemd/
+       mv ${D}${prefix}/lib/systemd/system/* ${D}${systemd_unitdir}/system/
+       rm -rf ${D}${prefix}/lib/systemd
+       if [ $libdir != ${prefix}/lib ]; then
+          rm -rf ${D}${prefix}/lib/
+       fi
     else
        mv ${D}${sysconfdir}/rc.d/init.d/ ${D}${sysconfdir}
        rm -rf ${D}${sysconfdir}/rc.d/
-- 
1.9.1


