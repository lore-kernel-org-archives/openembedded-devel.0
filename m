Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94391CCD18B
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 12:59:47 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.7555.1759409984052300254
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Oct 2025 05:59:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TQLmMYgj;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b3c2c748bc8so144047466b.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 05:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759409982; x=1760014782; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HUkEOGks5iPSBDpdArxLf5VuPf+F7gEq7l+dJje0Qn0=;
        b=TQLmMYgjaJzGc7SajwZsXVmoO12WQagJXuC6lgLQZNDXyo1DSBCYOfj/cY49QUaBYf
         WsWL1DNFva+CSx4mUk7hsXIRDjTPvxEJOcw15zYNbQrHFfysf3zhkSt0aO99u4L6vnqH
         o3CNSqA9JINgZDbNUdUC10cvG8PVH36+o4Weo2ebp5KoVB5/B52sKQLRxbcvg9ILlv2k
         KY/wBWCXQTvAeLx5Kt3EM9Rdv07MghyNTuJjXmFGHQQjg3JIZ28/LbfhnDJrqZ3/oO/Z
         hxpwhBIavjacV3PdmjXyEljlxTvKzd4/lnzkX+5tGvtIDVwYBdgGgeyYvRMwAdSaCXTG
         aj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759409982; x=1760014782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HUkEOGks5iPSBDpdArxLf5VuPf+F7gEq7l+dJje0Qn0=;
        b=Ezvsye9/eigT5hgU7GXWKCYo+olH6e4VtmawPV2kRPaKmQnyzotwzoGTmmTrGo+QCA
         VNiJEspoY0X+VWhPBONL98CJeCi9WlOaAkWxxfej1m+bt2tiBBSCl3aZm1uqRicGR6a2
         wKs1X0doTa3OsJMBjJKy1T74lnEog+jBEK/fY23egQ4iev25cS8tWauTGX0MgFB3QHlK
         GnXNd4ghLLsJZAAVhDXuPiu8vSxtJNwFSfCbjLbw9RAa2O5DB3XiKkiI47HJQ1PmbOKh
         8yka0H+kf8RBJrILrD7DmCBKXrVHXPZApRHv00JUrsHDXWbH7uyLN3BOZBIyv4doCR4E
         /kFA==
X-Gm-Message-State: AOJu0YyO+vFwMw6a2Xc52+Kg+Ux/wb48//xKcdyHNKMwIPN3WFJZUZWB
	f7FS8Y3j4KwNk1d4fNhmvZWbOY57E7Z/g5sTN69OHjI+2dZkTItfDFRZvxYdwA==
X-Gm-Gg: ASbGncuFSHpKmkiL2yetYgtnSsGm7t4515NS4mpvzTp+FlbosqgWtmo78mJTavwwjQG
	w2H7vT9sWiaKsXT9n88daUH7xq0x/PzwrDvkEnLVFWtCGBW6aTM5qNoeYufm+jqkV7IUX5z4P+a
	pco49oX2FkdfdzOfCg7iR3HOKBxT8BBT3T3SiXTm4W52tgmRGg+zvWvfWgBY6n2NiVU7L/05Hl/
	7go0csExCg/EpaQtd8nKxV3eGhoaBnSCk/8RM//TCpkz0njsI5gfJ7+29yYZmGMSL5oizY2pa2Z
	Iqo1ksn+oWLBkz2wR+R6tja2E2/x9jHsGmyi1r3cb2GboqO32s3eot5LSX9EN3k5B3XRiq4x67K
	9SJGjvmuqHvwqKDmRRAEbnsChIyHQAw9oMU3l0WIRaSR0hkQmmO7yHkEyUXGjBtm9Ww==
X-Google-Smtp-Source: AGHT+IFwyDDKEOdTnQinI45wEBygVnUjzJ4nbtebh11JbYZOfnz0KN5lpXjKMPZ0rbRo55bRaRkE3w==
X-Received: by 2002:a17:907:3f0b:b0:b3f:f6d:1dae with SMTP id a640c23a62f3a-b46e4b8f4c5mr930862066b.12.1759409982325;
        Thu, 02 Oct 2025 05:59:42 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486a173b03sm194127166b.84.2025.10.02.05.59.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 05:59:41 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH 20/26] python3-pyconnman: Add 'future' runtime dependency
Date: Thu,  2 Oct 2025 14:59:20 +0200
Message-ID: <20251002125926.2624522-21-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251002125926.2624522-1-skandigraun@gmail.com>
References: <20251002125926.2624522-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 12:59:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120188

From: Marcus Flyckt <mafl@kvaser.com>

pyconnman has an install_requires on 'future', but the corresponding
'python3-future' is missing from the recipes RDEPENDS.

Signed-off-by: Marcus Flyckt <mafl@kvaser.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 4ccb2fa47f066077e013befab18b08bd4d1df70e)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../python-pyconnman/python3-pyconnman_0.2.0.bb                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-connectivity/python-pyconnman/python3-pyconnman_0.2.0.bb b/meta-python/recipes-connectivity/python-pyconnman/python3-pyconnman_0.2.0.bb
index 045655caa4..359a2918cf 100644
--- a/meta-python/recipes-connectivity/python-pyconnman/python3-pyconnman_0.2.0.bb
+++ b/meta-python/recipes-connectivity/python-pyconnman/python3-pyconnman_0.2.0.bb
@@ -9,4 +9,4 @@ SRC_URI[sha256sum] = "d3a63a039c82b08a1171b003eafa62c6f128aa4eaa1ce7a55a9401b48f
 
 inherit pypi setuptools3
 
-RDEPENDS:${PN} = "connman python3-dbus python3-pprint"
+RDEPENDS:${PN} = "connman python3-dbus python3-pprint python3-future"

