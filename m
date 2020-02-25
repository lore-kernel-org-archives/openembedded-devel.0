Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id BF9E0616B7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2020 19:07:16 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id t3so16090478wru.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2020 11:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Z1qNMydEOiMEcH8bq6e8eaTN8PGWdxNgzzZmXiHxw0I=;
	b=E0+cBxm6Raw1lyeBFNroA9G69KJedrLVBkGUgMGugf+dr+QjzB7FSYtuMpyU/RtHJ6
	FfO9sx5avLSgBW+Sj3x9w1NbcyWPnTcTt+M5BDgZpHsbbZlRaIJjXXSez4MhtW5H81Zj
	g2OuWD4FpsnnlPB7fbCHPH5akR3z1TfmkvK4ZkmIM5z5NDSG1Q//Hs3kE3rDu5/1OHwc
	0Qki7SAV9Hl2QDb9PIJI9DK599Qqh9xt0EniLhht0faCj+BMUfIskB6NIW5A9nj/tfg3
	TrZt+52rpkavLF1MV1ZjGGpn+raCaKC/bqz5K35PEvNfQ8WrnjC4JpJWSdTzwIW2EQRV
	et6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Z1qNMydEOiMEcH8bq6e8eaTN8PGWdxNgzzZmXiHxw0I=;
	b=NpGR6PLOAH3+Qq6LpGyj2cjrffnbWxa8dTjv8ZsvZI+Y4F+GcbVw8WHvtYLKIGrE3s
	zd53sZeztlFP2bz5SnufjJWTxqle6XJ9znIOebZUKz27HOlrqPGujsCsFHYpu5ZwaeEv
	yWxdmYGvfDbqBG5wqjARlyTFYhEI9eUGPQVEV494q9vEACs0dr+HZ7t9ZTqVL/b8HCh8
	PQ3XZgPDrF3cj7a6FiHb1TDU8sq/mYHzF1GQIcc8ED2on3caiM9jooVVgzuGylVC3s5w
	TOnGy8/8CMMLPMSeKp4LRRs4PH59M8g60h9TiCjYOmYgSiV2g/koFqcBMqPolll0BZiq
	JUQg==
X-Gm-Message-State: APjAAAX14FBCze4Dkujlg26xI0pOFONjrXYLcN/NgmbquXHiJx0YuAmC
	nCcHNtjEabzSIxjPNk3n0T9cuvPX
X-Google-Smtp-Source: APXvYqzaV+NG4dW8YgdVxXpebuld5jKX9RWzIGZNfiu1/IWXRkpeyDsryb+NiAxLGgADHp6aIoR5iQ==
X-Received: by 2002:adf:cc8b:: with SMTP id p11mr603355wrj.8.1582657637296;
	Tue, 25 Feb 2020 11:07:17 -0800 (PST)
Received: from localhost ([109.238.218.228]) by smtp.gmail.com with ESMTPSA id
	t3sm10235606wrx.38.2020.02.25.11.07.16
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 25 Feb 2020 11:07:16 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Feb 2020 20:07:10 +0100
Message-Id: <20200225190710.3928-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200225190710.3928-1-Martin.Jansa@gmail.com>
References: <20200225190710.3928-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/2] libvncserver: don't enable sasl support by default
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
X-List-Received-Date: Tue, 25 Feb 2020 19:07:18 -0000
Content-Transfer-Encoding: 8bit

* cyrus-sasl is in meta-networking and meta-oe doesn't depend on meta-networking

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.12.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.12.bb b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.12.bb
index 22fc83a64f..dfdf82458c 100644
--- a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.12.bb
+++ b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.12.bb
@@ -17,7 +17,6 @@ PACKAGECONFIG ??= " \
     pthread \
     ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','',d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '',d)} \
-    sasl \
     sdl \
     websockets \
     zlib \
-- 
2.20.1


