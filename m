Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10281.1795752832151040629
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:13:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=M8YE/B28;
 spf=pass (domain: gmail.com, ip: 74.125.82.174, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-386ab9ab619so10376279eec.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795752831; x=1796357631; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G2K9SGeSVucdUIE16op6r5U3At+D4+E0x6/2E+8001g=;
        b=M8YE/B287GQJC+An5/czSIfGFdx7YrgaSrXfRsyCZ7qy57c7m+87qHgTBPaPJVx7C+
         BSvqP0HeWeoNpFhtPX12+uVrJ4ZmgqfLX8mjGz9XiQejbYT4HZ/81SgymPCoIXudEYNC
         liPWkgZoVh7CVWp98JfUS64bXQxNzGK2HF6UdodAYgNZCNST9Op7ZsZlUiqe6s8gxD3x
         8nr4D84QcrH6cUkGT0JQjrPzAbsXLpzwELQpZicf/UpK+Cm8URxrSEaMN/34C7Z67FoO
         uweO15OFBziI50sTNTnfEEtZRnoWR+ojuSy/+xNopOVfOGyXFQZDucv7C0Ikw5xFzZdH
         i10Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795752831; x=1796357631;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G2K9SGeSVucdUIE16op6r5U3At+D4+E0x6/2E+8001g=;
        b=E/oe83nGg1iObEM94OypBnS6r2IprpHbucePfVztLoItlQtZ95xHdyADD03IDa0bBO
         FdbNumZ5jO433+gwRgM0bU63jP9Wo94xQDOnvd5E6MG50q/fFu58AopHLWLKrt2yedLt
         hgVG3c/elTaka2Om2jG/ONNFHSpC3uAONkz016bVO00UfIuQRSNDH6MsXrw23BKXY6AH
         DAv3LWfujha3nWM9sI3zV655oJURXtcoHSFa1lluwnWPIhhGyghPokHkWYMvKF0boFKC
         u5rvBjwbsBC4CwE7sbBHaBFbylHiKvkY+f3nUQUdBa0XdHV3i+dDD3sTcFpyCz9aWDMS
         qvGA==
X-Gm-Message-State: APuU4Z/kAJANHJ8OqunvqZkq2RUcldRYAPTgpVWdFftJhbl9ORlI5GV3
	Ml4k5apYDLd/f1bSb5Pe8h7x2GDJyiaOHpzH4ZN0QeGMqh8/NkZCum6Dv/D9atY5
X-Gm-Gg: AZFdTZe507Iz8ODX645gmGpFdUmxkrVWPMAUwDzqLT+0S70NE2NgRBzqDw53+dJoJ/x
	PtvIL8DQRbwBp1Po7rvYdFw1DzPErvP0X2t8XCX+mPf0XPJNpZxxUrSEtSswNKb5BzC0MG9D/gQ
	l0bLO7cw45ccOllEximTY4JXO3cauFdnOnj1t3vbW/qRHVbi1vp6AiVwhzRzC8yehK8Lvy5lgv9
	nVrBj5sAsPDh24k1oqRaU66Kx+tL6egTlLS1N95ew1IUtIBd3nhOpKULDmq8HBrFafhR/dFfhyk
	z9/vc6vaJo1KRb5K3BbGlB2lrFGApfqh3dM+2uBq/v81JcHmRb6gQ4liWEPygWpsrKGdSPlu4bg
	VMDHooI0FpRwMhk1txr5Bo1d89M9moWXia6jHEFtu4vBCpakLnjCz1IzLMqs85oA02UdxI/2JHe
	r5AUX3yx1+RlBkPANgVGUr4Ta8d+WaWH7XlNMqGZN+a9of47pMEGDgfgphtCky3BocogvA1o7HF
	twLEYtGwALCClCWj/vlQxETyY9GmQbZ/1n79nN0+9wdGr8I+8mV2yLSp5+mGdxSEkJTUgT0JlpJ
	+fWdpBpdIpzcdYnUEtZY+EGfID8TawGCPJ3YGMVAzIna6/QkdruQWq5UUe0JXHxUexLjKzcFMm/
	gf8guw/MmUxbSxmuboBbEi1azq1lgGsF0Lmr7BBKRiLZrWu8PNRYbGf/KSCb7vahn6eiJmERFuT
	ho8gVydOpe5dP4SxQ2ptr3C0j7jG67jB6KOcuuFQWfqx0xBin9CdOFa9+Qlo3t1ygLWbgc6tckf
	7+986V4nTjY0scVMPXboXBL43ieJ7P+jlCQRE1rOOWS+rsc8BFRI0WNdW6rAbWQhKEvEvV82fQY
	Fa6wi5lWzREC+W5MiJSCw6bK+mA=
X-Received: by 2002:a05:693c:8813:10b0:385:cbc5:7eeb with SMTP id 5a478bee46e88-385cbc595acmr20194193eec.15.1795752831212;
        Thu, 26 Nov 2026 20:13:51 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm70674179eec.6.2026.11.26.20.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:13:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 29/39] simpleiot: upgrade 0.36.1 -> 0.36.2
Date: Thu, 26 Nov 2026 20:13:33 -0800
Message-ID: <20261127041343.1772294-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:14:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133199
Content-Type: text/plain; charset="utf-8"

Dashboard widgets are now ordered by grid position on a phone, the
slider widget is reformatted, and the UI updates @sveltejs/kit to
3.2.0 and @sveltejs/adapter-static to 4.0.1.

go.mod is unchanged between the two releases, so the generated go-mods
include stays valid. The version check is kept as is.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../simpleiot/{simpleiot_0.36.1.bb => simpleiot_0.36.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/simpleiot/{simpleiot_0.36.1.bb => simpleiot_0.36.2.bb} (98%)

diff --git a/meta-oe/recipes-extended/simpleiot/simpleiot_0.36.1.bb b/meta-oe/recipes-extended/simpleiot/simpleiot_0.36.2.bb
similarity index 98%
rename from meta-oe/recipes-extended/simpleiot/simpleiot_0.36.1.bb
rename to meta-oe/recipes-extended/simpleiot/simpleiot_0.36.2.bb
index 07fc60128e..b4f7c8545e 100644
--- a/meta-oe/recipes-extended/simpleiot/simpleiot_0.36.1.bb
+++ b/meta-oe/recipes-extended/simpleiot/simpleiot_0.36.2.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=3b83ef96387f14655fc854dd
 
 SRC_URI = "git://${GO_IMPORT};protocol=https;branch=master;tag=v${PV};destsuffix=${GO_SRCURI_DESTSUFFIX}"
 
-SRCREV = "0d7ca333b4818c4176324ac258abb96828ea84d1"
+SRCREV = "7265a673baf73d8e4c97db7390929f132e734959"
 # v1.0.912 is a stray 2020 tag, not a release
 UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>(?!1\.0\.912$)\d+(\.\d+)+)$"
 
