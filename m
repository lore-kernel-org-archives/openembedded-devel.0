Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 26A596B7D2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:20:05 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id c13so180492eek.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=95dNGJYqM4MvEFiAYPkeEyebbkRXKrxQ/8OygNy9PGY=;
	b=PGOvZZWRVlLZve2BLroONzokREEg4Z+b0SG57dTlIp8TkSBmkVsyJQWNCvd0Mhjo0G
	2b+Jm31EdN1HiTWKhzbNHF/vxmtWNoiXGyS32W4rw4IgYk6+FrAK6IAaulKYdRFrYksQ
	Df8TXUMAjZXMw6a3IGXXgkJr3x7ZKABjhmpzlZPO0PQG14Sz6xdqy6K/G2fsLmttXQcX
	G21WU2xIO2kjYGLMqKKWCjdDD2ummRiGsxcbFxcXr5xuwv8qXnHCBybNsb9pICN3+Ztt
	EPDfMGZLCfdJ8dUTOhTc+mAkE9YQjM6vINBXt2gSAIuEen7OXJCa3ovAOAuKbYC+5PfO
	f3Ow==
X-Received: by 10.14.102.72 with SMTP id c48mr2811635eeg.52.1376551205573;
	Thu, 15 Aug 2013 00:20:05 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	bq1sm81939251eeb.9.2013.08.15.00.20.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:20:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:19:34 +0200
Message-Id: <231a1b03401268dd134de7719c40ae7fa1861429.1376551136.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][dylan][PATCH 54/60] openldap: add dependency on util-linux
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
X-List-Received-Date: Thu, 15 Aug 2013 07:20:05 -0000

* openldap-slapd was sometime depending on util-linux-libuuid
  add dependency to explicitly enable it

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/openldap/openldap_2.4.23.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.23.bb b/meta-oe/recipes-support/openldap/openldap_2.4.23.bb
index 55b0d06..06896d2 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.4.23.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.4.23.bb
@@ -20,6 +20,8 @@ SRC_URI += "file://initscript"
 SRC_URI[md5sum] = "90150b8c0d0192e10b30157e68844ddf"
 SRC_URI[sha256sum] = "5a5ede91d5e8ab3c7f637620aa29a3b96eb34318a8b26c8eef2d2c789fc055e3"
 
+DEPENDS = "util-linux"
+
 PR = "r1"
 # The original top.mk used INSTALL, not INSTALL_STRIP_PROGRAM when
 # installing .so and executables, this fails in cross compilation
-- 
1.8.3.2


