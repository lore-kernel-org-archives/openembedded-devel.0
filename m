Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
	[209.85.210.173])
	by mail.openembedded.org (Postfix) with ESMTP id 95C657C219
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jan 2019 05:29:26 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id y126so10882047pfb.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jan 2019 21:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=UjtIWFcJUqOsmed4FY8ePqM9etIpej9DXlOV07Ay1Yo=;
	b=e/N+shdNcMDeoSxUDewMTMNFABjAVa2g0sqaksiYRVJHX0FPkxALsXUgR4ib8B43YO
	s79c3h+ffEKy2EL+3OyD0sX5EyRvUUOGAuc6J3Qbb1DQ+OqWUQJJEexFjLduT8TpxXKS
	xWyW4PZHsUzOpom43aHuu0o4PDqXYZKD/AgN+YNRrCUERoziEP5oC1zW9UspPmX5vtuS
	DfKuwB9FVBKGMBGiIkhjI4anEG9hMriGp7voizXZj2pZnfTmwYtCEyVYw7YbS8PH+dUG
	Ez4S0VLzwDF23KwluvQDmMChamnSuYmmgpsVHXRweR5cnEQurkFBIVC4NeXJPdbBitKd
	joQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=UjtIWFcJUqOsmed4FY8ePqM9etIpej9DXlOV07Ay1Yo=;
	b=PswgA0bX4YFU/+4YYOzUzAxyIvvBlBIOWtU3SuH0IQ30MQ9NLHhIgr2pIJfN5TUqRS
	DMOBC8NSlKMoiDI95EfBSckc33RampUUow6UPsb1CA4KNTM9HnvN1A9G4wHSWvzpmeg8
	1a7LiNWmI5f+xaGNpMz/mXW7kpO21sI+NMXBTTYQCTk0OM9EKhUnNb/xUiwT+8ExxxCp
	zyk5pWWxQ/MvBJoqq9O86u/5qKvIondohRC7kZaj4Sssg87e2LAZJ8hRlhNciAS15sz4
	lAQEHOPGsRHxJ3aJw2r7YQ/ce+8vdV7i7QMWN2+BER28ksMxakgz3RBE3ejpUs0qxmtp
	yGgg==
X-Gm-Message-State: AJcUukcHvBOYs6bESfI26fgokVN9GAh85jKPMFfW08HWhkFFT0iAhwOS
	PtNI8b8Jl1JPjGrim0TYRVLfLub7WNw=
X-Google-Smtp-Source: ALg8bN4p4l78OUC0hWXYOYtt3Ap5+vnt7uUGoxIBDEbKyv5xoG6CVwBMggoHmPvTpGmBJvFQDO/zFA==
X-Received: by 2002:a65:51ca:: with SMTP id i10mr25482064pgq.371.1548826167195;
	Tue, 29 Jan 2019 21:29:27 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::26b6])
	by smtp.gmail.com with ESMTPSA id
	v190sm652633pfv.26.2019.01.29.21.29.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Jan 2019 21:29:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Jan 2019 21:29:10 -0800
Message-Id: <20190130052911.36336-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190130052911.36336-1-raj.khem@gmail.com>
References: <20190130052911.36336-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 7/8] jack: Fix build when using libc++
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
X-List-Received-Date: Wed, 30 Jan 2019 05:29:26 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../jack/jack/0001-Fix-OSX-build.patch        | 27 +++++++++++++++++++
 meta-oe/recipes-multimedia/jack/jack_git.bb   |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/jack/jack/0001-Fix-OSX-build.patch

diff --git a/meta-oe/recipes-multimedia/jack/jack/0001-Fix-OSX-build.patch b/meta-oe/recipes-multimedia/jack/jack/0001-Fix-OSX-build.patch
new file mode 100644
index 0000000000..d9a3ab7cc5
--- /dev/null
+++ b/meta-oe/recipes-multimedia/jack/jack/0001-Fix-OSX-build.patch
@@ -0,0 +1,27 @@
+From dd65685c24bb25a800ed42388ed0a1e8792b2ed2 Mon Sep 17 00:00:00 2001
+From: falkTX <falktx@gmail.com>
+Date: Sat, 24 Nov 2018 14:29:58 +0100
+Subject: [PATCH] Fix OSX build
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Backport [https://github.com/jackaudio/jack2/commit/d851fada460d42508a6f82b19867f63853062583]
+---
+ posix/JackNetUnixSocket.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/posix/JackNetUnixSocket.cpp b/posix/JackNetUnixSocket.cpp
+index 7a5585ef..a4cb5036 100644
+--- a/posix/JackNetUnixSocket.cpp
++++ b/posix/JackNetUnixSocket.cpp
+@@ -169,7 +169,7 @@ namespace Jack
+ 
+     int JackNetUnixSocket::Bind()
+     {
+-        return bind(fSockfd, reinterpret_cast<socket_address_t*>(&fRecvAddr), sizeof(socket_address_t));
++        return ::bind(fSockfd, reinterpret_cast<socket_address_t*>(&fRecvAddr), sizeof(socket_address_t));
+     }
+ 
+     int JackNetUnixSocket::BindWith(const char* ip)
+-- 
+2.20.1
+
diff --git a/meta-oe/recipes-multimedia/jack/jack_git.bb b/meta-oe/recipes-multimedia/jack/jack_git.bb
index 52559cb367..99bf2e3705 100644
--- a/meta-oe/recipes-multimedia/jack/jack_git.bb
+++ b/meta-oe/recipes-multimedia/jack/jack_git.bb
@@ -16,6 +16,7 @@ DEPENDS = "libsamplerate0 libsndfile1 readline"
 
 SRC_URI = "git://github.com/jackaudio/jack2.git \
            file://0001-Python-3.7-fixes-2126.patch \
+           file://0001-Fix-OSX-build.patch \
            "
 SRCREV = "c1647819eed6d11f94b21981d9c869629299f357"
 PV = "1.9.12"
-- 
2.20.1


