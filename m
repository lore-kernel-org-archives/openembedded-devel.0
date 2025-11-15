Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E12DBCEBF71
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 18:29:40 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14007.1763231378198385140
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Nov 2025 10:29:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l1XOAFLU;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-42b3ac40ae4so1635345f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 15 Nov 2025 10:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763231376; x=1763836176; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HzkCKjOx5tIxLE4itzRRFdXWunaaxOr73e1PEM5lTO8=;
        b=l1XOAFLUdEBHCSjKJvvqVX0HSBT0Xz0WiYNmtd1Dpqb6zT1eiyweZlAwrnj3miFXt+
         Z3F4gSVqFhINFuiYTeoB97R89uKCIl99/Gxvu/340QjAo8sNx1HJfpAX+UF1aVJtUATd
         U7zkPuteLrhT9eJodv/jA/DKaUdHPXhCxUovOsCsjjif0AirwXpOjNaQu/i5sXji2iQb
         heocCCXkgyeiz6Zaumm3u8uGFIerKEHjHrToz9x3UCKNC6LkQCJnpZMUWfwWC152OWtw
         3lDiMxPXbyqfeeQBM28qbYWoCEvXKc30VQM1TyM/P7TDXZwNMCh+u7uW/SVQ3F6WC42/
         M2dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763231376; x=1763836176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HzkCKjOx5tIxLE4itzRRFdXWunaaxOr73e1PEM5lTO8=;
        b=woJGgiNtuN3VsynmZatraIOWpoXOdlpG0q6RDTUgJ9xHQYrg8WEf4MBHX/tgEfLU8B
         JyLtWA8ywq7elH6z4zf1poSrQr2KPwNy3yJMTjXh+JeACN/vP/e5yAaUP5a3cYPsEp+v
         lxZr7t+xoWjiDUsWx3dZi1+6gwthXSwT4bxlQEhs4K0u8mEtIPuS12s0nJOuWUQlYixT
         EeJ1j4N9J4SDuly+Lfeijhb4NfXEDlq2PV847X/UhKTdGzK/qshSoH/7p/S3CU848unU
         QPFbgtB20Y8OndLqm/gGr+ploplKfq3f2of00M538LsKvnBi9Ooq9N6rgKqZDJmIluir
         bETg==
X-Gm-Message-State: AOJu0Yxc2yimAIf0fqgebmiLPbgneK2Jr9vXRnOmoqHnxGBq00Zp5Lmy
	cCVeI2h1UkQ80Hu/7kpP2K1ZA9tzVBlgsCHucSBOh0qWYSMrstGtpsQladDWQv9b
X-Gm-Gg: ASbGncuyc7cLwOxQI0E2fddZDCVmgHxnRsTk9HgSVgzBJe8ZcGaEAjWHkbsJtxTa2Dv
	EKr0Dg2l6KIbRrNB83ijwTCtb/JqRyRneXu2VCbk2wtZPsmpFq1dfcVWqTdrI/Cj2fcA0drIrGA
	eTTz/YLxldEcQ3w/NI5075U+3+YqdgwRxV+pEHU/CzpinYm0KNVbvRHrH4znYxdhyuYlNCAMFd9
	KvrfD8jz3nDY95mUx5YjRc3nMtwxZgf9LhtzA1mYPbITpLg7Mi6KOcDJehtpQe/WAttis+o1JQB
	Nm+QYI39gv0paAh5l5qWAToT8OgMlY7DWW07RwikXinvx4BcpzmxpPcTKRYceMTvcl50dVkOv6g
	5ITCdg07hIoM1OyNdhrxm1/Cl72nSyWz+Mp/x3cN1vUKBSVkrzRpbeR+8VdgOpw19qVZ1m8XOwh
	TUuPKKsp7g
X-Google-Smtp-Source: AGHT+IHSIwIqRFe8zJXj/inXl0accQzodEf7WGRj8MCSicqwxdtId3MuyB1V+Vs6bNFq8waEAyA9VA==
X-Received: by 2002:a05:6000:2912:b0:42b:31a5:f065 with SMTP id ffacd0b85a97d-42b5934e90bmr7964006f8f.28.1763231376418;
        Sat, 15 Nov 2025 10:29:36 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e7ae5bsm17024927f8f.8.2025.11.15.10.29.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 10:29:36 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 2/2] linuxptp: ignore CVE-2024-42861
Date: Sat, 15 Nov 2025 19:29:34 +0100
Message-ID: <20251115182934.1263398-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251115182934.1263398-1-skandigraun@gmail.com>
References: <20251115182934.1263398-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Nov 2025 18:29:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121747

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-42861

The vulnerability report is considered to be bogus and a non-issue
(or at least not a security issue) by upstream[1] and by major
Linux distros[2][3][4].

[1]: https://lists.nwtime.org/sympa/arc/linuxptp-devel/2024-09/msg00080.html
[2]: Ubuntu: https://ubuntu.com/security/CVE-2024-42861
[3]: Debian: https://security-tracker.debian.org/tracker/CVE-2024-42861
[4]: Suse: https://bugzilla.suse.com/show_bug.cgi?id=1230935

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-connectivity/linuxptp/linuxptp_3.1.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp_3.1.1.bb b/meta-oe/recipes-connectivity/linuxptp/linuxptp_3.1.1.bb
index 9c8e649b1a..ed6717d949 100644
--- a/meta-oe/recipes-connectivity/linuxptp/linuxptp_3.1.1.bb
+++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp_3.1.1.bb
@@ -30,3 +30,6 @@ PACKAGES =+ "${PN}-configs"
 
 FILES:${PN}-configs = "${docdir}"
 FILES:${PN}-doc = "${mandir}"
+
+# disputed: Considered to be bogus by upstream and major distros
+CVE_CHECK_IGNORE += "CVE-2024-42861"

