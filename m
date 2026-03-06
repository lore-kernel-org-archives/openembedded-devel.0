Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01006FCC05D
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 18:33:57 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1713.1772822033015128089
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Mar 2026 10:33:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XJH/7NQT;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-439d8df7620so760878f8f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 06 Mar 2026 10:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772822031; x=1773426831; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7splaOwqNKY65616X3CZiCA5GV2+QGdoAifYhhK2BXw=;
        b=XJH/7NQTwsx7VR7FNt/awwKE2UiLPjBDRjo04VUJKAtM48Ni63K9zC2M4bqppPbw8I
         VQfPd9vFx3P6Q6C6GlKB1HCGrwNVPCqmNR4T3wl+a6CM39rkcIwxnN/PySf1XoMI1beQ
         e+T94k2dZeDwANc9Au2hGb6WGzWMgW1PiTAxTSLhlihgFiPiqxTFjtQcKfIRjEu5Wqyu
         SDts5503nii1wO4gt2XquzzNryPQxL7EUguv9vpc6H2xGZEFgQ/ONDnv21joinjTC9JZ
         4uj0/hOETpGj73G0i0gd6/Z7d0Mr0htfQHupcsfwRCCDfnWdOXe90Vrb55d2xWhTdje3
         t5yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772822031; x=1773426831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7splaOwqNKY65616X3CZiCA5GV2+QGdoAifYhhK2BXw=;
        b=KmMiGBSoh+yKZrxT5d3fDd5y8tk+hPrCiBb91VLgGfGoun4JjOf4XhNtWwocZAz292
         EnkeAeZZnwCso2cxS+sV8cnXWEcagxbLX7dVh6MuX/NmMqPykWze2Q5DMFpLWXnQ4lCb
         bSn3OdtXom1Sb56TwY2lNSUcoTRyLbSxscmNU4KtrJhwmnjZKUpjsr46Ft9grE8piV5o
         ljy0Y4K/O952O5PR8MHheCXzzV7yi8yKiKS9u/JCYtEokwUteOWBJb8E8WmyEE5i+1Cz
         txKpFBgxaDo95nJxpVXt8nLiNviH1M9H54mUpCYtB6bHt8OTW0A2vGUHgfqqVQfumvf1
         njhA==
X-Gm-Message-State: AOJu0Yzze2KnNDdBSazITmj5s4LHCouEnfZvmEaQkhOUR8pZN34g8gGH
	EV2zhHsntX/xNJnCmERffxp9KZ8UbjxRNwgSXhFxqZt/l7XoIlVgnFj1kA5ddw==
X-Gm-Gg: ATEYQzzZPurO/fTWqMu09Py4qbN4hThbvRVxkdRR4bxCqsEYrCMgCJZ7VWapvrH/0df
	xYD0OR/OZTONehiGx3n/OPv0Jgf6XirqVOEhzSuFAxC0+ZmJQWVpqIySAHN9w859LLh1sQEEkyp
	oGsMdFSvOITg5yn8lNcUG3P5e3X7dbPqtHxjlcF7+Q/RpQknN/ny9EVmTBxm6NYv+IjMmQHDzDP
	VnLSDMg/NKQccBzz065Lnw51zhfguJ6BP70Prb85uMyKQGZBpac/0PqUz0bUR3uaoZHXQgb2dVG
	mJUn9ijK7DjgRpTPqtPJmQYqkfuYRvMmSPnNo4Lgn0HXBR4i6zsrWIPoPIF7jLy0H/AAFZAWI3K
	WVbbWtS8OTY9iD3FnZOI0D+RaA630ZWZXeC4Td64HLv/Knu13/g9i4X6CiJmDC7TBjjAtsgKxe2
	AjOYQdT8oapZ68y3SWiIGj
X-Received: by 2002:a05:6000:310c:b0:439:b636:1fa4 with SMTP id ffacd0b85a97d-439da8951damr5557799f8f.48.1772822031285;
        Fri, 06 Mar 2026 10:33:51 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae4b860sm5846929f8f.36.2026.03.06.10.33.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 10:33:50 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 5/6] streamripper: ignore CVE-2020-37065
Date: Fri,  6 Mar 2026 19:33:46 +0100
Message-ID: <20260306183347.1014705-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260306183347.1014705-1-skandigraun@gmail.com>
References: <20260306183347.1014705-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Mar 2026 18:33:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124921

Details: https://nvd.nist.gov/vuln/detail/CVE-2020-37065

The vulnerability is about a 3rd party Windows-only GUI frontend for
the streamripper library, and not for the CLI application that the
recipe builds. Due to this ignore this CVE.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 1571c1a8e5e876db9db744d0a3e3256ac585242b)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-multimedia/streamripper/streamripper_1.64.6.bb      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/streamripper/streamripper_1.64.6.bb b/meta-multimedia/recipes-multimedia/streamripper/streamripper_1.64.6.bb
index 6014326826..1600d9d3ef 100644
--- a/meta-multimedia/recipes-multimedia/streamripper/streamripper_1.64.6.bb
+++ b/meta-multimedia/recipes-multimedia/streamripper/streamripper_1.64.6.bb
@@ -30,3 +30,5 @@ EXTRA_OECONF += "\
 
 # the included argv library needs this
 CPPFLAGS:append = " -DANSI_PROTOTYPES"
+
+CVE_STATUS[CVE-2020-37065] = "cpe-incorrect: the vulnerability is about a Windows frontend, not the CLI"

