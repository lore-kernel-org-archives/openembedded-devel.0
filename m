Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96052C79FA8
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 17:08:32 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.69159.1767632911930732061
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Jan 2026 09:08:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cEhh2rB/;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-78fc0f33998so1987377b3.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 09:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767632911; x=1768237711; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v1som6GpUj+z0ONF4zQ9KO9UQRXQyEKPMs00UZHp38o=;
        b=cEhh2rB/NRbs6hgZ4ZDGy7HLW/DG/fdC5ww3vHKRm6PvS7luB+3NF1cSqkjHiNL8xM
         Zb5JGocAhRPlB2eKuh36GteZ9yKd8Tjj3sa04Clvn6HX5SYUJLn6TWleJu4wm9hqlI2G
         DzbY7Z/IYpjv5jdYx9D1/mz8I9kl212r6PHpZ67xZwVuwX8ggPbfsIvznFRE+W/qwm94
         fIYWAZtJuu45/rrkSP5Eyah5pD3ppvCWb7lncKVIHlwi8WhLuWj/qxykRF/vlm/zFrKL
         aZfilQ6MkdclvtKp37JUnb7mW/9Ah14ZEy/UsoKCAgpYBJ7ko3QyJZljf3mlQignqWBs
         BBdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767632911; x=1768237711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v1som6GpUj+z0ONF4zQ9KO9UQRXQyEKPMs00UZHp38o=;
        b=OoEA0FE50tBsEyxKRC7WNUVobt78GqRi/7MwUwk6IZWnbyMfaIgM5gqyBqPuJfJuhg
         ZDCHaQn398PRm4v54CVLp5GqJl6rnamigDJ6Nv+ZNtL1c/ZGyZ3T6uTvM/nQBl/BHV1j
         5r9OPAg5Yq9QufnNEzdkAKWVLG2igvRTDNpTHPUmgr4Yh0aBWvUChWqIYSINNewPczz4
         BstbCjK8gYiTavn67KcN2Xq6O+d/jlQmbnk2ST7bknyR7DAj/pkANVHP0rjs4u+78Sf1
         SnUoo8LpvyzsSV1MzlTcfX4pTvCouaAjvYm+B7WikUzKh7AyU3iV4IsuJ/DBsvo/w9Gf
         ojkg==
X-Gm-Message-State: AOJu0YzzmKcMFaNQkYm9Pjb8Fu1m0G5j/xj5QVwNdtn+oz6ziRbMu0nx
	ScH/9HDXGZWfPTEf2SwoPzYZr+BpgqF3zup9r53tcfLYg9CH5wy+IPNG7Oq0A92N
X-Gm-Gg: AY/fxX7dYbGJG6uX12yp1cu/bzuh/GjmZF13PmeaolttBPHbphkfSrv3qj4D7NYTrx6
	haOVya4dHqcYMoE5H6NFraHXeFu1buXTgtMdgpbxp4DUb3douu8UjXQBkNJ1GfIMZ3EWOxpSw8+
	7Srzvv6WHGn7FFQmAU3bDpi4+pm0uAy+JuEVmlSiGjNFMVbp5BS4UlKDZH7clfgeIQTBDv9deWG
	LSsHct5GozIczEuEvX6rwadTU5hpmkIH3c1tmSLbkcDgHNpE7V4XrVwJ8KAD9votVAE9lAr32QB
	Gpye2m2rV6bLoZPeR1bMKZgpLi+sCRSI7iJSN+y/8hZVWwDSaVJF1TytMsEZ5l5cjHZeXZ7brCp
	D+skRgKLQkJncCHU8Me/1coCUClLa4h48TeAXgR8tjmaBlNLf5UIP46BAM2KDWGKN7OPUjMJXzo
	qhklZHf6OKL27uNBdPtDokpdDpmaPBsjp6lcbwbYn8Hod6olK4M6/1P9+XX3tWNH/vaH0JkFSwX
	Xvw7766J3n3Adnln/7JCp+TR/Yb/6nq+deR1iWx80dxCrWHhCtkZFXmmImh2fawzQ==
X-Google-Smtp-Source: AGHT+IGg/EESkbMSaH3cHeTuSD9E//H7s1VCudkgaxoX28Auhno7TO2dZ+8a0qZRbtjehuFOt+JK1w==
X-Received: by 2002:a05:690c:6886:b0:78c:5803:f698 with SMTP id 00721157ae682-790a8af647fmr4989337b3.33.1767632910470;
        Mon, 05 Jan 2026 09:08:30 -0800 (PST)
Received: from localhost.localdomain (71-208-41-41.ftmy.qwest.net. [71.208.41.41])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-790a88c7775sm834957b3.39.2026.01.05.09.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 09:08:30 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH] xfce4-panel: upgrade 4.20.0 -> 4.20.1
Date: Mon,  5 Jan 2026 12:08:20 -0500
Message-ID: <20260105170820.9162-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 17:08:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123157

Changelog: https://gitlab.xfce.org/xfce/xfce4-panel/-/tags/xfce4-panel-4.20.1

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../{xfce4-panel_4.20.0.bb => xfce4-panel_4.20.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/xfce4-panel/{xfce4-panel_4.20.0.bb => xfce4-panel_4.20.1.bb} (95%)

diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.20.0.bb b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.20.1.bb
similarity index 95%
rename from meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.20.0.bb
rename to meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.20.1.bb
index f907e928f5..8efa88b9d7 100644
--- a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.20.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.20.1.bb
@@ -17,7 +17,7 @@ SRC_URI += " \
     file://0001-windowmenu-do-not-display-desktop-icon-when-no-windo.patch \
     file://0002-use-lxdm-to-replace-dm-tool.patch \
 "
-SRC_URI[sha256sum] = "ff33cd5f5d16c2193fe305f4878d82cd8d2feea92f2594bcd27b2b5c392d43b8"
+SRC_URI[sha256sum] = "5a7c8097527555640ab3d00307505c7c1b7302d11d92874f88842ea969483519"
 
 EXTRA_OECONF += "--disable-vala GDBUS_CODEGEN=${STAGING_BINDIR_NATIVE}/gdbus-codegen"
 
-- 
2.43.0


