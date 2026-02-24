Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6268F4BB7A
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 19:05:05 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28250.1771959899107367625
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Feb 2026 11:04:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bC730COf;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4327790c4e9so4468013f8f.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Feb 2026 11:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771959897; x=1772564697; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0mZybY8ejKUJzuWmzbVMLFYqsVlFSkCmeDmW32np0/A=;
        b=bC730COfmyFhOUSSRA6P9tOy+gCNBxZHO/ql/MFXPilzV5QzxoeJW3ppxW8g31O6td
         4+G2+MsJGsVh9hYg2G/T4K2Lg/6GnR/zCcPlB6a4vrUAtCxLjvbRJw5fzWscAEmTk4T8
         3Y6xdFl3xExbTfXZ3G10+d3bHC2nWzorSn/HVa0R8kZw1IbS1L3qXEn6iS42MwQ/gc/M
         sANzgx1plne43Ba2vFKHZ7RXLdDgW96nJMXXav4YTlFgBat0EDDWFBLO09LrimBhDTpe
         EIbqIVm6x4LKdFrAH66QCoPB5OPg2H/r+fqJzb4KQYv/SehLHx6L/W1FGz/unS2GBVcl
         GblQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771959897; x=1772564697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0mZybY8ejKUJzuWmzbVMLFYqsVlFSkCmeDmW32np0/A=;
        b=UpzAq1xDSL6poNfTGpZs6RdIRn2WiVWI+ag05/ySihrVVzO0zw4x4A9McNMs+7rG2y
         Dcp0gqBgchBilvlLKtsuVdg/k2eicgvGt37WsSesB/oclzTCxAVbX5PczusmifcTt/Ns
         2+nHQaVkTmLuIhZC1FhhOK5zQqXrBWTOzd67g+Jbsg5lOllerCH4rKlaLiLgFuP+4gb4
         YCPfGcCANFuS9yzTTJ736vvANalMkVTKgGTaD/Q7FtY00cXLKgSGjx88JXfiHwDHibTP
         tKWFpeTXJnyxFKq4jWZHdtryzsCFHZ8MJY4O2ERLzGfcuqX7i60FrrxtDFqnb9N6Xgqe
         exWw==
X-Gm-Message-State: AOJu0YxwOdGm2QQo4HRIp3Qen0Qjv4qwsuqtLV5SCrHN4wafm5G54ZWf
	M8Pa5athh/BiUk7PiiHq1PRdN9+l0/F8xn0K57wc94PEKfEXL+PuHrRK81cWjw==
X-Gm-Gg: ATEYQzyjB2otRzrgcuvMbUakU1dy8DvMsoZc+PD3TFtse0JTSwlcV8FWvGWWQSF03lv
	jW85l/JxkQdQCFUeBUBxaGfOcMbJbniKNoxv7rGcdo1pfW20XHv9evNGrOClZq1tLktXCVDgLL2
	/m7WOokqrIC2/3iakWkl62OkfrFOg6Y3FxRPKYSBAySHmCnX7KtjeEjdMOnUi9CDq4pf0AgcAU9
	3g9Frut8Hp24j+y7xS147XBzKRKbPw7LuFcvDPsqJX83KEkc57wG5nFmFH+UPYI6QWjarjggRoX
	h9aMtVMSF2E49LDd5nM9JoxjcAFuE4HP78DpM5fXiUvoL/CRFEMg/fXuTw4pHRrBlyk/TgblZGn
	SbemP97zYHwAcbqAW1d8XzoDFBFJDnblT/QtD9GcM+9IJcnGUu1C2nXK1mGHT3tQ7V4YhAjihQi
	VZF9UIWbrpuon9AsKuV5ax
X-Received: by 2002:a05:6000:1acd:b0:436:1964:e3d with SMTP id ffacd0b85a97d-4396f173dd8mr24096973f8f.14.1771959897368;
        Tue, 24 Feb 2026 11:04:57 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970c09897sm29394920f8f.17.2026.02.24.11.04.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 11:04:57 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][whinlatter][PATCH 8/8] minidlna: ignore CVE-2024-51442
Date: Tue, 24 Feb 2026 20:04:51 +0100
Message-ID: <20260224190451.1596179-8-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260224190451.1596179-1-skandigraun@gmail.com>
References: <20260224190451.1596179-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Feb 2026 19:05:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124596

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-51442

The description of the vulnerability says "attacker [...] execute arbitrary
OS commands via a specially crafted minidlna.conf configuration file".

There is no official fix for this CVE, and upstream seems to be inactive
for the past 3 years.

The reason for ignoring this CVE is that the referenced minidlna.conf
file is in the /etc folder, and the file is not world-writable. Which
means that this vulnerability can be exploited only when someone is
root - but if the attacker is already root, they don't need to resort
to minidlna config-file modifications to execute any command they want.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-multimedia/recipes-multimedia/minidlna/minidlna.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc b/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc
index cb2a1865e8..0dd297098c 100644
--- a/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc
+++ b/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc
@@ -43,3 +43,4 @@ SYSTEMD_SERVICE:${PN} = "minidlna.service"
 INITSCRIPT_NAME = "minidlna"
 INITSCRIPT_PARAMS = "defaults 90"
 
+CVE_STATUS[CVE-2024-51442] = "not-applicable-config: vulnerability requires root access"

