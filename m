Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1S6izD-0005sF-D6
	for openembedded-devel@lists.openembedded.org;
	Sun, 11 Mar 2012 14:38:59 +0100
Received: by eaae1 with SMTP id e1so613055eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Mar 2012 06:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=Mm+5joSywaEGBUbZlcLxTQC3bHj4r+HQ3vHDLNlBWQQ=;
	b=eSoihqoKwYHPw8zVL+I4p8OzTBeMBPqna4mNDM6JElf7q6C3Smof+6FbbKG2VMcoZU
	x8Q8DtSAb6jAsYG/l6FS2yvxOV0001sJJIwVDx1scjIdGuLtYURE5W7LNywjYxV4TIXi
	r95eEd7jSG6mxIVruJfTWZP81O5SqO6p4NJKcBK56R0/KmkRLNM6yfoVqRIXxRyIarS5
	tOXCy1Wpyk7Ik69gtXUIikQQQJ9txcH2TITtswTPgLyDp0mPGp0rNPOnL3gVWs2lmhyB
	vjhQ8j2zbh7dBMLg70kL3/gqJTJBaFlXYnTwBhgZnj0GP8GD2tka49OYd6qJBlv4GWbk
	w12A==
Received: by 10.14.22.16 with SMTP id s16mr1338056ees.2.1331472617593;
	Sun, 11 Mar 2012 06:30:17 -0700 (PDT)
Received: from localhost.localdomain (D4B268BA.static.ziggozakelijk.nl.
	[212.178.104.186])
	by mx.google.com with ESMTPS id r44sm1802725eef.2.2012.03.11.06.30.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 11 Mar 2012 06:30:17 -0700 (PDT)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 11 Mar 2012 14:32:12 +0100
Message-Id: <1331472732-28668-2-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1331472732-28668-1-git-send-email-fransmeulenbroeks@gmail.com>
References: <1331472732-28668-1-git-send-email-fransmeulenbroeks@gmail.com>
Subject: [2011.03-maintenance] [PATCH 2/2] libpng: moved from 1.2.44 to 1.2.48
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
X-List-Received-Date: Sun, 11 Mar 2012 13:38:59 -0000

upstream does not retain old versions so moved to the latest
version to make things buildable again

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---
 recipes/libpng/libpng_1.2.44.bb |    8 --------
 recipes/libpng/libpng_1.2.48.bb |    9 +++++++++
 2 files changed, 9 insertions(+), 8 deletions(-)
 delete mode 100644 recipes/libpng/libpng_1.2.44.bb
 create mode 100644 recipes/libpng/libpng_1.2.48.bb

diff --git a/recipes/libpng/libpng_1.2.44.bb b/recipes/libpng/libpng_1.2.44.bb
deleted file mode 100644
index 4ba7b20..0000000
--- a/recipes/libpng/libpng_1.2.44.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require libpng.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI += "file://makefile_fix.patch"
-
-SRC_URI[libpng.md5sum] = "e3ac7879d62ad166a6f0c7441390d12b"
-SRC_URI[libpng.sha256sum] = "b9ab20f1c2c3bf6c4448fd9bd8a4a8905b918114d5fada56c97bb758a17b7215"
diff --git a/recipes/libpng/libpng_1.2.48.bb b/recipes/libpng/libpng_1.2.48.bb
new file mode 100644
index 0000000..7bd3ec3
--- /dev/null
+++ b/recipes/libpng/libpng_1.2.48.bb
@@ -0,0 +1,9 @@
+require libpng.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://makefile_fix.patch"
+
+SRC_URI[libpng.md5sum] = "7612af5660cd4b5e8c433ce53bea01a7"
+SRC_URI[libpng.sha256sum] = "f6db51aff81b6920203678b29e8c68a5e3703cf5b39ae5e9e56370d17f31b1c4"
+
-- 
1.7.0.4



