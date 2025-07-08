Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10C3BC8303C
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 10:04:03 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.14973.1751969034380059459
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jul 2025 03:03:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=L0I/S5xv;
 spf=pass (domain: linaro.org, ip: 209.85.167.52, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-553bcf41440so4264338e87.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 03:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751969032; x=1752573832; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A3JEd0oBeRD3dvdHHC/x+Ugf503WBvZbbyTFAwMP0Ic=;
        b=L0I/S5xvvGeTmQFK8hlNF/AS3bn115115y81MqegCHwpBXVhcJbWpnz1uVzwtsNray
         QIzkmy+8pYkWEOWJ3cm5hI15SDL9KyybwOrTX0IjHEq7X5jp1hXmydml5cgRqQBb/iAf
         Vjks/GSV/dqSC6ihx3bLD6TY486JRc6e2ogpZA84ck3wJOykRT85vZoxneqgRpMj3X1b
         qvrTlPr9iXnZxrNcvpCyoIm505Zgm1z6+PSSBpmdl1n0wYZ5zHBZLzXiUXCfgQjqkq3m
         JbF5mi+LjUnoMMZ6xjG6+jy1GX/uTQdjeGCMqQmwpySjKnSa+I6XD0XMTisTbh+6mLLb
         80rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751969032; x=1752573832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A3JEd0oBeRD3dvdHHC/x+Ugf503WBvZbbyTFAwMP0Ic=;
        b=uppnHLGuREBN1/ogv3HV5bodXA7ssnIKdhhJE968RRM8/IfHBSxKdwu6ONY5S7f0Xc
         O51920swwbxTOnp1uGx41iVTtYoeB+yK6+QvdaAg7q2tQ8zzmldtK+omwCJUAU9fLqk/
         AcPB3fSSdfHhQiB+wvixMfY3I4ZIlkR7eR5pl+tWKSkbvFOMlBKoefbwVFDgHscIxAPI
         +Dgh7YR04EYNTEwvOcktpcwVBogOpGc3ACrwMF/LBnr98wx+UyEdTBvvgFC7iFlLRBAu
         YX3mSDnJ+cdH7ECqApyZLC9Y1osvh5o9rlnvIAifWLrqZw+RmtKTIJtFDSGgMgpOAWtd
         k7UA==
X-Gm-Message-State: AOJu0Yxmf4wqFFEl7W49sMKiaa4XuKbrNoRQ+mnyuDDvEdoRXgHGWd9w
	lWOt2IGwCYJ/oKjB0WwG9JItEZiM+d8OZyACN4pM7l/tfLLAkjza5M3W54bqqpq23pokzXZO0Bx
	PzIHv
X-Gm-Gg: ASbGnctAewd8UYBzv71HWR9XBquTyTMc4a4srKJtwHKDPHle1VoggfbYvczZJzBHs5O
	Fa4Oy6GPlQasbzVJoXOKkIkp8GQX1GapDAsLBoM3kTYIxVTIYRdE9DdExzHKX2LEB9L/abvRCk8
	G6FGZNYxi69RrpIoiQdOwNBOXH+rf1J5mqw7NHRMbggT9taTo3boJK4zGPrh+HrqwhR2NpRyCjB
	pWoU+3IhEccWJQLABDCZWMubSACWKa+NQX2HiMimtjZhVCpUYPFyczfvPI85u+CR50Ac5lgiYPE
	TAn7k7753IHFJPIRlZyMWuuuUWR5+7ufAyTDBlOnLUKzsf7Z9H+Vxu4JiT9yRmZcW3hbzpeoZ1i
	bu5DHXQVJK62nN539yBi9VuWM4EibIPu3sUxiuSY=
X-Google-Smtp-Source: AGHT+IGRho3x5dt4fwli5cHkeuxLCuTFE4zDGxTRn+bNRHN7VvAa1/L1mq7eOu8CmaONZbaqDz7Bkg==
X-Received: by 2002:a05:6512:1314:b0:554:fa07:c60 with SMTP id 2adb3069b0e04-557f8354945mr868973e87.34.1751969032480;
        Tue, 08 Jul 2025 03:03:52 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383d9013sm1623585e87.84.2025.07.08.03.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 03:03:52 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-devel@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [meta-oe][PATCH 4/4] fwupd: add conditional runtime dependency to udisks2
Date: Tue,  8 Jul 2025 13:03:29 +0300
Message-ID: <20250708100330.138561-4-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708100330.138561-1-mikko.rapeli@linaro.org>
References: <20250708100330.138561-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 10:04:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118306

fwupdtool uses udisks2 to setup access to ESP partition.
udisks2 depends on polkit feature so make the dependency
conditional in fwupd too. The dependency is not needed
for all usecases.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta-oe/recipes-bsp/fwupd/fwupd_2.0.12.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-bsp/fwupd/fwupd_2.0.12.bb b/meta-oe/recipes-bsp/fwupd/fwupd_2.0.12.bb
index f7a53979ee68..cdba7cf66d8a 100644
--- a/meta-oe/recipes-bsp/fwupd/fwupd_2.0.12.bb
+++ b/meta-oe/recipes-bsp/fwupd/fwupd_2.0.12.bb
@@ -84,4 +84,7 @@ FILES:${PN}-ptest += "${libexecdir}/installed-tests/ \
                       ${datadir}/installed-tests/"
 RDEPENDS:${PN}-ptest += "gnome-desktop-testing python3"
 
+# ESP mounting, not strictly necessary
+RRECOMMENDS:${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'polkit', 'udisks2', '', d)}"
+
 INSANE_SKIP:${PN}-ptest += "buildpaths"
-- 
2.43.0


