Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17653.1794787851504268981
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 16:10:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=YOTBMMkU;
 spf=pass (domain: gmail.com, ip: 74.125.82.48, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1a2af4c8d00so5879649c88.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 16:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794787851; x=1795392651; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6E3eV1KoT5m4VwHaIom8cb6royf7o6huXbk58yXuKjg=;
        b=YOTBMMkUU4wbRseIxcqZ4T05fhcAWiuNPKv5KAWz8eM6Ud0SnLIjeM5YcW/naAXei5
         ZlURxru81DJZ87eUn4EBAW/w7Aw6njBCa3SboqtPyproy0/x9JFxTW7JvJ/V75K5/m24
         AxuSLUdjIZq3k5p20j0qtCax286QeDkzZa5VyBaDRyXn77Rp8RTLSOpS4sVVqdmmtnRw
         AZCqA62EZkeYEcxULx/5GDbhUTN4vE0CzY4z0oA/xW/70Xoh559YWv7hIiZCjCLJgcCr
         Ebz95rWEMdi1rFcEm8Po3LbFU59gCkYVuvs+AfWzCSnK7NHF9y5DTdaOj7vQo8pOy5qy
         fneQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794787851; x=1795392651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6E3eV1KoT5m4VwHaIom8cb6royf7o6huXbk58yXuKjg=;
        b=BGsu/bQAK3DxVwzVg2/wJ3/a+LVGf5ZkeniAFJ4s2T8GRRzyHfi4oHK/eGgCUp1wkZ
         vihiBx8VwKRCTcyEMSabxEnsCx+lM1ATzLw4Hl99gQOSwBtx9B3Y3xUgRD/cwKQm/HKr
         VbrOYtsDa6D/cdeLRseNfhtxpEzXqWWVVjIreFxzTgxmNoPFmeHd9woaZRRt9gsiIYHy
         0TKzm+DHcCirNuI7/A8QQhnyKaXAvgKxZzqP1QFMy8gFH0T8mEaMmXWG72E6UlpXtr3e
         /J87Y+Y3boCW5cKGQeH64KaPGMusQQWsEto62NF6wS27REE8m4AhZeUO3dDlo/VSQfkt
         QmhA==
X-Gm-Message-State: APuU4Z9X0zrkfkoy63c5/Gbfef1lyZR1fd31IPTOp+T9J3+sy1O07ypr
	WySerIAzaOu2dZAdHO0rKKo8ARMT8gA8i3PG/9C+JTVWHm0MleB/BIthx4Tpzu/o
X-Gm-Gg: AYBFou0ogFd0jyIfHhD1bDqcQ+1ziP01jTdsIpcuHk4VTGE8gBkBFt95F8ZKec5g36p
	KkWwW1OWjFZpO6eBFo5ahratx0lHgZpkTlRoZAhzI0JZbplqqv/6PnWHSWZCRDe72g5DH5CXBSF
	3+2B+q2yx/fsiXp7si9nxwnhctDWBianiw2jlpRIBDeOj8q2b4HE9JDRJCPggT1EarEskUWsTwS
	gUCtd5hkIGmZ12eRWSEF9H6+1PL/+ZDnpO/WVreohr4+xWL/NcGdX4JY5wyo04G8u+Le3pP7UPq
	amPM73P4gpsk0ANT+8CIanazlRhWitu7Bw/KUPIafAZA08Oy7F9uoAU0hy/LqBTxNk8Hfqy5bLx
	vOakG/3J/p4Up52sMWURlOVSqp/Po60swwUmI/37KqOv0XhwD7yip2A4C6v+gRu8lv/g3GGoywQ
	3YCeV6PANVRU26OpqKYn7Uvw0MsQFE6teMILb6YJ+Hh/bmEcnWdWIIfUoYbZB2oCaM0B5NusbZK
	FlnNX1NtH6RzotIPsK3uppjxjt3YPeIGGsgwVBslOItX3jYOnwUq+VUIgbN6An3Ka3FDgYhRWQj
	K297vj2buWn1XUTfHA1Hf2LbimJnvow2tkkg4McOWQhG5NkXFAkxW/dHAc1j/H0N9OkBzUr1Siv
	/gQVwbVbzMFYNQyaPp4iwrXL2/nsS5SBVkPJpewLKDe2MqpESE+Ka1FtrQF4eSzbfs7nMnE7aIR
	w8U1eZh1Tnsu54vg4fsVIWInHuk63Aou+DoMSCRTcyLzIKOpfZHBssJXlLpCI9QbdUt1HzqTwW4
	pknflme+Kz/vKZT2O2vSZ4eDbtN0iXQLdVD6GcwYAzAWGV8ratOqEAR2rREK7J8wtwTJZFJDFDb
	ipkz
X-Received: by 2002:a05:701b:251b:b0:17b:fed6:7449 with SMTP id a92af1059eb24-1b5031695bdmr10517053c88.47.1794787850801;
        Sun, 15 Nov 2026 16:10:50 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316d9c2sm24163844c88.7.2026.11.15.16.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 16:10:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 09/16] postgresql: Add postgresql-client-doc to PACKAGES
Date: Sun, 15 Nov 2026 16:10:31 -0800
Message-ID: <20261116001038.440763-9-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116001038.440763-1-khem.raj@oss.qualcomm.com>
References: <20261116001038.440763-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 00:10:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132390
Content-Type: text/plain; charset="utf-8"

FILES:${PN}-client-doc is set but the package was never added to
PACKAGES, so the rule had no effect.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-dbs/postgresql/postgresql.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-dbs/postgresql/postgresql.inc b/meta-oe/recipes-dbs/postgresql/postgresql.inc
index 5ac0513085..2deb35b065 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql.inc
+++ b/meta-oe/recipes-dbs/postgresql/postgresql.inc
@@ -357,7 +357,7 @@ postgresql_fix_sources () {
 }
 PACKAGESPLITFUNCS =+ "postgresql_fix_sources"

-PACKAGES =+ "${PN}-client ${PN}-server-dev ${PN}-timezone \
+PACKAGES =+ "${PN}-client ${PN}-client-doc ${PN}-server-dev ${PN}-timezone \
     libecpg-compat libecpg-compat-dev \
     libecpg libecpg-dev libecpg-staticdev libecpg-doc \
     libpq libpq-dev libpq-staticdev \
