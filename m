Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C97DC624D6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 10:05:36 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9338.1788343531796709003
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2026 03:05:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=WMaGdqjX;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d942c7cc2fso6834395ad.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 03:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788343531; x=1788948331; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8PRjE9P1KqSmH0O/CTCwAM6Ze80jNcv1SlYbDteEtbs=;
        b=WMaGdqjXbul+SZ4db0/5/X7AIyC5bEUCQbG6B/lvgb5bxyCSjXryARgHIjN1NuMy2n
         nHE62iFRi9AWUbWWwOCzI8ansSLyH1T/n6YaZ2J7Up9JgAg33W/dWkgFaWuKBlksV8go
         6nmWoke/ERHrpkQCrnZ3MZqEKdGQaKxGheY1N6kBNt5fgVggFdjo/9UQDOQ+o0UWavtZ
         BumEqJrgdVFV1IHvKrkR/QvDZ+le6CQs8W/lvtj3cjPAK4sitqGWo5Sw3C+WfWs01RYx
         fnas+O+AclmzkvVbuLtR8FByok0Q/HEwa8DnxHDR5Myl49bWMQJ2JtRHNt/QHw4WfIaW
         j9gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788343531; x=1788948331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8PRjE9P1KqSmH0O/CTCwAM6Ze80jNcv1SlYbDteEtbs=;
        b=mwMZtJbbTgB8UukOivqpz2v3RoVY8NIPdqxSAoQWc/4E8Va9HT1m1njRTRgh4I3lvf
         SJIhmLG7stC2iKoUrs40kFBS7n2k8/WBb3vOgJG/6nJYIAPxXWFLRsjntxwK1IxfhRxq
         SgUuL9556C4bxh8sa6dN16tL9pipnzsM+x2dkK8Shk6jZUR3TQHgAlHhVsW/SoIxr3Jr
         aKzvAakzJlPs3HeY7kkPyLGjgUhlk/1UwsB2fb3r6fcPDIBVrprmOY3RShCTGKrtfUMq
         96LaOJA432Q3g5JtI9VDc2me0MpkIligLa8g5A0sBJS8yq9hQD+YqF8ayS3kpFAlUBGh
         WJlA==
X-Gm-Message-State: AFuF++nClkoLR64ZRQtt5zMdO0PVEL9LTQpVdyYJ9Wfi2SgxN24xwVJ/
	BgOBkTDK6KHXPr16LtHE0MtndzxRzurgPjkAAbzVrTTGZHIrq9wUXyxkN4HlAGCK
X-Gm-Gg: AYBFou2muMQQXlhULMqTFPg31rZtC+La9fSfe6VzwFIXCTb8FXr5lBPwmB/Mq0mfQSB
	ZO6+OibAcR2v7J3M56dH96RLlqMISl+nBozQJAQFrQJnOt3labVFJLDi6ecvsBkwkwdH+sHXsLB
	EoptuZJagKBLrAFink80vKLXdoYgmTx1Eh3iu+inQjheLPXzduEbVVz0Hu7d8xz8W1wm3EzQ5N9
	0XyQ4Qjd2mhDRqfQbUhLkgIrCl5AKCkks5Qo6faZDBArsIKJKnE0bwQp6A2QAnH9tXP4OyAT0i6
	GFQKDFyu4W1tzVq6eY/2xDnIuwa+2ePjdVFdCoMcC9zmiRC8SpyAeYiTsxUddiIdTD2gzH55zIn
	1u1c3EzzL+FGA5bAXap7fZV/oOtTlr7zcVnWiwoVdLrVjhHj6VYjUixLkWWwPdaJB9/TufdAv+C
	XUhqGEaRaGlkxHdPnGHvJJJ9znOlrX8sxyhBWJ8iday6IwmszwyLKIriYMtKvHKSNKYowIG0Rq
X-Received: by 2002:a17:90a:d44e:b0:398:ceed:6d44 with SMTP id 98e67ed59e1d1-39aee1bdb29mr5640181a91.25.1788343530922;
        Wed, 02 Sep 2026 03:05:30 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990bd1dcfbsm10766784a91.2.2026.09.02.03.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:05:30 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 5/28] capnproto: ignore CVE-2026-59704
Date: Wed,  2 Sep 2026 22:04:47 +1200
Message-ID: <20260902100511.2105916-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902100511.2105916-1-ankur.tyagi85@gmail.com>
References: <20260902100511.2105916-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 10:05:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129636

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-59704

Fixes:
WARNING: capnproto-1.4.0-r0 do_sbom_cve_check_recipe: capnproto-1.4.0: Found unpatched CVEs: CVE-2026-59704

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-devtools/capnproto/capnproto_1.4.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/capnproto/capnproto_1.4.0.bb b/meta-oe/recipes-devtools/capnproto/capnproto_1.4.0.bb
index 948ff80345..a42131b6e2 100644
--- a/meta-oe/recipes-devtools/capnproto/capnproto_1.4.0.bb
+++ b/meta-oe/recipes-devtools/capnproto/capnproto_1.4.0.bb
@@ -32,3 +32,4 @@ BBCLASSEXTEND = "native nativesdk"
 
 CVE_STATUS[CVE-2026-32239] = "fixed-version: fixed in 1.4.0"
 CVE_STATUS[CVE-2026-32240] = "fixed-version: fixed in 1.4.0"
+CVE_STATUS[CVE-2026-59704] = "cpe-incorrect: the vulnerability is in Cap, which is a different project"

