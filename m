Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C5F2CCFA1A
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 09:38:27 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13709.1762853897596540842
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Nov 2025 01:38:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TeGk+xHa;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-297dc3e299bso29700245ad.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 01:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762853897; x=1763458697; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YHvurnvXq2Hm6hHkgp2aH+cWSHWfYtGE0VP54UyDdP8=;
        b=TeGk+xHarGkXJT+zafqda64Rv7wxHIM+E7lMtm3cnAaddVyEW/J4KSb49p2nmP3elZ
         taKO49okYdTUyuHpJeLJ1oRNWM8GF38SR1yfS+A50982VWmdNYDY714Hggp2jPsaoTvG
         D8+Lfd5MrVdIVtGWkvTzfdtRuJDjHvjyyS/X7I+io9q5au50siQtPL3rTGBkFRCtAHHB
         5p8RqdkZlO7hkQkE5i18nbCQEX+WjnbvnFqkF0QRDhwF/AJ71C7/Hgx5GfBZGkNKZOKw
         uAgkpsEvhBZbKiFA8IYP4t0aJeaUQakkZBW3hwHj+RH5yitoD082BQYWWEyFsGT4Nefs
         ghuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762853897; x=1763458697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YHvurnvXq2Hm6hHkgp2aH+cWSHWfYtGE0VP54UyDdP8=;
        b=RFJNsI2xdTfed5gNiz9fpP1Fp/Hn1QI8uS4yTXRBRZlC2psInrrwRpEb6d9wGIFcT8
         5mbeChpJgGGDTdHwlb5vm9SVgtz0hXB67Hre3yTXVlHsQQHRCgaTJ11D//JrRWKj4X0z
         dQJHvGQwgvVJEvRliDuGFWYSK0iV2JDvRQedh8JihbrUDX3O0h38bToJlxmbuDh7nH6A
         F+RfFYwhA5pk24jVWZ2WfUAI4F3jP/tWVlEF7HFiKKEuZW1BNgOjO3wnwYysV0LPAaL/
         rTuEmk8okaq7dB47pewWZ+MZPC4HhxuLQU5aGGuCS7HT1tL9hMVKK/SphjY+uRycIArD
         WVWA==
X-Gm-Message-State: AOJu0YyztNgNM4r3RDJOJG9P27O8HI2HWF2a4UzUPA9U3tTWsPGrw2jk
	Knf7H/Oa2j62FoBn/4TpKzuK/ctN3i0AXeYxlhxQ17Tp91yXaJfG4vgrLOL1xcHfbh8=
X-Gm-Gg: ASbGncvZ5sxgDlQpDWJog1q8ccQeMb7DDyYxc8C9MpKYWhdLkD78JyDLO7Ca99a0VH+
	fer6QXJv4bhZMN+tlgW5IZk35SI02PAEejF21YXK0gDH/YNLHuumNTH7jwf8/GaWBVnek+4yznt
	j0fbsRwjlSBGMeUTmafrIuF+j4kchMJYd/ZE+WYeeDsR4MrRhYKN4mTPIp4jW2vxZB3evBLwrbQ
	zCrL1GcEnFSdluFjBPDFE1I90+vyUMikYVUt6taHRptNHWPKju4uc0vz02eQc/dehqtcpPqWTIB
	BJsocMWrWxYQsjzypIRd3PCsExJlWI47/1bzIC2MuV7VTLWtLxAJ+T2vD9kvJWTV1kGazpWJWxz
	9kOjGElp4qmruOjpfY93Do11GYoY1cVOpKvVfNLgaRZd5u9n90i22LbZ+xcskxl+vPChfnVTOvl
	8TcHASmMq5mhI+WmJ0vBP7C3vb
X-Google-Smtp-Source: AGHT+IHZsUPXm8y+G2y7xxLxCu6fKWy5ybbV0y+QaiC2OhbKs8ja5nyR2aaQbqScHl3aAdQgsZEzNw==
X-Received: by 2002:a17:903:2308:b0:295:99f0:6c66 with SMTP id d9443c01a7336-297e56d9061mr158903215ad.36.1762853896733;
        Tue, 11 Nov 2025 01:38:16 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2965096b90asm173611505ad.23.2025.11.11.01.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 01:38:16 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH 14/18] proftpd: upgrade 1.3.7c -> 1.3.7f
Date: Tue, 11 Nov 2025 22:37:29 +1300
Message-ID: <20251111093733.1393568-14-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251111093733.1393568-1-ankur.tyagi85@gmail.com>
References: <20251111093733.1393568-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 09:38:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121517

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

https://github.com/proftpd/proftpd/blob/1.3.7/NEWS

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../proftpd/{proftpd_1.3.7c.bb => proftpd_1.3.7f.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-daemons/proftpd/{proftpd_1.3.7c.bb => proftpd_1.3.7f.bb} (99%)

diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7f.bb
similarity index 99%
rename from meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb
rename to meta-networking/recipes-daemons/proftpd/proftpd_1.3.7f.bb
index ec38fb54e1..be434a58c2 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7f.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.proftpd.org"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fb0d1484d11915fa88a6a7702f1dc184"
 
-SRCREV = "75aa739805a6e05eeb31189934a3d324e7862962"
+SRCREV = "ceb2f7771e8dd7f0697b5c151f97dd39aa5c453a"
 BRANCH = "1.3.7"
 
 SRC_URI = "git://github.com/proftpd/proftpd.git;branch=${BRANCH};protocol=https \

