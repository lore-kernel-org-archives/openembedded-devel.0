Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 05B0065D34
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Apr 2014 06:21:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s3L6LAsj016211
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 23:21:10 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Sun, 20 Apr 2014 23:21:10 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 21 Apr 2014 02:21:04 -0400
Message-ID: <c13b8d4b0e4abad6a5f2ec55fd11cb01179054ef.1398061002.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1398061002.git.jackie.huang@windriver.com>
References: <cover.1398061002.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/4] rsyslog: use BPN to fix multilib and add all licenses
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
X-List-Received-Date: Mon, 21 Apr 2014 06:21:12 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

- use BPN instead of PN to fix multilib builds
- add all three licenses
- add DESCRIPTION

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb |   21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb
index 034592a..b1392e9 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb
@@ -1,17 +1,30 @@
 SUMMARY = "Rsyslog is an enhanced multi-threaded syslogd"
+DESCRIPTION = "\
+Rsyslog is an enhanced syslogd supporting, among others, MySQL,\
+ PostgreSQL, failover log destinations, syslog/tcp, fine grain\
+ output format control, high precision timestamps, queued operations\
+ and the ability to filter on any message part. It is quite\
+ compatible to stock sysklogd and can be used as a drop-in replacement.\
+ Its advanced features make it suitable for enterprise-class,\
+ encryption protected syslog relay chains while at the same time being\
+ very easy to setup for the novice user."
+
 DEPENDS = "zlib libestr json-c"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
 HOMEPAGE = "http://www.rsyslog.com/"
-LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=51d9635e646fb75e1b74c074f788e973"
+LICENSE = "GPLv3 & LGPLv3 & Apache-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=51d9635e646fb75e1b74c074f788e973 \
+                    file://COPYING.LESSER;md5=cb7903f1e5c39ae838209e130dca270a \
+                    file://COPYING.ASL20;md5=052f8a09206615ab07326ff8ce2d9d32\
+"
 
-SRC_URI = "http://www.rsyslog.com/files/download/rsyslog/${PN}-${PV}.tar.gz \
+SRC_URI = "http://www.rsyslog.com/files/download/rsyslog/${BPN}-${PV}.tar.gz \
            file://initscript \
 "
 
 SRC_URI[md5sum] = "ebcc010a6205c28eb505c0fe862f32c6"
 SRC_URI[sha256sum] = "276d094d1e4c62c770ec8a72723667f119eee038912b79cf3337d439bc2f9087"
-           
+
 inherit autotools pkgconfig systemd update-rc.d
 
 EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)} --enable-cached-man-pages"
-- 
1.7.9.5


