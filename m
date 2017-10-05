Return-Path: <shantanu@senic.com>
Received: from mail-pf0-f177.google.com (mail-pf0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 9046671AB9
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Oct 2017 09:47:22 +0000 (UTC)
Received: by mail-pf0-f177.google.com with SMTP id z84so7680155pfi.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Oct 2017 02:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=senic-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=fp23V+fhrvZDpB7HK4Mgdss6Tox/WvufXjUX3E+hGG4=;
	b=nvBgIpkRn09QcV1ymZx/8Cb6ci/lLPUs4g/d83CfieXwxLnRQvUXf/HiRgdby+MX2T
	MhnhrrNqH4B3x6oPzzTOP5b9AeoP3gG0EH7X9kWIGrlonhJ1k4S386FYe8fMENTqGYuy
	Srx6ZQSJLoJgMyCgIQM0NjFH3IRg8T4+5kAVbBzjAMzV0QE2lsetuhaKGskQed8Afh2p
	FDbg5AhYzgWjqlJa8FQ6iCJt4MLrDtY1COGI6O7F+ArsYCYypCfLHp1KRCkat6kXp9tO
	THmbQl3ddArD5RslAL3DbIlsFbPcst1l1xfCVaVSepKKb1Ig198ugEhpYnsYVTHY+PXD
	zS+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=fp23V+fhrvZDpB7HK4Mgdss6Tox/WvufXjUX3E+hGG4=;
	b=i2EyKN+ZgrzRkp376UaTkDCDZV6SuhIxM5688YtKv7NAZVnUp7QA8ttV9losL2cmQ/
	3ljwP9SpzHnEAzGcWmC2R9xMaa2ZEce6y9H+HwC0kxYiAcnBADzg1fjm/2pD5u0aA2EK
	lEVIhLN377/s8g5b9bk4MNduNtiGVrE3QJzTCY3EE8H1GgiLtqVrI9e1huD5aSmUf822
	tcE6nbHqjgKTo7gZ0rxvCvTcNBoUwsIBZttEGWLnCSApw0dipiW6Q+3GDjlYnnk4JLUC
	UqK0TcGTnKuWoL9vsDavq8PlGy2PZFCWu97sNqYzNrsZGrTM11xzAHz3eg6ZXkXN1taq
	Amig==
X-Gm-Message-State: AHPjjUiVQJAv4yr6HO+crRCha+5nuwUfBUjIX3J15Gr+mQrif+iKZTLf
	e0eIGDZtm5koJypxKoA/vSuEYjPf
X-Google-Smtp-Source: AOwi7QBmPn/MH16HTW8dlwweKDh119KFw43J43x9SVw4bCAYOhVjNDbIiX3grEdpuP0c714DKpk7cg==
X-Received: by 10.98.215.18 with SMTP id b18mr23188534pfh.147.1507196843462;
	Thu, 05 Oct 2017 02:47:23 -0700 (PDT)
Received: from k-bhumi.domain.name ([27.56.144.226])
	by smtp.gmail.com with ESMTPSA id
	x26sm11460058pfh.95.2017.10.05.02.47.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Oct 2017 02:47:22 -0700 (PDT)
From: baali <shantanu@senic.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Oct 2017 15:17:07 +0530
Message-Id: <1507196827-16528-1-git-send-email-shantanu@senic.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] Recipe for Nghttp2: HTTP/2 C Library.
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
X-List-Received-Date: Thu, 05 Oct 2017 09:47:22 -0000

It is also needed for Curl to support HTTP2 protocol.

Signed-off-by: baali <shantanu@senic.com>
---
 meta-oe/recipes-support/nghttp2/nghttp2_1.26.0.bb | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-oe/recipes-support/nghttp2/nghttp2_1.26.0.bb

diff --git a/meta-oe/recipes-support/nghttp2/nghttp2_1.26.0.bb b/meta-oe/recipes-support/nghttp2/nghttp2_1.26.0.bb
new file mode 100644
index 0000000..3e6b10a
--- /dev/null
+++ b/meta-oe/recipes-support/nghttp2/nghttp2_1.26.0.bb
@@ -0,0 +1,16 @@
+SUMMARY = "HTTP/2 C Library and tools"
+HOMEPAGE = "https://nghttp2.org/"
+SECTION = "libs"
+
+DEPENDS = "pkgconfig cunit zlib openssl libxml2 jansson c-ares"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+SRC_URI = "https://github.com/nghttp2/nghttp2/releases/download/v${PV}/nghttp2-${PV}.tar.bz2"
+SRC_URI[md5sum] = "926f07ad3b50f38f7d8935ced04716cf"
+SRC_URI[sha256sum] = "0df4229f4123b5aa96e834ebcfdffe954e93d986f0252fd10123d50c6f010983"
+
+inherit cmake pythonnative python-dir
+
+EXTRA_OECMAKE = ""
-- 
2.7.4


