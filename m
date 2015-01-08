Return-Path: <akuster808@gmail.com>
Received: from mail-qa0-f45.google.com (mail-qa0-f45.google.com
	[209.85.216.45])
	by mail.openembedded.org (Postfix) with ESMTP id DA97D72498
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Jan 2015 04:10:27 +0000 (UTC)
Received: by mail-qa0-f45.google.com with SMTP id f12so5811008qad.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Jan 2015 20:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=22n2zVssmNpsy74CgDG60RQMgW5eg8lO787eM3YAcHc=;
	b=LpJgYrOe51Q3c6tYdsqRO6SrVibvMgNsZQKtzMC4Qs/i/jjo8bgwcFZL7REsoUV9/u
	bGAia8F5Lr6Uz0/T07xRpAQ8t6ZE8oD+5uIie56hPZPHlCRwLuzaVH5Reiys7L+8GOGv
	T7Cd14m9uV5xnfWKy8cJdoPRVhYmTy+2Z8Z+2C+ZUCcb90R8AbJxcLBiLPOb2uc8jU+6
	10aUBzT6kum5Q9mL39GB3D/cMiDQ6HFGNhwfbJ5fHWy4dcTFSGo50WxgvP7TUP7K5LYH
	i7OOcLldojhYfiYl8l+jbREX0wha2SB53KQiYvgLk8J/43YSab23fc7iH4qlBpfBw2RM
	TxfA==
X-Received: by 10.224.136.194 with SMTP id s2mr11608186qat.82.1420690227316;
	Wed, 07 Jan 2015 20:10:27 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id f51sm3042483qgf.28.2015.01.07.20.10.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Jan 2015 20:10:26 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Jan 2015 20:10:15 -0800
Message-Id: <1420690215-2544-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH V2] libssh: depends fix
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
X-List-Received-Date: Thu, 08 Jan 2015 04:10:40 -0000

the default was to build with GSSAPI enabled.

add PACKAGEGROUP to define enable/disable GSSAPI with
proper depends/rdepends of krb5

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/libssh/libssh_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/libssh/libssh_git.bb b/meta-oe/recipes-support/libssh/libssh_git.bb
index d21bdc3..4f5b703 100644
--- a/meta-oe/recipes-support/libssh/libssh_git.bb
+++ b/meta-oe/recipes-support/libssh/libssh_git.bb
@@ -20,6 +20,9 @@ EXTRA_OECMAKE = " \
     -DWITH_ZLIB=1 \
     "
 
+PACKAGECONFIG ??=""
+PACKAGECONFIG[gssapi] = "-DWITH_GSSAPI=1, -DWITH_GSSAPI=0, krb5, krb5"
+
 inherit cmake
 
 do_configure_prepend () {
-- 
1.9.1


