Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id 0D1E461580
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2020 06:23:42 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id 6so10441072pgk.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2020 22:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=wo1aGIII1tlklLkxyqOIbnpz1sRuH6sXI0gQCFb4UP8=;
	b=XAcB7rlbWLb1kZrLhBclnaTw4sHAN2hgxnYtHprIzQ3o+Vdba9eTkYdgu60hRE5Ngh
	i8YMdV5OPYdob8rw0Biw5EJj2tZ4Ckdurcb7DOichj0/hPiOymfkm+IfeHbWXSX/7Dwp
	+YHixX2J/2pDq1dVE0xX6uZyPONUG48JDF/GSfEpxavWooiuMj56mMNA/VGAwfOWiFDn
	q8nwN0j35wC4AZ5R24JxJYrQHrxcRoIHCqBuO+3DjimICUXRtdhjvLctERVXr2iEcefA
	k8CXRcJTe6m4+Gtku9gRKwKCyAaBwGnn98JlEOLDoITPLQazT7xO9IOfvQogZDulJf/9
	D8EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=wo1aGIII1tlklLkxyqOIbnpz1sRuH6sXI0gQCFb4UP8=;
	b=QAD50YKpTLWW98k5SMotSzelnHe/tWf7eEQjsb2SIZRXO0s4youZw2OsLiSyjKDy2o
	64in84WaozHWAd8/UdDMNUo8Y+Vz/4SjI0B6YIrbQrCo3iAeOMtjICMDSZirPNGJG4wn
	V5L7zSriueMSm7NyloaCgCAvC2ofj1PYyvsCJX2FDmCczsVQHEKG1pDwDlBf1SlBeKRP
	S5O1UWTaGcyfajmklp4phgpvKiBOyZne5Aity1SfC58rSaIF9GAZqU2Qx365vgvgMrqL
	+++9IfvjfU5819iWFpQSTKBwQSg5WY32e1w41jg2NN5k9zr+sY7akjbhixcv3+RrRcsU
	g2+w==
X-Gm-Message-State: APjAAAWFPiPPG2/87e25P8RRCjzXb86nG9CPe+YwfBwr52MTe1euNlUu
	J7tNdGmbNGirqpKgTfQGh7ZdYT/5G0M=
X-Google-Smtp-Source: APXvYqzQQn0zNvoc5N80p5LFM26Xo91UZxRZt/Bb0jdzt58+RqjzLVczaThA3XKcsTBfwypE6ohV6g==
X-Received: by 2002:a63:7d59:: with SMTP id m25mr20526821pgn.356.1582007023243;
	Mon, 17 Feb 2020 22:23:43 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::98a3])
	by smtp.gmail.com with ESMTPSA id h26sm2573363pfr.9.2020.02.17.22.23.41
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 17 Feb 2020 22:23:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Feb 2020 22:23:41 -0800
Message-Id: <20200218062348.3742529-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [meta-multimedia][PATCH 1/8] x265: Move into meta-multimedia
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
X-List-Received-Date: Tue, 18 Feb 2020 06:23:43 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-multimedia/x265/x265_3.2.1.bb                         | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename {meta-openembedded/meta-multimedia => meta-multimedia}/recipes-multimedia/x265/x265_3.2.1.bb (100%)

diff --git a/meta-openembedded/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb b/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb
similarity index 100%
rename from meta-openembedded/meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb
rename to meta-multimedia/recipes-multimedia/x265/x265_3.2.1.bb
-- 
2.25.1


