Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id DC80178093
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Dec 2017 18:22:00 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id u19so5758130wrc.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Dec 2017 10:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=baKMKPTyuo+XCSwpNRHBTunuorujZnPJ46nWVHaRcUQ=;
	b=IeQk/5SVltnX5eRsERVrweICHMo6TK+5gZUUyJkkPpd2afpeaQd7AOvAiHGbLV36l5
	9wy248jaevYxngCqaYsieYSqaWOtCE4mf9fNnfb+3jqjdof3Tng20fdzFVQXNNzC3WB0
	Jba6fGoQzYzik/mLQjhtjT/7Zx0nOkfrduzby5RmH9ADKgWRlz78HTwg0EAJKjmPz5ye
	9WCz05gVCpbMdCURUV84RYR/vT6lpcI9XHKlGqVzgjE9bGiV5CzaFr2KoQBwVw5npC86
	XcuzgEuBJK/UDu1xgI3RfoRRf5WnxTgrE1GRsnK18dPKnGpCKHAyqqUjlw/WpARiyDYa
	minw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=baKMKPTyuo+XCSwpNRHBTunuorujZnPJ46nWVHaRcUQ=;
	b=ulHo12Ed8Y47S40znOUr/YPG2fhHZfW1btw5YbbMat7Zbbb5p2g+36XgF07SdZmigB
	m76GJcnJUJmWjmzsfHzq3jlYkq47dwe3IWvem6OD1zgZdfiwUh9C3TVyxspy/s6U11pm
	t60vXWjJrzkmIj3drXKYbMq4P+xxQ4nOx4MFf5oVtITJdzbnD1LM6jdNvsyPUcqHkU7L
	DH06WxXtYD2VzQRJ9+2EDzl+li8lRoBn47lAX8qGTO4DMNdvGLkP+9FXXbB+V7wrjCA7
	iDr1KEHjIC0RYoxj/QbLQRkMQHEfht9h4cyQE4CWbt2UzRnRlBtgsSFV5J8xL3tS5Fcr
	nekg==
X-Gm-Message-State: AKGB3mJALOa3DyGI3IkJIMjHCMext6nlbdS1dZ/SSltV21B/HeULhvi7
	pqVHVLwLLsHj6zLaxHX+tjCanA==
X-Google-Smtp-Source: ACJfBouYrWR8+fNopd1GMlhX7idliAlvaRj1fYnTKu/zIiQ83SxRee207ovGtBRO3fdDvE93naOZ5A==
X-Received: by 10.223.134.1 with SMTP id 1mr15045096wrv.213.1513534921735;
	Sun, 17 Dec 2017 10:22:01 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC3E4151E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc3:e415:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id 139sm7762637wmp.7.2017.12.17.10.22.00
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 Dec 2017 10:22:01 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 Dec 2017 19:21:42 +0100
Message-Id: <20171217182144.21123-7-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20171217182144.21123-1-schnitzeltony@gmail.com>
References: <20171217182144.21123-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH][V2 6/8] fltk: remove fltk-native from DEPENDS
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
X-List-Received-Date: Sun, 17 Dec 2017 18:22:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This depemdency is a pre recipe specific sysroot remnant.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-support/fltk/fltk.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/fltk/fltk.bb b/meta-oe/recipes-support/fltk/fltk.bb
index 542fd66..619d142 100644
--- a/meta-oe/recipes-support/fltk/fltk.bb
+++ b/meta-oe/recipes-support/fltk/fltk.bb
@@ -1,6 +1,6 @@
 require ${BPN}.inc
 
-DEPENDS = "alsa-lib zlib jpeg libpng libxext libxft  ${BPN}-native"
+DEPENDS = "alsa-lib zlib jpeg libpng libxext libxft"
 
 inherit binconfig lib_package gtk-icon-cache mime
 
-- 
2.9.5


