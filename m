Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC0DAC624D0
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 10:06:37 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9070.1788343588516547894
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2026 03:06:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MMJXVfzt;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3964dfb5b9aso1074937a91.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 03:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788343588; x=1788948388; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jtt+uzyesIPhXyMXbLlASGAvehecRRtc9upUfnBK3E8=;
        b=MMJXVfzt0hieZvVKi9Ija2NV0VoXMvY3WqC5CfmKQjQ7M6kARzG25tru75E/4n7G/S
         HNktBrE7AJWP8U+BylpiM3+RWM3meELbrM8ggwLRLwXgA7mDxt2YAvbz4ojS7rrsidmu
         eoPxldZ+qwP62p0MEavXypP46YqtteUDbfw1/Umu5VCh+ayDCBsydbhPZGsHf7Ohp0aX
         Ou4+oHUIp72BTA2NZ0d8XzThk9wwZUPjJq3pduEfrj2QqVOk0ZFxYowqWquxGP7l9hNx
         STC3OJ93JtOWmIJVrCLC2fLzN4tYfQzETJehol1lP6ceaIzzlYQazgXZkG5+/67OgSL8
         U7Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788343588; x=1788948388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jtt+uzyesIPhXyMXbLlASGAvehecRRtc9upUfnBK3E8=;
        b=W+4uVdSIIgOiQ7vw7yJyovxUcds99QVPSPI2v45jiNRCsrNMDHhVv1CBggYAEjbzR3
         ggwPfbkIJVKpG5kkLVgqRNXYZ+nOfYd+N3kU1Hnu6b57DUlIBzDodIoIe+z5IHonqP07
         2B3hXAIRgZ/817QtWv5RsiyLr3ENrpNW34sX2ZTBF629E25ihs0lM/cFoQKumQd/Wbao
         /d5HcmmWpM413Bjdm3zNRYerGSsVzTjewyTGZ1UmWNU+NQgznDAledp7KnRMT3ZS/flo
         9R6HkSRh9p4sxF3bIpv1pF5pEQGm8a8uwnqkJbgM5Yiw9PyNiKw9C4/gzOFgMvJZR2TZ
         EE0w==
X-Gm-Message-State: AFuF++nds5zoBdgheetTkKBrCJLHpaz+F1YPq7hO7sEqVnJzQx+G06HY
	4J5dF0Jfee+N2t2XSUN7DegD16AMgz82YUYyrVlIinm+6Zc8sr2aYbc7gYwpiw==
X-Gm-Gg: AYBFou3DEGtMErIXzh81vY7P3nKohEQaX3xpJmiTpSmKjGozlqHUFpicnUd6aIVFJbm
	QYHxc1bgUFWBgwwvuQ3KN+NLFRvhSbzl0MZKw9B8Tfx0O0+s1L7Mfp6FR4Vl0GTb474UEaBegUq
	CDZWR/jHJDuq8h5bSIU5nHloWXadJREtzLnOJbDVBF4ZtJnwBlpK+YaeP6rLzrL1tk37fBIwTdw
	0ahyNRu3gpGiigFkFgaezgfJBSBpshv8qu0jU8d3MIIfEH1o7Sim9ljt1hwM4scI/zCsaHLX5jn
	yvSriqdaruNAyrGocQ9ISbtIm+0X5W9W0K5xsMcbH2n0xlVp7IOhU7MhfGTX4JPxBDKSYG43y6w
	YHRyRjPm1JZSSRiJwxq1gAh/9TBWbAYVQJrsBv7PL7mG8j5MBM0oLa8rK5sAPixjenRodldcPVq
	tOGpMeucvqLpah1tdBgCai/ufXMX7XuFQqGDPwieWQk0i7DMWBaNWt+4Y55zlvG0yqcd25EW9dY
	g==
X-Received: by 2002:a17:90b:2644:b0:38e:9045:babe with SMTP id 98e67ed59e1d1-39aedfbd99amr5492316a91.7.1788343587775;
        Wed, 02 Sep 2026 03:06:27 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990bd1dcfbsm10766784a91.2.2026.09.02.03.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:06:27 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 28/28] iniparser: mark CVE-2025-0633 pached
Date: Wed,  2 Sep 2026 22:05:10 +1200
Message-ID: <20260902100511.2105916-28-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902100511.2105916-1-ankur.tyagi85@gmail.com>
References: <20260902100511.2105916-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 10:06:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129659

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Also mentioned in the release notes[1]

Detais:
https://nvd.nist.gov/vuln/detail/cve-2025-0633

[1] https://gitlab.com/iniparser/iniparser/-/releases/v4.2.6

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-support/iniparser/iniparser_4.2.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/iniparser/iniparser_4.2.6.bb b/meta-oe/recipes-support/iniparser/iniparser_4.2.6.bb
index 9ab713ee92..5958ecb9c6 100644
--- a/meta-oe/recipes-support/iniparser/iniparser_4.2.6.bb
+++ b/meta-oe/recipes-support/iniparser/iniparser_4.2.6.bb
@@ -15,3 +15,5 @@ EXTRA_OECMAKE = " \
 	"
 
 FILES_${PN}-staticdev += "${libdir}/cmake/iniparser/iniparser-staticTargets*.cmake"
+
+CVE_STATUS[CVE-2025-0633] = "fixed-version: fixed in v4.2.6"

