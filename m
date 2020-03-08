Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 46EC0606E7
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Mar 2020 15:14:58 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id d9so3543742pgu.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Mar 2020 08:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Lk5wmn1AXPMoTADiLQwRitN+uAkv9WjNoZNkVKGDB5I=;
	b=fyqISXN1kwJB2dIG6GmvsULIgrA5DMHgTAVZLNt19Pt+hyUVIZ3KkMb6KkiiV7Hcux
	iN3xdFow1gw3x6H344Sn124H+orHqru6CbzEGOyT1cTK8IfO560jUtXZb6eAbxbH9LYb
	gamYMdiSNvoErG+U2rqJnmt/gB3HOM2xM5jrtTZVhItst8R7dEwvKRGLLD+89IrnTcDK
	Ecy+0gteh0eMJth7Yz+zp/h1+WfXltJz4CIXJQvhHPusT8jMDiV9KS4zt+TIgr9muMTp
	23HF5jhdOlQci2tVfWd/5ub672Pg6QfVt3k8U76O5fCAVcahTEVBUWhO1/maJ4EHaYq1
	FSbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Lk5wmn1AXPMoTADiLQwRitN+uAkv9WjNoZNkVKGDB5I=;
	b=h4AZTrgzfziLJJmcO5/cKmyWpr/C9u0QZckYmlqLUgsJ2kXOpIH5pGVp1kejZPLwoW
	C/zDFfd83CKgz8pzsuSj/taTi5z3P6bQqrR4tOTMK095UACJlrXGPs+0FfjJV+er3OgJ
	lIpP2c2+lZHovkRmvtR4HWVCnj7zkU3d99SQMTETac4Dy31ZQSVnaE/4b/IPGGLHFz6P
	PG3hS3SOV9AzpeKx0Jv+pqy/Tz+VRuYH8BY9h5b59FNWmhq8ZFgRPWuepuTYlT6HQfao
	5351jtmFMYIgeRpVEnJigw5AH+kGyGjgWCV9LvShB7Ypcgnq2wekcUDydhuNAHGRV3V7
	5Zgg==
X-Gm-Message-State: ANhLgQ07f9AS9MoDONK/OXwIzlLI2imsSR6ncOgxD3yz5nodOITYA5a1
	YwOz1mkFNwLBZD9DoltJftdmek8Nf/o=
X-Google-Smtp-Source: ADFU+vvclCjXzdVaovcMQNcwe/3JW6VF0o3+1zQ4bvv6eEe2OcJQeoxM/b01KE0kFOVDIvTnyGhwqw==
X-Received: by 2002:a63:565b:: with SMTP id g27mr12392904pgm.309.1583680498893;
	Sun, 08 Mar 2020 08:14:58 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::1c34])
	by smtp.gmail.com with ESMTPSA id
	d186sm23877392pfc.8.2020.03.08.08.14.58
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 08 Mar 2020 08:14:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  8 Mar 2020 08:15:06 -0700
Message-Id: <20200308151509.1573831-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/4] kronosnet: Add recipe
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
X-List-Received-Date: Sun, 08 Mar 2020 15:14:58 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../kronosnet/kronosnet_1.15.bb                 | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-networking/recipes-extended/kronosnet/kronosnet_1.15.bb

diff --git a/meta-networking/recipes-extended/kronosnet/kronosnet_1.15.bb b/meta-networking/recipes-extended/kronosnet/kronosnet_1.15.bb
new file mode 100644
index 0000000000..24aa27a87b
--- /dev/null
+++ b/meta-networking/recipes-extended/kronosnet/kronosnet_1.15.bb
@@ -0,0 +1,17 @@
+# Copyright (C) 2020 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = " Kronosnet, often referred to as knet, is a network abstraction layer designed for High Availability use cases, where redundancy, security, fault tolerance and fast fail-over are the core requirements of your application."
+HOMEPAGE = "https://kronosnet.org/"
+LICENSE = "GPL-2.0+ & LGPL-2.1"
+LIC_FILES_CHKSUM = "file://COPYING.applications;md5=751419260aa954499f7abaabaa882bbe \
+                    file://COPYING.libraries;md5=2d5025d4aa3495befef8f17206a5b0a1"
+SECTION = "libs"
+DEPENDS = "doxygen-native libqb-native libxml2-native bzip2 libqb libxml2 libnl lksctp-tools lz4 lzo openssl nss xz zlib zstd"
+
+SRCREV = "0ba5985c3ddec8429b989f0e7bd3324f53e0a9b0"
+SRC_URI = "git://github.com/kronosnet/kronosnet;protocol=https;branch=stable1"
+
+inherit autotools
+
+S = "${WORKDIR}/git"
-- 
2.25.1


