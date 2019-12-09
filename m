Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail.openembedded.org (Postfix) with ESMTP id DCB857E6EF
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 00:39:17 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id s14so12995363wmh.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Dec 2019 16:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=WuWascXObrxwxONnQc4ULQBtC2B+rEXMTYYx1XBtEys=;
	b=QPEuN0tgN9RfCHQgskV4EFbixeEaIyQpBeE8oKN8RH+FopHleqTZEBgANV8p9mMsqS
	/9CN/JXtV/bpuC0R7P+4hqg+ZyHXzusZq4j04Yuc+oLsMQ4RGBxdX0N6e0DH1cpBJHSJ
	Qm5MTZxMteuIXkCfgJ/IFxJ498585eYwJwkLgD8heCu0lUYZZrvnK3T6xR13W3xXYMem
	RG8uDwVE0UBXiv7AAPgxA7PaBk+R/I51FDOo2N3kFLidYDC0B3jA1F4UrN1UVLXpg9za
	WL6HncKBdIQ6YwbJYEQZa/xe2jVDA/IzkVCP1Yg/rHB6H78wWoEZHrdrocAoY6/c7lOL
	2rVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=WuWascXObrxwxONnQc4ULQBtC2B+rEXMTYYx1XBtEys=;
	b=HVhco7J0VFAIf44IJa10drC+5jkLNs7z3LJYcDyrusxkGD8zr7lZBXm+ccOa30bQkR
	NTa3QdDJNpjFLcAgfxcquTK27S9rEPYW3nSS7XzBElqmHIT3rq9uXTU1W5cCXWegeMUV
	zAxqTy9aPKVqJxAZ8qvj3czVFzyNFX9zrz930iCGrlAaAZDHNdz94qazIh0MO6mhYqYe
	poSvqJfI9yeY+C6EAev2x2jSLRvkk+KshgLg3N/oP2hA/DIwP3L8O/wJjoYO/KZAoK5F
	pO8GOFdOJLJkq3+HFpx/jOpgcsDRzD4t/oFcQZhDQ4nN4dBvXKm7Dq8DQfTnxoRIgK8D
	SZ5Q==
X-Gm-Message-State: APjAAAWCWsmh/10nJazkApVvIxsCmVeuW/DOj1JiE3kr0OS4fFoGRMPy
	LCIlFW6g5FfLoyD0JZT3Z7FRjBNC
X-Google-Smtp-Source: APXvYqxwjPE6SgbjH/tcEb47lwEbw+7qV/N/jWbS9XqIEbqlS7gfnXdFqVUnCbMYpYU4NlATm9tLgQ==
X-Received: by 2002:a7b:cc13:: with SMTP id f19mr22289727wmh.81.1575851958474; 
	Sun, 08 Dec 2019 16:39:18 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0A9021072C1E15EE839E10.dip0.t-ipconnect.de.
	[2003:f0:7f0a:9021:72c:1e15:ee83:9e10])
	by smtp.gmail.com with ESMTPSA id
	n30sm11403575wmd.3.2019.12.08.16.39.17
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 08 Dec 2019 16:39:17 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Dec 2019 01:38:37 +0100
Message-Id: <20191209003840.3383-27-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191209003840.3383-1-schnitzeltony@gmail.com>
References: <20191209003840.3383-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 26/29] yelp: add x11 to required distro features
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
X-List-Received-Date: Mon, 09 Dec 2019 00:39:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/yelp/yelp_3.34.0.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/yelp/yelp_3.34.0.bb b/meta-gnome/recipes-gnome/yelp/yelp_3.34.0.bb
index f6311965e..348727e44 100644
--- a/meta-gnome/recipes-gnome/yelp/yelp_3.34.0.bb
+++ b/meta-gnome/recipes-gnome/yelp/yelp_3.34.0.bb
@@ -4,7 +4,10 @@ LIC_FILES_CHKSUM = " \
     file://COPYING;md5=6e1b9cb787e76d7e6946887a65caa754 \
 "
 
-inherit gnomebase itstool autotools-brokensep gsettings gettext gtk-doc
+inherit gnomebase itstool autotools-brokensep gsettings gettext gtk-doc features_check
+
+# for webkitgtk
+REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI[archive.md5sum] = "776e29bd16424c8712cbf340cfe6429b"
 SRC_URI[archive.sha256sum] = "e3d6527c5963d73206891b32f1f23363164be57de248555513bd0be77a7bd045"
-- 
2.21.0


