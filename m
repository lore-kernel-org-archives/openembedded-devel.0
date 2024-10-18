Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B442D3E194
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 19:48:42 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web10.29955.1729278801344959570
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 12:13:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JloBXhT3;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6e5b7cd1ef5so16387147b3.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 12:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729278800; x=1729883600; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kD2ni06ATv2+TkdXuzhSeEP6vUEF86bOBVCbQGwZXB4=;
        b=JloBXhT3hgMBM3L7pJdFx0wftzeFVVVmdsMJLonvzg4AnS+tv8Jqq842G8DkMyN14w
         9zTx0PBasUnOyQZteRgvwv7yp00uVAJHN37ElCUR8VAGTntEO9h9lzrWC1Q+rp5Dzyy9
         REDW044uvgydG/cedVeGMKqkxzPWNL4Cox2ndyoG76cYlHCwqy0zfUmqO79xWYZDFB4s
         ylQkLzpl7ceGtBO47jcZFO7+ENbLqX60ZNhj4QLAGBSMxGG1q5PxxKOcGIQ/AzdGAHaG
         b+CdzE4JBGHx2S3xjx2K418/HJSoy9a4RKvUh+e+zWzlRZVu+bx9+hGp2s4QTn7SA0N8
         MbqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729278800; x=1729883600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kD2ni06ATv2+TkdXuzhSeEP6vUEF86bOBVCbQGwZXB4=;
        b=Sgri2l50I/Jzj4n3QGaIpO514YkQyXoSmFn8zPUZHav7aZTZpTYUq5VKG5t/rPESFP
         52PO/qGfLajcrgpNdfrxlNUYri486LAoa7e6thriLZHqrAYFddSJ9/BYmH31eORDSCpO
         7tycZm8JyQeSbWudpniEdO7cHu3Bqkk9ju4yB9CqtyquFnE3OxP0L7vQ+LVnfjH7aLQB
         0l8aUmrFXcvLFoz8EeW123oc97DI6y0/KUMIy/M1J5Dz28y3xbBvawf7oSWk2uzcURgi
         SS5QMfFDrNBPeB4zVGI/x1jtepDP1vXSzs8zx3ZmJkzVHHkb7DzA4vRFWWuyK3JuoSJt
         rsZA==
X-Gm-Message-State: AOJu0YzKdcXWCl/B59p/MOQSfObTBj1i8xT75Vird5Hs9IWy66k691IJ
	w2KCdQQK9jg2AJbASOj/tNbH0NRiFO1EHJn7qzHBXIQ7YKBtQGJuv11PSA==
X-Google-Smtp-Source: AGHT+IEWnYGM42vIGO9kmLPz+MbT6rQPvq9ilP9HX23Rb1+s73tzaWB5LWH2AXuvBGFwvO9VIgDKwg==
X-Received: by 2002:a05:690c:660c:b0:6e2:636:d9ee with SMTP id 00721157ae682-6e5bf72c606mr37209367b3.9.1729278799982;
        Fri, 18 Oct 2024 12:13:19 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5c00df1d2sm4280517b3.31.2024.10.18.12.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:13:19 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-python][PATCH 14/68] python3-backcall: Drop unnecessary SRC_URI md5sum
Date: Fri, 18 Oct 2024 15:06:01 -0400
Message-ID: <20241018191101.25184-15-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018191101.25184-1-schonm@gmail.com>
References: <20241018191101.25184-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 19:48:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113001

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-python/recipes-devtools/python/python3-backcall_0.2.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-backcall_0.2.0.bb b/meta-python/recipes-devtools/python/python3-backcall_0.2.0.bb
index d1ac486c0..42a7cb987 100644
--- a/meta-python/recipes-devtools/python/python3-backcall_0.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-backcall_0.2.0.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=40e56b724d016484a7f790ec826d3ffc"
 
 PYPI_PACKAGE = "backcall"
 
-SRC_URI[md5sum] = "1f4c9a370c78743406296f48e56e8821"
 SRC_URI[sha256sum] = "5cbdbf27be5e7cfadb448baf0aa95508f91f2bbc6c6437cd9cd06e2a4c215e1e"
 
 inherit pypi python_flit_core
-- 
2.43.0


