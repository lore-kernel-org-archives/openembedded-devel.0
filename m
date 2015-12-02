Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BEE05601D3
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Dec 2015 10:15:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tB2AFkLw022993
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 2 Dec 2015 02:15:46 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 2 Dec 2015 02:15:45 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 2 Dec 2015 05:15:41 -0500
Message-ID: <1449051341-115343-2-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1449051341-115343-1-git-send-email-hongxu.jia@windriver.com>
References: <1449051341-115343-1-git-send-email-hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 2/2] postfix: fix clean broken issue
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
X-List-Received-Date: Wed, 02 Dec 2015 10:15:46 -0000
Content-Type: text/plain

There is a build failure while rebuilding postfix
...
| NOTE: make -e MAKEFLAGS= OPT= DEBUG= OPTS= clean
| make -f Makefile.in MAKELEVEL= Makefiles
| (echo "# Do not edit -- this file documents how Postfix was built for your
machine.";/bin/sh makedefs) >makedefs.tmp
| No <db.h> include file found.
| Install the appropriate db*-devel package first.
| Makefile.in:31: recipe for target 'Makefiles' failed
| make: *** [Makefiles] Error 1
| Makefile:21: recipe for target 'Makefiles' failed
| make: *** [Makefiles] Error 2
| ERROR: oe_runmake failed
| ERROR: Function failed: do_configure (log file is located at tmp/work/
core2-64-wrs-linux/postfix/3.0.2-r0/temp/do_configure/log.do_configure.12848)
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-networking/recipes-daemons/postfix/postfix.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-networking/recipes-daemons/postfix/postfix.inc
index 271eb09..200d585 100644
--- a/meta-networking/recipes-daemons/postfix/postfix.inc
+++ b/meta-networking/recipes-daemons/postfix/postfix.inc
@@ -28,6 +28,8 @@ SRC_URI = "ftp://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${PV
 
 S = "${WORKDIR}/postfix-${PV}"
 
+CLEANBROKEN = "1"
+
 BBCLASSEXTEND = "native"
 
 inherit update-rc.d useradd update-alternatives systemd
-- 
1.9.1


