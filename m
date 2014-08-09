Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id E769470A81
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Aug 2014 16:08:57 +0000 (UTC)
Received: by mail-wg0-f41.google.com with SMTP id z12so6821183wgg.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Aug 2014 09:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4t4i8y5wxdzlX/9vW/5dLv8urFuUXKWMfP7HQiXNlTw=;
	b=lCt1ZHEmmj6g3NM28uFubZ4q4s9pINuFGgkLlHfZOo7sU3MXOEbfcCmNgsSwuBIHdz
	f3/k+WojjDi6h4i1SIRofCOM01GGjBkH6Zd+KsBYkKBYopMJJ7i1eauFnkJA+7BH97eu
	vN/ozxL4ppi9Cn4ym7IBQFvVZfqsQ91ryrw0RHjDVNkVhd81QJqq73xY8YJtaI5E1k5i
	YrtvK9vaz5LWmS7GKsIdpfECwmGSxd7fD2tP478XAJ7R4sYKhsOnEmLEWEcJPrr4kmqQ
	tcdwcQ7PvZh6xgZtM7e3EZAsUcY5CNMu6na9JhZZiIwOB3AtJYXwjCXbwUnuNMOobyLP
	vmPQ==
X-Received: by 10.194.84.69 with SMTP id w5mr40967307wjy.0.1407600538326;
	Sat, 09 Aug 2014 09:08:58 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fv10sm20393050wic.23.2014.08.09.09.08.57 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Aug 2014 09:08:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Aug 2014 18:08:46 +0200
Message-Id: <1407600537-10857-25-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <1407600537-10857-1-git-send-email-Martin.Jansa@gmail.com>
References: <1407600537-10857-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 25/36] openobex: remove unrecognized configure options
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
X-List-Received-Date: Sat, 09 Aug 2014 16:08:58 -0000

* fixes following QA warnings:
  openobex-1.5: openobex: configure was passed unrecognised options:
    --with-usb --with-bluez [unknown-configure-option]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-connectivity/obex/openobex_1.5.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/obex/openobex_1.5.bb b/meta-oe/recipes-connectivity/obex/openobex_1.5.bb
index bf30817..b07779d 100644
--- a/meta-oe/recipes-connectivity/obex/openobex_1.5.bb
+++ b/meta-oe/recipes-connectivity/obex/openobex_1.5.bb
@@ -18,8 +18,7 @@ SRC_URI[sha256sum] = "e602047570799a47ecb028420bda8f2cef41310e5a99d084de10aa9422
 
 inherit autotools binconfig pkgconfig
 
-EXTRA_OECONF = "--enable-apps --enable-syslog \
-                --with-usb=${STAGING_LIBDIR}/.. --with-bluez=${STAGING_LIBDIR}/.."
+EXTRA_OECONF = "--enable-apps --enable-syslog"
 
 do_install_append() {
     install -d ${D}${datadir}/aclocal
-- 
2.0.4


