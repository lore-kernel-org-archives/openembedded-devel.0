Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f172.google.com (mail-ea0-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id F19176B7D4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:19:37 +0000 (UTC)
Received: by mail-ea0-f172.google.com with SMTP id r16so182402ead.31
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=sodInz7x1eGpg6By3EcNTHv/fTrRXwcIuekWjye5KgQ=;
	b=LytND0Z3FpsQ1G3t0OI+MNkId1zBA03zWvsK5qKtgULxufRmQC5FEnKCiofuBRi5A+
	dujZX91nB7ltDHL1B7bosDDkWp9glxy8o/YXdPlimPdu47QcgR2KEbeAAWUSCdnPjJHo
	jY/3aRR5H+ktk+oQqDYW3+lJ8xb0K1HD+IwpyI/Ru7ROc6WFOKT6khhfxhHIQBL39GJg
	DuBZp887J9akECAuW8LY3ccfp4whu89o2SDBWixL5WkVo7U+BgYQyVD/HkCVm/g2PWFq
	fP0AjaL2t5+yjLt/SL/o8v8AL3hfZ9fTPDiIPhikzmwVLjORdfev03/lJMevEToELNfq
	Fy8w==
X-Received: by 10.15.27.133 with SMTP id p5mr1631211eeu.65.1376551178418;
	Thu, 15 Aug 2013 00:19:38 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	k3sm82002143een.16.2013.08.15.00.19.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:19:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:19:14 +0200
Message-Id: <2363d483b4c9103314b5dd7dd8f40fe2098f8e9c.1376551135.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][dylan][PATCH 34/60] cifs-utils: add PACKAGECONFIG for libcap
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
X-List-Received-Date: Thu, 15 Aug 2013 07:19:38 -0000

* libcap is autodetected from sysroot

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-support/cifs/cifs-utils_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-support/cifs/cifs-utils_git.bb b/meta-networking/recipes-support/cifs/cifs-utils_git.bb
index 19b60ad..dde1cc7 100644
--- a/meta-networking/recipes-support/cifs/cifs-utils_git.bb
+++ b/meta-networking/recipes-support/cifs/cifs-utils_git.bb
@@ -11,6 +11,9 @@ SRC_URI = "git://git.samba.org/cifs-utils.git"
 
 S = "${WORKDIR}/git"
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[cap] = "--with-libcap,--without-libcap,libcap"
+
 inherit autotools
 
 do_install_append() {
-- 
1.8.3.2


