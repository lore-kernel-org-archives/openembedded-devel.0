Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id 102B47F838
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Nov 2019 07:17:45 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id t26so2177255wmi.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Nov 2019 23:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=GXAc5vAGEjQkZm25aqkBEsJkO1t6rh8bS+sOi7W+1H4=;
	b=UO6ixDSOPIyn+sR9h3zY3VaePrfQtg1wPMs2ZdEQYKZfy9Vw40Fm15QOG4jdFw67J5
	PLni+etWafv68qlSG6iUfOm/8x59gVGAtidwSGNuJ9/N0ZPHjQF2OQm5+kfmoZk8OAGa
	G/oIWNvm8JKgMfJA/pSi8IcT6TThKFrH53/ZZo1o7/qA5aq23duSD9pkgXDfM6jayL+Y
	9GeyAZ4XnAcjAvzNZy/f+Cm0ofwsnmEEf/Yd24GN3ffl+3ZP9+7UhvUmuwmn80CwwrJx
	j64n6QdHCqq6FKfwZHDsxbWwebQVif8ntRM4ntADVjT4I7exNSe2UxwyU5alAyxdRkPW
	tApw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=GXAc5vAGEjQkZm25aqkBEsJkO1t6rh8bS+sOi7W+1H4=;
	b=tHcR0SJWWldKxmjzwr48DR8ukJWfd61d8qstPJcycF+EDGSn6JWolgQAJ3GhVCDRBt
	MF1AvPl6ldTrSiuGQirmWNJpC2grFizSVo+SVKUS+WgEOpNllqT9fH7PJ6NY3OzU3OJy
	SPIU4wV5zlqkZ8FqbYFPTlMAdOf3WN/6K1ZJXBUuRdtXuvpNuT+t8YNNDrs7k3WtY0pT
	9APNlYWrjFKXRfDKxHyNJs8boH6Lap/2ehwyXuAZTXhowg632IxUwfRGHnlaDZNPrR3I
	QjhJQ6HEeVos70OOjd1N0WRmDDESLQcqvxu7fn0hvhr1awhNoXznu/9H8Yy/nKP2vp1k
	LJcQ==
X-Gm-Message-State: APjAAAVhKfA6Onrn46n0kOpoPSQEXT6azWF+4gQ51sM4sgne5Jxt1vi/
	jcAOMHuBCEUvMAFZLrMuIlmmKWtM
X-Google-Smtp-Source: APXvYqwqSjDE4BTCE7K/13HE9ohyABzjQiUJA/jqc2gZL5lX5JLDpEywRGB0uX1EsLHNxr4UeAU/nw==
X-Received: by 2002:a7b:c748:: with SMTP id w8mr3939389wmk.114.1574147866249; 
	Mon, 18 Nov 2019 23:17:46 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0CB657F29A81DEDF319DFC.dip0.t-ipconnect.de.
	[2003:f0:7f0c:b657:f29a:81de:df31:9dfc])
	by smtp.gmail.com with ESMTPSA id
	b1sm24480182wrs.74.2019.11.18.23.17.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 18 Nov 2019 23:17:45 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Nov 2019 08:17:27 +0100
Message-Id: <20191119071730.2682-7-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191119071730.2682-1-schnitzeltony@gmail.com>
References: <20191119071730.2682-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 6/9] libgweather: add gsetings & upstream-version-is-even to inherit
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
X-List-Received-Date: Tue, 19 Nov 2019 07:17:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/libgweather/libgweather_3.34.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/libgweather/libgweather_3.34.0.bb b/meta-gnome/recipes-gnome/libgweather/libgweather_3.34.0.bb
index 2d31be08d..69d25362c 100644
--- a/meta-gnome/recipes-gnome/libgweather/libgweather_3.34.0.bb
+++ b/meta-gnome/recipes-gnome/libgweather/libgweather_3.34.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 GNOMEBASEBUILDCLASS = "meson"
 
-inherit gnomebase gobject-introspection gettext gtk-doc vala distro_features_check
+inherit gnomebase gsettings gobject-introspection gettext gtk-doc vala distro_features_check upstream-version-is-even
 
 SRC_URI[archive.md5sum] = "52c3b1e27887fc88f862c92c42d930c1"
 SRC_URI[archive.sha256sum] = "02245395d639d9749fe2d19b7e66b64a152b9509ab0e5aad92514538b9c6f1b9"
-- 
2.21.0


