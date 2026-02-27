Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C03D0FD533E
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 12:03:31 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.94126.1772193810501421324
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 04:03:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GxOJrIGK;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4398dd671daso2145509f8f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 04:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772193809; x=1772798609; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=piqJAMniF2Byn9dP172F7pbT8NBoZFP5ph72uMWjtkc=;
        b=GxOJrIGKzVBely7P+dhX4mMPDbpequkrKLIUAo9PA5Z5pfI++A3gxYm9Gqrpj4mLf0
         QlkB8ufmX83gc9Pg4xXLzEc0i31/j0xj2rzLd3L/afN7XToVRwblYfJZGdMVrF7dg4kS
         CD72DfqtGL47FJXlmA3BAJqdul+LNa+KByt4icB4atfiSnVQaLobfauM+nNct2GGX10T
         u2T0A82dHvlxgUVwo5hwYvrGWrOXPwJgouLfGt/RUuAKZ7xTLNGLqXk1dxMz5bUDjRPa
         c58/1H5xTWkBiqmHmhW+Yq/145/COXResw19N+nEAeqpxaFZ/Fxr1eCt1vDf26g30VBo
         B0Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772193809; x=1772798609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=piqJAMniF2Byn9dP172F7pbT8NBoZFP5ph72uMWjtkc=;
        b=pWlh4e7IVb4ALdl0/9zl9u4FhLkgvj1WGrtIQ6heg2cA7pIL93n0PdHuTyj4jwwA/+
         Nr+R43F2MCC1ScoBfkhtNsKzNicvP6emPJfjPF6mh6qu8PdEtecvKCXcB4z2OHQb4DND
         aTb+vUcjAOSbF9Qvo6pU12bavSZ7tE3sMjUTaADgUQuoEcsBDdpFbC3KoSGjOoB3B9LN
         vKbp/BuiTNImqAqWMspbDNE3J3UitjBoDqC/7sunqFUHa86OuuIsB5itCaisIBpLUcV1
         tu08PtNhII9Go1lHyZj2Z0ulYGAasfsInG/oSuaBRo8D8RkvxR487Yz0c06epfRRENhS
         +ytQ==
X-Gm-Message-State: AOJu0YxX/MR/843VUUfwo7Zdwr7BOlXPY1wojMtKYFPTLhDMbxfaa4c1
	x3Ln/+3gotk4CXDaJiMyR4Xl4dh99FpnD/6DgHyZDdu90EKYFDXwIJXEowkTug==
X-Gm-Gg: ATEYQzzd94Kz7W7gX0cbwvw6FcjUGK3XbxVpQilEngvWNREugiiTMHdIcauDO6vGJj5
	zp3kZ1PomUaLxbuyRwdjLHbKsbXRGBTf056yfd+ZVyLOkIXqusBQ5sDmsc6J4e/LpH9gJnBpfFe
	stqnGkQ1lzDAjXcNxu4Wp1+iNlNTrYA6rKbU99wpg5GXX8V4UdHlHMgsUXtbKcAIMjCRGTY1BaS
	U+w4cI248wkN22FrkLM6N6p3Ed5B0CBdK/Os6KztUDMdVAbJV+cK2eNVgStYQnXksag9WhjYZK5
	LgCteZOzpP4COW3H3u9lWtLvepLQKm+7ft7HgFL4QM5/LCCGY7fIBOnerhYhH/YiwJHEqOBDOV9
	vdCWqp0ksTSS7Dch1U/bBLu8ofd1mmRJhFyiotjHok49oEKX9yOBzP1/cX5k78fqCRNuQLXJtTp
	UsdI/53jnE7MIVACKozsNmfsSkkiJrzBY=
X-Received: by 2002:a05:6000:2f86:b0:437:677b:4a24 with SMTP id ffacd0b85a97d-4399de14bcfmr4287093f8f.15.1772193808350;
        Fri, 27 Feb 2026 04:03:28 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c70ff6esm9829566f8f.12.2026.02.27.04.03.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 04:03:27 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH 5/5] python3-werkzeug: ignore CVE-2026-27199
Date: Fri, 27 Feb 2026 13:03:23 +0100
Message-ID: <20260227120323.333696-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260227120323.333696-1-skandigraun@gmail.com>
References: <20260227120323.333696-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 12:03:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124756

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-27199

The vulnerability affects only the application on Windows operating system.
Due to this, ignore this CVE.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-werkzeug_2.1.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_2.1.2.bb b/meta-python/recipes-devtools/python/python3-werkzeug_2.1.2.bb
index 3c50d19173..9ea345c46a 100644
--- a/meta-python/recipes-devtools/python/python3-werkzeug_2.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-werkzeug_2.1.2.bb
@@ -45,4 +45,4 @@ RDEPENDS:${PN} += " \
 "
 
 # Windows-only vulnerabilities
-CVE_CHECK_IGNORE = "CVE-2024-49766 CVE-2025-66221 CVE-2026-21860"
+CVE_CHECK_IGNORE = "CVE-2024-49766 CVE-2025-66221 CVE-2026-21860 CVE-2026-27199"

