Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 697427D007
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jan 2020 21:53:52 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id 6so7734705pgk.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jan 2020 13:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=byBrvhxfEAOgnZSPRgJICItLWAACMnLjLt8KkJZd6Uk=;
	b=htx/6IyC/U3bsUJMNRpJWnSTDY11OJY5HVP5qLC/PiP6dhWsKdi1xYgiTv+6YUcinU
	qMy2JixKmVK6IZo1BpdXagfS9BMKUFFqRDL8onUIich+J9sRZ6SCLQRNN4vxzxZ42gIf
	62xuHKfg63/r51s9weummP4+9r1r2QLHPgWXD16cnyrkXp7n4iW1BvswgwmVgYBSz8/F
	oHEMSgSJkTIlxBQxxaOq/OQIcFH9tljXbMqAsEIH9n4wh8xWrFB9Y58IJQpJqeMjmBgN
	izrwJgn69VbUQPnMzPDHcn/nSnlJga+45lCEqSxvwIxxRBLsCqkh1GckJeBfj90G8yDO
	59sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=byBrvhxfEAOgnZSPRgJICItLWAACMnLjLt8KkJZd6Uk=;
	b=F2wgrLA1SdtQbCQssKlYmSjTjeaL7fllhR0rLKGomqUs2InW3HqtUyrqrIm3JWOxBc
	zItLPO9TJrLZRCGWjHYdPaxt/re4CcB5M2fd1sDxNElGkedg5WtDvS6e1P1MFiDnzT9o
	2FDhW9Encuj4e0irybSDgM6iZFJ4XdutSG4gYnnXwV0U2JO2ct/w6yFkgSeKhXuWt8qW
	FLhR30n1C5TResRQ+qiLRwOrT6MVM9WAlFJu4fWJ7yoyQbguVZwDGomLytSRt41JSoYr
	SVyQwVhliRpNzJAQzJLbMsKRO0wKvEepG/FCcex6o8PZnvDKBUNT92aFhkwzOoqC0AZ3
	QWgQ==
X-Gm-Message-State: APjAAAXL6s9LzmD/47FkPsLPctcXGtcKGvC/z/tvfyDAJwNzsehgS54o
	p+n8rusQ+DR1MadDY90KCV5ZqgMc9gs=
X-Google-Smtp-Source: APXvYqzsb4JlUPJZYqDKJhAezXoE7Lqrh9u1SE3+vnjmGC17LKcDbcjnKOEzBIaRKLXOMNFsGI2VmA==
X-Received: by 2002:a63:450:: with SMTP id 77mr27222247pge.290.1580248432983; 
	Tue, 28 Jan 2020 13:53:52 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::c362])
	by smtp.gmail.com with ESMTPSA id g8sm26217pfh.43.2020.01.28.13.53.52
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 28 Jan 2020 13:53:52 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Jan 2020 13:53:51 -0800
Message-Id: <20200128215353.3594210-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/3] squid: Link with libatomic on riscv
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
X-List-Received-Date: Tue, 28 Jan 2020 21:53:52 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-daemons/squid/squid_4.9.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-daemons/squid/squid_4.9.bb b/meta-networking/recipes-daemons/squid/squid_4.9.bb
index 6f202cf401..19949acd84 100644
--- a/meta-networking/recipes-daemons/squid/squid_4.9.bb
+++ b/meta-networking/recipes-daemons/squid/squid_4.9.bb
@@ -40,6 +40,8 @@ inherit autotools pkgconfig useradd ptest perlnative
 
 LDFLAGS_append_mipsarch = " -latomic"
 LDFLAGS_append_powerpc = " -latomic"
+LDFLAGS_append_riscv64 = " -latomic"
+LDFLAGS_append_riscv32 = " -latomic"
 
 USERADD_PACKAGES = "${PN}"
 USERADD_PARAM_${PN} = "--system --no-create-home --home-dir /var/run/squid --shell /bin/false --user-group squid"
-- 
2.25.0


