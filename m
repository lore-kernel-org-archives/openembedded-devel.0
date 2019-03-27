Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id CADAE7D14C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Mar 2019 15:35:38 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id s15so19097677wra.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Mar 2019 08:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=heQX6Wtsnnwu6yXtRzFcrA3jME6jyeCxNZWHLazfA0E=;
	b=q/MEK+dWLSJXDqpaYRl9xw60yg2T6n/XGisVtc8rUu4VScEPkhdJphV1UpCBQoZECn
	oDSnSC1Pwx98cUEhQrFp2X/gFEp83WbhUALC5Bmakwo1kY3oklVPclRs7oMCpIM7wh9r
	HcL6mloC/MNLU/TSS8IxpKpFHq7/n4uVedQ7Kd/ogZ3dFEJee+HmsoK85uYQsTvGLpoD
	wMPxL3ohEozggtKwMIkcD0sHoOtFp7+wigM+uwvHz2CmQvS6cBUHENwPh9mIxuyTUymz
	xKM41Mg7yUudK0+hCdCQCywb+CxqxWOKygU2HxAcWjavxx0abeWb9OnfrrbdxWh0jBYM
	lJNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=heQX6Wtsnnwu6yXtRzFcrA3jME6jyeCxNZWHLazfA0E=;
	b=fdt3HGkhXwI45QJQxRPiOKG/UZBylOV/obzT6EFjegFm/YBg+78kgLJ8Cs3+hMz8TG
	b26IGytoEbnZVmhggZd7AT0W85ijIx2Mfv0M3nc6qRo53kvGfeBS4uk1AN3Bp0FfzxFW
	s0bQ3ZUwr+X41Ocuk6lk06Hb3Ym8dVL9mYJna16SnjCpWsyOw6BCa2j/mrPPGm8ZXdbU
	uGdudMcnhUQdPfSObEyxkK4ZPrQyumSByPMpYgl256f9KKCg3cHY48PFuRXpJJFtzyV8
	z1F0Qetwa/+vwP3lh3vMc4LPb6vTsgaGmAEX3zRZJLYUaZfWYHS/kQ0RJ6R0vm/Y8n5L
	Fe5g==
X-Gm-Message-State: APjAAAUk6lTeRKWSY30XHDFhDNuySqrLGsA/Q38zdr65Sr41EGiKJXXb
	YFQGcYxZwzmOJy0YuL3MDd1GtchZ
X-Google-Smtp-Source: APXvYqxZKB68Jd/L8MZJsoJtXX+oUeDdxqZYd8b7cNxinY60lduj288zXzu/XlCXuXdNESm+eGjg4A==
X-Received: by 2002:adf:dd4a:: with SMTP id u10mr25248862wrm.322.1553700939275;
	Wed, 27 Mar 2019 08:35:39 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163])
	by smtp.gmail.com with ESMTPSA id q4sm7517518wrx.25.2019.03.27.08.35.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 27 Mar 2019 08:35:37 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Mar 2019 16:35:03 +0100
Message-Id: <20190327153509.23928-9-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190327153509.23928-1-schnitzeltony@gmail.com>
References: <20190327153509.23928-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 09/15] libgsf: upgrade 1.14.29 -> 1.14.45
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
X-List-Received-Date: Wed, 27 Mar 2019 15:35:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../libgsf/{libgsf_1.14.29.bb => libgsf_1.14.45.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/libgsf/{libgsf_1.14.29.bb => libgsf_1.14.45.bb} (82%)

diff --git a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.29.bb b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.45.bb
similarity index 82%
rename from meta-gnome/recipes-gnome/libgsf/libgsf_1.14.29.bb
rename to meta-gnome/recipes-gnome/libgsf/libgsf_1.14.45.bb
index f5e2f1dd7..e63e26e73 100644
--- a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.29.bb
+++ b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.45.bb
@@ -11,8 +11,8 @@ inherit autotools pkgconfig gnome gconf gobject-introspection
 
 SRC_URI += "file://0001-configure.ac-drop-a-copy-paste-of-introspection.m4-m.patch"
 
-SRC_URI[archive.md5sum] = "3056b94bb3281dbc8311371bfc23cf72"
-SRC_URI[archive.sha256sum] = "4d8bca33424eb711acdb6a060cb488b132063d699c4fa201db24c2c89c62529c"
+SRC_URI[archive.md5sum] = "e45cc8aa9c49516d540b7d7307f755f1"
+SRC_URI[archive.sha256sum] = "5cbc2c0f1dc44d202fa0c6e3a51e9f17b0c2deb8711ba650432bfde3180b69fa"
 
 GNOME_COMPRESS_TYPE = "xz"
 
-- 
2.20.1


