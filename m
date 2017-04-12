Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id BBC0177D0E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 19:56:55 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id q125so8652127wmd.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 12:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=8elJ+x5+6YJpWtptdlo/gW6nuuIOMZ5x5b681Sa6kTY=;
	b=qeaRiuCj8rgue9693Bgv4c6bWAq6QUHx98wqTGjoDZAXc/QKzdxs5mB4LXNc54q9os
	C7DfEYrwN+Z2hHUAPEpvENRcu9VvvMvkjhCDeNAuGJQzOZcJyMLBZHnDcx0QECRkTXC9
	dUtpKnPvkg24PQ2Htn5tNVaQ/oozOcfpEe4JRNIDrSn8IifKi22bLazvdIPGC41BH1Wp
	t2HRjKeSNdX9nt4jJx6tAd+hwpd02r56iglpeDBYlWlj7uJR8TSJoOQ3etdOgoHo/wAc
	1xUc53vYooCVlq226Ms+/ydubxUG5QcjfXx5MHNzdF8UHhZNTJPPadz7d4+hdnw+VTvH
	TbeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=8elJ+x5+6YJpWtptdlo/gW6nuuIOMZ5x5b681Sa6kTY=;
	b=kzq5tgEM58czEmvg/wicJkdA7vZgzFatzzh1npU/djja6wlgok6+O6w/jK2aLtiwG8
	vYbSrcFdb3how3KnOly1LLnBlIuBMF79ovsl4WHyJLaEU1rxoqDHpceA1oig11dEoX3y
	V6X9zfMGfRWX9WJkRv5OYNBO6NzIHppiMDpLgqFmQsOWUkFqy9cFDdxJhMnGge72D1kF
	gY/Eyi6sGsWQXDT0nfVBtLszcFJmRCvdHJ8zSf7x++vU/cGzTaWNK0eiLIr+rNp38c66
	fGvsdBUp59qMdMrgNOpPm/etUxOB7V3heiJ4rgtqUcEZjCikLfEvFDQf7mbZTyhLaiyl
	u5JA==
X-Gm-Message-State: AN3rC/5G2a5/Q5WB+LOCpxiecI3ixQ6crPuAIh0dRyliuacqpQ6HRg2V
	PL0uX/ptybucB9HO
X-Received: by 10.28.32.193 with SMTP id g184mr8750985wmg.56.1492027016812;
	Wed, 12 Apr 2017 12:56:56 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911F1781E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:f178:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	t100sm3522637wrc.24.2017.04.12.12.56.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Apr 2017 12:56:56 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Apr 2017 21:56:14 +0200
Message-Id: <20170412195638.3243-6-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170412195638.3243-1-schnitzeltony@googlemail.com>
References: <20170412195638.3243-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 05/29] geany-plugins: update 1.29 -> 1.30
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
X-List-Received-Date: Wed, 12 Apr 2017 19:56:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../geany/{geany-plugins_1.29.bb => geany-plugins_1.30.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/geany/{geany-plugins_1.29.bb => geany-plugins_1.30.bb} (98%)

diff --git a/meta-oe/recipes-devtools/geany/geany-plugins_1.29.bb b/meta-oe/recipes-devtools/geany/geany-plugins_1.30.bb
similarity index 98%
rename from meta-oe/recipes-devtools/geany/geany-plugins_1.29.bb
rename to meta-oe/recipes-devtools/geany/geany-plugins_1.30.bb
index 89bb966..f01dda8 100644
--- a/meta-oe/recipes-devtools/geany/geany-plugins_1.29.bb
+++ b/meta-oe/recipes-devtools/geany/geany-plugins_1.30.bb
@@ -25,8 +25,8 @@ DEPENDS = " \
 inherit autotools pkgconfig gtk-icon-cache
 
 SRC_URI = "http://plugins.geany.org/${PN}/${PN}-${PV}.tar.bz2"
-SRC_URI[md5sum] = "2059c63ac0ec29d2da66b6243ae792e1"
-SRC_URI[sha256sum] = "2827e0cf8f58a45759c82b690af5401dbd3ea0ec8dac310e4caea55547637bd7"
+SRC_URI[md5sum] = "13f8e5d900b4911059385649b8dde887"
+SRC_URI[sha256sum] = "8adb90645d273d9549e1fa99b69ea87dc1fd612f7467eb18eee11a6b30c9ba5b"
 
 do_configure_prepend() {
     rm -f ${S}/build/cache/glib-gettext.m4
-- 
2.9.3


