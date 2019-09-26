Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
	[209.85.128.45])
	by mail.openembedded.org (Postfix) with ESMTP id 2124D7D076
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Sep 2019 16:26:50 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id 3so3254899wmi.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Sep 2019 09:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=8xnr3D6i97L9RZZW5n5dDBi5QXalZMgm7xK2XjXK+E8=;
	b=O8oQJ3ufn8D57p9GMpym9YeBEbkl1rwAiyUXRUIwFl4051Uwh9gmUU3FJca6D+dl5z
	yZ5PkMHduICVDQazo/1qFePzHTSfEHui7raVIORVIn8JgP/mQPUTVE8cK5fU4WwrKup/
	0WrPwR/PAKYQV2zcyC69QKFw/lCPlxdtNgHB6IvzKaiZXFAUmNQTpkPDbqc6hgssFcNq
	gI7L0HfhLhWaHsNUo83J/hAKofXaadCgjkiOwW4n+tKUdcVvHyoJDqhXk225IuIccfCa
	ax/zFMJzetu/tM472NLJgVNP0MHquOho1vUkR1noGTEXeGcBcvwSXiZnVlAKAuOlGmQa
	czfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8xnr3D6i97L9RZZW5n5dDBi5QXalZMgm7xK2XjXK+E8=;
	b=cxRZuGx79oOfbfRms+NuXmzG1p+uhBIBfYQVdrCAg+kaIgP/Kyy0lfKSbBVzxiQKPR
	tZU4xZdmImwO+jXmkRfew/95TzBOkOjmGe4V5apfKO6bqkmulY+cyX4X8t2FkaZWlSuF
	KCQnKPijDtT10ZH/F6NO/fV/AOXlNjyt8UPZJaxAOkwyoEJ/q9ws6oUhhrJ2CN+ndsjV
	XNQI+dUY7MJauFnfY3UWtzUKKS29hgZeHUDeaNvrn1wLVHTNWivcdj+2cH7ze6hwpi8m
	Jt/ymYRlT6k/GhbJ1WA8/FknBCy7g8VaCud8ltTahtdiIEX+pCtMfelQAEY5eKYFM3Ph
	XeTQ==
X-Gm-Message-State: APjAAAXz0saTw8ch7mc6pybIiZJdpCvtTgVWQL9tcteRCrAEnXI15CYx
	B5s6LUBp70BZJQLHYW6824whYuPJytc=
X-Google-Smtp-Source: APXvYqwa2HHo8FUCquHE3RF5Nw4JCHRzJDkvfJPWHSc4HlSZhLFTNKOuPxIdnw9UHHxJcKLnmNxWhA==
X-Received: by 2002:a1c:7ed7:: with SMTP id z206mr4040712wmc.124.1569515210519;
	Thu, 26 Sep 2019 09:26:50 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	o70sm3682854wme.29.2019.09.26.09.26.49
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 26 Sep 2019 09:26:49 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Sep 2019 16:26:54 +0000
Message-Id: <20190926162655.375600-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][PATCH 1/2] spice: append -Wno-error=address-of-packed-member only for target
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
X-List-Received-Date: Thu, 26 Sep 2019 16:26:50 -0000

* with older native gcc on host this will break spice-native with:
  cc1: error: -Werror=address-of-packed-member: no option -Waddress-of-packed-member

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-support/spice/spice_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/spice/spice_git.bb b/meta-networking/recipes-support/spice/spice_git.bb
index 30e939ac07..2829a59d15 100644
--- a/meta-networking/recipes-support/spice/spice_git.bb
+++ b/meta-networking/recipes-support/spice/spice_git.bb
@@ -37,7 +37,7 @@ DEPENDS_append_class-nativesdk = "nativesdk-openssl"
 export PYTHON="${STAGING_BINDIR_NATIVE}/python-native/python"
 export PYTHONPATH="${PKG_CONFIG_SYSROOT_DIR}${libdir}/python2.7/site-packages"
 
-CFLAGS_append = " -Wno-error=address-of-packed-member"
+CFLAGS_append_class-target = " -Wno-error=address-of-packed-member"
 
 PACKAGECONFIG_class-nativesdk = ""
 PACKAGECONFIG ?= "sasl"
-- 
2.17.1


