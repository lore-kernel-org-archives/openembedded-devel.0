Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5B3C879A6A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Oct 2018 10:49:15 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id y16so863873wrw.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Oct 2018 03:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=gvRrK+hDxTAQQob+gUZB30wPpYbRWsruB+2bB5aOKQ8=;
	b=J2OYrHxuE8Dtp/0e1QtN5loR6pHRL7lp6VCyUF/pt2QNFNKuf8bJlTy6bPU8ntcg5l
	zMbA+dJ0HcvfapQRDtgCEqI5JDmi7dRBJ6pqQnEabZszJMr+6ItORtzdJAK+zDQ1r6iw
	1DtjH6RvHOfvWbRqQ3IFAHITgDfoG6O72S+PkO+0nExwUQ4GCRNtRFbNQvPZrXqSJW9J
	PqdxlWDEuf0tf4fT56mTV46XybmcL/8hk0cBQJfbVAKRRbdJ7OHzuiO5boIMcztlcVdT
	kvcPGOgFkkyvV4kEmwpj+JBa245rQd/nFPK3k/rcKZoF4AECxB1bevy2prgNEQmJBSpw
	PMRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=gvRrK+hDxTAQQob+gUZB30wPpYbRWsruB+2bB5aOKQ8=;
	b=QiYSL0g/9X9vCQ9mAa9BQGITbvezkjJds9vxRd3cOmHtwFWOUQ+ssTKDmM6FyWl6pc
	tuXRAA+NBTS9cVtU98HWa/GmMfNacT2VIxE1/saDwvL8F7x8vGvJwmhdKcEFtjEOKWPi
	zD2HOd5rl2P2Hg1zOEPlV+sx8zeOAvKeE1LWfRLX914Y8Y/zMuCiFWCWt3rhem/5cZ6Y
	iSwOwSN9S+mCZzA0xVT8YPPa0q3MI1Xp4Ik7Vt+ZCmMnV5gekzYSYrUmkSFV40u2Cwta
	lrOPxgFrkcmPjk4PANgvMTcZWGg+Ics79F8xgxnPRGfH8EOWhZF/Z63wKwiy4Lqh6xVU
	HVRw==
X-Gm-Message-State: AGRZ1gJASScDlWppj/WAGnul+mJ48cSH5ii3JG5J72s7XdE1u85nEF4A
	gb5MwV8d+EkeYO7ZBrZhQqjdwWGv
X-Google-Smtp-Source: AJdET5ekjYb40oiC9EGNw5eZQGUyQZMOuQYBNtkICVka9h31ZmZsFuOIzlL9HLDbC/wKriTO8nte1g==
X-Received: by 2002:a5d:698b:: with SMTP id
	g11-v6mr5569487wru.159.1540550955550; 
	Fri, 26 Oct 2018 03:49:15 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163]) by smtp.gmail.com with ESMTPSA id
	x8-v6sm23905660wrd.54.2018.10.26.03.49.14
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 26 Oct 2018 03:49:14 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 Oct 2018 12:48:53 +0200
Message-Id: <20181026104857.32142-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.5
In-Reply-To: <20181026104857.32142-1-schnitzeltony@gmail.com>
References: <20181026104857.32142-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 4/8] poppler: upgrade 0.69.0 -> 0.70.1
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
X-List-Received-Date: Fri, 26 Oct 2018 10:49:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-support/poppler/{poppler_0.69.0.bb => poppler_0.70.1.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/poppler/{poppler_0.69.0.bb => poppler_0.70.1.bb} (94%)

diff --git a/meta-oe/recipes-support/poppler/poppler_0.69.0.bb b/meta-oe/recipes-support/poppler/poppler_0.70.1.bb
similarity index 94%
rename from meta-oe/recipes-support/poppler/poppler_0.69.0.bb
rename to meta-oe/recipes-support/poppler/poppler_0.70.1.bb
index f7e34cf2a..b618f28c5 100644
--- a/meta-oe/recipes-support/poppler/poppler_0.69.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_0.70.1.bb
@@ -8,8 +8,8 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://0001-glib-CMakeLists.txt-Add-libpoppler-to-link-along-wit.patch \
            file://basename-include.patch \
            "
-SRC_URI[md5sum] = "0881d921de62673ab558872dadc2b27b"
-SRC_URI[sha256sum] = "637ff943f805f304ff1da77ba2e7f1cbd675f474941fd8ae1e0fc01a5b45a3f9"
+SRC_URI[md5sum] = "fdb0699e9aa20e81acd1a50701374c8b"
+SRC_URI[sha256sum] = "66972047d9ef8162cc8c389d7e7698291dfc9f2b3e4ea9a9f08ae604107451bd"
 
 DEPENDS = "fontconfig zlib cairo lcms glib-2.0"
 
-- 
2.14.5


