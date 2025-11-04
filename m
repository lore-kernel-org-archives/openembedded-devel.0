Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A125CCFA05
	for <webhook@archiver.kernel.org>; Tue,  4 Nov 2025 19:34:54 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4472.1762284887061456537
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Nov 2025 11:34:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JclCjWoZ;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-29568d93e87so29195565ad.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Nov 2025 11:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762284886; x=1762889686; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2aYHzDaQohInU3ykQvfUdmS+bGM+zsFEnKR2g7YeaLA=;
        b=JclCjWoZo8/9Q9NEJdkGaI+nuVPwhWaXXv4+4SKoQrz9a28S905bMeVOKXwSq5eiNo
         mZYo72XA2QT3dMZQdGzqa8YSxfVOFFILJat230l95KHedAzignxrSrR2wYsxDDgp0aHp
         Lqxo8ESXKH/OwfCTPcZ1Xa7FpTT97IZgG8EosH32+Hxta99Uc8JDu1tTNG+8zMtZbCnX
         QEIOaXMZ8k53KJrjZyqeUayXBZLqzTO6nR+RJtuxs9vS1hBoGyZ4nEtgfp/H1eLmx3Sv
         dS7vm54AmkWCC/GbCDV61BqejEUp7bFnukzzJepOLv1MEtIbXruBilDshorVsyuQKO7D
         +ARw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762284886; x=1762889686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2aYHzDaQohInU3ykQvfUdmS+bGM+zsFEnKR2g7YeaLA=;
        b=Tyub3pXblYLCC/9nhbvn53pBNEc+cz8rA/c7I/Gr/tyP8kYzXBP2kqnivWyn9CsyX0
         b6LdRTOy3MiXNMNdJwJMqCpoxsuP+S+cp9aC/3kNBPc52cIy2JQxGabz5l9WD/F4BL69
         o5KWoh0RA8j4AOS4GijUMWP90wEMkqkp02nYkUydKanzsUpNN8GrbX/Q0Pt5+MLWKrp/
         qhYIqo06dT7wPyCVv2ge44zbeZXe+iapDsyqH2h2SEGbDPv1D2Ruo6iI8BTVM0iCD0ft
         JPZZ4r28i4Iol6gzXR2M8CONstgS+zSo9v+SPzdQi+Bbqk+Ka5xRLrPmVqqfE8+6qtyq
         UFRQ==
X-Gm-Message-State: AOJu0Yw/gFSLyW0iIRk5KUwOWfnITXrNiZ6MSj0t9gf+12CV4mO8DdaA
	t7LlA1VdBg0cEMdGWGZ6IVgjwe1IImUjLJKzMVvjfJocXrcZ7EsIVNJEkkpMRbQV
X-Gm-Gg: ASbGncv/zgJ+Za1I8ZgoYonmQywgpVLj3rHS3Ix5uqG3Qd9Th4ThtCgqU8JWlEB6326
	daolBBYfSZezcG+ERyorFatZ6/VQM21u1h5t+Gl5w59KrDgzAoYV1wF9xhwuoDDU+4rOazqviQo
	iULjDD0NDOzxn0sFWVd6hrIQjSPCK3zdUBFFoUdv95ZhqBCYWtBu+Vslczm1kdeCQavBjB/X8UG
	3AjYPWzy493ElfZx3Rgb9cEeI70TT4lCes+klTsOqNliF0L0Z0iHB3hv4sLtKEbE4bwAYxR3gae
	CHpL8IGAF6Io7X5kmTdaAZTWa3WqdTj9zE/bkBlFUgGwb+Qi9RSx3kQYnY5PKPRUujx+v1gnWQB
	7aw+Tneiw5po7plNoftYibxX8vEQVFGPeBnjvp3aXvk6IoP8zx7yhcGi4Pq1P6nf/OqnSrvrqYn
	K6rZf8RxNW86fNZA==
X-Google-Smtp-Source: AGHT+IFb1X1V02XnnS6J1RIcIqRJgOvKo2mCtvfWrZ1S6Cs7VCnwt6EmAspC6a9IAnTudagUEv9SIg==
X-Received: by 2002:a17:903:f86:b0:270:e595:a440 with SMTP id d9443c01a7336-2962adefd7emr10348895ad.25.1762284886258;
        Tue, 04 Nov 2025 11:34:46 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601a5d202sm36120625ad.78.2025.11.04.11.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 11:34:45 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 2/2] redis: ignore CVE-2025-46817, CVE-2025-46818, CVE-2025-46819
Date: Wed,  5 Nov 2025 08:34:37 +1300
Message-ID: <20251104193437.1797870-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251104193437.1797870-1-ankur.tyagi85@gmail.com>
References: <20251104193437.1797870-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Nov 2025 19:34:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121304

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Fixes for CVE 46817[1], 46818[2], 47819[3] are included in the used version
[1] https://github.com/redis/redis/commit/fc282edb61b56e7fe1e6bacf9400252145852fdc
[2] https://github.com/redis/redis/commit/dccb672d838f05c940f040c27b74fde6fb47b2a7
[3] https://github.com/redis/redis/commit/2802b52b554cb9f0f249a24474c9fba94e933dbb

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-extended/redis/redis_7.2.12.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-extended/redis/redis_7.2.12.bb b/meta-oe/recipes-extended/redis/redis_7.2.12.bb
index 9016254731..6527fb6996 100644
--- a/meta-oe/recipes-extended/redis/redis_7.2.12.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.2.12.bb
@@ -23,6 +23,9 @@ RPROVIDES:${PN} = "virtual-redis"
 
 CVE_STATUS[CVE-2025-21605] = "cpe-incorrect: the used version already contains the fix"
 CVE_STATUS[CVE-2025-27151] = "cpe-incorrect: the used version already contains the fix"
+CVE_STATUS[CVE-2025-46817] = "cpe-incorrect: the used version already contains the fix"
+CVE_STATUS[CVE-2025-46818] = "cpe-incorrect: the used version already contains the fix"
+CVE_STATUS[CVE-2025-46819] = "cpe-incorrect: the used version already contains the fix"
 
 inherit pkgconfig update-rc.d systemd useradd
 

