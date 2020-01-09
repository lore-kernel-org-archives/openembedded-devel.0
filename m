Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id 6AA027FE0A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jan 2020 21:05:28 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id m24so4524868wmc.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Jan 2020 13:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=VrcLzaQu7FgVxyRbFKxO9ccGjamKMn1Hk3eaSNuLEuU=;
	b=E76wDiamwC1c8l6BSvtdiCdNx9YIuR5vjDfQHXtT+jNf524E+5wwJY5ZMGBbro2i4a
	wXaLnO6bV6WKbGYxB9KQEcnUC3/5jzmw4N+MMvVJsyviBg9nnlyg5cAQjxBsHzF9iD9u
	SZB8YXAD+ZE5bMI4G6ZR6wGkPlCSGWCeXSZ/7mT9iNIe4x4ubmW/RJpomjDeNggkj9vR
	gp6FWnvxvaE/OgCizZuSrJpxmc7LycA+1k4Kg3gxB0RhnAtEGDNFUHdW2fI8AK/4hMII
	/LYhVbyjzhphKmsxQEQohzD4QysaNXB2nlxH9LRZrp1/j5Q9fELmq8HQJMYixbD1MtgR
	bxVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=VrcLzaQu7FgVxyRbFKxO9ccGjamKMn1Hk3eaSNuLEuU=;
	b=qOXLQ3nNXGNSfaWYIV1KSMDraDOKmZ2cIQJ2c1BU5Ng/dDKvAnXC9Oic3V1h698p+7
	Aojc/hqi+4Hi0dcqrSyTOxQMb0aLchhWQGucz7hO91iD645xo3afKfLyHaHirQPOU44y
	yWRTVpC8dDJMcoecOvQh8420vkRjaGD4vKXs0C+OYi2kMuNcfW3EkUvM0URH67m0nLKQ
	rWvmfntBxeGA1YqBYWTjgHyzz6mr7bsRv7C+mY+K91Lrhuzk6L+TBM6pBVr6CmFGvaD8
	On/ZaojX7NRzDl+IdYJdqAN0KO53+/731IDtv+Jut7H1RNfbiEV8Zblsy+3uuO+XCQg7
	8fcA==
X-Gm-Message-State: APjAAAVFrI4u4C4RKSGStc8nOkz1sC6ck8rAJmXmw0osVVyXQ7Ot1NKY
	dpC3EXbryYeOFBZuhTQrUd1TjtuIP7E=
X-Google-Smtp-Source: APXvYqx0gJj2sgMXsgr3ykzAmLM4frtfwZFAyB6CvTjtdcApwV15SldQ4Lw6g60JSVrL2V/H7pnReg==
X-Received: by 2002:a1c:a543:: with SMTP id o64mr6568067wme.73.1578603928970; 
	Thu, 09 Jan 2020 13:05:28 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0446528B12EBEBA10192C2.dip0.t-ipconnect.de.
	[2003:f0:7f04:4652:8b12:ebeb:a101:92c2])
	by smtp.gmail.com with ESMTPSA id q6sm9825041wrx.72.2020.01.09.13.05.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 09 Jan 2020 13:05:28 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Jan 2020 22:05:13 +0100
Message-Id: <20200109210518.22451-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200109210518.22451-1-schnitzeltony@gmail.com>
References: <20200109210518.22451-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 4/9] gnome-shell: upgrade 3.34.2 -> 3.34.3
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
X-List-Received-Date: Thu, 09 Jan 2020 21:05:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Frmo announcement:

* polkitAgent: Fix confirming via keyboard when password-less [Jonas; #2066]
* Misc. bug fixes and cleanups [Florian; !906]

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{gnome-shell_3.34.2.bb => gnome-shell_3.34.3.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-shell/{gnome-shell_3.34.2.bb => gnome-shell_3.34.3.bb} (91%)

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_3.34.2.bb b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_3.34.3.bb
similarity index 91%
rename from meta-gnome/recipes-gnome/gnome-shell/gnome-shell_3.34.2.bb
rename to meta-gnome/recipes-gnome/gnome-shell/gnome-shell_3.34.3.bb
index cd8b3ad0a..463fbf46f 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_3.34.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_3.34.3.bb
@@ -30,8 +30,8 @@ GTKDOC_MESON_OPTION = "gtk_doc"
 REQUIRED_DISTRO_FEATURES += "gobject-introspection-data"
 UNKNOWN_CONFIGURE_WHITELIST_append = " introspection"
 
-SRC_URI[archive.md5sum] = "b01d6772917148c81d472584f6b36c83"
-SRC_URI[archive.sha256sum] = "703264db2fafe02d1db53d701cb99a4a757c46e7569e7b9d690dda009fc03b4d"
+SRC_URI[archive.md5sum] = "a0f7d78f57616076890f0e3b7f12196a"
+SRC_URI[archive.sha256sum] = "2474bef386c5a47d7be285aa22e24125c46ba5f860a25a1a36a90de4e456bd8a"
 
 PACKAGECONFIG ??= "bluetooth nm ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 PACKAGECONFIG[bluetooth] = ",,gnome-bluetooth"
-- 
2.21.0


