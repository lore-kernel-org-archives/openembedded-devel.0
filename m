Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f51.google.com (mail-it0-f51.google.com
	[209.85.214.51])
	by mail.openembedded.org (Postfix) with ESMTP id 4588D749F0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 14:39:28 +0000 (UTC)
Received: by mail-it0-f51.google.com with SMTP id j186-v6so2646943ita.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 07:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=jQBqjUm241lliZBAhtj01jNo8xTmy3hYWpJ8bINiDNA=;
	b=LC2WA396djE2Yg+OtpOQa6jVdEeTV9d8a0+8QZJv1lF4IhDWYYVxI+eagSZIF9okee
	L2pbavgqjZibkyrEHR77Ur53JN7j9fOotuPf19D7mZp99KJmRCFBtvrVHoEZ5aHV3at3
	d24CChuNByUKm7EeZY2vw7ql6jnZwBu8roZMARHQdrfS9IEb0k2noq9iUuHMhcHPPdAn
	hWtcq6cTwvme0flSM9yDVYKqgvALoyi/1DMnFbx9pcvjmbfHjjOMiSZmITxjn5HoMdGQ
	GAG7gXP32QInADzY3I0XjNGNy7wVnn1ASyr0Dl6jHbJHHPx4TKbq6Os6GW8IbEODJEWc
	Oubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=jQBqjUm241lliZBAhtj01jNo8xTmy3hYWpJ8bINiDNA=;
	b=o0RXnrDHXLmA7U7OB0A6gSu8GLfM+SbmnjYcflxAFYed3+XQnw3bzJE5Of7PiaqKue
	HAR1hvFzw1zLWJ8ixmjxzFFK++ZCP6LVOD9N/Dy74QbVYAjAtiRc5HGNcwwYHq/PLW03
	IhrlqsnkfkwJa1RN71RiESpJ+yw2HlgO98PSygfrlxXxawZSfQzI5kSScfydQ/2m7Usc
	d7sd2umlm1SVy8Z/YiK/4vM4L6GLFYdHuUhPPIkijwoDxCdyVMiEjIn1AKTHhGtY4nZ9
	gMygbijfy+nAEYX/3mDT3XGX3BdKwqeGr3jm93o/QAfBxds6zhen1QfxfY1t6E5e66rN
	XEBQ==
X-Gm-Message-State: ALKqPwcc6kBe4OGMSSsezciiWk1ptVSZY+hxL4foUmINa8eEeAUmjRHQ
	U2cI6r97xH9KcILLf7Hm24vGHZ1h
X-Google-Smtp-Source: AB8JxZo/w9Pirdb+6ejQUACF82UFaqZjG0h3ifyrzevH0R/60CWL++1Lq+89R3wJ84rgvfcC06LleQ==
X-Received: by 2002:a24:7b45:: with SMTP id
	q66-v6mr8794927itc.133.1527172768988; 
	Thu, 24 May 2018 07:39:28 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	a43-v6sm2435261itj.11.2018.05.24.07.39.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 May 2018 07:39:27 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 May 2018 10:38:51 -0400
Message-Id: <20180524143854.24096-15-twoerner@gmail.com>
X-Mailer: git-send-email 2.17.0.582.gccdcbd54c
In-Reply-To: <20180524143854.24096-1-twoerner@gmail.com>
References: <20180524143854.24096-1-twoerner@gmail.com>
Subject: [meta-oe][master-next][PATCH v3 14/17] libtinyxml2: rely on cmake.bbclass to put cmake package files in dev package
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
X-List-Received-Date: Thu, 24 May 2018 14:39:28 -0000

The cmake.bbclass in oe-core now ensures that ${libdir}/cmake and
${datadir}/cmake end up in the dev package, so recipes no longer need to
provide custom packaging rules to handles these files.

	http://git.openembedded.org/openembedded-core/commit/?id=d91dc4666683a96e9d03cbbd21b8a546f9069c93

Originally-conceived-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta-oe/recipes-support/libtinyxml2/libtinyxml2_5.0.1.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_5.0.1.bb b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_5.0.1.bb
index 8b5ab44fdd..c763a6c2b3 100644
--- a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_5.0.1.bb
+++ b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_5.0.1.bb
@@ -12,6 +12,4 @@ S = "${WORKDIR}/git"
 
 inherit cmake
 
-FILES_${PN}-dev += "${libdir}/cmake/"
-
 BBCLASSEXTEND = "native"
-- 
2.17.0.582.gccdcbd54c


