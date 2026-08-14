Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23F03C5DF70
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:45:56 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24344.1786747552965532938
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:45:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UhMhHwWX;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso2328206a91.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747552; x=1787352352; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rBG5IAJaFc+mlTdKTLFhb0A38tL+y8riEb1TYpX+CEw=;
        b=UhMhHwWX7kxondYGgGvZtUrIyXGaud1B3b5ci40GFuJUxUvl0r6GSHWDg1RQ0/hRl9
         pkQAX/OIGnOhiCcHtPj3sqJMa4yFQGsmi3c2WMIfl1cCmH8YHqisLYTrQC46ho/gVSSV
         y/L6TV92UMPhMJlYcZhdHVn6ucjladBfazyaqKrU3Rli9rPknrEmQc/wzWspMtlCSVDk
         ucE8Jo0DN0z/wsKeNhikGU12OclNPt3u0zyyW83MaTiBp6b0IYJQAWv41ovJ4moEF+pl
         EGl4hyYFKV6M0ZsOk9/yB+8BfgfBQREHUtYjYLoOfrNqbB+F7iSY/B50AzOtpUYz1EEz
         WosQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747552; x=1787352352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rBG5IAJaFc+mlTdKTLFhb0A38tL+y8riEb1TYpX+CEw=;
        b=pSYFfrJupqTrReIX8z4LaaOx3xqkQADPTzMKh0n5Gk05dPhY709F09DGzY0q0J6A4U
         zqHexJXzrEEmCcvhdjQkvVTNnXFaHarGIzI/olhGPgbSWtdcEmy1EW8Xg4RWGKFp6fXM
         JXEsZ3z3C49rSZ/cyJUdxqPjSPqkPZDC6lHuOdXSy8Z5L1JZ8Ere9iApTY9I9OvjAAxD
         VRTHQeMxH1hRlJpDWtg0S+OLRT/5pOGiCTgF+7aOjSlBdJ0qGGc9/GzTHqp1x4QoEMuY
         aPK3g58BedOSJuMwtNDZc8/cpyp0iwPzkj30FUtHjWC/5klfhoqJkMvAxUBgwN6BY7Fs
         UI/A==
X-Gm-Message-State: AOJu0Yx9HgGMjkaGISP+fDCtkKzalj0CHAp/PnhVRKhTcwSpWNVs49Lx
	iZfcRIbJcoD+eok+PbgeiYzJdEizLaCvD5fc2A9a94SSVMzHHqlBAaSME/ZMDxak
X-Gm-Gg: AR+sD12KFAvrGYjIbihtyHPm91InlkcMCl7OGbx0ObfTIly4/JxN4JPWHymzezdeTsh
	1efmjDJJ51bUHvOt+g21ouyMz/aEdmDY0emhxObqtDcmysgCDQC5OXrgpcTds2Ce2GLs4QzeyNy
	Z/Ajb+owgvaV+XxX7qxrY3wJHSRLPDadCidjCtqxVcmuk7XcHl/n/OBk8XRlYB/L9N+AOvuLxh7
	ZSwWDPfPljfQ+NLFiS8DWDgCKu+NAbmS7kNlq3L/s/akAsAX+B7MCz0F7mpEchvlQN60wDzUeXW
	zf+GHjSMWD3Z4RzT7o+VRGPlFgiXo5ib3S26XjjVeNrWQdJQLnXfjfi8cz7k9PWK3yGcBQbE1cu
	WyjJ/8aI3JKlWnrnIH03cBIqm9Kbrftl2pg5DHsAHR/HWtWCq8/5uhX+M+bI1XDQhMdIDzk6p9Q
	SImSMHShVSSNzp6Q4AxDiRakx/i6zGHF1DV1jHTR35S6RJLghsqX8ikAeDxReXgfeWPS7PfPx3j
	2st4UlZJoBiSOkN1aBJrj06QgGmqGfRWf3EjcJvYuD/yxLoy0mAHcKSf4iPd2GPNCUMLstpPBeE
	FRBHYdCZIaBXQ697SE8EZfE6jlw7dqWSJjjgeXKlDpIdOekjjAi0Ln+meL68JZP/YWPdBgt49RI
	JVUIe8TQ5rk9qa/7EVL9YUaHBsYmmj7V+n1eXjnkTumrzMg==
X-Received: by 2002:a17:90b:1c0a:b0:38a:c3f:3b87 with SMTP id 98e67ed59e1d1-3933b8721acmr8185051a91.12.1786747552284;
        Fri, 14 Aug 2026 15:45:52 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:45:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 008/109] ser2net: upgrade 4.6.7 -> 4.6.8
Date: Fri, 14 Aug 2026 15:43:54 -0700
Message-ID: <20260814224539.1523174-8-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:45:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129072

Upstream added a configure-time check for libcrypt providing crypt_r()
and now unconditionally links against -lcrypt: auth.c uses crypt_r()
with a struct crypt_data for verifying yescrypt/scrypt/bcrypt/sha512crypt
and sha256crypt password hashes, so the build now hard-fails with
"No libcrypt with crypt_r()" when it is missing. Add virtual/crypt to
DEPENDS accordingly.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../ser2net/{ser2net_4.6.7.bb => ser2net_4.6.8.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/ser2net/{ser2net_4.6.7.bb => ser2net_4.6.8.bb} (87%)

diff --git a/meta-oe/recipes-connectivity/ser2net/ser2net_4.6.7.bb b/meta-oe/recipes-connectivity/ser2net/ser2net_4.6.8.bb
similarity index 87%
rename from meta-oe/recipes-connectivity/ser2net/ser2net_4.6.7.bb
rename to meta-oe/recipes-connectivity/ser2net/ser2net_4.6.8.bb
index db442e41dc..9b6094e0e6 100644
--- a/meta-oe/recipes-connectivity/ser2net/ser2net_4.6.7.bb
+++ b/meta-oe/recipes-connectivity/ser2net/ser2net_4.6.8.bb
@@ -5,13 +5,13 @@ HOMEPAGE = "http://sourceforge.net/projects/ser2net/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-DEPENDS = "gensio libyaml"
+DEPENDS = "gensio libyaml virtual/crypt"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/ser2net/ser2net/ser2net-${PV}.tar.gz \
     file://ser2net.service \
 "
 
-SRC_URI[sha256sum] = "6b921bc7efb1b9a8a78268d63332701902cc1c8dbac51842d46ede6ffb5fa2a4"
+SRC_URI[sha256sum] = "e651adcc4cc0d0ceaa36e5997dab9ea7f8aea732b4c87ba6018d2dcc88fbe8e3"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/ser2net/files/ser2net"
 

