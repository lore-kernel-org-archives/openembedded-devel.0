Return-Path: <martin.jansa@gmail.com>
Received: from mail-lb0-f174.google.com (mail-lb0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id AEF80601A8
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 May 2014 21:20:41 +0000 (UTC)
Received: by mail-lb0-f174.google.com with SMTP id n15so2770822lbi.33
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 May 2014 14:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=6Tlo2FuA+rIVzKaVcgjpCqZoZb3oiqccSpkkq/LrCe0=;
	b=AYl0Zj2ibRRX4UAlY1ZcRr1HBRk2Pgqym6ruk1C+KvqXQtNHsvNtgCqiJNekfvyWx5
	gICw5xYuZXl85758fkRy1d0OS5x3ikf0I2rm8cE8bS9546FhI48u0N/eM2BZk6Zh44F1
	94EcnasBjFXwxGjOlmW27ML99+888C+x8bFr2Wh+rJHtAls4zizdt2JNS0IMyPOI7xQW
	t5C0kwL8uucG7uVV1l2D1Xuy2gq2hmPnmlxyqNnJivdnZ5Usy3XMe/LmKWLocfXUruZW
	bKEbkWj2pkBcst9DWGFbpTCVOZ5Uch4osUg8FmxO6V8GRPVczARJFkESDozVuHZZX9Zp
	a1ZA==
X-Received: by 10.152.4.39 with SMTP id h7mr6810973lah.12.1399238441934;
	Sun, 04 May 2014 14:20:41 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	q4sm7198078lbh.20.2014.05.04.14.20.39 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 04 May 2014 14:20:40 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  4 May 2014 23:20:58 +0200
Message-Id: <1399238458-3160-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][WIP][PATCH] ruby: add --enable-wide-getaddrinfo to whitelist
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 04 May 2014 21:20:49 -0000

* fixes:
  ruby-1.9.3-p429: ruby: configure was passed unrecognised options: --enable-wide-getaddrinfo

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p429.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p429.bb b/meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p429.bb
index 883bb98..48a65a9 100644
--- a/meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p429.bb
+++ b/meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p429.bb
@@ -15,6 +15,11 @@ SRC_URI += "\
 SRC_URI[md5sum] = "993c72f7f805a9eb453f90b0b7fe0d2b"
 SRC_URI[sha256sum] = "d192d1afc46a7ef27b9d0a3c7a67b509048984db2c38907aa82641bdf980acf4"
 
+# it's unknown to configure script, but then passed to extconf.rb
+# maybe it's not really needed as we're hardcoding the result with
+# 0001-socket-extconf-hardcode-wide-getaddr-info-test-outco.patch
+UNKNOWN_CONFIGURE_WHITELIST += "--enable-wide-getaddrinfo"
+
 EXTRA_OECONF = "\
     --enable-wide-getaddrinfo \
     --disable-versioned-paths \
-- 
1.9.1


