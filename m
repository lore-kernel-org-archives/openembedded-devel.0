Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f48.google.com (mail-pg0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id AEEA371C07
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Dec 2016 03:04:29 +0000 (UTC)
Received: by mail-pg0-f48.google.com with SMTP id f188so113587197pgc.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Dec 2016 19:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=95VTYPZshoFcDyIIGZng7J2wZrGGYZoJVjvHSI6+nec=;
	b=cPotZ4lTrmb7eSaRBCJgCdD8R+prxPYqmTraBwgQQAcqKPJt0dR2wf+P6dpuXTMgmC
	qOTaXZqxL+q8MZ8VL1W02NvcXA9YJai4s+BA/h6lCpZPVVCMt4ojS4rXwsBRulu7wRwt
	TcwfJWwHjt5WAyPyLfLu+NjOQGZdNApI3CGUjtoM/vqaYh1XKSpvtM603xTbBdIhsoc7
	6stIjQWd8mR7B26p+otFfhX3O7rSgrvJ4+C/3tmvJDmKDe5UwG8ZhVogCLsvbVmqxQ/d
	V0I3v48W4kDXIItB/rs8C/+gYOksrH0+rC+JhMdtrA2fV8tzDesYk1pZGsIl8pgW/7Pl
	u9xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=95VTYPZshoFcDyIIGZng7J2wZrGGYZoJVjvHSI6+nec=;
	b=mnB7dKlSXpewhWwvP0c+7QO7fZmr5j44r+1wBW/k5RR/pybjDUDcsLJmCn4/lItTxI
	tphh4d9QIbHxkBnGzmu5VP8jK9EPHwSkhv3pi8CNkDksM0J0rlhIx5dudyN5k5BpCrcJ
	t3nJ/Jms7kLEIji+j91HCEAplNk1XD/vTXUVL1Pb64R4QMv0W1FMaS5TCIl6gOc0P20r
	Q0vQ+TyYrArcn/Nzkkf6wCLpnbDv5Q46tfCrxZUNMtbuMHRsuAaMEPjulhY5L0wmAGvc
	zDc4usONj8EEDFJG+++VCTwbLtyBYXgwIJcwqgGEMqd9FwcRqabzs2GYD86UweZrmM1D
	dc4w==
X-Gm-Message-State: AKaTC02crriZIg+Qzp+PfSHqSD0Fpecs6iVJKQGfIOqK0lDjHfEuQccmX7bOWn+2NYX8Xg==
X-Received: by 10.99.246.83 with SMTP id u19mr84626885pgj.165.1480734270683;
	Fri, 02 Dec 2016 19:04:30 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	186sm10624342pfv.61.2016.12.02.19.04.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Dec 2016 19:04:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Dec 2016 19:04:18 -0800
Message-Id: <20161203030422.17285-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161203030422.17285-1-raj.khem@gmail.com>
References: <20161203030422.17285-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/8] libmng: Add recipe
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
X-List-Received-Date: Sat, 03 Dec 2016 03:04:29 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/libmng/libmng_2.0.3.bb | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/libmng/libmng_2.0.3.bb

diff --git a/meta-oe/recipes-graphics/libmng/libmng_2.0.3.bb b/meta-oe/recipes-graphics/libmng/libmng_2.0.3.bb
new file mode 100644
index 0000000..b176d09
--- /dev/null
+++ b/meta-oe/recipes-graphics/libmng/libmng_2.0.3.bb
@@ -0,0 +1,22 @@
+# Copyright (C) 2016 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+DESCRIPTION = "Development files for the Multiple-image Network Graphics library"
+HOMEPAGE = "http://www.libmng.com/"
+LICENSE = "Zlib"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=32becdb8930f90eab219a8021130ec09"
+SECTION = "devel"
+DEPENDS = "zlib lcms"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${P}.tar.gz"
+
+SRC_URI[md5sum] = "7e9a12ba2a99dff7e736902ea07383d4"
+SRC_URI[sha256sum] = "cf112a1fb02f5b1c0fce5cab11ea8243852c139e669c44014125874b14b7dfaa"
+
+inherit autotools-brokensep pkgconfig
+
+PACKAGECONFIG ??= "jpeg"
+
+PACKAGECONFIG[jpeg] = "--with-jpeg,--without-jpeg,libjpeg-turbo"
+PACKAGECONFIG[lcms] = "---with-lcms2,--without-lcms2,lcms"
+
-- 
2.10.2


