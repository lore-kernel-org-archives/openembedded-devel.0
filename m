Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA064C02185
	for <webhook@archiver.kernel.org>; Sat, 18 Jan 2025 23:42:51 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web11.6307.1737243763867733352
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Jan 2025 15:42:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YNErbwYa;
 spf=pass (domain: gmail.com, ip: 209.85.219.179, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e3a0acba5feso4701262276.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 18 Jan 2025 15:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737243763; x=1737848563; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FEHgGc0Uccr1F1O9NkxrMANdVkoKJ9ykupNNWchcBXg=;
        b=YNErbwYagJH83yaVeUHGSYvith6jPnpyhHmIDPCb/9xPyzGKCznk6AZbxCC1hVA2X4
         dD/2ajPPzxDHwoeVwvjU5nda6SweocCyPOHf9ivy3mCNJVIqOeul0yD3hdBKNsoomHpD
         QkNpGAi0s1dXiIiSqC0UOjX9QU7nwfisvaZWTG0lGZII1qop6iOcXIdT+XJSxdznTTJX
         ixSfn1G4Q+1+uIc3m2ICMtvtIt81NqNeXxzm723b+mBd1IH/YGqHbWlXGDUVbnrhH3T/
         m7RqvAh7UeADZxUkIZ9HVG13mzsOgex1Qn859K4o9Ym/C7/BaPFq0fOl00/mG781riv7
         q5Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737243763; x=1737848563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FEHgGc0Uccr1F1O9NkxrMANdVkoKJ9ykupNNWchcBXg=;
        b=EdlaHYD1q+MiXd25vrsqesF8R61eJYKXq0ZZjv+OX4uLwuPH6sIYRp5P1yJ3PWpiGh
         zJV34jdkOF2aaGkYLq831j6CvDGuvcpTOZGj5DsH/pGOKM9xCJ0sX3WEY4QFSYyvfHj/
         4WGYJdUbDHt+e+7WqR/rHCtM19YS6bKa0z+6elTnWQGRgrzgITy5K0nKKwuGertJs1r8
         t+HKgVWnCvmpYYUyRYZmC5sjTm8lZZtdCEURngYvw5fTDINnbZY4LCyZ4J7Hp4EtsLY1
         Rbr7UtpMo9kyEMuWDxiTDyp2xHHCfxkZnD2SNRJKich3vB+f6/TJaDcdE4BJJ0nsXZPs
         v8IQ==
X-Gm-Message-State: AOJu0Yz416O5c8xSxfbtWrsZYY/myggloa0tbtrN0ut8s+VT0QXRSWaP
	vDBO6VHusWlSPQAPbhmYTuEOBY3xVbQEZhdOBMDyrGMiU8xUFSI1uhjb64Iu
X-Gm-Gg: ASbGncsInkdYRF8KMkImzfXWkV1j9CdSKVfBcbIJbPFEU3aHO4qheKKi37RIzDsYP5K
	OH04cnQFKJuyoEdYxX+tE+YDkAVuV1HXrJ32Jo2fMezTCDK1UUeqFlD99ajB/oYTozUGsNTx6ce
	Ss+a9AKE0ukUXpq3fivZDuS9Ctnf3BElrO5+VJOnZQIPq/uxb8lew2e48Hgyjt8LZa80vUgw1lb
	aAj9vWCh4mc+XyGWxo3unxqmtNpEyXLuhBKlzONn2EQlW7+6Sn2TbcdJT4DXJhzZJSUsTDRarCi
	mTzVaWV5x1Bn3ma/FvJWGsQPEsi7
X-Google-Smtp-Source: AGHT+IFx/fa3D2YXj+WgUN9wvSRWseNZXbMdVC3OrLcdPVMu3zQy1enn1X0oPi1nPfl0dcuaEi7jkA==
X-Received: by 2002:a05:6902:188c:b0:e3c:8ec9:c896 with SMTP id 3f1490d57ef6-e57b12f8da2mr5535661276.34.1737243762270;
        Sat, 18 Jan 2025 15:42:42 -0800 (PST)
Received: from localhost.localdomain (71-208-20-57.ftmy.qwest.net. [71.208.20.57])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e57ab2e7d24sm974408276.14.2025.01.18.15.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 15:42:42 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH 2/3] c-ares: upgrade 1.32.1 -> 1.32.2
Date: Sat, 18 Jan 2025 18:42:11 -0500
Message-ID: <20250118234212.13357-2-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250118234212.13357-1-schonm@gmail.com>
References: <20250118234212.13357-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Jan 2025 23:42:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114952

Changelog: https://github.com/c-ares/c-ares/releases/tag/v1.32.2

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../c-ares/{c-ares_1.32.1.bb => c-ares_1.32.2.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/c-ares/{c-ares_1.32.1.bb => c-ares_1.32.2.bb} (91%)

diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.32.1.bb b/meta-oe/recipes-support/c-ares/c-ares_1.32.2.bb
similarity index 91%
rename from meta-oe/recipes-support/c-ares/c-ares_1.32.1.bb
rename to meta-oe/recipes-support/c-ares/c-ares_1.32.2.bb
index 81eae9d83..438da9aa9 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.32.1.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.32.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=2047e36c793a8e9c3d3f4b66f8934a19"
 
 SRC_URI = "https://github.com/c-ares/c-ares/releases/download/v${PV}/${BPN}-${PV}.tar.gz \
            file://run-ptest"
-SRC_URI[sha256sum] = "63be2c4ee121faa47e9766f735b4cde750fff2c563f81c11e572d3dc6401e5e7"
+SRC_URI[sha256sum] = "072ff6b30b9682d965b87eb9b77851dc1cd8e6d8090f6821a56bd8fa89595061"
 
 PACKAGECONFIG ?= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 PACKAGECONFIG[manpages] = ""
-- 
2.43.0


