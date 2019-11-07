Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id 2410C7FAAA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Nov 2019 11:44:04 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id q130so2063780wme.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Nov 2019 03:44:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=UYjMTSVhCff77/6Ig2f8ASVimmq+G68D3uJqzYaSU6E=;
	b=GdJ61EJa7szjZihCCoAvGcbCFz5ftJ/KkxEoCtN584Fr3/cGz3HsBuB2JZJM6VsAoE
	mClsyWy/Rj2LYyrAel3fUbYzgaoBChu+DbtIAczfF7WirjshnHXVaGD6zAbybSD1rbFD
	QEeix8TaGHmE8rAtszrwqBD9ItTx17+K4FsmEEABc71kGY4Iq7hBEvG0uVGCOnXK46wr
	RrwSxFWcEJ6nLnjHVSpIjNCUK/s8VRo3SXljVrFM+td5QPxxkublIZzge55DtgeF1PeG
	hst5zV7FfXyNl7osqDQFv4VkdkIY+VioSZUmTKF2pVartO31VLyESNX45z0/wv6y4fPq
	RnrQ==
X-Gm-Message-State: APjAAAW05ziurECLa1LPrnjCul0RaM7M/7GnOtcIMmi21n15CnsY8WUN
	kQNNzO+PSC7Y4uFk65IpbUQc3iW5
X-Google-Smtp-Source: APXvYqzRnpVBXo0FBzJ3574XwjnCE8Mt9VXtX2G3rNiHJw6/YOcAb47gmesyxdd514QtnhfWD8DTUw==
X-Received: by 2002:a1c:4089:: with SMTP id n131mr2581902wma.86.1573127044681; 
	Thu, 07 Nov 2019 03:44:04 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id 76sm2283613wma.0.2019.11.07.03.44.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 07 Nov 2019 03:44:04 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Nov 2019 11:44:00 +0000
Message-Id: <20191107114402.933-2-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20191107114402.933-1-git@andred.net>
References: <20191107114402.933-1-git@andred.net>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 2/4] nghttp2: update to 1.39.2
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
X-List-Received-Date: Thu, 07 Nov 2019 11:44:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: André Draszik <git@andred.net>
---
 .../nghttp2/{nghttp2_1.39.1.bb => nghttp2_1.39.2.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/nghttp2/{nghttp2_1.39.1.bb => nghttp2_1.39.2.bb} (75%)

diff --git a/meta-networking/recipes-support/nghttp2/nghttp2_1.39.1.bb b/meta-networking/recipes-support/nghttp2/nghttp2_1.39.2.bb
similarity index 75%
rename from meta-networking/recipes-support/nghttp2/nghttp2_1.39.1.bb
rename to meta-networking/recipes-support/nghttp2/nghttp2_1.39.2.bb
index 913065a04..c3f06a714 100644
--- a/meta-networking/recipes-support/nghttp2/nghttp2_1.39.1.bb
+++ b/meta-networking/recipes-support/nghttp2/nghttp2_1.39.2.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=764abdf30b2eadd37ce47dcbce0ea1ec"
 UPSTREAM_CHECK_URI = "https://github.com/nghttp2/nghttp2/releases"
 
 SRC_URI = "https://github.com/nghttp2/nghttp2/releases/download/v${PV}/nghttp2-${PV}.tar.xz"
-SRC_URI[md5sum] = "02b015cb178c46f27dd87228e33db35f"
-SRC_URI[sha256sum] = "679160766401f474731fd60c3aca095f88451e3cc4709b72306e4c34cf981448"
+SRC_URI[md5sum] = "de52cd6b587b76486346745514972995"
+SRC_URI[sha256sum] = "a2d216450abd2beaf4e200c168957968e89d602ca4119338b9d7ab059fd4ce8b"
 
 DEPENDS = "libxml2 openssl zlib jansson cunit c-ares"
 
-- 
2.23.0.rc1


