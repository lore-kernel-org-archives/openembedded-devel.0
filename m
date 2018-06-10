Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9764678B6C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2018 00:51:30 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id p11-v6so10041051wmc.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Jun 2018 17:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=m9xLhgeM4z3DydcQ22D25QN4boeBdkAkQWKML8ZUexo=;
	b=opvTFx4w+jLauH46mr0ZCoT/tnuXvzf5IslWhJtsJd6UoVLHrhusRCxVvlYDcSgSHC
	NAHg34FSdTwfDlHcHTRz52mgmH3exS7zuYRbpTPQ2t8W0ArEqRpQWInVbUIuYLj+cvLZ
	9QAPweTfjfm0vL1aTDyA4rNuJCzevUrLXBO2sd6/Jv5+UlpL9RfLqAd81XLi43EMdI5z
	rK7fS6qcVtVuZ3Q8K8r3fHOyBVnzzCLwJ99AJhhY479tEDrWxJ7VDXYJgiY2i9Q0BupP
	DWcGMp10kZGHs01AEF/BFT4QxdMw6l8lza/dMDqVFZQCCzvsW+r81XO9QQsGJynyxUwL
	bXTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=m9xLhgeM4z3DydcQ22D25QN4boeBdkAkQWKML8ZUexo=;
	b=sJo97b8lWrZD1LqZl60EFc9pFF2UjMgpy6ev76Ykhtn2l+2CG1rAAY9hSwz7Fn5KbP
	d22Heb1mbyO7XGsRXXJJX4tJ3OA3+pePzEJmSMbXq/cPPlLolKgNOynYbJKDsN/5Pbd9
	OPTV6vWMd38wMm0Ct2qEdr65nz8zO9zfcm73Z0Khi9Jk/4X10lwPsZEFOWu7JaaaOHuX
	DiikZ6eH7RPMsOc4RtS+XC7tcPsFrekULRjLOWhdCZVfGX7qsX4nb23e42QwSPqyGycH
	ha1r19oKJ8uSSHvyMokCPXICOaHLESZTeISE+6LED3mEeoLd8hDj6HNR5Gqz5MgWpoXH
	T0zw==
X-Gm-Message-State: APt69E0q6Gjjp7MMDuorrMy9qcwY+vJ5lpBFSytutkAz2URpg6OU+Xj4
	qljKUsNLEL6qD5Luj+0XYLmZ+ngT
X-Google-Smtp-Source: ADUXVKJvBszkxCyJNXLDdA7IjqVGbILePGyUrd94E92bknc0YbERkwJNxL/b1c2OZOMM6ilk1MzA8A==
X-Received: by 2002:a50:aea8:: with SMTP id
	e37-v6mr12981590edd.285.1528591891020; 
	Sat, 09 Jun 2018 17:51:31 -0700 (PDT)
Received: from localhost.localdomain
	([2a04:ae08:1403:ff00:ddc6:6bd0:776b:2bb8])
	by smtp.gmail.com with ESMTPSA id
	f25-v6sm20039380edd.87.2018.06.09.17.51.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Jun 2018 17:51:30 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
X-Google-Original-From: Oleksandr Kravchuk <dev@sashko.rv.ua>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jun 2018 02:51:05 +0200
Message-Id: <20180610005105.4153-1-dev@sashko.rv.ua>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <dev@sashko.rv.ua>
Subject: [meta-oe][PATCH] libsodium: update to 1.0.16
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
X-List-Received-Date: Sun, 10 Jun 2018 00:51:31 -0000

Added link to bug tracker and updated md5sum of LICENSE, which has been
updated with the copyright year.

Signed-off-by: Oleksandr Kravchuk <dev@sashko.rv.ua>
---
 .../libsodium/{libsodium_1.0.11.bb => libsodium_1.0.16.bb}        | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/recipes-crypto/libsodium/{libsodium_1.0.11.bb => libsodium_1.0.16.bb} (100%)

diff --git a/meta-oe/recipes-crypto/libsodium/libsodium_1.0.11.bb b/meta-oe/recipes-crypto/libsodium/libsodium_1.0.16.bb
similarity index 100%
rename from meta-oe/recipes-crypto/libsodium/libsodium_1.0.11.bb
rename to meta-oe/recipes-crypto/libsodium/libsodium_1.0.16.bb
-- 
2.17.1


