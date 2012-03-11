Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ajlennon@gmail.com>) id 1S6gr9-0003kT-7T
	for openembedded-devel@lists.openembedded.org;
	Sun, 11 Mar 2012 12:22:31 +0100
Received: by wibhj13 with SMTP id hj13so2026692wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Mar 2012 04:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=FPob1Q7VFCiIed9cgDkgpy7E6XEGJC/jlxn8PWT6mag=;
	b=rpGZpGG8xEyC3+LC994pFITCAGrlSmS4vQIlu6ypxkj2tduzRshwDsFN7hxIQtrnMj
	nVDL7XQPjsgp5j0YsFNH0A+i6GxIDaFBu3mAtVDc5W5fAzID8tVKPkiU27tSlAQfsxGd
	qF+RJoiaWgLIrcOF7hdcE3ucxYgsg55xrZl3SwzXG8LisgEGOQ4AZ+/Fkveclt96bUW4
	AZ/jBdvEdONoPTslxIHvbH67mTTzZJK8WvuGJ1IGaunFM/POx7O1Af0BVwUgFucep9S/
	s5wWXDSnoEi+sRB/dWaF4jqPB3LfcpsjIKeVczpv6ogOwcPagG4UVewbubNRTr0fR/Fi
	q4fQ==
Received: by 10.180.107.162 with SMTP id hd2mr18879755wib.8.1331464429425;
	Sun, 11 Mar 2012 04:13:49 -0700 (PDT)
Received: from localhost.localdomain
	(cpc9-live20-0-0-cust612.know.cable.virginmedia.com. [82.42.142.101])
	by mx.google.com with ESMTPS id n8sm40731070wix.10.2012.03.11.04.13.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 11 Mar 2012 04:13:48 -0700 (PDT)
Sender: Alex Lennon <ajlennon@gmail.com>
From: Alex J Lennon <ajlennon@dynamicdevices.co.uk>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 11 Mar 2012 11:13:38 +0000
Message-Id: <1331464418-6339-1-git-send-email-ajlennon@dynamicdevices.co.uk>
X-Mailer: git-send-email 1.7.5.4
Cc: Alex J Lennon <ajlennon@gmail.com>
Subject: [PATCH] Replaced libpng 1.2.47 recipe with 1.2.48 as source tarball no longer available from SRC_URI
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
X-List-Received-Date: Sun, 11 Mar 2012 11:22:31 -0000

From: Alex J Lennon <ajlennon@gmail.com>

Signed-off-by: Alex J Lennon <ajlennon@gmail.com>
---
 recipes/libpng/libpng_1.2.47.bb |    6 ------
 recipes/libpng/libpng_1.2.48.bb |    6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 recipes/libpng/libpng_1.2.47.bb
 create mode 100644 recipes/libpng/libpng_1.2.48.bb

diff --git a/recipes/libpng/libpng_1.2.47.bb b/recipes/libpng/libpng_1.2.47.bb
deleted file mode 100644
index 8d594f1..0000000
--- a/recipes/libpng/libpng_1.2.47.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require libpng.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI[libpng.md5sum] = "4389dab9fcd2f9d57ac14701b9115f59"
-SRC_URI[libpng.sha256sum] = "f0bfa4a33b419a61cf97935cd6a15f5cbda84d116c72fa4b3489b0605a00a7a2"
diff --git a/recipes/libpng/libpng_1.2.48.bb b/recipes/libpng/libpng_1.2.48.bb
new file mode 100644
index 0000000..50a3c03
--- /dev/null
+++ b/recipes/libpng/libpng_1.2.48.bb
@@ -0,0 +1,6 @@
+require libpng.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI[libpng.md5sum] = "7612af5660cd4b5e8c433ce53bea01a7"
+SRC_URI[libpng.sha256sum] = "f6db51aff81b6920203678b29e8c68a5e3703cf5b39ae5e9e56370d17f31b1c4"
-- 
1.7.5.4



