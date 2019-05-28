Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id 557DB7DE8A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2019 19:28:07 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id h11so37827ljb.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2019 12:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=RXgMHWiWVYl/0tqIZ/VEqypT/iPo1jCJ5j2oYgFnKC4=;
	b=VH7mUgQ7I10U0ZFjOmq5+0anidA4DWNomObtwTg4JanF+/rIukZOmYnqgf092nGoy2
	BygeBbiz8TCPGfBStN03xyXw6TtBPXgdMil9Qpr+wnPe3bvnn3IukPp4BaIoAGDlgBPs
	WHWGRiE26g+iUm0y3ZYbgkSBy2o7xdoQJKDQk/Pll0QPhUoOA53ff4wM78KTZcJzybiz
	6HAOJxomOWPYgS9Mb+xcdC0j1gxRmbzrCF+4Nh+7oIeraF3N6wi5o6tQ4250zIrMNPSu
	4ZEVSgzkztK2sTCzWB++q6C4qJ7ZYnrOHMYWSN9dWnFWrU/hpzdMZj/5lw42VM58ZsMe
	xmHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=RXgMHWiWVYl/0tqIZ/VEqypT/iPo1jCJ5j2oYgFnKC4=;
	b=Rnz8pahM5Rg2PM0MCbMOijHgWwOt2hdoJtvUz7XFv8gj8UdWOnX/Y57qTKwJCmOChI
	/aE9Sfeec4SMLNJ6HF5ko0ZgMEDENr/dty8kYYBV5PD0zoM5ZBxmuhL/16zJJZZ48b2w
	+asmYiUjB4HYkqojVI7wr7J10FKCGTotrYYDAakbtySDypUmohBemk4ua+8/AF+gB7lb
	amURho/9n+y4tVXFJ/ImOyAEJSuI1QzEOrdmDojvJVxkRLPhYzOxnpVhwsXw2TGS6C/p
	pq2tQAfn+kQgaQ0WicWCn/OuanKsrTKqA4weTmxEEQrJG56x+MfiWnyXF6sp5vG8f//F
	CGsw==
X-Gm-Message-State: APjAAAUdSOeQ1c6U4XLY0JAkUX2ZhNSfhYo+Yj3J81HFt/dEMN1OZdEc
	rNhCuEBRk7wzvNVl7lMTT47x8cSN5IM=
X-Google-Smtp-Source: APXvYqzvPKKoBstjKYWPcGyMLRJPSSSAajkks+WQqKT98LcVhl0t5IdWVKxPVMi02a5G8GBDca8QDA==
X-Received: by 2002:a2e:88ce:: with SMTP id a14mr23291248ljk.122.1559071687599;
	Tue, 28 May 2019 12:28:07 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id e12sm589602lfn.8.2019.05.28.12.28.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 May 2019 12:28:07 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 May 2019 21:28:04 +0200
Message-Id: <20190528192804.15712-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] libghttpd: update to 1.4.54
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
X-List-Received-Date: Tue, 28 May 2019 19:28:07 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../lighttpd/{lighttpd_1.4.53.bb => lighttpd_1.4.54.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.53.bb => lighttpd_1.4.54.bb} (96%)

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.53.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.54.bb
similarity index 96%
rename from meta/recipes-extended/lighttpd/lighttpd_1.4.53.bb
rename to meta/recipes-extended/lighttpd/lighttpd_1.4.54.bb
index a0b350f358..ba1a2c54bf 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.53.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.54.bb
@@ -19,8 +19,8 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
         file://0001-Use-pkg-config-for-pcre-dependency-instead-of-config.patch \
         "
 
-SRC_URI[md5sum] = "f93436d8d400b2b0e26ee4bcc60b9ac7"
-SRC_URI[sha256sum] = "3bdfce1cf3e9650a556a8c26fb15342c5717c63f530c54693db632b0371dcb78"
+SRC_URI[md5sum] = "7abc776243c811e9872f73ab38b7f8b5"
+SRC_URI[sha256sum] = "cf14cce2254a96d8fcb6d3181e1a3c29a8f832531c3e86ff6f2524ecda9a8721"
 
 PACKAGECONFIG ??= "openssl pcre zlib \
     ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
-- 
2.17.1


