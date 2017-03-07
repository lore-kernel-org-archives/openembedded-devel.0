Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 77276773E3
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Mar 2017 07:14:02 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id 77so9356747pgc.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Mar 2017 23:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=WhbaD++Wrg9zitIQyeRUyW5DsRw8FkPDH3FrTK9bR0U=;
	b=ZkOuto/QYEp04aqNw+dY/eVfwJEsFbw727MFZMROcYVP2JKnuzKYGT/9kl0j5f9s1p
	uRw76AONXO9SskDB3040vgypfAKgur/Y+Iyfl7q3s5jjrBeZZ8ri4P0IPZDTHO2RlUan
	Wa/AvpJMdN/SFS1DCYgR31orBhqyb6VvTEhUcyXUD6chRi5g8nP2BBoMMoX+Zt1AuxY1
	iZaBUpEUw1rCmaKhMHQ5/Ru184aW5yvbflP41/0J5QxODJaqNJEmeaG/BbpvoMKf1ZKm
	xBj+PrCSg7BEyRtPemGy2PJUzaDfqWix60BlH5yVLXNORjmmMsERArqqpBlAW9Og2biu
	SXVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=WhbaD++Wrg9zitIQyeRUyW5DsRw8FkPDH3FrTK9bR0U=;
	b=VuBTltMa1ag7cBUQiXDR+okXmID3wA9JCqvp2wjmT8E83g5MoUsksp729KqUPVp3hr
	AkJEoCEBn6SbYPBmsBEXl3b7oruiEDNKMWApctjvt9PP1YH5FlyRMixMG84Xj6X3L5z0
	SQHEWvaGKTNJtJJuSIcufaMQRwjrXFw1/+D5mRJNgTNqcrqAWloYdIcsdrQg7dXJ1Z1I
	MSynX4ZxHmu5BweX6ivEuGp/rkVhfmd/bpLy6g3UQx24kXbMuDnoxVsW/hmOuGPFY9/h
	rl3AcfS9Hq1FnH6b/IGm9PQOjqQtZYtCkMHbhcr6S0BFA+Bux+ZDGbNXq30gNsEPPfK5
	GtoA==
X-Gm-Message-State: AMke39kvJpTYtJufODq81eBrHPxsofKqxuH88GtfB07W/lCGpUBOar+6gY7ze8mC8dqcCQ==
X-Received: by 10.98.51.70 with SMTP id z67mr26130223pfz.68.1488870844314;
	Mon, 06 Mar 2017 23:14:04 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	r134sm43530858pfr.83.2017.03.06.23.14.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Mar 2017 23:14:03 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Mar 2017 23:13:40 -0800
Message-Id: <20170307071349.16444-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170307071349.16444-1-raj.khem@gmail.com>
References: <20170307071349.16444-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 05/14] grail: Disable elision warnings for clang
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
X-List-Received-Date: Tue, 07 Mar 2017 07:14:03 -0000

Clang warns more, but lets disable them for now

../../grail-3.1.1/src/handle.cpp:65:5: error: moving a temporary object prevents copy elision
      [-Werror,-Wpessimizing-move]
    std::move(UniqueRecognizer(recognizer));
    ^
../../grail-3.1.1/src/handle.cpp:65:5: note: remove std::move call here
    std::move(UniqueRecognizer(recognizer));
    ^~~~~~~~~~

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/canonical-multitouch/grail_3.1.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/canonical-multitouch/grail_3.1.1.bb b/meta-oe/recipes-support/canonical-multitouch/grail_3.1.1.bb
index 3026744a0..5d9d12515 100644
--- a/meta-oe/recipes-support/canonical-multitouch/grail_3.1.1.bb
+++ b/meta-oe/recipes-support/canonical-multitouch/grail_3.1.1.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = " \
 inherit autotools pkgconfig
 
 DEPENDS = "frame"
-
+CXXFLAGS_append_toolchain-clang = " -Wno-pessimizing-move"
 SRC_URI = "https://launchpad.net/${BPN}/trunk/${PV}/+download/${BPN}-${PV}.tar.bz2"
 SRC_URI[md5sum] = "0df1b3ec6167920f310e2effe6e2ad44"
 SRC_URI[sha256sum] = "5eed1f650f042481daa3a2de5e7d43261fe343b2a1b1e240f3b7fc26572c9df3"
-- 
2.12.0


