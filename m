Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 05FB1786BF
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Dec 2017 11:08:35 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id z34so9674730wrz.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Dec 2017 03:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=+72zR09dhRqDBJcfSTk952h9X4FRekcEuvoGzRhWiK4=;
	b=kxOktU6WT/VEsQoQO1p6OKvphPqMKTMtUjEPzUmxobb1V8ktxLXMO+AAbWcJIH1iYz
	JHjb/us8Lu+CD/P+NUZhA4jkZmsZu7g/CUI3qtJIsoYTr90URFAbme2I7G/sELEe8xK2
	eaJOVoAXO0TLDUtE4M5EL3jSf/MaG15+EcT3bYhu9/qP3fpanLAcDmKO2xoZ6GrCimqx
	6ufzmDx0cVT+DhaceWWY/gYjnkALEUBBN6pHF7gYQbB1+dROoahUwN5zGPwEMcrCr7pL
	YY0WVggbncEHxnxpj3wi3lq82EInqK0uOiovrsHp5erUpwQnLgl/+3JyzKQWqbRn47sK
	BCvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=+72zR09dhRqDBJcfSTk952h9X4FRekcEuvoGzRhWiK4=;
	b=KPxqZFQHiPRMA0tvdORSZzt67/WcXl+0pqVGDfQAuk3YtqL9Wx0zKXgu1Sw8/1ePNp
	bjs7uL3lqfftH2dGP7o+dMkZqis1LimTAIR8KHCBqZtxQRDDOIf0vqLfE0qnWiNacN7p
	3Oh9+wgPZpXzQNZ+252GB5esJzg8+NPXy5aEiDF7Mc0S7S2QvA4/tr2/zMMCciUwD55r
	o2fIvq36BxsfhmELz/cDk9ni6ejf6CR8mzeCspdjedEUmB/+3B/qNtaS5NA2oEV8fmDA
	LYLdQdoyE3d416obx6fYDFigcfw/Q+lD5DGLC80Q/7XHd4znnSCIRz1S7GIzMAejk3wY
	aPJw==
X-Gm-Message-State: AJaThX5H59lsspyQYNC5VwClthKD0Fn95TPkGdm6BvyA05bLf7aPqJn5
	eMVMrpRs66WKjoQPKWZQR8rSKA==
X-Google-Smtp-Source: AGs4zMbnYPmF6s8e2nc4UoKycSpP9b6dkiEEJO8AtkzRLMGK1KIHG93rJKxamKSfMAJN9vMtdrB8LA==
X-Received: by 10.223.147.133 with SMTP id 5mr4722041wrp.230.1512126516341;
	Fri, 01 Dec 2017 03:08:36 -0800 (PST)
Received: from mueller-a-nb-linux.zera.local
	(ip-88-152-111-130.hsi03.unitymediagroup.de. [88.152.111.130])
	by smtp.gmail.com with ESMTPSA id
	a126sm791054wma.11.2017.12.01.03.08.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Dec 2017 03:08:35 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Dec 2017 12:08:16 +0100
Message-Id: <20171201110816.13519-11-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20171201110816.13519-1-schnitzeltony@gmail.com>
References: <20171201110816.13519-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 10/10] fftw: Let dev-packages depend on libraries created
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
X-List-Received-Date: Fri, 01 Dec 2017 11:08:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Without libraries installed dev-package is useless.

Tested by buildung an image with fftw-dev included.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-support/fftw/fftw_3.3.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/fftw/fftw_3.3.7.bb b/meta-oe/recipes-support/fftw/fftw_3.3.7.bb
index 310d726..aae6ec9 100644
--- a/meta-oe/recipes-support/fftw/fftw_3.3.7.bb
+++ b/meta-oe/recipes-support/fftw/fftw_3.3.7.bb
@@ -75,6 +75,6 @@ FILES_fftwf-wisdom = "${bindir}/fftwf-wisdom"
 FILES_fftw-wisdom-to-conf = "${bindir}/fftw-wisdom-to-conf"
 
 FILES_${PN}-dev += "${libdir}/cmake"
-RDEPENDS_${PN}-dev = ""
+RDEPENDS_${PN}-dev = "libfftw libfftwl libfftwf"
 
 BBCLASSEXTEND = "native"
-- 
2.9.5


