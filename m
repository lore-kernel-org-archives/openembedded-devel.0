Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B875EB64D9
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 14:18:59 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web11.59609.1688480336429491230
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Jul 2023 07:18:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=erN9fMbH;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-57a1f51d7a7so9488107b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Jul 2023 07:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688480335; x=1691072335;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iaLRsIIMVVstOSgnPhTkm2I+HLH+23c5zbvSRRlIzdI=;
        b=erN9fMbH0U/vSH8iWv/NsTh/7ValWKVXs3sdPMYIT53PeogODfcZfNimtm9vPI86Ad
         qNUAItDK2iu6kfG/iXwYHwT3s3bw9vRrbquOLtDo1AnQ69DlYTkhgL13hsCMc7h8muOK
         sFofWvYYvxg4SmhnOZ7uGNi5DDgceYfX/tNnxnikqnjqLPtH/rWeBuJ2f4kaptfN3JRF
         WilOdahB1HrQmR3a2XUGqf13O9YOFKlo24fKrRMNEVnCm5M7ULJ8KeEO3rBg6/qHI1eU
         p400D8OW2+HMWUro7lyDp591yO6GK0EM5XkuXHKIFxYwtJoItf9Uh7Nf8WztCp0+bHxH
         Mbew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688480335; x=1691072335;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iaLRsIIMVVstOSgnPhTkm2I+HLH+23c5zbvSRRlIzdI=;
        b=FD7tNS0oyXHnH/XrBxv6MRgT40N9oXs5k/XX3beWtEkzC9R9EUNZhdUbo1Ha8VYcvT
         adib5RDOrAs96f92vMfKPt2VT0R9+kRTRGXbYmiSxombTVIlRVghJdhFBZCObu6Ffj+Z
         bPbj0lGL6BVQFfuWeVuVA6FIkjoa88IFah7qqkgy91jTcesyJurtOXPGnYKPIJzIehB+
         6pzJG/rmOyXS+72GFEv3jpXSI1+oP3fi3S5OPxKUWYA2Bhf27lQGptKvP6i7CE66iIRe
         E63VAe6sBDYBT3LVfd4YF3upuW2cPWaNWKK9K6I3WRPr4penp6NbBYyWknPk2Mghh3rR
         QTFw==
X-Gm-Message-State: ABy/qLYhtTb5mQzCFOsPBv2A7mJgp+4RmrmVv5+VHMGmX5iX3bTDjjaW
	R4FSH2C2mKsQTGXbMkCAMKxu4mQ+d/E=
X-Google-Smtp-Source: APBJJlHdt/UulRWxp1N9hEVAa1Z5Nih5/+ucAZNmoB+ngMn91dC7+saaQtloNghSUh0uBA0H5rZjgQ==
X-Received: by 2002:a0d:f2c4:0:b0:570:6fbd:2daf with SMTP id b187-20020a0df2c4000000b005706fbd2dafmr15975263ywf.37.1688480335382;
        Tue, 04 Jul 2023 07:18:55 -0700 (PDT)
Received: from keaua.caveonetworks.com ([2600:1700:9190:ba10:4625:7563:387f:4fe7])
        by smtp.gmail.com with ESMTPSA id u18-20020a818412000000b005772abf6234sm2990425ywf.11.2023.07.04.07.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 07:18:54 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Thoma <a.thoma@rational-online.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][dunfell][PATCH] Fix tigervnc crash due to missing xkbcomp rdepends
Date: Tue,  4 Jul 2023 10:18:53 -0400
Message-Id: <20230704141853.2294969-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Jul 2023 14:18:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103657

From: Alexander Thoma <a.thoma@rational-online.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 447de4d47ba2deba1af80201b91bb312f184fe0e)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit b3b00a270edfd27e2dfc05d5a6a5cab94324ad65)
[Fixup for Dunfell context]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-graphics/tigervnc/tigervnc_1.10.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.10.1.bb b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.10.1.bb
index 03b9d6488f..de2d059061 100644
--- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.10.1.bb
+++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.10.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.tigervnc.com/"
 LICENSE = "GPLv2+"
 SECTION = "x11/utils"
 DEPENDS = "xserver-xorg gnutls jpeg libxtst gettext-native fltk"
-RDEPENDS_${PN} = "coreutils hicolor-icon-theme perl"
+RDEPENDS_${PN} = "coreutils hicolor-icon-theme perl xkbcomp"
 
 LIC_FILES_CHKSUM = "file://LICENCE.TXT;md5=75b02c2872421380bbd47781d2bd75d3"
 
-- 
2.34.1


