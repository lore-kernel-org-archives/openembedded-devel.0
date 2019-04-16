Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id CDCA27D6BB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Apr 2019 07:49:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44jyDv3RpGz3y
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Apr 2019 09:49:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1555400959;
	bh=InLg+pPfE+ivbeGd8EgAyzVaStBF5l01+q/vJC3QBXQ=;
	h=From:To:Subject:Date:From;
	b=euVPpd13IWRqoJ/u1iPyGLmRNA3JGvQW4ba0A+j4X1TdI7OFWqmEj7U5SOoAZge2Z
	OLmavwX6E+dhm78TFSk4c3EhjlE7B+4LALFl7r6vwMs/IhtEIie6nfXaV+Y7q/ocRx
	OuVzFPX9FSx3T+2jgU8UpSP+71stquLBBDh/xR6IdpQdGcYWRmpUQ7iJlMb2KNxD+9
	zu/vkT0Ho+6Q09XDFElJjc7892rsx5uM0H5jCpdEEuSHn3sa5hLvnC0draQ4467Smz
	QkIsdkynkbhdPsyujZPb7VyVMQZKk/hQmhCAj23c0Ma9L+0KS2vBqTiaUfxXBcnwvZ
	c9On47VW1q7hy1q8iRXTZGx1JiGj6LmLrek+6Mqa1hkyWQ/RLLdUPojH1POWxAyC6/
	Qidah3459zX2b9Mti/CPMYwqP4xVyW4zf9fnEpSPqeyPyhMahXZ6RGkdhPP/JsMeXj
	vNgaOlGAjZ7zTUsENt/vrpol/KJWnx2BJy/JAhyH48Q8D9EgTM6lbandbuJOoZP5sY
	vRNMaNqQRnZCPBlFqRI5MB2H9NHEQpXJ78vbb1q6nPSOkWTp/K+Eb4Ydh57lZ6enWJ
	epDDJmhBH3fI2YbZ9XzdVBdwP3dCwF3eZLVl7lGX2zP4ZGxMauJYpXVhIdG9X4j4jB
	RuLOG9NGr1lTGQhzhuw2FV7U=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Apr 2019 10:49:17 +0300
Message-Id: <20190416074918.28537-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][PATCH] linux-atm: Remove DEPENDS on virtual/kernel and PACKAGE_ARCH
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
X-List-Received-Date: Tue, 16 Apr 2019 07:49:20 -0000

Only userspace utilities and firmware are in the packages.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb b/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
index 51682b1ed..d34dc842f 100644
--- a/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
+++ b/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
@@ -3,9 +3,7 @@ HOMEPAGE = "http://linux-atm.sourceforge.net/"
 SECTION = "libs"
 LICENSE = "GPL-2.0 & LGPL-2.0"
 
-DEPENDS = "virtual/kernel flex flex-native"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
+DEPENDS = "flex flex-native"
 
 SRC_URI = "http://nchc.dl.sourceforge.net/project/${BPN}/${BPN}/${PV}/${BPN}-${PV}.tar.gz \
            file://link-with-ldflags.patch \
-- 
2.17.1


