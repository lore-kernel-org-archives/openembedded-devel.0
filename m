Return-Path: <ticotimo@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id D331A7FAB6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Jan 2020 06:25:00 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id p27so11708625pli.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2020 22:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0Fpr6BYMTAxv7ptaXK0gTWcYCdhG5OpVqTvlpiuMQOM=;
	b=ld46KQT4yOVN4z+g6vRckXbZ4eVQRX18SyMsZ2PGkC3hmi6hON2Coyaey7c6fqvkpb
	0aqu/bhbwL8VuBr44exJwc8IRqYHqAX/ykUsI/XQ+qDnjtfrMcF/Hgr2QJejak1LPrPh
	Srih7gWUaiSszbmTtGZd7THal7Ag9P0dnzShDR68C2VQbMEwo0p3Ts5q8KC5NfMspdMY
	XV8hmFUfclFqAVK86YwSZeckOUQp33zg1vQO6KVvdi7DK1YKVDFjZkAmuY0kasj2mThj
	BByW5bqStZTfiDO5savdFzPVykj3hX9OLK8zeGj887E6TyZVCaksfL0j8L2XIWO4JXGh
	tXIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0Fpr6BYMTAxv7ptaXK0gTWcYCdhG5OpVqTvlpiuMQOM=;
	b=s3M7lTAK3SevCoV7sWn2XCKVurhPsaMhAWiMNNiEfH6vVm1KziIZoMbOnr35paBZHz
	JTO509xMCQMYHpOLlStY7oKK1+l8QL84PkCy+k8Itfe0A/xJ0r3g2qjj9+S5DCdU3zWu
	6X+jlar4aaN8L9kHwNKMVik6anWH5/i8JV2ThFeSj5+QCjpIguW8RxuQhWyaVV8vmE5l
	fAsf4G0Us95kkG+mQ0M3cimhOzBNmyHolJXNRhNr2zeJK6Iiy2hzwV+avYwPbwb8b2TO
	zbF/cV3a1nn5cW76RiFmIYlklRrji9yHWxXknbZk0dMaKBNs39qOxVPE8cLu2AxO8m8l
	7mCg==
X-Gm-Message-State: APjAAAVQQzbS5D3n3q8HbcMxegRecYAZ79Lf93pbEe0HelHpOCciYzIH
	ZjiWs+bev+mzGO8++CFcTOmGL1fYfKA=
X-Google-Smtp-Source: APXvYqwuqxaq1hFzC6r6Gngq4IOn/VjBv+qKO1JE2WCmOxVUnpX8z7Ty8KYCADM5QGFPeaS7NcJsyA==
X-Received: by 2002:a17:90a:d804:: with SMTP id
	a4mr16297762pjv.11.1579415101747; 
	Sat, 18 Jan 2020 22:25:01 -0800 (PST)
Received: from thetis.hsd1.or.comcast.net
	([2601:1c0:6080:4500:b5c2:b07:e8c5:4266])
	by smtp.gmail.com with ESMTPSA id
	s15sm32467023pgq.4.2020.01.18.22.25.00
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 18 Jan 2020 22:25:01 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Jan 2020 22:24:39 -0800
Message-Id: <20200119062439.17433-1-ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-python2][PATCH] python-pywbem: add missing RDEPENDS
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
X-List-Received-Date: Sun, 19 Jan 2020 06:25:01 -0000
Content-Transfer-Encoding: 8bit

* Missing python-logging
* Missing 'future_builtins', which is only available
  in python-misc.

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 recipes-extended/pywbem/python-pywbem_0.15.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-extended/pywbem/python-pywbem_0.15.0.bb b/recipes-extended/pywbem/python-pywbem_0.15.0.bb
index 8264bd56..2b1e9300 100644
--- a/recipes-extended/pywbem/python-pywbem_0.15.0.bb
+++ b/recipes-extended/pywbem/python-pywbem_0.15.0.bb
@@ -44,7 +44,9 @@ RDEPENDS_${PN}_class-target += "\
     ${PYTHON_PN}-argparse \
     ${PYTHON_PN}-datetime \
     ${PYTHON_PN}-io \
+    ${PYTHON_PN}-logging \
     ${PYTHON_PN}-m2crypto \
+    ${PYTHON_PN}-misc \
     ${PYTHON_PN}-netclient \
     ${PYTHON_PN}-ply \
     ${PYTHON_PN}-pyyaml \
-- 
2.25.0


