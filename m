Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vzapolskiy@gmail.com>) id 1OFpGY-0005M8-OD
	for openembedded-devel@lists.openembedded.org;
	Sat, 22 May 2010 16:01:27 +0200
Received: by bwz1 with SMTP id 1so330265bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 May 2010 06:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:from:to:cc:subject
	:date:message-id:x-mailer;
	bh=oQwKOU7dWwEVczSfE4loMxefLVkB8U1VwS4+Q7SGswk=;
	b=Mectjoa8OcPhsPh+yTYF0gSsqggQddwUizTGzDE7wE3W4k42EOQeI42LqWPBw8neGZ
	hHaxcw0JWczHDVx9ZlimF8vXuigpknpoJTMbriDIIqIvYYq2mUBtgviUzv4asmdqj9V+
	3FfpCUmEXBtUnBXD6tgAANknm2enaC0xLvJaQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	b=h73DvzdeRBNGYGHrG+NZnVE56/4lRFUa1Y6L6WfT60snWjBPtSfxNPu+0XPCMwNeu4
	xhIBsBk00DEnztQpY9OGqR5MjgHv/sjE48po6dUTzxMxYhC7jDkqK8hdNlJV9s3mVdYz
	e11UAPhxIMkv6KuicuERm0gERiT4NgyLu3D8w=
Received: by 10.204.34.201 with SMTP id m9mr879098bkd.127.1274536644843;
	Sat, 22 May 2010 06:57:24 -0700 (PDT)
Received: from localhost.localdomain ([94.188.57.8])
	by mx.google.com with ESMTPS id d5sm9510784bkd.19.2010.05.22.06.57.23
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 22 May 2010 06:57:24 -0700 (PDT)
Sender: Vladimir Zapolskiy <animist@gmail.com>
From: Vladimir Zapolskiy <vzapolskiy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 22 May 2010 17:52:08 +0400
Message-Id: <1274536328-31845-1-git-send-email-vzapolskiy@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: vzapolskiy@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Vladimir Zapolskiy <vzapolskiy@gmail.com>
Subject: [PATCH] e2fsprogs: disable tls build with uclibc toolchain
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
X-List-Received-Date: Sat, 22 May 2010 14:01:27 -0000

This patch removes dependency on oabi toolchain, because eabi uclibc
toolchain anyway does not have tls support.

Signed-off-by: Vladimir Zapolskiy <vzapolskiy@gmail.com>
Cc: woglinde <heinold@inf.fu-berlin.de>
---
 recipes/e2fsprogs/e2fsprogs.inc |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/recipes/e2fsprogs/e2fsprogs.inc b/recipes/e2fsprogs/e2fsprogs.inc
index 119efb0..0eeedcd 100644
--- a/recipes/e2fsprogs/e2fsprogs.inc
+++ b/recipes/e2fsprogs/e2fsprogs.inc
@@ -14,8 +14,7 @@ INC_PR = "r23"
 inherit autotools
 
 #if uclibc ntpl is merged into trunk we can enable tls for armv4 again
-EXTRA_OECONF = "${@['','--disable-tls'][bb.data.getVar('ARM_ABI', d, 1) == 'oabi' and \
-		bb.data.getVar('TARGET_OS', d, 1).find('uclibc') >= 0 ]} \
+EXTRA_OECONF = "${@['','--disable-tls'][bb.data.getVar('TARGET_OS', d, 1).find('uclibc') >= 0 ]} \
 		--enable-elf-shlibs \
 		--enable-dynamic-e2fsck --disable-nls --sbindir=${base_sbindir} \
 		--disable-libuuid --disable-libblkid --disable-fsck"
-- 
1.7.1



