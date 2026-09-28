Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD8FDCA5FA2
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 12:35:41 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.57399.1790598941057684563
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Sep 2026 05:35:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=jRw79ugv;
 spf=pass (domain: konsulko.com, ip: 74.125.225.76, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350f91so1724168f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 05:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1790598939; x=1791203739; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BXWqB2D/SF13qSNJ4Zjp1eyiWLCvhR7iMzWK/CYK88w=;
        b=jRw79ugv1dl4Nio6RHxCtrkHZG+42Re2wQG9n2KCsX0Kvft3Yxx9vvBd+uI400RBLG
         TMJcNrCMd92ylY1bGsNnNbG7KKezn0F1JdSjyuxK10zCBulTY193D9yPhJBl/RgTg/7R
         KwlQOYgQt4ckFpsema//MmGYB4f3SVCaHcKGc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790598939; x=1791203739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BXWqB2D/SF13qSNJ4Zjp1eyiWLCvhR7iMzWK/CYK88w=;
        b=wTh5PUUW8ZaDaDZ/jxB1GHF9dYYBo2QpbVRwLSY1Iem04/H/JzHl+7513IAqqS32eH
         pMJ48Wh0kGqcmBmgwi4BRwY9Q8x2/gXYdm1INWz75aHSeL+ep6eCL6EnUIyPRTnO1ZwD
         3HErz4BRMsZXC4WucaolLst4wVzbxMR3LGxY/UfHU8w1dQS6U9NulKIeCbHdSmlKGmNk
         2bu7QLucfvu5sYiEaSNg97z/K7LDAD+SISrR8bLIDSVF7MzOgqkV4Jh0Sa/55Al1xQyY
         PNLAVkFmhgnGOQe7IBEMWkHZBhQhxX12+pcLIj/A3yukynBMOu2wboOBxC+6wP2NofCt
         8N7Q==
X-Gm-Message-State: AFq9FYJmAnkLQOf0+s8SkjIBmtKEMkBEb7ch9lfFtO+DRubo+5wAIihN
	lZKVPcQVQMVf3SAoAXhb7tl7043JbuJzTybJDbNxefFPlW3x2i/ojLTmDfDzggocrR7teYwvs52
	ywfAx
X-Gm-Gg: AYBFou0m/4RJchAuS5ufOElTnzh7VShoWcF1NwiWI3bIPO4Scbx7JYDSAslVHKHyqXf
	V75pOH7DgWeRUDUcGrVSAKMCMcwPE90Yh484SZz07r97nmea+cb1vxPvOkL++dmzLTsWaTLGgS1
	Fqo9XUVjUwkeD2kx+w1T5a9kn2pLGYJm5KwbREkqcH6G0zE8KMKSQb4/f+x82s8rN57WpFWQNy4
	MbfscgmgeEKeTEtKBpxb5kzHTbU5m9F+WV4jD6FzwJ/YxpuOzLlBv+oz0ltS+MRTbOEx1M8CxXJ
	JfQvKqeHjiZnKVevcsW3gLrRt2xAVZWGJfLmz+bTS122PNgmCWWUXOSDhzm7E+zwcuE19omLzb/
	GkLAIQF389U0kwi6f2vVBRDgTIOtiTjk+sLJC4cXbrToZ54WKpp8g9Ldzy+GOpGt758sdmCfA2x
	lxlvm0WhEPnKIpFF5+54cS7GKOYuiJ4mXDe9ff9jbltMZw62YiPKjDUeXh5L/qhTfh1VsUeQGaT
	3x1OnaYkumdKUjiw9k/nsVqOj+1cuw3G8VW/6bMtnZ8KC5zxODMCrpfm/hRMOjHGm1D3iq+VoKY
	Ff2Ccks0CCAYZEO7rfN9W6w=
X-Received: by 2002:a05:6000:40c6:b0:487:57d:18e4 with SMTP id ffacd0b85a97d-4887db39cc5mr16162743f8f.41.1790598939196;
        Mon, 28 Sep 2026 05:35:39 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a6470b7sm27849770f8f.27.2026.09.28.05.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 05:35:38 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-crc: Upgrade 7.1.0 -> 8.0.0
Date: Mon, 28 Sep 2026 15:35:31 +0300
Message-ID: <20260928123531.187179-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260928123531.187179-1-leon.anavi@konsulko.com>
References: <20260928123531.187179-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 12:35:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130436

Upgrade to release 8.0.0:

- Remove Python 3.8 - 3.10 support
- Fix parameter name in documentation
- Switch from poetry to uv

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-crc_7.1.0.bb => python3-crc_8.0.0.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-crc_7.1.0.bb => python3-crc_8.0.0.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-crc_7.1.0.bb b/meta-python/recipes-devtools/python/python3-crc_8.0.0.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-crc_7.1.0.bb
rename to meta-python/recipes-devtools/python/python3-crc_8.0.0.bb
index d0bd3972b6..ca3f708e81 100644
--- a/meta-python/recipes-devtools/python/python3-crc_7.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-crc_8.0.0.bb
@@ -8,6 +8,6 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f94c07350a9f2e0ce3a246fed3b32353"
 
-SRC_URI[sha256sum] = "99dd540909a37ae4f62c65441df8ecb4e7f9af014fecaf4f331052a41d66c07d"
+SRC_URI[sha256sum] = "e1ef893b042c26c9f47fd32f3c17507b7d1bd81169acebaef908774856fdaa3e"
 
-inherit pypi python_poetry_core
+inherit pypi python_uv_build python_hatchling
-- 
2.47.3


