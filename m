Return-Path: <max.oss.09@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 574A471353
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jan 2015 15:27:28 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id em10so6996098wid.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jan 2015 07:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=i1F3pRRp2o2a8BqKv1C6JfNEe4qqli0eRVcjsNx1VQ4=;
	b=RZM3s3tCWD9Uh16ywM4ux5Ud9tUk0hCer4H847JacogAdXyE9MzxGpf8sqzGi5347P
	WuWAmwChr7lCc/Sp90V6Zbb+U2UpUaPFkajUNXWzjdlc/F9e9LW3p6bhsKGrm/zqR3yk
	O9EI5j0z9+JTFOToUOY/wpGq8LEZ3OhAvXclp9eEuPGvwtVVKRM01X4vmhbiBLzMaaGm
	KFppehoRLvKGptZYns4iJpVuB3rVwjKQ3wxJKEy8CgXWE5JzyKqXH8GwOlpA6x/VwT47
	obTYZf7UhsIyBBz/ExtyxDdSEzZDAladb8/25tpE91QExIgrfrIaWXRjrB65MhYCFacb
	iAag==
X-Received: by 10.180.208.79 with SMTP id mc15mr10503520wic.23.1421767648126; 
	Tue, 20 Jan 2015 07:27:28 -0800 (PST)
Received: from linuxdev.toradex.int ([46.140.72.82])
	by mx.google.com with ESMTPSA id r3sm3448467wic.10.2015.01.20.07.27.26
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Jan 2015 07:27:27 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Jan 2015 16:27:10 +0100
Message-Id: <1421767630-11286-1-git-send-email-max.oss.09@gmail.com>
X-Mailer: git-send-email 1.9.3
Cc: otavio@ossystems.com.br
Subject: [meta-java][PATCH] README: improve copy/paste experiance
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
X-List-Received-Date: Tue, 20 Jan 2015 15:27:32 -0000

The section with stuff to be put in local.conf/distro conf currently
can not be directly copy/pasted from the README
- adding a missing "
- putting a # before each comment
- commenting out alternatives
- fixing version string 6b27-1.12.8
- adding version 6b32-1.13.4

Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
---
 README | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/README b/README
index 623e7c4..f530702 100644
--- a/README
+++ b/README
@@ -59,19 +59,21 @@ PREFERRED_PROVIDER_virtual/java-initial = "cacao-initial"
 PREFERRED_PROVIDER_virtual/java-native = "jamvm-native"
 PREFERRED_PROVIDER_virtual/javac-native = "ecj-bootstrap-native"
 
-For openjdk6:
-PREFERRED_VERSION_openjdk-6-jre = "6b24-1.11.9"
-or
-PREFERRED_VERSION_openjdk-6-jre = "6b27-1.13.4"
+#For openjdk6:
+#PREFERRED_VERSION_openjdk-6-jre = "6b24-1.11.9"
+#or
+#PREFERRED_VERSION_openjdk-6-jre = "6b27-1.12.8"
+#or
+PREFERRED_VERSION_openjdk-6-jre = "6b32-1.13.4"
 PREFERRED_VERSION_icedtea6-native = "1.8.11"
 
-For openjdk7:
+#For openjdk7:
 PREFERRED_VERSION_openjdk-7-jre = "25b30-2.3.12"
 PREFERRED_VERSION_icedtea7-native = "2.1.3"
 
-Sometimes the following is needed:
+#Sometimes the following is needed:
 PREFERRED_PROVIDER_openjdk-6-jre = "openjdk-6-jre"
-PREFERRED_PROVIDER_openjdk-7-jre = "openjdk-7-jre
+PREFERRED_PROVIDER_openjdk-7-jre = "openjdk-7-jre"
 
 For conf/bblayers.conf you have to add
 
-- 
1.9.3


