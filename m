Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
	[209.85.208.175])
	by mail.openembedded.org (Postfix) with ESMTP id 2D1E47ECBE
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2019 23:42:53 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id y23so31660598ljn.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2019 16:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=ft2yBE09R6kSfQawQTiWUHdQU+PeRCu8QsYaZjY5XHA=;
	b=BvKKoA6k+o5wXm5iOrfDO2LoG+SdSENfZzefAw9PjUefZuPiSea6QSc+fIFjuO2q6p
	dQrrSZJVsb4mw8a46kxGU8yTluZIZ97CeRO7SxlxqAfdDQif7Wgl72AkGUr/1USkwjuj
	hnfkdiiWFUtNbA6TTSAa1dbkSzAgbSw40/fJbdwA7OUWel+VeZ5Kmia/9SJB3KJLChNT
	m09sCSNKHLbCUTMiQjONR2weFQMpwgHGXIzD4EmDhULY4tlvSnNdU/0jEYoeoCsuAAuq
	rHFpcBm6D4ScIsVFJmM3B5u8+d5pIE0FeZKmmODZKZE8h9TD0DHFhWX9BzCCjaPIBB+d
	BzIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ft2yBE09R6kSfQawQTiWUHdQU+PeRCu8QsYaZjY5XHA=;
	b=lO4We/+sc2baPItH4jU4AqB/kJvXc5ONlEPfNit+Af5wFtTYys50soDkJWFa7NXn9h
	irIza/yfxeyqfXEOVM/ONCgUNEIJFquhTNauoZziVyqDFvtzO67EgC9s1jpevo7wvCir
	dnZ5Hi4eJVTSuRBZAtBjlqAiFz0/iRRsgF6KusRQHX21nLYMRk3mxhsftuxFpW2Lu3CA
	VScQDWF38ppkT6sRf7H0GcO8l+04dTnX9z23LskiAxT/njhRPyhEQDo6cQ5Z5vZFcniv
	CQ6YVf8mwO5TOKMsWQfnOqlkWVgEGC7RD2tbGlYk1W8NNy0fqh9F1oCN8wf6oZgBA9Je
	YUDw==
X-Gm-Message-State: APjAAAV6mZf/nwfNGGIDVWxtH+erXDzFC2nFyk8bpknbFpNeakr2GMdN
	qlazdyvb+dbPk3FKDYVyfJxJcDEkrXk=
X-Google-Smtp-Source: APXvYqwTModNXbf0s2SPoOmdC70uXdultAWFnFtKT1KkxIAphFru5z1mDtPpL3+Brz9T+v66PAIf4w==
X-Received: by 2002:a2e:9615:: with SMTP id v21mr138523ljh.46.1568590973596;
	Sun, 15 Sep 2019 16:42:53 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115]) by smtp.gmail.com with ESMTPSA id
	z20sm1672496ljk.63.2019.09.15.16.42.52
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 15 Sep 2019 16:42:53 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Sep 2019 01:42:51 +0200
Message-Id: <20190915234251.13810-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] gflags: update to 2.2.2
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
X-List-Received-Date: Sun, 15 Sep 2019 23:42:53 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../recipes-support/gflags/{gflags_2.2.0.bb => gflags_2.2.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/gflags/{gflags_2.2.0.bb => gflags_2.2.2.bb} (93%)

diff --git a/meta-oe/recipes-support/gflags/gflags_2.2.0.bb b/meta-oe/recipes-support/gflags/gflags_2.2.2.bb
similarity index 93%
rename from meta-oe/recipes-support/gflags/gflags_2.2.0.bb
rename to meta-oe/recipes-support/gflags/gflags_2.2.2.bb
index 29a1125cd..6eea0c00e 100644
--- a/meta-oe/recipes-support/gflags/gflags_2.2.0.bb
+++ b/meta-oe/recipes-support/gflags/gflags_2.2.2.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=c80d1a3b623f72bb85a4c75b556551df"
 
 SRC_URI = "git://github.com/gflags/gflags.git"
-SRCREV = "f8a0efe03aa69b3336d8e228b37d4ccb17324b88"
+SRCREV = "e171aa2d15ed9eb17054558e0b3a6a413bb01067"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


