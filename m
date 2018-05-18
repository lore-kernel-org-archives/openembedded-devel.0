Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f41.google.com (mail-pg0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id A710474B71
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2018 01:31:18 +0000 (UTC)
Received: by mail-pg0-f41.google.com with SMTP id a13-v6so2582321pgu.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 May 2018 18:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BgKXE2zG4PPVRg7vHUdJRi0n1dki3651lL9vfe7p9pM=;
	b=Sx8/H1CfcdPtPmS4giBJsfkqOg9sbSSngLTHQqo/610uzsw0TW6CJMvQq19RXkzHvV
	w7D/IyyxQ49j5S1ZQc8H5LCoLYQ+95mzpnhh1v4R+G4YnK2905+Dlt0w1r2My/h0gGKd
	3URQWesE6pziJq/HToZg5zGhjOA5aluu20zi1nUcJhkZkyiE3YSkudAdfhzT5RBvZL+I
	s9d/2RIg8ktliUt9MOjel8rZBoUqzrJU7XDRYQfc69y4C9nbVrrSDDJNBxu+EBdUMrbu
	bjLcciDXkgdgoxC2ddLjkNTRGBmANQbW3c9U9sNkYuQnLoOdPbVp1u9oa+g2b8gq5X5g
	BFww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=BgKXE2zG4PPVRg7vHUdJRi0n1dki3651lL9vfe7p9pM=;
	b=BVGxXJfU6o5pxocAIfjtk4OuHuGvsid50psqR6tw2MTqUHcxrZgJkKGbtXgIKqFLmp
	WqUR3slbOI5n11bmUWMuYZbgjp5lX4hGrM7fCg0v8VEeFu2lo9P/apzXUKTrM/HidhzB
	KyAYEutF4v+ikn2L3Cv72ysJGk5NMM0ln2P2ZTKP24UZhXL9n35wze+rW4Tn1e0g+nU3
	egCWbB5FAWzj/cIviwBPFiZbZLOeEMX1dK+XPdqnVynCpzbBDsC0fn5MSaToA8FlO6lL
	34Ee9UlbjMdYc7YIBV8EAaV7T91Zhs0mb6W336RekyXWywSeZRpMYZ6BPq4freI9zrAt
	+95Q==
X-Gm-Message-State: ALKqPwf4LgMeMHkdA2+sqeaQDPpQU18YTsS9qa4jcjKsjYapcypyAFlc
	S8p1WevLRG/iPW11AEh2qPShmw==
X-Google-Smtp-Source: AB8JxZo3sJ6i4zgtbVik1iM1kR3vz/R7qAqcpnrMCRkvUPzpNAyFjiI0rRYT0H+cdi9A9UQfmyynxw==
X-Received: by 2002:a62:8ac1:: with SMTP id
	o62-v6mr7340908pfk.141.1526607079512; 
	Thu, 17 May 2018 18:31:19 -0700 (PDT)
Received: from localhost.localdomain ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	n25-v6sm9428562pgd.5.2018.05.17.18.31.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 17 May 2018 18:31:19 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 May 2018 18:30:40 -0700
Message-Id: <1526607046-8081-11-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1526607046-8081-1-git-send-email-armccurdy@gmail.com>
References: <1526607046-8081-1-git-send-email-armccurdy@gmail.com>
Subject: [meta-oe][PATCH 11/17] openjpeg: rely on cmake.bbclass to put cmake package files in dev package
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
X-List-Received-Date: Fri, 18 May 2018 01:31:18 -0000

The cmake.bbclass in oe-core now ensures that ${libdir}/cmake and
${datadir}/cmake end up in the dev package, so recipes no longer need
to provide custom packaging rules to handles these files.

  http://git.openembedded.org/openembedded-core/commit/?id=d91dc4666683a96e9d03cbbd21b8a546f9069c93

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta-oe/recipes-graphics/openjpeg/openjpeg_2.2.0.bb | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.2.0.bb b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.2.0.bb
index 4ef1c40..22b75d9 100644
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.2.0.bb
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.2.0.bb
@@ -1,9 +1,10 @@
 DESCRIPTION = "OpenJPEG library is an open-source JPEG 2000 codec"
 HOMEPAGE = "http://www.openjpeg.org"
-
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c648878b4840d7babaade1303e7f108c"
 
+DEPENDS = "libpng tiff lcms zlib"
+
 SRC_URI = "https://github.com/uclouvain/${BPN}/archive/v${PV}.tar.gz;downloadfilename=${BP}.tar.gz \
            file://0001-bmp_read_info_header-reject-bmp-files-with-biBitCoun.patch \
           "
@@ -12,10 +13,6 @@ SRC_URI[sha256sum] = "6fddbce5a618e910e03ad00d66e7fcd09cc6ee307ce69932666d54c73b
 
 inherit cmake
 
-DEPENDS = "libpng tiff lcms zlib"
-
 # standard path for *.cmake
 EXTRA_OECMAKE += "-DOPENJPEG_INSTALL_PACKAGE_DIR=${baselib}/cmake \
                   -DOPENJPEG_INSTALL_LIB_DIR:PATH=${libdir}"
-
-FILES_${PN}-dev += "${libdir}/cmake/*.cmake"
-- 
1.9.1


