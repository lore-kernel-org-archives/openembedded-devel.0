Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
	[209.85.128.45])
	by mail.openembedded.org (Postfix) with ESMTP id B9B0D7F947
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Nov 2019 21:13:16 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id b17so16553863wmj.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Nov 2019 13:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=QeUojo5YUIxsk+Wo1bY3L+QxMob1/EDCrpIh8EjvxkE=;
	b=urCXmKEzOcqJCczkWpvfGimoIwcO4qDJ6zHXVqOAzmcanQ6/5j5pr598+0s7UvJqJO
	xXGwjAoN9Av6zIGViFZY4fmJvlVdnV5FGOHTCowxujfCebIQ0txt7f8rRaftm99Z+pQq
	JljgSrSd0G7787ot/u254QNb6SiHCFq7ryxWwxdfAmphg4S/E52zoCo9YAXXHIAqkXIt
	FLc2ApDEnaEh7uCWfsrJ3gW62ccf9zvrD07pXtiSMOJUn5I3dnqbbwvICurhNQ7n6xtq
	74O8ZRlFaoC4vDgOS4bO5Plv0jRR//pvae9F6nHd3WyA7gYxDxejvA4g0/B8qjBMvVwB
	MrCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=QeUojo5YUIxsk+Wo1bY3L+QxMob1/EDCrpIh8EjvxkE=;
	b=GfWzWh3n+vWhNvYw1jGiMO8PIjwbvGnSJqJWdDOzuvVq8j2YQ4zOBA3MNBQ65qNMVT
	NvNPKvEXQ3tDi/cHI7vXiL4WVl8P47jf0TCgkpLba7bUSxHRyPrjmXTFI63hnv7i/1ts
	KhNj1l2Cz+KJGg4Joli5v67aCvGgTkGqhLwpgv1pz2HXRfH1zTxsHFx7X/xXjJyxQpYc
	86SYKGyEQhqNeeEorgk/z7RDQZaAap+uxwqbTLAFoQ2ecg1Qpq/DaY8TqPuLTWS+MhyY
	eHA9mBNbyN7dACoK+D4QfdoYL62LiiFoKV52ohK6Fgs2Hx6qbo05gVs1JUe2QJyG8Nhs
	TUSw==
X-Gm-Message-State: APjAAAWGSVy9FkHjMoxVKp9nM5UHOvw1trOVmv6TdTBRq6zgTdkvDSGZ
	jEKU3Ak1R+towu5P/PrQTee5GlJQ
X-Google-Smtp-Source: APXvYqxIX9euJjGjPtvqJEan+xdyxtR8QsZk6Fqm1HupUF4Pqi/VjmX92bqxjPgwCrLjxTySEBqU9Q==
X-Received: by 2002:a05:600c:2248:: with SMTP id
	a8mr26251804wmm.139.1574025197193; 
	Sun, 17 Nov 2019 13:13:17 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F081983E6CF71012ACD6C9A.dip0.t-ipconnect.de.
	[2003:f0:7f08:1983:e6cf:7101:2acd:6c9a])
	by smtp.gmail.com with ESMTPSA id
	g5sm18564687wma.43.2019.11.17.13.13.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 17 Nov 2019 13:13:16 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 Nov 2019 22:13:03 +0100
Message-Id: <20191117211306.27233-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191117211306.27233-1-schnitzeltony@gmail.com>
References: <20191117211306.27233-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/6] gmime: cleanup recipe
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
X-List-Received-Date: Sun, 17 Nov 2019 21:13:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* autotools is inherited by gnomebase
* --disable-schemas-install is not set in EXTRA_OECONF so no need to remove it.
  Looks like a leftover from inheriting gconf
* gmimeConf.sh is not installed so no need to remove it

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-support/pidgin/gmime_3.2.4.bb | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/meta-oe/recipes-support/pidgin/gmime_3.2.4.bb b/meta-oe/recipes-support/pidgin/gmime_3.2.4.bb
index dcdaed5a2..205868eec 100644
--- a/meta-oe/recipes-support/pidgin/gmime_3.2.4.bb
+++ b/meta-oe/recipes-support/pidgin/gmime_3.2.4.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "Runtime libraries for parsing and creating MIME mail"
 SECTION = "libs"
 DEPENDS = "glib-2.0 zlib"
 
-inherit gnomebase autotools gobject-introspection
+inherit gnomebase gobject-introspection
 
 SRC_URI += "file://iconv-detect.h \
             file://nodolt.patch"
@@ -12,12 +12,5 @@ SRC_URI += "file://iconv-detect.h \
 SRC_URI[archive.md5sum] = "b6b4e9fdc8f3336551d23872c83b539a"
 SRC_URI[archive.sha256sum] = "249ea7c0e080b067aa9669162c36b181b402f6cf6cebc4999d838c6f1e81d024"
 
-EXTRA_OECONF_remove = "--disable-schemas-install"
-
 export ac_cv_have_iconv_detect_h="yes"
 do_configure_append = "cp ${WORKDIR}/iconv-detect.h ${S}"
-
-# we do not need GNOME 1 gnome-config support
-do_install_append () {
-    rm -f ${D}${libdir}/gmimeConf.sh
-}
-- 
2.21.0


