Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED195C44501
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 16:22:39 +0000 (UTC)
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20722.1782663752092399614
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 09:22:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gEeszR65;
 spf=pass (domain: gmail.com, ip: 74.125.82.169, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-30eac9abd79so1144199eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 09:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782663751; x=1783268551; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d3uyLYGRo81QrZ6C9gqhL/fo/WpA7tt+LbZrZxZhiTc=;
        b=gEeszR65LHRwVN2fwdargc7K648P7RjZZ+626eTZAi3TmRZ7lLaif6u17nwS+PmcBf
         t/lvx/zQuLurwUuoWQE5KxNA12xf1D+mdOYeGgZFJ+VRL9ZmljZaatjuDlk/Qnwzqi7g
         cdISnmGDYcO8KByFC9p+TofjmTzE1o3LPw/DqsSS1olhbsTUuqfQAyAJUbyD/aWNuPso
         wSjxgZYBmDEpap3JTWr/qWExUV9iRKTFALH2vWOcnH6Ge8yMsTnRfq/CBnoI5Lb5qVI1
         KwTBWr4+aNyIsAoQA0OnGeJPMpPsQr18Pmxhg+IJTcPvBZIneiopA83MDd4hW4QfP6Ed
         0GQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782663751; x=1783268551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d3uyLYGRo81QrZ6C9gqhL/fo/WpA7tt+LbZrZxZhiTc=;
        b=c2vxfDFdq1Ik9pX5kgzSrf49wrEaok5+7XWAmV/BzgEOMPo4Gpe5hnT1IrOjnormVT
         E01JP0y9KcLFl0NxoUOaInhLIi9kJ1U1bbMc+IxVxjbF/DdOwq5U0ng2cMIRymvT8vEh
         yJiklPHpdj1/m9K/e/UTDobQR1AgT2Cb8kMEQruUrnBYsQtxqisf9D70EvPwuVgf0lUb
         WpUDtXI5U5VkggFu4nV49SdWL5pmHZ1RBxNgtvVh15K5n1omxTXroIYtdgONXENP9lpT
         KhSdNRJigZd1vFj+h9Yi4euW0SMgE8N2M7yjcPmzN3wZmAfTIL/m2sycbEYdGvRk/skp
         IhqQ==
X-Gm-Message-State: AOJu0YyYEjpyeGsZF9GkK/xr2rBn2KMsGICgx0zYLL2VOoXJX8ar8Xs4
	ddjlsDjbEdeE+o2ReQm3bZx+KuIv34pvEkeViMOq5qqNmc7ECwXuuwClH2bfPJpq/M66XQ==
X-Gm-Gg: AfdE7cnmdC3GMDNt36wjIxCtJVTxIVRkrYtEwbhxLR11dbWy+NFl3z5joS58CmF7lEA
	bAdvZd9IIlQK2CQPa2b/IYDnMQvZDjN6djcg+DHac7gTe5bUKaEmZ1h3n18ab08fAsg574uN5YY
	8BJ2ZaxjiSL2Nvk1VwxG6TnyqHlCHOezpWbLPvl0BawFrdZTpckwNd8lt1o/IhrIwgm+NXpl+oV
	rO5Ixb2oqodlcNqzvQv2C1BRfoJNLv2StiKOKNenu2ZrMPL1n/pELWMR7Z0hIbdN+Z+6Idk20W7
	JUcUW1j8JNZKuQ4YNdos2V9JGNmyJT8quAS6uMbTk0mQgqGUng0LWoDPptAqGAuBV0RJt8/hbRn
	aBGYiTcVrPpDzXpOLc8AwNTfWD3c6L1GUjZ2JmRltAeHVcLkKfUvCVeNJmgfWInfKRH1JkhJTHi
	YHRP2N1c1vf3GRnLnW6Cd+MGDPKb/aCioN4ZxFcHtKs5E5Sb06cE4x2KaK18BmggzYgA6nsYJae
	4/i69Juiyf5/0Htjq2rtHqL4dPexbzBi66mCq8cszKsyAG3VD0EUXhDgLWfP4QwTeS8H+Qs32iI
	z6fmw4sPj2HyLCEccfz/f7OVndx2eg==
X-Received: by 2002:a05:7300:a145:b0:30c:38e8:54da with SMTP id 5a478bee46e88-30cab36a243mr9496479eec.24.1782663751334;
        Sun, 28 Jun 2026 09:22:31 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c52c591sm49849445eec.7.2026.06.28.09.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 09:22:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 105/128] poke: fix cross configure of bundled jitter
Date: Sun, 28 Jun 2026 09:21:59 -0700
Message-ID: <20260628162222.4081517-5-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628162222.4081517-1-khem.raj@oss.qualcomm.com>
References: <20260628162222.4081517-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 16:22:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127915

The bundled jitter sub-configure runs a gnulib AC_RUN_IFELSE strcasecmp
test that aborts under cross compilation use the cached result.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-devtools/poke/poke_4.3.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-devtools/poke/poke_4.3.bb b/meta-oe/recipes-devtools/poke/poke_4.3.bb
index 85b3c9b08d..5b80294697 100644
--- a/meta-oe/recipes-devtools/poke/poke_4.3.bb
+++ b/meta-oe/recipes-devtools/poke/poke_4.3.bb
@@ -20,6 +20,10 @@ EXTRA_OECONF = "--disable-gui \
                 --with-libreadline-prefix=${STAGING_INCDIR} \
                 "
 
+# The bundled jitter sub-configure runs a gnulib AC_RUN_IFELSE test for
+# strcasecmp which aborts under cross compilation; provide the cached result.
+CACHED_CONFIGUREVARS += "gl_cv_func_strcasecmp_works=yes"
+
 PACKAGECONFIG[mi] = "--enable-mi,--disable-mi,json-c"
 
 PACKAGES =+ "${PN}-emacs ${PN}-vim"

