Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 65C747F891
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jan 2020 01:52:38 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id b2so806976wma.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2020 17:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ZubWxjrVH/0y3saVbmjiewEtUlri6yBaNv3piUyyFH4=;
	b=fmCvXnEusdk+LeIr6jmwVWcSnYCAQ9B/6gSS9CGX7zg2qIHd35AqX0D/q5g5Nv3y8N
	kz4CPnQda9bhwLr88xR3hBuDZcevw/V7ueGL0PHBO60aqoemnEO+Oj6u0v27Cokf66Wa
	9Gox+cWRo+1DmLcgvc0PH853/wvSD58tCyL1c0av2Pvz3szt3VFKyl7H3fazW+ZxM5b/
	Xe0nX70l4Cy/c4WnAWobY1D5QN4IzMM7lCEpKD2X7S0k6WWyv6Pnju0gRZ1CA5jNQhx5
	vNwonSbX34/FIKaF5U27/6DmqG/bZtS/ML69G+VcY7lTLKRlQccOUCIpugsTpOeQ9ZlQ
	ii5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ZubWxjrVH/0y3saVbmjiewEtUlri6yBaNv3piUyyFH4=;
	b=FNTromWnABCpiY9s3sAeExzdm8H9StDB7BNljH+CBBeIZETA4ms+koZ7nNA991AFTG
	vXnEIjlI26POkEgFw83JCi2Kfqf1BNU+xYO6klIRX1TwrD0ThR3O/aXqBuY+fQWCFmxY
	GClfLJ7C6YWsomLdDP7ENH31P6xGXlxxvLoW0tSw8NVVwnLBUZRKEOa9k90N+Sk1kye8
	mJ8HD181bVo3CJGaiDJgXTLV+1JMrUXjrihMY6A4kVyHn/QoCzlUC/Q4kr5drEg4K/+3
	elZgYzkGQ95rtoPgtqvZqglyaVg10SR01nPEFumVvo3qWaA9wEIhz7fU/8Iu013FW2Kz
	D2yw==
X-Gm-Message-State: APjAAAXzALsaH15oJigQl3auNjN/iDLoWTflcOv005WzV8jscAB2IZpg
	Gr54ZNxfo9XQLSYElGB7CcJRVraN
X-Google-Smtp-Source: APXvYqzirACm/dGG2i43c1QSIyOVjI1ee9NQAkOxqd/IPzjT3I3LusZ9h8vzvyHsdalzjUhWFq630g==
X-Received: by 2002:a1c:4e03:: with SMTP id g3mr1634916wmh.22.1580176358815;
	Mon, 27 Jan 2020 17:52:38 -0800 (PST)
Received: from localhost ([109.238.218.228])
	by smtp.gmail.com with ESMTPSA id r15sm874307wmh.21.2020.01.27.17.52.37
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 27 Jan 2020 17:52:38 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Jan 2020 02:52:32 +0100
Message-Id: <20200128015234.13000-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/3] mozjs: search nspr header files in ${STAGING_INCDIR}/nspr directory
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
X-List-Received-Date: Tue, 28 Jan 2020 01:52:38 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/mozjs/mozjs_60.9.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/mozjs/mozjs_60.9.0.bb b/meta-oe/recipes-extended/mozjs/mozjs_60.9.0.bb
index ef42ad2f2c..4f2da492fb 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs_60.9.0.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs_60.9.0.bb
@@ -53,6 +53,7 @@ EXTRA_OECONF = " \
     --libdir=${libdir} \
     --disable-tests --disable-strip --disable-optimize \
     --disable-jemalloc \
+    --with-nspr-cflags='-I${STAGING_INCDIR}/nspr -I${STAGING_INCDIR}/nss3' \
     --with-nspr-libs='-lplds4 -lplc4 -lnspr4' \
     ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', "--enable-gold", '--disable-gold', d)} \
 "
-- 
2.20.1


