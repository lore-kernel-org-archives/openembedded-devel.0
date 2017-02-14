Return-Path: <max.oss.09@gmail.com>
Received: from mail-wr0-f181.google.com (mail-wr0-f181.google.com
	[209.85.128.181])
	by mail.openembedded.org (Postfix) with ESMTP id 8302A763F0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Feb 2017 21:49:16 +0000 (UTC)
Received: by mail-wr0-f181.google.com with SMTP id k90so178786127wrc.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Feb 2017 13:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=bIs2sZJaEbj8wYXYTm8Q3fZGBBgE5QFrnKIrCBc/mH0=;
	b=fg2PbJGHQVyM3xs+IiEea4zhGGU1wDinEEhiqNlFkMSFZHzC5fFqK0BvCN/DGGl39r
	ZVltM/cD/TUSGBE8bYXRSwB4QsN72sdEpP6wEJBpSiI1Rd0ieWMUlpNjkRbVcR4NRs48
	cDhRGnB+qbcYl2Qcogt3cpARZoEuPLuLwTMZ7xzNretzkR+JGgVhTBYFbDttHmRxYDEt
	C+VcEG4sAKuzEbBgOsnD4vsP7u8E25JshdC78wI96kBqU3cV1DTKdjsXP2UIgGx0rF/Y
	YDPfzg69Sv1n/FcUSS9hEfOWxIYs1gsrYT3NqtOfim6gkrI5OoGQoRxiby9pcYwcwX6o
	npdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=bIs2sZJaEbj8wYXYTm8Q3fZGBBgE5QFrnKIrCBc/mH0=;
	b=P0iVwePmlwq8iLmtE4eqefCts+HCd9K0GthM6cTxrHZ8+7GR/RAfe4jw7DOFf1eHuc
	RzkfMgn1NHc9hD5g37nHK4SYpTHsCeJ/0V8wuHZ5x9jZH64MAFsYwcJlXtzhdK4tpqVa
	7XIjesHe2HOaS1Wi1Ww/Y1CJUcwNz7nJmZDtCIDcn0rV3oLSDtRPgskk98yxXXjw4i7F
	c5ZUu5Eh+bIOGMX2fUlmQEUqaUJciWSCE/cPgdojSP4LPJcUXR3AgKaoOSZZOg55Hev6
	BdDK7LSEbOxPeQJJGE8lygpvSlD2dxMegE9Xz0Q3LAQcT7JPJZHIKIphLmTQgnZHSggF
	FgGw==
X-Gm-Message-State: AMke39lqegO6VCOlfL596qBIt98x45Gomwb2+Fj5FpN7Sqrli3wTo+0zku0AsK0L4+QDAw==
X-Received: by 10.223.130.118 with SMTP id 109mr30515316wrb.10.1487108956374; 
	Tue, 14 Feb 2017 13:49:16 -0800 (PST)
Received: from Saturn.local.all ([194.191.225.83])
	by smtp.gmail.com with ESMTPSA id
	u47sm2355480wrb.15.2017.02.14.13.49.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 14 Feb 2017 13:49:15 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 14 Feb 2017 22:48:57 +0100
Message-Id: <1487108941-20285-1-git-send-email-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.6.6
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [meta-oe][PATCH v2][master-next 0/4] python-m2crypto now rdepend on python-typing
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
X-List-Received-Date: Tue, 14 Feb 2017 21:49:16 -0000

For native packages the rdepends do not get automatically installed in the recipe
specific sysroot.

Changes in v2:
- Fixed this by adding to DEPENDS of recipes using python-m2crypto-native rather
  than using a new bbclass.

Max Krummenacher (4):
  python-m2crypto: rdepend on python-typing
  crda: add depends on python-typing-native
  pywbem: add depends on python-typing-native
  openlmi-tools: remove blacklist

 meta-networking/recipes-connectivity/crda/crda_3.18.bb        | 4 +---
 meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb      | 2 --
 meta-oe/recipes-extended/pywbem/pywbem_0.8.0.bb               | 5 +----
 meta-python/recipes-devtools/python/python-m2crypto_0.25.1.bb | 3 ++-
 4 files changed, 4 insertions(+), 10 deletions(-)

-- 
2.6.6


