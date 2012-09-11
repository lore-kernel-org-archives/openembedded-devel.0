Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1TBYSu-0004Rg-M5
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Sep 2012 23:57:52 +0200
Received: by wibhn17 with SMTP id hn17so1049756wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Sep 2012 14:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=9reaDGAnntUkpGRpa4chWrwZXLUuqw03NI6j/ZsvvZY=;
	b=AdDWpMXvHQGcOu1gZESB/6r7iU7wOZCmWg9FHoJ/Ayz7biXtc0sLcFI+CwXvR+/I51
	VbxGblgUbOSuKLVQJr5zpe42FCtmdLluLGZkzX3Yge8fXMVZTlvTTaVwe2c1KnMYU9pW
	mLak+A73FhoOgQyia60uxdqQ5n/A+bhGxjrRT8noB44jW2JpNXhoqdx63lHJqm5f5GZ8
	4gmAoHncZ/OgrLzRRK7CTPfYofeueAAc1nkJ7fPNzjvEtxRWW8F4mSIJZ2GkOnRIkQNT
	3+vcZTgZnMgULc4S9Tt4u7HXVba+iJ+3Yhvf23c5uAsDgZ9avwWWLJ2Fd8B6EpUxbggZ
	FU6w==
Received: by 10.180.106.130 with SMTP id gu2mr27815887wib.20.1347399921366;
	Tue, 11 Sep 2012 14:45:21 -0700 (PDT)
Received: from mizar.localdomain
	(host28-12-dynamic.60-82-r.retail.telecomitalia.it. [82.60.12.28])
	by mx.google.com with ESMTPS id k20sm4509658wiv.11.2012.09.11.14.45.19
	(version=SSLv3 cipher=OTHER); Tue, 11 Sep 2012 14:45:19 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Sep 2012 23:45:14 +0200
Message-Id: <1347399914-29571-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [meta-oe][meta-initramfs][PATCH] kexec-tools.klibc_2.0.2: fix checksums
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
X-List-Received-Date: Tue, 11 Sep 2012 21:57:52 -0000

* those are the SRC_URI checksums since 15-Jan-2012 22:10
* re-uploaded after kernel.org outage

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../kexec/kexec-tools-klibc_2.0.2.bb               |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb
index 9c35330..9c804be 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb
@@ -1,7 +1,7 @@
 # the binaries are statically linked against klibc
 require recipes-kernel/kexec/kexec-tools.inc
-SRC_URI[md5sum] = "bc401cf3262b25ff7c9a51fc76c8ab91"
-SRC_URI[sha256sum] = "549ab65c18a2229b6bf21b6875ca6bbe0e579bca08c3543ce6aaf8287a0b4188"
+SRC_URI[md5sum] = "92eff93b097475b7767f8c98df84408a"
+SRC_URI[sha256sum] = "09e180ff36dee087182cdc939ba6c6917b6adbb5fc12d589f31fd3659b6471f2"
 
 inherit klibc
 
-- 
1.7.8.6



