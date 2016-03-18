Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 828E773173
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Mar 2016 16:26:55 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id l68so37595752wml.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Mar 2016 09:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=jN+SdrNFLvWK/NduYKeADQrZkau3599pseYtKI9ewnk=;
	b=rr2O/ygU6lCKzG/X7JJV/bH2QhDaLO/vAJSunLLqsA3mRZnh1Eujzhsja9ciLWf5Yg
	1NSYiPN2AvWMZkoAGowzgMKPOJzo3Npa7m13htelvk1i5wnw0r9DWKC4dpa7vUaOXXTg
	ueasXreNDDZZh1NznmhsZJX3MY9t8FTis0kMR1htkQJBJomcs/vajIqVlATKnDWLslqa
	qHlqZQD+uf/rBD+qrct3qGOBrXMoPh6Y6kEK2cu6xGa9g0hGwoTjtDPfgDIpggiCl613
	zP1rP8/iBcN7MdP5xG5GLvriQywUZcgvWHZdDnz5RLzbURKl+W6fU6bFK/Q4pLuxSL0y
	iPqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=jN+SdrNFLvWK/NduYKeADQrZkau3599pseYtKI9ewnk=;
	b=G0wtQLQ25AMhpCEKN0LfDz2yaL+kP6nja7wcrBau6s0cyOXQTn/Ip3HNSRA+q9BFfe
	h6NgqJHc6b3YtJO7B48ySYoZHAdDA+pqwJoLPuGFVzgxqAHX3Gr+N7Yh9pfbbJCQ4kzU
	OZMcU7zbW3ieciZwulWX0LX4E6r2M4FPxmzZiMkx8vy1C4KlbSStQUbYonhnF2Lgduoc
	JXJF5Yr93CdgQRTOANycmOyFD3k+0+U3Zk6Z2qpkyh3TctVGUMOL/kpKiJDVzNrcmkba
	dQKuYVGyufxQKSGdBh6mzonwWQe25CjyF5s7VwCT27eYh5kWiNIB81WiSLKlEidLvUsL
	pzkw==
X-Gm-Message-State: AD7BkJJ0dfXm9HuenI4wVcQmRahbHtFVPZ617/kJItzd/mtoAeGHfsD7l4l3+DO7/N5Ltg==
X-Received: by 10.28.217.82 with SMTP id q79mr253603wmg.29.1458318415893;
	Fri, 18 Mar 2016 09:26:55 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	cb2sm12941737wjc.16.2016.03.18.09.26.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Mar 2016 09:26:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Mar 2016 17:30:48 +0100
Message-Id: <1458318648-6295-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.3
In-Reply-To: <1458318648-6295-1-git-send-email-Martin.Jansa@gmail.com>
References: <1458318648-6295-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 2/2] libftdi: Fix cpp-wrapper options
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
X-List-Received-Date: Fri, 18 Mar 2016 16:26:55 -0000

* fixes following issue found with test-dependencies
  WARN: libftdi: libftdi rdepends on libgcc, but it isn't a build dependency?
  WARN: libftdi: libftdi rdepends on libstdc++, but it isn't a build dependency?
* when boost is found it was still building libftdipp1.so.2.2.0
* as shown in log.do_package:
  DEBUG: calculating shlib requirements for libftdi
  DEBUG: libftdi: Dependency libftdi1.so.2 requires package libftdi (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/libftdi/1.2-r0/packages-split/libftdi/usr/lib/libftdipp1.so.2.2.0)
  DEBUG: libftdi: Dependency libusb-1.0.so.0 requires package libusb1 (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/libftdi/1.2-r0/packages-split/libftdi/usr/lib/libftdipp1.so.2.2.0)
  DEBUG: libftdi: Dependency libstdc++.so.6 requires package libstdc++ (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/libftdi/1.2-r0/packages-split/libftdi/usr/lib/libftdipp1.so.2.2.0)
  DEBUG: libftdi: Dependency libgcc_s.so.1 requires package libgcc (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/libftdi/1.2-r0/packages-split/libftdi/usr/lib/libftdipp1.so.2.2.0)
  DEBUG: libftdi: Dependency libusb-1.0.so.0 requires package libusb1 (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/libftdi/1.2-r0/packages-split/libftdi/usr/lib/libftdi1.so.2.2.0)
  DEBUG: libftdi: Dependency libc.so.6 requires package glibc (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/libftdi/1.2-r0/packages-split/libftdi/usr/lib/libftdi1.so.2.2.0)
  DEBUG: Python function package_do_shlibs finished

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/libftdi/libftdi_1.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libftdi/libftdi_1.2.bb b/meta-oe/recipes-support/libftdi/libftdi_1.2.bb
index eb4d86c..1d15711 100644
--- a/meta-oe/recipes-support/libftdi/libftdi_1.2.bb
+++ b/meta-oe/recipes-support/libftdi/libftdi_1.2.bb
@@ -20,7 +20,7 @@ SRC_URI[sha256sum] = "a6ea795c829219015eb372b03008351cee3fb39f684bff3bf8a4620b55
 S = "${WORKDIR}/${BPN}1-${PV}"
 
 PACKAGECONFIG ??= ""
-PACKAGECONFIG[cpp-wrapper] = "-DFTDI_BUILD_CPP=on,-DFTDI_BUILD_CPP=off,boost"
+PACKAGECONFIG[cpp-wrapper] = "-DFTDI_BUILD_CPP=on -DFTDIPP=on,-DFTDI_BUILD_CPP=off -DFTDIPP=ooff,boost"
 
 inherit cmake binconfig pkgconfig
 
-- 
2.7.3


