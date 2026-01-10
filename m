Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A512D277D9
	for <webhook@archiver.kernel.org>; Sat, 10 Jan 2026 10:37:43 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6302.1768041452891657607
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Jan 2026 02:37:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EuGKSl5i;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7ade456b6abso3243052b3a.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 10 Jan 2026 02:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768041452; x=1768646252; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xwr1ArxcOfLv9cdAk5tCZ3MD/wjQKcMZ4Vg5KDt+AKc=;
        b=EuGKSl5iOILoNgGc9svFLsXQBdRR442nDSe6f10YPv0YdnPP/vkecX3FVpw5z4S2JN
         aQ7jXVQHTVjrH6v6BZnOX3BqaxBmj9PrzFae+ppeRDIXa/mz9HZIzLjlHNGZVjADYH97
         DCi9EQRo23OxPmir5JFphc8+3HzKGCgHg4zl73+7GvA72YSOrVaopZpNGnJh7MEOE83c
         sV2t3k0ey71DDpj2wSgooddNetN8nxai4GYhYAF2Yp+oFfnmAkcndJi0eqHt/QbUJHhz
         Q6jnAuai4VQ58ZK+ixo2e0go8lD4HwdyFX2NM53U4p1tHCBvRrrzV2X5qiS7WeYn2CML
         SeYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768041452; x=1768646252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xwr1ArxcOfLv9cdAk5tCZ3MD/wjQKcMZ4Vg5KDt+AKc=;
        b=P8b0f3SYIIRyufQLVjfggoJWN/+2jSfAFoZTNcOU1ZNZi16MfOTvNFd7Qx3zxtaQHG
         TIs0pyUkPxtuz3om39gbmVRi0Ycdbi5MhAsRddfk1XBOYDVk0Lgo7hPyeDJZjHrvfbEF
         Zrt/X2eA0U3tj9qHHKGizM4zyrCpNHc8jnJvPqngC+g+bT3WkmsDiMO08sCjgu4QXi0Z
         EVoPQezcNa4S4rlozmFwGuKgdPYMHOdQsoOIq//XsaeIGFlya8MsbhR7UAv1P8iOqIzs
         6otXtWQf3vDpPFNq6+28yECuI9CU0ZfyeRp0neNtjA3S9JPj0/WWc6xXW9u+radQmRL7
         Ws2Q==
X-Gm-Message-State: AOJu0YyafTahd3KzL3Zb5Q3itXEBih8c8YfGWU5gyg08L0SrbhhDwVK4
	Usj7Kp4GEqbEJrccuFTAy2lo1UzKbYulLbjY9gfnf3RH36OniiAMr/NyRL7hbA==
X-Gm-Gg: AY/fxX4Coyi3DeTOereR/AaomMkvB23mAB/IEZsO+469Wa2ET9KVkhI6uo9z/dn0s5G
	dQW78FHKd6Y0uV+a2D5yxqnikmizt3Otka8/Ux5xV3IqnJvqbxYuiE1VigcnLXG7wqPSvqcCuHr
	j9aBnQKnvl9OmLjGSKoxsilqQtFS7SUDgqjDOQibRB0HUoCtNBMd6nUbMVGzw1gx+NiKmmzotV+
	J8M1L7njaA4y1QvzjLOlcTVMFo/TlpkgLfFBBxtXqpMhe/Khf+pzKAc8eaah5hApmXvvxIgFidX
	hiWWdchYx4I67bUNGI716Wf5LHFdD+hYnucizlRNJwKN/5dYrFXnAhAw13myMomKDEOoI/S2V7V
	JQbfo3fzF3iMKEB7j3bSm4HWU9MSuc9qU25sTiTsygHCbBN/U4o8zatW7brd5idCWhjC8uzEFXn
	d7QrwZYSu6NqhD+JwZav8AygafZdv9CiTTUA==
X-Google-Smtp-Source: AGHT+IG1qhUprGK+DxPvv7w9Xz+t9XIVXe6Ui+0KGVonr6LEBCTqCXq71inqelMI3Vt5OpunZ0oCYg==
X-Received: by 2002:a05:6a00:4c92:b0:81f:42ba:2005 with SMTP id d2e1a72fcca58-81f42ba25ebmr697283b3a.6.1768041451983;
        Sat, 10 Jan 2026 02:37:31 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.10])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81f46882d19sm375715b3a.63.2026.01.10.02.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 02:37:31 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 2/5] influxdb: ignore CVE-2024-30896
Date: Sat, 10 Jan 2026 23:37:13 +1300
Message-ID: <20260110103716.3470419-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260110103716.3470419-1-ankur.tyagi85@gmail.com>
References: <20260110103716.3470419-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Jan 2026 10:37:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123321

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

As mentioned in the comment[1], vulnerability is in
/api/v2/authorizations API which only exists in 2.x, 1.x is not affected.

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-30896

[1] https://github.com/influxdata/influxdb/issues/24797#issuecomment-2514690740

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb b/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
index 397b225ccb..37cf213d9d 100644
--- a/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
+++ b/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
@@ -77,3 +77,4 @@ INITSCRIPT_PARAMS = "defaults"
 SYSTEMD_SERVICE:${PN} = "influxdb.service"
 
 CVE_STATUS[CVE-2019-10329] = "cpe-incorrect: Version does not match and only the Jenkins plugin is affected."
+CVE_STATUS[CVE-2024-30896] = "not-applicable-config: vulnerability only exists in version 2.x"

