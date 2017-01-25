Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 17D8071CB7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2017 21:43:27 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id 204so20688759pge.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2017 13:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=pSbjFbg2jKwwTxfQK0sQqT553vYDENwHqnuxV/ylUhE=;
	b=IZCp0n48jCu4eExq8vhLDX+Fm6Ac7JvIyIfe2Im1dA05sQuWkYMC6pZivZwRtv3k+C
	egjfbsxNZfBfXP1AkIlsUEbqnXbtAvWQVVjdd5h73b2dzy0HwykD+PzLU2ofviMNFNez
	up1d4IB8YZtRAlcsINKoWbUFIoUd33ZCBYx0abDMB84HWB+ubtyoLmgF6bPhOgZkyOE9
	noq7noVaO1dCo/bQe5z3+GieKGejita3HEh1tE+JVqlzyfUR+tM2RQ93+4uoV6Twg4l+
	GTY26H+0gPCG/6BGl2gpoLEgpDyYO14HiWN81aM4ozg/yurDjM2ZIVYaDVXi/ipvN1AR
	u68w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=pSbjFbg2jKwwTxfQK0sQqT553vYDENwHqnuxV/ylUhE=;
	b=CLAcf08SevHnkcoDBlcs+20On9TnBHgwLKc97lxqepmBk+DGACq8pk8M394dI+hnX+
	crWQ/m/ocXV45LwSY0ylr0qx2pWfMK76S+HdNm64YUZ06y5wT+nEtolm/YS7xjTKSmZh
	JhpHxF7LAowy9a43hlkg0tPOxFRzJ0hD64Zy9MZkhj0lEwyzeHt7tv386l445A0ZADGh
	NfBDAkl9LK3Bt6IrBtCbXbLWtesAt+edeUFSyPYKOjFBmsu1q4qZgi0e9m8hSpQ6UDJ5
	MzFuocHZ3wb1Xhi6odN7bqZTD3YX8OpqcfqQ7Gpmx0o9tcT7jK44FrNI1YQStTOmXETn
	2/PA==
X-Gm-Message-State: AIkVDXKn5XaiXlFt/EMQi5UrcUKyWN76eqcQlkWAxbLF8Isx0TsZCXJ+h8gWwXzyVZ44ag==
X-Received: by 10.98.75.16 with SMTP id y16mr49728004pfa.23.1485380608130;
	Wed, 25 Jan 2017 13:43:28 -0800 (PST)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id 199sm262211pfu.91.2017.01.25.13.43.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 25 Jan 2017 13:43:27 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Jan 2017 13:43:21 -0800
Message-Id: <1485380601-6226-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] luajit: test SITEINFO_BITS instead of maintaining a list of 32bit targets
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
X-List-Received-Date: Wed, 25 Jan 2017 21:43:28 -0000

When cross compiling, the word size of the compiler set via HOST_CC
must match the word size of the target. That's achieved by appending
"-m32" to BUILD_CC_ARCH if the target word size is known to be 32bits.

Unfortunately the current list of over-rides (powerpc, x86 and arm)
does not cover all cases (e.g. it ignores MIPS). Using SITEINFO_BITS
is a more generic solution.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb b/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb
index 964dc1d..430279f 100644
--- a/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb
+++ b/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb
@@ -11,7 +11,7 @@ SRC_URI[sha256sum] = "620fa4eb12375021bef6e4f237cbd2dd5d49e56beb414bee052c746bee
 
 S = "${WORKDIR}/LuaJIT-${PV}"
 
-inherit pkgconfig binconfig
+inherit pkgconfig binconfig siteinfo
 
 BBCLASSEXTEND = "native"
 
@@ -21,9 +21,7 @@ BBCLASSEXTEND = "native"
 # you need to install the multilib development package (e.g.
 # libc6-dev-i386 on Debian/Ubuntu) and build a 32 bit host part
 # (HOST_CC="gcc -m32").
-BUILD_CC_ARCH_append_powerpc = ' -m32'
-BUILD_CC_ARCH_append_x86 = ' -m32'
-BUILD_CC_ARCH_append_arm = ' -m32'
+BUILD_CC_ARCH_append = " ${@['-m32',''][d.getVar('SITEINFO_BITS') != '32']}"
 
 # The lua makefiles expect the TARGET_SYS to be from uname -s
 # Values: Windows, Linux, Darwin, iOS, SunOS, PS3, GNU/kFreeBSD
-- 
1.9.1


