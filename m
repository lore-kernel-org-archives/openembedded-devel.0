Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE9F1CC6B3B
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:43:16 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33234.1792042996030510887
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:43:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Hf76oorp;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e8f2c3ad6bso20398935ad.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792042995; x=1792647795; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gUy+ok7KmUVPajobsErk65d1AHsPoAPoiGYJeLt3G7E=;
        b=Hf76oorpzp/Elz2zpm16W7hfaupJ8+ynDy+h9Hyedm5p2j3Faae+tcRlFrxP9cO4e8
         1UirICOocEqcKJLSF+adXjQ9Qe/MFePtJf8ULyA+h2sUS/N44KHhbmg233q4U8fc0mmt
         Pi+kphWBulao8YHNlpAs5p7HZj4NoMNWjb3Dw6GbzqEZCDdkSuy/e5AkyDIQpfwg/9mV
         sytdk5XiB7wGz8NuEFXtWD6PfWHJAlMQzyJTTGo64d6yx3koDxWWv/1UTToHhX4Pcnv0
         weefbtCkMt8fnZ29Mb/41SwAN6GeTznD4gGOICC/KPWleD+7gLFVVv025sovBniFkYc1
         7jOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792042995; x=1792647795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gUy+ok7KmUVPajobsErk65d1AHsPoAPoiGYJeLt3G7E=;
        b=jfYvpRiTiH3SyR3N2EqUlicaH1G9G/+H8dbiSWzM0zhuXyy3FXrtWJCcLIX9wZf9Ei
         ClEVQQ7DlCkfRrn+hUhEsy+UHb7OwFsdeqXzRqJleuEGDBzeXDvtfTSMG/Y1/UZeERiw
         UgYIaCu9Yx3ZTuM6ffBQgScCQ0eqwI3AK/zEpZkdR3SwvzdCTZyPYY/WJEeF/ykbuFEk
         jroeKp+ksmX5NCVw6AfnOeqkpmUBRaxUj9troZcWg31SNvWDEPc+q3sIvOBdi0jD1HDX
         XraZhWPLZa7BhTbJHMRdnwACRNMx5MNgT5fEl1Bqjg8bCg5kEYd4VdV0kIUk63fWYGbZ
         qzkQ==
X-Gm-Message-State: AFq9FYLPb/KDRcqJCzreLCZ8y7oXkjgeJ4fWUYFTSomSJOYlf6r59/Xt
	UYqPC7H9J5lvno/uIWKPdvAVtl/pIv/7tfrnqBWsYhwpWOw6FyFLHxu1H1D1kg==
X-Gm-Gg: AYBFou0nVb9OnToET1xGPyQZu9357cJQpnQalufxTBii8Sz94CicUfp0h4rSUnP7QiV
	0gnhVvIlaLclPpt/f/+tNMfOdBOS89b5NjrzQ2VW9dr+UOKyz1xAwk9rBIypV8opKW0q26ZY+MW
	AKMKXrXgoU6F46VyTQ48lJzDp/YhgrE3+xXWbQu0Uilp5cbRIsQuIQHPsic2xSJ9WV4QBq6f2bK
	TFEMDWTKFfveqFOEu8260fyV5cHJgkzO9REwE8ZwpC8R74TcsKqE4az5NfOdENHWZubrHRiIqSD
	sqeeM7G5ecmd+D3LkkRvFu7vNZYBujsizF6Fn7vY6klz+TeLbnxqHncPFkmE6oOSAqh5mzq3hpz
	tPOr3/8schIizEQ9lnEH7DOwLZaNaoLIu3TQegyUsijj9b+jJXLr7+YbAtXArtMPxdFjWqeHB6a
	A4w5k00KoVJfWVhCgyPhfyvVDFtoESU1ftL6oxMRpkMaRLcyg++SOoy+cFEOn6wdpbX1j1z9ebx
	RhB0S7BJVgLWV/Dsf6VYExXZ7tqHOAR+w==
X-Received: by 2002:a17:903:19cf:b0:2dd:c100:4b76 with SMTP id d9443c01a7336-2e842ce7c78mr177066875ad.45.1792042995362;
        Wed, 14 Oct 2026 22:43:15 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.43.13
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:43:14 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 13/82] eject: ignore CVE-2026-28065
Date: Thu, 15 Oct 2026 18:41:01 +1300
Message-ID: <4581170802a4bf0a009ae21ef4b6b561632d7806.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:43:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130933

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-28065

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit e6d111c16938dab4a377826147bfc86b72bca8a1)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-support/eject/eject_2.1.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/eject/eject_2.1.5.bb b/meta-oe/recipes-support/eject/eject_2.1.5.bb
index aa0e86db12..90630ff791 100644
--- a/meta-oe/recipes-support/eject/eject_2.1.5.bb
+++ b/meta-oe/recipes-support/eject/eject_2.1.5.bb
@@ -34,3 +34,5 @@ ALTERNATIVE_PRIORITY[eject] = "100"
 
 ALTERNATIVE:${PN}-doc = "eject.1"
 ALTERNATIVE_LINK_NAME[eject.1] = "${mandir}/man1/eject.1"
+
+CVE_STATUS[CVE-2026-28065] = "cpe-incorrect: this CVE is for WordPress plugin or theme"

