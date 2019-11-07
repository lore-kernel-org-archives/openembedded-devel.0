Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id C18EF7F7C4
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Nov 2019 11:15:36 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id t26so1949696wmi.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Nov 2019 03:15:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=rnX0t/Ffev9nZbcQa868h1pPsYMtVd0yH5HFslyUl6w=;
	b=XVwxKcv6+hibtcknaJFIv3i4rUWoZPruYigcO4MY9oQQxcczUTJzMSFhhIuhygqmOk
	zI9FlDKoLEmwbGMI/ScOINTawkztkRH99edLF00WD+cf8z/BqNXnsH777ZBTEXMrsroJ
	xZ/mXqAPoFQGdmaed62HMxGdHn6gqcvHpy3bfcM5J6dRqkJavVnml3GZoVqX4wchActN
	rWz7f4ws59/U8zB8PjthDVpU23yypTFUwBZ2UedatdHRkfO0M5m22xganxZGDg6yMLzu
	MXn5P0Cke1XXsjyBMHhcUflRORK8axzdJ6T2zG/J4+h2rKHGQA8OF0Jd3iE3FnDavzhl
	zw3A==
X-Gm-Message-State: APjAAAUM4s3NllOtjkJcF8+xucTZT6QrwcfUAgVjGgs8dGoyZgmxpY0C
	qzO0421H04mGxylbnDG21vxw/tEP
X-Google-Smtp-Source: APXvYqxuqt22RX5EMMXUnYnrNzQZeqszDDb8+ySy/2fCd5ptG1zE6Ei8p0inXvyTdtE5vHiyQcOxXA==
X-Received: by 2002:a05:600c:506:: with SMTP id
	i6mr2380495wmc.153.1573125337253; 
	Thu, 07 Nov 2019 03:15:37 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id d4sm428610wrw.83.2019.11.07.03.15.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 07 Nov 2019 03:15:36 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Nov 2019 11:15:33 +0000
Message-Id: <20191107111535.40523-1-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/3] jansson: allow to build a -native package
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
X-List-Received-Date: Thu, 07 Nov 2019 11:15:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This will e.g. enable us to use it from nghttp2-native

Signed-off-by: André Draszik <git@andred.net>
---
 meta-oe/recipes-extended/jansson/jansson_2.12.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/jansson/jansson_2.12.bb b/meta-oe/recipes-extended/jansson/jansson_2.12.bb
index 3cc353ee7..f47fe5725 100644
--- a/meta-oe/recipes-extended/jansson/jansson_2.12.bb
+++ b/meta-oe/recipes-extended/jansson/jansson_2.12.bb
@@ -11,3 +11,4 @@ SRC_URI[sha256sum] = "5f8dec765048efac5d919aded51b26a32a05397ea207aa769ff6b53c70
 
 inherit autotools pkgconfig
 
+BBCLASSEXTEND = "native"
-- 
2.23.0.rc1


