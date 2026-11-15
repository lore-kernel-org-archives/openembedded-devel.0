Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10710.1794762020755196972
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 09:00:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=o1dBzvxG;
 spf=pass (domain: gmail.com, ip: 74.125.82.41, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-15ea896ddc8so3883427c88.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 09:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794762020; x=1795366820; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PxYPezS6P4Msl7cytIefLiejGTt3zagT+XOwayylBrs=;
        b=o1dBzvxGVkmx4RpSc0ZzdSZDdWW0wLqdC5PL26YblB1JQZtmM6XOkTT5lPLzDYD6yz
         1FPZGhVf4I3wZCHyzIlW7+v3M8dZdEodFQOE2EHxMA4E2DouDSGeBD+P2+ppU6QHJ9pA
         m4ZxWoMTxi5R/n2bA3eCpUlBM8fsvOaTuWn0pATCa9yPaPiMsFdCat6KcNvnoJxbtklo
         /eIBgWVQ34PCnu5TPN4TAW1/78Q58G9kA96NWlf950tC+Aur+KkJ2oRnOnH3PNADqV2F
         7JNHLKc9/oIT0UCbL9SeRZpWQZd6k2sVDPyhvQUxXN2wIO0vMq3Z5h7oaHeAS08SBVs/
         ZKsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794762020; x=1795366820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PxYPezS6P4Msl7cytIefLiejGTt3zagT+XOwayylBrs=;
        b=mywT1vs8JOMZ/j4FWrIvI5Wx9R9W4wRMw4deMTEgCeXT+J7CPz7ZnFWq9pAQkSnIZf
         B8npMEQ3/yMMMDAr9fPl8XWyqCGjj145HIcMzMax5l5TjkHmvuNyYp1rIK5ggeYOm16z
         Eu4ZL6rkPzV6q+IZ8gtBQ1kqphBQHjUcdZDQW8RmeICWCgVwVWG1MhwqQgMGn/Ud0vPZ
         lofLZDogXghc580FPVie+H5prX0G2oLvl37PQf831O4oB/ji0gu8LqFRITnFIncO9umE
         ud7RG/DA72tc4RowDv2++DMdrkFw3yVVW03BtL3DtiqqE3kNMf+b7J5E/CgQ0Vun5X5r
         2VCg==
X-Gm-Message-State: APuU4Z9yZqnr02Qpxv4Kl8nKhAA6onIL4ISkvt4hdWoe+X1xR3G99fOq
	NtRjfX0qZI+O4husEEXlxGx3cQphU/3P0rdAdmtYq+M5I2SbiK/pY+lDTeuSC311
X-Gm-Gg: AYBFou0ajCgPBIiWf1fd9yBrrmpxt+PxSqJg5r0BLKEXu+uoxPBvJ+dAd3dGODzuLzp
	zG6VkfL6/xHqjJNg3vQ5OkqzFojQsnb3SiwII1J5K0EEBkbLe7fIZCutdk+nn15vayVif5MwYnL
	/z/v5IMyYASjOub+2rb9bmjhGl9FTggiO/1TpY+vc8y7LD6OqkH+vOEFr+JROAMCFq2gUk0xT9k
	aBc3hk6UpwaMF2e8zJXbtv7AEMYdCG9f/tpie2T0pfp5z66urgd3R5GI7gLrP2bynEV2HtS/n6d
	NoPSqOhjzJinrEfZexc5kBq3ZdSw8EVVMmwj+AUtdB8DHOckwBzXhJUmZcrde8MSesREnJYU+OS
	tzlcL19A0qp6QJe0GH8zxkhPzD3/Vaibzc1W//Vv4zRbRK2y9MJlayIEzFyHsAyC/+SqyQB+mD8
	s+p33lEFsvlfoxc5oxFG/BMlBIPCcB/Yr0D2BEgXCLJfa0RHoyogYVB2YbyIiKwBAjsdrHMhyNe
	eFVM+ZvcLln7xq09n4WHHr0grN7f6tjFgMkbQ7roNsSBzThxWZrNk2bOE1jH9C7vuIIZTiAfcjV
	bMGUOt4hIvTvMvugPBcdkcyEu0un0dlZOQONIxPzVTlD3LQGObL77qE9le9tEZ7GZdLUAjcobqe
	H1z+ovSCab0PHNKksNX5uyFg9rt1ReBVgTa5ez0mvBswjWSPOW7SsVrZ9H3d/V4PNEWXRk3m8Jj
	QgJej0esKHONtIxRBbC8igr+/l7h68RGtWPbE1XAInBHudgd40z2x7ODmIWFGGW9jpjHOzEn10F
	Lt6XJ8s6Ob6dnATvAdTLZgWwwNdZE6oA0Ouj3R3qla38xGGCcOeAAfdvPKLckowajnCrpCpV1B3
	yp/vlNhrxpuoq0a5mOx3573Pyw==
X-Received: by 2002:a05:7022:1603:b0:199:4f68:7710 with SMTP id a92af1059eb24-1b50302f24emr9420619c88.2.1794762019893;
        Sun, 15 Nov 2026 09:00:19 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm29442397c88.5.2026.11.15.09.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 09:00:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-filesystems][PATCH 14/15] exfatprogs: upgrade 1.4.3 -> 1.4.4
Date: Sun, 15 Nov 2026 08:59:53 -0800
Message-ID: <20261115165955.3485789-14-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115165955.3485789-1-khem.raj@oss.qualcomm.com>
References: <20261115165955.3485789-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 17:00:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132380
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../exfatprogs/{exfatprogs_1.4.3.bb => exfatprogs_1.4.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-utils/exfatprogs/{exfatprogs_1.4.3.bb => exfatprogs_1.4.4.bb} (93%)

diff --git a/meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.4.3.bb b/meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.4.4.bb
similarity index 93%
rename from meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.4.3.bb
rename to meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.4.4.bb
index 65e93b2e00..294126a350 100644
--- a/meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.4.3.bb
+++ b/meta-filesystems/recipes-utils/exfatprogs/exfatprogs_1.4.4.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz \
            file://0001-tests-upcase_table-use-dd-printf-instead-of-truncate.patch \
            file://run-ptest"
-SRC_URI[sha256sum] = "57226a8ec1bfbce06d68a42cde8cd980414a9457882e691fbce4a4f86c8d5f08"
+SRC_URI[sha256sum] = "102bbdfd934776c12c6d83743a31ec648f8c2f1ddfa1832b6e13b6efd09412cb"

 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)+)"
