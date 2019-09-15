Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id B99AD7E6AC
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2019 23:43:10 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id y23so31660921ljn.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2019 16:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=OsskDGKCpW2Jd05eeplukc2zZJ8S7w9e9h2fiL2mNkI=;
	b=rfGClSPeRiwQdGUs6Y5Wcpbr4LxuFPJL9IavVOeF+Kacv2yHVwmblPDNmouUk6bwRo
	/0PNl7pP5dm7C6P0Ace0hJ7XIHC+kbAqleNuVNDcno5mhtRXYtRye0V3qAsTsWU/nHrS
	vVBAqG5BGxDdqjL0RtWlD8cjVtsExK8FHfwviWcAKqUjE7xcxQu6kcJ7NCFU7atF89lD
	rqNaJAZEAve//lkoUlor8YNQzr4iVNdR+VLntzvv2OYJ/d4puBnIc4/aj6/Q/Hlx6icW
	tZetg1VPQVB4ivuq8V5eGNdcJaJO1v4eyykFG71cE4S1LWUkR/VtX+20QC1QiEUC45wq
	6p8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=OsskDGKCpW2Jd05eeplukc2zZJ8S7w9e9h2fiL2mNkI=;
	b=iz0pGVpfzicE3XCvHP4jDtrKwHhu5gL54Gmk9zZLXKX+XPJp5Ky33bEZUp1j6j2Z2L
	xbq6a4zWVNqtnofmTF356zeYK4cTY0a8qtZbYD1NG/ogomrVeLGZWWwbK4HzVOjOt56s
	gKPg8a2Iaqu38MY/RBxWml7TA1sHThy+VmTiDjo4t/2FbJXkQgMmfbETmaKIKvj/hXq4
	ZDLvdz3I8dCGCY4dFf5cE5ngV5PMU26+np0zkMDSz1RuHlAf60oO+79Z1BpGPvnmc6El
	GPBMb+h0B39qPJgyDtJF5BRua1ZIZ5gt8+sk+qZRc2wtvaHYEyOc7UZG7QbNPjKZcqW6
	UZJw==
X-Gm-Message-State: APjAAAVBCUFYtZeNWFUn9qMlx0XhWaIY3R0h8MnceVMvJf0Fkyh5knFt
	CRLvyQ6sMkJvxm57UU9ajIAqD611PRU=
X-Google-Smtp-Source: APXvYqzeoKi3bEpCLRSgnYjRvg7Dgo/qsSCcnTZVZXx43jK0d6iVJ6ygrD9P45tR1/aLjaC0uxq/Ww==
X-Received: by 2002:a2e:9f52:: with SMTP id v18mr200230ljk.166.1568590991015; 
	Sun, 15 Sep 2019 16:43:11 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115]) by smtp.gmail.com with ESMTPSA id
	i17sm8642106lfj.35.2019.09.15.16.43.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 15 Sep 2019 16:43:10 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Sep 2019 01:43:06 +0200
Message-Id: <20190915234306.14158-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] ceres-solver: fix package version
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
X-List-Received-Date: Sun, 15 Sep 2019 23:43:11 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../ceres-solver/{ceres-solver_1.14.bb => ceres-solver_1.14.0.bb} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/recipes-support/ceres-solver/{ceres-solver_1.14.bb => ceres-solver_1.14.0.bb} (100%)

diff --git a/meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.bb b/meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.0.bb
similarity index 100%
rename from meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.bb
rename to meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.0.bb
-- 
2.17.1


