Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6234477E44
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Feb 2018 19:50:28 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id a5so20977637qkg.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Feb 2018 11:50:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=y9HlV/XZxhbp8p4viq35dvZMWk0A5dtevb8fGhnl/Ek=;
	b=YpICOuv5+q6c0nSjIQiLxHQfnixwojiAdWM5wi7NNiYRrCAWXu6VZaOZ6tMT5WRZJW
	+DD0BbqUQQnDosVqOMog8Mh+HZkcGP/nM3ODzjMdBVB0RH80H4fNVegMgxbY8S2HvR22
	ic/+zFW2VysRxS1afP5skFWIPLpMNBvdcmkafOd0Hks3H1/e7o9iDQe1gNzYOmWypWyL
	pvbwD03juQpTADEtSNLa5yaTWrds97GF4+1mD+IiNfG6BsltZTX0eJUkQW7UsijMFHU5
	oDb82GtsbpwHS9PtNLF12U8EiOZdnPnNtCP36FGtB4Kq9jHJCLd4ioWtkd14j7zP0Hds
	FrJg==
X-Gm-Message-State: APf1xPAgLhJuSnW+893n/mdrXnsV9KFnvtHgYO/qYzr/bssnR7SmzbnS
	q8hiyS8uyiU6KGGFXvg0FJuuzQ==
X-Google-Smtp-Source: AH8x226nL5VwAp/oJckST1uV6krk4923ko5iceei5H7omWs8j0VNbl7K4fFnW/pwXqS81MLudVgfnA==
X-Received: by 10.55.4.139 with SMTP id 133mr4748921qke.54.1517514629158;
	Thu, 01 Feb 2018 11:50:29 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id l1sm241882qki.60.2018.02.01.11.50.26
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 01 Feb 2018 11:50:28 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Thu, 01 Feb 2018 17:50:21 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Thu,  1 Feb 2018 17:50:20 -0200
Message-Id: <20180201195020.32757-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.16.1
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v4] nghttp2: Move to meta-networking
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
X-List-Received-Date: Thu, 01 Feb 2018 19:50:28 -0000

The nghttp2 depends on c-ares which is provided by meta-networking
layer, so it should be moved there as well.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v4:
 - rebase on top of master

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
2.16.1


