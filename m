Received: from ey-out-1920.google.com ([74.125.78.147])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1NHPsJ-0000cG-GV
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Dec 2009 23:46:46 +0100
Received: by ey-out-1920.google.com with SMTP id 5so985082eyb.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Dec 2009 14:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=bsGnbRZQ4kTQOicrkpNb7om9BygakcNALnFAsEAPAWA=;
	b=WNqsXoxdcq/2NOALP6AmTyTUpvfemD/H2x0E2Z6fVr0SAwObHK1HYCxsA4rBvN4kLn
	trdKWTtc78049I4IPhAAUPWxhuXYCtreydKnIRrUdRjLPOyAq1BdglF6///I84daOtb/
	aZwqa4Vo9+0Byv7R7lskJh/W4RC+ldaqToxdE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=wolWbmcxkNcVu3EWg1fW0Pw3dOoDBbslSCWar6Jm2IWwBPHl8ROUr75L1qoWGLAGv/
	+bpULGMVe/UI1eZQXkFy7fw/h3hnQFGecvzdAmb/dkTgdCAgMZwsE6reyvYaJjE+ojyP
	E7GGn1Kd1aFpeE/BT9BedZe65ikv22UjOj6RU=
Received: by 10.213.104.78 with SMTP id n14mr6300290ebo.22.1260139506561;
	Sun, 06 Dec 2009 14:45:06 -0800 (PST)
Received: from localhost.localdomain (82-171-51-231.ip.telfort.nl
	[82.171.51.231])
	by mx.google.com with ESMTPS id 15sm3113864ewy.12.2009.12.06.14.45.05
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 06 Dec 2009 14:45:06 -0800 (PST)
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Dec 2009 23:44:42 +0100
Message-Id: <1260139496-21442-7-git-send-email-leon@sidebranch.com>
X-Mailer: git-send-email 1.6.0.4
In-Reply-To: <1260139496-21442-6-git-send-email-leon@sidebranch.com>
References: <1260139496-21442-1-git-send-email-leon@sidebranch.com>
	<1260139496-21442-2-git-send-email-leon@sidebranch.com>
	<1260139496-21442-3-git-send-email-leon@sidebranch.com>
	<1260139496-21442-4-git-send-email-leon@sidebranch.com>
	<1260139496-21442-5-git-send-email-leon@sidebranch.com>
	<1260139496-21442-6-git-send-email-leon@sidebranch.com>
X-SA-Exim-Connect-IP: 74.125.78.147
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Leon Woestenberg <leon@sidebranch.com>
Subject: [PATCH] elf2flt-cross_nios2-git.bb: elf2flt-cross for nios2.
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
X-List-Received-Date: Sun, 06 Dec 2009 22:46:46 -0000

This is from a non-upstream GIT'd fork of elf2flt, community
maintained.

Tested-by: Walter Goossens <walter.goossens@axon.tv>
Tested-by: Leon Woestenberg <leon@sidebranch.com>
Signed-off-by: Leon Woestenberg <leon@sidebranch.com>
---
 recipes/elf2flt/elf2flt-cross_nios2-git.bb |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)
 create mode 100644 recipes/elf2flt/elf2flt-cross_nios2-git.bb

diff --git a/recipes/elf2flt/elf2flt-cross_nios2-git.bb b/recipes/elf2flt/elf2flt-cross_nios2-git.bb
new file mode 100644
index 0000000..a7925cd
--- /dev/null
+++ b/recipes/elf2flt/elf2flt-cross_nios2-git.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "Elf2flt is a wrapper around the linker for uclinux platforms"
+PV = "0.1"
+DEPENDS = "binutils-cross zlib-native"
+
+inherit autotools cross
+
+SRC_URI = "git://sopc.et.ntust.edu.tw/git/elf2flt.git;protocol=git;branch=nios2;tag=7f2f6c6b107fb18b6b6d3692b273a00315948da4"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OECONF = " --with-libiberty=${CROSS_DIR}/lib/libiberty.a \
+                 --with-libbfd=${CROSS_DIR}/${HOST_SYS}/${TARGET_SYS}/lib/libbfd.a \
+                 --with-bfd-include-dir=${CROSS_DIR}/${HOST_SYS}/${TARGET_SYS}/include \
+                 --with-binutils-include-dir=${CROSS_DIR}/include \
+                 --disable-emit-relocs \
+               "
+
-- 
1.6.0.4



