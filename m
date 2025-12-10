Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20AEED3C546
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 13:26:23 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15316.1765373175438374693
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 05:26:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b1ulRpAI;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3436cbb723fso5865152a91.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 05:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765373174; x=1765977974; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E4LgAz/XmVwaAE4WKl3TBb5T/4ULP4OnxGrydUrIp84=;
        b=b1ulRpAIqZeVOa9tsVL+gpe7UP7A7HTorDjq7lLa9H45/+nN/gJZprOkbo05WLm6Mt
         qBEeaArZ+RKa+rvA0G2PxJECtfPDttLXTtVj4Owjt/uDZnX6WoV7/dFdPtnORu+8yBWa
         pYLnCGoRod+l+ehDXj4FwQW/4uIpUdo+kGzS6DXEABNas1VewmU53bZsc8K7Eyz3BpHu
         sdqTE0AdqjJQn6RTTNB3c+SILF6kIUbJIQW3tUNx1KuHIDjppDH1IzfUSEqy3KZTgFsB
         4Ld4yTnBNL/190J5t/kn1/6EmqZXfCYu5gPxxydRlY/0JF2MUXLEt9lQNEUjpyJAAWn5
         crlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765373174; x=1765977974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E4LgAz/XmVwaAE4WKl3TBb5T/4ULP4OnxGrydUrIp84=;
        b=PWkbHZw7PmEb1RmqhDDXDtEdyvlc4PKnx5NjLmd3d3NtKyhdDs+hg978OL2Yq46BYG
         fQL508393sMjoMcOYL8ORdwOCadRq1p/MgOjtfnsGlZtNvrUv8WB68I+SFrwHeQxP1P+
         EWaztEzLOBFGmdkdTxvuGXs7nMYMRXeRTpfD3P5ToG+AN6khQ+O1ipt8aZwlj0+xjlV0
         ZaR021XBwcPpApNPLhlDoMxNuwJLorzW+l2EHTJwmwYrhRM+1zu/HtYsLlTM1FNL9BjC
         vWPasE2CL1sfI9PBU4yX4LqlmIiYgJ5SRuGp2x/OxORlkNhMPkLqLIrWD6L8yNR395FF
         OrbQ==
X-Gm-Message-State: AOJu0YzTVRN/E1Xl1opD3Se01q09/YO5eC2E2BGgvae2/72QL9qerv13
	n7taufO8UCA1aoWcyKW4A13fLvwsBLpHMLgdTYN8uZRAKDCHdRQrRfnkC/NlOg==
X-Gm-Gg: AY/fxX7Qnjs07GiLqOCDsxucbIeS1XBqIJeHuljSgorqD5e5GAQVkVk/o64yOSu9eAn
	SfDds7zbZM3gtS0BJfzAHu01VYlhmR3xaI+mDEgKSn7uCe5xwMazGWdVvK7WmMYwyQt6+RbBfNj
	Islfn1185kZdNGlKyW8mAbIsGZhdaXOcuPNRZfQQXYRVdnCg7LaJ2TMJDSqPCA2gyg51L5FRLZo
	lL+D9+oaDvCGgKXgLkwEWHNCM3t/YgEzP9uODKe9/D2yMBkqkrAQKqqo3vTmaf4T7u+Y/PoiyVO
	cPVhIZjzlbML0y5Wuq50WyroZx3YGnJlouVbVmnUEYu6bDX7VJJrGasBkovkmCIw5Hnxn/LHuD/
	ZFKZCSzgINPF+DyH0oaVNrAycKyjCzUpkqf8tH9wCizkJi8gZ7iGXHIy+N93ctwQjMGaV6Zo7zm
	CDA0/ps8b1XF6/IUyRZ2nqfwc=
X-Google-Smtp-Source: AGHT+IE+aj4jheYA4xbqkWU0Cq0cHfZlyD6pEDYApybkfrdLc0kqF9eNPbBgOG3G3FaIMx/s7LWhPw==
X-Received: by 2002:a17:90b:4a08:b0:32b:9774:d340 with SMTP id 98e67ed59e1d1-34a7289490amr2264315a91.33.1765373174477;
        Wed, 10 Dec 2025 05:26:14 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a7092b1c1sm2550009a91.15.2025.12.10.05.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 05:26:14 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 22/43] proj: Fix do_package QA issue for unshipped bash-completion files
Date: Wed, 10 Dec 2025 18:56:01 +0530
Message-ID: <20251210132604.317279-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210132604.317279-1-ankur.tyagi85@gmail.com>
References: <20251210132604.317279-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 13:26:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122526

From: Alper Ak <alperyasinak1@gmail.com>

Add bash-completion directory to FILES to resolve the installed-vs-shipped QA error.

Fix:

ERROR: proj-9.7.0-r0 do_package: QA Issue: proj: Files/directories were installed but not shipped in any package:
  /usr/share/bash-completion
  /usr/share/bash-completion/completions
  /usr/share/bash-completion/completions/projinfo
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
proj: 3 installed and not shipped files. [installed-vs-shipped]
ERROR: proj-9.7.0-r0 do_package: Fatal QA errors were found, failing task.

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 1175d5c8c13d73568d4ab55a3cf628456fcc1a7d)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-navigation/proj/proj_9.7.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-navigation/proj/proj_9.7.0.bb b/meta-oe/recipes-navigation/proj/proj_9.7.0.bb
index 2a41f1ec52..eb9fe46f30 100644
--- a/meta-oe/recipes-navigation/proj/proj_9.7.0.bb
+++ b/meta-oe/recipes-navigation/proj/proj_9.7.0.bb
@@ -12,7 +12,9 @@ inherit bash-completion cmake lib_package pkgconfig
 
 EXTRA_OECMAKE = "-DBUILD_TESTING=OFF"
 
-FILES:${PN} += "${datadir}/proj"
+FILES:${PN} += " \
+	${datadir}/proj \
+	${datadir}/bash-completion"
 
 BBCLASSEXTEND = "native"
 

