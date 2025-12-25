Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D518E7AD65
	for <webhook@archiver.kernel.org>; Thu, 25 Dec 2025 16:35:22 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.140419.1766680518217983005
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Dec 2025 08:35:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UcPcyMEy;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42fbc305882so3309475f8f.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Dec 2025 08:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766680516; x=1767285316; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MG780LHQT4kl788ho8u56qzKh7OpQSU+hUE/WADqAy0=;
        b=UcPcyMEyL6jJO1Q+nD26a3Kh7q+DE3FhWVw3KN5CXCSipxc+7/j92wxjOYig82X9Mk
         HZyzAYLfbsHA0jltp9om4JcUm8X2jBgmxUzkmLmLv/5yjJE8MMMj9CNydb5u1r2Y/ryC
         Dn4tYs9k0Vnpr9xQaS70LmHsOamSLnY2XC4lCkCpVrcXspQJgUSVJuB6IJuFh5UGtk44
         kkl2HXdhJTRcyHK64MKBPBJ+VLuwYWo4xK0UxA/MESZQKUr4jZRSzJLOhBPx7u64BfjY
         QS1p3sGEosb77hlXmXmaX3A2a4FsHQjdMlLGDMTRMc8Fji0dFbKeuH70Tf1RiB/wbqYX
         Gk9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766680516; x=1767285316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MG780LHQT4kl788ho8u56qzKh7OpQSU+hUE/WADqAy0=;
        b=hWb/oYTrMhiPyClq0nN0Mx96QQ6V8au78pLrEfJD0ciX6NjQBIraDIHBCeYjpeq73K
         SIsFBuWNx1dWM20yLQUUefYTAqMiS+aRFMX8xEOTfq6/76kvkSFkXPzzC1hL/In1m84L
         /JW9td6HTXN/l67fblVuhpdlDQntNqY5d7ubTO6WjAsEGSMRGlX3OQ3iCrUEAEVMBk54
         ZA+hczeeTmi09/ag24dNWGHZQ7+AqJRiT/E9NDRq+4KOX/t8HB4UDL2Wqu582pvCk+x4
         uDsqKUZp14PdoDKXAlLoe4MNb0oy+wwQZEuHW/YvuwUcC3Yw7xencgNRuhbvzJ1pStqP
         q75g==
X-Gm-Message-State: AOJu0YwefH9TFuhOenBN/Bl6i6/qWSWoWs8KmTUp5ogcri4bY4QwCQGh
	7HeOy8zRpHyfTkOAcGxlAlocVRatdZymVDHwNSCW2cO7y1kHGNfOyt9kz9z8pw==
X-Gm-Gg: AY/fxX6bjyZKKC+4kb9eN2y95TxSzvMTp9cFnhkStAIUCg0vfNrX03ofiCPsjD0xuFT
	zUPH+ei87SeL0OKjufbN1mDroWELtm3WtUPMNgNSyx8+c2b6GEP6KlcrIH5hEGzzYPJP+FVETEB
	8SLEgyJMKX4+yaSkWOJGyTP1gEVfLHdDb6WpO800GGCV59J58MhUWoH2u0o5ibA4DP006H28kHy
	cmD8zHxOwJ1agtCFu8NoH8hqBs66np7AIS6sTno+I/Lz+NRSkEE2XuYLG4bUqTphz8QU3HRYryr
	GIcs76u4JuaxeIpE0wnUpYBXFn8g+EZxcJp/g+lsWQZ/rK3cKQXPEbJ8acFubRcSbZ9wqNKyfN5
	ug8pwPLV1fejc/T/qf8gq/2sQgladZwknNSL7aYq2OOMJqq8uxsMAK3C0Nt8GAy8Wk9oTp56Zam
	P/rfV+TpuI
X-Google-Smtp-Source: AGHT+IEadgEfJtVb2IMiBqDKUcswoSjT08mrFs4Uw+WUCPUxQ9TbXsR9C28iAiWz34K9S0ENB9mgVw==
X-Received: by 2002:a05:600c:46d5:b0:477:632c:5b91 with SMTP id 5b1f17b1804b1-47d1954e3e4mr252349295e9.16.1766680516305;
        Thu, 25 Dec 2025 08:35:16 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be27c2260sm393937625e9.15.2025.12.25.08.35.15
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 08:35:15 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 3/4] tigervnc: ignore CVE-2023-6478
Date: Thu, 25 Dec 2025 17:35:10 +0100
Message-ID: <20251225163511.3087783-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251225163511.3087783-1-skandigraun@gmail.com>
References: <20251225163511.3087783-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Dec 2025 16:35:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122929

Details: https://nvd.nist.gov/vuln/detail/CVE-2023-6478

TigerVNC compiles its own xserver, this is why this CVE is associated
with it - despite the vulnerability being in xserver.

The vulnerability was fixed by [1] (from the nvd report), which has been
backported[2] to the xserver version used by the recipe - so ignore the
CVE, since it's patched already.

[1]: https://gitlab.freedesktop.org/xorg/xserver/-/commit/14f480010a93ff962fef66a16412fafff81ad632
[2]: https://gitlab.freedesktop.org/xorg/xserver/-/commit/58e83c683950ac9e253ab05dd7a13a8368b70a3c

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb
index 4455050631..89704f421d 100644
--- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb
+++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb
@@ -88,3 +88,4 @@ SYSTEMD_SERVICE:${PN} = "vncserver@.service"
 
 CVE_STATUS[CVE-2014-8241] = "fixed-version: The vulnerable code is not present in the used version (1.15.0)"
 CVE_STATUS[CVE-2023-6377] = "fixed-version: The vulnerable code is not present in the used xserver version (21.1.18)"
+CVE_STATUS[CVE-2023-6478] = "fixed-version: The vulnerable code is not present in the used xserver version (21.1.18)"

