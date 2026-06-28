Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D76EC44503
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:12:38 +0000 (UTC)
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69152.1782634352007708743
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:12:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=p/+aifXY;
 spf=pass (domain: gmail.com, ip: 74.125.82.173, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-30ec1ddd510so322696eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634351; x=1783239151; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Znt6Ym7K2XIE5FEyDZdBab2aN1GIPeZvOOj2loambaE=;
        b=p/+aifXY5MUbBoV4uuL+/IdrG5qwvhjc3JGfSapL9KGonKUOyS2hA9Z50+1IgTblfp
         nroIH/nVBVIbbxS28uECTGYIm2qVGcVVOlGEWMuqZz757u5P29iAuRHucTodYyh0qD/1
         Z0OXaT5N5GpAXr//HsK8NWGcuLvfMgdV/qadpk9xzQYqmV05QPP8+4j1xJYuL6Ym5Vri
         wrqY4cuMgjmtdWzEReUXaEp3SMyUA9BBwKchmEt+IIVjTDmdIXdmDljIc2ezhgdUez27
         TqGy1X5Z7UpO6QEiTSIyC/ENzKlCPpbh6FI3bPzmWNbgb9DSrj/czz3vWi219v/DTJbU
         yIkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634351; x=1783239151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Znt6Ym7K2XIE5FEyDZdBab2aN1GIPeZvOOj2loambaE=;
        b=jmJysqOfiHqnBPTxwK0A890YDs4wQjg/ENjXv5SKjJ4ptohigHYryPJfsnCgRNUaNV
         gU6fA03NlPmjJEkCL0rM9Wk3CDk8+EMfztaOfSdvl//L9ZLcRj5x63FCVLMV04w/TewM
         Es6PLuATyAkMDF0d1lscj++f3RhEAjdCANdrFr/3QYoGLo8zNUcNbny4Bb0zFt3Mqg+B
         O4XKbeL5IJvH5Q228n9ycn0ZmEOp8TtZYt3R+aU62ky7wBH0ri9YQvp2Sb5Fv7J0HSSI
         q3kp6fLijHSQlSnDnQ0d6QmOr+nlnSYRVO7lL5vZVniSh26mKPeQB9vcHzgT/huqCasi
         TPsQ==
X-Gm-Message-State: AOJu0YyTUCYNAljyZE6l8paf65xc4kvLLCtzlCNxLvRo1FMIZFkJ3tuw
	HME4fp2IOjPrgDrOMs0Lj7unTSOIKe6NGUvP6xMY7HrMQOEhyatWQUA+ae0pU+imCCavhQ==
X-Gm-Gg: AfdE7clxMCuYi6CFedvkWbTDUxKgCVswJn3iq0cuVhTR2Gbn9OSIAh0yuLLYhrxJHQR
	N3jWbfkXU3fuupwXX0EFgYW2f2sSI8pr9ZpTelEdBXW5kuSCRCKnHeZV6BJcjQ4kxrpw0E0YT8e
	scdGORddckN819a1AMHdEhUuZmwjdcJue+qftXuDyUHtm0Edh1HZq2RhhRT2olV6BsECeSONCm1
	WKKoehdT7iWSNTMmEcI70tp56f/NMaesJ2UxLY9L4qlv9WmDb8hXrcyeCwWRjdk95PZqEKVMbgo
	3urbokugKFDF3v9C4FW7inllXzF42hWIx9vaPOshvS2IaMZ7uHhcPX/xRAFTx8fTArH7UPWKGfb
	ZwaxVlrDYDIksQrUOQxf719ZwvXmBwDyw9ypDCIGDjaO7BXOmSbI6nO7gYYrmQ8wbbJ927FFHET
	JPc+2X4VXjw7d8sNYY18FdK1DZlsbNKyQM0xsq5Rueh4EXeJBRrYQlLM5Ij5RABVoIW2WfAlopg
	nBzM69JRx7+oLGAR5FaR8M4EGjT4Vp9MzGcDN1/79HUzli5OFyIbpM204HS9CQ/gLSdyVPD3uGq
	f8iNCotXk0kGzIm4dXn/kf69SWwRrhfF6gbOp9/R
X-Received: by 2002:a05:7300:d021:b0:30c:536e:3a8a with SMTP id 5a478bee46e88-30c84b7208amr11492102eec.6.1782634351311;
        Sun, 28 Jun 2026 01:12:31 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:12:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 072/128] neon: upgrade 0.34.2 -> 0.37.1
Date: Sun, 28 Jun 2026 01:10:23 -0700
Message-ID: <20260628081122.178348-72-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:12:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127882

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-support/neon/{neon_0.34.2.bb => neon_0.37.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/neon/{neon_0.34.2.bb => neon_0.37.1.bb} (95%)

diff --git a/meta-oe/recipes-support/neon/neon_0.34.2.bb b/meta-oe/recipes-support/neon/neon_0.37.1.bb
similarity index 95%
rename from meta-oe/recipes-support/neon/neon_0.34.2.bb
rename to meta-oe/recipes-support/neon/neon_0.37.1.bb
index 738b029a29..53790e6ac2 100644
--- a/meta-oe/recipes-support/neon/neon_0.34.2.bb
+++ b/meta-oe/recipes-support/neon/neon_0.37.1.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://notroj.github.io/neon/neon-${PV}.tar.gz \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "f98ce3c74300be05eddf05dccbdca498b14d40c289f773195dd1a559cffa5856"
+SRC_URI[sha256sum] = "a99b7262525a454d1065cf76dd17240fd808dfc4ef15636990ff83a5d0d9e740"
 
 inherit autotools-brokensep binconfig-disabled lib_package pkgconfig ptest gettext
 

