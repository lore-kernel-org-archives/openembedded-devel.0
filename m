Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 1619160670
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jan 2016 01:47:48 +0000 (UTC)
Received: by mail-pf0-f175.google.com with SMTP id e65so185585085pfe.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jan 2016 17:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=VSnsStSaEuFmpCgACNxn+FmoWsRXg1dbm70jiHzlBJg=;
	b=0MK00BRkaYWqEHDuaQ9FzdXDwwMMNcJRpCQbkO8XTTmpCQkgf5qu8hpkQ0KvuXCrJ0
	E5Cv/rJ5SNKR2xhRZooQyxy1nhkiMQhHNiv2BNPpGO34go7RaH0P02l0nM6kpZExpjst
	KHKCRDOPLqXSQbf3zr3WLjLkpqx8TPvO2q22px2ffi5gzcQ+T9dNcQPTxy7M9nEwXaA5
	nypCJFBZpoWrnG/RhuyRGpp8ydH3qfWi15xKf7kKR36tQLFgffNPiYjx05KBrRbPvtRf
	NH77agD3LxEZ++1o7/Dqr+to762wECAkFsT0ukgr/V8XdlvmdJDrQUtDV2v8bXiaRsEh
	LR4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=VSnsStSaEuFmpCgACNxn+FmoWsRXg1dbm70jiHzlBJg=;
	b=APMuaZF03okGZmqgzj7ofCX7yc8vGZMYUKl4uVhITJa8hMnicxLZfovchYZ+uJK/qa
	/NltgbP6dClXwjW40JiFe0KUEYwCy9qjoiNc4fWUl0jCXZ85V48GtqUGc/8Nt7hlN3AI
	ivB644rGvavlKvSSOJ9udZbxDFSfo+0lmdgKIrY3LSF8upeXROJaKt73FFlgil+D2V5/
	UdnvYEluI9ALbjxJrAd7JSfc+ZZb3NtVM9hGa/yH4ummBv61SYqXOTncMVtkHd1trqIK
	3asSIrX8Q3Q8Y6k/M/q2Qqnh6uON4OE1B+CPLkHkB0s1jerkw26YqgRQCadXSF4G9QtC
	HL5A==
X-Gm-Message-State: ALoCoQkwpAHwuqxvlpxCTL0k4mFyQPbr+GKIBES1mKNaEPpgjGQ477yyjFiIbDHqvWhk9c3loWW0shestpV2qlVkXynyCo/Hfw==
X-Received: by 10.98.7.74 with SMTP id b71mr49211245pfd.38.1453254469302;
	Tue, 19 Jan 2016 17:47:49 -0800 (PST)
Received: from Pahoa2.mvista.com (116.sub-70-211-72.myvzw.com. [70.211.72.116])
	by smtp.gmail.com with ESMTPSA id
	lq10sm44596732pab.36.2016.01.19.17.47.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Jan 2016 17:47:48 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Jan 2016 17:47:45 -0800
Message-Id: <1453254465-26350-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [meta-oe][PATCH] numactl: update to 2.0.11
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
X-List-Received-Date: Wed, 20 Jan 2016 01:47:51 -0000

LIC_FILES_CKSUM changed do to adding version history.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../numactl/{numactl_2.0.10.bb => numactl_2.0.11.bb}                | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/numactl/{numactl_2.0.10.bb => numactl_2.0.11.bb} (87%)

diff --git a/meta-oe/recipes-support/numactl/numactl_2.0.10.bb b/meta-oe/recipes-support/numactl/numactl_2.0.11.bb
similarity index 87%
rename from meta-oe/recipes-support/numactl/numactl_2.0.10.bb
rename to meta-oe/recipes-support/numactl/numactl_2.0.11.bb
index 8f27b15..199726f 100644
--- a/meta-oe/recipes-support/numactl/numactl_2.0.10.bb
+++ b/meta-oe/recipes-support/numactl/numactl_2.0.11.bb
@@ -8,7 +8,7 @@ RDEPENDS_${PN} = "perl"
 
 inherit autotools-brokensep ptest
 
-LIC_FILES_CHKSUM = "file://README;beginline=19;endline=32;md5=00b9fb4504ff2afcb7fb2a518780f412"
+LIC_FILES_CHKSUM = "file://README;beginline=19;endline=32;md5=5644cc3851cb2499f6c48e52fe198bd9"
 
 SRC_URI = "ftp://oss.sgi.com/www/projects/libnuma/download/${BPN}-${PV}.tar.gz \
 	   file://fix-null-pointer.patch \
@@ -17,8 +17,8 @@ SRC_URI = "ftp://oss.sgi.com/www/projects/libnuma/download/${BPN}-${PV}.tar.gz \
 	   file://run-ptest \
 	   file://0001-define-run-test-target.patch \
           "
-SRC_URI[md5sum] = "682c38305b2596967881f3d77bc3fc9c"
-SRC_URI[sha256sum] = "dbdac8fe74f13b2e2864bba352f1597ab1d3345c8c485d7805f58d66f414db61"
+SRC_URI[md5sum] = "d3bc88b7ddb9f06d60898f4816ae9127"
+SRC_URI[sha256sum] = "450c091235f891ee874a8651b179c30f57a1391ca5c4673354740ba65e527861"
 
 # ARM does not currently support NUMA
 COMPATIBLE_HOST = "^((?!arm).*)$"
-- 
2.3.5


