Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1644.1792738434867948303
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2026 23:53:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KGzE16WN;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8a070755c8cso284920b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Oct 2026 23:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792738434; x=1793343234; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W+gbTXZpJwDj/B8TPqLfLc09yK6Rt0fuWOMO8WLDv/Q=;
        b=KGzE16WN9rFravePnJKMPRdEF6/5QXAmuOh72XU/FMmkZZ27567CFj/YeQAO0r30OZ
         vNas6ozuB1bV4JJI9ZuSSq2CjxeEIgtGERdZ8Zj9ifVqUnKyZ5wOb7TcJXT/tUTzd6hM
         XDSOhCISIQ1gccEhE3ogq0Leyq92tOghhVdkpdnwaspoyIz5ZfUlO7oMDyZps4zO4zMQ
         KnMLyPdLzrZ8wu8WgIE2qJpouCqvj3fyRDwiww5MKz2GDFi0U6IRNeZOjb/PUxWU+7Wx
         /c9/jOoKo/LtiWEJd29brOMPLtXRG96H8JoPpwNh4arfHlownYLEUtVtrbeLUA/cJ8BU
         Fhww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738434; x=1793343234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W+gbTXZpJwDj/B8TPqLfLc09yK6Rt0fuWOMO8WLDv/Q=;
        b=Kt+/X4h+D+y1wUScTwtAWgI6x+WSrJJlLf9B7smBNSiT1EqikjlpXPkM+PXeXsQ2Ki
         YNvc16wCxpFy17MrGdQtxt7WzC18l2d6GvYKgfBZxWUEiMgEL9y3SH6sVe392zr5c7AM
         Cb+lDTwpizA0KYgRNEDDhvciVY6pDeVcQZ/SO7Oq6Z0iMQY9tMXF50LaODvTs6ekysam
         mK9e1JquwyMHYjl+EKJrSKafBDykfMz7iYSNH5UZCT6QuCT6IUaIUfDajOQ7bXpnrPn0
         oe4TF/qJAz+2S7a++tXoKv5KRd2mLax8U3TPzzwl3vHeTuDQFuXnWuedivPACsjBp9MU
         tvEA==
X-Gm-Message-State: AFq9FYIBor+0QdF7PMF+gNGYJ3tLnbrXOSZc1ibl7WuLmWkPp2P6bX8W
	CY5FScRrDr75Ik/1nLxIa7G31Y4FOfq2eG7C3X6mNV6XUqKOUeulD7WOOLpWft2wEXs=
X-Gm-Gg: AYBFou2jEEdyBhbtpytWsEx4OU5UcOfK8qXlhN2osUqueJdinGTs2vY2DlHW4FVlRNh
	GS8G/TxPnFBh8L6ThoWmu+tNGi94UDmBXcc21rkm/gN7OnIRAk1FuHy5CPXe3AYoVL85G1/mY8Y
	co4k15unTaH9H7bKaE5S//X8+NlyUx74Vx3Z0I6UfKX3wzlAaMCg3AS0jSnuEy5NGObvo4OtEHG
	leC7CZ4WB2rjViLGf639qHDX6d4bYEVOn8/My6VT1hNNYBlk4msqgQMawlpmqIuyBo/xjU1jBih
	0XyUktrl7ZbPbhjnjlCViB43CCpTS5UEqc4peMmkuerhZP4i9C0lc+OiJA8DQ+B3X9doqDNuxMA
	PGBgSe3D6RVD86iv8cgpf5SIn12gQYY7l4C/IZL/vnKwO3xJPjTJwK/Lz4XWU3KyoPTwCFscbn4
	gnjYDheBz/DjDPKcMGEXfNlXSOL/vMUdfu81b5uBlyyPut05NhDIb4l4qwFBZi82oQzMWtXSH+c
	7OP+4JTDZbGHERNPH3jqjMifw+bTAMhjeePEQiIEtRDEAw1aO6dPE3GKR+QSNFmtHiepy24Rqfy
	kknYWgASVLJqnWI/AWmAfpMknCHoOqNY+vCwG4zQpIRP9hBZgQaFH6ZgdpMAMuaVmQK3a4dy4PJ
	HIQD9OY4AYnffJQvVmCM4UJ20au/nwk0PpaYqv3HBAv1+MjdGw+tdFPfDH4ySFwtR4OFgMdE2cC
	Qgv1wmFvluGuQ+ePrBkFoScifmzXYFwr+Mi8jHLCSVktQHz3L8ZSrs2KIg9aaI7S+fliPJlId+p
	oGYNPOvarh6qrx3EAGAfy1GML6HKoM=
