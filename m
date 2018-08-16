Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id F111A78E00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 18:28:02 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id j5-v6so4983496wrr.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 11:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=crkU58F77/ewvsgZGt7z3jdCHS6mjPIio1AJgmrg0iI=;
	b=PgxWzWKd7ex7b6wZEOAoqHzvFrIygA9nzvxFZfaYK78ZtOjei06S+I3BR8BtMqee6+
	XJnDjJsa9x2zUqKeqJ7eZsE5JWHpw9RkBMvt2fKuNV8Ekjp4TGWqoqRrAFbaiO/WLzff
	3b/pj4eO9tmrTmy3aLO7DcZK2B46mREJhPpPv1zpTHjYiw7Bzr3Kq/U1Fn1KPmn+CckH
	RdfKN6yqq1Rpz1BmbpEYjkutqxvTE1NDg/MkLbDQ9KM9iNLByqVRqr6/xyBE1G92gBbK
	FgH31Hm5CJBqzoAhYGS6q8AopAOYVMO9ox/1Ed6YiI2VQedPpOThyz3u8jTSN/7MK7Iu
	RhJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=crkU58F77/ewvsgZGt7z3jdCHS6mjPIio1AJgmrg0iI=;
	b=krTNrIuIJaFITTrVkBDvkHiVtE55lHc7TFFbvdmA0Nu/nhzvhXNdIgTUoCfwhig56k
	B9jd4WhDXC33w5jx9ECqOgAIRakooeMYXkdt+8yiq+5eVFIs1DnCXbNsUoXhjtnezSQI
	vu9NvRc7doOwVjbioXDXwB1GawY6l0cfJc+rRoCSypawaHFcuDd4ljwSye8XBtIYPk7n
	UHeaATZ2MOIPXdNvN+GpgB20E5DiqGDlNsjrY3rdUE8CH69sZuKDm6DoJgj0IoGJgVER
	aVHkVD8GmUcIvlOHAXL8HSTdWNjFqLNrFo/3dxdhg/mjxZX0tomWYRTh5/fJmoZACQ0O
	p9yA==
X-Gm-Message-State: AOUpUlGmKN1sKnB/JBgl53Jh7/Ko0iwwwH6zY+5bPGQH64I7QtADMa8R
	yDrLQ/ojOUJqe6AjclUIX6/AGJi/
X-Google-Smtp-Source: AA+uWPzgrDJ+gF5Lpe7SKt1zbveKp2V3IV0j8QdwvAtZkX/Y5kdnJXaYvC3+JGAYuIjlUR1b+nOjdg==
X-Received: by 2002:a5d:550a:: with SMTP id
	b10-v6mr20796745wrv.228.1534444083427; 
	Thu, 16 Aug 2018 11:28:03 -0700 (PDT)
Received: from localhost.localdomain
	(p200300F07BC4D1601E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc4:d160:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	g10-v6sm26040224wrv.90.2018.08.16.11.28.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 16 Aug 2018 11:28:02 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Aug 2018 20:27:39 +0200
Message-Id: <20180816182748.2400-8-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.4
In-Reply-To: <20180816182748.2400-1-schnitzeltony@gmail.com>
References: <20180816182748.2400-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 07/16] fftw: enable neon for single precision on aarch64 by default
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
X-List-Received-Date: Thu, 16 Aug 2018 18:28:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-support/fftw/fftw_3.3.8.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/fftw/fftw_3.3.8.bb b/meta-oe/recipes-support/fftw/fftw_3.3.8.bb
index 09c692dc6..d9e0ea340 100644
--- a/meta-oe/recipes-support/fftw/fftw_3.3.8.bb
+++ b/meta-oe/recipes-support/fftw/fftw_3.3.8.bb
@@ -19,7 +19,10 @@ EXTRA_OECONF = "--disable-fortran --enable-shared --enable-threads"
 
 CFLAGS += "-D_GNU_SOURCE"
 
+# neon is optional for arm version < 8 -> check tune features
 FFTW_NEON = "${@bb.utils.contains('TUNE_FEATURES', 'neon', '--enable-neon', '', d)}"
+# neon is suppored for arm version = 8 -> enable
+FFTW_NEON_aarch64 = "--enable-neon"
 FFTW_NEON_class-native = ""
 
 do_configure() {
-- 
2.14.4


