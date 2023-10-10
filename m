Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06B94CD6134
	for <webhook@archiver.kernel.org>; Tue, 10 Oct 2023 09:39:57 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.87407.1696930791248458593
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Oct 2023 02:39:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=NOWVZmn6;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3247cefa13aso4973852f8f.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Oct 2023 02:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1696930789; x=1697535589; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+BwGQ1z2n3nwBMpJqB+1/4qt3hUDRurm9i7rvXzuzDY=;
        b=NOWVZmn6CJbg9kMBUbXXoHFRM//Syh1TV0e862c8RObTtSh44sydqmG6eOpmDDwozn
         BLJ/1PtQUF5UCGbuu3lqkBKyuHCjglieA9gJ5jGCTfdIHEPVCjGm+mnzjIWcAmJBfuh/
         sPuWlo4t2onWLm8wb5QURbvFijxWR970N9EUpdTnLTnYB+ZnQadLzyhqDluSlJgq/YdI
         pzsSPpnxgp5vR6PcDlEXJ7fswshX/JALI6TaIgS8Y3Cp0TTkPixQ2PgxNPsl1bRt1efB
         cPa+FH5URhBD1RWjEnlQkhcHheYLXt43EpdpqSvLKTuc6xCvNsXRf4c9/tyGg7WWrUek
         nreA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696930789; x=1697535589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+BwGQ1z2n3nwBMpJqB+1/4qt3hUDRurm9i7rvXzuzDY=;
        b=KicH+VifudUs51pCT3tkRwm7e2ptneEIv6eB74oQk9ocUOQWRpVO3IXkAwK64jJMqI
         DQ6OtvVbeFexbR1iuiT7x805ybdkNHQx4b3Q8mRaoGdkUZfr0PnRG2mK1xCEHQY8lq79
         1CHaTN7PPiNhKWwQxvKI+mziQtk9zaWNXwcJ9h0xAWV0dpXHLFj4rRMzN5FMkjtSdVKb
         43953dCVwO4uJsxhzOlRz1AYOlMa/D6gjKyRviO4HtXpF/IfLnm0pUiApjil9hFvT/hh
         nQr2ZCssjhaYTjwfz7wRvnT2B/PtC9Jlod6z32w07bF+JskOaCjHrnEShAkMw+cDMmSm
         qsMg==
X-Gm-Message-State: AOJu0YxGUtyA1PnCndyCMOFR6N3HKJvb7pRTJB5XR3ZJBnvi72Ww2eUZ
	mQjRiNLpH2vjWja5YGa1z/DlNY+JC91w8960LwI=
X-Google-Smtp-Source: AGHT+IEBdrNjHytSxTPLfuuPeQuaPfB63dbtT2/1zeufcZLrfg1Rkw1zB6rIEvup3Y4wBiKUtt7r0g==
X-Received: by 2002:a5d:4cc3:0:b0:31f:f8c1:f43c with SMTP id c3-20020a5d4cc3000000b0031ff8c1f43cmr14877333wrt.41.1696930789496;
        Tue, 10 Oct 2023 02:39:49 -0700 (PDT)
Received: from p-nan-fatho.home (2a01cb0584747e00ad7461ecf2f04d44.ipv6.abo.wanadoo.fr. [2a01:cb05:8474:7e00:ad74:61ec:f2f0:4d44])
        by smtp.gmail.com with ESMTPSA id p4-20020a5d68c4000000b003232f167df5sm12150639wrw.108.2023.10.10.02.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 02:39:49 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Fabien Thomas <fabien.thomas@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-multimedia][PATCH 3/7] Add static-passwd and static-group files
Date: Tue, 10 Oct 2023 11:39:36 +0200
Message-Id: <20231010093940.75037-3-fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231010093940.75037-1-fabien.thomas@smile.fr>
References: <20231010093940.75037-1-fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Oct 2023 09:39:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105399

In order to pass reproducible tests, recipes that use the
useradd class must have static ids configured.

Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-multimedia/files/static-group-meta-multimedia  | 2 ++
 meta-multimedia/files/static-passwd-meta-multimedia | 2 ++
 2 files changed, 4 insertions(+)
 create mode 100644 meta-multimedia/files/static-group-meta-multimedia
 create mode 100644 meta-multimedia/files/static-passwd-meta-multimedia

diff --git a/meta-multimedia/files/static-group-meta-multimedia b/meta-multimedia/files/static-group-meta-multimedia
new file mode 100644
index 000000000..c76233171
--- /dev/null
+++ b/meta-multimedia/files/static-group-meta-multimedia
@@ -0,0 +1,2 @@
+pipewire:x:660:
+mpd:x:665:
\ No newline at end of file
diff --git a/meta-multimedia/files/static-passwd-meta-multimedia b/meta-multimedia/files/static-passwd-meta-multimedia
new file mode 100644
index 000000000..94e1310ea
--- /dev/null
+++ b/meta-multimedia/files/static-passwd-meta-multimedia
@@ -0,0 +1,2 @@
+pipewire:x:660:660::/:/bin/nologin
+mpd:x:665:665::/:/bin/nologin
\ No newline at end of file
-- 
2.34.1


