Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE375FD461F
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 12:03:31 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.94120.1772193808363662834
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 04:03:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lCfqVxPb;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4398ebdf520so1921264f8f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 04:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772193807; x=1772798607; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yaQK2UfiqwogXGySFF0bd4Q78YxPwXFhv+7HPgKyqyU=;
        b=lCfqVxPb9qQQUX3bh9CBGm9IuQ7vsORbmr5/S+ZBpHYfAR9qF3MCBf0cv6vnp+bw+t
         G7CShsd8GM9Ih+3C1BTodr3W0o/Ts0rht6VQnHENPqXSDabwXBjnE52JifJyxfTldaJG
         l9Awq+OUkOVFQbkoVOsZrh17ARU9fqifaaC1ZFMsmH4++75RRZ12/oM9Dx8cUFCNdBqe
         fjA9mYHmjUEFFZiMnLNqBItg5RuhkpsJrNUtcnGoe+VPzg91ivJFWfRw4N+S/Z4AvgBi
         niQT6ME/p60HqHsNX+T+ry6WkNbPn2VBPo5igPvtd/xSSFdH3B/WZSHyAL2tgt6aHFhN
         x+EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772193807; x=1772798607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yaQK2UfiqwogXGySFF0bd4Q78YxPwXFhv+7HPgKyqyU=;
        b=AKikp9MoMeumVIqYNgg7cMWk95C5zrtJjbJToDqt8qqS7iSTAadRvAbR7+FgfvZBUC
         AL5vXHLRLkj9Uc30IHUyARrPTIZp85H+2mTP8GFEwunonDtORKEUKfwDdP1LTft7d4kS
         M56LJcj3qtNAHyfqlsXLkVNaIBy2wi2n9LcTvgbTImYo3XNAffZ5o30oJm+QTtJFUNoS
         DqcjE60rJQEt2AW5dLrp3pJYNIY01r4BycSfkTrh2ioSW1SOi4x4lBAGMHVajFfwLWnn
         AfdMLScLZp+cPZZq1jyrvTlMFDKyS87yVIPYeuNrz6HAmDaqi3UPSXisMUvjNpAiJTQC
         mrHA==
X-Gm-Message-State: AOJu0YxxCjkkrD3+pHNxpkkC1JgoQphUZEqXdDc52AmJPteti3k5jiZF
	gJvwyYYWskoYP7yIR5rVnbaEXL1vssrf7sgJpSe8aregcJNLpee8tJgjM9h/Bg==
X-Gm-Gg: ATEYQzyPg+SjLNykYFNt5Zs9tj4kxMp2RtO6cHg0iY3KVH2qPZgiPWYMi+wwcXjcyJL
	NGxzi7UnJEXA3jcBSHXojjK45rDPIgp+1iAgQ5d3yazlwu4dACa4igC6VgA/Vl7Wj+fGyUraZja
	iXRCe4n7JjBcbXyluPvNvaDDMecSEq8s8BwegYptJBOJWasIeeLcoGnfWuB6CwX2aK9f1vJO5XM
	y/zVHhyHXyW/h2kD8lMOILri5OindaVDbKi1p47TCLJWhajNxOVpNDmQl8er4q/+YATHJy7uwiF
	aappAGagbv0vbd18rWsPUwRJVPMoKh7+WUx/CZdjasv2z/B8pfoqwQVRz5nmlUhO1Rcx2BU+qRv
	pLdCy4nzdwHiyq5RsTqM0LXEzFRPz+Izas6pEW6KSLZ8/C6aeRysyUNZovuIM5efAp0DizNLDSA
	b+DDFWAHAH4cxU5Z2RdM8j
X-Received: by 2002:a05:6000:2f83:b0:436:34e6:7d8c with SMTP id ffacd0b85a97d-439971f1606mr11174056f8f.19.1772193806604;
        Fri, 27 Feb 2026 04:03:26 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c70ff6esm9829566f8f.12.2026.02.27.04.03.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 04:03:26 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 3/5] quagga: ignore CVE-2021-44038
Date: Fri, 27 Feb 2026 13:03:21 +0100
Message-ID: <20260227120323.333696-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260227120323.333696-1-skandigraun@gmail.com>
References: <20260227120323.333696-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 12:03:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124755

Details: https://nvd.nist.gov/vuln/detail/CVE-2021-44038

The main point of the vulnerability is that the application
comes with its own systemd unit files, which execute chmod and chown
commands upon start on some files. So when the services are
restarted (e.g. after an update), these unit files can be tricked
to change the permissions on a malicious file.

However OE does not use these unit files - the recipe comes
with its own custom unit files, and chown/chmod isn't used
at all.

Due to this, ignore this vulnerability.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-networking/recipes-protocols/quagga/quagga_1.2.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-protocols/quagga/quagga_1.2.4.bb b/meta-networking/recipes-protocols/quagga/quagga_1.2.4.bb
index 984264a30f..713d7d95f3 100644
--- a/meta-networking/recipes-protocols/quagga/quagga_1.2.4.bb
+++ b/meta-networking/recipes-protocols/quagga/quagga_1.2.4.bb
@@ -5,4 +5,5 @@ SRC_URI[sha256sum] = "e364c082c3309910e1eb7b068bf39ee298e2f2f3f31a6431a5c115193b
 
 CVE_CHECK_IGNORE += "\
     CVE-2016-4049 \
+    CVE-2021-44038 \
 "

