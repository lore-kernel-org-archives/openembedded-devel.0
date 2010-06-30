Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <joaohf@gmail.com>) id 1OTlTP-0002HL-5z
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jun 2010 02:48:23 +0200
Received: by gwj18 with SMTP id 18so145025gwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jun 2010 17:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=+OPv3Nj8ZAu8Yc3B9EKxndLR3hoYipOovgRVua9RI7M=;
	b=rt+pjYJj0RIYbIAGkTjniF09AIdDuBncQfZ49hYAvubdrkKSQB2FGkCMjUGkR7Zuov
	wGCbQij1wPsZ3yrAIhwCOV34UUo21NrQwbXX2Ckxej0CarU5f7uHbYAZafXGb4kdHIAo
	9MXmdmfyEb37FR2WLiYzl6x9kq4WWhxZ/Eoe4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=VIdcl98cxzGv797G9luSal/8WCwGSzIm5cuwZejj5jnBdxg4xi6S5ZoBlpNtcyV2Hq
	P/eiW7xFP7kpWM2OVxwdknp/u62e5PpaGz+YM6ADT4MHdO4CIRIitoJh28cN1WnyTBq9
	y3L7/3gXdfeb5QvGCudy3t323Kuy/guX3fyGY=
Received: by 10.101.135.35 with SMTP id m35mr9543891ann.51.1277858615548;
	Tue, 29 Jun 2010 17:43:35 -0700 (PDT)
Received: from localhost.localdomain ([201.53.204.31])
	by mx.google.com with ESMTPS id b11sm10624359ana.6.2010.06.29.17.43.33
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 29 Jun 2010 17:43:34 -0700 (PDT)
From: "Joao H. Freitas" <joaohf@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Jun 2010 21:43:18 -0300
Message-Id: <1277858599-27400-2-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.7.0.2
In-Reply-To: <1277858599-27400-1-git-send-email-joaohf@gmail.com>
References: <1277858599-27400-1-git-send-email-joaohf@gmail.com>
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: joaohf@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/2] add cmake 2.8.1recipes/cmake/cmake-native_2.8.1.bb
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
X-List-Received-Date: Wed, 30 Jun 2010 00:48:24 -0000

---
 recipes/cmake/cmake-sdk_2.8.1.bb |    5 -----
 recipes/cmake/cmake.inc          |    2 ++
 recipes/cmake/cmake_2.8.1.bb     |   11 +++++++++++
 3 files changed, 13 insertions(+), 5 deletions(-)
 delete mode 100644 recipes/cmake/cmake-sdk_2.8.1.bb
 create mode 100644 recipes/cmake/cmake_2.8.1.bb

diff --git a/recipes/cmake/cmake-sdk_2.8.1.bb b/recipes/cmake/cmake-sdk_2.8.1.bb
deleted file mode 100644
index 86356f7..0000000
--- a/recipes/cmake/cmake-sdk_2.8.1.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-inherit sdk
-require cmake.inc
-
-SRC_URI[md5sum] = "feadc2e5ebbfed0efc90178583503725"
-SRC_URI[sha256sum] = "7eae74ab7673974a68e395c211854d318f0af2d320590a670339ee8ee9422242"
diff --git a/recipes/cmake/cmake.inc b/recipes/cmake/cmake.inc
index 631d846..5601ddb 100644
--- a/recipes/cmake/cmake.inc
+++ b/recipes/cmake/cmake.inc
@@ -10,6 +10,8 @@ PR = "r3"
 CMAKE_MAJOR_VERSION = "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).split('.')[1]}"
 SRC_URI = "http://www.cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz"
 
+BBCLASSEXTEND = "native sdk"
+
 inherit autotools
 
 S = "${WORKDIR}/cmake-${PV}"
diff --git a/recipes/cmake/cmake_2.8.1.bb b/recipes/cmake/cmake_2.8.1.bb
new file mode 100644
index 0000000..845ea7c
--- /dev/null
+++ b/recipes/cmake/cmake_2.8.1.bb
@@ -0,0 +1,11 @@
+require cmake.inc
+
+#inherit cmake
+
+do_configure_append() {
+	sed -i -e 's,HAVE_GLIBC_STRERROR_R__TRYRUN_OUTPUT-ADVANCED:INTERNAL=1,HAVE_GLIBC_STRERROR_R__TRYRUN_OUTPUT-ADVANCED:INTERNAL=0,' CMakeCache.txt
+}
+
+
+SRC_URI[md5sum] = "feadc2e5ebbfed0efc90178583503725"
+SRC_URI[sha256sum] = "7eae74ab7673974a68e395c211854d318f0af2d320590a670339ee8ee9422242"
-- 
1.7.0.2



