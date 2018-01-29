Return-Path: <peter.kjellerstedt@axis.com>
X-Greylist: delayed 491 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 29 Jan 2018 18:54:27 UTC
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id C136B786A2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Jan 2018 18:54:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 5A402184A7;
	Mon, 29 Jan 2018 19:46:17 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 8SXp1LEmEcED; Mon, 29 Jan 2018 19:46:16 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id B0F15184A0;
	Mon, 29 Jan 2018 19:46:16 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9E5631A05E;
	Mon, 29 Jan 2018 19:46:16 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 939F01A07F;
	Mon, 29 Jan 2018 19:46:16 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Mon, 29 Jan 2018 19:46:16 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 8807D31B8;
	Mon, 29 Jan 2018 19:46:16 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id w0TIkFYh025264;
	Mon, 29 Jan 2018 19:46:15 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id w0TIkFwX025263;
	Mon, 29 Jan 2018 19:46:15 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-devel@lists.openembedded.org,
	Scott Rifenbark <srifenbark@gmail.com>
Date: Mon, 29 Jan 2018 19:45:47 +0100
Message-Id: <20180129184547.25199-1-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [PATCH] ref-manual: Document the task feature of BUILDHISTORY_FEATURES
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
X-List-Received-Date: Mon, 29 Jan 2018 18:54:28 -0000

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 documentation/ref-manual/ref-variables.xml | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/documentation/ref-manual/ref-variables.xml b/documentation/ref-manual/ref-variables.xml
index 521eaeaed2..70e5e3428b 100644
--- a/documentation/ref-manual/ref-variables.xml
+++ b/documentation/ref-manual/ref-variables.xml
@@ -1927,8 +1927,8 @@
                 </para>
 
                 <para>
-                    You can specify three features in the form of a
-                    space-separated list:
+                    You can specify features in the form of a space-separated
+                    list:
                     <itemizedlist>
                         <listitem><para><emphasis>image:</emphasis>
                             Analysis of the contents of images, which
@@ -1942,12 +1942,17 @@
                             Analysis of the contents of the software
                             development kit (SDK).
                             </para></listitem>
+                        <listitem><para><emphasis>task:</emphasis>
+                            Save output file signatures for sstate tasks.  This
+                            saves a file per task listing the SHA-256 checksums
+                            for each file staged, i.e., the output of the task.
+                            </para></listitem>
                     </itemizedlist>
                 </para>
 
                 <para>
                     By default, the <filename>buildhistory</filename> class
-                    enables all three features:
+                    enables the following features:
                     <literallayout class='monospaced'>
      BUILDHISTORY_FEATURES ?= "image package sdk"
                     </literallayout>
-- 
2.12.0


