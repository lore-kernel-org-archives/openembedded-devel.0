Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 413FB7E9BB
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Jun 2019 17:57:41 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id s24so2355981plr.8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Jun 2019 10:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=MFRnU56O+J6ofrbaWzHlkDYsrjzIhsM2sdHIRVNQHi0=;
	b=ZVyINR52GgGFw/8z5BuPnzBM7ktzxVbdHX/uZaCKm1+RF1cQ/Q3thAtF8kKD0Evec4
	S3w8BpRVwHeQocNP1yVHhp4whhy4urxfsBTgBj+hb2pSNRCbJwQzghWSCDU4Sqh3XgWC
	cjhGbaqJPYTkS8wyW1ddIpeBKXb3PYevPqLbNzkn9emeQjA/9CFCZBHz99y/TO93P1hy
	EXvZQOpHVjNPP8o9+10pf7l/VlylCci+3yiZhxVvtrZ+4KWcTPYsctqU/nf+D0Jircrc
	SPrvkgwnCkryxiJb+zQznmUwugjwHAAGLuFv2tnmhl1th+eusGj+av3Z1jW6P6DY1S0W
	AA1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=MFRnU56O+J6ofrbaWzHlkDYsrjzIhsM2sdHIRVNQHi0=;
	b=LWhIlGQwMy2Qx3WX8P44QVOPIGv38uHIYbgcEgaqpcGdvLSW0OttgeA9EVGvZbeHiI
	wKlMVw/ELRaM0pTYrwXwOw90Og7TtjAgGza8QQdZfFF2jejCMQ4jwmOCSxwy5mfIZRrX
	BM1b0b8BoXsoqyqm6EBdah4lpdByJOHN/WvkV6E8Mx2u5Z75KyBlLfxCDcTpUbhjFE6Q
	/1/MVOzWGkrfw9MixYJWFI5Fz6FZs6BKrKKu298a/4gyFm82RuHXTM/KTdE/E542g98c
	PymcQkuulXTjNp7g+yi+PPSrh7nNEW3L67VTGEtxBLbOXZuGWENMF0KouSlmWiyP48cH
	RF9g==
X-Gm-Message-State: APjAAAXc874IAYKuJJPLoPvs9d3BtFDdzvHuz0ab//NfC6TY5tjv+4qA
	mU3wK4XapK92WMIY3wfRrdT5rUfM
X-Google-Smtp-Source: APXvYqwJMT87KCb3uGcyW9D0q9PmmyrJPpdBTZtA9HkgkPLPGu7EIj7yUmHPLKiQUQWiZRBpAk6p8w==
X-Received: by 2002:a17:902:be10:: with SMTP id
	r16mr37246093pls.294.1560621462345; 
	Sat, 15 Jun 2019 10:57:42 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:5942:80bf:dc9c:15ab])
	by smtp.gmail.com with ESMTPSA id
	f14sm8561221pfn.53.2019.06.15.10.57.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 15 Jun 2019 10:57:41 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 15 Jun 2019 10:57:15 -0700
Message-Id: <d34b9e4c3c49240407c2546fb4c663a73ddd2324.1560620937.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1560620937.git.akuster808@gmail.com>
References: <cover.1560620937.git.akuster808@gmail.com>
Subject: [Warror][ 11/23] ccid: fix SRC_URI
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
X-List-Received-Date: Sat, 15 Jun 2019 17:57:41 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* alioth.debian.org isn't available anymore
* master already has this (was part of the upgrade to newer version)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/ccid/ccid_1.4.24.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/ccid/ccid_1.4.24.bb b/meta-oe/recipes-support/ccid/ccid_1.4.24.bb
index 31145d0..92f43d8 100644
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
2.7.4