X-Received: by 2002:a05:6a00:6ca7:b0:89f:fc75:6d99 with SMTP id d2e1a72fcca58-8a2c629f489mr1171197b3a.60.1792738434029;
        Thu, 22 Oct 2026 23:53:54 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a2c92f7bd8sm384769b3a.50.2026.10.22.23.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:53:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 01/29] castxml: upgrade 0.7.0 -> 0.8.0
Date: Thu, 22 Oct 2026 23:53:22 -0700
Message-ID: <20261023065350.3228996-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 06:54:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131325
Content-Type: text/plain; charset="utf-8"

Drop the LLVM/Clang 23 port backport, it is included in this release.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../castxml/0001-Port-to-LLVM-Clang-23.patch  | 36 -------------------
 .../{castxml_0.7.0.bb => castxml_0.8.0.bb}    |  6 ++--
 2 files changed, 2 insertions(+), 40 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/castxml/castxml/0001-Port-to-LLVM-Clang-23.patch
 rename meta-oe/recipes-devtools/castxml/{castxml_0.7.0.bb => castxml_0.8.0.bb} (69%)

diff --git a/meta-oe/recipes-devtools/castxml/castxml/0001-Port-to-LLVM-Clang-23.patch b/meta-oe/recipes-devtools/castxml/castxml/0001-Port-to-LLVM-Clang-23.patch
deleted file mode 100644
index 9caabdcf2a..0000000000
--- a/meta-oe/recipes-devtools/castxml/castxml/0001-Port-to-LLVM-Clang-23.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 315fbacc4e4b9c7ea21d25ad489a90b73a526326 Mon Sep 17 00:00:00 2001
-From: Brad King <brad.king@kitware.com>
-Date: Wed, 10 Jun 2026 10:55:10 -0400
-Subject: [PATCH] Port to LLVM/Clang Git main as of 2026-10-10 (6f47b6de08)
-
-Upstream-Status: Backport [https://github.com/CastXML/CastXML/commit/315fbacc4e4b]
-
-Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
----
- src/Output.cxx | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/src/Output.cxx b/src/Output.cxx
-index bb986d4b..9f722efd 100644
---- a/src/Output.cxx
-+++ b/src/Output.cxx
-@@ -119,6 +119,10 @@ clang::NestedNameSpecifier const& deref(NestedNameSpecifier const& nns)
- #  define isPureVirtual isPure
- #endif
- 
-+#if LLVM_VERSION_MAJOR < 23
-+#  define getRawCommentNoCache getRawCommentForDeclNoCache
-+#endif
-+
- class ASTVisitorBase
- {
- protected:
-@@ -1973,7 +1977,7 @@ void ASTVisitor::PrintCommentAttribute(clang::Decl const* d,
-   if (!this->Opts.CastXml) {
-     return;
-   }
--  if (clang::RawComment const* rc = this->CTX.getRawCommentForDeclNoCache(d)) {
-+  if (clang::RawComment const* rc = this->CTX.getRawCommentNoCache(d)) {
-     unsigned int index = ++this->CommentCount;
-     CommentEntry e = { index, rc, dn };
-     this->CommentQueue.push(e);
diff --git a/meta-oe/recipes-devtools/castxml/castxml_0.7.0.bb b/meta-oe/recipes-devtools/castxml/castxml_0.8.0.bb
similarity index 69%
rename from meta-oe/recipes-devtools/castxml/castxml_0.7.0.bb
rename to meta-oe/recipes-devtools/castxml/castxml_0.8.0.bb
index d052f56320..8fec771e7d 100644
--- a/meta-oe/recipes-devtools/castxml/castxml_0.7.0.bb
+++ b/meta-oe/recipes-devtools/castxml/castxml_0.8.0.bb
@@ -2,10 +2,8 @@ SUMMARY = "C-family abstract syntax tree XML output tool."
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "2d52b47cfd88b703d3247f77bb7c3ad7372bc9cb"
-SRC_URI = "git://github.com/CastXML/CastXML;protocol=https;branch=master;tag=v${PV} \
-           file://0001-Port-to-LLVM-Clang-23.patch \
-           "
+SRCREV = "6ebb3df6e88ae562ca54aa09c8eb5ef679b5f2cb"
+SRC_URI = "git://github.com/CastXML/CastXML;protocol=https;branch=master;tag=v${PV}"
 
 DEPENDS = "clang"
 
