Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1695FFEFB65
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 15:40:43 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.98806.1772206835930410412
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 07:40:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZA2UIb8G;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4398f8403edso1710512f8f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 07:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772206834; x=1772811634; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1NRWOrYW3xOuG0ExMSumhiiUM0rhCW80ysqtszY9yeU=;
        b=ZA2UIb8GgUSMSoM6qMKf0ejEfqhhcEE5o+un/qdzcfX57Y13XtZCC+dENhIF4DqC5q
         sFQN8L7lJsKdnnV+M0XNzXqUiuumM4917W+HzK9UNJ2MZTQUmO8tbbTvXDiARl3Cli1x
         qvSdeIDvd6hqMMjMamQ27FPKhrEcWeIkHhtNyh9GchjRg9+zTXgxoFa2k8Ck02WjS9w/
         CRKyxehPsjrqSIVuZ+NaU0sLE27OU1QJK0sYp0WqRoen/Ug8gJjXPDvMMV33WTHj1oiT
         HAn5nnfWItuM1vgpydls4rS4vIUBs35ms9/gLA03o5J8CS4ECPx7hZQv++uyhGzTX8S1
         3J8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772206834; x=1772811634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1NRWOrYW3xOuG0ExMSumhiiUM0rhCW80ysqtszY9yeU=;
        b=RQ97avBETg2Vwkg39BGCr+fsZF5AoE3cLUUcLMK4fGC6nV3OEarpOJGGZ8jF6IRwPX
         7GSCHu8ns7+toEj8DLRaWiuu+xGZAZRsqt6Ds702P7wN2r7EnjtHB+pacSrc2fj8FpkD
         0+X2CYvuqh8uPSFZ53DsYIh/3ZsBVFu/VUoI4v7Y62nodbHlbViPHV+woZyHcwp9AUDU
         vN2ZG38TtIffxHgtRYy0CG12kjU0I+WTZhqjuyq01BfVwQWfW7r6jMjxrQFbX5O9ERgk
         tejKxJn8zpQu5NDtwX7dH+9/WpCCj1qRPp4Qx6Vh4yqyoflC3Z/eqxQK2afXckwX6bKK
         98iA==
X-Gm-Message-State: AOJu0Yx1KyWE9v3DGs2zlOD+IL8jsjMXFsazR2oMv1XAqH+fWy4/VjKS
	WSqjS62MOMuaT4grnK3vllFtU0Rioq+c0HVCgdWbXKt34gtJAGBun/0CbTdxvg==
X-Gm-Gg: ATEYQzwWvsL2/6Ilb3NQvD1WxtxLoZpco9Xpm3bQnpc07dFITRR0ZSOH6cuMqBWZ1id
	CIvxEsbax4fQzlln2iV894qi1138bgFzuBzAWKKeX+ivI0k3gReV36UxHWrNdcvgaW68KywDahs
	aS3b3igQ7Al4yGfppFnFpsLTAYmMK1kzSGDF/cZY39gPhxqAoVTT1nP5ZT9d1EXgCxH2GorI6pB
	o0H7UaXR+muO8TBIK1T4no7WGDWxnKZRNFpK+SivvQ3tOcRtsFw+viLuVz6phDrAZLQRCniaEXb
	2O8RRHVc4zs03IQBB5OzjX7P+zOYeoDKXU/zEFQ8c11EY09MLG0q4L6fowZsJ7yM3v0x2dQSkYS
	F1HwZ+UEn2sPj1Wijqqe7V669l2u4JZ2t3bOJVcNfJyUP1r0XW+8sORu6oPRQZJoLmzRJB5TZnt
	xWKkpPZAYb/TnhUUAdHrDa
X-Received: by 2002:a05:600c:458b:b0:483:6d4a:7e6d with SMTP id 5b1f17b1804b1-483c9bdb6a8mr51131825e9.30.1772206834130;
        Fri, 27 Feb 2026 07:40:34 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b770e7sm123409785e9.9.2026.02.27.07.40.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 07:40:33 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][kirkstone][PATCH 2/4] gnome-shell: ignore CVE-2021-3982
Date: Fri, 27 Feb 2026 16:40:30 +0100
Message-ID: <20260227154032.499047-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260227154032.499047-1-skandigraun@gmail.com>
References: <20260227154032.499047-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 15:40:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124759

Details: https://nvd.nist.gov/vuln/detail/CVE-2021-3982

The vulnerability is about a privilege escalation, in case
the host distribution sets CAP_SYS_NICE capability on the
gnome-shell binary.

OE distros don't do that, and due to this this recipe is not
affected by this issue. The CVE is ignored.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-gnome/recipes-gnome/gnome-shell/gnome-shell_42.9.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_42.9.bb b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_42.9.bb
index 4157cdb67d..ea08e87f89 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_42.9.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_42.9.bb
@@ -70,3 +70,5 @@ PACKAGES =+ "${PN}-tools ${PN}-gsettings"
 FILES:${PN}-tools = "${bindir}/*-tool"
 RDEPENDS:${PN}-tools = "python3-core"
 
+# not-applicable-config: OE doesn't set CAP_SYS_NICE capability
+CVE_CHECK_IGNORE = "CVE-2021-3982"

