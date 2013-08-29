Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f170.google.com (mail-ea0-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 4BA776BE2C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:51:47 +0000 (UTC)
Received: by mail-ea0-f170.google.com with SMTP id h14so341385eak.15
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 08:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=9SpTssNVpEMcNIC9SE69/X3qcQtGHZzYD/j9yuNiYig=;
	b=LfSLgHvlpohG/R8LF6kTpdpb7v/QNohSrON7QbLksC5S2ih3VFWZwxCP7o3FMYKhgl
	fds91JMrdEIclWnatNzxnnIJE25u65aplamj8ygyS8oATET4W7f932TepzUn1/OQf2QM
	NWTAUUiDpT6bEhW3eKDECjYSZSle4Wx1ZOzH/XiKjSdHgHDxGXNDyr0tPWcbB6VF0i4x
	vPy6xVOPdaf8x7p5MfXinGk7IS5JAqqKTtsPt6l6rqYjIvt9KA0P8Rcv/DKcpRqNfov0
	5KE62tfyoqXZhdZSBu1aBYLrKBpnjby0cykqJ2DPo9OX97G9LON7gu236Lr9+pRSNoRP
	GOGw==
X-Received: by 10.14.198.72 with SMTP id u48mr5379317een.55.1377791507748;
	Thu, 29 Aug 2013 08:51:47 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a43sm47161491eep.9.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 08:51:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 17:51:37 +0200
Message-Id: <effba0664befaeb0523ef165bc1b27f553ceb0b7.1377791378.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 44/66] proftpd: Add PACKAGECONFIG for curses
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
X-List-Received-Date: Thu, 29 Aug 2013 15:51:47 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
index 3c48422..6571b9c 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
@@ -19,6 +19,9 @@ SRC_URI[sha256sum] = "9f659585cea90fc6af34a0ffae4a90e4ed37abe92dbd9b6c311f95a436
 
 inherit autotools useradd update-rc.d
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[curses] = "--enable-curses --enable-ncurses,--disable-curses --disable-ncurses,ncurses"
+
 EXTRA_OECONF = "--disable-cap \
                 --disable-auth-pam \
 "
-- 
1.8.3.2


