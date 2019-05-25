Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 56B0C7CFF8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 May 2019 21:58:55 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id f10so5149804wmb.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 May 2019 14:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Cvu5RqtAQPrh8zCM++7j9R6rI9LOaUgD4LZcFDGxynM=;
	b=R3bOpuXZPrIKwN0dGvomFakqPAUpVl20JgULFLM8gkpglUl1XNyhGw0tFXJCy0e8zX
	ttnlmZr2VmFydHrBjDlyOlp6whCkheMUojCgP/KHetDw+lNR3lpzQIHXvfsKKzOA64hZ
	7oQOonJ00kKy4YuUbzv5rL3lU97CWElJ3ByvmQpw4TTj9vf+tfFzI3Z1Q9pot5mdjIOm
	MGJa/Zu2VA8t3vs+lyuRoMedYlQtWvlZ3Po9z+8rhY/z09va3d9bu9eVVGWOhZC9u0OU
	C9yzHiyBBSpWuT09IykSMOoym8g21DJLaoMCX1JPbwUJ25LwQLcSqNAyAMuj/OPUSyEN
	/c9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Cvu5RqtAQPrh8zCM++7j9R6rI9LOaUgD4LZcFDGxynM=;
	b=OxXd/jhTlToj4WyjPAjqbr6fCDKLCpSh8RP9eNcKITbQRmYMjhvmDYmdYuM8OeYQmK
	f+SPlJ4LBwhPmijzRM3oicPPay6vsXD4Vp2HHLwtg/i3TQQZPteos0v/nbcOOv4XC8gB
	33xW8Oax8vcuR9LWTgfSxnqYNgA86EkxAt7Z6EKlJ1FBcO2jKMIWVh/lEF9+FJbcbEDu
	QVd2bEdDlBtHj/s0SUgMoHGbbu+E9T/tK7eFTvYLFbuYSzcHBFg3m/T1dmJVs81GfT+U
	T5LYPJgkB/pldm6HndrGl9NeS4hIOxZCPHlV8ByqIq6F9tCklOPFEpl8/4Kr8GjPXZCt
	6j4A==
X-Gm-Message-State: APjAAAXnz083y4VDf5nc3B6Fl7tYyDOtDq92V7CJgHPwjjCdA7wzL4qy
	lYPcsiOzKbsYTStvc3WSPPVJPaug
X-Google-Smtp-Source: APXvYqxbMAWfhinO+Uzk46tqlhzkPzKI8OOYKf4ZN9lwVaNato1sQPVd5GdNMNrbL23QCGb9JeQiMQ==
X-Received: by 2002:a1c:9c8c:: with SMTP id f134mr4664854wme.95.1558821535718; 
	Sat, 25 May 2019 14:58:55 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	z20sm10692224wmf.14.2019.05.25.14.58.54
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 25 May 2019 14:58:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 25 May 2019 21:58:54 +0000
Message-Id: <20190525215854.5336-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][warrior][PATCH] ccid: fix SRC_URI
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
X-List-Received-Date: Sat, 25 May 2019 21:58:55 -0000

* alioth.debian.org isn't available anymore
* master already has this (was part of the upgrade to newer version)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/ccid/ccid_1.4.24.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/ccid/ccid_1.4.24.bb b/meta-oe/recipes-support/ccid/ccid_1.4.24.bb
index 31145d0efd..92f43d86a4 100644
--- a/meta-oe/recipes-support/ccid/ccid_1.4.24.bb
+++ b/meta-oe/recipes-support/ccid/ccid_1.4.24.bb
@@ -1,12 +1,12 @@
 SUMMARY = "Generic USB CCID smart card reader driver"
-HOMEPAGE = "http://pcsclite.alioth.debian.org/ccid.html"
+HOMEPAGE = "https://ccid.apdu.fr/"
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 DEPENDS = "virtual/libusb0 pcsc-lite"
 RDEPENDS_${PN} = "pcsc-lite"
 
-SRC_URI = "https://alioth.debian.org/frs/download.php/file/4171/ccid-${PV}.tar.bz2 \
+SRC_URI = "https://ccid.apdu.fr/files/ccid-${PV}.tar.bz2 \
     file://no-dep-on-libfl.patch \
 "
 
-- 
2.17.1


