Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f177.google.com (mail-wr0-f177.google.com
	[209.85.128.177])
	by mail.openembedded.org (Postfix) with ESMTP id F0BA0779FE
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jun 2017 09:44:28 +0000 (UTC)
Received: by mail-wr0-f177.google.com with SMTP id v104so35210832wrb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Jun 2017 02:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=K0MDL5MP1gnyfbM3g5Jxf4fuBDzqsgsoontm8nin1q4=;
	b=QY/mJI2UTwSn9FDDqED5Kj2E1kzkmAX9qGAm5txbhdDOUtnYSCkVmspcvvKmFKldo8
	Lyi2XRi3lY7NCgEMpGqLJquJ9gYr0kq3wsr60cmIRMSx1qK2S6D9pDTtgyd6JMjlSRK1
	oHwrhbBb4IsEU75ypahGVKlLkHbqluYppX76O7zWE9QMW/cyM7y2YVgHI/gkrLIGsKuw
	jFrMyGuNQUzPmEEiB8Yx1vqynzefGJz1ltD1a3NvQVUffZjN7Fp5xa/Kk4/1Rm0vlMri
	Oq3M5/R1yrXb6s19gn8Ct7Lt+0lRZQvF+0x7B/58UeDXveAj61IvJg59EGmTJYK9onPe
	HjQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=K0MDL5MP1gnyfbM3g5Jxf4fuBDzqsgsoontm8nin1q4=;
	b=EI1balPUE7WAoPR9oUte92u/NtgQ1jlEMHhme1xvJuJVhTO7nvFtwytqKDebp0TNYG
	4wtOmbWFZmsnIS4naqJ11tE79KTPSgDNMETRYeAmsCxenVyHu/T5YLj+gKwt8xx0ph4z
	nthoOuAO21OS2CwrYJ94lTimOGEooZ5BFu3oW6oYP0LlQ0PV6XyHkpDXHZdyx6i3E+vI
	TrkyzlBNCmHaO2L5Ek+7NOWulRgtCgR2ojC7pimPONm+xe7dQmRGR+7N5UdNKXKWBmjh
	2F+/E5Y4SMbk2G6MjoV4nmv4kKpcLLFI03lkaCD9W6PQr/2ATjpfkQpL3b6q05iBW7Gi
	a28Q==
X-Gm-Message-State: AODbwcBsthv9Hn78qN7WR9LsTNNQEMBbwXPOB+2VykgaHrhjpj1QwgCo
	I596M+bxTVZO8WUF/XM=
X-Received: by 10.223.175.204 with SMTP id y12mr2330240wrd.113.1496655869573; 
	Mon, 05 Jun 2017 02:44:29 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	m141sm6008358wma.7.2017.06.05.02.44.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 05 Jun 2017 02:44:28 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Jun 2017 10:44:25 +0100
Message-Id: <1496655865-1292-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] meson: upgrade to 0.40.1
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
X-List-Received-Date: Mon, 05 Jun 2017 09:44:29 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../recipes-devtools/meson/{meson_0.36.0.bb => meson_0.40.1.bb}  | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-devtools/meson/{meson_0.36.0.bb => meson_0.40.1.bb} (55%)

diff --git a/meta-oe/recipes-devtools/meson/meson_0.36.0.bb b/meta-oe/recipes-devtools/meson/meson_0.40.1.bb
similarity index 55%
rename from meta-oe/recipes-devtools/meson/meson_0.36.0.bb
rename to meta-oe/recipes-devtools/meson/meson_0.40.1.bb
index 9349fcb..f33256a 100644
--- a/meta-oe/recipes-devtools/meson/meson_0.36.0.bb
+++ b/meta-oe/recipes-devtools/meson/meson_0.40.1.bb
@@ -4,12 +4,9 @@ SUMMARY = "A high performance build system"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI = "git://github.com/mesonbuild/meson.git"
-
-SRCREV = "4e3073f90a7b4f225ce7d89034d61cd978399eba"
-PV = "0.36.0"
-
-S = "${WORKDIR}/git"
+SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/${BP}.tar.gz"
+SRC_URI[md5sum] = "8475b19d5f5f3bd5c40f4bb1f31b93f3"
+SRC_URI[sha256sum] = "890ce46e713ea0d061f8203c99fa7d38645354a62e4c207c38ade18db852cbf5"
 
 inherit setuptools3
 
-- 
2.8.1


