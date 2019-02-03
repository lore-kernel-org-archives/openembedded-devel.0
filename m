Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id F039079CCB
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  3 Feb 2019 15:06:25 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id z11so5175804pgu.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Feb 2019 07:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=wL1XKtp3mrtbuAcuIlStw3sW6VpbIs0HPEscNmkQ648=;
	b=O3tusN00NCbmBAcavX3H4aJfBhqjRLzHcMNyVm2F6xQ7QT42+1qPk9Amt9uSnYXPKi
	eKFV2XZcEoKJaMMNRgeLRtDt48RaEirVIoTkfzxMnKMXs/Lhn/MSZ8kJbCqK5ZiBWXq0
	3cuo8QYQPDpxVAJTS1ffMR1gp2Xhtlo65IhXVwvuCyT55PxTfz0GFg7Gbjg8M4uQrOZj
	r5KyD2oeObw7LX33v9LDQxtw83qS83vnUT7GEeVoGkb3AglXNPs2AiMmHPyTnFi+cPGn
	k/OrxLnpxNGnBM55U9GHGjmMIqq/0CFBxqpFTZj3rx5gFHRZcQzaiGeWYVmsVWp3ndyD
	qC7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=wL1XKtp3mrtbuAcuIlStw3sW6VpbIs0HPEscNmkQ648=;
	b=tOMRWY/1OEX8JU9CJpyc8a4YUOhpHEgqqRx6bNjvbIfjigsqX6S3ZkfTWaC2NMPdPh
	uw0HHKHbGPri4CzpR5ZlzUiJtJbVxPKjr7N1HbE1GiIgwbCA9tLgMyQSD2meu09rgqIO
	ge4cbTtqSJmZWhLEi5nMUNkZ17DDj4kkWGr8S7wgz9SYV1FiulH5qZicoT4efV2hjM5I
	5KHHLb9Y4FWSI91NRqB2JDhPKQqdwJMC2fkqDbORfYrHLmYnOLjfMxxTZFrejtD6iMwE
	lNgXb64UiJLRmS0l04SdW9Cp+qWcpkjKahMkE3hmgRf6NAQZ4PaMAWb2DQHSpWClH1a7
	Iakg==
X-Gm-Message-State: AJcUukd654/2t8ybMQl2NoQ4Bf9PBoiUdyjOfgD0sV8mSurMYsJE2pRc
	3MhF/ME6Ps51BQmwGqI7PhM0DDjr
X-Google-Smtp-Source: ALg8bN4rzEzGiSEyjczCvjXKj6WdrE8jry5u5ReFSFxyFgMJGKY+mJN3+M5CdUorTliPC+mqjTNT4w==
X-Received: by 2002:a62:b24a:: with SMTP id x71mr48627514pfe.148.1549206386611;
	Sun, 03 Feb 2019 07:06:26 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::1609])
	by smtp.gmail.com with ESMTPSA id
	a90sm24349645pfj.109.2019.02.03.07.06.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 03 Feb 2019 07:06:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  3 Feb 2019 07:06:06 -0800
Message-Id: <20190203150606.2484-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190203150606.2484-1-raj.khem@gmail.com>
References: <20190203150606.2484-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-multimedia][PATCH 4/4] oscam: Update to latest svn revision 11491
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
X-List-Received-Date: Sun, 03 Feb 2019 15:06:26 -0000
Content-Transfer-Encoding: 8bit

Supports openssl 1.1.x
Drop upstreamed patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...macros.h-for-major-minor-definitions.patch | 26 -------------------
 .../recipes-dvb/oscam/oscam_svn.bb            |  5 ++--
 2 files changed, 2 insertions(+), 29 deletions(-)
 delete mode 100644 meta-multimedia/recipes-dvb/oscam/oscam/0001-include-sys-sysmacros.h-for-major-minor-definitions.patch

diff --git a/meta-multimedia/recipes-dvb/oscam/oscam/0001-include-sys-sysmacros.h-for-major-minor-definitions.patch b/meta-multimedia/recipes-dvb/oscam/oscam/0001-include-sys-sysmacros.h-for-major-minor-definitions.patch
deleted file mode 100644
index d3d89e333b..0000000000
--- a/meta-multimedia/recipes-dvb/oscam/oscam/0001-include-sys-sysmacros.h-for-major-minor-definitions.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From a372fe467495a674ad6244b67e83dfbfa8455f51 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 11 Aug 2018 13:54:32 -0700
-Subject: [PATCH] include sys/sysmacros.h for major/minor definitions
-
-csctapi/ifd_db2com.c:27: undefined reference to `minor'
-collect2: error: ld returned 1 exit status
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- globals.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/globals.h b/globals.h
-index bd12244..9e10225 100644
---- a/globals.h
-+++ b/globals.h
-@@ -36,6 +36,7 @@
- #include <termios.h>
- #include <inttypes.h>
- #include <sys/utsname.h>
-+#include <sys/sysmacros.h>
- 
- /*
-  * The following hack is taken from Linux: include/linux/kconfig.h
diff --git a/meta-multimedia/recipes-dvb/oscam/oscam_svn.bb b/meta-multimedia/recipes-dvb/oscam/oscam_svn.bb
index a8aec113cd..5acdd7ebc7 100644
--- a/meta-multimedia/recipes-dvb/oscam/oscam_svn.bb
+++ b/meta-multimedia/recipes-dvb/oscam/oscam_svn.bb
@@ -4,12 +4,11 @@ HOMEPAGE = "http://www.streamboard.tv/oscam/"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-DEPENDS = "libusb1 openssl10 pcsc-lite"
+DEPENDS = "libusb1 openssl pcsc-lite"
 
 SRC_URI = "svn://www.streamboard.tv/svn/oscam;module=trunk;protocol=http \
-           file://0001-include-sys-sysmacros.h-for-major-minor-definitions.patch \
            "
-SRCREV = "11431"
+SRCREV = "11491"
 PV = "1.10+${SRCPV}"
 
 S = "${WORKDIR}/trunk"
-- 
2.20.1


