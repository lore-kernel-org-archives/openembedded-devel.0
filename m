Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 483B2718E1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jan 2015 06:44:40 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0Q6ietF023685
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Jan 2015 22:44:40 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Sun, 25 Jan 2015 22:44:39 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 26 Jan 2015 14:39:39 +0800
Message-ID: <1422254380-30419-1-git-send-email-Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/2] syslog-ng: Add a PACKAGECONFIG for syslog-ng-libs
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
X-List-Received-Date: Mon, 26 Jan 2015 06:44:45 -0000
Content-Type: text/plain

This solves the following warning:
WARNING: QA Issue: syslog-ng-libs rdepends on geoip, but it isn't a build
dependency? [build-deps]

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta-oe/recipes-support/syslog-ng/syslog-ng.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
index 984af43..4aead31 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
@@ -53,6 +53,7 @@ PACKAGECONFIG[libnet] = "--enable-libnet --with-libnet=${STAGING_BINDIR_CROSS},-
 PACKAGECONFIG[smtp] = "--enable-smtp --with-libesmtp=${STAGING_LIBDIR},--disable-smtp,libesmtp,"
 PACKAGECONFIG[json] = "--enable-json,--disable-json,json-c,"
 PACKAGECONFIG[tcp-wrapper] = "--enable-tcp-wrapper,--disable-tcp-wrapper,tcp-wrappers,"
+PACKAGECONFIG[geoip] = "--enable-geoip,--disable-geoip,geoip,"
 
 do_configure_prepend() {
     eval "${@base_contains('DISTRO_FEATURES', 'largefile', '', 'sed -i -e "s/-D_LARGEFILE_SOURCE//" -e "s/-D_FILE_OFFSET_BITS=64//" ${S}/configure.in', d)}"
-- 
1.9.1


