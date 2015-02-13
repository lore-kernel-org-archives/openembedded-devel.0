Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A07EE65CF5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2015 14:44:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1DEioli025007; Fri, 13 Feb 2015 14:44:50 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id eJkDRADmqNDP; Fri, 13 Feb 2015 14:44:50 +0000 (GMT)
Received: from ted (5751f4a1.skybroadband.com [87.81.244.161])
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1DEimd0024975
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 13 Feb 2015 14:44:50 GMT
Received: from richard by ted with local (Exim 4.84_RC1)
	(envelope-from <richard@dan.rpsys.net>)
	id 1YMHU3-00026q-PG; Fri, 13 Feb 2015 14:44:43 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Feb 2015 14:44:28 +0000
Message-Id: <1423838674-8066-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.1.0
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 1/7] kexec-tools: 2.0.8 -> 2.0.9
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
X-List-Received-Date: Fri, 13 Feb 2015 14:44:54 -0000

Adjust the patch since it was partially applied upstream (in
a different form) but not completely since the ppc specific
part was not applied.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...kexec-tools-Refine-kdump-device_tree-sort.patch | 34 ----------------------
 .../{kexec-tools_2.0.8.bb => kexec-tools_2.0.9.bb} |  4 +--
 2 files changed, 2 insertions(+), 36 deletions(-)
 rename meta/recipes-kernel/kexec/{kexec-tools_2.0.8.bb => kexec-tools_2.0.9.bb} (76%)

diff --git a/meta/recipes-kernel/kexec/kexec-tools/kexec-tools-Refine-kdump-device_tree-sort.patch b/meta/recipes-kernel/kexec/kexec-tools/kexec-tools-Refine-kdump-device_tree-sort.patch
index ab1fe96..8bb4fc4 100644
--- a/meta/recipes-kernel/kexec/kexec-tools/kexec-tools-Refine-kdump-device_tree-sort.patch
+++ b/meta/recipes-kernel/kexec/kexec-tools/kexec-tools-Refine-kdump-device_tree-sort.patch
@@ -46,37 +46,3 @@ index 4121c7d..cc04b04 100644
  
  	return strcmp(str1, str2);
  }
-diff --git a/kexec/fs2dt.c b/kexec/fs2dt.c
-index 5e6b98d..1c0345b 100644
---- a/kexec/fs2dt.c
-+++ b/kexec/fs2dt.c
-@@ -475,6 +475,9 @@ static int comparefunc(const struct dirent **dentry1,
- {
- 	char *str1 = (*(struct dirent **)dentry1)->d_name;
- 	char *str2 = (*(struct dirent **)dentry2)->d_name;
-+	char* ptr1 = strchr(str1, '@');
-+	char* ptr2 = strchr(str2, '@');
-+	int len1, len2;
- 
- 	/*
- 	 * strcmp scans from left to right and fails to idetify for some
-@@ -482,9 +485,13 @@ static int comparefunc(const struct dirent **dentry1,
- 	 * Therefore, we get the wrong sorted order like memory@10000000 and
- 	 * memory@f000000.
- 	 */
--	if (strchr(str1, '@') && strchr(str2, '@') &&
--		(strlen(str1) > strlen(str2)))
--		return 1;
-+	if (ptr1 && ptr2) {
-+		len1 = ptr1 - str1;
-+		len2 = ptr2 - str2;
-+		if (!strncmp(str1, str2, len1 >len2 ? len1: len2) &&
-+					(strlen(str1) > strlen(str2)))
-+				return 1;
-+	}
- 
- 	return strcmp(str1, str2);
- }
--- 
-1.7.9.5
-
diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.8.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.9.bb
similarity index 76%
rename from meta/recipes-kernel/kexec/kexec-tools_2.0.8.bb
rename to meta/recipes-kernel/kexec/kexec-tools_2.0.9.bb
index c478732..c0c2727 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.8.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.9.bb
@@ -6,8 +6,8 @@ SRC_URI += "file://kexec-tools-Refine-kdump-device_tree-sort.patch \
             file://kexec-aarch64.patch \
            "
 
-SRC_URI[md5sum] = "45bd2bc676ae202579e4c185563126af"
-SRC_URI[sha256sum] = "95083c707577154a2241c5af0985f1eb3412d1ba208ef91813e9158b0a901179"
+SRC_URI[md5sum] = "4ecb7ab7ad9eb6ce413899bdb07a8426"
+SRC_URI[sha256sum] = "c2c6d204fe0911ebd304c40100163237feca4c5a854a2cca382ee36916a573d8"
 
 PACKAGES =+ "kexec kdump vmcore-dmesg"
 
-- 
2.1.0


