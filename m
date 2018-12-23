Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id ED4E16C50D
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2018 21:36:11 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id b5so4866785plr.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2018 13:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=7MjclzVablZNQanOpo2qCHcE1lj7csCm8BCyhXE44JE=;
	b=tdzU9o0bW4mg15qSmo3xUHQmFy9v81JpwvJiHnYI3sgdIykExcNKRhVrdzOp7NqPJa
	QWQkdKUV5seO2KR9zPwosUpCrgucHeZ9rdIj+6nnF7mu9vzr5GJKQ7LwZWZxglnJN3a3
	aIKhHHL0R75B6nPOGQqNT0M1UGExr4RCylznxVsbswyQrkj/wR0Zhuc61sk3ByUAjS61
	i/PAx7pHSTx/ITHs79tl53umScndVnStzYiPf4BTmXX/UJ2lsoIjNvBEYCnLc+cRhEEt
	z1s7EP8GbIahYcJdkIEZ+m09+LEo2P1kITOUYc2dvFec9T9GVlNGHzDGtmvcdu4EAGpJ
	EVyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=7MjclzVablZNQanOpo2qCHcE1lj7csCm8BCyhXE44JE=;
	b=qajPvoETaU8EJxPmv2tgmAga25zidEKqytsrcsbQUudW+LMyrMaGCvePcWb5SchJWD
	l0gPROgC4qRi7kdHOuUABPh0pOFNCtgl/s3NzmDMz6HL1I9ST0NR61puf1cABORjqhdr
	+hI0uZdJGMftlbzg81URiMTfQGp8CanQQMMobdXE+bMlmgIpLVzbKt8VRTtGpP7WD753
	N2RVpKXmZl3UTzZC1C4DURb3owzmplmPnPxPKw9zZA2HFkUYvX9dPyyStiJG7MIhowHR
	VvKXWBcdFopfjhD2ZgWd7H9XgNus6OwOC3owrykPqxRGv9AVWx+m66OgKdchd7fSZ40t
	Xekw==
X-Gm-Message-State: AJcUukeES5r30SJLBUzraj1NcZm+0cr4OAM685b8zkf92iwynlo+qk2L
	GJu9ztb0x7IWKVYeDj8eLtLHU0lvEuo=
X-Google-Smtp-Source: ALg8bN5blvJ07cOd0ZBd9h+dbZABeNwDFBbsGwt3KDMmWCeD7O7ZHMjY40qfowoMX7SKX1O9T7CgJA==
X-Received: by 2002:a17:902:a40f:: with SMTP id
	p15mr11112829plq.286.1545600972577; 
	Sun, 23 Dec 2018 13:36:12 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:877f:9499::19ec])
	by smtp.gmail.com with ESMTPSA id
	m9sm33340800pgd.32.2018.12.23.13.36.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 23 Dec 2018 13:36:11 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Dec 2018 13:35:43 -0800
Message-Id: <20181223213557.7834-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20181223213557.7834-1-raj.khem@gmail.com>
References: <20181223213557.7834-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 04/18] opensaf: Upgrade to 5.18.09
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
X-List-Received-Date: Sun, 23 Dec 2018 21:36:12 -0000
Content-Transfer-Encoding: 8bit

Degrade certain Werror into warnings to get it building with
gcc >= 8

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Fix-string-overflow-in-snprintf.patch       | 12 ++++++------
 .../{opensaf_5.18.04.bb => opensaf_5.18.09.bb}       |  7 ++++---
 2 files changed, 10 insertions(+), 9 deletions(-)
 rename meta-networking/recipes-daemons/opensaf/{opensaf_5.18.04.bb => opensaf_5.18.09.bb} (90%)

diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/0001-Fix-string-overflow-in-snprintf.patch b/meta-networking/recipes-daemons/opensaf/opensaf/0001-Fix-string-overflow-in-snprintf.patch
index db6796d05d..93c75777fe 100644
--- a/meta-networking/recipes-daemons/opensaf/opensaf/0001-Fix-string-overflow-in-snprintf.patch
+++ b/meta-networking/recipes-daemons/opensaf/opensaf/0001-Fix-string-overflow-in-snprintf.patch
@@ -1,4 +1,4 @@
-From ae7178a78aba2e5766b70191617113487fd7ad0b Mon Sep 17 00:00:00 2001
+From 88661a60629894353512c53ed32f2b901f64149c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 16 Apr 2018 18:29:17 -0700
 Subject: [PATCH] Fix string overflow in snprintf
