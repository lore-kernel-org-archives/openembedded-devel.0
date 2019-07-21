Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id 92E0E7EED4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 16:39:36 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id az7so17956707plb.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 09:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Eb3gzqiXTl2fGm+Psf6+hQHQMZx5ninpDJQBHYNnv70=;
	b=MGnH2Jsej/xzvBHr8ZodjjNQufujK0+kghdbuFKlPmo/gARtAjzwS28vEEWOBaq15Z
	eLoJ9SdMTLp5kO7G2h3W/xjFotznxWOnUsyLjgkWBUpwToMNAKxrsyfByK4Z1JHzrnrQ
	ztfAQGJGKq0PTIliYs4MxYVr0mzzp18NdAkNBaD+InCM1O0mv6jkQXT3n9k16h5eJc/x
	cDSShq4gMYEuB8fgZ4NRtxKXbAmJmOHn/6WNhQ2Cj/xqzFrCZU5pZ3JPJq14qO7ENh1W
	MryhqMmibLS02+CNezCM2zGSGH/OTXSP2dSpBcRjUjKc9tadHIQ9h29deU3NV2AKmzQJ
	EgyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Eb3gzqiXTl2fGm+Psf6+hQHQMZx5ninpDJQBHYNnv70=;
	b=nvYK6gopazKpFPCI9qO+ucwjsog9glUPlOU/IVsYC2psM7XAPMvkd+o1izGuO6ybsa
	Zj9u8tRKt4rao4Mk17xIuZrseAXVf2vsFv49GOzxS6HcxshNVqKRC4+g941dQAFI/cx0
	ppEu8GxX7cAuvy+VTI7Q1ZOJTuHuCcw3KpuX3FjK33eY5bdmmbZSqSsuTnrp+yL0tbm/
	fORri53EkFAzHIB4H1uBtSONzjb+SHvAxHeU56mRvMiL7xaezwSepqL9iw97DJ1D6prH
	86R/IGnZt90uUMLmO2mWXFyWTjFqUwxMh00v01n7Tg9AXYUJ6E6l7pQcYkL4gL5Yrmnt
	QuUA==
X-Gm-Message-State: APjAAAV8GpB5rMwkJjY0y3N53/uYFKYjEK+htiSbuzOkw767NfuzVomD
	+8kuhFlA2SUTfd/mL2f8Ep3UJCwrns8=
X-Google-Smtp-Source: APXvYqwtIrVMmSNcZZO53D0IB+BamNplj8IJC/RFB+5LfOiuvZHiDYIfxNJso8NzJFbzV0/qYUUZeg==
X-Received: by 2002:a17:902:16f:: with SMTP id
	102mr68192750plb.94.1563727177538; 
	Sun, 21 Jul 2019 09:39:37 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	35sm38763285pgw.91.2019.07.21.09.39.36
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 21 Jul 2019 09:39:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Jul 2019 09:39:17 -0700
Message-Id: <20190721163919.32659-12-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190721163919.32659-1-raj.khem@gmail.com>
References: <20190721163919.32659-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 12/14] usbctl: Switch to git fetcher
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
X-List-Received-Date: Sun, 21 Jul 2019 16:39:37 -0000
Content-Transfer-Encoding: 8bit

github archives are not reliable

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/uhubctl/uhubctl_2.0.0.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/uhubctl/uhubctl_2.0.0.bb b/meta-oe/recipes-support/uhubctl/uhubctl_2.0.0.bb
index f5d1285000..62028a96e8 100644
--- a/meta-oe/recipes-support/uhubctl/uhubctl_2.0.0.bb
+++ b/meta-oe/recipes-support/uhubctl/uhubctl_2.0.0.bb
@@ -6,9 +6,9 @@ DEPENDS = "libusb1"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "https://github.com/mvp/${BPN}/archive/v${PV}.tar.gz"
-SRC_URI[md5sum] = "5c711911d766d76813333c3812277574"
-SRC_URI[sha256sum] = "4c31278b2c03e5be5a696c3088bc86cf2557a70e00f697799c163aba18e3c40e"
+SRCREV = "6e05aee30e348ae2fd13ce8bfaa10f4f7d45d66f"
+SRC_URI = "git://github.com/mvp/${BPN}"
+S = "${WORKDIR}/git"
 
 # uhubctl gets its program version from "git describe". As we use the source
 # archive do reduce download size replace the call with our hardcoded version.
-- 
2.22.0


