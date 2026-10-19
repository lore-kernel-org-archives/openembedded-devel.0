Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1758.1792434886330325761
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Oct 2026 11:34:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kFKxSlkI;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ab98332238so1963414a91.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 11:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792434886; x=1793039686; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/Il/8A/smhJbIKHf5HZSvcETDne7y0E8LLlueM/b+hg=;
        b=kFKxSlkI0q3UzcYxFFigng10HXrPj62JrZ6FoCvmNKJPAjZH8jZ9TxdtIPXt0XUAba
         jmrwIneOKJPn1TPSFtdw6qsVc8io0p7OGBn8zPieHeDpTWBCcQAtsi2fSF4UDi1UDPR9
         gnHfZY7oz4WJHXcWscQwjXCtt/x0+M7GOMIayRBJYwcs3cMveHCaAfIhn0uyJf2PyKa+
         qM9keSZB+7tOLzo/0e2pyJQUJwTA7CoRHqMUom/jmZIOIH4J87vbJ7rEwyJf7Hc0zQh5
         lmVHCfZbw4U22uYUq18R2O2ascuj5IEKEMJcmG+gaolK3fzN8RqFoGbqByhYcl04dlqu
         NF4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792434886; x=1793039686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/Il/8A/smhJbIKHf5HZSvcETDne7y0E8LLlueM/b+hg=;
        b=24dnq5RLWKGrf8aOykBCYJFYKBd5qkKNuEHbMMLUeMi6UZPpFYvp6ojKqRoht/cLVv
         nKbEvKJtLimj9gneyyiuDd9uuABWvsrmawt21/wqjEBZJGxrzHyDw7I2iAamlhENB66S
         UeE2XdoQM3Sd1Ay/YL7tyoMxkrQoHg1R1nkQOikXb9wgV6Qbnv8KhLWSe4ENQ96fH/CM
         UkiDDHMwjyklkh7BwZ2C8kBGz95CFplqqEP5MLjMeZti2bCLCCTd7lWuoW7s+mi2ILbg
         jP4weyswcFrOSPoKnQTOIRc0Sm67Ag3jG5ceOX0yYlW4zmCP86CES6gLCxe1hKuhR8RR
         w8LQ==
X-Gm-Message-State: AFq9FYJOi6IaXkgwYB1mUL+Ky7xZcE/BS/MXpQK0MLpk3/ejKKVAY0im
	x778mu+mN/5DSBc0pGAjcWyZjYqritT0Xv2FYzwJ7tsRL6pblDJt9klURkFssQ==
X-Gm-Gg: AYBFou36AaHK6oTZkGYoPE/Gr9NTnTZndF7gdXuG01d3e138g7AqW2+8PE+LywjSzgy
	5iFNsceO8Kf5uFV2zcHckYj4IvFRcJ6SvJm7CzevU0VPoZMc3q61sDVcK2neTqIZXbvSYdSm7XD
	wyZmt50W2XaUWBS7oORUyyg3V9CqVl3DswcYsFG4MUTgO8VBTJtZk8NoRX35aq6AV398O9AQDUQ
	SAG5fSzqZ3AuocKSuXxyRWaIQI5AiuHml+9AaCh/doUdThaCfabjH81P49yOf6wn1z5hn7+vQuF
	v7zpjmKN7gBu49oEoi2KIk1wDgnAzdksIdUvVqhX3cKx/3U6MYMkFTUKuHnGRWxJRQ05hLGTC7t
	WaB97YjRkI28voDlcmQbzYaNaQG5tVLmdSeSuGnbPr4+2v4Ci9P8fTehCl66RwnS3ZRx32sw+rV
	xWuJxrB5vPikXQ2tYpj6BNGoIugbPcCkh6rNzUaIjNMY6zPAQXeuV08Mq8JNIuotmS9AAm4/Vsx
	0dOhSkDroAcpf1cQEjFyD0S9lgZdVYrW2A/1MA=
X-Received: by 2002:a17:90b:3889:b0:39e:4c7f:7308 with SMTP id 98e67ed59e1d1-3acef156665mr7179379a91.31.1792434885606;
        Mon, 19 Oct 2026 11:34:45 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6549fb556sm4632865a12.22.2026.10.19.11.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 11:34:44 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 13/20] ncp: ignore CVE-2025-14577 and CVE-2026-35087
Date: Tue, 20 Oct 2026 07:33:59 +1300
Message-ID: <20261019183407.1037972-13-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019183407.1037972-1-ankur.tyagi85@gmail.com>
References: <20261019183407.1037972-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 18:34:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131139
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2025-14577
https://nvd.nist.gov/vuln/detail/cve-2026-35087

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
(cherry picked from commit 1bd5d1a7a69aa04d6339ba7d5ef2cd8b83ec25a4)
---
 meta-networking/recipes-support/ncp/ncp_1.2.4.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-support/ncp/ncp_1.2.4.bb b/meta-networking/recipes-support/ncp/ncp_1.2.4.bb
index ec6d918744..19fb258aec 100644
--- a/meta-networking/recipes-support/ncp/ncp_1.2.4.bb
+++ b/meta-networking/recipes-support/ncp/ncp_1.2.4.bb
@@ -29,3 +29,6 @@ do_install() {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+CVE_STATUS[CVE-2025-14577] = "cpe-incorrect: This vulnerability is for Slican NCP"
+CVE_STATUS[CVE-2026-35087] = "cpe-incorrect: This vulnerability is for Slican NCP"
