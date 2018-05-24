Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f47.google.com (mail-it0-f47.google.com
	[209.85.214.47])
	by mail.openembedded.org (Postfix) with ESMTP id 8583574A0C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 14:39:15 +0000 (UTC)
Received: by mail-it0-f47.google.com with SMTP id z6-v6so2651345iti.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 07:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=SJXs+GST6+SOU9MgEqGopDFwf7M5lDra2VBZJPTKb9o=;
	b=hraNKRJ3/vFxAntVlDf/QAX488ciophXdWT7YHxngO+OaUhhjeqfLLQI4FeQMLa6Jy
	/qUkI3kOWotZ5H6eLUlYyhnqOP8AP8Dx+EoGfFeAT2FyBJCk2Tabk8g/IyVYMhDGI7w6
	DQ+ndm/DZXRJDHbd2IGb7nUeX4u+ID9aKyfA0BLAY1ifUK5OoCKF7LGlByxGLOLr34/M
	mAdVm8FyTI4muZEV/QDBJoEGQ2gdGfkOGzjeV/Lf4Dw3XxTBxcV+IH4lkal55XFMuUcl
	4m+d84uKxnZuPhdp9dCrIRTRN4+bLQctIRjwNWzOpqtbgDwjb3SImK7jvopFx2G7U17W
	yqMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=SJXs+GST6+SOU9MgEqGopDFwf7M5lDra2VBZJPTKb9o=;
	b=oRu7nM9nVSBH4weAOwXpyW8zNmwSs1/N6uhpvBRPHTuwHY2ZLzEL+44VVuF9xzZ6LO
	5qHoezzc8HvWnXrB/dRuhkZbMZPpvUhSd9CR9d1GogLEjcKFXKRGbyh2YmwkkrqiinCm
	bYQvORfTaOeAPx01Mk5efsCBcg7QlO4ezyjfzmzWGX2/0NQn7RxjIEFFRwYau//rreLy
	OhjSwYUxtDQYwLEusMWBn5G3E5FX48bRuTpEOLrQxrsJ+MdCNBXzKlJckYGyAL1PAuVs
	q8d7liLYE8/g5CSiJDHIytuqLSsMjnHMVWEqdwkWJZ6ok29WX6Z41ier0GDwZzXJE3Ec
	2ejA==
X-Gm-Message-State: ALKqPwcOiRFlSRVoLLLLPhCu6JCutP2r3fsKbXI0Vb+QPVqMkh6TmSmZ
	nP1rOzNq2tH2AZwRRxsZmATm4Ig0
X-Google-Smtp-Source: AB8JxZoSZr8LTuWp8h0tLvVfyWwfOHZTVGrSi+Ss8IR5+2rqu6onlJj8rXoejz08Qhv3Zo7FfroMQA==
X-Received: by 2002:a24:51d5:: with SMTP id
	s204-v6mr9455340ita.151.1527172755827; 
	Thu, 24 May 2018 07:39:15 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	a43-v6sm2435261itj.11.2018.05.24.07.39.14
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 May 2018 07:39:14 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 May 2018 10:38:43 -0400
Message-Id: <20180524143854.24096-7-twoerner@gmail.com>
X-Mailer: git-send-email 2.17.0.582.gccdcbd54c
In-Reply-To: <20180524143854.24096-1-twoerner@gmail.com>
References: <20180524143854.24096-1-twoerner@gmail.com>
Subject: [meta-oe][master-next][PATCH v3 06/17] msgpack_c: rely on cmake.bbclass to put cmake package files in dev package
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
X-List-Received-Date: Thu, 24 May 2018 14:39:15 -0000

The cmake.bbclass in oe-core now ensures that ${libdir}/cmake and
${datadir}/cmake end up in the dev package, so recipes no longer need to
provide custom packaging rules to handles these files.

	http://git.openembedded.org/openembedded-core/commit/?id=d91dc4666683a96e9d03cbbd21b8a546f9069c93

Originally-conceived-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta-oe/recipes-devtools/msgpack/msgpack-c_2.1.5.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/msgpack/msgpack-c_2.1.5.bb b/meta-oe/recipes-devtools/msgpack/msgpack-c_2.1.5.bb
index 02c0cd2964..3ae4c1f879 100644
--- a/meta-oe/recipes-devtools/msgpack/msgpack-c_2.1.5.bb
+++ b/meta-oe/recipes-devtools/msgpack/msgpack-c_2.1.5.bb
@@ -18,5 +18,3 @@ SRC_URI = "git://github.com/msgpack/msgpack-c \
 inherit cmake pkgconfig
 
 S = "${WORKDIR}/git"
-
-FILES_${PN}-dev += "${libdir}/cmake/msgpack/*.cmake"
-- 
2.17.0.582.gccdcbd54c


