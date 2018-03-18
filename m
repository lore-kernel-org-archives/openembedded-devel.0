Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 89C90788FE
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2018 19:08:47 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id s10so3605188wra.13
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2018 12:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=UQLOKNEAS9u2Oe+H0pA+Y58zqyyJTSdOc7VeXEhieic=;
	b=h6jWRvaFDe0PHZHcCj8mmgfSC2p5yjt2kSspyloIqQmPTL1pa7zfBrN6TQ8dZl7wOm
	IEzx9P3/sgKqjXf1xChAqYpoqZSMDpO/aiG85qXID2PZbdSRloxs9YjTDLzXnbranzxf
	BNI6dHPaEDYKuvmPt1zbPMdSZT8xdZu6TQMH4KevHNcIoWvgIX8V3D/r7m8RBXOSX9y4
	d6xPnL7qqkSWzS9bRwjPOWmveUkELkFiZrZZ4DEpa18UWZvHqZszD2TsQilPB5fQTVgX
	LmaeYpIzYViCYAMx4I2bwq7ihXEeuVBxtCorqQQ7rF5IReQtxddGXLu31SIG6NUJNBFg
	pGnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=UQLOKNEAS9u2Oe+H0pA+Y58zqyyJTSdOc7VeXEhieic=;
	b=P8IScyaYdBITuhvytfN8vl0IahWzc7RnC2kcpTtJPyL3W34j8ecSyH/8WMQa3A/CMV
	hIM9lPaBuQzwjkjxEmHy4zj1nPH1H1Jjub1UGf2xDS8FOBeYfW4vUtXINVqhg/hNO3AG
	NKiaH4R8nt7TR9EQCHHGJSEHhxYo3rIKqXH+tQwI0OBBHequX2x95JwkhDcD9qV5l62x
	GElwymwKJgOcZLFA0O7o4sigy9c46n/b9olDybcovhGQgAWjFcuJdQ9Bh6agN1mxMzwU
	W5d5PaQJM9JS4vNA2UdI0Xb0NIASf7MlXGwha2DGIU2UezWWQXFe3iLLjNpaXYU5N7Pz
	wbnQ==
X-Gm-Message-State: AElRT7Eg5nK74mQxwfeWaT0oY4/ap+c5P1w+IVidot1yGYzrCqaYfdCO
	CuToMVEceALbD/4cO3/UuWH5rQ==
X-Google-Smtp-Source: AG47ELsya6n2QS/ewgO5RA0e4pjnwLYcJwiD5dbZgJ8TrpcLX6RPY+LOb0HtVaEoVscUftQ8D+Y3aA==
X-Received: by 10.223.149.129 with SMTP id p1mr6988197wrp.11.1521400128143;
	Sun, 18 Mar 2018 12:08:48 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC08B781E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc0:8b78:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	b8sm11614531wrf.29.2018.03.18.12.08.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 18 Mar 2018 12:08:47 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Mar 2018 20:08:28 +0100
Message-Id: <20180318190833.1393-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180318190833.1393-1-schnitzeltony@gmail.com>
References: <20180318190833.1393-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/8] abiword: remove unneeded libglade from dependencies
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
X-List-Received-Date: Sun, 18 Mar 2018 19:08:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/abiword/abiword_3.0.2.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/abiword/abiword_3.0.2.bb b/meta-gnome/recipes-gnome/abiword/abiword_3.0.2.bb
index 2a13e4839..7948aefb7 100644
--- a/meta-gnome/recipes-gnome/abiword/abiword_3.0.2.bb
+++ b/meta-gnome/recipes-gnome/abiword/abiword_3.0.2.bb
@@ -8,7 +8,6 @@ DEPENDS  = " \
     gtk+ \
     gtkmathview \
     wv \
-    libglade \
     libfribidi \
     jpeg \
     libpng \
-- 
2.14.3


