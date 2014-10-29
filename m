Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C6A11601A0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Oct 2014 05:23:28 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9T5NRLM021076
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Oct 2014 22:23:28 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 28 Oct 2014 22:23:27 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 29 Oct 2014 01:23:26 -0400
Message-ID: <1414560206-29833-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH] vpnc: use nativeperl to run perl scripts
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
X-List-Received-Date: Wed, 29 Oct 2014 05:23:37 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

inhert perlnative and make sure we use nativeperl
to run perl scripts when compile.

fixed:
| ./makeman.pl
| Can't locate Fatal.pm in @INC

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb b/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
index 986416a..4efc412 100644
--- a/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
+++ b/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
@@ -7,9 +7,16 @@ LICENSE = "GPL-2.0+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=173b74cb8ac640a9992c03f3bce22a33"
 DEPENDS = "libgcrypt"
 
+inherit perlnative
+
 CFLAGS_append = ' -DVERSION=\\"${PV}\\"'
 LDFLAGS_append = " -lgcrypt -lgpg-error"
 
+do_configure_append () {
+    # Make sure we use our nativeperl wrapper
+    sed -i "1s:#!.*:#!/usr/bin/env nativeperl:" ${S}/*.pl
+}
+
 do_install () {
     sed -i s:m600:m\ 600:g Makefile    
     oe_runmake 'DESTDIR=${D}' 'PREFIX=/usr' install
-- 
2.0.0


