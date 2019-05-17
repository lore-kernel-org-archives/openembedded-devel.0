Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id 1617874813
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 May 2019 09:30:30 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id h4so6354488wre.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 May 2019 02:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=u3SEAqFMIwAZaPuajhI8XTlmOQxvWkcmpVh9BbYsRYQ=;
	b=rwGpntZ4773kpPdK9CWbKcaDIIK3ZOj3AiADxLm9O3tjixK/PkduDbrF/Ixk/tXLTD
	WUxFnduh2pLRd8Drs7owwdOaHyNq2cfRXCX4ssFd5Z2LDYw+N3LC78tMFeN+LDvCrwMQ
	rg8dxmGJfQ/wEVppLzTlmVqi5KEpPYS/W5DrYEFlnVtV6JjFYD7MdqjuXrlIprobpnqh
	PFZSVTxnEEjFPWD/i+urmFav59qgg3fRcV/GVCu+IVrQqm7UTNGTcQoNGXo3WGDK5wD+
	t3NKt1Y+wSrg2Z8U3VirCA7pf1eneDupJP49XRowqYI9fDCKM8iYud9M2afjvLP0Qn0O
	3iIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=u3SEAqFMIwAZaPuajhI8XTlmOQxvWkcmpVh9BbYsRYQ=;
	b=V7XvTCLWKQZ0S61xAEiL93tiU1qRUh42xBNNTFb6i438ib7aktRpka5QHiJyHqYaUK
	OAcE7Cqe7+jLhTZehCu7BL2adc2AqIL1UcF+278wkAU5JZnOn2WQHWXLHlkupSoL4lcz
	BKZkBZACj0LtsASjdXmmnWdFHo6E4i93k2kT96/s6pn7IizGzlmrycoDkLB8evMTZ02L
	CvPVC7XWHLdE3kkkofs4YCJ/UIVElvEqzcOqQJDpD5H1CyAojQN4Yp0jKppdCbXfV7OB
	tUpTqNkJXlwHcujIYERAqzgR+hxbU8P8drqjnZwA3ZTeG4FHsSkUg3G3QAgTfOthPRPy
	A0Iw==
X-Gm-Message-State: APjAAAUf8krwoqp+nXytorqaBQKHUo0SxCgHyXewBHm06swaIcEq9djx
	PSdJlUn0zJ0Px1TrK2Yq+kq9uTpY
X-Google-Smtp-Source: APXvYqzPurjKLygwl89a5cKpkneU9mGMK0U116OuvqMMPXNg6LqTJkYWS4vooVyE3uHwxeia4IqwbQ==
X-Received: by 2002:adf:cf0e:: with SMTP id o14mr19702131wrj.230.1558085430672;
	Fri, 17 May 2019 02:30:30 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	d9sm10214037wro.26.2019.05.17.02.30.29
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 17 May 2019 02:30:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 May 2019 09:29:38 +0000
Message-Id: <20190517092938.621-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] mscgen: fix SRC_URI for multilib
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
X-List-Received-Date: Fri, 17 May 2019 09:30:31 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/mscgen/mscgen_0.20.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/mscgen/mscgen_0.20.bb b/meta-oe/recipes-support/mscgen/mscgen_0.20.bb
index 6ead015f85..276ad201fd 100644
--- a/meta-oe/recipes-support/mscgen/mscgen_0.20.bb
+++ b/meta-oe/recipes-support/mscgen/mscgen_0.20.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.mcternan.me.uk/mscgen/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b1e6a340187c1cf716513439d07c1d79"
 
-SRC_URI = "http://www.mcternan.me.uk/mscgen/software/${PN}-src-${PV}.tar.gz"
+SRC_URI = "http://www.mcternan.me.uk/mscgen/software/${BPN}-src-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "65c90fb5150d7176b65b793f0faa7377"
 SRC_URI[sha256sum] = "3c3481ae0599e1c2d30b7ed54ab45249127533ab2f20e768a0ae58d8551ddc23"
-- 
2.17.1


