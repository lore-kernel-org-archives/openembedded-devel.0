Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04C6FCC6B09
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 04:40:31 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.363.1791866428172927929
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2026 21:40:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=mhZke6jf;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cd5d2dafeccso893523a12.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 21:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791866427; x=1792471227; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aCNrHROzSGrBwyuBelOAqyHW2e2UcD7LzYWMrr5DFYU=;
        b=mhZke6jfW56e8OErsmR/EO246g8xi3CIIn3fXXX/eGWXsxwa6Oz5V3LQL0RgcPWAu/
         qKlUZTJiXcxVeVurkGCXVqZ82tw4qLVbpzAF/VPqixzd0Z+1LfR6+9ctFGhQIXzBessV
         UCU+lviigjEGdQy83YwTqAw58hT2Jlw85yprNAFaJ5TKM7/kUIbeoSnAJOkG0cn2cA8g
         0eji3e22ywecnysXH/8MtJtS84pAR1tHmprDG4WYK9KoulRGu5cG4xiAUv3spHn3uDBb
         lAjpRZDPdW9vb4mJZMH3M6J4pH59whgwINolagj62EnuL5wJkYTxvk6pbW62eEm+lItv
         n6TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791866427; x=1792471227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aCNrHROzSGrBwyuBelOAqyHW2e2UcD7LzYWMrr5DFYU=;
        b=Yxfxs6rYiFj2sOvpVK4hjpTDBhs5b9Xdb4GnYqnGdzeExcYgyBMi/iYP5S+J1n11yQ
         sZXBVN/n2Fq5f/St72MkNFCx9zZc91pqHrCv7aFOPt2E/o8ds/p0SpMVT5RSfUF/INFH
         bcbqAFcGfLmJnZg5Oc1wOtOediJm3aV4DF0SWTItkTiD12OYk5kA+T7mGOK4ajgQmkJh
         UFJO97XxlEThFRO9Q2nGG2d17ptz33pPc/tJIy6xpwfexC28vZPzlYybhTIzGAmHxgFo
         pvon8eJIR8ymWOYWNUTDwNJ0MVfdwI6GtDh7EtcwFo8EzU3p/BaLuBxYakFzuHAzZuq4
         0MGQ==
X-Gm-Message-State: AFq9FYJ24VMUNX4jOYaUD2ROukbDAvul4r3d+vN+ClQs7z2XqmwJug47
	UxaeBug00AwmBDa6ED5Vdb2jRWjs+NC478jNyYWOgQMbgV8bAelGvv1k5CZJTg==
X-Gm-Gg: AYBFou2E5cZS7m1rTev5L0o4AH4Dg9oNNS+OH+dzmbq8BRBr3zTUvSsxjck7PNBWqzK
	C8q2bHIR77oscMo2X/VLwEUHAyPGWV8m1uP254HdsV0HPpVDqsc7PPbEk/vYjrfva3rgDBf/fcC
	LW1ruWRoHU2QiYqjWq6XCqW/owqs0AHSke+nFGMPvHoXteE4jdfnQEZKUQz3BjKNe2IzJIgsat+
	/4VUqK4OiEhX87WDaO2Ti2gMuX5tzHV1HtLFGiKnwFhFQvyAQ1h1zUhr9wQ12kq97+8jOlFNhxv
	aMiXaPBmfiQMt8iPO0Y7nC3/Mw/FDtwMx32aPZJesnsHfFavMx7ZRBDFkXLOx+qnld7fxZsolrc
	7amjVSIpnxsK4StiXLZ/p3oN5HhZTnnUChunnVnmq39+tX6aGtaPgzn4ho450rj2H3ztGPwRVxO
	KnD5dTVjdSeI2qex6DkrQxssoiG8Av6jk/yT1mZyE2qCYk6XFx3NpZE7M4PZ7lH8rqm8Ur/lUdU
	xw0CHdGDU5nWo8N5rU2UbFGNWlQbkFjzpxcv6Oy895xfQzfuQ==
X-Received: by 2002:a17:90b:48c7:b0:3a4:adf9:5d38 with SMTP id 98e67ed59e1d1-3ab3a3596c5mr8850758a91.4.1791866427500;
        Mon, 12 Oct 2026 21:40:27 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3386ba90sm11672757a91.1.2026.10.12.21.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 21:40:27 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 4/16] smarty: mark CVE-2026-82531 patched
Date: Tue, 13 Oct 2026 17:39:54 +1300
Message-ID: <20261013044006.834868-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013044006.834868-1-ankur.tyagi85@gmail.com>
References: <20261013044006.834868-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2026 04:40:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130818

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-82531

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-support/smarty/smarty_5.8.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/smarty/smarty_5.8.5.bb b/meta-oe/recipes-support/smarty/smarty_5.8.5.bb
index 83f428d388..c700ed5d93 100644
--- a/meta-oe/recipes-support/smarty/smarty_5.8.5.bb
+++ b/meta-oe/recipes-support/smarty/smarty_5.8.5.bb
@@ -35,3 +35,4 @@ FILES:${PN} += "${datadir}/php/smarty3/"
 RDEPENDS:${PN} = "php"
 
 CVE_PRODUCT = "smarty:smarty smarty-php:smarty"
+CVE_STATUS[CVE-2026-82531] = "fixed-version: fixed in v5.8.5"

