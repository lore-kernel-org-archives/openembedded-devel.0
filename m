Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 77696788A0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 21:33:56 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id l131so5438706pga.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 13:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=F1rD8Ce2P9NU/ApckoLtaCctBBt+ik+H5ytgNTBnAsM=;
	b=iAkvmXaIeUM0eqCyzh+8dkviLvQpgHyiOKd3abGjY5zk7cNLAOaq3elsfq8nCnc6kM
	SdMS5GSKRoHM759nf5539rd0Pu2NpgxOJCbo1iBc2OA4h3J1haFPe2KgEmcNVgAnCb0F
	EnGfO/UTP02oC7mwvZBKeGE1tPHcXEb/2P3gavWNkS3oBievlk/+a4G46l37o7ehozp0
	QVUf9Mf6qwx62TztehVovvA02ceu/QWqW2qUONsaVof6t+HBUPGcoEg9yPbyq3NBW+Ho
	SDfHwYfgKeoa73Ek+ksJ7awBGJCgiz7wj2LU+fNoBNNn2S2OAcx0cCakDzZ4vZodv2bB
	7jTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=F1rD8Ce2P9NU/ApckoLtaCctBBt+ik+H5ytgNTBnAsM=;
	b=mQ6quHJXXrwZ5z374OrdF45zKFLajWG1Dz1PUyLWbUgNLQVY0WlFRhKr1Xvhglflq9
	CS2lhRsQC8pjNNwWV4+vfsecnLmgN+zJ5HN0F+aAatji7GiblBhZzKQHJgs5ms7gjmio
	nvrMs/JHaOm9uxA7TKMFvFvtdubob718TCAFDlWnKLiFFofvCXZIyoWy0GD+3t6HhIUK
	HJJKnLzxHAOiFXX0kWppXRN3UporsVNomLBG9SYHJu94rfn7Wjyc8V/q98VQMU8pUEFe
	Vb8pAkGnx6w3a6rvdc2KXWTU2ERjOmePpJD5BV7ZWPdAbs7hVLnQzkU8Sez74FaIvMYv
	DAEw==
X-Gm-Message-State: APf1xPAPAuaRayXRAPctuEvLGn1MsLyYSx+3F0Px/94zdU7W9MNzIGvv
	AvvLv7MuJD6Ekhwlp897K4QM3Q==
X-Google-Smtp-Source: AG47ELumtYsRo11BOKeIymek0NnbpriyPPXQ1t6z4jH7DFWU54c/8O1z14XXem4Ci59mQBKYtbWb0A==
X-Received: by 10.98.65.72 with SMTP id o69mr6410049pfa.97.1519594437950;
	Sun, 25 Feb 2018 13:33:57 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:ad95:2a34:2e02:2fdf])
	by smtp.gmail.com with ESMTPSA id
	64sm12014600pgj.39.2018.02.25.13.33.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 25 Feb 2018 13:33:57 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Feb 2018 13:33:19 -0800
Message-Id: <1519594406-24490-29-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
References: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 29/36] flashrom: move to recipes-bsp
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
X-List-Received-Date: Sun, 25 Feb 2018 21:33:56 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../flashrom/flashrom/0001-Remove-undefined-behavior.patch                | 0
 .../flashrom/0001-spi-Define-_XOPEN_SOURCE-to-enable-ffs-libc-API.patch   | 0
 meta-oe/{recipes-extended => recipes-bsp}/flashrom/flashrom/sst26.patch   | 0
 meta-oe/{recipes-extended => recipes-bsp}/flashrom/flashrom_0.9.9.bb      | 0
 4 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/{recipes-extended => recipes-bsp}/flashrom/flashrom/0001-Remove-undefined-behavior.patch (100%)
 rename meta-oe/{recipes-extended => recipes-bsp}/flashrom/flashrom/0001-spi-Define-_XOPEN_SOURCE-to-enable-ffs-libc-API.patch (100%)
 rename meta-oe/{recipes-extended => recipes-bsp}/flashrom/flashrom/sst26.patch (100%)
 rename meta-oe/{recipes-extended => recipes-bsp}/flashrom/flashrom_0.9.9.bb (100%)

diff --git a/meta-oe/recipes-extended/flashrom/flashrom/0001-Remove-undefined-behavior.patch b/meta-oe/recipes-bsp/flashrom/flashrom/0001-Remove-undefined-behavior.patch
similarity index 100%
rename from meta-oe/recipes-extended/flashrom/flashrom/0001-Remove-undefined-behavior.patch
rename to meta-oe/recipes-bsp/flashrom/flashrom/0001-Remove-undefined-behavior.patch
diff --git a/meta-oe/recipes-extended/flashrom/flashrom/0001-spi-Define-_XOPEN_SOURCE-to-enable-ffs-libc-API.patch b/meta-oe/recipes-bsp/flashrom/flashrom/0001-spi-Define-_XOPEN_SOURCE-to-enable-ffs-libc-API.patch
similarity index 100%
rename from meta-oe/recipes-extended/flashrom/flashrom/0001-spi-Define-_XOPEN_SOURCE-to-enable-ffs-libc-API.patch
rename to meta-oe/recipes-bsp/flashrom/flashrom/0001-spi-Define-_XOPEN_SOURCE-to-enable-ffs-libc-API.patch
diff --git a/meta-oe/recipes-extended/flashrom/flashrom/sst26.patch b/meta-oe/recipes-bsp/flashrom/flashrom/sst26.patch
similarity index 100%
rename from meta-oe/recipes-extended/flashrom/flashrom/sst26.patch
rename to meta-oe/recipes-bsp/flashrom/flashrom/sst26.patch
diff --git a/meta-oe/recipes-extended/flashrom/flashrom_0.9.9.bb b/meta-oe/recipes-bsp/flashrom/flashrom_0.9.9.bb
similarity index 100%
rename from meta-oe/recipes-extended/flashrom/flashrom_0.9.9.bb
rename to meta-oe/recipes-bsp/flashrom/flashrom_0.9.9.bb
-- 
2.7.4


