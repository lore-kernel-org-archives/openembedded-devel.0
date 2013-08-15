Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f42.google.com (mail-ee0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id 6F5B46B82A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:19:43 +0000 (UTC)
Received: by mail-ee0-f42.google.com with SMTP id b45so182134eek.29
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=OI6XhM4gjEyG7L+TTV2iKZSnXTfd52jzrkJsJhNv+Xo=;
	b=BgrNb0w6jLGf5BiaQ6rcnmQcAtpVHMzU9My7vGrLC/0yRDJxCL0MWlBj9dXxSNrIgI
	cfM3phKLvg5gU87MZTbb1iOL52KJNrQczcagD/AIeZHnvXveIPb1GIvtTgb5ZhggIgXX
	pjczrDFEYCIP3WaZsFNj5keooC3aoKa5bzV81lVMhvLkXz6F/1f9hZZTYG6Eef6AJ0Id
	M2p6k1AJsJFQQSGP/QWFHIWIFrSJIxASlA9wCKaxtZv/guaLVA+XqyyXKXi9ZjZRCoVY
	PFEMuHe5pdgCxStuZ406A2/Lm+5JD++8+nmNwqtTHwIcXVhPh0h4/NrAc1AZlD7y6d1S
	BmrQ==
X-Received: by 10.14.149.3 with SMTP id w3mr119900eej.84.1376551183837;
	Thu, 15 Aug 2013 00:19:43 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	l47sm37388053eex.15.2013.08.15.00.19.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:19:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:19:18 +0200
Message-Id: <d5d8fde808e2ebb58940f41fb1b69b1962f23d24.1376551135.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][dylan][PATCH 38/60] inetutils: add PACKAGECONFIG for ftp and uucpd
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
X-List-Received-Date: Thu, 15 Aug 2013 07:19:44 -0000

* readline support is autodetected from sysroot
* add PACKAGECONFIG to make it deterministic

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
index 603bf01..d77dab8 100644
--- a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
+++ b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
@@ -24,6 +24,11 @@ SRC_URI[sha256sum] = "02a9ebde8a198cb85f87545b9d88fb103a183958139864a85fe9e027ad
 inherit autotools gettext
 
 noipv6="${@base_contains('DISTRO_FEATURES', 'ipv6', '', '--disable-ipv6 gl_cv_socket_ipv6=no', d)}"
+
+PACKAGECONFIG ??= "ftp uucpd"
+PACKAGECONFIG[ftp] = "--enable-ftp,--disable-ftp,readline"
+PACKAGECONFIG[uucpd] = "--enable-uucpd,--disable-uucpd,readline"
+
 EXTRA_OECONF = "--with-ncurses-include-dir=${STAGING_INCDIR} \
         --with-path-procnet-dev=/proc/net/dev \
         ${noipv6} \
-- 
1.8.3.2


