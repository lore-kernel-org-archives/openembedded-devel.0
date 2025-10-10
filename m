Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60FCCCCD185
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 17:47:42 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web10.11228.1760109533498912659
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Oct 2025 08:18:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=EDdjdOB3;
 spf=pass (domain: smile.fr, ip: 209.85.128.65, mailfrom: corentin.guillevic@smile.fr)
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-46e61ebddd6so22940265e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Oct 2025 08:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1760109532; x=1760714332; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+bnK+whqHeHOBV1DMZVf9fOmFUOImbhhWemsLWVPZuw=;
        b=EDdjdOB3n4TinMK1ANEauF/G8jy+m8svFESo1AVJU/VOEotvUBZMKOydkVvtOoa2T6
         1rVrEfI1P8teFGOSTPiKp48aZBWQXTinv6NUhyrdvObLMpodaQ1Mcuoerb/cT13rozs6
         Rgecou5VNaey0D4vKIxkg2Oc87zRok12FPzVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760109532; x=1760714332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+bnK+whqHeHOBV1DMZVf9fOmFUOImbhhWemsLWVPZuw=;
        b=Nx19HcVmSvbsz5dqdqLnFHkRoI33QmVA4KcFlMCIXKK9V3t8FAP8FOYlCu+rOwahoz
         PCrrrIg9ZyxY+pwUNn+Whc7ANmIkYYHYrTvEsQdUAzeLH/xNE2cw2lxwHckkSQYARFcq
         w/tIiAH4RhQa4nAqAqu5dUeMepdMOPSv+29NfUYHNHbEK6CtkANlQeM4k6Gb+D+VRYdj
         v5c1GmeNIBuJuaEEfYw1zWAYBHHQ1LtJOTe2b1oGcqw7GGmpgV5J15iSKlk0ZJXXOo2E
         fOgAGFHaYhuRVwKOURs5HoJSkZBgFOUta0spl5b1u7+tnqafE3QuzbrvqKQKpgFfLKJ/
         yVkg==
X-Gm-Message-State: AOJu0YwN7WtDmXDD9UW4OF+8VvrMA6MPKxYRbbT4FVBZK7Lf83LVOG5k
	JT5K93XttHVUo2YMJfYN1RkaMnmNeSp6qyuvUht96IZ/eet+T3Wq5rkjTfJwMxgUtYmqrTXbw7d
	47cn7PEUjmL+s
X-Gm-Gg: ASbGncsMEMsQt1V5U2u9Nb7W+47vRun6dn5V+4nH9tDMj31UkyVWx1Dt8nOUY0NzdhO
	dlhDnLhnTBQSbtu+Ie3AxIc9ffrBCjeEnQEC9bOBzFunntxK1oxrEQBpp19gmpvihdVYG9Bbz2r
	i6B5AanN3LDtDfygLip7YPhdQq5AxkdpbpR1Z0AgzvRPTzfeBHXiy25IM3Fy+6ItfyUCjVQV96a
	FGbCuDB+/By2gIGksRI1NLbjHIjYQd3DrPeXL1sww1W9UK6dVTS9RpFUc2kYTPJKJPasRp/dFT1
	AFkxLlkyDleEP+XJW56L/KSiZJTWvtwMXTUpgEXibRVoAncPXjGtP3CM3wWzt9aZp3Ci+2YiKvW
	OcGu9a+zdYhfnlWdPVXYQpm/BzOqUKryE1efkVnj4Id1euSWY+ou45O7gXjvwDknptwbWR5G233
	I1B5bXl5XogAuYVYJ0nX1gS04C/puODaxURGGMz1fxSWCeYho7+UcZfTh9
X-Google-Smtp-Source: AGHT+IGXoYp0YaoAsMSfMdqSt6v/u9sCAmBrp5oTbwxwN7wz3oMSOMkE0EG2DAwPjoiUUx1c11VWfQ==
X-Received: by 2002:a05:600c:c110:b0:46f:b42e:e3a0 with SMTP id 5b1f17b1804b1-46fb42ee4d2mr26295005e9.41.1760109531791;
        Fri, 10 Oct 2025 08:18:51 -0700 (PDT)
Received: from heaven.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce57d404sm4828730f8f.3.2025.10.10.08.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 08:18:51 -0700 (PDT)
From: "Corentin Guillevic" <corentin.guillevic@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Corentin Guillevic <corentin.guillevic@smile.fr>
Subject: [meta-oe][PATCH] libblockdev: improve reproducibility
Date: Fri, 10 Oct 2025 17:17:52 +0200
Message-ID: <20251010151752.779032-2-corentin.guillevic@smile.fr>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251010151752.779032-1-corentin.guillevic@smile.fr>
References: <20251010151752.779032-1-corentin.guillevic@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Oct 2025 17:47:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120484

The --with-smart option behind the feature "smart" relies on the drivedb.h
header, provided by smartmontools package (/usr/share/smartmontools/drivedb.h).

However the dependencies (DEPENDS) miss this package. Furthermore, if the
--with-drivedb option is not used, the configuration step will search for the
file first on the host's rootfs. This may result in the wrong header being picked,
or the --with-smart option being silently disabled due to incomplete dependencies
(causing missing header).

The header is now guaranteed to be present due to an added dependency in the
"smart" feature, and its location is specified by the --with-drivedb option.

Signed-off-by: Corentin Guillevic <corentin.guillevic@smile.fr>
---
 meta-oe/recipes-extended/libblockdev/libblockdev_3.2.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/libblockdev/libblockdev_3.2.1.bb b/meta-oe/recipes-extended/libblockdev/libblockdev_3.2.1.bb
index 48e6971d1a..e4078d6862 100644
--- a/meta-oe/recipes-extended/libblockdev/libblockdev_3.2.1.bb
+++ b/meta-oe/recipes-extended/libblockdev/libblockdev_3.2.1.bb
@@ -35,7 +35,7 @@ PACKAGECONFIG[crypto] = "--with-crypto,--without-crypto,cryptsetup keyutils nss
 PACKAGECONFIG[mdraid] = "--with-mdraid,--without-mdraid,libbytesize"
 PACKAGECONFIG[mpath] = "--with-mpath,--without-mpath, multipath-tools, lvm2"
 PACKAGECONFIG[tools] = "--with-tools,--without-tools,libbytesize libdevmapper"
-PACKAGECONFIG[smart] = "--with-smart,--without-smart,libatasmart"
+PACKAGECONFIG[smart] = "--with-smart --with-drivedb=${RECIPE_SYSROOT}${datadir}/smartmontools,--without-smart,libatasmart smartmontools"
 PACKAGECONFIG[smartmontools] = "--with-smartmontools,--without-smartmontools,json-glib,smartmontools"
 
 export GIR_EXTRA_LIBS_PATH = "${B}/src/utils/.libs"
-- 
2.49.0


