Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f47.google.com (mail-pb0-f47.google.com
	[209.85.160.47])
	by mail.openembedded.org (Postfix) with ESMTP id 2EAE565D04
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Apr 2014 18:22:19 +0000 (UTC)
Received: by mail-pb0-f47.google.com with SMTP id up15so3487148pbc.34
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Apr 2014 11:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=HgwgOzyrhMJVluFXc+OVGvX/b13Sc6wFRPobKdlfSxo=;
	b=JK0yx4NpfcgmIBvTdlFlfsMhtu+uSkelw4jmuyxKPz6pmKg2Ejv/bTWWaC/b7u6g1i
	DujW7BDJrRxmdBMd0SvsFHcIyXwZPfTJd+dBd6qUieOJ3itEN6HEpRjJlauT8yyksnVK
	Qpu6wT4eAtPDpFkwu4DbC+wVMYat2HXPJinh8jML/Z6wttwXDNhJXQxUGZC4TugVGsDS
	SO8RJ8CH1wtuDa6lD/GVkF0ybRJj5lRSdPdNuJy0cidWQQXeHSEFczRVDqEfavLTVEzE
	XUnoW4F7xdO9HkBodyBLQjn++TdqrWDH6ohC0nMuIO6+k5uzhXw6WoZYjiS6rYrVah96
	MNbA==
X-Received: by 10.68.139.71 with SMTP id qw7mr13160251pbb.68.1398450139986;
	Fri, 25 Apr 2014 11:22:19 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	kj1sm17443584pbd.20.2014.04.25.11.22.17 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Apr 2014 11:22:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Apr 2014 11:24:25 -0700
Message-Id: <1398450265-27979-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-oe][PATCH] htop: Update 1.0.2 -> 1.0.3
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Apr 2014 18:22:24 -0000

Update to latest and at the same time fix
building when S != B

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-support/htop/{htop_1.0.2.bb => htop_1.0.3.bb} |   13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-support/htop/{htop_1.0.2.bb => htop_1.0.3.bb} (54%)

diff --git a/meta-oe/recipes-support/htop/htop_1.0.2.bb b/meta-oe/recipes-support/htop/htop_1.0.3.bb
similarity index 54%
rename from meta-oe/recipes-support/htop/htop_1.0.2.bb
rename to meta-oe/recipes-support/htop/htop_1.0.3.bb
index 234978b..4e445c8 100644
--- a/meta-oe/recipes-support/htop/htop_1.0.2.bb
+++ b/meta-oe/recipes-support/htop/htop_1.0.3.bb
@@ -8,12 +8,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c312653532e8e669f30e5ec8bdc23be3"
 DEPENDS = "ncurses"
 RDEPENDS_${PN} = "ncurses-terminfo"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/htop/htop-${PV}.tar.gz"
+SRC_URI = "http://hisham.hm/htop/releases/${PV}/htop-${PV}.tar.gz"
 
-LDFLAGS_append_libc-uclibc = " -lubacktrace"
+SRC_URI[md5sum] = "e768b9b55c033d9c1dffda72db3a6ac7"
+SRC_URI[sha256sum] = "055c57927f75847fdc222b5258b079a9542811a9dcf5421c615c7e17f55d1829"
 
-inherit autotools
+LDFLAGS_append_libc-uclibc = " -lubacktrace"
 
-SRC_URI[md5sum] = "0d01cca8df3349c74569cefebbd9919e"
-SRC_URI[sha256sum] = "ee60657b044ece0df096c053060df7abf3cce3a568ab34d260049e6a37ccd8a1"
+do_configure_prepend () {
+	rm -rf ${S}/config.h
+}
 
+inherit autotools
-- 
1.7.10.4


