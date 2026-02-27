Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2497FD5323
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 12:03:41 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.94337.1772193811838702804
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 04:03:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Lq3j22GK;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43989bd056bso1663061f8f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 04:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772193810; x=1772798610; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b+rYnVPChWBD2aXSVyTVYr76+lG+wt1I80lunOmIWOQ=;
        b=Lq3j22GKBLV5qOrbGDZMvn7AnsLV7manY1skOMR+3Eya1Wpr5/rUmUhfXyPqUXBft/
         75OgFfXV8j/TW6KFRrGtM1b32io+HuHHWpRNKG533jMjJYESYbls22Sn0Mg7DYHYHXcO
         Cne9LaGfSvohnRD1yafhf2/nkTanl4AudMh41CDiGUCIFrUXsL5BkFbOf9gT9nqY5+Fe
         mqrDT3RB7l0lr99UhIysF2ebb+FfeBERxOh9IZ1Y3gJz2LPyHtbJS0z51ST5IG2OTqlo
         4J3jPip80qoMZt9txQsGN8dG4IuWF5O4cNitpZXmqmOcqrFIhYiDnqLxQrwbwwS/daYS
         b9TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772193810; x=1772798610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b+rYnVPChWBD2aXSVyTVYr76+lG+wt1I80lunOmIWOQ=;
        b=kIL1IMAdofEagWhWxN7px56Q63d++PuafBuZCMSTcQmiN3RBUdCz/ows1IrLpcan4u
         JtGfvvbDfJFst3O2Gq7rVg04JlzOVdb1GyMmsOae7D3psKhAl0ph1Y8JEzZ5+LcNKWzi
         aoDoQeqv6Tm6lP4f29Iqf632y+Qngy8dZiHHwkA23hRZtyc9a7YRSyaKlrvRQYQERbH3
         uS138bLidZ+NnZlfyoXeRdLoCgp4NYuk5VFpWYLE5C48gHxjysixiOrcDwfLn72d62lx
         vjTOwOs+BAmbtxi9zH5gzbdbf6xEopo6ueWIjq+V7Jo71ONAE9s0WuJFEQ0YZaP5j2Yq
         e52w==
X-Gm-Message-State: AOJu0YzksRUhx7CGBf3xxP67OyaT5nMYJ3zPRbFQRkOas6KC1t6m6ws/
	5cIwd7orV4qz7U0MXeIT2O3qDLvy5I/vhVjSpIYi28X/T/bXPNomqnEY118u1Q==
X-Gm-Gg: ATEYQzxWRX7/GfrcrrFPGE4mM/ptNPSp8UTCUB7pO6lPX8TBpuY1h3+DUrBQmyq2yO8
	aViRSaXlDS+xbWHiA3GM3zVcewQizU9N1Z1z6iy1BCkS+HK+5Inbkni3WqF8ZdUPANqPkHbtXXR
	+bvUCjqkdix8OumuO04Z1HqCDLemthdVdF/QGxDkZc3nkTCy28rO+9oRlGQV7C6/fLl65/cRSv6
	kdM3GMSrjEjpSerOGieZZw1hmwTMCyvS65ibLx/iVV/vXmP4eCr3VsPVV8DT0mFaSgypqAm67GR
	XoXdKGxLqYmvPfIXKwfznZSbMh6Qxm7g2/q7puZlZtRENPhQjfZDL2ZPFQfn/iTmknln1uOPeDi
	kTKitRco9xv5sHFleRnpGSZujpWtTI6CwdTNxAdsfLqrFGfQrCGef7A5zdJpi9zPohsUZMiXgeA
	sudvLiZDf+RsSSd9estPiM
X-Received: by 2002:a05:6000:238a:b0:436:34c0:c9c1 with SMTP id ffacd0b85a97d-439971a63e0mr12468488f8f.6.1772193807422;
        Fri, 27 Feb 2026 04:03:27 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c70ff6esm9829566f8f.12.2026.02.27.04.03.26
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 04:03:26 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 4/5] ndpi: ignore CVE-2025-25066
Date: Fri, 27 Feb 2026 13:03:22 +0100
Message-ID: <20260227120323.333696-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260227120323.333696-1-skandigraun@gmail.com>
References: <20260227120323.333696-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 12:03:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124757

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-25066

The vulnerable code was introduced in v4.12[1], and is not
present in the recipe version. Due to this, ignore the CVE.

[1]: https://github.com/ntop/nDPI/commit/b9348e9d6e0e754c4b17661c643ca258f1540ca1

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-networking/recipes-support/ntopng/ndpi_4.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-support/ntopng/ndpi_4.2.bb b/meta-networking/recipes-support/ntopng/ndpi_4.2.bb
index 13c3398c2b..102f612c40 100644
--- a/meta-networking/recipes-support/ntopng/ndpi_4.2.bb
+++ b/meta-networking/recipes-support/ntopng/ndpi_4.2.bb
@@ -26,3 +26,6 @@ do_configure:prepend() {
 EXTRA_OEMAKE = " \
     libdir=${libdir} \
 "
+
+# vulnerability was introduced in v4.12
+CVE_CHECK_IGNORE = "CVE-2025-25066"

