Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43842C44501
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:11:44 +0000 (UTC)
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14714.1782634299415496831
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:11:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=p+D9NPmN;
 spf=pass (domain: gmail.com, ip: 74.125.82.182, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-30eac9abd79so818585eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634299; x=1783239099; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=clQUtWgu9ir+JNixsx/JnE2YtMKi9UF2rzdZqC4C8m4=;
        b=p+D9NPmNX8lgw0qfRZHTxiov2CxTYZUTN+xz+kcnvGnx9wNThLlEnBaXFTPUfCb/Dh
         SUVQOaOzDKWvBc9fYBM5ve2aOfBrgiyIWAdy0PL36kWlTjuwEoZkmH4LTfNuAuiwGSJG
         z9RXmkt06s/qGoPFeLZPatz40d2wnpJO1XSMlxeLYqTlHNskHtQEiBrScs9UETBxkgX/
         iSznJ/H6mlcafBtkYGk9qybGEm0G5IXG8EDpwECzZ3Yys21moRYsTJyPhoHh8H0DGEPu
         +CPm+F3O59vQ30S7HgOurQdR6i36o3IcRFmJ5bcIMjMpwtngV9py+NQYKm7td/SvjWZ9
         Q3fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634299; x=1783239099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=clQUtWgu9ir+JNixsx/JnE2YtMKi9UF2rzdZqC4C8m4=;
        b=Wn6I6r1g8OoJdvy48i1jg6JvRwsW5qJDcj/CtxuL/jXUIkIPuXWbvDLnsx0ssLnvE8
         hN0+z+HCt9IgWu/kAzrviQs/eUdp3w75MI6Fbwm1KP3AX75gghNR1YDrlv2NWH0fSc9u
         4xKDTwHdyUuEQ17OSjJtxKcPOc7ebBMF00XoiR4VNAINAZVFbac4jMHGJE9WFRg7n4cY
         8cPT6dRgX5gQkarXFPNcSDfqX4s/zDFKfJma1y1PS1qyJ4tsADnaxESS/w3nCtHKJkpK
         dS/LFzvS7cVy1E+ZQ+QAuItxbpgcQcv4U726xVmZpOSSSaS0VAJRwIRNjRDZfRh5b1tA
         yWJA==
X-Gm-Message-State: AOJu0YzV2YutxcjpJyPNNo6Q/unrIE865LejCs/mapjY83l4LY9g55ui
	803DXeNo+IweHyKv0Gfxj7uj0JOFsZyc3Ocdy/8+UC70uqQrweLK21yjch3wLW3DpQh0dQ==
X-Gm-Gg: AfdE7cm1DTSuz79qNeQnmrvqIBMorao8YgHoZPAzKhcmJubgMO28tEQRDAh8/MwuEhm
	M0nWoPDmZG2+JtNm9i8Sx08GOG1B9GuqaASwQUFJ3aMomIaOzxUtEPBAbJP7Q6fZrxZ8Gd39bBI
	YPtLKM9ZSZDrvOC8U5OlCO647jAe3RcinrwzYF4+fLFUp8jWqKDV9uBdXHRvA0K6z9xznYGqOzA
	MGr2mhcLsYOtPDrIzR0/x4khsWS8N1wEVpyparDE4q9pmra/UJoERKNjU2ue2NsdP7KjPDK3eTR
	VgTwWkooDnZXPZhJ3mBXmtP4qEd1+yY00pld9xhV2ffIIT1c93VL88gKxMbpj7wbgooIJEHSENK
	t8rNL4oVx9w1zgorh62wfQRHrz/TC9w9YvqTyQLVEJezTuU67CeGNZI2TbkYP7rX1iSQJzlCJeg
	vfSKEI9W4PTSi0J/mAf2M+9gyZvD2ZLWHOlehmIqAVZt3Rv7naOvHkmhgPds/Wk2GVc8yUQyE3j
	KYp/AmEXbvivgc7Ovj1EoiwooWRtWAMlNuxEubDndLGpTQrN3poHQewWLg+pM+S5lwF0XO6nzdw
	wf05yCIRI5mRHhoZb2mLoHtbVIXKGQ==
X-Received: by 2002:a05:7301:3d17:b0:30c:9f31:b614 with SMTP id 5a478bee46e88-30caaf550c0mr6163641eec.8.1782634298734;
        Sun, 28 Jun 2026 01:11:38 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:11:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 015/128] gupnp-av: upgrade 0.14.4 -> 0.14.5
Date: Sun, 28 Jun 2026 01:09:26 -0700
Message-ID: <20260628081122.178348-15-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:11:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127825

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../gupnp/{gupnp-av_0.14.4.bb => gupnp-av_0.14.5.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-connectivity/gupnp/{gupnp-av_0.14.4.bb => gupnp-av_0.14.5.bb} (92%)

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-av_0.14.4.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp-av_0.14.5.bb
similarity index 92%
rename from meta-multimedia/recipes-connectivity/gupnp/gupnp-av_0.14.4.bb
rename to meta-multimedia/recipes-connectivity/gupnp/gupnp-av_0.14.5.bb
index 28e65e1bfa..132e1002bb 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp-av_0.14.4.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp-av_0.14.5.bb
@@ -10,7 +10,7 @@ inherit gi-docgen meson pkgconfig gobject-introspection vala ptest
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/0.14/${BPN}-${PV}.tar.xz \
            file://run-ptest"
-SRC_URI[sha256sum] = "21d974b3275cb5dcf5b8aa1d9a3fc80e7edca706935f6fbd004c79787138f8c7"
+SRC_URI[sha256sum] = "93918fcf5af529fda5b3d2d9fc3b77cd93df88064939b82f249f5577d8de1c02"
 
 do_configure:prepend(){
     # set ABS_TOP_SRCDIR to ${PTEST_PATH instead of the source-dir on the host}

