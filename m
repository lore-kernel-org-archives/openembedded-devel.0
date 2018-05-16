Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id A50317485B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2018 17:19:51 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id y189-v6so3844561itb.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2018 10:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=gJx460EFdOKmbnFtwKKJLNIiTCB8FzdfnAeJZd5XSSE=;
	b=Inq3uu8SwO7Xha0mPL4iI1A9JC1v1Hgw9YQKG3hgNausCLQmVvapDypQfw99EVXdZC
	cQnleV54SZre4iyuv5D/VCylOwOlAq1iokiVJlDCsTC1rdSL0WeGRdxmmSsvunCUH0pl
	OszqKRxym/pogCsIwcIS2nEY7ZH/qTk8gvg+7ncIfboEhBX3HMFdgY2lNWtKfUM3Dpj1
	yRMolbdIcw7RvzraqmeZtUHsBFmBHI/Frnxv5M+dq34LfMBRG0TLyDxPpfPyL/89w3TX
	Ygo65kPDDDdEnvu1K6gNGFA5b3UzOCYChtYXq26gHBFofiQYhoGgCzOV7kOIvR/Z1NaV
	bSng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=gJx460EFdOKmbnFtwKKJLNIiTCB8FzdfnAeJZd5XSSE=;
	b=YTuHFMKTVHG3uSGFMr+Qmo3FubZFw4kTuD9b5Jaf3RIQ0VxJsreSe894A0JSi+FJoi
	SXsV9JRXdNfBg8oKBJ/e7gAwQyymmTlMWhRoeZMtWiEDpw50kzkImc0N/kBmf8C+/uUQ
	B7Y3fW0R5y2FS4GAYTKwR7bKYubHcvMN1p7tSC2arOJTubvyWtrVNs5JnLDJv4VLZLVc
	U5DSPuq4AnrwxjaP7UELWO1xZfSmxiHyu1NDy+2O+/RtAzvDEbwSwUMLwyhmfRmKjJHz
	QacODbae0oiNH06Iasq815lEBLTrK8qp0TvJm9jULlED7db1BXIYmB9wfAEz7qYRLRiN
	yA8Q==
X-Gm-Message-State: ALKqPweRqLQQC49d+YIrktC8oJHVpVI94+EXmG8ZAV6+CIv6lTeFMyjs
	TgdGsyP3XHeVBX2YNIXvGsUF1wKi
X-Google-Smtp-Source: AB8JxZpzGbH68LDY1G1KbxAhh3c1HJW7WeU0834TQH7lOlnKjpHCxPc5/H+Txke+d1zM/eXuKXWzKA==
X-Received: by 2002:a24:db8b:: with SMTP id
	c133-v6mr2101266itg.8.1526491192117; 
	Wed, 16 May 2018 10:19:52 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	n137-v6sm493014itn.1.2018.05.16.10.19.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 16 May 2018 10:19:51 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 May 2018 13:19:48 -0400
Message-Id: <20180516171948.18406-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.17.0.rc2.3.gc2a499e6c
Subject: [meta-oe][PATCH] grpc: switch away from github archive
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
X-List-Received-Date: Wed, 16 May 2018 17:19:51 -0000

Since we know that github archives which are automatically generated have a
tendency to change their checksums[1], switch to using a git clone.

[1] http://lists.openembedded.org/pipermail/openembedded-devel/2017-September/114916.html

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta-oe/recipes-devtools/grpc/grpc_1.8.5.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.8.5.bb b/meta-oe/recipes-devtools/grpc/grpc_1.8.5.bb
index 0883ec176b..a0c943d114 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.8.5.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.8.5.bb
@@ -10,13 +10,13 @@ DEPENDS_append_class-target = " gtest grpc-native "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI = "https://github.com/grpc/grpc/archive/v${PV}.tar.gz \
+S = "${WORKDIR}/git"
+SRCREV = "db68cb3652cc7697647e9934b5316d98a6ba04d1"
+BRANCH = "v1.8.x"
+SRC_URI = "git://github.com/grpc/grpc.git;protocol=https;branch=${BRANCH} \
            file://0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch \
            file://0004-CMakeLists.txt-Find-c-ares-in-target-sysroot-alone.patch \
            "
-SRC_URI[md5sum] = "b565fa6787e42f4969395870c2ad436e"
-SRC_URI[sha256sum] = "df9168da760fd2ee970c74c9d1b63377e0024be248deaa844e784d0df47599de"
-
 SRC_URI_append_class-target = " file://0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch"
 
 inherit cmake
-- 
2.17.0.rc2.3.gc2a499e6c


