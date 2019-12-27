Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id 0C27B7C446
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 21:31:29 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id p17so9325737wmb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 13:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=C8TbD/XaiRp2PrzTNf3UaxGbLjikR8kdZ1btIWTMdt4=;
	b=BhT2iH6IOL4GDouoJBzxfinOj2XASLgJe5Cikde6KXIAG3LNxLjEEAYXk4cS9yJxkk
	zyglU5CI8cmRjsWC4T3sKTr9cpv5NsN6FR1cKb5gsrWxn2gvdM57++QxiqCznqGSbXAf
	La+yE8T+O6wjooFQkUbQrQfM3P/n22AjV9/yzLsyZyw5mfQAqv1FpTAhRn8MIPK8aHBq
	SLptQOa74YqQ3U8ZllLz3fj1MTLgG9QNGZSrR9UbMrlxwTv2x5U6VNBInrzJia5r2+xz
	HxogALEofaUDvzEJmT/n21zipOfiiKqr5lh9N49QZqmzBPCWve9a/3+k/7kQSufKZS9B
	zpcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=C8TbD/XaiRp2PrzTNf3UaxGbLjikR8kdZ1btIWTMdt4=;
	b=NOJwP2c6fpgj+uMdt40dmrgdpYmTv5uZJ0YPRdHLZPnWywivm4D1+j6R3kgtpX78TN
	hX5kTaTovLjKSioEiOeXtK3ri3rGfGOBskv3pwH7LZTeNhQn0QSLqxXrLxuK9uT8+Xbb
	2dMNdm7wkV2Kz9aO+2qVi3ZRlDW++iqRbNNci3A6x1YT8lVqKNqERPfMPfkywQAihQqQ
	Hs+MQvw0O/2v8Vgf5uOooDk90SO7pbxymz1VLdjo83hPgusim928Fee9VmC+4gFszlYk
	9oGe7Wwk820EAYJuz2a5L6ldL1E6ff9Pfhxx9v/5lRnrgRUPHmBYgQ53U2BuO90NYHVx
	tcuQ==
X-Gm-Message-State: APjAAAXaAr6n+aWxiugY53xpRXD0G5vSqn0BodgsRu8ADFHFKW/IejOw
	Q4TwwVc4zcFDTOOyDjcuFIbb4MN7Vt4=
X-Google-Smtp-Source: APXvYqzmss7qHC2PMeGQtPSt/2xX+CUwxyzzIaDzU+9kDgSQ7hNLa3cR1BSU+IEwlURAz3m3Ldlbzw==
X-Received: by 2002:a7b:cb97:: with SMTP id m23mr20463236wmi.37.1577482290562; 
	Fri, 27 Dec 2019 13:31:30 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F052B8722A751F738295925.dip0.t-ipconnect.de.
	[2003:f0:7f05:2b87:22a7:51f7:3829:5925])
	by smtp.gmail.com with ESMTPSA id
	m7sm11915929wma.39.2019.12.27.13.31.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 27 Dec 2019 13:31:30 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Dec 2019 22:31:01 +0100
Message-Id: <20191227213120.3930-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191227213120.3930-1-schnitzeltony@gmail.com>
References: <20191227213120.3930-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 04/23] cppunit: upgrade 1.14.0 -> 1.15.1
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
X-List-Received-Date: Fri, 27 Dec 2019 21:31:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../cppunit/{cppunit_1.14.0.bb => cppunit_1.15.1.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-test/cppunit/{cppunit_1.14.0.bb => cppunit_1.15.1.bb} (78%)

diff --git a/meta-oe/recipes-test/cppunit/cppunit_1.14.0.bb b/meta-oe/recipes-test/cppunit/cppunit_1.15.1.bb
similarity index 78%
rename from meta-oe/recipes-test/cppunit/cppunit_1.14.0.bb
rename to meta-oe/recipes-test/cppunit/cppunit_1.15.1.bb
index 04327862c..92db31e1e 100644
--- a/meta-oe/recipes-test/cppunit/cppunit_1.14.0.bb
+++ b/meta-oe/recipes-test/cppunit/cppunit_1.15.1.bb
@@ -8,7 +8,7 @@ SRC_URI = " \
     http://dev-www.libreoffice.org/src/cppunit-${PV}.tar.gz \
     file://0001-doc-Makefile.am-do-not-preserve-file-flags-when-copy.patch \
 "
-SRC_URI[md5sum] = "7ad93022171710a541bfe4bfd8b4a381"
-SRC_URI[sha256sum] = "3d569869d27b48860210c758c4f313082103a5e58219a7669b52bfd29d674780"
+SRC_URI[md5sum] = "9dc669e6145cadd9674873e24943e6dd"
+SRC_URI[sha256sum] = "89c5c6665337f56fd2db36bc3805a5619709d51fb136e51937072f63fcc717a7"
 
 inherit autotools
-- 
2.21.0


