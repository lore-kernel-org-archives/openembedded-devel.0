Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id E829D737F4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 16:28:17 +0000 (UTC)
Received: by pacgr6 with SMTP id gr6so220613pac.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 09:28:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=dHbFodFDNRf1dHInTk4VEFmCkMqQkqNkfmsFtUrlAII=;
	b=O+Xb8PWovoLrzQgj/0tVfrPznXTUhr8hQKhN7jhQQPw8C+jWiI77M83U5XgsI1WVzA
	nqJ1dxYk1b9OtnDj9+GFKC9tqgM7jKU32Ard11f45skK0+wrrTLYfG5YcWlORF3Mq25c
	YoAITGRbRaRw/rT/ATsK3NIg/72d6BrAYe5ajq01+ru3VC/AgZ/VK2MeAemqa1YbiFbo
	ObucM9TwxZtadYkFCAbBolS4WHFhars2X3fCI1LIUvWmSvtn0k8K10XU0O765XimNFgl
	pjYj6MfgqcUKxhaDJz8zs8YaG8YbuHLASev/Q44NMiYjx3Qsvec952a8qVwTB5+ZcsXF
	dy6g==
X-Gm-Message-State: ALoCoQki86jEppq6gzV+3LQ5Q3cq+KvwbSYHQmb0c5uZGmltOk8kFpe+g4XmClJEoJp1Su83JtZd
X-Received: by 10.69.11.5 with SMTP id ee5mr7974715pbd.89.1440088097422;
	Thu, 20 Aug 2015 09:28:17 -0700 (PDT)
Received: from ubuntu64.mvista.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	s13sm4872753pdi.70.2015.08.20.09.28.16
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 20 Aug 2015 09:28:17 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Aug 2015 21:58:07 +0530
Message-Id: <1440088087-1069-1-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] xerces-c : add new recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Aug 2015 16:28:21 -0000

Xerces-C++ is a validating XML parser written in a portable subset of C++.
Xerces-C++ makes it easy to give your application the ability to read and write
XML data. A shared library is provided for parsing, generating, manipulating,
and validating XML documents using the DOM, SAX, and SAX2 APIs

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 .../recipes-devtools/xerces-c/xerces-c_3.1.2.bb    | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.2.bb

diff --git a/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.2.bb b/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.2.bb
new file mode 100644
index 0000000..8699d6f
--- /dev/null
+++ b/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.2.bb
@@ -0,0 +1,39 @@
+SUMMARY = "Xerces-c is a validating xml parser written in C++"
+DESCRIPTION = "Xerces-C++ makes it easy to give your application \
+               the ability to read and write XML data. \
+               A shared library is provided for parsing, generating, \
+               manipulating, and validating XML documents using \
+               the DOM, SAX, and SAX2 APIs."
+HOMEPAGE = "http://xerces.apache.org/xerces-c/"
+SECTION =  "libs"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+SRC_URI = "http://apache.lauf-forum.at/xerces/c/3/sources/${BP}.tar.bz2"
+SRC_URI[md5sum] = "d987b8bb576aea456e92454781fe3615"
+SRC_URI[sha256sum] = "95d8655c4c50668ad60d555b59da9f31937b2c53638aa8d5768cb169f192d5e1"
+
+inherit autotools
+
+PACKAGECONFIG ??= "curl icu"
+PACKAGECONFIG[curl] = "--with-curl=${STAGING_DIR},--with-curl=no,curl"
+PACKAGECONFIG[icu] = "--with-icu=${STAGING_DIR},--with-icu=no,icu"
+PACKAGES = "libxerces-c \
+            libxerces-c-dbg \
+            libxerces-c-dev \
+            xerces-c-samples \
+            xerces-c-samples-dbg \
+            libxerces-c-staticdev \
+	   " 
+
+FILES_libxerces-c = "${libdir}/libxerces-c-3.1.so"
+FILES_libxerces-c-dbg = "${libdir}/.debug \ 
+                         ${prefix}/src/debug "
+FILES_libxerces-c-dev = "${libdir}/lib*.la \
+                         ${libdir}/libxerces-c.so \
+                         ${libdir}/pkgconfig/xerces-c.pc \
+                         ${includedir}/xercesc \
+			 "
+FILES_xerces-c-samples = "${bindir}/*"
+FILES_xerces-c-samples-dbg = "${bindir}/.debug/"
+FILES_libxerces-c-staticdev = "${libdir}/lib*.a"
-- 
1.9.1


