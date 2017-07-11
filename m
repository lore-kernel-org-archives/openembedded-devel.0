Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3364A77FED
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 16:45:31 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id g21so791370lfk.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 09:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=oiUZdGnz0edHG9t4ytXv+p0RIjQ1L6AlbwSf/iE/wiY=;
	b=OBBUT4HQJzz/HJ+YpWM+9Am400Dy/vLab7nSQRC4sS5SmAwHRvBxMBdDdujEu3Tei+
	ImzeKGsxgOXGBIGd5UUZwCHNctNpRLRGs3xfmldBYrPyErKleWChkYdpaYm1z/Twq/Xf
	jt7LYoL9Hd4luPJIOLk+9WV1ILHNj4SbjD+DR06qqV7ThfTH4i+mIr356dC3zeYJAwbR
	3FP0TAzU7CAccFUikMHrFSpiJhl/KSeDkf24X8dF1PkBuhcu4BH+og/Ndxp2E9F5MGq2
	KjluClCtz+czH7cSrRvrhOCaVJzN1P8hWdJBnXROWZGMqB3T+4mSMh4o6DgOt74lBn65
	T0EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=oiUZdGnz0edHG9t4ytXv+p0RIjQ1L6AlbwSf/iE/wiY=;
	b=IvyVTspE1pqp069sBB8tHCySrbHOupiJiOIHH526Vk4Z5fMIFk+L1KLdBoZS6AmNsp
	lWoG/30AJruOPB8ajLAsZhbWsznsHZjWDAdgqh81ybFw1AvoGQ7iPB0p1djEjSXjQagn
	dvriuEeQUpjl+BQxW4QNZjSbAohLods5tDMx/HJzZkkiet7CSRjncA7vSwTmn1HKqNUN
	x8ePiKdA2Zx6PeXTxEl5Ob+e8vixTXeROnqER6JwqXe/AavMYUh7XokxsAVmpAyIWDOj
	UWfUNRlCIaPydTGdwPqNTb80sb93eIQ/9EQgH64FR3Lz+h3D9Lt8zOFAgu3cDQTL3bw3
	0u2w==
X-Gm-Message-State: AIVw111q90x/pt7/cEgU04khuPcZNJdfQh8Rf4BrmCBNc3P43pxSIEEI
	76NY3CatBNxlSsZMdl0=
X-Received: by 10.80.151.219 with SMTP id f27mr3178933edb.126.1499791532806;
	Tue, 11 Jul 2017 09:45:32 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([27.191.203.112]) by smtp.gmail.com with ESMTPSA id
	p19sm1224952eda.15.2017.07.11.09.45.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 11 Jul 2017 09:45:32 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Jul 2017 18:44:38 +0200
Message-Id: <1499791478-2407-9-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1499791478-2407-1-git-send-email-liu.ming50@gmail.com>
References: <1499791478-2407-1-git-send-email-liu.ming50@gmail.com>
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [meta-oe/meta-perl] [PATCH 8/8] po4a: add full functionalities
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
X-List-Received-Date: Tue, 11 Jul 2017 16:45:32 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

Add the following dependencies to DEPENDS and RRECOMMENDS_${PN}, to
let po4a and po4a-native work with full functionalities:
- libtext-wrapi18n-perl
- libterm-readkey-perl
- liblocale-gettext-perl
- libunicode-linebreak-perl

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta-perl/recipes-perl/po4a/po4a_0.49.bb | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/meta-perl/recipes-perl/po4a/po4a_0.49.bb b/meta-perl/recipes-perl/po4a/po4a_0.49.bb
index e52e5f7..5db5b8f 100644
--- a/meta-perl/recipes-perl/po4a/po4a_0.49.bb
+++ b/meta-perl/recipes-perl/po4a/po4a_0.49.bb
@@ -13,8 +13,21 @@ SRCREV = "79ed87a577a543538fe39c7b60079981f5997072"
 
 S = "${WORKDIR}/git"
 
-inherit cpan_build
+DEPENDS = " \
+    libmodule-build-perl-native \
+    libtext-wrapi18n-perl \
+    libterm-readkey-perl \
+    liblocale-gettext-perl \
+    libunicode-linebreak-perl \
+"
+
+RRECOMMENDS_${PN} = " \
+    libtext-wrapi18n-perl \
+    libterm-readkey-perl \
+    liblocale-gettext-perl \
+    libunicode-linebreak-perl \
+"
 
-DEPENDS += "libmodule-build-perl-native"
+inherit cpan_build
 
 BBCLASSEXTEND = "native"
-- 
2.7.4


