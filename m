Return-Path: <armccurdy@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id B5F9C74B14
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2018 01:31:08 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id n10-v6so3595339plp.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 May 2018 18:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vU/L7jj9okdyuooGFCYeh54nlZz5WRYgDm1NP3KmEtk=;
	b=EFJM+Zrj+BvG0nyy3zERrn3OR01qZDBJYT+gzHnysomE+zBJ3yj6ES2GASdRTmAaob
	fH8vK9uYT5D5N1EiA+u5MR/BARSxDMkAYqT726bqPEcudH/Yu/CwqDBS5iMoJ7MH83Fi
	yS+TE5dILm/N4yrVQlkMVw49RaXWSQh/q1+/2Rvsw44yeOfU7I7lOqPsDEPXgka0xYC4
	sPvPih7ODX0tgOaMrOJDq6sJyBGh/Mg5FJDUI/Vyy5tTFVn7jt3XkpAt71Z0Nv6rv2qW
	BtR00h+4KVtahl5Q9MR59TpDs1CKpQeC64VGppHJqvFaXBHXb1qmbzQYG/4SHd175NVp
	40Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=vU/L7jj9okdyuooGFCYeh54nlZz5WRYgDm1NP3KmEtk=;
	b=KCXaRONfaeAQxLyfVwFDza1EAwOmPRaFWTqfcRBgJIC/bogBYkhgWI/rjELfZrVFpf
	1hAQRimvj73qPyRza6+MHnElqdPrJfbimS2WDuGK4lyYmkI2KFpBkCZUyweHWgTPPmmH
	OBPMFkGTh//X+bQg2LkjfTB81E57VEb7tixsoDqERYAJD/1tOaDat2tBer2zMxFruJTX
	Y3AwpFvjddQkVKbBeAu0AKEFkdQORS2kKNlxoc5qaS1lPFbQ26AbqpJtp93LxTKj/QNg
	hp3bZisZXlQMmU0RpFJCQQVIxPbPH548Za9Zlw9m3iOn0AirIsLfgcw+Wx7FtfkbGtEc
	8f2A==
X-Gm-Message-State: ALKqPwc2HDh6kq4g0r0wZxL7Ff73tpbbvAHaLF9jRLkngiAmUachddJd
	LEixplu8idrfoWcchVbF7pOfjA==
X-Google-Smtp-Source: AB8JxZqqEupQKJyazFRLQxHrMNW8jGZabDUvdAXfAWjPVHWQ1AyjQH+3ukbrudlK96l6uFxxU97l+w==
X-Received: by 2002:a17:902:24b:: with SMTP id
	69-v6mr7608735plc.54.1526607069542; 
	Thu, 17 May 2018 18:31:09 -0700 (PDT)
Received: from localhost.localdomain ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	n25-v6sm9428562pgd.5.2018.05.17.18.31.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 17 May 2018 18:31:09 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 May 2018 18:30:34 -0700
Message-Id: <1526607046-8081-5-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1526607046-8081-1-git-send-email-armccurdy@gmail.com>
References: <1526607046-8081-1-git-send-email-armccurdy@gmail.com>
Subject: [meta-oe][PATCH 05/17] grpc: rely on cmake.bbclass to put cmake package files in dev package
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
X-List-Received-Date: Fri, 18 May 2018 01:31:08 -0000

The cmake.bbclass in oe-core now ensures that ${libdir}/cmake and
${datadir}/cmake end up in the dev package, so recipes no longer need
to provide custom packaging rules to handles these files.

  http://git.openembedded.org/openembedded-core/commit/?id=d91dc4666683a96e9d03cbbd21b8a546f9069c93

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta-oe/recipes-devtools/grpc/grpc_1.8.5.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.8.5.bb b/meta-oe/recipes-devtools/grpc/grpc_1.8.5.bb
index 0883ec1..4b6028d 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.8.5.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.8.5.bb
@@ -4,12 +4,11 @@ Provides gRPC libraries for multiple languages written on top of shared C core l
 HOMEPAGE = "https://github.com/grpc/grpc"
 SECTION = "libs"
 LICENSE = "Apache-2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 DEPENDS = "gflags c-ares protobuf protobuf-native protobuf-c protobuf-c-native openssl"
 DEPENDS_append_class-target = " gtest grpc-native "
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
-
 SRC_URI = "https://github.com/grpc/grpc/archive/v${PV}.tar.gz \
            file://0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch \
            file://0004-CMakeLists.txt-Find-c-ares-in-target-sysroot-alone.patch \
@@ -31,6 +30,4 @@ EXTRA_OECMAKE = " \
     -DBUILD_SHARED_LIBS=ON \
     "
 
-FILES_${PN}-dev += "${libdir}/cmake"
-
 BBCLASSEXTEND = "native"
-- 
1.9.1


