Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3E0D178405
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Aug 2017 14:41:03 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id m15so618123pgc.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Aug 2017 07:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=WwgMsbOpo7q3RmQadLX3sUzUGpy5dprp84s/l1NxKAg=;
	b=eEz9OIaiIV9RwKA67TcefvT+yNGT6/o8kwnj1sGOQDAivEjspijB78l15G09AizV/b
	rUlQRv5srvfVuHYQTEFk65pU6HZXi25PvyYXNyXK8kmhbbCuW7KOnojfueWbInMiiB2o
	l/VN5/WphD/iYuSUkIwK+tYvjriDgdwgIBIGI5bwQqjxkJ7vxv8/bzmlTfjghCctdbVV
	lJqOV3Fzd9rZIU3oiVySuOIvjliq8C3wRUhbKRH6EkiwZ4uK1cId6XdMq6Qfvlk2ZLlV
	vpJJ39DkukwelEJ1ab9CW0e4uEFlD6zm14EebF5a4Cde4jT/lE3ZzDxiPIVddCDteL17
	wyfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=WwgMsbOpo7q3RmQadLX3sUzUGpy5dprp84s/l1NxKAg=;
	b=nJXUQhO+RoYL21RDp9CyMG90I7shdZ1bEzRzKFQlzWF3sle5Mr8m/XYu5L82oQ3THk
	vJNiyGvzHIk4ESAM2RnxbivZnk2KO2LRk6mEpgx1NNY7GaFOTkkzxHT2hzUn2BSLgUSr
	ElFNUY/ypFgehXYA6cuDSL3SiTS0yVXPBvTMbtfB33WVd8XxT8kK/CkYHSt/M76Xlt1y
	dPr0hmaSq0V3PRQSMC8BODvZ/BffxzsJM1fkQaHIsOrTbC6FBCnlBNfYuFp4Y2hAT6Fd
	htuo6Uwmll17KALl8ag4ovfXriO/kEmNcg/dXOCVpDPjwG38jRWiJu+OKLDFhGntQJ0c
	WVZQ==
X-Gm-Message-State: AHYfb5jPjicW6FS0bY9OKT1hQZmPqWHlJnfCJv+1kbsmC1xcCtydBuuA
	stogjfLv8MrtLMkf
X-Google-Smtp-Source: ADKCNb5yUom4VjGPtT2rcSIDQXmMZy9M6EPafdXO9o9bbCexAEAl7bRw7wdzKBB8dc2rDzhS/oHl0g==
X-Received: by 10.99.150.2 with SMTP id c2mr2641727pge.247.1504190464924;
	Thu, 31 Aug 2017 07:41:04 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::2e06])
	by smtp.gmail.com with ESMTPSA id
	j184sm14062790pfc.147.2017.08.31.07.41.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 31 Aug 2017 07:41:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 31 Aug 2017 07:40:56 -0700
Message-Id: <20170831144056.6264-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [PATCH] lxdm: Copy Makefile.in.in from gettext-native
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
X-List-Received-Date: Thu, 31 Aug 2017 14:41:04 -0000

virtual/gettext is not including virtual/gettext anymore

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb b/meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb
index c98c3a132..8e7efcdad 100644
--- a/meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb
+++ b/meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb
@@ -34,7 +34,7 @@ EXTRA_OECONF += "--enable-gtk3=no --enable-password=yes --with-x -with-xconn=xcb
 "
 
 do_configure_prepend() {
-    cp ${STAGING_DATADIR}/gettext/po/Makefile.in.in ${S}/po/
+    cp ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in ${S}/po/
 }
 
 do_compile_append() {
-- 
2.14.1


