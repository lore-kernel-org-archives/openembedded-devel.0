Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C52A8CD4F4B
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 06:20:25 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17890.1763014824863409306
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 22:20:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jT84xN/M;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7aace33b75bso412660b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 22:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763014824; x=1763619624; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=138v+ONrw3hJCuCCluwNuDopAY9grzzdDRexmCGXUCc=;
        b=jT84xN/MlIYoHwj90fK0R4uHwHPrbOiG9vHpA/fFeMT+yf4SSYEh3oGqQTrCbpB5i2
         WzUIp0MhOp091WyCqw1cLzXyLn1reFQW6aTw7Xui+AUQovB11+izUi45jrYE3HapJrk5
         zPDpuu91m5uDlGvtvRx+KTBb0YwDnUE+ZGOnalcS0HPFi9seHme6bCRLTsq1wfXDKNIU
         eIff3GQs39nmKyC87/ukt88Pa1jikhV+pQB5dg/pcdce+AqCKrexB/pXTugIYJo/owDk
         dsb0jmicaNcE1uGLuyqGSHTMfzC4lJL8abGXkg9qq2APiB06KDJctm9mYSx5JUjsVg98
         78KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763014824; x=1763619624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=138v+ONrw3hJCuCCluwNuDopAY9grzzdDRexmCGXUCc=;
        b=aR9mQUpTECujyZEwfaGaF7xIS28TabSo2e3Jvrt+3aqeW1xr8ux7ox3fgf4B3lyQ4J
         G1PQQitxxHTVAq99fhqZu5fJ7j2dTcDxtwQGuAKnDBVd2ckneQTKliskt59oksP2rmsQ
         +FRhgT7yb7MXEn/PA75eVtwnSXN7bYQ/7hC3F2jaFWMNjDv1XvdPJ0O5WS/mGHgINbM+
         oDiJzTAZ/w3PFwxUqNY3NsvY2Du0Czx4Re0kKfimsO7C97ZWKzK4ix3YJLmByYHWBcaF
         xSSgU4qwf3KNmFQorljzkZtukhuMY7xhDD4cCK0Um4ixztqKYcWwNqGZ+A7/2SVL/I0e
         f29g==
X-Gm-Message-State: AOJu0YxhlrzuHGRTwwUJPYwDPQ6wGWPYuZ6zpqUucO7Eg7uzB2OlvdyK
	4moFPoQZ7DBJdJVeOnvFI2ogvhjf/S9UeX4RhQbzMOVK36p9JofRSMdg2EGOpA==
X-Gm-Gg: ASbGnctwCBh3B6swcHcnvuMNJv7DujM/NaumP4PuzGvXDMX7Z4rVBVm62Hv/678Xttj
	lOMMkAcIJzq/yzSikkQzM/6dV2BCMKJ/9xB8NC/oNuBI9bgTP+OzCMRwQnw1Lb0B/4lOoUnBZGb
	jSmozFCDa2gEbsvkrGx5a0aakVQkMsMWhXUf/iu13WvJZXxoHMyIHj1HhAN/ndRxHj5kXnYeI/4
	25fT0eHhRcTdbDobic1xSf2jg2rh5PA59MMJZdKGsUAYtoUUnNZcC19EDba5/VMFZijuYu7D7OM
	C0RdTM46Ar9G2aOj6gt6qgYjPcqHoiktiI+1+JdjMi8UnuKC6Kq0AG62ZgkFyGYfPwckOM8gLdk
	lJeZiBdh261/fPGpVr2OHZq8WPysEzyef2U1Dz7RFjfBOVg4d1JpB0FzWDk2r1IXUJxgfTgzP1y
	EW05AitbbdDXMa+4nceQsFoUTz
X-Google-Smtp-Source: AGHT+IF2g7bvEnVTOebFfNzopr2vKlcUQwAuT8XjWHePrGR1UIXqPTdMLaS1Wi1dBtpQ94rk/7H5YA==
X-Received: by 2002:a05:6a20:7f8d:b0:343:ad1:d55c with SMTP id adf61e73a8af0-35908e8ce07mr8627556637.6.1763014824033;
        Wed, 12 Nov 2025 22:20:24 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b927d1c413sm1000454b3a.69.2025.11.12.22.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 22:20:23 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 18/38] libbytesize: upgrade 2.10 -> 2.11
Date: Thu, 13 Nov 2025 19:18:53 +1300
Message-ID: <20251113061914.3756301-18-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
References: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 06:20:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121616

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- remove dependency on python3-six and python2 crumbs
- dist: Fix release number in spec
- Squashed 'translation-canary/' changes from 4d4e65b..5bb8125
- ci: Bump actions/checkout from v3 to v4
- Rename 'master' branch to 'main'
- ci: Set custom release number for Packit
- ci: Update CentOS Stream repositories for Packit
- ci: Add dependabot to automatically update GH actions
- Update translation files
- Translated using Weblate
- infra: bump actions/upload-artifact from 3 to 4
- tests: remove unnecessary bash dependency

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 634411e51bb8e325c92e9cf50b17ecd003bb3ebd)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libbytesize/{libbytesize_2.10.bb => libbytesize_2.11.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libbytesize/{libbytesize_2.10.bb => libbytesize_2.11.bb} (93%)

diff --git a/meta-oe/recipes-support/libbytesize/libbytesize_2.10.bb b/meta-oe/recipes-support/libbytesize/libbytesize_2.11.bb
similarity index 93%
rename from meta-oe/recipes-support/libbytesize/libbytesize_2.10.bb
rename to meta-oe/recipes-support/libbytesize/libbytesize_2.11.bb
index daa01bfc3d..214c2b2844 100644
--- a/meta-oe/recipes-support/libbytesize/libbytesize_2.10.bb
+++ b/meta-oe/recipes-support/libbytesize/libbytesize_2.11.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c07cb499d259452f324bb90c3067d85c"
 
 S = "${WORKDIR}/git"
 
-SRCREV = "6e83cc6f6dff4f126fc79284e0c3c1c50123380d"
+SRCREV = "9da72b2732508b0ba0ceed27f5e50bc276ef31f2"
 SRC_URI = "git://github.com/storaged-project/libbytesize;branch=main;protocol=https"
 
 inherit gettext autotools pkgconfig python3native

