Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58E62C44507
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:12:38 +0000 (UTC)
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14747.1782634351057476258
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:12:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Ty0nZxiB;
 spf=pass (domain: gmail.com, ip: 74.125.82.173, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-30bf8b2bd20so4929117eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634350; x=1783239150; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9TvQ4SrBhMVhT8WKVoBs1DfTqg80LNHgJAV0It2maYU=;
        b=Ty0nZxiBXVyryRkKtPWqQR1UpncrL4s0Kr4eTkKxaEv2YzOmz0AaBYGzdWxPUoyNbs
         fNf/mOo7JiDfkvqGf4Y78iyWvtkC9OeMLqq4/0LzzhSoeDLGm50z3Sz1Io1Hii28Ecln
         pICkDPIUTYMKyyEzlYEzkZbAUXfcBeOtbO7/mCB404YQUEzWqO14u33BOxmK7zlkEcyB
         P+CIoUKbb228EO9BGyviQzvVOghCHgblBf0PA4vK4FIPH3+VltuDmuF3HHsS4OD5zgdX
         1S9yafM9uZiK23eIsBJqDuQBMig8tdVNo7g/mDyZ67/vC6vuaFPoxZdjsz3+RwIZPWlm
         1e/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634350; x=1783239150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9TvQ4SrBhMVhT8WKVoBs1DfTqg80LNHgJAV0It2maYU=;
        b=OYcflQc9nvOLySCB9VEqZSNjO01w95D/pVw2VQ/4IZC/GtalU/mWZQve4r7wq3SuEt
         TzkGJq/gKrJNn+C088kt2I9Dx7DqMuXD6mS4Vx5gvNXMe7ZGEvqaKf0NCwy3e6GgJYZp
         OUgaiuvASKv+uiVCPRUc2rBDPoHnYGZ04N1IogDXAf3ijjcK89/vfCFXlCqB1RV1kG/G
         OSVswu5QwT4kS266OsF5ZRyphNUzfUx0IPCxtNdN45CevU2E8JcRZgI/0iwYtO3RH98s
         mozQJnUDZh9XbzHz14gzqLCOVFkets05rfbBlowWQmw6Jz8HuU+GGKCHL4ZdXSFDRPrS
         y7Fw==
X-Gm-Message-State: AOJu0YzOHLuOA4BV5OodiqYAMAs9oUgecmVGGM+cyh/BuUGKAGiEmZAI
	AoYOIPG4ZszjfXtjGgoXJDohyNo6BhA2mRjfXwfZ2U7Hv5wPTGQ92fqE+VNsG6akInGIiw==
X-Gm-Gg: AfdE7cnz/eoaP9QuLCplU9sV0AOIjknpi5N+mdgMES6hUFuEXwMNwlyQbq6RfCel4bq
	483AOm89PBxZQoSDTLsGt+CkSMzDe1MtRdmm9JzshCEEq2dP8xVbPNtZmpSG4sDuy4ZE/A3yiIb
	qHYVlmPNA1bPpbmmHGrR1YZV7KAN6w67CqUgZEpfshpc0Xxe4c5pLP/vZq7j0jthUy4PBd9kPCt
	kN6DHle1ZpMVReUYlvRxyupmbWlrx3gzLEtXyXZBXO4kpNy7jkDZ2TzcESg0Gap9pdjoVg8cjdU
	W87UbAH1VuWK4VzUJs0xpmGYtWGdosnvbYymTZ+gBYy2xbayTCQ4X0pwUOsNfUs1g704h3yfZug
	TuReHdNJYz3kpI/Vk1GcmSDv6vZMb/qIyU1pPb/ebjqMTFIVTD2/OEk4JQMhSjyqY/6ek2Bp3FE
	ljcVBjHmG7bT7GL1bTp9i5oafg/QbEFcCAYnU4C2cY97J1qWzbQUq/4MxGlzm7Wy1eh0w8SSQ64
	+8fp0tqoAUjgDvmzOA1eVetGN3qR94+L7rN7PNzkYfECb588am+nS8bGf7oECJ27AZmxjt5hyyI
	sm7MsDms/uPQNBXoaUrT+91k81M20w==
X-Received: by 2002:a05:7300:818e:b0:30c:ab97:d7aa with SMTP id 5a478bee46e88-30cab97dc3amr6296372eec.36.1782634350420;
        Sun, 28 Jun 2026 01:12:30 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:12:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 071/128] gutenprint: upgrade 5.3.4 -> 5.3.5
Date: Sun, 28 Jun 2026 01:10:22 -0700
Message-ID: <20260628081122.178348-71-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:12:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127881

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../gutenprint/{gutenprint_5.3.4.bb => gutenprint_5.3.5.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-printing/gutenprint/{gutenprint_5.3.4.bb => gutenprint_5.3.5.bb} (96%)

diff --git a/meta-oe/recipes-printing/gutenprint/gutenprint_5.3.4.bb b/meta-oe/recipes-printing/gutenprint/gutenprint_5.3.5.bb
similarity index 96%
rename from meta-oe/recipes-printing/gutenprint/gutenprint_5.3.4.bb
rename to meta-oe/recipes-printing/gutenprint/gutenprint_5.3.5.bb
index f90a123293..82953b798c 100644
--- a/meta-oe/recipes-printing/gutenprint/gutenprint_5.3.4.bb
+++ b/meta-oe/recipes-printing/gutenprint/gutenprint_5.3.5.bb
@@ -17,7 +17,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 SRC_URI = "https://downloads.sourceforge.net/gimp-print/${BP}.tar.xz \
            file://0001-cups-fix-a-build-race-condition-around-empty-directo.patch \
            "
-SRC_URI[sha256sum] = "db44a701d2b8e6a8931c83cec06c91226be266d23e5c189d20a39dd175f2023b"
+SRC_URI[sha256sum] = "f5a9f47de28530b1ae2069cfbc647a9a641baeeabe809bb0ef2b3ec5b9668d70"
 
 inherit autotools gettext pkgconfig
 

