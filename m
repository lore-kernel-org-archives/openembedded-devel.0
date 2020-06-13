Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web12.17845.1592086330464127278
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Jun 2020 15:12:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=kr21cT6h;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id 0BF906020E;
	Sun, 14 Jun 2020 00:12:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1592086327;
	bh=/6hi5yynL5AGTqVT5Pk8xzDAAgR+zkB1ZwPPsUvvIIY=;
	h=From:To:Cc:Subject:Date:From;
	b=kr21cT6hPRy9SxPsMflBiK1mlJDvcJcZn5EaUUh2YqhhZLxMVc8bWDnOuO8A3l5QP
	 AZFffDG3jJIMlwoZxEz1qUgXe7QWSlBdFDj5w6qj+Fs0neYPrHjCsIotmdzKOEln6p
	 eTFUeGmJqlW+lO3IpVNnlD3WZdEltN05lyxujuV6QBUFEvT0YB1edvUHIzdCXHIJHN
	 YRgDEUKCFjsFdIDWTd6V8wUv8I6GxWDsWXdqHvTrD+7VeXGVTOB6bhwMhZ3O9QIhqJ
	 L6aqw9vh1FSFvCsxzQBPdWmJmhM0jy6YKMOxCRKa83H7xB3OtH/Xca9ob5yW0qoJ0Z
	 R0EH9VUZZh3Vw==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-filesystems][PATCH] fuse3: upgrade 3.9.1 -> 3.9.2
Date: Sun, 14 Jun 2020 00:12:04 +0200
Message-Id: <1592086324-25888-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

See changelog https://github.com/libfuse/libfuse/releases/tag/fuse-3.9.2

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 .../recipes-support/fuse/{fuse3_3.9.1.bb => fuse3_3.9.2.bb}            | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-filesystems/recipes-support/fuse/{fuse3_3.9.1.bb => fuse3_3.9.2.bb} (91%)

diff --git a/meta-filesystems/recipes-support/fuse/fuse3_3.9.1.bb b/meta-filesystems/recipes-support/fuse/fuse3_3.9.2.bb
similarity index 91%
rename from meta-filesystems/recipes-support/fuse/fuse3_3.9.1.bb
rename to meta-filesystems/recipes-support/fuse/fuse3_3.9.2.bb
index 1830fa1..24b17fc 100644
--- a/meta-filesystems/recipes-support/fuse/fuse3_3.9.1.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse3_3.9.2.bb
@@ -13,8 +13,7 @@ LIC_FILES_CHKSUM = "file://GPL2.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SRC_URI = "https://github.com/libfuse/libfuse/releases/download/fuse-${PV}/fuse-${PV}.tar.xz \
 "
-SRC_URI[md5sum] = "26d6b450276fb04e20bf91d83b9423f0"
-SRC_URI[sha256sum] = "1bafcfd6c66ba35b7b0beb822532a9106eb8409ad6cde988888fde85f89be645"
+SRC_URI[sha256sum] = "6999b6d48e7c0a79628fa901f6e66def3513cab4ffdd8097821e7dc3cdeae08a"
 
 S = "${WORKDIR}/fuse-${PV}"
 
-- 
2.7.4

