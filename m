Return-Path: <akuster808@gmail.com>
Received: from mail-yh0-f52.google.com (mail-yh0-f52.google.com
	[209.85.213.52])
	by mail.openembedded.org (Postfix) with ESMTP id 98CC67162E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Jan 2015 12:22:34 +0000 (UTC)
Received: by mail-yh0-f52.google.com with SMTP id z6so9377531yhz.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Jan 2015 04:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=SRg5jmJYJawEwrkq/g46WSrYeZ7GHgXHJXYLvbtrKgY=;
	b=sifGRMNxKbO7ATrRG1klUOlY/Ed47lNLWPRzLMKWM2r7wcspou289KR2PRFFc9FZNX
	iRJhsaqA3r4vIPhqzcXxKjbw+ygwEgBdRDNYtQIf2qsxpeU+mpEQdwUi7RBbLcIbUN5N
	oEwgs1v6B5HzrfxY0GDvAFuYa0KotlOD5t2z+jvY9M0MiRRptlaUi2bThzwHD2K0bF36
	Js3qSZlmFn29MIKuSwIetsw8zkKlxowaBiSRrWj9xFyaijJCsUbOJpthd6zqQ9gAVq5e
	cst+k1nIiBHOj477uXZBbZctBgamQO9u3fTiu+5vu+rp0hLaqD5Wxj1BqdlajLYiX824
	+8mQ==
X-Received: by 10.236.66.133 with SMTP id h5mr21577764yhd.134.1421065354921;
	Mon, 12 Jan 2015 04:22:34 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by mx.google.com with ESMTPSA id
	t77sm10433497yho.12.2015.01.12.04.22.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 12 Jan 2015 04:22:33 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Jan 2015 04:22:28 -0800
Message-Id: <1421065348-28990-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH v3] libssh: depends fix
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
X-List-Received-Date: Mon, 12 Jan 2015 12:22:42 -0000

the default was to build with GSSAPI enabled.

V3:
remove rdepends

V2:
add PACKAGEGROUP to define enable/disable GSSAPI with
proper depends of krb5

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/libssh/libssh_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/libssh/libssh_git.bb b/meta-oe/recipes-support/libssh/libssh_git.bb
index d21bdc3..47fb39a 100644
--- a/meta-oe/recipes-support/libssh/libssh_git.bb
+++ b/meta-oe/recipes-support/libssh/libssh_git.bb
@@ -20,6 +20,9 @@ EXTRA_OECMAKE = " \
     -DWITH_ZLIB=1 \
     "
 
+PACKAGECONFIG ??=""
+PACKAGECONFIG[gssapi] = "-DWITH_GSSAPI=1, -DWITH_GSSAPI=0, krb5, "
+
 inherit cmake
 
 do_configure_prepend () {
-- 
1.9.1


