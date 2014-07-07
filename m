Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 15BBE7036A
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Jul 2014 10:03:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s67A3dqH027088
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 7 Jul 2014 03:03:39 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Mon, 7 Jul 2014 03:03:39 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 7 Jul 2014 03:03:36 -0700
Message-ID: <1404727418-20199-2-git-send-email-liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1404727418-20199-1-git-send-email-liezhi.yang@windriver.com>
References: <1404727418-20199-1-git-send-email-liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe] [PATCH 1/3] meta-oe: fix no newline at end of file
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
X-List-Received-Date: Mon, 07 Jul 2014 10:03:40 -0000
Content-Type: text/plain

Add a '\n' to the last line of the file to fix:

No newline at end of file

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../recipes-connectivity/samba/samba/init.samba    |    2 +-
 meta-oe/recipes-devtools/cloud9/cloud9/index.js    |    2 +-
 .../openldap/openldap-2.4.23/initscript            |    2 +-
 meta-oe/recipes-support/rng-tools/files/init       |    2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-connectivity/samba/samba/init.samba b/meta-oe/recipes-connectivity/samba/samba/init.samba
index cb57b17..6a44ac4 100644
--- a/meta-oe/recipes-connectivity/samba/samba/init.samba
+++ b/meta-oe/recipes-connectivity/samba/samba/init.samba
@@ -55,4 +55,4 @@ case "$1" in
     exit 1
 esac
 
-exit 0
\ No newline at end of file
+exit 0
diff --git a/meta-oe/recipes-devtools/cloud9/cloud9/index.js b/meta-oe/recipes-devtools/cloud9/cloud9/index.js
index e40dd6d..88c9a19 100644
--- a/meta-oe/recipes-devtools/cloud9/cloud9/index.js
+++ b/meta-oe/recipes-devtools/cloud9/cloud9/index.js
@@ -1,2 +1,2 @@
 var o3 = require('./o3.js')
-module.exports = o3.xml;
\ No newline at end of file
+module.exports = o3.xml;
diff --git a/meta-oe/recipes-support/openldap/openldap-2.4.23/initscript b/meta-oe/recipes-support/openldap/openldap-2.4.23/initscript
index 40881cd..1395f72 100644
--- a/meta-oe/recipes-support/openldap/openldap-2.4.23/initscript
+++ b/meta-oe/recipes-support/openldap/openldap-2.4.23/initscript
@@ -26,4 +26,4 @@ case "$1" in
     exit 1
 esac
 
-exit 0
\ No newline at end of file
+exit 0
diff --git a/meta-oe/recipes-support/rng-tools/files/init b/meta-oe/recipes-support/rng-tools/files/init
index 5fa5959..7cf7839 100644
--- a/meta-oe/recipes-support/rng-tools/files/init
+++ b/meta-oe/recipes-support/rng-tools/files/init
@@ -46,4 +46,4 @@ case "$1" in
     exit 1
 esac
 
-exit 0
\ No newline at end of file
+exit 0
-- 
1.7.9.5


