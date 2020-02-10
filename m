Return-Path: <twoerner@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id A12A360B58
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2020 22:49:18 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id a2so7805447qko.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2020 14:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YFTzRYz9aLvHoFHbj53eGe/udjuMwt6D36kjYSeEQAE=;
	b=vdei5Ct+f7ruilYVAtN6e0+8iradkxcVWKm0+oknd+4DG8zA9eXj2eYOgUmPFKrYnY
	DwjQJ5OJhz4kmi6AeknHLAurpFwIT7Ibpixe1y+rjvv/H8E8q9hGMmOFl15faXTdPDZl
	fWFEanAnjvw8n5BAzQleXZx9Jsa5blA3GtVA2vh9E2NRpWm84Vtw7vMk9GnMfJ1Lto9w
	/Dsk5wNeStPbspUtukio9WpaaZlfTxyd5bQmwTX58jSpsDCPyrSdaTIOaXB4QBMjZ4J8
	JKV71BaN9MlGM73nguXEo5XmyFQ1hBDqG/r2bChC1AYju3ckZZ6JamKhfa97r101F2JZ
	g16Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YFTzRYz9aLvHoFHbj53eGe/udjuMwt6D36kjYSeEQAE=;
	b=ayj4d1QVWg5O83M3O1br3hNPLYhQSbsWJQEtkn682AYKWKiOA0+sawo3Os1ALS5Spc
	JWPLNcDp2guaKsWcQNb3oNG0YbmTqoqrFM6/BEFxCV/FDGsb6MzGje6k81AslSwpDkZx
	3X93Q4M8ADQ4csi7GG5lopQnUt6tHXeY1hvCX+AVYIAXJ6KUJd/vJoRZgQCUdluTlv35
	lsXC5ZOCM9Gh40n0Kiqg04d/rOr/gfgkUfnfGpGEXUqhAlAY3uPnYjtC2bjdVHlAWjww
	kd6ThfCZVD8XfoH17POelQZd+pBHE+y8k3+DAmFLapkVnT2hu49sIJUmYM/itsBTbqTQ
	9Rcg==
X-Gm-Message-State: APjAAAXuMnPzUXGggrC8NtV7NRMuautgslIHGK+F0iJQFY8UcephJ+2X
	zO7PaO84p9jHMEOKyr3hsYYofL3OLqI=
X-Google-Smtp-Source: APXvYqxZqf/gXHYG4Fo480ND7+/dtFmeBF313NfD9bmAFlDkJ4AiXaFYc9rJZeYdSm//GYXWjlp1HQ==
X-Received: by 2002:a37:f60b:: with SMTP id y11mr3053957qkj.183.1581374959293; 
	Mon, 10 Feb 2020 14:49:19 -0800 (PST)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id t23sm898360qtp.82.2020.02.10.14.49.17
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Feb 2020 14:49:18 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Feb 2020 17:49:08 -0500
Message-Id: <20200210224908.13941-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.25.0.114.g5b0ca878e0
MIME-Version: 1.0
Subject: [meta-perl][PATCH] packagegroup-meta-perl: fix package name
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
X-List-Received-Date: Mon, 10 Feb 2020 22:49:18 -0000
Content-Transfer-Encoding: 8bit

There is no libcrypt-openssl-guess package, but there is a
libcrypt-openssl-guess-perl.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta-perl/recipes-perl/packagegroups/packagegroup-meta-perl.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/packagegroups/packagegroup-meta-perl.bb b/meta-perl/recipes-perl/packagegroups/packagegroup-meta-perl.bb
index 9d0e33baf..9b2406ba6 100644
--- a/meta-perl/recipes-perl/packagegroups/packagegroup-meta-perl.bb
+++ b/meta-perl/recipes-perl/packagegroups/packagegroup-meta-perl.bb
@@ -16,7 +16,7 @@ RDEPENDS_packagegroup-meta-perl = "\
     libtext-wrapi18n-perl liblocale-gettext-perl libdata-hexdump-perl \
     libextutils-installpaths-perl libextutils-helpers-perl libextutils-parsexs-perl \
     libextutils-config-perl libextutils-cppguess-perl libimport-into-perl \
-    libcrypt-openssl-rsa-perl libcrypt-openssl-guess libcrypt-openssl-random-perl \
+    libcrypt-openssl-rsa-perl libcrypt-openssl-guess-perl libcrypt-openssl-random-perl \
     libxml-sax-writer-perl libxml-libxml-perl libxml-filter-buffertext-perl \
     adduser \
     libauthen-sasl-perl libnet-ldap-perl libnet-dns-perl \
-- 
2.25.0.114.g5b0ca878e0


