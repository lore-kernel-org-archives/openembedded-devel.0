Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6376365D0D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Apr 2014 05:24:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s3F5ODIT018124
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Apr 2014 22:24:13 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Mon, 14 Apr 2014 22:24:12 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 15 Apr 2014 13:25:05 +0800
Message-ID: <1397539505-24157-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [meta-oe][PATCH] eventlog: update version to 0.2.13
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
X-List-Received-Date: Tue, 15 Apr 2014 05:24:16 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Changes:
- Add DESCRIPTION
- Change PN to BPN to fix multilib builds

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../{eventlog_0.2.12.bb => eventlog_0.2.13.bb}     |   16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/eventlog/{eventlog_0.2.12.bb => eventlog_0.2.13.bb} (16%)

diff --git a/meta-oe/recipes-support/eventlog/eventlog_0.2.12.bb b/meta-oe/recipes-support/eventlog/eventlog_0.2.13.bb
similarity index 16%
rename from meta-oe/recipes-support/eventlog/eventlog_0.2.12.bb
rename to meta-oe/recipes-support/eventlog/eventlog_0.2.13.bb
index e31c194..349507d 100644
--- a/meta-oe/recipes-support/eventlog/eventlog_0.2.12.bb
+++ b/meta-oe/recipes-support/eventlog/eventlog_0.2.13.bb
@@ -1,10 +1,20 @@
 SUMMARY = "Replacement syslog API"
+DESCRIPTION = "The EventLog library aims to be a replacement of the \
+              simple syslog() API provided on UNIX systems. The \
+              major difference between EventLog and syslog is that \
+              EventLog tries to add structure to messages. EventLog \
+              provides an interface to build, format and output an \
+              event record. The exact format and output method can \
+              be customized by the administrator via a configuration \
+              file. his package is the runtime part of the library. \
+"
+
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b8ba8e77bcda9a53fac0fe39fe957767"
 
-SRC_URI = "http://www.balabit.com/downloads/files/syslog-ng/sources/3.2.2/source/${PN}_${PV}.tar.gz"
+SRC_URI = "http://www.balabit.com/downloads/files/syslog-ng/open-source-edition/3.4.2/source/${BPN}_${PV}.tar.gz"
 
 inherit autotools pkgconfig
 
-SRC_URI[md5sum] = "f9c32814f78ea2629850f0440de5ff34"
-SRC_URI[sha256sum] = "f78c218faa6b6b378f25c640a5d1188b1ecbd57d3a527432263fd44b17bbd1c9"
+SRC_URI[md5sum] = "68ec8d1ea3b98fa35002bb756227c315"
+SRC_URI[sha256sum] = "7cb4e6f316daede4fa54547371d5c986395177c12dbdec74a66298e684ac8b85"
-- 
1.7.9.5


