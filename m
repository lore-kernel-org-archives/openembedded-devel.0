Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28D9EEDB7D4
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 09:19:22 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.77135.1775553557842005531
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Apr 2026 02:19:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=AiZsHXI1;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43d04fc3bf2so2714723f8f.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Apr 2026 02:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775553556; x=1776158356; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JsDRwgDwHD9kqwzdeWK0xCeaciVct2UhyLer/w8+Ffw=;
        b=AiZsHXI1bvu6PerCdt3sXMKMU0mQkYExIjg1+4Hp0gL9tRD9Gn5eQP5scX7xtdzJDK
         4csNCTn47D4OPgg+x/rQrGVe7TGVsmdx2mpvO/BEez2We3KQwhmrL8I7tfRK8+pni5/Y
         5PECFWsGpRtnXosFnOusa66HrDzJQFCpbNDz9EydDs3wLi28j8dkuImBx3rHiDmKMiNw
         mvPfj4DL1tNLDP/Jcdc+Jx0PK/fYoNRDn8n6Q8CafZFfvJ2nGlKCEhErb1IouOPZMZst
         8H8e2eBUB1ZGO1nfkYZCfHcurybp0XG05wc9ErHf8SS9mRLTLfiqXNeuXeO+z6z92p2w
         tJ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775553556; x=1776158356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JsDRwgDwHD9kqwzdeWK0xCeaciVct2UhyLer/w8+Ffw=;
        b=Z2YfoQmqlc/kgt1gxyhAuXxqhDnkY9PoRPRKXbj4b6BlEAwNp++XG8UC/NxdBmnIBe
         TD0ZMZR3z/ZoELxcpUW0ABZUOU31TwmkCRuwZuNeYbRVG9/1hKu55t2CFn4ty4Plp/aM
         thher4TR4FKd10mA8ifMxTHnzpZWe9cvgpohBu1E74oMTQrkvHIfs1Q0er/62miLvPWh
         8zmOmbSn94IUlq0qGgQuMuLDtZFN7hm1bPaESx9JF4tJBPWjhxtjXyYOkt55pbzH4oW1
         vmN0cACJWwUZFXFzCNomKvTOQnYY7Q17Nskwj8/2lJ1JHINk7bnGOhGkeK25SRFzYQOt
         zpZA==
X-Gm-Message-State: AOJu0YzR8qBsoEUQmbfmxdIGcRLPW6SkaMG09E0JxPBsgA6auklR6T3P
	1Bi6V7bwbiM7pUpbKeD1P2S1a3224Zd0hOt/lXb+U/Z59Mciqt2sWBEzz0VqBw==
X-Gm-Gg: AeBDievUh3UZnTAH1733Gj59XOPNlbmfRHHHqJM+QbSkoDqkH6s4hgmZWgU99RzgJly
	ijus5+mMsrw7/zbhZthR1B++7LHdZ60y7GhGMS+cznNYa6ljOWKtd75q0pK/LYPhgDFtP00N8WL
	SQ03aM7S9y+2IpMm3nbqIw/IgGNQInS11irPBcCIUWR061/FHbpp+mpyvZ45eqACcQZi7tOeirZ
	NnwXy8oIpFfo5ZucOfqVQWuwLYPhJ+7ueA7c1Ol9yhIlCgrSZBBqnxEyB3MgPsKn8r7e9Byxee1
	nHn5sDnY/FPpx4IOSdaVsEyfdIexQrPqSwZ2F6PA2a8vKKZlsKJirNovUF6ruq570tnd8pHNPNY
	Ps1u59IvMTOGqueFGGGBtJJmsEf1eaxOUVHkMHCrpR70nRDV2ZHHSsmxIXESIdWvYEHWCmUjNnT
	hNTZeedOorm0xyjR6iZDD2
X-Received: by 2002:a05:6000:2dc1:b0:439:c279:32df with SMTP id ffacd0b85a97d-43d292e1f30mr23503495f8f.35.1775553556067;
        Tue, 07 Apr 2026 02:19:16 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a720dsm48749374f8f.4.2026.04.07.02.19.15
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 02:19:15 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 3/3] nodejs: ignore fixed CVEs
Date: Tue,  7 Apr 2026 11:19:13 +0200
Message-ID: <20260407091913.3963112-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260407091913.3963112-1-skandigraun@gmail.com>
References: <20260407091913.3963112-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Apr 2026 09:19:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126080

All these CVEs are fixed in v22.22.2[1], except for CVE-2026-21712,
which does not affect v22 series, because it was introduced in a
later version[2]. All these CVEs are tracked without version info
by NVD at the time of creating this patch.

[1]: https://github.com/nodejs/node/blob/v22.x/doc/changelogs/CHANGELOG_V22.md
[2]: https://nodejs.org/en/blog/vulnerability/march-2026-security-releases

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_22.22.2.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.22.2.bb b/meta-oe/recipes-devtools/nodejs/nodejs_22.22.2.bb
index 2fad3f362d..c64cc5b7c2 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_22.22.2.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.22.2.bb
@@ -217,3 +217,10 @@ python __anonymous () {
 }
 
 BBCLASSEXTEND = "native"
+
+CVE_STATUS[CVE-2026-21712] = "cpe-incorrect: only v24 and v25 are affected"
+CVE_STATUS[CVE-2026-21713] = "fixed-version: fixed since v22.22.2"
+CVE_STATUS[CVE-2026-21714] = "fixed-version: fixed since v22.22.2"
+CVE_STATUS[CVE-2026-21715] = "fixed-version: fixed since v22.22.2"
+CVE_STATUS[CVE-2026-21716] = "fixed-version: fixed since v22.22.2"
+CVE_STATUS[CVE-2026-21717] = "fixed-version: fixed since v22.22.2"