@@ -53,7 +53,7 @@ index 81e521e..d53cc48 100644
    TRACE_ENTER();
  
 diff --git a/src/smf/smfd/SmfUpgradeCampaign.cc b/src/smf/smfd/SmfUpgradeCampaign.cc
-index 45cdce8..6761bcf 100644
+index c30ea14..098f17a 100644
 --- a/src/smf/smfd/SmfUpgradeCampaign.cc
 +++ b/src/smf/smfd/SmfUpgradeCampaign.cc
 @@ -447,7 +447,7 @@ SaAisErrorT SmfUpgradeCampaign::tooManyRestarts(bool *o_result) {
@@ -66,11 +66,11 @@ index 45cdce8..6761bcf 100644
    /* Read the SmfCampRestartInfo object smfCampRestartCnt attr */
    std::string obj = "smfRestartInfo=info," +
 @@ -473,7 +473,7 @@ SaAisErrorT SmfUpgradeCampaign::tooManyRestarts(bool *o_result) {
-     attrsmfCampRestartCnt.setName("smfCampRestartCnt");
-     attrsmfCampRestartCnt.setType("SA_IMM_ATTR_SAUINT32T");
+     attrsmfCampRestartCnt.SetAttributeName("smfCampRestartCnt");
+     attrsmfCampRestartCnt.SetAttributeType("SA_IMM_ATTR_SAUINT32T");
      char buf[5];
 -    snprintf(buf, 4, "%d", curCnt);
 +    snprintf(buf, 4, "%hd", curCnt);
-     attrsmfCampRestartCnt.addValue(buf);
-     imoCampRestartInfo.addValue(attrsmfCampRestartCnt);
+     attrsmfCampRestartCnt.AddAttributeValue(buf);
+     imoCampRestartInfo.AddValue(attrsmfCampRestartCnt);
  
diff --git a/meta-networking/recipes-daemons/opensaf/opensaf_5.18.04.bb b/meta-networking/recipes-daemons/opensaf/opensaf_5.18.09.bb
similarity index 90%
rename from meta-networking/recipes-daemons/opensaf/opensaf_5.18.04.bb
rename to meta-networking/recipes-daemons/opensaf/opensaf_5.18.09.bb
index c534c6206b..f1aedc4def 100644
--- a/meta-networking/recipes-daemons/opensaf/opensaf_5.18.04.bb
+++ b/meta-networking/recipes-daemons/opensaf/opensaf_5.18.09.bb
@@ -29,8 +29,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/releases/${BPN}-${PV}.tar.gz \
            file://0001-Fix-string-overflow-in-snprintf.patch \
            file://0008-check-for-size-before-using-strncpy.patch \
            "
-SRC_URI[md5sum] = "21836e43b13ad33bed9bd0ed391e5a6e"
-SRC_URI[sha256sum] = "e55dc2645487fb22938e8386b99eef6eb7aff43a246ce3e92488daf6ee46247a"
+SRC_URI[md5sum] = "45044fde0b35eac057a5fa05c27b8040"
+SRC_URI[sha256sum] = "230a0ea628ba278170a913746c39b2c8cd529d7dc25326b2e17b5c095cf94025"
 
 inherit autotools useradd systemd pkgconfig
 
@@ -48,7 +48,8 @@ PACKAGECONFIG[plm] = "--enable-ais-plm,--disable-ais-plm,libvirt openhpi"
 PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', ' systemd', '', d)}"
 
 PKGLIBDIR="${libdir}"
-
+CPPFLAGS += "-Wno-error=stringop-overflow= -Wno-error=stringop-truncation"
+CXXFLAGS += "-Wno-error=stringop-overflow= -Wno-error=stringop-truncation -Wno-error=format-truncation="
 LDFLAGS += "-Wl,--as-needed -latomic -Wl,--no-as-needed"
 
 do_install_append() {
-- 
2.20.1


