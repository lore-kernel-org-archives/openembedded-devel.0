Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id D8C3C7CED3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 21:31:42 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id j42so27219913wrj.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 13:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=a38ulyJOsE/gf7djj+cGnX/WbBHxOGmvHWHNiZUgTtY=;
	b=sjaQDbvVWXD8qAAXjWIJ+2Ro028fXtgH23qo4cHGmriNuqMh35kNMP/ISSwji9dd91
	t2ahIGQm3XuqVp6dUdvPAmfFwhRzblP0jmWFhWXbY/jBsG/rXwAm+9as7y4LxzKimiA0
	5HBhUURqAXXZ5V9G+cje6sWGbS40ftv+NYOekMJGL9CxpJIKBfbOJwkhdc2/oYh56phh
	ntuCzdnAUJtg23P5KFM23DDy+9lVj5KWQdojpPnJxIOpi6Hgvxv9TwUhlMY1xLP4xl+t
	15igeRnXuPr/e6NSQkUfBk5sI/gm2wrgHzt3NLam8kOMiyhDiRjj9KQRdbYh7YICgoRw
	3xLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=a38ulyJOsE/gf7djj+cGnX/WbBHxOGmvHWHNiZUgTtY=;
	b=CFiONzqq/I7Qztbvcz07MgLiR+PKjKXTMbpmCI3Bz420wnooe+e0lmvVVWO16OpYl0
	mYci64RP0wOuzGzp6NIqskGiTtyG4myyuf3/v1i3Q5md9v0CZw55mWAvCkrEdruEMUkM
	hslBaLZY+4RuuHp00Yec59GJuELWnHYUktjV0i1t9La1JAYRdkK/Zx5gB+k9iVPvG+pV
	wYrc13PxC6j0Tv1oOZMCeaLG2jZEz2jkq0FZOaJZ00cbGm1X3EJuRQJPyyGMKtKLOge5
	RKEEUYNLpJyYoxtFVXmAwlAd04Go3fk3WFu8SmJev0NutfOk1ScWrsKQ65jealzRdH1E
	lMDA==
X-Gm-Message-State: APjAAAUiI89zeWdTMQuxOlnEHl0gcifPllhkCszInr8lvtU/fUNCAUsv
	PqZaHBW5KFYyVEcsVXxJVPFyXaDxQHQ=
X-Google-Smtp-Source: APXvYqzEyIBc3XE5t70qP/yho2KNbFtv03lEMl0DUzoT+K3VtG23HyDoAi5Mj8cVIzOKyNBBYZPxcw==
X-Received: by 2002:a5d:6748:: with SMTP id l8mr53690994wrw.188.1577482303414; 
	Fri, 27 Dec 2019 13:31:43 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F052B8722A751F738295925.dip0.t-ipconnect.de.
	[2003:f0:7f05:2b87:22a7:51f7:3829:5925])
	by smtp.gmail.com with ESMTPSA id
	m7sm11915929wma.39.2019.12.27.13.31.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 27 Dec 2019 13:31:42 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Dec 2019 22:31:17 +0100
Message-Id: <20191227213120.3930-20-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191227213120.3930-1-schnitzeltony@gmail.com>
References: <20191227213120.3930-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 20/23] libgdata: upgrade 0.17.10 -> 0.17.11
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
X-List-Received-Date: Fri, 27 Dec 2019 21:31:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From [1]:

Overview of changes from libgdata 0.17.10 to libgdata 0.17.11
=============================================================

* Various fixes to the Meson port, including a soversion fix (#30, #32, #35, !9, !10)

* Add support for user-specified properties of documents in Drive (!7)

* Bugs fixed:
 - #30 meson: debug messages of libgdata don't come from correct log domain - "libgdata"
 - #31 gdata_entry_get_id should not free current value if not changed
 - #32 Build failure on Continuous
 - #33 en_GBism in a string
 - #35 Installed tests fails with an assert in gdata_oauth2_authorizer_request_authorization
 - !7 Drive v2 Properties API
 - !9 Meson fixes
 - !10 meson minor fixes
 - !13 docs: Drop use of `<!-- -->` to delimit plurals
 - !16 Minor revision of italian translation (after >2ys)

* Translation updates:
 - Basque
 - Czech
 - English (United Kingdom)
 - German
 - Indonesian
 - Italian
 - Lithuanian
 - Polish
 - Portuguese (Brazil)
 - Romanian
 - Spanish
 - Swedish

[1] http://ftp.gnome.org/pub/gnome/sources/libgdata/0.17/libgdata-0.17.11.news

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../libgdata/{libgdata_0.17.10.bb => libgdata_0.17.11.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/libgdata/{libgdata_0.17.10.bb => libgdata_0.17.11.bb} (87%)

diff --git a/meta-gnome/recipes-gnome/libgdata/libgdata_0.17.10.bb b/meta-gnome/recipes-gnome/libgdata/libgdata_0.17.11.bb
similarity index 87%
rename from meta-gnome/recipes-gnome/libgdata/libgdata_0.17.10.bb
rename to meta-gnome/recipes-gnome/libgdata/libgdata_0.17.11.bb
index 8e8e12b38..197a05d37 100644
--- a/meta-gnome/recipes-gnome/libgdata/libgdata_0.17.10.bb
+++ b/meta-gnome/recipes-gnome/libgdata/libgdata_0.17.11.bb
@@ -29,5 +29,5 @@ PACKAGECONFIG[vala] = "-Dvapi=true,-Dvapi=false"
 
 EXTRA_OEMESON = "-Dalways_build_tests=false"
 
-SRC_URI[archive.md5sum] = "d858d411ad394c275643b14993dfeed4"
-SRC_URI[archive.sha256sum] = "c1d3d1f303f6a0416a0dac355a195276c31157a74bb1d040772d46d1cb15b012"
+SRC_URI[archive.md5sum] = "7b98e9059255d8a2fb147c4e727230a8"
+SRC_URI[archive.sha256sum] = "6b9917122e4def6e6f78bcb660e49e146540832e296abcb5cde99829a04ea986"
-- 
2.21.0


