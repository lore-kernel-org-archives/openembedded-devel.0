Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id A6D4A7CECE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 07:54:10 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id r1so13719839pgj.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 00:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Y2tGDxJJxpp/WsePA/uqY5MMzXN+NNoJbagYzSFKZuA=;
	b=BxpPR505bR6Yjn6pUk5+WgKs1+VykTfy6bksEXDkTwgF8Xo5SIme6rWwp2HYm8Bm54
	f1vPtRivxslOnqERUVqa1teB0aX5QLKSg/2Cpuax/SngoVyQ8BV6jgfO5j7npTUMqfkd
	/j6KkAHCoJY3Fc1mpPMJspjAK3lic8YR7/H9RuUSRu3CTNktn9zYnexayOlf48wDxyXD
	ndgmxzum4ffnLj/ZevRjaddlkY6iG9PPPcf1Du6TZewkExso2sYWOfvp6CBozVfG+SH2
	G5kzpCsyvpR05nY5G2+Qth1qM6mSQRTFL1Jb1SN/cKJMjTE3v2tffiUdfOIVsjVx7eLL
	HMlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Y2tGDxJJxpp/WsePA/uqY5MMzXN+NNoJbagYzSFKZuA=;
	b=a6GrAFvN1qfPbxz98cLzbf3s6rtUdvkpweEixxbtd4IgZa+UBTQ6nqra+dhG3OHAWx
	CYVgjOp/PxyhX8x4jFjmd+neNskCbx+X89mjy40fYTQZbYw37q2ku/IShZvULKE79C3i
	L8dRB7M3tLiBLB3TqygFP8yBOg/gFaIxT/sQRUAjKS/GqCxot47QXxdK8Fxi9ZjbKeeU
	czyCUnIHXJw6C4yn0fOeLFMbZct64MEZiD96nN9pdBV8iehMmyIkC8KaukYOiTYwibX9
	/hjUS5h/4C/X1jZ1OmGWnwdD0L44lvC/4YrdViqKE8NLADzkRJ5BgVPoLVCJ/1Nbptq0
	SG/w==
X-Gm-Message-State: APjAAAVP88/REZjb8uqS8GE1oWlB9HznOQ0DfzdRTEkDZAYJJBJ0Z3TQ
	2vJCtd1585ywvh98JKEdiDj79VVykEILOw==
X-Google-Smtp-Source: APXvYqwYNw51fU5oN+/GfEPeVaUPGlbJQo8zIOBfX8rxngcaZqD07VLlYoi4Qzdau/8viet9H9Qd3w==
X-Received: by 2002:aa7:9157:: with SMTP id 23mr16109483pfi.61.1571903651114; 
	Thu, 24 Oct 2019 00:54:11 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::a6a5])
	by smtp.gmail.com with ESMTPSA id k93sm3402431pjh.3.2019.10.24.00.54.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 24 Oct 2019 00:54:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Oct 2019 00:53:51 -0700
Message-Id: <20191024075355.2136934-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191024075355.2136934-1-raj.khem@gmail.com>
References: <20191024075355.2136934-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/6] libftdi: Add target deps for python bindings
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

helps linking with right libraries for python bindings

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/libftdi/libftdi_1.4.bb | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/libftdi/libftdi_1.4.bb b/meta-oe/recipes-support/libftdi/libftdi_1.4.bb
index 4fc6eb0907..c33c791110 100644
--- a/meta-oe/recipes-support/libftdi/libftdi_1.4.bb
+++ b/meta-oe/recipes-support/libftdi/libftdi_1.4.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM= "\
     file://COPYING.LIB;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
 "
 
-DEPENDS = "libusb1"
+DEPENDS = "libusb1 python3"
 
 SRC_URI = "http://www.intra2net.com/en/developer/${BPN}/download/${BPN}1-${PV}.tar.bz2"
 SRC_URI[md5sum] = "0c09fb2bb19a57c839fa6845c6c780a2"
@@ -17,11 +17,17 @@ SRC_URI[sha256sum] = "ec36fb49080f834690c24008328a5ef42d3cf584ef4060f3a35aa4681c
 
 S = "${WORKDIR}/${BPN}1-${PV}"
 
-inherit cmake binconfig pkgconfig
+inherit cmake binconfig pkgconfig python3native
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[cpp-wrapper] = "-DFTDI_BUILD_CPP=on -DFTDIPP=on,-DFTDI_BUILD_CPP=off -DFTDIPP=off,boost"
 
-EXTRA_OECMAKE = "-DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')}"
+EXTRA_OECMAKE = "-DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')} \
+                 -DPYTHON_LIBRARY=${STAGING_LIBDIR}/lib${PYTHON_DIR}${PYTHON_ABI}.so \
+                 -DPYTHON_INCLUDE_DIR=${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI}"
 
 BBCLASSEXTEND = "native nativesdk"
+
+PACKAGES += "${PN}-python"
+
+FILES_${PN}-python = "${libdir}/${PYTHON_DIR}/site-packages/"
-- 
2.23.0


