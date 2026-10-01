Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5528ACA5FA5
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 10:07:00 +0000 (UTC)
Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7538.1790849218695638295
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Oct 2026 03:06:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=TzLnporS;
 spf=pass (domain: gmail.com, ip: 74.125.227.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2e2e35ee682so6522245ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 03:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790849218; x=1791454018; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Umn7tSMUKIQD3mrZtN7ZZpzS1hwrb+VtYlyRtQFejck=;
        b=TzLnporSc1PHSg0KJFFaJpFaZ3aP5T7DZt93FTCWSgJa/k9oyC3wWXfu5Me9MabkPJ
         HwCfYVjDsOoGF3ypA9k8tVcQbtBMU3ETeTS+cY64KuGQGFwMpoiC/xBfwVpYtx3ME+G7
         ks4rpLsaxb3INHsRj+zGANWCV/qXUMIQwBVw4hCgRLQTlRwA3H8N2A5IwoeZ+EtojhA3
         J9iQY3j1JzYsujlfw8+bFPOTdgFOsS2h/ov0hmnX54LN0nPE+cqBW1NpXNZk9++CtlK4
         U8DHpk+gcL79mGKPPlFfD13gACyR/HsynpZPO08JHmAz6oxELzneGOa4Yz58DMPubzx6
         feIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790849218; x=1791454018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Umn7tSMUKIQD3mrZtN7ZZpzS1hwrb+VtYlyRtQFejck=;
        b=Za/fFiaT39JASFe0ZCMlEg5ulNvJR+80oRyuYmHH5CfExAxyIHmLP+IUwwfmFzOzzH
         BEBOf+55jvLsEst2a+rT3h7POVM7c2i9L4glX+eaK/gwfoXYT5CUJnG8dMPobTK/Onr8
         XojbNeNU7Ar+gxCKSxD3Qsqn/HEVnr7pGJKzA+byqRXfDWxcb9tKpD4mgw5zHcJCxCif
         DruhWd56GPuyc8K7lbp9cxQ9CaUD8sCB3R3IJzFSKA4StzSHX55LKqVVjPZSc1pBzmH9
         ik0Ffi0wvtwbtcpBHfHhVhyOwhzanr7hZ6djy61WEcGzAhdn2npMSo5jAcOT26FCpwIU
         xjXQ==
X-Gm-Message-State: AFq9FYJrLIsgAXFGpPpEdKJ9CyZSYQlnD4/vQZF61zu7y3GSc8nHwh0h
	TPYQDsu9HeDcKDlEAqkvfYzgngXM4N4qbhkr/+wwpLx/dYCyNg9mQWp7e0obyQ==
X-Gm-Gg: AYBFou0W/JrG5v/DbEQ7YrM9wMu0G5NnTZCl7o5+2tIU27EDE+xpzHZQndmLbzZV9YM
	nhdtBPwqHmr5sRFPKzV6tR254ILdPJTgeTieuAJWycqcwabQIfu9g4p2JPLWJ/P1+viZ5k7BPae
	ox0blv347llVNOpt05mqtv0jJ+Hcntw+aUjfvgRVrFMIJDba+hnEkIPWIUmborQnMSid6c7yOZF
	WvskS7vivG0IDyRShhvQTrS4BoKrPXI8DqhKyBJy6u3rcfJPzBrYXa5100vW7l+D7s1w40+xv6H
	A+8SpAnt0SbfoEasgX+Cwfp3W4cE6m2MZLqacBrxW1mVVbfkETvWqNODNumLb4q9ctpIw8GbfZU
	+1otRMbl9DTozVAMeEe0xS2KOoQy8K3JpgyQbfT0/nRJuydJ8DHauLSSxA0u8AQjTGupf5lrVTM
	R/P0npKcZRQwVlNSJu3eB+Fl84yot9/bSlCyfX4tB8cI5X6TqUdW3tFczikvMI82WQuaIcyntR1
	Mh7m+P2egPDasWMFvyuGcoeZQ==
X-Received: by 2002:a17:903:94b:b0:2dd:ad74:ac34 with SMTP id d9443c01a7336-2e2e4b35e70mr33662495ad.29.1790849218053;
        Thu, 01 Oct 2026 03:06:58 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e30058a6d7sm8697765ad.4.2026.10.01.03.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 03:06:57 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 8/11] qpdf: upgrade 12.4.1 -> 12.4.2
Date: Thu,  1 Oct 2026 23:06:31 +1300
Message-ID: <20261001100634.1992725-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001100634.1992725-1-ankur.tyagi85@gmail.com>
References: <20261001100634.1992725-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 10:07:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130574

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

https://qpdf.readthedocs.io/en/stable/release-notes.html

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-printing/qpdf/{qpdf_12.4.1.bb => qpdf_12.4.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-printing/qpdf/{qpdf_12.4.1.bb => qpdf_12.4.2.bb} (94%)

diff --git a/meta-oe/recipes-printing/qpdf/qpdf_12.4.1.bb b/meta-oe/recipes-printing/qpdf/qpdf_12.4.2.bb
similarity index 94%
rename from meta-oe/recipes-printing/qpdf/qpdf_12.4.1.bb
rename to meta-oe/recipes-printing/qpdf/qpdf_12.4.2.bb
index aa35bd4725..713214ea7d 100644
--- a/meta-oe/recipes-printing/qpdf/qpdf_12.4.1.bb
+++ b/meta-oe/recipes-printing/qpdf/qpdf_12.4.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 DEPENDS = "zlib jpeg ${@bb.utils.contains('PACKAGECONFIG', 'gnutls', 'gnutls', 'openssl', d)}"
 
 SRC_URI = "git://github.com/qpdf/qpdf.git;protocol=https;branch=main;tag=v${PV}"
-SRCREV = "c37f83ae468abb6cc741f43b2f6fdeb66e550ffb"
+SRCREV = "4eba95899886e851cc41d76886483b347612f2a8"
 
 inherit cmake pkgconfig gettext
 

