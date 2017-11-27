Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id EBE037831C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Nov 2017 15:55:11 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id d15so39627493qte.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Nov 2017 07:55:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4//VKTU86VjwJc1dVxA1hmojvxzdt2Z+nwQdbUthqJs=;
	b=iQJaKIMRZG3Ymc4OOd7AXDZQtib70WhSCO94ZHjLFNNXBSnbADNxSrf04HBuen6O8R
	rHRWocEUR9EqFg3q9kxYhwJiC70ll1+QCVZjHGZOhaZDZ/wi6zzyTEJOWWcz3MONrVor
	653aCSmEviCbqmPwRQvvbn8gE6X0zbtNgmnFpNdTo3jbMvPvv4NVPzd6/arDqpbCBYOi
	08oe7t58ngTPGuMBM+2P5lAoQ9ALuez/oQy6T61x0+kIsSz92h7r8zbtHw0nhYxUPOeY
	QfOwUCyyRiLrX602zo3j6yzsNVCrdYkQyRe5cRR13QyDlsATqDDuUO+nRSeuUgtlztCd
	uu3w==
X-Gm-Message-State: AJaThX7wJ4zg8DJ7XlvComJsgyVscGhizO1sXUFyPaAKeCs7EIFLGaFC
	1bLUXfhTfls7Dy3p/1nUnpU2IUwg
X-Google-Smtp-Source: AGs4zMZV1C1GJme5pSuZItrm6tqA7hTFkfDbJCWttjI2X0r0k3Rg19yFxWdd/tJoxvGoakYGli3tXw==
X-Received: by 10.237.55.202 with SMTP id j68mr49477049qtb.93.1511798112714;
	Mon, 27 Nov 2017 07:55:12 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	i42sm20589989qtf.61.2017.11.27.07.55.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 27 Nov 2017 07:55:12 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Nov 2017 10:55:04 -0500
Message-Id: <1511798104-16019-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-python][PATCH] python-grpcio: only modify the compiler arguments on the target build
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
X-List-Received-Date: Mon, 27 Nov 2017 15:55:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The modification causes issues with the native builds of the package:

src/core/lib/surface/lame_client.cc: In function ‘grpc_channel* grpc_lame_client_channel_create(const char*, grpc_status_code, const char*)’:
src/core/lib/surface/lame_client.cc:178:3: warning: ‘auto’ changes meaning in C++11; please remove it [-Wc++0x-compat]
    auto chand = reinterpret_cast<grpc_core::ChannelData *>(elem->channel_data);
    ^
src/core/lib/surface/lame_client.cc:178:8: error: ‘chand’ does not name a type
    auto chand = reinterpret_cast<grpc_core::ChannelData *>(elem->channel_data);

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-grpcio_1.7.0.bb              | 2 +-
 meta-python/recipes-extended/python-pyparted/python-pyparted_3.10.7.bb  | 2 --
 meta-python/recipes-extended/python-pyparted/python3-pyparted_3.10.7.bb | 2 --
 3 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-grpcio_1.7.0.bb b/meta-python/recipes-devtools/python/python-grpcio_1.7.0.bb
index 3ca7d53..d4d869d 100644
--- a/meta-python/recipes-devtools/python/python-grpcio_1.7.0.bb
+++ b/meta-python/recipes-devtools/python/python-grpcio_1.7.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 
 DEPENDS = "python-protobuf"
 
-SRC_URI += "file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch \
+SRC_URI_append_class-target = "file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch \
            "
 RDEPENDS_${PN} = "python-enum34 \
                   python-futures \
diff --git a/meta-python/recipes-extended/python-pyparted/python-pyparted_3.10.7.bb b/meta-python/recipes-extended/python-pyparted/python-pyparted_3.10.7.bb
index 8a15a89..81d61c6 100644
--- a/meta-python/recipes-extended/python-pyparted/python-pyparted_3.10.7.bb
+++ b/meta-python/recipes-extended/python-pyparted/python-pyparted_3.10.7.bb
@@ -1,7 +1,5 @@
 require python-pyparted.inc
 
-DEPENDS += "python-re"
-
 PV = "3.10.7+git${SRCPV}"
 
 inherit distutils
diff --git a/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.10.7.bb b/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.10.7.bb
index ff72c2a..4d6f97b 100644
--- a/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.10.7.bb
+++ b/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.10.7.bb
@@ -1,7 +1,5 @@
 require python-pyparted.inc
 
-DEPENDS += "python3-re"
-
 PV = "3.10.7+git${SRCPV}"
 
 inherit distutils3
-- 
2.7.4


