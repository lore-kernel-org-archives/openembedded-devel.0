Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 998627DD6E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jun 2019 05:24:49 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id x15so5017252pfq.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Jun 2019 22:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=h/dSKzsr7e4qjANjzkcAwqJZfLboQpgin37C3JpddNE=;
	b=CH3VdpVVhuHcW4/ePMoO34S3CsQqJEhUNuDBhNGmJX7eIp20jdZwADMF3CMtmJxdRA
	Wi0vhh8t3BCx8BFp5C6XhrF2SV04240tKxtGCk3xetssUKcq/QtLALABeDOjda2H5RXQ
	4zbD9zRxUBNx2WTmBckpSHYG3Hdu2RQr3eQyw/fHB3Et610aC0bhCa6YIscwlRul/Iqm
	BuXLLPamNvJSPtvO/if6TQcmFOZdZN1yUhmA3E7cNkXHrFXi9FrYdY+KoiPfjN/oYVzb
	e1VAm7/i764KvKWsyPidJDtMlGj+s4lY1bBZPN1fuZBwp/789SGiDAGxzh6/qK5SvIKE
	vbuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=h/dSKzsr7e4qjANjzkcAwqJZfLboQpgin37C3JpddNE=;
	b=eSgG4C8xvK5bwVV97T1jKIQqPtDIUUO0F6onPwx54H6CAieas9N8kSt7LcMMXth3NI
	hgIEnPl9aTVWmlCcl2i2WOMAABYociGTYVhajx8Ek6KLOA089pxf2PG57At2v4paTbNm
	Ilr06wFAo0kXDjYPUUO0Hl+el6TReg56rD0JCEs5DkVorVbZ50RG173TAXAAaLm4vQ9P
	W0cWIJmDXv11rEFmc+RZ8LoDeXzw8puUPKL9YnfCu5wv3V0Z/eypWNqnWomHKlhebMfx
	zcyRg1qUsr+OUXUaf3DMU3ntWf/oSoE4o3routqtbNx1fk52U6Ta7b2mhS/rA/1bUmEW
	7vsw==
X-Gm-Message-State: APjAAAXadmQxtk0+0cOAiGYALno9jo9RMRtxE0fcsDTNvSO4VxhQ3ae2
	NvuQ6wqnlSYioH2pkHEkX8Ha+Kg3qZY=
X-Google-Smtp-Source: APXvYqzCfZAv8JlAPz52kpgrouEicECHpqK3ipVp8gcObsBD6qlsKRmaJ8qkr0srStW8FtMUYqrZiQ==
X-Received: by 2002:a62:d44f:: with SMTP id u15mr27325815pfl.33.1560749090403; 
	Sun, 16 Jun 2019 22:24:50 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::3c7b])
	by smtp.gmail.com with ESMTPSA id
	c124sm10156911pfa.115.2019.06.16.22.24.49
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 16 Jun 2019 22:24:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 16 Jun 2019 22:24:40 -0700
Message-Id: <20190617052440.18958-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190617052440.18958-1-raj.khem@gmail.com>
References: <20190617052440.18958-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 3/3] stressapptest: Use git SHA instead of git archive
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
X-List-Received-Date: Mon, 17 Jun 2019 05:24:49 -0000
Content-Transfer-Encoding: 8bit

git archives get regenerated randomly so lets use git fetcher instead

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../stressapptest/stressapptest_1.0.9.bb                 | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-benchmark/stressapptest/stressapptest_1.0.9.bb b/meta-oe/recipes-benchmark/stressapptest/stressapptest_1.0.9.bb
index aa1bf1cd32..a2966e99dd 100644
--- a/meta-oe/recipes-benchmark/stressapptest/stressapptest_1.0.9.bb
+++ b/meta-oe/recipes-benchmark/stressapptest/stressapptest_1.0.9.bb
@@ -9,14 +9,13 @@ SECTION = "benchmark"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=55ea9d559f985fb4834317d8ed6b9e58"
 
-SRC_URI = "https://github.com/${PN}/${PN}/archive/v${PV}.tar.gz \
+SRCREV = "fb72e5e5f0879231f38e0e826a98a6ca2d1ca38e"
+
+SRC_URI = "git://github.com/stressapptest/stressapptest \
            file://libcplusplus-compat.patch \
            file://read_sysfs_for_cachesize.patch \
           "
 
-SRC_URI[md5sum] = "d3a526c174c049dd7a1068dc74a62be2"
-SRC_URI[sha256sum] = "2ba470587ad4f6ae92057d427c3a2a2756e5f10bd25cd91e62eaef55a40b30a1"
-
-S = "${WORKDIR}/${PN}-${PV}"
+S = "${WORKDIR}/git"
 
 inherit autotools
-- 
2.22.0


