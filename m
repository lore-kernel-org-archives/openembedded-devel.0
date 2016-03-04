Return-Path: <koen.kooi@linaro.org>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 9288462133
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Mar 2016 07:15:03 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id l68so7915159wml.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Mar 2016 23:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ows665yvueSeuLAeHD6v+mIGXMBJ29GcU7MxPjGJkIo=;
	b=AK4OESsXt+SpMTg7PvJZ112Bp5LmraL73MJoW58cgx6l2AKi+GhEP2wmRVT/Lym9QZ
	bqWB991ZlrUMhjf8T6y6+spW7iuI1vEcTQQeChAJrTpqYv9S6i8QGSIvc7sdY+Y9qYwT
	QozFcTvx0h0EEleHno1LRdpWh8HtcvxLjOcQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ows665yvueSeuLAeHD6v+mIGXMBJ29GcU7MxPjGJkIo=;
	b=msgmmRFfxc2kSSvgi9YU1w4YuLKZxNBQUFhirRcXoIwZlKXIEh7bkj51OaCCaiKNzR
	tNR1V5ceoTXpcAVX/5GO+XAe0Zs1mXynplDbiHQBmCEPG1v1+7/SQH6cx+Dnva0pf1kF
	og/kobM9o5u5zWwq3odZ34jLPDjCjytsorkBE5CEuTzma3/e99roDBzMthJ4H98iTyPz
	z+N6gHvqu+qum5Ao/rlpEPPZdHBKheg7MX/Z1Er8w6CnsZ1YuIrJLMzaHfkB96NnepP2
	wW+7tIV06/89Y1gDHolWpfxraJRvq/Jl/DdQWEsvNK3cKcJwzrxDtAxmR6lzzRz3bEyG
	Ph2A==
X-Gm-Message-State: AD7BkJKqpS2EFX3pGUq7W/0Jeao9HkcMqzlw42onUFSIWZSKIJ/JKnXl+BZsuIjA7S8dWA+y
X-Received: by 10.194.236.3 with SMTP id uq3mr7147805wjc.119.1457075703876;
	Thu, 03 Mar 2016 23:15:03 -0800 (PST)
Received: from thinkpad.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by smtp.gmail.com with ESMTPSA id i2sm1904939wje.22.2016.03.03.23.15.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Mar 2016 23:15:02 -0800 (PST)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  4 Mar 2016 08:14:55 +0100
Message-Id: <1457075695-17045-2-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 2.4.3
In-Reply-To: <1457075695-17045-1-git-send-email-koen.kooi@linaro.org>
References: <1457075695-17045-1-git-send-email-koen.kooi@linaro.org>
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [meta-oe][PATCH v2 2/2] efibootmgr: update and unblacklist
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
X-List-Received-Date: Fri, 04 Mar 2016 07:15:04 -0000

Also fix style issues.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta-oe/recipes-extended/efibootmgr/efibootmgr_0.12.bb  | 14 +++++++-------
 meta-oe/recipes-extended/efibootmgr/files/ldflags.patch | 17 -----------------
 2 files changed, 7 insertions(+), 24 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/efibootmgr/files/ldflags.patch

diff --git a/meta-oe/recipes-extended/efibootmgr/efibootmgr_0.12.bb b/meta-oe/recipes-extended/efibootmgr/efibootmgr_0.12.bb
index 9b611ce..d80c89f 100644
--- a/meta-oe/recipes-extended/efibootmgr/efibootmgr_0.12.bb
+++ b/meta-oe/recipes-extended/efibootmgr/efibootmgr_0.12.bb
@@ -10,20 +10,20 @@ DEPENDS = "pciutils zlib efivar"
 
 COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 
-SRC_URI = "https://github.com/rhinstaller/efibootmgr/releases/download/${BP}/${BP}.tar.bz2 \
-           file://ldflags.patch \
+SRCREV = "eb6e36c9064eae256cd60df24a977e3abd87fd16"
+SRC_URI = "git://github.com/rhinstaller/efibootmgr.git;protocol=https \
           "
 
-SRC_URI[md5sum] = "6647f5cd807bc8484135ba74fcbcc39a"
-SRC_URI[sha256sum] = "a66f5850677e86255d93cb1cead04c3c48a823a2b864c579321f2a07f00256e6"
+S = "${WORKDIR}/git"
+
+
+inherit pkgconfig
 
 EXTRA_OEMAKE = "'CC=${CC}' 'CFLAGS=${CFLAGS} -I${S}/src/include `pkg-config --cflags efivar` \
                  -DEFIBOOTMGR_VERSION=\"$(RELEASE_MAJOR).$(RELEASE_MINOR)\" '"
 
 do_install () {
-    install -D -p -m0755 src/efibootmgr/efibootmgr ${D}/${sbindir}/efibootmgr
+    install -D -p -m0755 src/efibootmgr ${D}/${sbindir}/efibootmgr
 }
 
-inherit pkgconfig
 
-PNBLACKLIST[efibootmgr] ?= "Depends on blacklisted efivar"
diff --git a/meta-oe/recipes-extended/efibootmgr/files/ldflags.patch b/meta-oe/recipes-extended/efibootmgr/files/ldflags.patch
deleted file mode 100644
index 0d5594a..0000000
--- a/meta-oe/recipes-extended/efibootmgr/files/ldflags.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Upstream-Status: Pending
-
-Import this patch from meta-linaro.
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
---- efibootmgr-0.5.4.orig/Makefile
-+++ efibootmgr-0.5.4/Makefile
-@@ -11,6 +11,8 @@
-   CFLAGS = $(EXTRA_CFLAGS) -DEFIBOOTMGR_VERSION=\"$(RELEASE_MAJOR).$(RELEASE_MINOR).$(RELEASE_SUBLEVEL)$(RELEASE_EXTRALEVEL)\" \
- 	    -Wall -g -D_FILE_OFFSET_BITS=64
- 
-+  LDFLAGS += -lz
-+
-   MODULES := src
- 
-   BINDIR := /usr/sbin
-- 
2.4.3


