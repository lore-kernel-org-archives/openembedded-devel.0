Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 9429B786B6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jan 2018 12:40:25 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id z12so16535205qkf.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jan 2018 04:40:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=maoYgcJHdo9pouTCfVt1kCLWOgFYK5oTiv9qjQDGFrQ=;
	b=NwNl4vVGwrH9dhpXlCbKN0G1v5KsopzQd0F6b6zMVu3eugPbGjfPaaSpx6q6DmN7E1
	5OS0R3fQ29VHxax2kjkh0aIuTMEr1+MCpaDsr+a4Ui4k8CS2NzfC2G7z+7wEpfxu/j8k
	fuMdB5Di7PqX/15Gjh+8PfKw9d2vy8eCfyGsqA9/VIYpGkLcLUeoIf6blMmOndNbwncs
	yybyB9UVHZYvmfB2UvoYycLcldcnSD6dWQkhnBnjnhNAXexHGqg6W3RO6Gb9XV64vJZM
	PA1gU0gtFdm3TXTeD9nIoGsHmaYMeHVCbSfjnPVNixqZzRnVAl5cJih17Pumw9P4RANs
	bzrg==
X-Gm-Message-State: AKwxyte96toalHsFFw+IHj6w4gLlZufy/mT0KU5MIliPjv0NJEifEddn
	3Jm4alDEanh1dwEqgjEJsVCzTg==
X-Google-Smtp-Source: ACJfBov+3xlxUjaYmCyiXtDjbsHabWy8gJVOZUlwZXYkAD8vKt8AjSrRKpY3pnDlJkYF0j/XKy/2Og==
X-Received: by 10.55.187.134 with SMTP id l128mr49663731qkf.211.1516020026280; 
	Mon, 15 Jan 2018 04:40:26 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	w41sm18048572qtc.19.2018.01.15.04.40.23
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 15 Jan 2018 04:40:25 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 15 Jan 2018 10:40:19 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Mon, 15 Jan 2018 10:40:17 -0200
Message-Id: <20180115124018.26546-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.15.1
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 1/2] nghttp2: Move to meta-networking
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
X-List-Received-Date: Mon, 15 Jan 2018 12:40:25 -0000

The nghttp2 depends on c-ares which is provided by meta-networking
layer, so it should be moved there as well.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v3:
 - rebase on top of master-next

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
2.15.1


