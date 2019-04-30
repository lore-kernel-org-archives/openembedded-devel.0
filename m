Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id 981CA6007A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Apr 2019 12:38:09 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id z6so2274127wmi.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Apr 2019 05:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=oc326dottQ9KY8iKDjyntPV0L6OAw9p/hAozk06gkHg=;
	b=YYuKHmL9BHbGH/eHp3wIKtnGEM0bxdUCh3T/awDezIK+DbDQ/lYhQFIni0CQ7XtIJ5
	WYyz/Vj+fZ+9vN+G2Vufis45DGaBoVMa6VGCpBCVrQCImF8EQC+22Xq1EtVO6kF2uC++
	EDh4++2HNx4KQX6pwjTGZ8S9TzEyUngOC0GVkmqjpn+0fQ8SCMUb+R7NFEpvMp2bv7pz
	QIT7E7OKnjrDK94lMB+5b6Kre9OU7HwxRNmnYnNlrfyiJ79y8z5hxks3/PjLuDBjMe3B
	0EQY5BZBzIqqtUEtLUQBlwX5+o3kgDJesOP9lQYKCVgZ3T3tg93hIk80R26QH3jjv3Tc
	Jiag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=oc326dottQ9KY8iKDjyntPV0L6OAw9p/hAozk06gkHg=;
	b=h1nShqug0xehnh6iX6Ii2oeKY+q6tKjZjhKMPkAX0TLx+EA8PZlaWOc+ITD0gT61ld
	bfJgk5TZoDU/MFZAj9BUfuc8IASyhkiak9bzF8Jw5fonyIjOzUv9IRN0QfE1/dYSwlcf
	wp/3KD0nGJOh3REjABTxMDnDjG2Z3jcbe+giqljgHcWVcs/6Bfr/5lbjg2/jmUfVfKt5
	kVldck+ygM0EUtBkGX6aP2AxQOVQcj/vZSKcVCAL5p31t4qEbWMAhCAx17+fl//BW8pO
	2srhUj1PGTiPdq5b2+NTd9iyxBCN7STQ2lRhKxh3QQly6wsubGncoUMliIAXXhNNnp+r
	fBNg==
X-Gm-Message-State: APjAAAVRZQWVpmurQZ+XsW5nQ83fHL56ckT7s5LIAkKx+7MUFkT/Gxbn
	iU8pUGHmDALfEC9BseiqQpY+K2k1
X-Google-Smtp-Source: APXvYqzzeENVQgOqLhhVTdE0hXV8bsOnGA74gAGdwds/uTZV63O8ek+2fP5v1QqWqi4ov/cT5CFs6w==
X-Received: by 2002:a7b:cf2b:: with SMTP id m11mr2923489wmg.56.1556627889932; 
	Tue, 30 Apr 2019 05:38:09 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	z140sm4503752wmc.27.2019.04.30.05.38.09
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 30 Apr 2019 05:38:09 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Apr 2019 12:38:15 +0000
Message-Id: <20190430123815.1475-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] esound: fix SRC_URI for multilib
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
X-List-Received-Date: Tue, 30 Apr 2019 12:38:10 -0000

---
 meta-oe/recipes-multimedia/esound/esound_0.2.41.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/esound/esound_0.2.41.bb b/meta-oe/recipes-multimedia/esound/esound_0.2.41.bb
index 0ddf94f2da..d703f23d91 100644
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
2.17.1


