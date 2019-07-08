Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1AC8E60685
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jul 2019 00:53:46 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id m8so4631246lji.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Jul 2019 17:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=Xz1bpiNRNwgSqCDk5NCbLiRX7x09SuC1g+oM4iMmwKY=;
	b=pLiZGmP+wu6g2vdX+DElQl50barK20h7WNQWNo1oLQ2K43OKQX6yJ4TujdecxIyOMy
	PeNjn4+YCjNGySEcVm8yIRKIefFseFujRv2awiG+1dJE3pB8tzoHLn5FYkJz469NGj4D
	o3TssBxnaiW8KWpMdRPk51t6Ls0wq156MFavFt4/4B+YgTtygpvqEl5luAKWtSaAAHpC
	SrJALnO1+JqVzin75TQNuJViOQU/xPaiTuQi8gCKEwWdqw+VskJRV/3mIc9fJ4IkKP0U
	tsx6VJK4FmEbcgmXkYDwdWZ4MXs53Z5Fz1vsF1DVUO9ovNBSO31Il99Hg15nke7SZESP
	rJ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Xz1bpiNRNwgSqCDk5NCbLiRX7x09SuC1g+oM4iMmwKY=;
	b=tSbkVDpIliir428imzge1xrb57rx3QVp+lDIo+5cft4QEom4trbE6RT+hQwojWhDgp
	mqhte4nDx/zAR9oql2jAgTvfoFa82i1UHnKEaxlx+Ut7W5/W7HkK581lSWBfn6lLjc6L
	YpSvL3JBKD+AYP+BKRXKeewSAYT5yXK8YqA7b3pKwzUUjr3f8AJ4/kqm9yquoxnuPHr9
	tSGsHTfr3kg6tMFFQdsrmlJ1OqVuxyXxnS/cz0F8ZSmTEQsP5pzH4Yo1aHnfSNBi2b1f
	ACgw25EwfJE1kSL9lf9Hf0NS2ptcQJb6kODBIwcz+FsDTsZJXW2+SRK0KMZuGTB1cYhn
	ndVQ==
X-Gm-Message-State: APjAAAXdeSgAa6H1V7Y+jKOI+SwCznNBoaq7nY2vBQF77qz30anEbX3H
	V2bOGJQDL4ln5DMK84j4U0MMMdxQ/e4=
X-Google-Smtp-Source: APXvYqwxpn7OuY0qg3c7GWj3rbldWHi8YLU5xk2iDlw8MJdOmtdG7Uul5o/uQasj1+SngXc62PbDzw==
X-Received: by 2002:a2e:3c1a:: with SMTP id j26mr8628429lja.230.1562547227341; 
	Sun, 07 Jul 2019 17:53:47 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	s19sm3291947lji.38.2019.07.07.17.53.46
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 07 Jul 2019 17:53:46 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Jul 2019 02:53:45 +0200
Message-Id: <20190708005345.6211-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] ipvsadm: update to 1.30
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
X-List-Received-Date: Mon, 08 Jul 2019 00:53:47 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../ipvsadm/{ipvsadm_1.29.bb => ipvsadm_1.30.bb}            | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-support/ipvsadm/{ipvsadm_1.29.bb => ipvsadm_1.30.bb} (90%)

diff --git a/meta-networking/recipes-support/ipvsadm/ipvsadm_1.29.bb b/meta-networking/recipes-support/ipvsadm/ipvsadm_1.30.bb
similarity index 90%
rename from meta-networking/recipes-support/ipvsadm/ipvsadm_1.29.bb
rename to meta-networking/recipes-support/ipvsadm/ipvsadm_1.30.bb
index 4f3c16dc3..22cb88ac1 100644
--- a/meta-networking/recipes-support/ipvsadm/ipvsadm_1.29.bb
+++ b/meta-networking/recipes-support/ipvsadm/ipvsadm_1.30.bb
@@ -16,14 +16,14 @@ LIC_FILES_CHKSUM = "file://README;beginline=40;endline=56;md5=b4e40069f15598d0e3
 
 DEPENDS += "libnl popt"
 
-SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/utils/kernel/ipvsadm/${BP}.tar.gz \
+SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/utils/kernel/ipvsadm/${BP}.tar.xz \
         file://0001-Modify-the-Makefile-for-cross-compile.patch \
         file://0003-ipvsadm-remove-dependency-on-bash.patch \
         file://makefile-add-ldflags.patch \
 "
 
-SRC_URI[md5sum] = "88b35030b4766b3e44ad15aacdef65c4"
-SRC_URI[sha256sum] = "297f5cd459c3eef81ed0ca32e53bf320ed6b132fe7ed6ea5e44aa6b1fbd2a7de"
+SRC_URI[md5sum] = "97f11b6af1920fde5a9d9eac0d7f9e50"
+SRC_URI[sha256sum] = "95573d70df473c9f63fc4ac496c044c69e3a6de7ccac119922210c0b44cd7a0c"
 
 UPSTREAM_CHECK_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/ipvsadm"
 
-- 
2.17.1


