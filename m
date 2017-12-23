Return-Path: <bill.randle@gmail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id F3A4078876
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Dec 2017 20:05:15 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id g4so14339523ual.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Dec 2017 12:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=fxCCTON1F/TjEKaymrBoJVlEkMgkpZQAFtaRPzGwwSs=;
	b=YDL1ONPWMMv23Jke9TMg0KHNcCljItKtuGphegCE+R2jCeBz3vZjOiQMB8+1S6J8HL
	pNdxV6IKdR755zBzHJGghduDE2aDE5NryLH/pnCP1clOTyjtkkt9nZmLDAOAIZk94t/8
	F19IaeiE8ESs8QfPWvT3iMumjDl7ia4VOj94stCfKYiHtI1FedX4pf5psSuJEL6105/r
	+ZoXUIV8mwy7Lk8CBVXEROdd1CffQdtE9AYQlAstsYz45cje75gXln1/kqzrMil4fImE
	Xi2JhrLUi2P2Rq+wkNRnCw8rGjiIR9Gy4HpieOVkvqzLN8Yl5DcTvE2g9IVBhI0Pk76Y
	tgZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=fxCCTON1F/TjEKaymrBoJVlEkMgkpZQAFtaRPzGwwSs=;
	b=mtEhPvQmJipzOsIuqjegX8JCgkx6CjiMqqnZVxNFRnzLgEo6zLD8Kjyj3P7ZFWEjr9
	iFHsBiXA0xVJv/MDMbLxNAhCbBmg0dmo1+MX+tBk8aRD2o1y42A+6mhrA2g5V6ALkrqO
	eR/ts7ANkHDVhJhyv0cqO6Aa+wgoH4skFWKdYjw4YSc5xiBsnqQCSLrMOM1Of6jghRKL
	squiT2zmDly4iC4vLYS98MTcVdpl9tekC2p/C6H4RpKc4CZLCnSzClkjMntJPxkpsg21
	VD7u1mbGPwQE/E7ZQuCFfVEmaptRms9Ko1F/UGNQkEJbeiQm3nizPgeZhoMxIrNBOvkZ
	i70Q==
X-Gm-Message-State: AKGB3mKekKRU9CeNy9iKGllx55JhyvqQXLB2IUt21rdPfRFm0YKbcqpy
	uqdId5AFgpnM36xuvHpK/lzaTA==
X-Google-Smtp-Source: ACJfBosXY0xtrirLAY1K6AaUkzLS1e9zVQzUgfzdKbZsOyR8aTb8inXy5Vz2VdgBZUK3uCYFL9ITjQ==
X-Received: by 10.176.94.166 with SMTP id y38mr19952208uag.112.1514059516492; 
	Sat, 23 Dec 2017 12:05:16 -0800 (PST)
Received: from neosoft.neocat.org (184-100-130-3.ptld.qwest.net.
	[184.100.130.3]) by smtp.gmail.com with ESMTPSA id
	y11sm5094634uae.41.2017.12.23.12.05.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 23 Dec 2017 12:05:15 -0800 (PST)
From: Bill Randle <bill.randle@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 23 Dec 2017 12:04:50 -0800
Message-Id: <20171223200450.17938-1-bill.randle@gmail.com>
X-Mailer: git-send-email 2.13.6
Cc: koen@dominion.thruhere.net
Subject: [meta-oe][PATCH] smstools3: update to 3.1.21; drop uneeded patches
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
X-List-Received-Date: Sat, 23 Dec 2017 20:05:16 -0000

Update smstools3 to latest version and drop some patches that no longer
seem to be required. (Builds and runs fine on poky.)

Signed-off-by: Bill Randle <bill.randle@gmail.com>
---
 .../smstools3/fix-makefile-override.patch          | 24 ----------------------
 ...s_binpath_and_psops.patch => sms_binpath.patch} |  5 +----
 .../{smstools3_3.1.15.bb => smstools3_3.1.21.bb}   |  8 +++-----
 3 files changed, 4 insertions(+), 33 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/smstools3/smstools3/fix-makefile-override.patch
 rename meta-oe/recipes-connectivity/smstools3/smstools3/{sms_binpath_and_psops.patch => sms_binpath.patch} (90%)
 rename meta-oe/recipes-connectivity/smstools3/{smstools3_3.1.15.bb => smstools3_3.1.21.bb} (84%)

