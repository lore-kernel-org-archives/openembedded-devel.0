Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id 3A49291461
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 06:38:25 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id c9so2536051plo.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2020 22:38:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=73QsN8EweTb/1gm+CIYZJGjfYdXVDqoeljDwhS0LEaY=;
	b=YJ5GQjXrscfuolZBP+m43ewALiQOBGBAgPca5s534WSkjmS2AhgHeCHJGjYxMUNuQg
	KULSAZ8ZYuKR21ik0viSuQxr5YT1OnCQg0pLcR1vPEQLzYPlrfedMGvu1+GiZM3WVQe+
	UcKmfiCOQov9zDevMf561GF6awwN5+zQVgjB2d18je0pF4y4ADqzlmLk2BcFGUeVllZr
	aS8CQMt4x2yrMg0ftXUzRtrw/xycTAyRxt0aSDt+zEp/77Xov+WPbLjSuuNx6ZuByYCM
	bA1CyW8qoIFsO0LeIqR85n8q8Tpp+HcwkugAlT5rRYxRfiKyp92gJnt9Vx7DLOAg54F6
	dUwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=73QsN8EweTb/1gm+CIYZJGjfYdXVDqoeljDwhS0LEaY=;
	b=WmSiL4vk+cgXWKNk2Myt90cm/JJlQhWzaff2kwth4REXS5ehaWGrvDfzWNk15srZdm
	IJb/9Jk1JDgVtNHMRpsZDNXVlDwNRf18xYgBFdOfuyw8+gaWDNJ3LAYOiOsdNpyMhTq7
	nKOcO9DtFIWhjaTZ7+DT+CAK8FR4dlrzX3bHEMq/fzksrDHpLs44BXVszW1hNGZ4WqGg
	wDlI6U/s2G+yuCJPAk2AxpTfAhHcWzjr0QB/s9RZjZUkB3/mdd5CXV/WVOYstqtLwtNl
	SFd+EUqeIVTVkrJa1T07WtJqQyj+PUYdYIdexjGuuyrzW9c71SFuLfQPLCHaTxg7/0J9
	ZNAw==
X-Gm-Message-State: APjAAAXkZXhnHoS+YcQBpd5HQ/AFNRLgka9ieQc6mFd+egfkPBFCtWr3
	fukUxX7mpgAVsaWJ1r4HRgnrBjSeBuU=
X-Google-Smtp-Source: APXvYqyUR6e1Kb8h7u6WLhrt8E63UNMDPGPgc8iTAC+tYkhkAULkC4/IbBUDbvRvnOenG+5GGfU/PA==
X-Received: by 2002:a17:902:8c98:: with SMTP id
	t24mr8927000plo.51.1579675105726; 
	Tue, 21 Jan 2020 22:38:25 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::cab1])
	by smtp.gmail.com with ESMTPSA id
	100sm1600283pjo.17.2020.01.21.22.38.25
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 21 Jan 2020 22:38:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Jan 2020 22:38:14 -0800
Message-Id: <20200122063823.242098-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200122063823.242098-1-raj.khem@gmail.com>
References: <20200122063823.242098-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 03/12] lio-utils: Make it visible only with meta-py2 in BBFILE_COLLECTIONS
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
X-List-Received-Date: Wed, 22 Jan 2020 06:38:25 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-core/packagegroups/packagegroup-meta-oe.bb    | 3 ++-
 meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb        | 8 +++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 59f1703f4d..cb4be4a8a1 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -241,7 +241,7 @@ RDEPENDS_packagegroup-meta-oe-support ="\
     libgpiod libiio libjs-jquery libjs-sizzle liblinebreak libmicrohttpd \
     libmxml liboauth libol liboop libp11 libraw1394 libsmi libsoc libssh2 \
     libssh libtar libteam libtinyxml2 libtinyxml libusbg libusb-compat libutempter \
-    links lio-utils lockdev log4c log4cpp logwarn libdevmapper lvm2 \
+    links lockdev log4c log4cpp logwarn libdevmapper lvm2 \
     mailcap mbuffer mg minini \
     multipath-tools nano neon nmon numactl onig openct openldap \
     opensc wbxml2 p910nd pcsc-lite picocom libotr pidgin \
@@ -260,6 +260,7 @@ RDEPENDS_packagegroup-meta-oe-support ="\
     procmail \
     ${@bb.utils.contains("DISTRO_FEATURES", "polkit", "udisks2 upower", "", d)} \
     ${NE10} \
+    ${@bb.utils.contains("BBPATH", "meta-python2", "lio-utils", "", d)} \
     "
 
 RDEPENDS_packagegroup-meta-oe-support_remove_arm ="numactl"
diff --git a/meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb b/meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb
index 058117ed83..8e5986bd9e 100644
--- a/meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb
+++ b/meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/Datera/lio-utils.git \
 SRCREV = "0ac9091c1ff7a52d5435a4f4449e82637142e06e"
 S = "${WORKDIR}/git"
 
-inherit distutils3
+inherit distutils
 
 EXTRA_OEMAKE += "DESTDIR=${D}"
 
@@ -64,3 +64,9 @@ FILES_${PN} += "${sbindir}/* /etc/init.d/* /etc/target/*"
 # http://errors.yoctoproject.org/Errors/Details/184712/
 # python-native/python: can't open file 'setup.py': [Errno 2] No such file or directory
 CLEANBROKEN = "1"
+
+python() {
+    if 'meta-python2' not in d.getVar('BBFILE_COLLECTIONS').split():
+        raise bb.parse.SkipRecipe('Requires meta-python2 to be present.')
+}
+
-- 
2.25.0


