Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1502078226
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Mar 2018 13:37:47 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id v11so1555238qtj.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Mar 2018 06:37:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9nhduUg01W+01AY+3fNUS/Hkgko+EgY6+C4sb8/C2z4=;
	b=hNWqR1qm10ZYOUC6y4dLEL3kPWL927j8VOqLuLmYDs/izj2NS2vPIQur4XbZ5kDJEh
	adlPo5DPlNBFALsOZ68zgyXt66W/hlhdiW2BJnuf5yhxqRlos/UK1d9Qf/Iqj17xSt0c
	YRXj/owa0RY/4P+3XHo9dvgqDLG6dV2ySXSRWXiWmnWyPDqSyxnBDAgUeHzuAVckJ56h
	c71rBTVbkvE2tF/ZjJiWK1VXkx2JzSdWurNEoxVLK8sMfbXs+zPogDo8o1H53Icmf/oP
	jL2Nd3cFNlMvdjphAoE5Rp9beW5lxoXpQf0//EteuOQ2eIHKEMjmaRQbs5vGF5IoKmBG
	+Dpg==
X-Gm-Message-State: AElRT7FvVabbW0hT3nTyX6ikDE9igeCJd4n+x4UrRaTelhldPvnE8IvM
	UvwZpGR3UwkxQxgqLlqGlbo82P1q
X-Google-Smtp-Source: AG47ELs6qGifGClV4EuiAmsf+C+GHqOu4uM1WGQbmfQf409WlaE3ABz++kXkUR5e8yR04brGkyaJ3Q==
X-Received: by 10.200.59.74 with SMTP id r10mr13667593qtf.334.1521553068192;
	Tue, 20 Mar 2018 06:37:48 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id 1sm1201287qtr.85.2018.03.20.06.37.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 20 Mar 2018 06:37:47 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Mar 2018 09:37:40 -0400
Message-Id: <1521553060-18119-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-passlib: add initial set of RDEPENDS for the package
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
X-List-Received-Date: Tue, 20 Mar 2018 13:37:48 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-passlib.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-passlib.inc b/meta-python/recipes-devtools/python/python-passlib.inc
index f289c0e..9e477ec 100644
--- a/meta-python/recipes-devtools/python/python-passlib.inc
+++ b/meta-python/recipes-devtools/python/python-passlib.inc
@@ -11,3 +11,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=73eed1a5470b969951dac411086c7036"
 
 SRC_URI[md5sum] = "254869dae3fd9f09f0746a3cb29a0b15"
 SRC_URI[sha256sum] = "3d948f64138c25633613f303bcc471126eae67c04d5e3f6b7b8ce6242f8653e0"
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-crypt \
+    ${PYTHON_PN}-logging \
+    ${PYTHON_PN}-netclient \
+"
-- 
2.7.4


