Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
	[209.85.210.176])
	by mail.openembedded.org (Postfix) with ESMTP id 17FF97CECE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 07:54:09 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id q7so14604078pfh.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 00:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=1Dcz7oGRVScf6JlbckAISy+IgmYrLYKCPrnPfSMolqg=;
	b=vQCjsIHHOyeqyB4+wXWm35wiPP4DfLNFam/ptf/GyDL/DIjMk0EEyfBL7L60+ZTUU6
	Knsuf+dlJKobn0qGfxAiACcqH2SlTB+MPS3xGn7TW2HhNuYkYPLUtb2ExORdnejUe4aK
	CXaCfDX5hzRDCecz+MQfS3HajtfHKbHvChC6mUMYPaONhFc0bPwPgE0HTHysJFInq4Gq
	m1x287c5CK3+yNFDSqJBf3jF4s+bC84QGcX4pmJ2ERdIE2+P+vkJ6VadDeK/Y8yMOSzm
	FXPUCFeUzyVPDUVOBHoVDqi7TqOYxsXl+Qboi2qjBdIbjaZjy46VKlJF0e/eYgh62N/k
	0ikA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=1Dcz7oGRVScf6JlbckAISy+IgmYrLYKCPrnPfSMolqg=;
	b=j7Kheofxh8ldhR3PrgF5JOj+/95mWqJB8BnnzGoD8ZTVx42utLEMVSYyC0BxHWCpFl
	OZ9HrW+YyQC+1w3Ce4xez3srKXnaEr8yeMPGBI49VX/uM5EXcOnDTY+Y0KT4DT/UgbaA
	o3Kuke9MBGrRgoIPKpIdsuollAzp5JfJ8PjBpU7f2il/bhm+weEBRn2lXSEQS1HHfYAx
	jGerQfsH71wFvcc+rG5Hje065T6JM1guDzoihbgMWjTqyvMavJZcMpk4a7Gh3vZ/UeSC
	Cs73gnXvLdsVJpFQU2YC/VJnPC146GC166GObSo8AWDdvOBVS/J4LNMfKRMzyjZc6nbq
	Gl3A==
X-Gm-Message-State: APjAAAUL9J4OsUw1R2ETxbWNm7hRtM97X50IitMyMDeVuC4lvhvGjhEq
	kGz8/C4+Df9bfUIWJpdUh2MVHoS+cUn2aw==
X-Google-Smtp-Source: APXvYqyk2GzvGmkEIJ0LRiiiY1R5IybYZXYb+CNkOJYA6hPkVXhmwIMHPoqXVQPSz+WZne9K2Ut5UQ==
X-Received: by 2002:a62:6d41:: with SMTP id i62mr3435184pfc.38.1571903650382; 
	Thu, 24 Oct 2019 00:54:10 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::a6a5])
	by smtp.gmail.com with ESMTPSA id k93sm3402431pjh.3.2019.10.24.00.54.09
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 24 Oct 2019 00:54:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Oct 2019 00:53:50 -0700
Message-Id: <20191024075355.2136934-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-python][PATCH 1/6] python3-astor: Upgrade to 0.8
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
X-List-Received-Date: Thu, 24 Oct 2019 07:54:11 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/{python3-astor_0.7.1.bb => python3-astor_0.8.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astor_0.7.1.bb => python3-astor_0.8.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-astor_0.7.1.bb b/meta-python/recipes-devtools/python/python3-astor_0.8.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-astor_0.7.1.bb
rename to meta-python/recipes-devtools/python/python3-astor_0.8.bb
index c2dc9245c2..efd56c1b06 100644
--- a/meta-python/recipes-devtools/python/python3-astor_0.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-astor_0.8.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=561205fdabc3ec52cae2d30815b8ade7"
 
 SRC_URI = "git://github.com/berkerpeksag/astor.git"
-SRCREV ?= "4ca3a26e52f08678854c2841cd0fdf223461e47d"
+SRCREV ?= "3a7607e31f0c17e747ded5cfe0b582d99f7caecf"
 
 inherit setuptools3
 
-- 
2.23.0


