Return-Path: <armccurdy@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5BB3974C0D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2018 01:31:25 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id v24-v6so3595205plo.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 May 2018 18:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=8bRTphkfCcZevBUM7XJUGMvvPr7nluMKzWeKGxdkO1w=;
	b=QYAhU7Gmf0tqfUTcK1mhWnpy4T+ZilqOa/70OJKd/V/lQQ+HAZm0EgYimrqSRnqbl4
	2GBnvHMmRAI2LCtPkRdZjnuMBvwn1KMer2Fl8UQCl5kkpSgly5uM4Xc7kDL4OUA8ltS3
	hR36WXx9ojCbFn+GTyf4uxmW+yCAA1SrL7MiE16u7mDMrs8D5ND61KyRCLpOkNQtoP/D
	2rzRVakpaoU7fCA+5kpJo2mDdJ1MRwSPgdY1XXhZtvhvFf2OsHGGsF+JNQjzSavHDq7V
	YqwZgj7UhLGlx8nM9lV2n7Dq1B8xJ+6ZLA76btAx3ef3guT8RMckkYjNplYtOGj3reA5
	7ppQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=8bRTphkfCcZevBUM7XJUGMvvPr7nluMKzWeKGxdkO1w=;
	b=Q3IiodjnsJzXTkk1zmauznhaHBO9p/CyrEGGTWZWeFK3Ne4ZFW51rSE/gPpkcp9g8s
	vPNP/XkUKx1jfxqKfmt04W+Eo2tIoTsPEYhL7j6ecYO+6qw3s1AVyi/bZZ65+Mcr8pzJ
	M/aX7dlVf08zRnlyk9AhSoUCUP0DFGiCMqylu0PLoiNe6ukvbcso7f1lg4S7zTdcB9aQ
	X+m0nGwS8IzICDBlL86JcGzcuS7Mae3khZg22NWcTpN8GksKjwdWirKQkGnZ1TANuGvn
	XECDIhhph6gL3+g7eWgW//A9btfbCkGlRxET3ljIrauPqAV6/ca63LfByal0lYIfsxFs
	Bjqw==
X-Gm-Message-State: ALKqPweumg2NXHq/oKrCEVsjTcMyFi3Ozr6Sm8aah+nl7UvY/ez3MuDv
	XnrLF/ScAY2UC8KLQfMc/tK/Rw==
X-Google-Smtp-Source: AB8JxZpICfT53u/eEiVqzhDRrk4t/Qd7t2Yil13ZDlnA3fLCqvucejdUMLG4/KdxuxJlFTTSGn8ZtQ==
X-Received: by 2002:a17:902:274a:: with SMTP id
	j10-v6mr7604097plg.393.1526607086049; 
	Thu, 17 May 2018 18:31:26 -0700 (PDT)
Received: from localhost.localdomain ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	n25-v6sm9428562pgd.5.2018.05.17.18.31.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 17 May 2018 18:31:25 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 May 2018 18:30:44 -0700
Message-Id: <1526607046-8081-15-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1526607046-8081-1-git-send-email-armccurdy@gmail.com>
References: <1526607046-8081-1-git-send-email-armccurdy@gmail.com>
Subject: [meta-oe][PATCH 15/17] libssh: rely on cmake.bbclass to put cmake package files in dev package
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
X-List-Received-Date: Fri, 18 May 2018 01:31:25 -0000

The cmake.bbclass in oe-core now ensures that ${libdir}/cmake and
${datadir}/cmake end up in the dev package, so recipes no longer need
to provide custom packaging rules to handles these files.

  http://git.openembedded.org/openembedded-core/commit/?id=d91dc4666683a96e9d03cbbd21b8a546f9069c93

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta-oe/recipes-support/libssh/libssh_0.7.3.bb | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/meta-oe/recipes-support/libssh/libssh_0.7.3.bb b/meta-oe/recipes-support/libssh/libssh_0.7.3.bb
index 79e7dc5..6e060f7 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.7.3.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.7.3.bb
@@ -1,16 +1,20 @@
 SUMMARY = "Multiplatform C library implementing the SSHv2 and SSHv1 protocol"
 HOMEPAGE = "http://www.libssh.org"
 SECTION = "libs"
-
-DEPENDS = "zlib openssl libgcrypt"
-
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=388a4fb1dea8ceae0be78ba9b01fc139"
 
+DEPENDS = "zlib openssl libgcrypt"
+
 SRC_URI = "git://git.libssh.org/projects/libssh.git;branch=v0-7"
 SRCREV = "cdf7690e038230623cbbf6b024ece62f41efa98d"
 S = "${WORKDIR}/git"
 
+inherit cmake
+
+PACKAGECONFIG ??=""
+PACKAGECONFIG[gssapi] = "-DWITH_GSSAPI=1,-DWITH_GSSAPI=0,krb5"
+
 EXTRA_OECMAKE = " \
     -DWITH_GCRYPT=1 \
     -DWITH_PCAP=1 \
@@ -19,16 +23,10 @@ EXTRA_OECMAKE = " \
     -DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')} \
     "
 
-PACKAGECONFIG ??=""
-PACKAGECONFIG[gssapi] = "-DWITH_GSSAPI=1, -DWITH_GSSAPI=0, krb5, "
-
-inherit cmake
-
 do_configure_prepend () {
     # Disable building of examples
     sed -i -e '/add_subdirectory(examples)/s/^/#DONOTWANT/' ${S}/CMakeLists.txt \
         || bbfatal "Failed to disable examples"
 }
 
-FILES_${PN}-dev += "${libdir}/cmake"
 TOOLCHAIN = "gcc"
-- 
1.9.1


