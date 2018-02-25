Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 899297876D
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 21:34:03 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id q13so5717294pff.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 13:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=RfkO4pEr9CthMSj6w5MWYKGVfnKAzBe1wd3evsp5PmM=;
	b=Dg4fOtMkfGCmPPZ3G8HVzPdFIivt8TvVJoy7K4DW3Y3amOcc+z4IWPiEfKBp4vVVhI
	I0mIfT5QGe9ueLF4axdx4Az6iThuG5fhf3qv3pc5/M4qFiL4HSa5iGAvbeNr145hSvDN
	Al1fPQSqQqNbv5EwxAJqOboZMeugQJnPPFaNl2YTQ5YRHUdT05vte+AS5fWg1nn85Xgr
	uBUgC8vDRRszI9/YkaSDdxx6Ac9NGnoOGSrrOwbcV5cedOcZ7jxN/zj43zzx4SrmeB2T
	qtJk9QzZxCw/CtpBbxzIunzNQgGzSZMTDckMTRL9D1uAn92BO4RMitER4U1K/RYRyYRO
	NKRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=RfkO4pEr9CthMSj6w5MWYKGVfnKAzBe1wd3evsp5PmM=;
	b=KQ9NlqJpCI/Vv7qZgDsQACc/ekD8148+sgbnqJY3en6puLdgTY+8whFCrQ1Atp7FJc
	1l6QR3Te1DfqevsVI0uz8+ALvbsRPvEM1wW2CW7ZwYjthrBqbAq5Lc40FZ93yQNu6cyi
	8AmOxibZ6A/p4bBs4UFbStnSWO/oHePMu0unYYILyhJVvM98FXq/WR5XC4Zqxr6+5liJ
	XyIwRBODM4o0Hxexpiv9NaGDUbiZxIGNBtCIEx1zm2HLp4Rc/Gvy1e5viTfmMWMY18L1
	EDUfvcMFXZHkWYfaT0qJFixOqyhJGWzubd0oLk1eXH7lUkLp70VBFLTOlAtuawZ7PONZ
	rzzA==
X-Gm-Message-State: APf1xPAVjNzQrbXuvEvx4WVdf1eS0G5RCWSV4Gy7c43tR2cIeTPNjdU0
	ORPyLcqnNhSeGPKcimCDhdH4CA==
X-Google-Smtp-Source: AH8x2251Q9UlkVxS1Rz8LSASWWN6yBFEqH3JTxnpukiEiFYCuL/C1o0aeH50S4Bcm3n7HO8zpmZ+ug==
X-Received: by 10.101.81.12 with SMTP id f12mr6639053pgq.81.1519594444818;
	Sun, 25 Feb 2018 13:34:04 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:ad95:2a34:2e02:2fdf])
	by smtp.gmail.com with ESMTPSA id
	64sm12014600pgj.39.2018.02.25.13.34.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 25 Feb 2018 13:34:04 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Feb 2018 13:33:26 -0800
Message-Id: <1519594406-24490-36-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
References: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 36/36] postgres: move to recipes-dbs
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
X-List-Received-Date: Sun, 25 Feb 2018 21:34:03 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../postgresql/files/0001-Use-pkg-config-for-libxml2-detection.patch      | 0
 .../postgresql/files/not-check-libperl.patch                              | 0
 .../postgresql/files/postgresql-bashprofile                               | 0
 .../{recipes-support => recipes-dbs}/postgresql/files/postgresql-setup    | 0
 meta-oe/{recipes-support => recipes-dbs}/postgresql/files/postgresql.init | 0
 meta-oe/{recipes-support => recipes-dbs}/postgresql/files/postgresql.pam  | 0
 .../{recipes-support => recipes-dbs}/postgresql/files/postgresql.service  | 0
 .../postgresql/files/remove.autoconf.version.check.patch                  | 0
 meta-oe/{recipes-support => recipes-dbs}/postgresql/postgresql.inc        | 0
 meta-oe/{recipes-support => recipes-dbs}/postgresql/postgresql_9.4.15.bb  | 0
 10 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/{recipes-support => recipes-dbs}/postgresql/files/0001-Use-pkg-config-for-libxml2-detection.patch (100%)
 rename meta-oe/{recipes-support => recipes-dbs}/postgresql/files/not-check-libperl.patch (100%)
 rename meta-oe/{recipes-support => recipes-dbs}/postgresql/files/postgresql-bashprofile (100%)
 rename meta-oe/{recipes-support => recipes-dbs}/postgresql/files/postgresql-setup (100%)
 rename meta-oe/{recipes-support => recipes-dbs}/postgresql/files/postgresql.init (100%)
 rename meta-oe/{recipes-support => recipes-dbs}/postgresql/files/postgresql.pam (100%)
 rename meta-oe/{recipes-support => recipes-dbs}/postgresql/files/postgresql.service (100%)
 rename meta-oe/{recipes-support => recipes-dbs}/postgresql/files/remove.autoconf.version.check.patch (100%)
 rename meta-oe/{recipes-support => recipes-dbs}/postgresql/postgresql.inc (100%)
 rename meta-oe/{recipes-support => recipes-dbs}/postgresql/postgresql_9.4.15.bb (100%)

