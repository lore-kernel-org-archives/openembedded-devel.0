Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id 98A0D616B7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2020 19:07:15 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id z12so320517wmi.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2020 11:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=JkKZl0D1b2iayMmL+q5fzBlEcM0qx4T2plqLTevj2uo=;
	b=i5K/1QI+agfNNWHcZqwbEWyORHGbUF5HFmw202E9jtHmeCwaHIG3rqR2j6Xx4z2jty
	OrjvxHg6Q9Khd9Yzzc4f1cPQWwzEAfWnqiwP+cgrYh/09Xs02Jt0ljMGu9CdZ+UTyGi3
	ZVawHM7dam1tY4x2oT50ew8twM3Poj3mYzkuLSzWolC2It6Vt1zNQpJwTR+hBElXJGCF
	6o5OgxhanAwWDN13BSeuShQhk9V18L9jpJHMHtVylxCEULS/rZbmFK+ip+HgOydZILn6
	QwywCO/RNW7V/SVHsyDsvKhIOwpSlQQUG4Kr9D1KQj+wb6Vmq49gRm30ejt99iEo0exS
	0KVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=JkKZl0D1b2iayMmL+q5fzBlEcM0qx4T2plqLTevj2uo=;
	b=iDneX4updV1t7G99HYuzEfFAVanSl2DNUSPDVJ+pzeJxw3TjISpRC/hkTeysXnSSEM
	ef1UabVg6kRGpexM4FXF3sfppr970lf+5hOgxGRPk6hdQByvKm8xLWUPWQW1qIlbNP6k
	f8u8Csu09CexoJC6y4YMILvGsJ8AjixZEZsZjVRRopRBdj3jbKXv7UO9CUIutAJ99kw5
	z1YnAon6xVRkPlO3/BpzmPLz4ZdXRQKO6g7Xl/H749VIZ0GvO1Bx/X39fVdXUfOSLeuB
	3Zho0LuD60LAQ837Ub+GNPtj8KmKxCB31EqHWiBYzmLGeuh5qA0ds3NrAC138Mv0k9Rd
	b6AA==
X-Gm-Message-State: APjAAAU1CdtRTN9gyR7sfNU6+m/BNwgO11aSXXgcJhXL1UT2JZBHTw4W
	38TcCt0XhWdTu5Qp567bqbvFGBvJ
X-Google-Smtp-Source: APXvYqzGb1Xf8DQzjUwmo79O0AgskCA7BWch2+5Kkk5aS9XvYP2uDZ/MAjNkC9g559SOcZxsWD6sAw==
X-Received: by 2002:a1c:a553:: with SMTP id o80mr640198wme.94.1582657635286;
	Tue, 25 Feb 2020 11:07:15 -0800 (PST)
Received: from localhost ([109.238.218.228])
	by smtp.gmail.com with ESMTPSA id x6sm25370755wrr.6.2020.02.25.11.07.14
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 25 Feb 2020 11:07:14 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Feb 2020 20:07:09 +0100
Message-Id: <20200225190710.3928-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/2] nodejs: don't enable ares support by default
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
X-List-Received-Date: Tue, 25 Feb 2020 19:07:15 -0000
Content-Transfer-Encoding: 8bit

* c-ares is in meta-networking and meta-oe doesn't depend on meta-networking
* fixes:
  ERROR: Nothing PROVIDES 'c-ares' (but meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb DEPENDS on or otherwise requires it)
  in builds without meta-networking

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb
index 6eb52c209a..9f91a3f4dd 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb
@@ -51,7 +51,7 @@ ARCHFLAGS_arm = "${@bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', '-
 GYP_DEFINES_append_mipsel = " mips_arch_variant='r1' "
 ARCHFLAGS ?= ""
 
-PACKAGECONFIG ??= "ares icu libuv zlib"
+PACKAGECONFIG ??= "icu libuv zlib"
 PACKAGECONFIG[ares] = "--shared-cares,,c-ares"
 PACKAGECONFIG[gyp] = ",,gyp-py2-native"
 PACKAGECONFIG[icu] = "--with-intl=system-icu,--without-intl,icu"
-- 
2.20.1


