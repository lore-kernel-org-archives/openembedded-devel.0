Return-Path: <maxime.roussinbelanger@gmail.com>
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
	[209.85.160.171])
	by mail.openembedded.org (Postfix) with ESMTP id BAB8D796EE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Oct 2018 20:30:32 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id u34-v6so31704343qth.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Oct 2018 13:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=vErrKfth0Psul+ag2kHF4gG81zERigNlam0FpOqMEAk=;
	b=SrTzp7xfHaoirpeh6HKT+cTo0P1LdW5ofGPuAUmf509Cy1ApQy1xwGF9J4N7gPeCg/
	1TOGGnfYwdtGwZefJZ+GYKKCt7yf3BwjiA0lOatzm/vj1DCeP+7bf9/Ng7Z2RUzhcXSo
	Edp7yQaS8p3U1rFrSorHjZ+oIjUDTSYi1V1CSkRKq2vjRyCtC1iFS0k+8tgQMIarmirT
	1TlTo+p4ThEjxZh932taUljtj1uKqHHE7SIIFVdVhClEE4uYugPDBZF5Ia6O9hoqpbiq
	VkMF81warJLLlOF2oStj0+BN1AhAyON87xM6fqt4QbrYpSqlicis+pv1JloK1ddibRJp
	rFdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=vErrKfth0Psul+ag2kHF4gG81zERigNlam0FpOqMEAk=;
	b=NhshLeBZgyrLaS4JMgr+IDZO0H24Oe5jpUDdYPUEjviPjZN33gzDtc0ZL4jksk4WEp
	IRGb3VlouUsRKkG1KEs3DborB/9gNpJRf+yL8J5qXCoW5F+bruOwcKczsnaNrLTxaV0i
	DeJPHtVHR1EQLXqpN9edQ7eJ+DDNbpqCB3f5dsVtOvCVDlcAMlmhEWnXi0WS8ZPN4MzZ
	e8+SUFlPAgTa21B8N41IMXOYUEuuHzqJrhV43nCJdWx95uQiYuBfRg30SYs9ZSmHxIDN
	AkowLh6MxTrpPaz/lwOBfuFunXffH37oOCKS4wsyGXK1ZyDj0IwsRHPEp0JXNt/PP/cA
	Tv9A==
X-Gm-Message-State: ABuFfojU+3Ovfvc1ZX9OaDvkNgcA3MTv5G7y0GzyskhYCAE/yFL7MbiE
	y4/qTA4D16mqjKUBrJlAAUOshA1J
X-Google-Smtp-Source: ACcGV628tpWcUCe9kxLUgQb2btKBVc5Ee94u4bYD+U44kViggWs4l5/MotZdcJLl38eJBa9ivj/K6Q==
X-Received: by 2002:aed:237b:: with SMTP id
	i56-v6mr26854371qtc.341.1539808233543; 
	Wed, 17 Oct 2018 13:30:33 -0700 (PDT)
Received: from mbedesk.Sonatest.net
	(ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca.
	[174.94.156.236]) by smtp.gmail.com with ESMTPSA id
	w5-v6sm12286759qkw.69.2018.10.17.13.30.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Oct 2018 13:30:33 -0700 (PDT)
From: =?UTF-8?q?Maxime=20Roussin-B=C3=A9langer?=
	<maxime.roussinbelanger@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Oct 2018 16:30:26 -0400
Message-Id: <20181017203026.18833-1-maxime.roussinbelanger@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2] libeigen: update to 3.3.5
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
X-List-Received-Date: Wed, 17 Oct 2018 20:30:33 -0000
Content-Transfer-Encoding: 8bit

---
 .../libeigen/{libeigen_3.3.4.bb => libeigen_3.3.5.bb}       | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/libeigen/{libeigen_3.3.4.bb => libeigen_3.3.5.bb} (79%)

diff --git a/meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb b/meta-oe/recipes-support/libeigen/libeigen_3.3.5.bb
similarity index 79%
rename from meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb
rename to meta-oe/recipes-support/libeigen/libeigen_3.3.5.bb
index 31a42a9d66..7078e50bb0 100644
--- a/meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb
+++ b/meta-oe/recipes-support/libeigen/libeigen_3.3.5.bb
@@ -5,10 +5,10 @@ LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING.MPL2;md5=815ca599c9df247a0c7f619bab123dad"
 
 SRC_URI = "http://bitbucket.org/eigen/eigen/get/${PV}.tar.bz2;downloadfilename=${BP}.tar.bz2"
-SRC_URI[md5sum] = "a7aab9f758249b86c93221ad417fbe18"
-SRC_URI[sha256sum] = "dd254beb0bafc695d0f62ae1a222ff85b52dbaa3a16f76e781dce22d0d20a4a6"
+SRC_URI[md5sum] = "e83549a79d1b721da0f8899ab34edf95"
+SRC_URI[sha256sum] = "7352bff3ea299e4c7d7fbe31c504f8eb9149d7e685dec5a12fbaa26379f603e2"
 
-S = "${WORKDIR}/eigen-eigen-5a0156e40feb"
+S = "${WORKDIR}/eigen-eigen-b3f3d4950030"
 
 inherit cmake
 
-- 
2.19.1


