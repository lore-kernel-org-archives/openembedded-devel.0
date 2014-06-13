Return-Path: <anders@chargestorm.se>
Received: from stoexhubfe01.domain01.net (STOEXHUBFE01.domain01.net
	[83.145.59.140])
	by mail.openembedded.org (Postfix) with ESMTP id 2D4226FE20
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jun 2014 13:01:35 +0000 (UTC)
Received: from localhost (213.114.64.43) by stoexhubfe01.domain01.net
	(10.12.10.6) with Microsoft SMTP Server id 8.3.279.1; Fri, 13 Jun 2014
	15:01:33 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 13 Jun 2014 15:01:20 +0200
Message-ID: <875fa96599ceb347572e1d7830e6386c4d0e8419.1402664272.git.anders@chargestorm.se>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <cover.1402664272.git.anders@chargestorm.se>
References: <cover.1402664272.git.anders@chargestorm.se>
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Cc: Anders Darander <anders@chargestorm.se>
Subject: [meta-webserver][PATCH 1/2] webmin: allow override of webmin login and password
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
X-List-Received-Date: Fri, 13 Jun 2014 13:01:42 -0000
Content-Type: text/plain

Don't hardcode the webmin login and password in the install script.
Instead, extract them to variables, to allow us to override them in
a bbappend.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta-webserver/recipes-webadmin/webmin/webmin_1.620.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-webserver/recipes-webadmin/webmin/webmin_1.620.bb b/meta-webserver/recipes-webadmin/webmin/webmin_1.620.bb
index 8822b92..a561de2 100644
--- a/meta-webserver/recipes-webadmin/webmin/webmin_1.620.bb
+++ b/meta-webserver/recipes-webadmin/webmin/webmin_1.620.bb
@@ -65,6 +65,9 @@ do_configure() {
     sed -i "s/find_pid_command=.*/find_pid_command=pidof NAME/" config-generic-linux
 }
 
+WEBMIN_LOGIN ?= "admin"
+WEBMIN_PASSWORD ?= "password"
+
 do_install() {
     install -d ${D}${sysconfdir}
     install -d ${D}${sysconfdir}/webmin
@@ -92,8 +95,8 @@ do_install() {
     export real_os_type="${DISTRO_NAME}"
     export real_os_version="${DISTRO_VERSION}"
     export port=10000
-    export login=admin
-    export password=password
+    export login=${WEBMIN_LOGIN}
+    export password=${WEBMIN_PASSWORD}
     export ssl=0
     export atboot=1
     export no_pam=1
-- 
2.0.0


