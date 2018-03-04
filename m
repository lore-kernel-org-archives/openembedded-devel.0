Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8D57D78A8A
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Mar 2018 20:41:43 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id y8-v6so8508032pll.13
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Mar 2018 12:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ZYAyBYHUatk/bYiCdoRDT7obOn5QWvJs8kTqSwCaA/A=;
	b=AOSrhz/Eb0X50c2Eu01OwphhCVJ0fd4Z9Zd6pEOXW3SMalyXIkR7LrNUnezM8LVWVn
	nH55StxR+IU0xyj7nu3BW1pfcgRpmXs06QkLEN9F3C+hkiwF3YPGeEZdao1mRjdZETwN
	1WIXNDZMN+Ifs18fxscFvyNVyf3yLVvgk3D55wbxLZatagtuguCZfri7B0k2cEtSfsBt
	tZMvuBfrFsDdRHDYB4jwBN/0zTGTvgasHgfIybO/aC7YfckQjl+a0Bcjeodqe2TfY/wg
	glSoRHMzjmavaM0TLabAjFIXykbsKRjgT1UEghYjAjPw8gDZEMv/lggGCOxPa8nnxdoD
	oVsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ZYAyBYHUatk/bYiCdoRDT7obOn5QWvJs8kTqSwCaA/A=;
	b=IOi5Io2bec2gbdk6Z98cZOaVs/GsX+GxZ7sVGSLtXZvdx/vh1f8nH2M/h8LQEFEkQY
	6IsEAQyYsdhUQC9xWmxFFDUP7qmaqrjDkzNwIuS+KVlesSgRrm4yBW58GG6jvFo4dP0T
	paP62NGyH7FBPUfdInVg9e4usSsggwngH7zdT+ig4/MYx8OHhfwS11lRZBpGoST90T3U
	EOgKKPY4YCDxJDBANiAtBw3aEMm3nx8k4d2lzQmj3DqZNIQIfe3zImnqpgT41fCcUc+M
	cC+yj8fygrLENBYygp0tBAR85YRMi0nzZAsFx8NXIJ2H7kNGouigx+go58U4zhlCDr5X
	yJJA==
X-Gm-Message-State: APf1xPCZAi3K972WaRrqXIbStHgH3cDYiySejX36d72i86gYPQy0IARu
	0j2mqwkWIu4iJckjOpnubvt6Hw==
X-Google-Smtp-Source: AG47ELsPUPk+yXYeHqUd29SBJTbWHFmNnLl04VwaZInPYZyDOaxoTwvVmOmr57qyQqQR1FCL7urlVA==
X-Received: by 2002:a17:902:40a:: with SMTP id
	10-v6mr11050738ple.245.1520196105277; 
	Sun, 04 Mar 2018 12:41:45 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	u28sm22943090pfl.19.2018.03.04.12.41.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 04 Mar 2018 12:41:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  4 Mar 2018 12:41:26 -0800
Message-Id: <20180304204130.23962-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180304204130.23962-1-raj.khem@gmail.com>
References: <20180304204130.23962-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/7] tipcutils: Fix builds with kernel headers >= 4.15
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
X-List-Received-Date: Sun, 04 Mar 2018 20:41:44 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...last-tipcc-Fix-struct-type-for-TIPC_GROUP.patch | 33 ++++++++++++++++++++++
 .../recipes-extended/tipcutils/tipcutils_git.bb    |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-extended/tipcutils/tipcutils/0001-multicast_blast-tipcc-Fix-struct-type-for-TIPC_GROUP.patch

diff --git a/meta-oe/recipes-extended/tipcutils/tipcutils/0001-multicast_blast-tipcc-Fix-struct-type-for-TIPC_GROUP.patch b/meta-oe/recipes-extended/tipcutils/tipcutils/0001-multicast_blast-tipcc-Fix-struct-type-for-TIPC_GROUP.patch
new file mode 100644
index 000000000..e49528505
--- /dev/null
+++ b/meta-oe/recipes-extended/tipcutils/tipcutils/0001-multicast_blast-tipcc-Fix-struct-type-for-TIPC_GROUP.patch
@@ -0,0 +1,33 @@
+From 1ce892749e4f53bd0aeaa4c3ce45f80178799411 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 3 Mar 2018 17:52:51 -0800
+Subject: [PATCH] multicast_blast/tipcc: Fix struct type for TIPC_GROUP_JOIN
+
+Kernel defines it as tipc_group_req and not tipc_mreq
+this code was not excercised with older kernels so we
+never ran into the compiler failures since TIPC_GROUP_JOIN
+is only defined in kernel starting 4.15
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ multicast_blast/tipcc.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/multicast_blast/tipcc.c b/multicast_blast/tipcc.c
+index 90644d3..911c759 100755
+--- a/multicast_blast/tipcc.c
++++ b/multicast_blast/tipcc.c
+@@ -213,7 +213,7 @@ int tipc_accept(int sd, struct tipc_addr *src)
+ int tipc_join(int sd, struct tipc_addr *member)
+ {
+ #ifdef TIPC_GROUP_JOIN
+-	struct tipc_mreq mreq = {
++	struct tipc_group_req mreq = {
+ 		.type = member->type,
+ 		.instance = member->instance,
+ 		.scope = domain2scope(member->domain)
+-- 
+2.16.2
+
diff --git a/meta-oe/recipes-extended/tipcutils/tipcutils_git.bb b/meta-oe/recipes-extended/tipcutils/tipcutils_git.bb
index 720aa3c2b..54ed043f4 100644
--- a/meta-oe/recipes-extended/tipcutils/tipcutils_git.bb
+++ b/meta-oe/recipes-extended/tipcutils/tipcutils_git.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://tipclog/tipc.h;endline=35;md5=985b6ea8735818511d276c1
 SRC_URI = "git://git.code.sf.net/p/tipc/tipcutils \
            file://0001-include-sys-select.h-for-FD_-definitions.patch \
            file://0002-replace-non-standard-uint-with-unsigned-int.patch \
+           file://0001-multicast_blast-tipcc-Fix-struct-type-for-TIPC_GROUP.patch \
            "
 SRCREV = "7ab2211b87414ba240b0b2e4af219c1057c9cf9a"
 PV = "2.2.0+git${SRCPV}"
-- 
2.16.2


