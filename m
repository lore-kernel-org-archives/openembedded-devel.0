Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id 4BF037FCCE
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2020 11:28:23 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id z3so25062135wru.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2020 03:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=nAWqUP8NHfROCTdj+FH2ZRyzRy1Uh03fnoSLR4bG8kc=;
	b=EkkFOjFdgcQjesmpaEi0j04FXskPs72XnN2j90lAKkSHPLGbBi2vU6oyKZNjFZ3mi5
	7Ac1CRHrkpmvZTL1BqZkXcI9X23Es4PWhuPsQT5iNLxFHGp15PCs7uGtKZ8Tley6CQL6
	r73arKUqh6rpjsAUZxxkSH6DrcovD3TMuhrCof+X0CjCp5gZ95+vsYOz6JGgZJJ1FyP9
	VpR3aN1LDN6FZuXVOqhZ9Uq7x1P1GFhOnGoA8O2WihmzWc+P8kXgyNvrUFSzIzSSN2/G
	QUaeJNBGKx6fs6FTmJTfzp5M9j9UZNR83bUM52ZH5UMNcJznJIZrfriGzSWQgpLFjF+7
	webA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=nAWqUP8NHfROCTdj+FH2ZRyzRy1Uh03fnoSLR4bG8kc=;
	b=RAk0uKaYwx3FbvFacNG0TMuQTKIb/uHEfatz99xHJP/dRGcXUMa4A1+spnuVlqYVWb
	etD1PIahAwE1dN/ePK6FdzffZIgBuZ9LPuE0UIUPPhNwMIR1/WTnPdc9sf78Nm5k2eut
	1bmLlizTXrKwnAGPWYL+4FJIjSNiL3AVHiUL2gi1COE1r8BCx55PivRVUaXBa5hvi9N8
	eix3fbuOYq2tbKoduVTQobUOxCVbxA+76Mzx0HnLYhGqAmsLEbtzC7vWWoFKt6JI9DeI
	bUZSYK8LGUdutugMiUSRst3mJHoD1YUslPChTfRT6RmiKHHqTvFKPBFPu0a+oI++4lab
	p93g==
X-Gm-Message-State: APjAAAUGvSx7MjJ7ZJXwUy7/0mBzai2SnVJjDjfVNikx/cE218C66fxZ
	YKYgLkjjRVNDFz4NUiFCSHzk47Zab0A=
X-Google-Smtp-Source: APXvYqzvmazOt3vKwTjL+MKZ2VntaO+O2FHOEeiZzjVZ58OF2bHWwb0H1qFm9kVpCYD3wLS5e0ZIaQ==
X-Received: by 2002:adf:dfcf:: with SMTP id q15mr7962773wrn.404.1579346903947; 
	Sat, 18 Jan 2020 03:28:23 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F3CA15804DD3CACFED9DBE9.dip0.t-ipconnect.de.
	[2003:f0:7f3c:a158:4dd:3cac:fed9:dbe9])
	by smtp.gmail.com with ESMTPSA id
	b15sm2965720wmj.13.2020.01.18.03.28.23
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 18 Jan 2020 03:28:23 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Jan 2020 12:27:54 +0100
Message-Id: <20200118112757.5287-21-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200118112757.5287-1-schnitzeltony@gmail.com>
References: <20200118112757.5287-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 20/23] fltk: add mime-xdg to inherit
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
X-List-Received-Date: Sat, 18 Jan 2020 11:28:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-support/fltk/fltk.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/fltk/fltk.bb b/meta-oe/recipes-support/fltk/fltk.bb
index 0d033f361..09344cf7d 100644
--- a/meta-oe/recipes-support/fltk/fltk.bb
+++ b/meta-oe/recipes-support/fltk/fltk.bb
@@ -2,7 +2,7 @@ require ${BPN}.inc
 
 DEPENDS = "alsa-lib zlib jpeg libpng libxext libxft"
 
-inherit features_check binconfig lib_package gtk-icon-cache mime
+inherit features_check binconfig lib_package gtk-icon-cache mime mime-xdg
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI += " \
-- 
2.21.0


