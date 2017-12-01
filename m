Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6704A78654
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Dec 2017 12:47:04 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id c13so12978147qke.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Dec 2017 04:47:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=NSfueM6jJ5oY75oRO8/EZXim5eoTNnS8Mnis/gQcdjg=;
	b=GX5QTWh8FaJS0H+7AdTPFh4jslgcmcuFOBk5UDVM1wqsz1KN5n0s7j08wqSwoYbT41
	DeWK+TFW1UNhOR4KjIE3+qFT93fSUzkmkgz4uXMRPiVYpzAwbWysOnSL1eAYvHMmTPgd
	EMRDJy2zQNYVHu1+1HjVQKUarc2aOmLDuFASbBaHzvQhv2xqx3lQf9+nPuvjWUzE/AJj
	MU4JiCDNwEuSN7dC3DV4UBVpRGR8bZG/Bqv5zYs9cWHPoJB+F55C/lEx7qMgQB8Qzsvs
	RyuOqpcUB2BIHkD7Ao2Pszg5ovy9oC+6ZLrM89SksJoJph5nNQjJ0nKxoKh0XMSer+rR
	AVuQ==
X-Gm-Message-State: AKGB3mLfQILq27nt44W4NuIAiFa6Zzr+XpclnKL2Q91r+hcLVWsOiwpK
	wFtzy/fe9cnN1kMQSjpfwzyYpA==
X-Google-Smtp-Source: AGs4zMaOWH/i70o/MYaGTGqL3e3iDaD3BC5Kz3GmEiPLNNB09y+Vu9OGDcffrfMM+b9AMeN/dIcxbg==
X-Received: by 10.55.37.67 with SMTP id x64mr7503934qkg.116.1512132425108;
	Fri, 01 Dec 2017 04:47:05 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	v17sm4523642qtj.35.2017.12.01.04.47.02
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 01 Dec 2017 04:47:04 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 01 Dec 2017 10:46:58 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Fri,  1 Dec 2017 10:46:57 -0200
Message-Id: <20171201124658.19036-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.15.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe PATCH v2 1/2] nghttp2: Move to meta-networking
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
X-List-Received-Date: Fri, 01 Dec 2017 12:47:04 -0000

The nghttp2 depends on c-ares which is provided by meta-networking
layer, so it should be moved there as well.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v2:
 - rebase on top of master

 {meta-oe => meta-networking}/recipes-support/nghttp2/nghttp2_1.26.0.bb | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename {meta-oe => meta-networking}/recipes-support/nghttp2/nghttp2_1.26.0.bb (100%)

diff --git a/meta-oe/recipes-support/nghttp2/nghttp2_1.26.0.bb b/meta-networking/recipes-support/nghttp2/nghttp2_1.26.0.bb
similarity index 100%
rename from meta-oe/recipes-support/nghttp2/nghttp2_1.26.0.bb
rename to meta-networking/recipes-support/nghttp2/nghttp2_1.26.0.bb
-- 
2.15.0


