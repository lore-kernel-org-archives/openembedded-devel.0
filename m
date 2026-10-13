Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29FF2CC6B0A
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 04:40:31 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.361.1791866423303955510
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2026 21:40:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=XamD41lh;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ab4178ee33so1242590a91.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 21:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791866422; x=1792471222; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bEDQS+kx9VMgq5JbOjminOwY+7UtO3rsA4XnZSG/ZsI=;
        b=XamD41lh9h2vJfomMpBeBKtUFSYlUEoliAvUaGxItuZR9tWjVZHQSBG2yyei6CcyVb
         LHf/WHNSLdGnsfEOEv8WfpOg9ZycQyZKlgluGISHfeQZdfdcGnh6w9MrTHgA485KwppA
         eutyOZ9bHHuSSQVrRYwz/pLAnxJK2NsBawOPp72Szihuy4h4LfvI5NmuxP7xgsa3HpcW
         PBmDQPmcO1ihCDGnjrm+7GQt5RLzTVIESHtewyIkj+WgEuF4XqlBOXoC1h+5/Df7OZsz
         T1Rc5Lhw58VYf5npb0u9AxmFF+i/ymShAKbaNwU/vJEypsoKx9QI0fjZYKWAH+lRoF5D
         wxmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791866422; x=1792471222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bEDQS+kx9VMgq5JbOjminOwY+7UtO3rsA4XnZSG/ZsI=;
        b=Auu0ve7N0msiH37BReoJWyesVxO4CEAhuBaYdESyv7QIWWdgjTXitli16QaLw9YI2W
         6SqN3DzErFx2wVnU5uNJrhFZEfQ9GVAgk0WJDm6iP/wcWWN7uAWaeSJmqDeUVKUlhV+o
         SicH68wTQhC58rIWgrutjySkX2AvQ6hDSPgRXxPMtJ0KHWqrQKz8yfwo9MyeDgdnMKAp
         HoT5VMAKWWJ0zqUxlF4w6OxrLPsMNbnsBVWpnzo+GoexeV9h3YhIPiuNoC3XOopc9Rcl
         pyYV+tuTLQvjt2U9oBGu7X6eQWVuO2WoyefvUgaYXqZLMKXtW7Y9jq3v+sx6lnH96Tiu
         +1vg==
X-Gm-Message-State: AFq9FYLV1HSA8qZyR3iz4NEa5f4MTiTlpq18TDeM8kOV5b01ZHyCtzSb
	SvLwEs9jf/YxvI8oAN3OGWwkXW4hgDQgOOUKe7Z8VF2Fr4b5GuFEwpixkRYPyg==
X-Gm-Gg: AYBFou0D7F4qz0p70HlFWSkk7EZjtmOLknUtoXiDwQm/4Klea7zrdwM0p1wj9dfCITg
	KirjM1Qdw3MTpcPHe8CJC+GFAnKSNdJUFMqZjPf0uLou4dH0opGQ9jy2wXu6TpVhSIppDLhwaZQ
	XuQgYZJs4RrMB5D7ZP3XUE1ZdVnLohQZUkN+8+nE4v6R8x8uaPtECoKHXVXpSRfLM05Pu93WkxQ
	tpzOdr3I4gNEM2OBrSqIZrmio4Lj0jBO3+k0KhCR2B7VuIYzLbgj36Lzf1qecckJKCc7uy7kiSE
	FsSsE8C8mjz7dfyvmddhknJcMspniG+q6tmhF6Azx0FFfRKHGmX/LZio+UE6RAKo/Fsav8ZrrbE
	RySks+ZpwEoKFCS6kpi4PF6yOP3I+XBAWluFpVAn9JERDsdixVMBnGUpbBlGN3SbFdQJRWc2yrE
	0VPsZka1LqB+tVjljIWMUt+Hdu03eQJnc+vnm+PfVXXbjcE1aMZwenqJrYH6zd44u9b6SIvBCXs
	sZzGT8EA3X4h/KN9W7eMAPRWs6TJ+ZI6diszzQ=
X-Received: by 2002:a17:90b:314e:b0:3a4:cb6d:aca9 with SMTP id 98e67ed59e1d1-3ab3acdda28mr8508070a91.64.1791866422536;
        Mon, 12 Oct 2026 21:40:22 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3386ba90sm11672757a91.1.2026.10.12.21.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 21:40:22 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-python][PATCH 2/16] python3-eventlet: mark CVE-2023-29483 fixed
Date: Tue, 13 Oct 2026 17:39:52 +1300
Message-ID: <20261013044006.834868-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013044006.834868-1-ankur.tyagi85@gmail.com>
References: <20261013044006.834868-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2026 04:40:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130816

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Fix[1] for the CVE is part of the upstream version.

Details:
https://nvd.nist.gov/vuln/detail/cve-2023-29483

[1]https://github.com/eventlet/eventlet/commit/51e3c4928d4938beb576eff34f3bf97e6e64e6b4

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit 47b2ce9cc77297c740ecf50d00d6956f5a867144)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-python/recipes-devtools/python/python3-eventlet_0.41.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-eventlet_0.41.2.bb b/meta-python/recipes-devtools/python/python3-eventlet_0.41.2.bb
index 3292950e2c..67a69b1478 100644
--- a/meta-python/recipes-devtools/python/python3-eventlet_0.41.2.bb
+++ b/meta-python/recipes-devtools/python/python3-eventlet_0.41.2.bb
@@ -17,3 +17,5 @@ RDEPENDS:${PN} += " \
 	python3-dnspython \
 	python3-greenlet \
 "
+
+CVE_STATUS[CVE-2023-29483] = "fixed-version: fixed since v0.35.2"

