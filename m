Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8125.1794465752698029294
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 22:42:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=w4ofKq7S;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cdab938dc83so1576434a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 22:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794465752; x=1795070552; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bMy+o2Y0P/gK315uAxp5jbvpEmJ9+Hudeq3NVOnDwDM=;
        b=w4ofKq7SkFRj/2ZU+jbrJAGhPD4If/FxS4awidZckRVgQQtB/1PIZ1tH6+ynX0pWtd
         wkVFfy1LrP+2EpRFg4uHDN2mS3k2CoJ+tMOAtRxcu3qLZEiNeMKdIfqomuUJhFb9Fyx2
         9rB+Z9QhreVim9/VDQj8eKJ7ysxoiqtXcuuWeJEl6Tf23qQDP9C9k2byq5h00yKjJmsT
         MJAq037OGC53r6IS450FtxzJxDI5JOhL82Gs736lmiPtPXEcPhGqsfV1qaQftR7n5evH
         xfPBah5KUBzZXvDV75KNxtR7SqW1Ubt5EoS4Znrr7w5gHpzgZ5rtyDong5hMRUzWUpNx
         jsRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794465752; x=1795070552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bMy+o2Y0P/gK315uAxp5jbvpEmJ9+Hudeq3NVOnDwDM=;
        b=qNDB8WJmuvS/I80j2lUbVrTyXwSDqjZrgX9ybBIruiVuvbnqSm2CARA0c8QNDMtD3X
         GQ5NmYggU3oeW60aZkSHH7HylroXOUt+8nWWuqlAqSKsECwo3UebWKXhO5mKuvj+hKHO
         Hkqapl5OUbbwP84hbiAehyc1ADEs0MdIPGMvEW8RDZ/syN/6z9RLid24Ylw8Pi/b2rCf
         KdNljq9Q3jMnWr3DtwzetsC1Q95YYC7RRa7Szuj3BExczDZ6so+qsqFzbFeCew9fqBFj
         0sFun/78kYq/P4+ihFtNoanL/PQ1BLCaXr+zWuuy5TvLFyFi+hdvfIwtnbjS3wTPooFt
         a7vA==
X-Gm-Message-State: APuU4Z9gF4UDJTpTgkyA6p2HO6jExb2Rxxny8XNDHvOvcRVkcyirfnu8
	0oI2SDsNLhU8xUXyI0tlCCQyjyHC/WRSCxM4b7zPNE5VaNwkuKYKGTTN847QmV2Q5MI=
X-Gm-Gg: AYBFou3jjEQBFO7NLqSk5Yc5EuQabDfCeTZDZ6mTeOdZkU5sEra4fylH1ku4eSnMhzW
	+3pB88G5ajW972wOtE9BCkp6Ypw7OvYZ/+qBjkwgvD3ZxPggFVltdvGZT3LDODn6SMjvjiNKJ74
	zTaorL1DUHkOQcmHajU2727mClIGCisTb+yqK/okoOjWXdYWo22S5LgMHBBo0CS68DJ79W7VABo
	oqnDUOZWCm3ZjTk22zAaTRPS/knhvf0x+3fAttNkDmDpxm7UNfSDMuFE5JtTg/99OoEnEIpSdXv
	95qyJgEXEaKPjtm/ki7mHMy+7Ero9VjC5Ag3uMwWBWFGuIQtOrhOn58zUAZIT/gUaOGzUe/Kxrq
	vEOStc6I4L0cjIJkJveGzxjNQqI7PdeJusDnjANUP09ZnQJ1Xl4P7hIjmoWATGC91F2E4SSoEOe
	KmKyT0iTOyjdc2Uc2CJDpdfqwnZVWJzd/YWaZeFzHkBbh8PCFlQ1sKkk5OifRx464Hak06aaOsq
	GLaWRivmq2nnaKXbmOFyY6ebW4S7uCFZqTm2PRhBsY81Db0kdijMJld4YXZ40Pp8nVc+tCsXr2y
	WzyihvVpgK3SaNoegJWoOmOcNIxbYcH/eotKKuRPPNR1oyrlKFChRSobuil+e1xV5STSdZrZ2wx
	nL6hUingx7jEWrNZnVm3kmldcVjLbEhosh9B0+JceW2tEXQTtYp6UMQ7cq6fnXg3SjiNLI1VWsK
	P0EUEeAVk9PsyeQNf/ZT0gDkMsrDIS6j+7oSUGY7uqrH5PRt+g8FqbNjNO+E9y7i/vebx3gJYz8
	jICjgPhvwJ5zYzH1nn2hJrSZaOUWcH6VKdVKxWxMn99G01XiEIc5OpQenhMshnb7MxNfrCyLKPA
	Tpfo
X-Received: by 2002:a17:90b:3b4c:b0:3ad:8ecc:5907 with SMTP id 98e67ed59e1d1-3b182fcee89mr4751356a91.56.1794465751903;
        Wed, 11 Nov 2026 22:42:31 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c768e8sm2984715a91.11.2026.11.11.22.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 22:42:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 03/24] libcpr: upgrade 1.14.2 -> 1.15.1
Date: Wed, 11 Nov 2026 22:42:03 -0800
Message-ID: <20261112064225.2410019-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261112064225.2410019-1-khem.raj@oss.qualcomm.com>
References: <20261112064225.2410019-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 06:42:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132172
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../libcpr/{libcpr_1.14.2.bb => libcpr_1.15.1.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/libcpr/{libcpr_1.14.2.bb => libcpr_1.15.1.bb} (92%)

diff --git a/meta-networking/recipes-support/libcpr/libcpr_1.14.2.bb b/meta-networking/recipes-support/libcpr/libcpr_1.15.1.bb
similarity index 92%
rename from meta-networking/recipes-support/libcpr/libcpr_1.14.2.bb
rename to meta-networking/recipes-support/libcpr/libcpr_1.15.1.bb
index bdbd244e33..546cf8427e 100644
--- a/meta-networking/recipes-support/libcpr/libcpr_1.14.2.bb
+++ b/meta-networking/recipes-support/libcpr/libcpr_1.15.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=08beaae5deae1c43c065592da8f38095"
 DEPENDS = "curl openssl"
 
 SRC_URI = "git://github.com/libcpr/cpr.git;protocol=https;nobranch=1;tag=${PV}"
-SRCREV = "f091b2c061b307ee89b164c39976fc9202a1c79d"
+SRCREV = "3139b2682f0b1d6af8c7ae48cf400f9d9988deec"
 
 
 inherit cmake
