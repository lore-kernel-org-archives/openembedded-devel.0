Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6F2586C460
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Mar 2019 17:10:12 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id d18so9008043lfn.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Mar 2019 10:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=w7vslsV2DrEFSA3rjXltDpN5eX5o3+LIFdl0VmxwDyg=;
	b=YgncejG3txPBdkAPM5s4I4jJIyadx6W/2ouw2q6bjqUshMo1VadMi853J4fP669dJj
	RS73pWLk+68R3nTFgMhqarCdsf7Fi1MzgK2j5BPMxyqMC/uyEbx8APoQw12HCqUGji9Z
	Tlchn1DyK41BMulZFIHyuLuP+X56jVbdd7pwW2ryHHeJ2HXKii5NFNQWDkZO3WbadIzo
	Ga9S0nzmcp1k9LBG3nyL/JRUfoHIrwZuavl8Vjv0fdOrkDscxDCIX9qOSHgFddeO4F7S
	gRUvt9N4O+0+b5Km3g1+QCHjwUeclNne8oJCiVK+voNDBKMKolGMbzz/biz5a9yQ4i7+
	+4sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=w7vslsV2DrEFSA3rjXltDpN5eX5o3+LIFdl0VmxwDyg=;
	b=CNM+DeZnxLH0us9JvB+AUd/OpokUPF7Atc/h75XJ5HmWbuydXrpMEC4+CnPByo9VbC
	3tMVE1m/ubfZem85lLvL3n3KYdasvPR9+3Xau8DdJI30drSj0Ngk3sM0BXqIxy0PaBGD
	5Tl0joT2IDEucySwDyR/rm7V9JF/Gmp5MPiUCqjk2Bhdt/cxJ+NjQxk3QwBxqlGmBTBB
	lgrkK+ho9N55vFoNatwT+Q6JyvXU/xOKrzXVHInQC41lK2/edJnObPUpBs8UC6pt0aHN
	zuke8+XXa0AcLpso9SMUOMjCFWxkZparbvpQZXnKa8wRDw/JJnbtUuRIOF4+wVWgI+PC
	IDFA==
X-Gm-Message-State: APjAAAUqyLKzWxdDbDiUsc8u0dwO5W/zPHizXNvaTRYuEHC49B6GzN0w
	6Ijbgtr33M8PweXD2qd8Ps9WwWgzFCY=
X-Google-Smtp-Source: APXvYqxY9LMoHs1/w1kHI5F9CvCJhfnHXLkJtkQJih6VqfgUfIQbZCCDPDd0rLkkQz1hCVS3VdFy3g==
X-Received: by 2002:a19:6d01:: with SMTP id i1mr5251543lfc.118.1552756212216; 
	Sat, 16 Mar 2019 10:10:12 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	r12sm1074249ljc.97.2019.03.16.10.10.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 16 Mar 2019 10:10:11 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 16 Mar 2019 18:10:06 +0100
Message-Id: <20190316171006.16245-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-networking][PATCH] blueman: update to 2.0.8
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
X-List-Received-Date: Sat, 16 Mar 2019 17:10:12 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../blueman/{blueman_git.bb => blueman_2.0.8.bb}           | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-networking/recipes-connectivity/blueman/{blueman_git.bb => blueman_2.0.8.bb} (80%)

diff --git a/meta-networking/recipes-connectivity/blueman/blueman_git.bb b/meta-networking/recipes-connectivity/blueman/blueman_2.0.8.bb
similarity index 80%
rename from meta-networking/recipes-connectivity/blueman/blueman_git.bb
rename to meta-networking/recipes-connectivity/blueman/blueman_2.0.8.bb
index 947db7836..8993aaa3c 100644
--- a/meta-networking/recipes-connectivity/blueman/blueman_git.bb
+++ b/meta-networking/recipes-connectivity/blueman/blueman_2.0.8.bb
@@ -7,12 +7,11 @@ DEPENDS = "bluez5 python3-pygobject python3-cython-native python3-setuptools-nat
 inherit autotools systemd gsettings python3native gtk-icon-cache
 
 SRC_URI = " \
-    git://github.com/blueman-project/blueman.git \
+    https://github.com/blueman-project/blueman/releases/download/${PV}/blueman-${PV}.tar.xz \
     file://0001-Search-for-cython3.patch \
 "
-SRCREV = "c4a03417e81e21543d4568e8e7f7de307582eb50"
-PV = "2.0.5+git${SRCPV}"
-S = "${WORKDIR}/git"
+SRC_URI[md5sum] = "51dc07d48125ee9600e7f6168d6e67f6"
+SRC_URI[sha256sum] = "04afd07b4c900a401f39e711dedbf8b9cf12000ddeda0d8ef3c3327caf34704e"
 
 EXTRA_OECONF = " \
     --disable-runtime-deps-check \
-- 
2.17.1


