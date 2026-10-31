Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.682.1793419078455584706
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Oct 2026 20:57:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=nX1RwD6S;
 spf=pass (domain: gmail.com, ip: 74.125.82.173, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so2345773eec.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 20:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793419078; x=1794023878; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8j7VduoM8xnRv+eIXnhJAIDd1AClOaDJghJc110XJBk=;
        b=nX1RwD6S8IMeqX6qjJzBQV2l6s16je7uVPKoWDoOgbx2S9t/t+u6Yx6NzB5EJMJINj
         +v3tXJuq47FVmFtvVYppxxxCK84yDMUpAv+bBTdgeuEZpavbg7lJEVPXiQClyZ8kUZMT
         78yaOuHcsE3Y/W5SZNXyv63PEJSoypjkmfpOR1JN4SGs8Hz4hEqazzKTheS4WcpGP0LV
         rrOqQaIKWVhtoUDxxfKVy/e9iGBRff0AB6s8Vv5AWJI3b/JomJwTnDCvqtDB0WkAtVlv
         6+9oHOaVcVXLvwaGcuwpQGAoOtcwgxFX3+pZyZEcb89n7CP41DCaJNjaYhKCA/5tC2hX
         cBwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793419078; x=1794023878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8j7VduoM8xnRv+eIXnhJAIDd1AClOaDJghJc110XJBk=;
        b=jZyo0K54WYkGswLSiW/J/wasW62C3E/LzR5qJbKfGEVEpYIkntIf9Q2hjqOR3djrQh
         4fIOH1GbheYpdQDqNLT5MZxeMt2SX1TxbDm5kirIQ6Jv/ObMr1cWzyNkqXjLh3DXImr8
         NrG2oGAJC8zX2c1PmSOD35tFAA6qXVJDL86pBhjIL/wINRG0sdaTLeTdwLfNP/8K/yjF
         sgAzp2GcRgUT6jUzwM/25t0GUtetrp4xSxHKXXN5ssKnKr5zRQgjvGJolqG8mS8eyxv7
         L24Ue8oSBl9jcM+rcpS4HqMc19BZKcmiylF6AlsNMbQd74Fqy1NvPhjBoMLlosVdnaJK
         W1Ow==
X-Gm-Message-State: AFq9FYI4IunRnzIS+NQpDpWAN0vBi29KTKX4nEUHbv2ho1Ic34nvtRm+
	3Xa1r8FXEs1zKX89H/DwYbsVotWUubtFeO3ESv7uocRBDKde5bLwBFfxE5CxGUCLc0E=
X-Gm-Gg: AYBFou1uGP56IMg+MkwAByoCDfFYuDMoSQdNhHS2xiFMrHDN32JHNuCOV7WH+nVxFJr
	+4aVoWkCeSLHLOSYQ3AAuupR4s9U9/tVq05ecmc2NNMp49MERqneSRhN04fSP7b6BxW13F1WDTW
	+JsB0etheTNUV2mHnUypR7buWuxvjIWaLaLQC+RWboVVqnRRjOu/Ho9UHMiEvV0jvW5u1eK/MiS
	n4wCb87XKiDSJZPwQtuae6r8gX/pIScCBpbQWoKS0u9YrISXBD+UIyFjk2ZmpFLmxt5L8nbqCBT
	P2U4XegmL11NlhGKHCBzzU3WNA27wQ2ViTvndJbWpNPhdKA718yXhWGLRfj5GMt7XosNur20lky
	RBJ7ZdQh1NEP6UmTCbV6dXwikOcTLJmMyZO/m+XEw4F2QjfZzjgJc2n+Xncm6vU8wDqm4eGEJDT
	XYK2icuuums3OAECjAw7LHlh9t9I7VVc4UdfXv4Oi8l+51s7+FtQYxUka/z4iRzzThrxfR1z0Pf
	YcorP+M5FVodcTGp9o5m25bVx7n2r3+UnIo0+HfjvreyNOClgyoAilEPZtmbOywvuDj7+NxW/IN
	9q7gUti5cr99zFQuuHzLCTTwU89GsZKSdq+aHPHiuQH3oCWd6Kpd0oCL7xxRu+PkzumtMql+VcG
	bHH/Gok9vOGsnuiOJB3QJ8g4EqyxTaObCNvPX6xE0sEmEW1DoCZtEaHIVszqVBzD7Kj3tXl6AAB
	0Lb2JmrAhz7QssWzzuLfnsWpnYcJace8uQ8ZO+UCa9NdrKi3AqKwpzgAtXATecfqfemYc80pu2W
	mcSImgekmXBXGSwY5zHQhATPNQEj0SoZ1CwUxfZIDpyYnpOgdMmWLYNqF+EMFYCqf9Gs3uwz1ex
	QwpH
X-Received: by 2002:a05:7301:e105:b0:36a:15cb:30bf with SMTP id 5a478bee46e88-36a42345851mr5877157eec.13.1793419077738;
        Fri, 30 Oct 2026 20:57:57 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a5fb97sm13687837eec.23.2026.10.30.20.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 20:57:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 05/10] python3-opentelemetry-sdk: Add missing runtime dependencies
Date: Fri, 30 Oct 2026 20:57:42 -0700
Message-ID: <20261031035748.2130261-5-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261031035748.2130261-1-khem.raj@oss.qualcomm.com>
References: <20261031035748.2130261-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 31 Oct 2026 03:58:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131715
Content-Type: text/plain; charset="utf-8"

From: Khem Raj <raj.khem@gmail.com>

opentelemetry-sdk requires opentelemetry-api, opentelemetry-semantic-conventions
and typing-extensions, without them importing opentelemetry.sdk fails with:

ModuleNotFoundError: No module named 'opentelemetry.semconv'

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../python/python3-opentelemetry-sdk_1.45.2.bb              | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-opentelemetry-sdk_1.45.2.bb b/meta-python/recipes-devtools/python/python3-opentelemetry-sdk_1.45.2.bb
index bba2b8bfe8..2cb352052d 100644
--- a/meta-python/recipes-devtools/python/python3-opentelemetry-sdk_1.45.2.bb
+++ b/meta-python/recipes-devtools/python/python3-opentelemetry-sdk_1.45.2.bb
@@ -7,3 +7,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 SRC_URI[sha256sum] = "7eec4de13dd21ff3a1670dcb0e02079e692736f94d733dfdce5af461d884248d"
 
 inherit pypi python_hatchling
+
+RDEPENDS:${PN} += " \
+    python3-opentelemetry-api \
+    python3-opentelemetry-semantic-conventions \
+    python3-typing-extensions \
+"
