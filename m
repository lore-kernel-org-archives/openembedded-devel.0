Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9879AE77188
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 05:44:38 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.12669.1736315071941798929
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jan 2025 21:44:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y/XARLq0;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2167141dfa1so8649865ad.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Jan 2025 21:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736315071; x=1736919871; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YAqHx9vOUDCxwZk2N2VEWg5qTJVKJtjpSC7l0QdQdkk=;
        b=Y/XARLq0HSC9/OvFNDPpPXbJiml6T/y4iiWTZpvANDlidOcjiSfI1DDp4eOZDJdCU+
         ZNCSMGlCmDHMZWEev+LJfVMAhGXX7TxnL+j4f8q+NBIE2IAwsqzjFDS4Z2+opux7bYr+
         SFKrEm11/IzUkbTBK89HSnKBttw49GVD+/WcTnMPs+0snh1IK/YgodzIRbB23220zCKX
         sdG9CyuhRcV89sbEeSiOoGC/9cjBpk6jpRmFFuVwKkfPTjDXaB61hYDf3WrTIzlnET2R
         mQwmYmhP+b2uUPOlL0R56+e8kjsHjkPZxdc92VzZJCRaea/Uy5flsLBnzQYz5vKsJT+t
         vXaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736315071; x=1736919871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YAqHx9vOUDCxwZk2N2VEWg5qTJVKJtjpSC7l0QdQdkk=;
        b=I56aQf5SMgxFj7CS68QH905Pszpvbx2UZ90yO/QWfk3UWCB7LHRll2Dn/HuDvTwaOG
         qdNE3UnSjO8cLVyIn6rnrpQiXong9igzZiTTvmSln5w7sN9MnfOYtwrHNKrYFpS4yu39
         KSXn7vB2wSoKUZ6krUuwAIP7L/w6ZirrneJeATR++wj0Nh+BQ1YMrPYhzTqy4VcvBbZq
         BYB7ABfKToSh0NEF5yO/AQC/0LCyRfq1cQsLGnvEBqK9Wq6yHvH687yzFoRc1Rb94Dvq
         63q3dGMISqO6oWQbX6Xo46GhR9SV2YKtA89wGHam/+WirT0LWPe6IQbvlWlYh2Gnzugm
         RCgw==
X-Gm-Message-State: AOJu0YxRGGS13Ec1IhgP0jA/aPSY+vzbYg8g7pUCKN4spLdB+AmTi5Az
	pxJaA13BDwUA1qQ2IhSibp1qkj65S1tuA15VNuR7srgTrY2ZDmRGTBkgqA==
X-Gm-Gg: ASbGncvtoxuiBHI0lNdRn7ARaH0FZv0QlnhH4gaghA5P3xiSHUrH6+uNMFR1WCmWRCR
	ppLsbCfr+/xa0/SBu3E14BKrvCof1bGieskBpqpkNE3ehm6qXI9TAKez48H297NJZGsYhGj6wT6
	zkH6c5HwzjU10nQ4WbKu67/PZcyc9bovTZ2X+rztdjFLlrSzfk+Zc2MDmvoDwilw7sGe5mCXBJP
	nMo3MBVISLG7DkDEYnOkJHVs8OEo7GStL9dJ4S9D6dYL6Ty
X-Google-Smtp-Source: AGHT+IFKuPQxsqcvYAV+rv3EiGGTtWNgYSpXz5RoxD6FfAQ8aWAhuoIehtn7Rxb3PRb95FuYaE4B0A==
X-Received: by 2002:a17:902:ea0e:b0:215:ba2b:cd55 with SMTP id d9443c01a7336-21a83bb9986mr25628525ad.2.1736315070967;
        Tue, 07 Jan 2025 21:44:30 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8201:fd20::5bc2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f4406sm319551695ad.170.2025.01.07.21.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 21:44:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH] x265: Fix build on x86
Date: Tue,  7 Jan 2025 21:44:28 -0800
Message-ID: <20250108054428.3149282-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Jan 2025 05:44:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114735

Disable asm on x86

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-multimedia/x265/x265_4.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/x265/x265_4.1.bb b/meta-multimedia/recipes-multimedia/x265/x265_4.1.bb
index 268ccec167..23d6342d26 100644
--- a/meta-multimedia/recipes-multimedia/x265/x265_4.1.bb
+++ b/meta-multimedia/recipes-multimedia/x265/x265_4.1.bb
@@ -15,9 +15,9 @@ S = "${WORKDIR}/x265_${PV}/source"
 inherit lib_package cmake pkgconfig
 
 EXTRA_OECMAKE += "-DENABLE_PIC=ON -DENABLE_SHARED=ON -DENABLE_CLI=ON"
-
+EXTRA_OECMAKE:append:x86 = " -DENABLE_ASSEMBLY=OFF"
 do_generate_toolchain_file:append() {
-   echo "set(CMAKE_ASM_NASM_FLAGS --debug-prefix-map ${S}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR})" >> ${WORKDIR}/toolchain.cmake
+   echo "set(CMAKE_ASM_NASM_FLAGS -DPIC --debug-prefix-map ${S}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR})" >> ${WORKDIR}/toolchain.cmake
 }
 
 PACKAGECONFIG ?= "hdr10plus 10bit"

