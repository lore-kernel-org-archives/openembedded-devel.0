Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72E3FD3515D
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 08:33:33 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8210.1775032407399367118
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2026 01:33:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MOcIszR4;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43b8982c2f4so3322572f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Apr 2026 01:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775032406; x=1775637206; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4ZNjsIEEXCKDNBDg5DhxEeC614JlEoRZWN9jge6s/S0=;
        b=MOcIszR4UVPjt4lW6TJZYBaRVDg+epDU1nbwzwCKwFkgYPjaI5szt1jbvGc++GdjqL
         scmQrSVmQp0i5xnC2TKoWp8yXos2iNZStdeANEuuNdRNygGUif8+oxmQUnaWS+/AijyE
         83B5c4PIsE23YwWx/gStPcoatzxYywDJ1H09ZgV+YLzcysBoZLKJ5Eny5jdld99m81n5
         N9S5AFo/5cuT00caXMh7F5mMAj6XzM8JJ5jGNlzM7m3Jd1r3Vv12qDeSUuaRZVH2bnT2
         bl7N7mFWmVtSvNt/vr0S9d2s7/7cXsuPCEKUUz6KUdn64XvSrxe3U2UbTfDl4JfFMwWi
         bhzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775032406; x=1775637206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4ZNjsIEEXCKDNBDg5DhxEeC614JlEoRZWN9jge6s/S0=;
        b=q/s4UCbyjxR/4yazUHR8QwUrrKZMPsD1eWn8dNHXIXYTkmub3lWpOQg5R3OePkoLU1
         4/xESIPOIQhqzrUQjkUST7BWYGzs1vpNHyxx15zO42DUWa05VVJar+52KE+OfZyoWuUJ
         H7aE7N9hqKgpRIxBHoJOMtB85hsPEndhz1dN/lh5CXj48IOOwl+wUcqhZfcjlpGLsM5q
         Q/I0Q1fk+80bPdyQ0RLNd9Ud5qV9BAFVGrHjLtPwtMuiMKsfZWeMdJc+Ydd7O8TFDl+o
         mKUlHyn5LXMnIDqncvC9Zdkv7+/p/3+muMe/iY9faS7UunK5SF0YDFhZHhB/bspH12x9
         TjYQ==
X-Gm-Message-State: AOJu0YwSSHEiQsY5q+pCJo0RWM2opjgzzaYBhlcv3Hf4abGteQxA4xV+
	jXg69JaLfQGD8I12mf5pia7YxYqzYOmH/+IPK7M12Au9o56C3q0TEJkmA5Wa0A==
X-Gm-Gg: ATEYQzw9M8rh19BOspHiexssPKpapOA9OQFiueDZ2326RkxutpLkOTwxjffjFAU+HkZ
	bYzu7eh53oyscV93ca7/roEjoQnOzuZBEjOzgwTkyZ3oPq9zwAgiGQfFm5x4ndXPbwP9AT8BOld
	X3sdCsLXMArTxsOjC4Ry247vbMGDuQp8TGgpbM7QzjB+Idjw3DUvXDe6aDWovNNMfX+GVg6Ipvd
	2ncJLeaML1w41nW178WUBeQObIorq44dSmkxc7erd+FDtnNeIPGsF3qg0cgFG1wr0zefq8B+T0J
	x90mICao9GU+5NP+eD66taB23cxVuH3i9RFAEbCrhN/cbfgqrxCS+Na+OPVDs00pyoXV5wQBov6
	RGK7PP/1HpbS2ZB84TnL/XjzqowFtT8NdnLMPWsbFtubCLj7bRrxX0Bq8ucmT2MdhlyppGhpTuK
	qKG5J7+bn8eFWrD1tfnlNY
X-Received: by 2002:a05:6000:26cb:b0:43c:f1da:4880 with SMTP id ffacd0b85a97d-43d150bd4c2mr5120472f8f.22.1775032405544;
        Wed, 01 Apr 2026 01:33:25 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf330872asm31524338f8f.17.2026.04.01.01.33.24
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 01:33:25 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] zabbix: ignore multiple CVEs
Date: Wed,  1 Apr 2026 10:33:23 +0200
Message-ID: <20260401083323.399106-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260401083323.399106-1-skandigraun@gmail.com>
References: <20260401083323.399106-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Apr 2026 08:33:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125902

CVE-2026-23919: Has been fixed since version 7.0.19[1], mark it as patched
CVE-2026-23920: Has been fixed since version 7.0.22[2], mark it as patched
CVE-2026-23921: Has been fixed since version 7.0.22[3], mark it as patched
CVE-2026-23923: The vulnerable code isn't present in 7.0 yet, it is specific
to 7.4 versions. Compare the fix[4] in 7.4, which is changes code that doesn't
exist in the recipe version. Ignore this CVE due to this.

[1]: https://support.zabbix.com/browse/ZBX-27638
[2]: https://support.zabbix.com/browse/ZBX-27639
[3]: https://support.zabbix.com/browse/ZBX-27640
[4]: https://github.com/zabbix/zabbix/commit/043c28c2083bf8ea596966f2b6b51a26de7deca3

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-connectivity/zabbix/zabbix_7.0.24.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix_7.0.24.bb b/meta-oe/recipes-connectivity/zabbix/zabbix_7.0.24.bb
index 330dd1e943..ecd7802326 100644
--- a/meta-oe/recipes-connectivity/zabbix/zabbix_7.0.24.bb
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix_7.0.24.bb
@@ -77,3 +77,7 @@ FILES:${PN} += "${libdir}"
 RDEPENDS:${PN} = "logrotate"
 
 CVE_STATUS[CVE-2026-23925] = "fixed-version: fixed since 7.0.18"
+CVE_STATUS[CVE-2026-23919] = "fixed-version: fixed since 7.0.19"
+CVE_STATUS[CVE-2026-23920] = "fixed-version: fixed since 7.0.22"
+CVE_STATUS[CVE-2026-23921] = "fixed-version: fixed since 7.0.22"
+CVE_STATUS[CVE-2026-23923] = "cpe-incorrect: 7.0 versions don't have the vulnerable code"

