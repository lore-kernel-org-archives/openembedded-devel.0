Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D1E4C79F9E
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 10:23:59 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31690.1788776633233875255
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Sep 2026 03:23:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=LyDJaOcU;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38511175ad3so2907412a91.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 03:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788776633; x=1789381433; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+1eY65BRFL/typ0boe1+sGWzXboUGH5kFbraUQfqnfM=;
        b=LyDJaOcUfxHttWNQfAWYzfnNOoeqVW1VG6KxM5r5ankloMLrMDJwtTFrLA+Bxpefly
         yF+heyEgl+ZT7Ewd6IuhlYIujlWlNFtrIIFdfG3I2IwzOgrIqNTcBV6zAMdX8PRv+bLV
         OzSzXnVkNcp/efAe2NB21Rc/W+/NDA9z1oLzclltDEYTy5EGJSAZ+2KrxVUfZDLYJ6HN
         VE9Z6Xf7trNWsuc1sp16AzFVL4ZM0CZbOCQylTqv+cm6Ok4hRIG0zjXzVgB0VUGrTXNj
         8jBTOEbNsNiWlYRSF2f0PJPRU+hOADiYdq5xSPAoo9pIh16Og34jgJh4BETNXiRk1qSN
         deYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788776633; x=1789381433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+1eY65BRFL/typ0boe1+sGWzXboUGH5kFbraUQfqnfM=;
        b=qa2Ttc8yNmUQP44Sew+j1axb5lpVP1iBJnPRYyszQZ8vph6tK1WCVzwYc0/XDV4qgq
         28VzjgldcVXV1s/OvcI9YG6eTcIiZjksomG441qLX9s5GXK/3faHcDr8bT6EYAcM8A4b
         gh3AvFgMcPhKiJXg/yX4x7gGTcPLE+kJ9iAJ5NTc9ET5/QBERqHjnAcC7HmSVzwrtm0h
         EsFv9Xsmkw+SLRMH6qUinzaO9tCbqRBzU/oj9/VCe7tdkFOZKdqKdrUCYgNq32SQ2hRM
         mUcRT190v/ej93zmrWOFhBaaMb8mTbu7aOg0RFjLRT9fKonLtuW/NmYucYdDlH9z2uQE
         JCVg==
X-Gm-Message-State: AFuF++li3B3nYQyVJ1wd++gCTzfE8RRiO7GwSzj7ES/GbTyCxb15M6OG
	wJs3uKd04PJt6ODk6pdYX9rrUDa+Rsbb5xtxZi5iuTRPMSARSf6LnXyTrPaTTUao
X-Gm-Gg: AYBFou1CBDV3BaZJL2LAzJTQ7Q+YPkYafYLqXRCGZqvtzIOmq/mbpxQ4YhYYJ3lijQo
	J0y223DW4sLIWGxPqb49F+gO66GlvW7JCwShoixMmwzDaaZ5wVmsMM4VFMGiWt2Lb1EbMNCyJ80
	mLm/67U1Vct8Fce2n0dS0OYxQQ3Fl3tRb2RxzDOnxCHlGnNCXngMtkerPOEJ3JCAB1B6W5bCYzq
	5rMiUoJrKT5ffDj9WyHCT+dAF92/sK0oDzKZbdI5AXh765R2u7xt4IstMEneU6EbTkzKxR3pwsK
	SWjcOGaCFrcU6NqzQvenc08xaHMMucDztXjkLFafg7JJ/dbpbCBnwxaxpEve4NXC4nEGbQg5X/p
	vDDkxq3ECV6fpDq+SIpKnGkLi42yPF7q4eV2MyPuS9LBEkZuW0uroSWRYuyXMu5ZByBqbXpbCOt
	Igajz6Ra6wu91h7lWq3KTxgOTuaklTVXUmeWXF65POaSdzIeV6cYOwpaIK5FtCV/5C3/nlN4wT
X-Received: by 2002:a17:90a:e703:b0:398:e969:87ef with SMTP id 98e67ed59e1d1-39b2629926dmr34456609a91.24.1788776632544;
        Mon, 07 Sep 2026 03:23:52 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432441f5f2sm30215104c88.15.2026.09.07.03.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:23:52 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 10/33] valkey: mark CVE-2026-56684 and CVE-2026-63639 patched
Date: Mon,  7 Sep 2026 22:22:54 +1200
Message-ID: <20260907102318.2459883-10-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907102318.2459883-1-ankur.tyagi85@gmail.com>
References: <20260907102318.2459883-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 10:23:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129822

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Also mentioned in the release notes[1]

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-56684
https://nvd.nist.gov/vuln/detail/cve-2026-63639

[1]https://github.com/valkey-io/valkey/releases/tag/9.0.5

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-extended/valkey/valkey_9.0.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/valkey/valkey_9.0.5.bb b/meta-oe/recipes-extended/valkey/valkey_9.0.5.bb
index d57aa6e1b4..d7ce19ce72 100644
--- a/meta-oe/recipes-extended/valkey/valkey_9.0.5.bb
+++ b/meta-oe/recipes-extended/valkey/valkey_9.0.5.bb
@@ -74,3 +74,5 @@ INITSCRIPT_PARAMS = "defaults 87"
 SYSTEMD_SERVICE:${PN} = "valkey.service"
 
 CVE_STATUS[CVE-2022-3734] = "not-applicable-platform: CVE only applies for Windows."
+CVE_STATUS[CVE-2026-56684] = "fixed-version: fixed in v9.0.5"
+CVE_STATUS[CVE-2026-63639] = "fixed-version: fixed in v9.0.5"

