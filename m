Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1737.1792434857456626812
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Oct 2026 11:34:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ZCZeDnzR;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso959099a12.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 11:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792434857; x=1793039657; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rblu8TvKwc9NZ6yX6BUdFzKJfMMND7c8/4igNG68H+c=;
        b=ZCZeDnzRq4GzLjHhHNjuHM9iIZaazZUGm60W0brUjmiTppXgpKFbZOXFtlBiQvdPtH
         +chjwQj33/EYe8sdwl5n6oiRC/iBYV7UqlqIVOPrzOJr/iG/W1AY26ZsTTZ6Wxtj+AmA
         TCol4kFZdToGyd0t5zqCb6q6RtW7azkC8R7P1B7/PpNGpmobtxVsixyvpYKRJLy4z6Sm
         061JMAzJEfmPynNQOBunzSNK6kH0Cg4eVQtwYCcMMvBSAdJfKotS21aYuj5YjKo2FzBC
         qRBANy+6PAlE3MOkwj+KNW4hX8nXDbLN606L+AxzsGyB4y3qOHkld044owsa94Zd9fxW
         e3GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792434857; x=1793039657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rblu8TvKwc9NZ6yX6BUdFzKJfMMND7c8/4igNG68H+c=;
        b=xdudnV1y1it+7On9YiSNvrj0zMReLEDwnSju3qQOHU9wmCCXDIzNG220zDQk1CFTeZ
         vd6BH2eHWlm+KZdcOY09Jw93584LIRedpMQJkdimeyrxFlnZsk74LrROL4sVs0yWO8UC
         rvcfPO13StMnog4sIWWyVZhzYiJnbgY+2rne/6Lq9lwSTbKznr21mlxkLQtcqVzTvvcT
         bXnMqdro0jDITJyFFIzT+peCYpq9zV1RsahDRm4D62BFKPMV9Zwy1zuGNgHlTMq467z+
         FwKIpCHgBx4Dcpt5if8N8jHu7kcWfHfhtAV1J/I6fQQRLeL4ScUBco+5hAF++UEnWNh0
         hiGA==
X-Gm-Message-State: AFq9FYIWCQ9FUkRgOYjPD2h2Cu/wk7jhO1sdJcJNBc3GsTfL4Uqhy3hy
	HEFSY0Bl6JPL4ws6jWJt3bWjOSTiSdrs3ljSMBYUISx3REDsQYod8wdkZPB8Cg==
X-Gm-Gg: AYBFou3rhWxupTa+n+6Px5KHLcfk+H1yFzOYB1DjLRjD4v1YQlcJbeu2PBEHvjvZzda
	G04Xz+pfFx89EworoFrPLu9FVeT7Azo9W+mAbcBt7ZNBI7/ddCgouALJuSu6jWNcuAUMW49c7Xb
	CuMMNUjpvgXGNv6M/G5GLHNX+uq76S95FTc8QFFQjk6rxuAqUOUy6ple4reYNR8ST26jWk4e5Kc
	a0Rul2ZnVRvvvgYhWA+MfVLDVMEqBYnrW1JqYg37C7Y+TZgDmPErsN8Cukp+tvzCLUGlCEQUZCx
	dbEd8t/OTUmQ1vfqV2X6s5mWZl0/Yc259QUXn6mpKhWmUmAsVl+OPS2QWfMrbtKFQwMjD1PefPD
	W8npB3Eikq6vdhaf/e0d6zpr1NvKEhILXZoDXYpomz1qEmfeKEW9Q6N3F3EpevwUJhnIKDtnzOD
	apWaIOFDhTGVEIk9DPGE1nC2osEMFX070ECUpwzSSV2SRBvojz2ZrKBsBGUOzf61S/W5dZuBzYe
	347/Ma3v1IyCUQj1MsT0zL238jBl1WNd8rysrY=
X-Received: by 2002:a17:90b:4b90:b0:3ac:8741:e2e8 with SMTP id 98e67ed59e1d1-3acee295cb3mr7829964a91.8.1792434856668;
        Mon, 19 Oct 2026 11:34:16 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6549fb556sm4632865a12.22.2026.10.19.11.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 11:34:16 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][PATCH 2/20] pjproject: mark CVE-2026-26967 fixed
Date: Tue, 20 Oct 2026 07:33:48 +1300
Message-ID: <20261019183407.1037972-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019183407.1037972-1-ankur.tyagi85@gmail.com>
References: <20261019183407.1037972-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 18:34:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131128
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-26967

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
(cherry picked from commit bb27c215be50ff54ac07f976337432f8773baddc)
---
 meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb b/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb
index 8aa7775205..59684ac7c7 100644
--- a/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb
+++ b/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb
@@ -118,3 +118,5 @@ RDEPENDS:python3-pjsua2 = "python3-core"
 # and ${PN}-staticdev (the .a files) by bitbake's own default FILES
 # patterns - ${PN} itself ships nothing.
 ALLOW_EMPTY:${PN} = "1"
+
+CVE_STATUS[CVE-2026-26967] = "fixed-version: fixed in v2.17"
