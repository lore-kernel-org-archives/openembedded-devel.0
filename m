Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id D88D1745F1
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Oct 2018 15:07:07 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id a23-v6so9405650pfi.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Oct 2018 08:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=kVjbLTgTaC3dEGd/ICf68pFcW6QaMOBSaFM2H0PfUJY=;
	b=XJnGEV871BBoVkCtPSj7tAlu0KE/VFAdagn4u2McuKzBJWfmvkKtBzqvXqBaEB2rwp
	/gO2pet1FUaOrleifw7Pth2ouzt2uiwv2YPv5pr9vVfqiNqJo1gPkBLT6OdRn+si4Gep
	qDBMfALCEZEmn7Luum1THclVutNHHIiMMxYxtprARWgLOmxf+9QfDjqES7zqGzdTb7//
	/6ubebFYq9DkLrDRQCUQCz1V2npzShvxavf6Ge/lAZKZfaynLaavnopA79TPAcTlNf6F
	JDNhai7mPrPb1tdiPtxu2HtjEb9dtB1cVw4xFhtRN6na/bdsUKWfSrAOnZs1+ktH4YTS
	v1kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=kVjbLTgTaC3dEGd/ICf68pFcW6QaMOBSaFM2H0PfUJY=;
	b=KikDxqA7aEhEn358oi0rzGaz1DhKsyp50y4Iq9olETSdFf0BUwKUYFtFB/dNar9UiA
	88rU6cqYaAcz8Q8D8yKRutlMFh3CleDLhZurl2ba6pHLYL76anpsKRdfZ18N/wCkh8CP
	gLaCoBwBhYtnidVbXe3E+xqJsO0bf58TzdTp3ZKUSaYl1eIRDhcDAIbNrmF5tMOhKMB2
	SEtaM21ncnfq7b+D8+3dOMz4oL40tJopqhi59ZIPZaz8DuYV3nhPXNLuyLz1ykoni+UB
	8lKiVj2GI24Fn/oFNKSoYtZarHbChwfLLa/FLzsyYNK0gJBestze3mzzT3979FKj0fUP
	oSkg==
X-Gm-Message-State: ABuFfog/UmHNfxRyIJ2a7la+NU5SkSsOG7ZnwKvCBXh1Z3XY03KqKRUq
	TT8yULSUPG1CBWlyLXng289RLzp0
X-Google-Smtp-Source: ACcGV612ApxLl4a/fs+Stuk7DGeOf4hMTni0jWHoSL/fktmiXu8W2c33pFRlTLhwwUJDLG1JM+oGcQ==
X-Received: by 2002:a62:9e52:: with SMTP id
	s79-v6mr11996600pfd.110.1538406428652; 
	Mon, 01 Oct 2018 08:07:08 -0700 (PDT)
Received: from pahoa2.kama-aina.net (c-67-181-203-136.hsd1.ca.comcast.net.
	[67.181.203.136]) by smtp.gmail.com with ESMTPSA id
	t26-v6sm4032359pfa.158.2018.10.01.08.07.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Oct 2018 08:07:07 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Oct 2018 08:07:06 -0700
Message-Id: <20181001150706.19772-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][PATCH] umip: move to meta-networking
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
X-List-Received-Date: Mon, 01 Oct 2018 15:07:08 -0000

ERROR: Nothing PROVIDES 'radvd' (but /home/akuster/oss/maint/meta-openembedded/meta-oe/recipes-connectivity/umip/umip_1.0.bb DEPENDS on or otherwise requires it)

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../umip => meta-networking/recipes-connectivity}/umip_1.0.bb     | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename {meta-oe/recipes-connectivity/umip => meta-networking/recipes-connectivity}/umip_1.0.bb (100%)

diff --git a/meta-oe/recipes-connectivity/umip/umip_1.0.bb b/meta-networking/recipes-connectivity/umip_1.0.bb
similarity index 100%
rename from meta-oe/recipes-connectivity/umip/umip_1.0.bb
rename to meta-networking/recipes-connectivity/umip_1.0.bb
-- 
2.17.1


