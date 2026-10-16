Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE409CC6B38
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 05:29:46 +0000 (UTC)
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15176.1792128583670360203
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2026 22:29:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PdtiZ+HW;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-35f036b17easo1635718eec.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 22:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792128583; x=1792733383; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BnxL3NT9Yj+pEov189CW1oSAKzybRdlh2iZmmp3e+xE=;
        b=PdtiZ+HWicsPqnqVNY+tXj2q0tMc6Y1KcuUjCbm/R0Ih7c78Zedu3JbvNa+ELyBAta
         h0v11MXd5n8KAOxafXoBpVr9ewPaQrcWNtvQk/B8m3Cy1YiwSKZzbRjiRXVnuHdm+6we
         ZXw85ZAOvLUWxg6YalCcaTryu0OWkcSBB2cLWDN9ndw6yAT0eGggx0OJBrNQOmbpEB3q
         jUU6VMdlg6sd6dLhludSXNax0k+1GubF1ld0m73mwXihzJbj0C7LwiKCl/aX/kNqdlWv
         rBP4HMLzgKwj8zX/N8c2wjgWIEoz+ZdatBIJoWwcnBdt4+9eTb2tOzB8lAhES+CBv07/
         62/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792128583; x=1792733383;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BnxL3NT9Yj+pEov189CW1oSAKzybRdlh2iZmmp3e+xE=;
        b=tmbCz0fxYp3x8H2ShJSZIyfk3y3bgBzTSAyidP7vCwT7rHSVKRS75EKCMoCidjiSuq
         rRuJGfJ6qs6g/Ti2j/dEwfgukGFPVz/AzxUYPMlEfsGMWMMZoOXypUmxcJ5PHySyepUF
         Vf1BD+JaoiMG5r+PifE2FXr2F7Wm2LAKyvUZu5qNaKfa9/aVuwH+gjt1xmb/RceCJ4+O
         auSf/0gHvgvOBMSGUuq4JTrV8ILz43PMbRryjIiQJi2HjwHm8C3FRYPAa0ZbjnLgAuCy
         GR2SStnzHtym9ys5MAByTWUrTBT80ZotkTumMQ8QmOXkpkmXhRMo92P3NsADs2UYuGLT
         A4BA==
X-Gm-Message-State: AFq9FYJDlcRtwkU7DLs60uK4fV0M+WmsediMj6zPcbi7r7iv+2VMk+/b
	Cr7jm8n9vqTfptTjC4pyE+1mCf8GJdBzdvl20PtoE2zvkSmXhNO1J2kEDQb4EH8QoEM=
X-Gm-Gg: AYBFou1rygoM2WdB0Gbhk/lzEkD5osKA6+GaFv7BtuwKdAjYsmACBNCyAY3oe0fSMgS
	aWcYXP+DNKyTPnUCGUSFzDJhi6wB8H2+MtP/+wahTakg8xgRLSHmycswprrsC728O6nCP02JESd
	QYQiMgL1U9zJb2tYfxeE49+iILtfts8VHp1GZi+pJp2R2dyOOGi+XSIsBf1pj3KDXh8IEL1AZVI
	XPwJqFnDs25Z37Cu6ffoNrbIj3uNl8e8RAkY6x4mXZ5+7a0gS69dn5Fh0TbNalmin54olxBDPzh
	9lX7y2J3Vz3VS76rS0ukc0gXLb46eXdppOs6ktmOLmrk0HTj4APsDsBBnuc24X9R91TE22hvtZH
	EGrZ6ZsjjjQZwikEUIABY8zIBkvYV9hSAqIvGTMZlQV4dzpiNhqPzMsy1bDUp05CE6b9YBw44js
	8kzgRsuGWkBiuhYOF1FI2Zwi/36NFFw9D8jzrygxffUs1fi85Ez+et3ImUmqh8qWVTTa4zJ228h
	i3oSxqzunJGHDRS1T98bToWn5oflZIbNC0yGYGIL5uCWJOWP+iAMthk79OJ3Bhi7g70q+u/tyZ0
	JkoJ6a3dBsOA3tQDPz/X2YuQClYnIt7coCksvzq9muy5nICkYuflZmbdUrxh3+cmZXfrPhk20vD
	Q8e91kcXBTonT99zAqVuJrvMl3eszu+EJTr5P0OxSMSGim/4PRwflJWm8P1YD0RbWakOALHJzSx
	HSiCs6J4TeI0SQW8LG6bs76lmoQ64LjmMYqbrOqV/M1nZ1PA==
X-Received: by 2002:a05:7022:3a86:b0:163:8b44:902c with SMTP id a92af1059eb24-16a6250bc98mr28293655c88.17.1792128582650;
        Thu, 15 Oct 2026 22:29:42 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f5a13sm3132878c88.12.2026.10.15.22.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 22:29:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 1/2] python3-arrow: Add python3-zoneinfo to RDEPENDS
Date: Thu, 15 Oct 2026 22:29:39 -0700
Message-ID: <20261016052940.1212651-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 05:29:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131052

arrow/parser.py imports zoneinfo, falling back to backports.zoneinfo
which is not available either, so importing arrow fails on target:

  ModuleNotFoundError: No module named 'zoneinfo'

Seen in python3-construct ptests.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-python/recipes-devtools/python/python3-arrow_1.4.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-arrow_1.4.0.bb b/meta-python/recipes-devtools/python/python3-arrow_1.4.0.bb
index a967f9e429..ea3c976170 100644
--- a/meta-python/recipes-devtools/python/python3-arrow_1.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-arrow_1.4.0.bb
@@ -25,4 +25,5 @@ RDEPENDS:${PN}-ptest += " \
 RDEPENDS:${PN} += " \
     python3-dateutil \
     python3-tzdata \
+    python3-zoneinfo \
 "