diff --git a/meta-oe/recipes-support/postgresql/files/0001-Use-pkg-config-for-libxml2-detection.patch b/meta-oe/recipes-dbs/postgresql/files/0001-Use-pkg-config-for-libxml2-detection.patch
similarity index 100%
rename from meta-oe/recipes-support/postgresql/files/0001-Use-pkg-config-for-libxml2-detection.patch
rename to meta-oe/recipes-dbs/postgresql/files/0001-Use-pkg-config-for-libxml2-detection.patch
diff --git a/meta-oe/recipes-support/postgresql/files/not-check-libperl.patch b/meta-oe/recipes-dbs/postgresql/files/not-check-libperl.patch
similarity index 100%
rename from meta-oe/recipes-support/postgresql/files/not-check-libperl.patch
rename to meta-oe/recipes-dbs/postgresql/files/not-check-libperl.patch
diff --git a/meta-oe/recipes-support/postgresql/files/postgresql-bashprofile b/meta-oe/recipes-dbs/postgresql/files/postgresql-bashprofile
similarity index 100%
rename from meta-oe/recipes-support/postgresql/files/postgresql-bashprofile
rename to meta-oe/recipes-dbs/postgresql/files/postgresql-bashprofile
diff --git a/meta-oe/recipes-support/postgresql/files/postgresql-setup b/meta-oe/recipes-dbs/postgresql/files/postgresql-setup
similarity index 100%
rename from meta-oe/recipes-support/postgresql/files/postgresql-setup
rename to meta-oe/recipes-dbs/postgresql/files/postgresql-setup
diff --git a/meta-oe/recipes-support/postgresql/files/postgresql.init b/meta-oe/recipes-dbs/postgresql/files/postgresql.init
similarity index 100%
rename from meta-oe/recipes-support/postgresql/files/postgresql.init
rename to meta-oe/recipes-dbs/postgresql/files/postgresql.init
diff --git a/meta-oe/recipes-support/postgresql/files/postgresql.pam b/meta-oe/recipes-dbs/postgresql/files/postgresql.pam
similarity index 100%
rename from meta-oe/recipes-support/postgresql/files/postgresql.pam
rename to meta-oe/recipes-dbs/postgresql/files/postgresql.pam
diff --git a/meta-oe/recipes-support/postgresql/files/postgresql.service b/meta-oe/recipes-dbs/postgresql/files/postgresql.service
similarity index 100%
rename from meta-oe/recipes-support/postgresql/files/postgresql.service
rename to meta-oe/recipes-dbs/postgresql/files/postgresql.service
diff --git a/meta-oe/recipes-support/postgresql/files/remove.autoconf.version.check.patch b/meta-oe/recipes-dbs/postgresql/files/remove.autoconf.version.check.patch
similarity index 100%
rename from meta-oe/recipes-support/postgresql/files/remove.autoconf.version.check.patch
rename to meta-oe/recipes-dbs/postgresql/files/remove.autoconf.version.check.patch
diff --git a/meta-oe/recipes-support/postgresql/postgresql.inc b/meta-oe/recipes-dbs/postgresql/postgresql.inc
similarity index 100%
rename from meta-oe/recipes-support/postgresql/postgresql.inc
rename to meta-oe/recipes-dbs/postgresql/postgresql.inc
diff --git a/meta-oe/recipes-support/postgresql/postgresql_9.4.15.bb b/meta-oe/recipes-dbs/postgresql/postgresql_9.4.15.bb
similarity index 100%
rename from meta-oe/recipes-support/postgresql/postgresql_9.4.15.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_9.4.15.bb
-- 
2.7.4


