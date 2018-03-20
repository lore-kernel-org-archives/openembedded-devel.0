Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id ACB1F78995
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Mar 2018 13:26:37 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id q11so1509286qtl.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Mar 2018 06:26:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ttYUydXa5KHvt2bJjqnV8kA7F99Whh4w2ViXbtdSNhE=;
	b=rypxRmk3CKSnK0jF0Ad1JNye1vOYCey91ycOYPy24gq+/Mu1v3G4jvvnIhu3FBTTdq
	t9QhP1Uh+x1+LAPtIoXMHB8yd8tVfxCzQ00NcLco7LdOdtSIHZ2Gd0uKi1H9HUxmQ7bz
	k7YqJ09n1zTCKcpPU+ucC0VtGFDqm8CgCA2p2fMIIGJ11Y0v/TxGTCRO0GuyTX9QXfWQ
	mCUC4o5w8A4avUZRgR8VnQwGfzJD0gtwGwzN+6bt0xNo1PwesqvDiYSxe8Yj7KQ3CRXn
	7ROvgsM90AXlIvKEXMrwo1XK67F8cQ17d3xR44FjcBQ6QFWPlsE6SKVeaKuMHNaXRkfx
	F3Vg==
X-Gm-Message-State: AElRT7EtJ46dMJXf2GJsKyeCYxIQPh/+dmdLwqMGlsHx7rti2JehL0IK
	f7Q5bMzbJU9RSEmACKlneqA6VhVs
X-Google-Smtp-Source: AG47ELue5hwuZBbHubV3zR3MZ+q6uqiDvrklHtYfqu1G7D9bwSMDoAbFUICCRH8Qvub9cZvoBUi5IQ==
X-Received: by 10.200.56.53 with SMTP id q50mr24316510qtb.313.1521552398294;
	Tue, 20 Mar 2018 06:26:38 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	s47sm1236243qta.38.2018.03.20.06.26.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 20 Mar 2018 06:26:37 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Mar 2018 09:26:28 -0400
Message-Id: <1521552388-9019-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-redis: add datetime to RDEPENDS
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
X-List-Received-Date: Tue, 20 Mar 2018 13:26:37 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-redis.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-redis.inc b/meta-python/recipes-devtools/python/python-redis.inc
index 571bb08..1a65d73 100644
--- a/meta-python/recipes-devtools/python/python-redis.inc
+++ b/meta-python/recipes-devtools/python/python-redis.inc
@@ -6,3 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=51d9ad56299ab60ba7be65a621004f27"
 
 SRC_URI[md5sum] = "048348d8cfe0b5d0bba2f4d835005c3b"
 SRC_URI[sha256sum] = "a22ca993cea2962dbb588f9f30d0015ac4afcc45bee27d3978c0dbe9e97c6c0f"
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-datetime \
+"
-- 
2.7.4


