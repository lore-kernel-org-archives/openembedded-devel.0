Return-Path: <rehsack@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 19A77792FE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2018 11:07:58 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id u12-v6so11927154wrr.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2018 04:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3tHy0eamVawRKTLXI9W0iFEwZOyeRl6lZPcdDcUg1MQ=;
	b=YxsUEmRc75CdB1xQu8eMAY+SLKk+Q+fjrM1kX9JZwbV7xk2iZ6031PfGVfy+vaSv2t
	MWCW9Mvx64MAFaJR49XwY3l6+iGuS/RNtl/kfMddsHjxOHpw5YaHCzORTZA+3psMrhz9
	5Mv/I54BHmQhfzLohE7rPva1fpII21UNUVWwAQ2tlQ6ZbJg+nLIP48tPN7kytmcMv+Kc
	fFGEqRzQCItoP5eYgJNIDuDHQRnaEy8fvmbv1wsLzpAwDMj8GFBlXBPOEXXUJIQ+S65D
	+ZVtwtI2/VOk8Ba5dLi8uE1OC/H1zS0REhSQcSxiT/SST8Tg6DbEl/FQRZuV04Cf3xN6
	JkjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=3tHy0eamVawRKTLXI9W0iFEwZOyeRl6lZPcdDcUg1MQ=;
	b=KpitT0r3ss3wHxZsFL6Nbx7x3okQuq6jmLsFqU29vXGWMs5ZJB4hPAOpHfIL9grru8
	4IOzJCkxulUjXg1OgTjJhgqnBAtOy3kq6tchpHJURd5aBISJABayDe7pUBS5FDQCtSc+
	QlkDPwOC0cxQqaLLeNYtYjcZRn4/DNu+z2aZC8u4PV13WIAj2Nfg4peFJGS2RZ+wgXeA
	YI6YlmsJKq695vGHpEoWBRqp+H7y54QXvUV9CFnoQeFdOSYRVNQPCbV88qf53CDz6Hdj
	9mJITSM/3VvwaDM9LqLuggh0LQrnjGnCUVIFm4EEYttnsQ1lGVs4wVR11taaIEvU/gje
	xTiQ==
X-Gm-Message-State: APzg51B1capExu6Hv6Y9SLz39RQxNjDio2ZI8Ru2KaXlzYnzdcDuC2BS
	MsNjd9u+JYrserBl8cLesAJvPbkh
X-Google-Smtp-Source: ANB0VdY+kOzfQPi6GUzjJTRqVNE3H7uv3vIbb6pz0QaZVVgpEuetmcMVyMc74Nco48w62GeAqYbmsw==
X-Received: by 2002:a5d:4c49:: with SMTP id n9-v6mr8734763wrt.71.1535368078745;
	Mon, 27 Aug 2018 04:07:58 -0700 (PDT)
Received: from beaker.muppets.liwing.de (b2b-78-94-80-58.unitymedia.biz.
	[78.94.80.58]) by smtp.gmail.com with ESMTPSA id
	a11-v6sm19243016wrr.81.2018.08.27.04.07.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Aug 2018 04:07:57 -0700 (PDT)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Aug 2018 13:07:32 +0200
Message-Id: <20180827110735.6396-3-sno@netbsd.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180827110735.6396-1-sno@netbsd.org>
References: <20180827110735.6396-1-sno@netbsd.org>
Cc: Jens Rehsack <sno@netbsd.org>
Subject: [meta-python][PATCH 3/6] python{, 3}-grpcio-tools: update 1.8.4 -> 1.14.1
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
X-List-Received-Date: Mon, 27 Aug 2018 11:07:58 -0000

Align recipe for python protobuf code generator for gRPC with
grpc itself and python-grpcio.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 .../python/python-grpcio-tools.inc              | 16 ++++++++++++++++
 .../python/python-grpcio-tools_1.14.1.bb        |  2 ++
 .../python/python-grpcio-tools_1.8.4.bb         | 17 -----------------
 .../python/python3-grpcio-tools_1.14.1.bb       |  2 ++
 4 files changed, 20 insertions(+), 17 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-grpcio-tools.inc
 create mode 100644 meta-python/recipes-devtools/python/python-grpcio-tools_1.14.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-grpcio-tools_1.8.4.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-grpcio-tools_1.14.1.bb

diff --git a/meta-python/recipes-devtools/python/python-grpcio-tools.inc b/meta-python/recipes-devtools/python/python-grpcio-tools.inc
new file mode 100644
index 000000000..91cc62f40
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-grpcio-tools.inc
@@ -0,0 +1,16 @@
+DESCRIPTION = "Google gRPC tools"
+HOMEPAGE = "http://www.grpc.io/"
+SECTION = "devel/python"
+
+DEPENDS_append = "${PYTHON_PN}-grpcio"
+RDEPENDS_${PN} = "${PYTHON_PN}-grpcio"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9"
+
+inherit pypi
+
+SRC_URI[md5sum] = "b2fabfb54c7824c1e49a02de2aa6628e"
+SRC_URI[sha256sum] = "4ce5aa660d7884f23aac1eafa93b97a4c3e2b512edff871e91fdb6ee86ebd5ea"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-grpcio-tools_1.14.1.bb b/meta-python/recipes-devtools/python/python-grpcio-tools_1.14.1.bb
new file mode 100644
index 000000000..5b19bebf1
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-grpcio-tools_1.14.1.bb
@@ -0,0 +1,2 @@
+inherit setuptools
+require python-grpcio-tools.inc
diff --git a/meta-python/recipes-devtools/python/python-grpcio-tools_1.8.4.bb b/meta-python/recipes-devtools/python/python-grpcio-tools_1.8.4.bb
deleted file mode 100644
index 45e0cc1b1..000000000
--- a/meta-python/recipes-devtools/python/python-grpcio-tools_1.8.4.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-DESCRIPTION = "Google gRPC tools"
-HOMEPAGE = "http://www.grpc.io/"
-SECTION = "devel/python"
-
-DEPENDS = "python-grpcio"
-RDEPENDS_${PN} = "python-grpcio"
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9"
-
-inherit pypi setuptools
-
-SRC_URI[md5sum] = "e04e65afe60410cf178ff2698f052a7c"
-SRC_URI[sha256sum] = "edc84c09039d3a01012ccd97450abd06ee6b980710f6d9f191b50deb6774a75c"
-
-# For usage in other recipies when compiling protobuf files (e.g. by grpcio-tools)
-BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.14.1.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.14.1.bb
new file mode 100644
index 000000000..2da1a4df0
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.14.1.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-grpcio-tools.inc
-- 
2.17.1


