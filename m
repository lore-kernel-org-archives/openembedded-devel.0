Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1461.1793731007809909021
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 10:36:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=hM+godrv;
 spf=pass (domain: gmail.com, ip: 74.125.82.45, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-15943c9c005so3962482c88.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 10:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793731007; x=1794335807; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6/7IzCFNuxlWQKhf1PSyieUvVMeYgNagdhExVplEMo4=;
        b=hM+godrv5JRq6Jl0xJfzjVLW/roGbaybD+DGNNv7pmYgW2pF2lp/qBVPW3U+PU7746
         o/oKIDw+Uhf4PqeOyGBwcsZlKDc7Aolc6w3pDwJbptYJkmTA186QhnQuqjzLG3eyBOcK
         4d/M5O7xcIA+aijY92SsK7hr4SnxIM/zRKPoH6aE6Lr9r4gpfG4ZV2Z0MJGkJ2w4Xsky
         KMov4QgxAXfvuqfqkRu1/0XPXGwXKUhLpK90Venf4DcnH84UW611qcHBPHbWFAdshw+g
         hEI3s2j1DISlW9yHtEtfxkRMpk6LFCk2URBGWObBknt5nSsLhsc8DdXbQWTEb3OphoQG
         0vtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793731007; x=1794335807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6/7IzCFNuxlWQKhf1PSyieUvVMeYgNagdhExVplEMo4=;
        b=aWgxWI3fKVakPDctymB+pDjGe2+AhO/K1ZvertUR23iXiWApHnJRnsvsFn+c0LL+kh
         GURegiH3YWKSRdhWjunPF/mBHIZ3nBVDpMjzPwspj2oD3RiMsSvdr9ewHY1BUegzc5kl
         0FP+fJ40ZYgvuqacfKKVnn7tFxJXkkEpvjnMxFDr2CxgSM2Bf5q8cNhNOBlRP9dkFQK2
         JRpLOUH/91uagIiiL69MLHXnrgfJmrygCWzuyMlJlEcwornyDnJZoORt0ZbUrlV5x6PB
         SQMqIGbqthOB/wX5aH8VzIk62kj/xBJr5CSHXQ3STtYrgK/5hFdcLLpcOuppkppXOZmX
         HeHA==
X-Gm-Message-State: APuU4Z+PdZcxSO2hH4W3X5MvlBeslPIOzKbx3KqMce+fP4Kv96Pf+hBb
	2e0XgnEe0vzJXlsp8FenK6iMhZNv2zMclrsFDM37YDw7DXKb6XWQ91Os+BK0eQ==
X-Gm-Gg: AYBFou3Fkcibr6VdoeIc46Hc/oV6qN+5YNFTuHPHBXzLwfaM8d8N8V9r3ThiOidt+Zz
	HqnBhMqwJmo+bMe1J44X7fKjRMmu9swtzd2TRA5oppk1l4Yc/rjgwq/M5EXA8efaslIUgjnuQc1
	uEZqwotTLOW4yTmi++gqed/LuqrPdUUpIr9UAujri8AhqEO2v9R8/7CoEMk9jww7+HSs/ACUZpY
	PGs/JrI12jPKp9tIc15Q7yy7PVyOIUt4DaIZ4byuZUJKRHSuBdk2HSP/NOut9JfzlLBo57xHHQ6
	lCd5wfXqhuYiZKiHz/VNq2eBCd4pv+IvlUIB9++4Ugv2PyYVfTiAn6pHkTEH37VCYxwj4mUXcOn
	/z25QheqpZMxGO5T1u6NC0i0bjWXPry4SNRvkwM7s5RwwsTveOtW9qySNorQK0TBUazqcHVWwx4
	NGAUEJHqooWWiz6C7a2zCdEdPqWjZh2aBa461xsHJQZRvNlEQgBH5HIk+c39ENkwHLteLnQgBUh
	f2ZJHOuaznLb5FXtiQDbYP6MrUSGfilfwPh75swcsvn5N7RU5Ozmu+qzScpB5UopZJziH++9M1l
	02oET9JsYtvYL9smMWqKHbTIcJGw4AuQFheIsdHYGsoj68VHIeVaNX3aM8jZ0A==
X-Received: by 2002:a05:701b:454f:20b0:152:3812:496a with SMTP id a92af1059eb24-1ac5eea0720mr20811302c88.43.1793731006943;
        Tue, 03 Nov 2026 10:36:46 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c4f83fsm1192887c88.17.2026.11.03.10.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:36:46 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][PATCH 1/20] libopenmpt: upgrade 0.8.9 -> 0.8.10
Date: Wed,  4 Nov 2026 07:36:21 +1300
Message-ID: <20261103183640.919438-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 18:36:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131799
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://lib.openmpt.org/libopenmpt/2026/10/31/security-updates-0.8.10-0.7.22-0.6.31/

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libopenmpt/{libopenmpt_0.8.9.bb => libopenmpt_0.8.10.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/libopenmpt/{libopenmpt_0.8.9.bb => libopenmpt_0.8.10.bb} (97%)

diff --git a/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.8.9.bb b/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.8.10.bb
similarity index 97%
rename from meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.8.9.bb
rename to meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.8.10.bb
index 3b4be321cc..fd3e05a2d1 100644
--- a/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.8.9.bb
+++ b/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.8.10.bb
@@ -14,7 +14,7 @@ DEPENDS = "virtual/libiconv"
 SRC_URI = "https://lib.openmpt.org/files/libopenmpt/src/libopenmpt-${PV}+release.autotools.tar.gz \
            file://run-ptest \
           "
-SRC_URI[sha256sum] = "d7ce84fd05d686c4bcf66af40eae857afa371442db60eeda3f874bd6cf6fc318"
+SRC_URI[sha256sum] = "976d259288c40cd285771f77d09eff3d02514511d5677ecfcfb53be5013317e2"
 
 UPSTREAM_CHECK_REGEX = "${BPN}-(?P<pver>\d+(\.\d+)+)\+release\.autotools\.tar\.gz"
 
