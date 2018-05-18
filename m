Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f177.google.com (mail-pf0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id E4C7B74BA0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2018 01:31:13 +0000 (UTC)
Received: by mail-pf0-f177.google.com with SMTP id v63-v6so2928366pfk.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 May 2018 18:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3eJRkhMAqM+Ih90W2xn/8ZiejjYnENm9/sxL7m3eeUY=;
	b=DnK24gJHAd+g2txMVzpieQLhtf+trou1Ur5li0YTN1VHGrmRymHvaPIv5xPy/VO8R0
	wzn7SdMVbGS3zubAi0ls85+2hhsc8lM+PIJ6vGQf69DtjYXvTsTMUTI0YJtJ9zKInnBQ
	LvN5y9+8eZb3TsjDKefyI7L+dCbV9XK9lFstn7eeuGw2kcBXlhAP1BeG54RBBl8cL0RS
	jI26NU3vKW/safBCVTtnd8R1DHSR4qE1rNkrA93fBrPLnxwYwt6qXu0bAgwcgJehWI0z
	3vrjfCEUdvQI2ha3DJqBSxYPUMZXat8zNGuy5SqVajQXk5vgGriJlWslyrX4i+JGG0u0
	t84Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3eJRkhMAqM+Ih90W2xn/8ZiejjYnENm9/sxL7m3eeUY=;
	b=mDeGefEtOZ4jT7ehbWdEFtkrH5BUPAcorJN9x2stc3DTFAQbLOC8VvEJodtnP1hrZF
	wbJwk+UIJnjdihPLp8pLFGP4imYjewhmdkTgG6yG6YcirukWLslcysHKY4ey0EW9MGqw
	n0hZO1udYjMv5QuSVhYBiSMq5fqFEgc3aGWFJjb72UB86bMMmRw5mvMDpImB2O0xkAJy
	oHVJ8dfMmyYQONk10TBmJ8qYdAwz+r36/AIJ0DZsVEiRdi9xxo3xYm+ZObi2xlVEENcO
	95Pzc0LYx9lIQuwiV/Dq/YFcDLJoBDMKCPS5ZNmDs+FJGEEUEripfOg/a0IE1pHHs/PG
	mlfw==
X-Gm-Message-State: ALKqPweIhfJUW/fuZ+KRd5P1HX2MA/tUlBAY2ZPvZlAO4bhtfgPTi2vY
	ObjoJJIfIcIWTMne2f7ZM9X8bg==
X-Google-Smtp-Source: AB8JxZomlOf5YPToqLS9wJoNGIxqCYnRjvmCnju1QJ4Av4Qi4gIX1jOImOEedka/nxwdajIJRHSMpA==
X-Received: by 2002:a62:99d7:: with SMTP id
	t84-v6mr7348620pfk.252.1526607074733; 
	Thu, 17 May 2018 18:31:14 -0700 (PDT)
Received: from localhost.localdomain ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	n25-v6sm9428562pgd.5.2018.05.17.18.31.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 17 May 2018 18:31:14 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 May 2018 18:30:37 -0700
Message-Id: <1526607046-8081-8-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1526607046-8081-1-git-send-email-armccurdy@gmail.com>
References: <1526607046-8081-1-git-send-email-armccurdy@gmail.com>
Subject: [meta-oe][PATCH 08/17] msgpack-c: rely on cmake.bbclass to put cmake package files in dev package
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
X-List-Received-Date: Fri, 18 May 2018 01:31:14 -0000

The cmake.bbclass in oe-core now ensures that ${libdir}/cmake and
${datadir}/cmake end up in the dev package, so recipes no longer need
to provide custom packaging rules to handles these files.

  http://git.openembedded.org/openembedded-core/commit/?id=d91dc4666683a96e9d03cbbd21b8a546f9069c93

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta-oe/recipes-devtools/msgpack/msgpack-c_2.1.5.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-oe/recipes-devtools/msgpack/msgpack-c_2.1.5.bb b/meta-oe/recipes-devtools/msgpack/msgpack-c_2.1.5.bb
index 02c0cd2..5077ade 100644
--- a/meta-oe/recipes-devtools/msgpack/msgpack-c_2.1.5.bb
+++ b/meta-oe/recipes-devtools/msgpack/msgpack-c_2.1.5.bb
@@ -15,8 +15,6 @@ SRC_URI = "git://github.com/msgpack/msgpack-c \
            file://0001-Fix-Werror-class-memaccess.patch \
            "
 
-inherit cmake pkgconfig
-
 S = "${WORKDIR}/git"
 
-FILES_${PN}-dev += "${libdir}/cmake/msgpack/*.cmake"
+inherit cmake pkgconfig
-- 
1.9.1


