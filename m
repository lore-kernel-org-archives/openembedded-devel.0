Return-Path: <max.oss.09@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2BEEB731A1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Feb 2017 21:49:31 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id o16so29170271wra.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Feb 2017 13:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1jlpm8yzPwPbagWsPwbE4q0ua8jIruS29ElBH5BbZQM=;
	b=f17O2XY7eEvs9x/lTK02ntuKPXS7OKMTyDRNGduqPsukoYQkL6AKfZ31qVcdFjpTp+
	eksqIdWCZTzKRyWQHUurlos0c81e0MFjyg8mLxGl8MOnrUqpeLSTqx53HM2dUT7DT2zO
	ga/qRIQsB67UniDWIXaRouEXSwen7NaBpIITeor55v2EsESg1IVh2h5/9TvhEZzwTyD4
	Y+3YdGcbrXyad8TCrkghejO1IQb/uExLjuU7wuVKJ0DMki2rKyBijcUBqdr6/EOh4KU2
	svNm0UqlHYIN0MvtHYure5eLQqBx+TzO6GLUeFyjdCXayB37DnUnSZo2VnfjYRJOYYxU
	mYoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=1jlpm8yzPwPbagWsPwbE4q0ua8jIruS29ElBH5BbZQM=;
	b=TqRFVuu0k2yuL3sGD+xt9Iqi3qcFctkh05z/9ugO8YQC6pnfEqT8KyCNlu1bykzFAD
	aNly2QxccBHhE6/GzQFCDPwQLKI+8FEe2UJH+B9xE6kGVZMBz+ab0fkBuIGlVi4Ahyrh
	k0Vk28quqXtS3ml6960Or0KsgOnZ0lO8yvE2+isLXI+9fStF0AuEF01o26vSWYZOuemp
	+MmB/u+muA3iqaPl5h/0/NdO1rEnRg4qmZleQWetQ0NbeMxCZ99bNHyyEuLIwBIfUOr5
	2uE12r9BSKuTbudSYv0SRlrZglrYJ98qf5edfPhfwM6h9QEU3Ea0g1DR/FViTNFTPi19
	TQDQ==
X-Gm-Message-State: AMke39mxxAXjdcyD2XI/FgpzH05E4B8s4sX/niU8MCCoK+vWO9DccvZVL4MGAcl2ni7Low==
X-Received: by 10.223.165.138 with SMTP id g10mr28358468wrc.105.1487108971708; 
	Tue, 14 Feb 2017 13:49:31 -0800 (PST)
Received: from Saturn.local.all ([194.191.225.83])
	by smtp.gmail.com with ESMTPSA id
	u47sm2355480wrb.15.2017.02.14.13.49.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 14 Feb 2017 13:49:31 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 14 Feb 2017 22:48:58 +0100
Message-Id: <1487108941-20285-2-git-send-email-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1487108941-20285-1-git-send-email-max.krummenacher@toradex.com>
References: <1487108941-20285-1-git-send-email-max.krummenacher@toradex.com>
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [meta-oe][PATCH v2][master-next 1/4] python-m2crypto: rdepend on python-typing
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
X-List-Received-Date: Tue, 14 Feb 2017 21:49:32 -0000

python-typing is required at runtime, not at build time.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 meta-python/recipes-devtools/python/python-m2crypto_0.25.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-m2crypto_0.25.1.bb b/meta-python/recipes-devtools/python/python-m2crypto_0.25.1.bb
index ca46222..72523bd 100644
--- a/meta-python/recipes-devtools/python/python-m2crypto_0.25.1.bb
+++ b/meta-python/recipes-devtools/python/python-m2crypto_0.25.1.bb
@@ -12,7 +12,8 @@ SRC_URI += "file://0001-setup.py-link-in-sysroot-not-in-host-directories.patch "
 PYPI_PACKAGE = "M2Crypto"
 inherit pypi setuptools siteinfo
 
-DEPENDS += "openssl swig-native python-typing"
+DEPENDS += "openssl swig-native"
+RDEPENDS_${PN} += "python-typing"
 
 DISTUTILS_BUILD_ARGS += "build_ext --openssl=${STAGING_DIR_HOST} -I${STAGING_INCDIR}"
 DISTUTILS_INSTALL_ARGS += "build_ext --openssl=${STAGING_DIR_HOST}"
-- 
2.6.6


