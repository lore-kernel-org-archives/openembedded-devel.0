Return-Path: <brgl@bgdev.pl>
Received: from mail-lf0-f53.google.com (mail-lf0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id E1C6F7846B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Sep 2017 11:05:10 +0000 (UTC)
Received: by mail-lf0-f53.google.com with SMTP id d17so33202934lfe.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Sep 2017 04:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=FLKgRfjetUxXorFoAkhj9bQlmPr04d2rBZLLsFbOpyU=;
	b=s2t9UWCwiCQh5b09LejOZQmUdWM9DTkboqnsW37Y6wzSdbGViWYaEBvWuvORA0ej7P
	PNpfWS/+dXQbwi56TPhq7hnmPRboHPSBMkG5X0hKc8tktE9su+6orcHlm1kreTTvpOGV
	NDjCpaBd2mZ+1J3OC0kQZ9MWSK26m4axcSjQl/8nFHsqiBFdlZPawRIAEFJCeEFgQQhB
	LvmEmg1SWYXWqoGMur1GN6XCQrknlG0ckebto51ifrqsbGH9wgQt3T52oCmkPGEdrMXh
	XlZe6SIpL2JvGOM98qIOJbVoh2sWd5Rp5uhLYUYWtZBBeshvMqmW8KrgvHwAr77tsiZQ
	OvSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=FLKgRfjetUxXorFoAkhj9bQlmPr04d2rBZLLsFbOpyU=;
	b=P4ZESdG5w9XUjVsZtx37Rn/wxNrK1ZZamtN/AwW7wu3tNBfcFfuzYoAOYk6id7fOM7
	J/19NnmyCezCLoIgMzsZTC9gNn3iWvkIWuWvwMl0BzDjqc1EPA4v5/BXvAacdt+EzEGa
	Q8c3CmFCDrAJsTSey5gHXhNf76lLec+L89EVuzCWBiFq2ujrqZGXrFiDlmPyNDphI2/q
	jHprBKMhx/49CvIAVsj02AxqDPiMJmmCsMClKhdPCtY9O/eJOD0CYO0e8LcgMsdx5LOC
	WLhmjWsffWCP104Dvruf88zsGqep9JJwZ/16ISIRGGHJgdiU9U49cjitSnw/D0RqrZN2
	RY1w==
X-Gm-Message-State: AHPjjUh82Mz61vIi8P9Mu64CQWtTGsaFTqdK+IMrwyoS+B66a+EjjCu2
	awobpFKUde0G4wdoONMiXA==
X-Google-Smtp-Source: AOwi7QCzoQt9NZWqb7wfhXbzbnCujJkHAvuGvwRTr6EilBLdLaYN4igoM4ctwH57LeZn0jtkunKfmw==
X-Received: by 10.25.190.74 with SMTP id o71mr6754464lff.216.1505300711684;
	Wed, 13 Sep 2017 04:05:11 -0700 (PDT)
Received: from bgdev-debian.nomovok.info (auth.nomovok.info. [83.150.126.21])
	by smtp.gmail.com with ESMTPSA id
	r80sm2191514lfi.68.2017.09.13.04.05.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Sep 2017 04:05:11 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: openembedded-devel@lists.openembedded.org,
	Koen Kooi <koen@dominion.thruhere.net>,
	Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 13 Sep 2017 13:04:47 +0200
Message-Id: <20170913110447.18816-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.13.2
Cc: Bartosz Golaszewski <brgl+baylibre@bgdev.pl>
Subject: [meta-oe][PATCH] ceres-solver: add new recipe
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
X-List-Received-Date: Wed, 13 Sep 2017 11:05:12 -0000

From: Bartosz Golaszewski <brgl+baylibre@bgdev.pl>

Ceres Solver is an open source C++ library for modeling and solving
large, complicated optimization problems.

It's often used in 3D computer vision applications.

Signed-off-by: Bartosz Golaszewski <brgl+baylibre@bgdev.pl>
---
 .../recipes-support/ceres-solver/ceres-solver_1.13.bb  | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-oe/recipes-support/ceres-solver/ceres-solver_1.13.bb

diff --git a/meta-oe/recipes-support/ceres-solver/ceres-solver_1.13.bb b/meta-oe/recipes-support/ceres-solver/ceres-solver_1.13.bb
new file mode 100644
index 0000000..0bfc083
--- /dev/null
+++ b/meta-oe/recipes-support/ceres-solver/ceres-solver_1.13.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "Ceres Solver is an open source C++ library for modeling and solving large, complicated optimization problems."
+AUTHOR = "Sameer Agarwal and Keir Mierle and Others"
+HOMEPAGE = "http://ceres-solver.org/"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=35e00f0c4c96a0820a03e0b31e6416be"
+
+SRC_URI = "https://github.com/ceres-solver/ceres-solver/archive/${PV}.tar.gz"
+SRC_URI[md5sum] = "810f53772be2c41abff53a9c03d1e301"
+SRC_URI[sha256] = "51ccb201b61ac71501fb6ccef158f078a750bc796ee6a271cd535cfe338202e5"
+
+PV = "1.13.0"
+
+DEPENDS = "libeigen glog"
+
+inherit cmake
+
+FILES_${PN} = "${includedir} ${libdir}"
-- 
2.7.4


