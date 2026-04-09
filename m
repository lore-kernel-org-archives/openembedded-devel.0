Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E7DDE9DE4F
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 07:09:52 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.127036.1775718582649126456
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 00:09:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Xmhwa8ft;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-82d029fd52eso412340b3a.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 00:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775718582; x=1776323382; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P0h4kmMpAB2naKEblZPrPnN3+Zes26fz05+sYTdCWDA=;
        b=Xmhwa8ftz3vLIhyzDdgBrGFx4CIq7vyNDEE4V+l4jjEQd/d1vaNUivqc22XC93mAO2
         /ZG0TxkCqEqLm1m/taBQJ2RScB6b+Mv9PzkN664s1sPMsK1UzlLl9qtL3KOYAcadPAIh
         IaE6QGSQiC2Z6Q53/Sy6GjDVQI7A6GjNDdn9dO23UuLPPpEubPq4Ifm2qkWj8Tuax0dW
         f+ES9DZVGvroHaidKw23Q2UsIb+7NVP5R92qvTeCnZY6rIUijDjBA7xgsF7pAZT2Fk9S
         uO+pe1OZkkT3J/xhDcwleLDtZ7a7ZHEcsqWL1dZv4dV74xkT5Y7PmkYXP9oGNWBEMTcc
         0WlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775718582; x=1776323382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P0h4kmMpAB2naKEblZPrPnN3+Zes26fz05+sYTdCWDA=;
        b=s0xffW2IkbDdEjPuRGWQxh4OhgCfYB+vNDbQKtdCXJcac7hAJUka69o+aUYA5pqhOp
         ujbcRtfWCC1HEwVEoAv6o3kT3chNgRk0guB8lKc7wtpE6fNqwdnArKqRNDCvHTZDNmwb
         SaWVdfajYiY1ukxTp0BF3CI7AZaLTn6Ar3/PV06EsM48TSLY4RSskMZNQRtrGGNc4pk7
         1yzA2OKYQ7+EfDFqViV2Nl4Z842feOIsdT87D6k6zHUnFC/cYCIJceOf5mw1WE0tAU7x
         7AZUfy/AL5uw+K2R+AC7Jff8gkdOROR0pvh68SxEaVZxu3db2YsFWysyH8s/Bg7W2N6S
         DQaA==
X-Gm-Message-State: AOJu0YwyJtSoycuztzgOWjz53T+SFYc8dW6O6x2fU4cCs/0fyQMwttIf
	MrK2I4bJeNjfAqMIPthE+UXBITwGyk15ZOMVbDyrMdLKLscW38xbUIlkX2PSCw==
X-Gm-Gg: AeBDievHGsrQXHEE46w5sXYoVB2Fy6rDja8XXEoRkjCZyP93hVSBmu/4TLSmrX4IdTy
	WJaLTc/v9NPgy3DZ/N2UFr90gn5JYgRE9+2JYnBnO3jzNmr5pQvXxolyMXlU4LDdCBvm7CT74o3
	RciKTyyPuIOTbKh3drUmgKjyo/c9119qET3HrvLa0cn111pFVSg/FmaxGDiXdEAAjHulKy8Y7OL
	n/GgM7Pbispy1YhTs/QT3g5noOP8BsxB+5YMqkQSNcry6uLCfoKfsWlr/iMxkhJ6hhNtWPyyYIU
	H721JqB851rMMRKx10jj8qWTmaEVB5I5mVuFEoJFYsbvSNYxgMSI3xqekq7p/KIiFN4dcYKvsxf
	rRVa4QIoZ9l+WPaXj0ycdYq4MlC0280hnXDIEOnzbtE1oHoF5CQUouTaCWaUxYwtuoLanb9Xqpp
	rtS20Se398f1/nf0lGmXbX5ha3B+VBJUoinuyzn7dwzzNQsg==
X-Received: by 2002:a05:6a00:a24b:b0:82a:8163:4bfc with SMTP id d2e1a72fcca58-82d0db7db3bmr25401858b3a.33.1775718581828;
        Thu, 09 Apr 2026 00:09:41 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.51])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b21c92sm24764936b3a.11.2026.04.09.00.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 00:09:41 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 6/22] freerdp3: fix CVE-2026-24675
Date: Thu,  9 Apr 2026 19:09:03 +1200
Message-ID: <20260409070919.3968586-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409070919.3968586-1-ankur.tyagi85@gmail.com>
References: <20260409070919.3968586-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 07:09:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126128

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-24675
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../freerdp/freerdp3/CVE-2026-24675.patch     | 32 +++++++++++++++++++
 .../recipes-support/freerdp/freerdp3_3.4.0.bb |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-24675.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-24675.patch b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-24675.patch
new file mode 100644
index 0000000000..022c7f2e3e
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-24675.patch
@@ -0,0 +1,32 @@
+From be9e04d4060bd826eeb94dc0689d261391f74722 Mon Sep 17 00:00:00 2001
+From: akallabeth <akallabeth@posteo.net>
+Date: Mon, 26 Jan 2026 11:54:56 +0100
+Subject: [PATCH] [channels,urbdrc] do not free MsConfig on failure
+
+let the channel handle it later.
+
+(cherry picked from commit d676518809c319eec15911c705c13536036af2ae)
+
+CVE: CVE-2026-24675
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/d676518809c319eec15911c705c13536036af2ae]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ channels/urbdrc/client/data_transfer.c | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/channels/urbdrc/client/data_transfer.c b/channels/urbdrc/client/data_transfer.c
+index 7a7e5a2b4..074a8c05b 100644
+--- a/channels/urbdrc/client/data_transfer.c
++++ b/channels/urbdrc/client/data_transfer.c
+@@ -581,10 +581,8 @@ static UINT urb_select_interface(IUDEVICE* pdev, GENERIC_CHANNEL_CALLBACK* callb
+ 	MsConfig = pdev->get_MsConfig(pdev);
+ 	InterfaceNumber = MsInterface->InterfaceNumber;
+ 	if (!msusb_msinterface_replace(MsConfig, InterfaceNumber, MsInterface))
+-	{
+-		msusb_msconfig_free(MsConfig);
+ 		return ERROR_BAD_CONFIGURATION;
+-	}
++
+ 	/* complete configuration setup */
+ 	if (!pdev->complete_msconfig_setup(pdev, MsConfig))
+ 	{
diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
index e66a4ed4da..c83d82b357 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
@@ -24,6 +24,7 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=master;protocol=https \
            file://CVE-2026-33952.patch \
            file://CVE-2026-23948.patch \
            file://CVE-2026-24491.patch \
+           file://CVE-2026-24675.patch \
            "
 
 S = "${WORKDIR}/git"

