Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E511C79F89
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 10:23:38 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31904.1788776613550593010
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Sep 2026 03:23:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RICQ+ZZ9;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so3897468a91.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 03:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788776613; x=1789381413; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8JqrXwl6h7QGB2BknWQ/LStccuFo0ZPROXJlx78y80U=;
        b=RICQ+ZZ9RHWfxV+EXgC4+p8IeT5zEtuSeYfsK6pRuZxahkLlJOwxgbf5qBiObR4mZD
         wwScZHHVm0CMwKPSZ5+5NfSP6k2YdD0B4UvfkqEnJwZanMAVshLKpHz/UZgi5S04AO6z
         Nq04BWeajc3+KOBapyF0dI/xcR5I9Mx7NCImL5KfbHRDYVEiVFhLqWjxeSc9fR/SMoRs
         jw2i6w2zPY8HABu7umO7idS7YkAMUapfiublkKqvg393E23nHFB8pbgov0DtLMZ1CnTG
         0/8XrnDz6eVmHhD6Sn5AU3GBAh+SKXd0q6na3x9drLYsqO/W3Ez0RqM8H5qT/9KFl9Y8
         7MCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788776613; x=1789381413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8JqrXwl6h7QGB2BknWQ/LStccuFo0ZPROXJlx78y80U=;
        b=GJf3uTYlfJ0LY3/9qp0p/ED1RgJ5EBJo+nSIVUyLnCZAOzTLgPdJoDGePJvK+9BdYl
         XStvCY7eB+J8sfADO5GDsM6o/vObzyWEnI0lFzLMGz4enAUEAoZfE6G0hOVJd9x4vNOk
         qVOCWLUffbOT8DqxG/UDyy1ZzU7/CKp1BUd86hltby2Nbj4KmXhrFMW0rvhHHS7HuwfV
         tKU+QMgrDYjRy7dafXey+jGzKw9IFu3LoUpvm085YVPVN/VGcob+e5gOfj+fu0xzlUhx
         HdmF/NSm36vJFy394uqRsZS0yRxSIhTkepRdRHVVz3DYLwr3QFsht3WD7M2TgA+4eAPT
         5E9g==
X-Gm-Message-State: AFuF++m40aexTOlhGQOZ/VBvyAXclPgZzUSZwAWqtYgnW+6rO6r1OaaR
	Zvg1mNrOeB1VB/pyimfDllCvDpvokLHZzhcW0B2S6pqg6VfnZMEEcfn6n9ACXQ==
X-Gm-Gg: AYBFou1GAH6KAf5NfvD7y0uay5Gew8oeF+7tevSzzYyimP0ibDba6y0Y6O2H6LaOChK
	xW4rpTivyThjTILpBS0DO2K9kYJ2nqF8TxdnOgO/DpB66xW3zaiy/p6tPr4clOcon6G4aiLvvh4
	qSYsPXbAtURipdg0zA8hZSJO9/wm0EKKgrn0ljT/IFv9ZVmv+OBJ9W25/7FhAz7HKc3J57OwsX2
	bcTuBwbD7HcurEnfBVYhJf4A7G8VdqPJaKJJSypTQSPZO66ELut91j9bAJYeWYJsNe9uQRHQdtN
	9F6f2yq7tiAzEqPsc/ZM8/zngAtD+dYmxREonIbBFzY58yHtLCRBVvQ27T5uQqqWqwAV6CLjLPo
	moGQnvIYCgUWcGcZmJZ5BFw9LNN272+BXbBSF9IsaNkh0QcSrisx7P5lWKandnWM5Nb6C50w5Bv
	PIL8xT3a0KspHJfrX5hl1a2U0Tye5VexJlIiTsO7y1uqPwup10t+ppwgP31U2xXXvsMsNK1n0g
X-Received: by 2002:a17:90b:2ccb:b0:398:9be8:ea64 with SMTP id 98e67ed59e1d1-39b261d8533mr39005572a91.17.1788776612857;
        Mon, 07 Sep 2026 03:23:32 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432441f5f2sm30215104c88.15.2026.09.07.03.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:23:32 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 3/33] libssh: ignore CVE-2025-14821
Date: Mon,  7 Sep 2026 22:22:47 +1200
Message-ID: <20260907102318.2459883-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907102318.2459883-1-ankur.tyagi85@gmail.com>
References: <20260907102318.2459883-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 10:23:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129815

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2025-14821

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-support/libssh/libssh_0.11.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/libssh/libssh_0.11.5.bb b/meta-oe/recipes-support/libssh/libssh_0.11.5.bb
index c28a417244..612cfdbb19 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.11.5.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.11.5.bb
@@ -47,3 +47,5 @@ do_install_ptest () {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+CVE_STATUS[CVE-2025-14821] = "not-applicable-platform: issue only applies on Windows"