diff --git a/meta-oe/recipes-connectivity/smstools3/smstools3/fix-makefile-override.patch b/meta-oe/recipes-connectivity/smstools3/smstools3/fix-makefile-override.patch
deleted file mode 100644
index f0a1d33c9..000000000
--- a/meta-oe/recipes-connectivity/smstools3/smstools3/fix-makefile-override.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Upstream-Status: Backport [debian]
-
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -37,16 +37,15 @@
- # Use the following only on GNU/Linux and only if you need ps listing like "smsd: MAINPROCESS" and "smsd: GSM1"
- # CFLAGS += -D USE_LINUX_PS_TRICK
- 
--all: smsd 
--
--smsd: smsd.c extras.o locking.o cfgfile.o logging.o alarm.o smsd_cfg.o charset.o stats.o blacklist.o whitelist.o modeminit.o pdu.o
--
- ifneq (,$(findstring SOLARIS,$(CFLAGS)))
- ifeq (,$(findstring DISABLE_INET_SOCKET,$(CFLAGS)))
- override LFLAGS += -lsocket -lnsl
- endif
- endif
- 
-+all: smsd 
-+
-+smsd: smsd.c extras.o locking.o cfgfile.o logging.o alarm.o smsd_cfg.o charset.o stats.o blacklist.o whitelist.o modeminit.o pdu.o
- ifneq (,$(findstring NOSTATS,$(CFLAGS)))
- 	$(CC) $(CFLAGS) -o $@ $^ $(LFLAGS)
- else 
diff --git a/meta-oe/recipes-connectivity/smstools3/smstools3/sms_binpath_and_psops.patch b/meta-oe/recipes-connectivity/smstools3/smstools3/sms_binpath.patch
similarity index 90%
rename from meta-oe/recipes-connectivity/smstools3/smstools3/sms_binpath_and_psops.patch
rename to meta-oe/recipes-connectivity/smstools3/smstools3/sms_binpath.patch
index ffcaa0971..622044632 100644
--- a/meta-oe/recipes-connectivity/smstools3/smstools3/sms_binpath_and_psops.patch
+++ b/meta-oe/recipes-connectivity/smstools3/smstools3/sms_binpath.patch
@@ -12,8 +12,5 @@ Index: smstools3/scripts/sms3
 -RESETMODEMS=/usr/local/bin/smsd_resetmodems
 +RESETMODEMS=/usr/bin/smsd_resetmodems
  NAME=smsd
--PSOPT="-e"
-+PSOPT=""
+ PSOPT="-e"
  ECHO=echo
- case `uname` in
-   *BSD|Darwin)
diff --git a/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.15.bb b/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.21.bb
similarity index 84%
rename from meta-oe/recipes-connectivity/smstools3/smstools3_3.1.15.bb
rename to meta-oe/recipes-connectivity/smstools3/smstools3_3.1.21.bb
index 310a13c22..9885f351b 100644
--- a/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.15.bb
+++ b/meta-oe/recipes-connectivity/smstools3/smstools3_3.1.21.bb
@@ -6,18 +6,16 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4d21efa1bb2a186360dde4035f860682"
 HOMEPAGE = "http://smstools3.kekekasvi.com"
 
 SRC_URI = "http://smstools3.kekekasvi.com/packages/${BP}.tar.gz \
-           file://sms_binpath_and_psops.patch \
-           file://fix-makefile-override.patch"
+           file://sms_binpath.patch"
 
-SRC_URI[md5sum] = "0241ef60e646fac1a06254a848e61ed7"
-SRC_URI[sha256sum] = "ed00ffaeaa312a5b4f969f4e97a64603a866bbe16e393ea02f5bf05234814d59"
+SRC_URI[md5sum] = "6a9f038fb38a49cc3a4f8f14a88fb8af"
+SRC_URI[sha256sum] = "a26ba4c02b16f6cf13177bffca6c9230dc5fefaeba8e3030cd4e49"
 
 
 S = "${WORKDIR}/${BPN}"
 
 EXTRA_OEMAKE += "LFLAGS='${LDFLAGS}'"
 
-RDEPENDS_${PN} = "bash"
 INITSCRIPT_NAME = "sms3"
 INITSCRIPT_PARAMS = "defaults"
 
-- 
2.13.6


