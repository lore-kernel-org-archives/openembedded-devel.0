Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id BBDA6747A4
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Apr 2018 18:06:00 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id 91-v6so5122133pld.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Apr 2018 11:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=mZiZH9PexlkTiIRE89138a4supe0fz7+IL3SuQ3w5vk=;
	b=FbuV9mXoQQzdBa3Byk7FwE9Bm4JOuWcpBJMgpQoO8vBDseEWr54fDsmqlgL9TXvCmv
	KL7ZsgtsV93Ujuz3BcVhEc84uzMIzFZ5Qh73ZoW4VUeXCWH5YvWYIE3Jt4uqZ13XN9Qy
	iPM+Q8JBkMFZvHqww8DsFSnvTiDVHLRx3fY1hVaLhdjua2pFpmiLYh+MusahVO2S+rzP
	q+CFWHXkGKIC5oRkICmnZ8DU3nO+AgtTa+woe1UwW0rdHb17uDkwBavH+0oFlk3KPRtI
	sVobUdUvxqtQ21gDYYSNDelvoP/mul8EiH7zrKl6lr9T3r2+ubRAO/6WRatIIVup+uMX
	ez5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=mZiZH9PexlkTiIRE89138a4supe0fz7+IL3SuQ3w5vk=;
	b=TvZrftf9nVWM2CkF1VtQP0t4cW8oQLDYm7yphX9QCE21JlURH3mN6lDp73Lkxkeq7r
	K2nM+WK3J5NEOY+rb8z8NOzjyXgzgOimrtShFkHtl8QRX/1gvrFZC3WvGtstxcKnoph9
	zK+I92JpIeKDefPhTmlezMxvJUegwO8DXAwAVeIdEOTs01JVTjRJT/hHPyf90kszOU9i
	dz1svUyT2Sy1UuQnwuZ3XqZZwsQ676rrsnBNNnJbBsUXQ0DuuE694MMCyKVsLEpp9DKO
	gP5ly4XfxH5hd0F/S+pUVu8hZ3OUlFxUph0wkx30MeUfYzMxn8uFvNrPGmQdzp+ng83U
	UouQ==
X-Gm-Message-State: AElRT7EWpZacFXI24BORo5On/FHYNwS+JUtATXSfA72RY24SIlu3pHIM
	33W1hjwOLWdsMLp1nILYGVZWow==
X-Google-Smtp-Source: AIpwx49GuQ9dWRoBdY5DR1Coj7zPUKnCY1FcShxQ8VSO0Nsgl4DdAx+z3/8npjdPDvDodoMBCf0vEA==
X-Received: by 2002:a17:902:8f85:: with SMTP id
	z5-v6mr2377025plo.105.1522692361812; 
	Mon, 02 Apr 2018 11:06:01 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	e4sm1788778pfa.166.2018.04.02.11.06.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Apr 2018 11:06:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  2 Apr 2018 11:05:46 -0700
Message-Id: <20180402180546.38078-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.3
In-Reply-To: <20180402180546.38078-1-raj.khem@gmail.com>
References: <20180402180546.38078-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 6/6] lowpan-tools: Switch to using github src_uri and fix build with gcc8
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
X-List-Received-Date: Mon, 02 Apr 2018 18:06:00 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...001-coordinator-Fix-strncpy-range-warning.patch | 30 ++++++++++++++++++++++
 .../lowpan-tools/lowpan-tools_git.bb               |  5 ++--
 2 files changed, 33 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-coordinator-Fix-strncpy-range-warning.patch

diff --git a/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-coordinator-Fix-strncpy-range-warning.patch b/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-coordinator-Fix-strncpy-range-warning.patch
new file mode 100644
index 000000000..493832bb8
--- /dev/null
+++ b/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-coordinator-Fix-strncpy-range-warning.patch
@@ -0,0 +1,30 @@
+From f017353b8f3170ce79e7addc127056c0142f087b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 1 Apr 2018 14:31:05 -0700
+Subject: [PATCH] coordinator: Fix strncpy range warning
+
+Fixes
+error: 'strncpy' specified bound 4096 equals destination size [-Werror=stringop-truncation]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/coordinator.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/src/coordinator.c b/src/coordinator.c
+index c139aae..ca49418 100644
+--- a/src/coordinator.c
++++ b/src/coordinator.c
+@@ -296,7 +296,8 @@ int main(int argc, char **argv)
+ 	if(!lease_file)
+ 		lease_file = LEASE_FILE;
+ 
+-	strncpy(pname, argv[0], PATH_MAX);
++	strncpy(pname, argv[0], PATH_MAX - 1);
++	pname[PATH_MAX - 1] = '\0';
+ 
+ 	pid_file = getenv("PID_FILE");
+ 	if (!pid_file)
+-- 
+2.16.3
+
diff --git a/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb b/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
index be73f8ae4..d0fe59c98 100644
--- a/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
+++ b/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
@@ -8,14 +8,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 DEPENDS = "flex-native bison-native libnl python"
 
 PV = "0.3.1+git${SRCPV}"
-SRC_URI = "git://git.code.sf.net/p/linux-zigbee/linux-zigbee \
+SRC_URI = "git://github.com/linux-wpan/lowpan-tools \
            file://no-help2man.patch \
            file://0001-Fix-build-errors-with-clang.patch \
            file://0001-addrdb-coord-config-parse.y-add-missing-time.h-inclu.patch \
            file://0001-src-iz.c-Undef-dprintf-before-redefining.patch \
            file://0001-Remove-newline-from-format-line.patch \
+           file://0001-coordinator-Fix-strncpy-range-warning.patch \
            "
-SRCREV = "38f42dbfce9e13629263db3bd3b81f14c69bb733"
+SRCREV = "1c2d8674cc6f4b1166a066e8822e295c105ae7a2"
 
 S = "${WORKDIR}/git"
 
-- 
2.16.3


