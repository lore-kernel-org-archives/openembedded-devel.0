Return-Path: <ticotimo@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 85CD97FCDF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2020 19:22:54 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id x6so186776pfo.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2020 11:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=LpUluCy+sABYxdhQ7OdKZ47ejaWg6w1pPzbVCUauCgo=;
	b=r9j9jLmfs6sZ5CvNycRd+869GaVV2+uGnbmGZ/FRsqSBQN4Dz9puIWQP9joKO6cjOv
	kUFJeMJaRwKlf538LdBi849M0eDxBhFq0hvCD4EIqdB8uSAa+A78pIsWp8bxlMrxuQag
	gb72IeArpilXbyON410DM+UTZxqW+q9ffgdP9Kt21M9SS8v0Osm2ptF2YcS/qOsXl9aT
	fTC688HwGQqR++OPPjBnACL3w4mOpTjDSHy4twcqsRpbVotl+eJdm6oZj4lXD3VoG4zc
	kmPtTsx+gIpy8j5b//n09fyYtx3zNelhAQtEaZIxmy6yQqmB1yDaIpa8VbBvoL8fWiP6
	iIaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=LpUluCy+sABYxdhQ7OdKZ47ejaWg6w1pPzbVCUauCgo=;
	b=YSy4mi0bErLGSna0GFSBJyYHdGI3VblVDAQnW95tt4nOkkdEyFMQGCXoKu/mYFRJ5K
	2VZb3OZ98s82sAzydiR105MQ2yiaqUhUUDz4CO13L/S36vDg1GTVS8MUVjiirXzZqjBh
	25FKPYKhb4UalMDtZ+477vcytYABq2yrOSVkzK+wMalQa1+SZzX5YCvQ6zW/194BB6pe
	pctf3PlFRvAa7en+OcAxM/eYccYv39KeuImvToLIFJ5HO0x/NupXnCHgAowOtJEGrH23
	p0DbPuAUQoMGTqJ+vZvrKAGbp8bOn7xESyJ6OqBi47AQmclbDvVLaLgqg8iJKYAH7JS5
	RHMw==
X-Gm-Message-State: APjAAAUqOsF9wNxdHypaYT1wquaTKVh8t6sYuN7TdO7M06N8hPuGhLLh
	hdVvdrfc2YFcRtO8fMus2Nnf1V1fGOw=
X-Google-Smtp-Source: APXvYqxX4nz24CF+aOyqEDp1cgzeWOv5cP9jJ7xx9RC+tbCJdYGMxkw4E1YSXE4M+xp9Si6iMmEk/Q==
X-Received: by 2002:aa7:9aeb:: with SMTP id y11mr680253pfp.63.1579548175527;
	Mon, 20 Jan 2020 11:22:55 -0800 (PST)
Received: from thetis.hsd1.or.comcast.net
	([2601:1c0:6080:4500:f5dc:646c:4755:5ca9])
	by smtp.gmail.com with ESMTPSA id
	a23sm42148392pfg.82.2020.01.20.11.22.54
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 20 Jan 2020 11:22:54 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Jan 2020 11:22:35 -0800
Message-Id: <20200120192236.28995-1-ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-python2][PATCH] python-engineio: add missing RDEPENDS
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
X-List-Received-Date: Mon, 20 Jan 2020 19:22:54 -0000
Content-Transfer-Encoding: 8bit

For target, missing run-time dependencies:
  - python-compression (gzip)
  - python-json
  - python-logging

For all (including native/nativesdk support when desired), missing:
  - python-six

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 recipes-devtools/python/python-engineio_3.11.1.bb | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/recipes-devtools/python/python-engineio_3.11.1.bb b/recipes-devtools/python/python-engineio_3.11.1.bb
index d642b0f0..3fbba8bf 100644
--- a/recipes-devtools/python/python-engineio_3.11.1.bb
+++ b/recipes-devtools/python/python-engineio_3.11.1.bb
@@ -6,9 +6,19 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=42d0a9e728978f0eeb759c3be91536b8"
 
-SRC_URI[md5sum] = "bec3b06a112a7f09a0a9c92b627282fe"
-SRC_URI[sha256sum] = "9c9a6035b4b5e5a225f426f846afa14cf627f7571d1ae02167cb703fefd134b7"
+SRC_URI[md5sum] = "327c16ca05e9b0cc4f994b9d35c7f7d7"
+SRC_URI[sha256sum] = "50d108fc7feb7f970e6ebc86733752ebd714545bb5622383e6135bdad45fc9fe"
 
 PYPI_PACKAGE = "python-engineio"
 
 inherit pypi setuptools
+
+RDEPENDS_${PN}_append_class-target = "\
+    ${PYTHON_PN}-compression \
+    ${PYTHON_PN}-json \
+    ${PYTHON_PN}-logging \
+"
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-six \
+"
-- 
2.25.0


