Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id A81B37E5B0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2019 16:55:17 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id c66so3731752wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2019 09:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Cvu5RqtAQPrh8zCM++7j9R6rI9LOaUgD4LZcFDGxynM=;
	b=f0CX7tw+0q/kaifNXxyp/uQOQQGLjn1SOnIvjXkQ1xYiic3U9Wtaj49wEvAQ5Z/E8k
	zQfeDF82jZBWNlsXGpuLmPxvL1c0JnLVzH6zQBzCqIXUrhwAAKtlgm9gOMllT9VmqjYl
	XWVuHgiZZCzGr0rHeXshgXh32c4q9N2t3DjZHcQPtV9aSoo3T8WPCpciTK1PkgUuy/oN
	U15PBCH1UjUEaIYGdgCl0hmu6UwA8rq/xYaug8w2nb0t2b6dYOQ6UIjTIG4Bdzk49Okh
	MuHVGbrlF8MM3lPdB8m06x+p3pqZyN1wczjPkR54PSLqQLBF6fBrpb/Bad+Z/onbvTnp
	AEYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Cvu5RqtAQPrh8zCM++7j9R6rI9LOaUgD4LZcFDGxynM=;
	b=KDrnYF2TNdqxgVhKAjTp7jFXUHu8b/AQYAYwG65ZQ9Pl4HvVxLCcHCWmRk3DikOuit
	RvaLYRwqYfQiXmillAmfRo4ApcEOb0bJVWbVjrQcKY+2TM/LqOUaPLUoiK9u4UIa+efc
	lpfPIT46YYGMPlL3FAmQh+q6pNX4Vc8rEXDnO0GLB/uVJR9eHdt9sxRtD+13xspjovDZ
	xg6RpzvXaibCXMmeaV67YzR1pbkrA5hlmC2BjOievdaKoUSR2KuGUgobeq328r9HrDn+
	/aHTy9TWc6/OkE5DhzKMLRTTkOTT3hy23krH/1ucNmXmqC5ax3OLZ7o52rK5kbQGTFm6
	ERTw==
X-Gm-Message-State: APjAAAVJo9/EAs+5v7fsohAg/v3Viqgj/X1+DLaoJXAxYP1hjyjM0jHS
	/5EONgBn6Al3/TOz9wpHajaXg13E
X-Google-Smtp-Source: APXvYqwC4acdYDoCQ/bfEkZtBTQZT3q1rqbv3wgtMy5pfCNt/gU8gnxCIOpHUPEWH3cMBrZ+b4h5Lg==
X-Received: by 2002:a1c:f512:: with SMTP id t18mr1738337wmh.47.1560272118358; 
	Tue, 11 Jun 2019 09:55:18 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	135sm4294230wmb.28.2019.06.11.09.55.17
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 11 Jun 2019 09:55:17 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Jun 2019 16:55:04 +0000
Message-Id: <20190611165504.23049-11-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190611165504.23049-1-Martin.Jansa@gmail.com>
References: <20190611165504.23049-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][warrior][PATCH 11/11] ccid: fix SRC_URI
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
X-List-Received-Date: Tue, 11 Jun 2019 16:55:18 -0000

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


