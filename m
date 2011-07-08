Received: from rs69.luxsci.com ([64.49.254.154])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gchiii@mtiemail.com>) id 1QfBg7-00080B-8P
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Jul 2011 16:05:11 +0200
Received: from thing2.microtoolsinc.com
	(adsl-76-255-12-150.dsl.mrdnct.sbcglobal.net [76.255.12.150])
	(authenticated bits=0)
	by rs69.luxsci.com (8.13.8/8.13.8) with ESMTP id p68E1BHM003754
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Fri, 8 Jul 2011 09:01:17 -0500
From: "George C. Huntington III" <gchiii@mtiemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Jul 2011 10:00:59 -0400
Message-Id: <1310133659-22568-1-git-send-email-gchiii@mtiemail.com>
X-Mailer: git-send-email 1.7.4.1
Cc: "George C. Huntington III" <gchiii@mtiemail.com>
Subject: [PATCH] make the javac wrapper script pass back the return code
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Jul 2011 14:05:11 -0000

this will keep things from failing silently, while
preserving the "try 5 times feature"

Signed-off-by: George C. Huntington III <gchiii@mtiemail.com>
---
 recipes/ecj/ecj-bootstrap-native.bb |    2 +-
 recipes/ecj/files/ecj.in            |    4 ++++
 2 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/recipes/ecj/ecj-bootstrap-native.bb b/recipes/ecj/ecj-bootstrap-native.bb
index a11ba74..72571bf 100644
--- a/recipes/ecj/ecj-bootstrap-native.bb
+++ b/recipes/ecj/ecj-bootstrap-native.bb
@@ -17,7 +17,7 @@ SRC_URI = "file://ecj.in"
 
 S = "${WORKDIR}"
 
-PR = "r4"
+PR = "r5"
 
 JAR = "ecj-bootstrap.jar"
 
diff --git a/recipes/ecj/files/ecj.in b/recipes/ecj/files/ecj.in
index 0fd4a65..66f4851 100755
--- a/recipes/ecj/files/ecj.in
+++ b/recipes/ecj/files/ecj.in
@@ -1,13 +1,17 @@
 ARGS=${1+"$@"}
 COUNT=5
 END=0
+RETURNCODE=0
 
 while test "${COUNT}" -gt "${END}"
 do
  ${RUNTIME} -Xmx1024m -cp ${ECJ_JAR} org.eclipse.jdt.internal.compiler.batch.Main ${ARGS}
+ RETURNCODE=${?}
  if test "${?}" -eq "${END}"
  then
     break
  fi
  COUNT=$(($COUNT-1))
 done
+
+exit ${RETURNCODE}
-- 
1.7.4.1



