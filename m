Return-Path: <prvs=659569f5e=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 5E39B767D4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Aug 2015 15:05:00 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: ApoEAIZfy1WsEApK/2dsb2JhbABdhFgGxVwCghMBAQEBAQGBC4QkAQEEeRAYOVcGDgWIM9BJAQEBAQEBBAEBAQEekFwHF4QVBZUTlWqFXIs3gjQcgVVvgUiBBAEBAQ
X-IPAS-Result: ApoEAIZfy1WsEApK/2dsb2JhbABdhFgGxVwCghMBAQEBAQGBC4QkAQEEeRAYOVcGDgWIM9BJAQEBAQEBBAEBAQEekFwHF4QVBZUTlWqFXIs3gjQcgVVvgUiBBAEBAQ
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 12 Aug 2015 17:03:55 +0200
Message-ID: <1439391837-10238-4-git-send-email-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1439391837-10238-1-git-send-email-richard.leitner@skidata.com>
References: <1439391837-10238-1-git-send-email-richard.leitner@skidata.com>
MIME-Version: 1.0
X-Originating-IP: [172.16.60.30]
Cc: otavio.salvador@ossystems.com.br
Subject: [PATCH 3/5] openjdk-7-common: fix FILES_openjdk-7-jre_append
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
X-List-Received-Date: Wed, 12 Aug 2015 15:05:00 -0000
Content-Type: text/plain

Use the PN variable instead of the hardcoded "openjdk-7-jre" string.
Furthermore fix the indentation of its content.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 recipes-core/openjdk/openjdk-7-common.inc | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/recipes-core/openjdk/openjdk-7-common.inc b/recipes-core/openjdk/openjdk-7-common.inc
index 5f293df..dafc877 100644
--- a/recipes-core/openjdk/openjdk-7-common.inc
+++ b/recipes-core/openjdk/openjdk-7-common.inc
@@ -283,18 +283,18 @@ FILES_${JDKPN}-common = "${JDK_HOME}/jre/ASSEMBLY_EXCEPTION \
                           ${JDK_HOME}/jre/lib \
                          "
 
-FILES_openjdk-7-jre_append = " \
+FILES_${PN}_append = " \
 	${JDK_HOME}/jre/bin/keytool \
-        ${JDK_HOME}/jre/bin/orbd \
+	${JDK_HOME}/jre/bin/orbd \
 	${JDK_HOME}/jre/bin/pack200 \
-        ${JDK_HOME}/jre/bin/rmid \
+	${JDK_HOME}/jre/bin/rmid \
 	${JDK_HOME}/jre/bin/rmiregistry \
-        ${JDK_HOME}/jre/bin/servertool \
+	${JDK_HOME}/jre/bin/servertool \
 	${JDK_HOME}/jre/bin/tnameserv \
-        ${JDK_HOME}/jre/bin/unpack200 \
+	${JDK_HOME}/jre/bin/unpack200 \
 	${JDK_HOME}/jre/bin/policytool \
-        ${JDK_HOME}/jre/bin/javaws \
-       "
+	${JDK_HOME}/jre/bin/javaws \
+	"
 
 RDEPENDS_${JDKPN}-common = "librhino-java"
 
-- 
2.1.4


