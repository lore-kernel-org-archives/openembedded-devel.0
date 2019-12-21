Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id CC1EC7FA32
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Dec 2019 00:07:02 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id k197so5722668pga.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Dec 2019 16:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=i83G0Pg51tA8fZKULLY3jFYbATjFob2EDx7u7lXfVGY=;
	b=qpkKnElY1B/TXTyuC0ZmQJ1T4tFxPwKV4X1yM5W+vKEPOgNmBPO4CjnsI1hUD4vtm+
	+xtGLH+Oozy2ODbxRln2G9IS/daTwu0d/pW2wFdVIr8kwVWYs8UVBkh4r+MQZXsMd5+b
	NpCEESmhuvbn3dFdiM2ZgDwJ9Yvd7CfhS3xmybzBw5C1w49n1YCZdA72A6mXEQGLlGXU
	vtHQm+9ryYtDstXWXUl6CA3PWOl0GJFSqLAjJ5SXTD3d68Knxopo6RTNjlYuoN35ZGU6
	BVeYxHItM8gzvlz1f2l5KVJg8wwCXXij6JQhC5cy+GnvxpQ1712botjroRp0PU9jnujL
	rSjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=i83G0Pg51tA8fZKULLY3jFYbATjFob2EDx7u7lXfVGY=;
	b=pNMxRO7ycA6P3Qxtg1jEsBUF+HQd+sBbQWI4RKeo7QJv1zH5RaAHNJaZixzDGL8i67
	OHj4hOLknkvCAhksu200nQLKt+SI5kgLx7u1McfhO/IvotNObLbo2WTRXu8J64JR2QSo
	Lm4n6uUyO0yEhXPxaIOncwEQyo+Qbax0+cOc59ezO6Yq14gajmJqS9sKxQES0QWvKQ6E
	hEMiI9mlIAOhBQuvPxB4BK6kDbUh2VmEWlMX1fRNGJuP/2X5+HJVYWG+HhhOji+4nWmk
	nMR9UmUOPwLUZgA/xiEL1OKB1g3xA2Z8Xwk7Wrf7YglHuSWkgj1YQ7/nxJqyNApTN9UB
	o3Dw==
X-Gm-Message-State: APjAAAWXiE0ONJ40VH3XCjK4sKnPq+PXEESvlTlUpbSIAUIOx12qfFj+
	95aEpzp0vQPs0mZihqEuBdQ/9hEuXCY=
X-Google-Smtp-Source: APXvYqzi3R1WeUZkF7qjbdpMf28JxbYc/jO2sDwY3p9Cz6/TZKFFG31EwPeADCtsu5prVx0WinSViQ==
X-Received: by 2002:a63:de47:: with SMTP id y7mr17425677pgi.270.1576886823437; 
	Fri, 20 Dec 2019 16:07:03 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::36e9])
	by smtp.gmail.com with ESMTPSA id
	d4sm11701624pjz.12.2019.12.20.16.07.02
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 20 Dec 2019 16:07:03 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Dec 2019 16:06:33 -0800
Message-Id: <20191221000635.1573390-21-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191221000635.1573390-1-raj.khem@gmail.com>
References: <20191221000635.1573390-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 21/23] ostree: Fix packaging errors when using lib64 libdir
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
X-List-Received-Date: Sat, 21 Dec 2019 00:07:03 -0000
Content-Transfer-Encoding: 8bit

Fixes
ERROR: ostree-2019.6-r0 do_package: QA Issue: ostree: Files/directories were installed but not shipped in any package:
  /usr/lib/ostree/ostree-prepare-root
  /usr/lib/ostree/ostree-remount

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/ostree/ostree_2019.6.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2019.6.bb b/meta-oe/recipes-extended/ostree/ostree_2019.6.bb
index a40cc52757..19955e973a 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2019.6.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2019.6.bb
@@ -117,7 +117,7 @@ FILES_${PN} = " \
     ${bindir}/rofiles-fuse \
     ${datadir}/${BPN} \
     ${datadir}/gir-1.0 \
-    ${libdir}/${BPN}/ostree-remount \
+    ${nonarch_libdir}/${BPN}/ostree-remount \
     ${libdir}/girepository-1.0 \
     ${libdir}/lib*${SOLIBS} \
     ${libdir}/ostree/ostree-grub-generator \
@@ -127,6 +127,7 @@ FILES_${PN} = " \
     ${systemd_unitdir}/system/ostree-finalize-staged.path \
     ${systemd_unitdir}/system/ostree-finalize-staged.service \
     ${systemd_unitdir}/system/ostree-remount.service \
+    ${nonarch_libdir}/tmpfiles.d \
 "
 FILES_${PN}-dracut = " \
     ${sysconfdir}/dracut.conf.d \
@@ -141,7 +142,7 @@ FILES_${PN}-mkinitcpio = " \
     ${libdir}/initcpio \
 "
 FILES_${PN}-switchroot = " \
-    ${libdir}/ostree/ostree-prepare-root \
+    ${nonarch_libdir}/ostree/ostree-prepare-root \
     ${systemd_unitdir}/system/ostree-prepare-root.service \
 "
 FILES_${PN}-trivial-httpd = " \
-- 
2.24.1


