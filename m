Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 79B0B65D57
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Aug 2014 11:14:17 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id f8so7763837wiw.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Aug 2014 04:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=b9sJfx2ZekOp73SDvmVg2H96oXpiMHcLFO+SYfmJYiU=;
	b=tuQLs/db7ucDogOXOR5LJ6Tmfx88EEt5Hb7Zq9Pi3mmzSiayQvrwJ8K/bIv6Lw+7tv
	dDJ9jNZ1cB8KnvPIE+Ic3CgUawQYCrqD+AUEIfkuK9lrVjEm9tZlyOM16xmq6wS/B9GJ
	CklPYkG7Y6mQb64SNbf1Msa7F2azH/Zar7NXfx17HxR22eDtGHPwIF69kWat53fgajw4
	5aCmNWZQc/KbzdkLDO7Taa3q9bT/dFsuRL48oEd3ACjBm5v6xB2nUxFJqSD66T1j6gY3
	dTT32/BLXDeq3RJPBn/IIRPYXkPBElho1CGq5g9IP+7G6mvJH5yw4fFe+awSqYsr6pLd
	fc+g==
X-Received: by 10.194.84.69 with SMTP id w5mr5049435wjy.0.1407237257190;
	Tue, 05 Aug 2014 04:14:17 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	td10sm6759444wic.10.2014.08.05.04.14.16 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Aug 2014 04:14:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Aug 2014 13:14:42 +0200
Message-Id: <1407237282-24497-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
Subject: [meta-oe][PATCH] ltrace: add PV and PACKAGECONFIG for libunwind
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
X-List-Received-Date: Tue, 05 Aug 2014 11:14:22 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../ltrace/{ltrace-git => ltrace}/ltrace-0.7.2-unused-typedef.patch    | 0
 meta-oe/recipes-devtools/ltrace/ltrace_git.bb                          | 3 +++
 2 files changed, 3 insertions(+)
 rename meta-oe/recipes-devtools/ltrace/{ltrace-git => ltrace}/ltrace-0.7.2-unused-typedef.patch (100%)

diff --git a/meta-oe/recipes-devtools/ltrace/ltrace-git/ltrace-0.7.2-unused-typedef.patch b/meta-oe/recipes-devtools/ltrace/ltrace/ltrace-0.7.2-unused-typedef.patch
similarity index 100%
rename from meta-oe/recipes-devtools/ltrace/ltrace-git/ltrace-0.7.2-unused-typedef.patch
rename to meta-oe/recipes-devtools/ltrace/ltrace/ltrace-0.7.2-unused-typedef.patch
diff --git a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
index 89f760a..77790b5 100644
--- a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
+++ b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
@@ -9,6 +9,7 @@ HOMEPAGE = "http://ltrace.org/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
 
+PV = "7.2+git${SRCPV}"
 SRCREV = "f44b28421979cec88d6d6a778fc27a8cd514f508"
 
 DEPENDS = "elfutils"
@@ -20,6 +21,8 @@ S = "${WORKDIR}/git"
 
 inherit autotools
 
+PACKAGECONFIG[unwind] = "--with-libunwind,--without-libunwind,libunwind"
+
 do_configure_prepend () {
 	( cd ${S}; ./autogen.sh )
 }
-- 
2.0.4


