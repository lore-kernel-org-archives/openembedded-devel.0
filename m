Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id D1BC27E12C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 03:56:44 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id f97so7724033plb.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 May 2019 20:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=oaPHsDv1vpdczjc2zcZB70uZQdtrGz098yaxeaDLWvA=;
	b=oyeX0WBZ8mMBY8X7OFMPX/t6S4BmUYw+DH4/qnXt4Zum0mP9oIO5hrnmZoDAKuqkxW
	eN7B3xe9p7bwhv4kJRQ8ZG1vklOobUJaKE5cmdYBVVPoy/bVHbZCjS1qsiL2klvXy3v4
	thuMmEnUXIHJThjiSoVPYM4CE+1Ydhs4nvsoZzmYTvyowq+EvMD9ndeMQOBiD54sK7IP
	rnEgSYU/DgIjO2dmdBAYrWXr8gGmUDpl3PYwkM9UT2XLoHO0ALBn634hWFjXKW3+0rqb
	TQ0AzMHpWEO2UNKcREPRU7ZIdZgz4xE8EeiM+mjYhdva7HBWs2dRjLaphyWvJsuOn4CX
	ZWpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=oaPHsDv1vpdczjc2zcZB70uZQdtrGz098yaxeaDLWvA=;
	b=FM9n1qvp82fuwfx+zG2M5ZNzYrRigMr2E5mZyPHVKgMybbJxiWB3tYZDmVV95Y3/IP
	uUbvzjEmFV7/aJ8MVXH2hDqZDy2NSjmjrdIYpB3mZEK3E+sgo1JIpxtBygPcN5ZwNm2X
	u7b2lt07TiMllig2J/z3oigYyIfnbCM/OJWccawNtvt0pNaowAbMZlhAhIiU7t9LT3Zw
	pfB77iKLfnd9a2+jmaA4TNUGp1lpr476ILpKBfRtypbVmZdbDpOXAeMRiQ1NbfIjmQ58
	Fy4LNoYyGTdmFJbXEszkZSjQaByR6ccHvy8Vk7T8GqASRGq4PVm7/efCKHGRXE5+6l2a
	hFuQ==
X-Gm-Message-State: APjAAAUbW6Y/uKKXz+FO4Oju52/cHwFfv1Was8NETvzSeuGrvdjP6R/m
	agoCqRMFc/f9WwSMb/QHhCsW9GVn
X-Google-Smtp-Source: APXvYqyCEOxIBCkmMWexaLgWX5ug8mf/urdaVCcR56Ap5XPe5qwP6Jn3I0P/FZ+0syjhR4iwozJLcg==
X-Received: by 2002:a17:902:4181:: with SMTP id
	f1mr58148554pld.22.1558411005867; 
	Mon, 20 May 2019 20:56:45 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:199d:e2fe:5a4f:97f4])
	by smtp.gmail.com with ESMTPSA id
	h13sm23045273pfo.98.2019.05.20.20.56.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 May 2019 20:56:45 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 May 2019 20:56:09 -0700
Message-Id: <123c9f9b5ffab9552aa9c4e65cab615d23693ee9.1558410874.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1558410874.git.akuster808@gmail.com>
References: <cover.1558410874.git.akuster808@gmail.com>
Subject: [warrior][patch 09/34] esound: fix SRC_URI for multilib
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
X-List-Received-Date: Tue, 21 May 2019 03:56:44 -0000

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-multimedia/esound/esound_0.2.41.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/esound/esound_0.2.41.bb b/meta-oe/recipes-multimedia/esound/esound_0.2.41.bb
index 0ddf94f..d703f23 100644
--- a/meta-oe/recipes-multimedia/esound/esound_0.2.41.bb
+++ b/meta-oe/recipes-multimedia/esound/esound_0.2.41.bb
@@ -6,7 +6,7 @@ DEPENDS = "audiofile"
 
 inherit gnome
 
-SRC_URI = "ftp://ftp.gnome.org/pub/GNOME/sources/esound/0.2/${P}.tar.bz2;name=archive \
+SRC_URI = "ftp://ftp.gnome.org/pub/GNOME/sources/esound/0.2/${BP}.tar.bz2;name=archive \
            file://no-docs.patch \
            file://0001-audio_alsa09.c-alsa-drain-fix.patch \
            file://0002-Undefine-open64-and-fopen64.patch \
-- 
2.7.4


