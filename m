Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id 9E7836C1BE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2019 15:48:00 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id t5so2875102wri.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2019 08:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=kjX9ECKW+4wH/v0DKYA0zBj88ypEoKZwPGhnmoDWYfs=;
	b=RDLsjwEO56t79uSk30PBdqJ3pQDTZwVIH9MPLnE9s7nEPRJ2Ey+O2HZBYu3a/Ch3UK
	f/WyWYl9YBOAet7n2w/qdz15HRpkqJQY2gP8FLNW5OmMMFHRc1fAocde8SrLDqxYrsJc
	OvpADZEvJ9MhzlWlif4qhecokLNWQTsQZLE2QLOWkCBkbAXILD61CSRvXsyMUA+BgD5j
	je9/VKFv9Fp0Px9DLwk7pZvaigbzx9k5XDwEyroHm12M7KW687bnjRB+0kdYCZfWNPMF
	Ph9mAX7HXMXwCkSXK4yhMWq9VKgnEeKriVv4aJTAUHFtkhfSgFmpYRqGcepbhPIa2Gpm
	d80g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=kjX9ECKW+4wH/v0DKYA0zBj88ypEoKZwPGhnmoDWYfs=;
	b=Z6dTTBVsjFIhx1TzhqtN53Yi46XRdFu0rJVX9wCz+3dIKXV3uoTPUoMMdF88lqN4z9
	X/ei08exjqah5WL037Nb7+BFln4/z0C4xat4glNVYfLzprAXaAIEuotNCukrFBbo+6mY
	WCbJ3eF4lPHtkqbGRdR+AaeZn4Qt0jLVZySLIr6z6wcfTRGet7Oj4Lp0AVJn4xT6C4sO
	RTgpWFHg3Ut2lzX7oXpaY1xP0yd+vISeMnyrZn708Oi2XrSF5zBvIRhc8Ia0qH1oxBWu
	GbWM/fUN/8JFRGNfw1wiAVzTYLpSXapu8fMlj0XLBjgtX0nyKt2nKaI1VMGjihizIs7r
	rQVA==
X-Gm-Message-State: APjAAAWh/kMMoZCAQa+Xv3nSeZ+HUOGNt2zjiwYbW/TwLTr1t2ZQoDQT
	g6UwRiuMpGfO+5LeVot6IUzJtdWL
X-Google-Smtp-Source: APXvYqxQsAfmNTo6Sic/zbpAPfiKPgPtToxuZIINlhAvndrsp5GW3J3zthvN6JsrRDtBoNIVlG8bPQ==
X-Received: by 2002:a5d:4492:: with SMTP id j18mr2323311wrq.212.1553269681010; 
	Fri, 22 Mar 2019 08:48:01 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163]) by smtp.gmail.com with ESMTPSA id
	z10sm1488234wmi.15.2019.03.22.08.47.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 22 Mar 2019 08:47:59 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Mar 2019 16:47:41 +0100
Message-Id: <20190322154741.22403-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] poppler: install API headers as we used to
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
X-List-Received-Date: Fri, 22 Mar 2019 15:48:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

ENABLE_XPDF_HEADERS was renamed to ENABLE_UNSTABLE_API_ABI_HEADERS [1]

[1] https://cgit.freedesktop.org/poppler/poppler/tree/NEWS#n72

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---

This is a fixup for poppler upgrade just sent. The only excuse I have for being
late is that the only fallout I saw was good old libreoffice and that takes >10000s
these days...

 meta-oe/recipes-support/poppler/poppler_0.75.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/poppler/poppler_0.75.0.bb b/meta-oe/recipes-support/poppler/poppler_0.75.0.bb
index febdc8eda..0704f1a2a 100644
--- a/meta-oe/recipes-support/poppler/poppler_0.75.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_0.75.0.bb
@@ -31,7 +31,7 @@ SECURITY_CFLAGS = "${SECURITY_NO_PIE_CFLAGS}"
 
 EXTRA_OECMAKE += " \
     -DENABLE_CMS=lcms2 \
-    -DENABLE_XPDF_HEADERS=ON \
+    -DENABLE_UNSTABLE_API_ABI_HEADERS=ON \
     -DBUILD_GTK_TESTS=OFF \
     -DENABLE_ZLIB=ON \
     -DCMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES:PATH='${STAGING_INCDIR}' \
-- 
2.20.1


