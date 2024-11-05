Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 855C0D2B941
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:37:22 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web11.19565.1730817438514488097
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:37:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KNcdHidh;
 spf=pass (domain: gmail.com, ip: 209.85.219.178, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e29047bec8fso5026406276.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817437; x=1731422237; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a38fOOz+PiFTxS8DJuSdkR0Mwl4N0HN/tZsca8HwENU=;
        b=KNcdHidhF7E/5J0IPNrgyS14K5TfDVATP1In3sLAxyuPY9LdRgN1OIxB2JrjPVVHA5
         8YjzuQnF7EtBN0d5Eol/JvhsE+axeP1eLSnK5V/6z3HwxGsiC9MglCkMTG9iySd/mCe1
         BTDmlc6fmx+S0JOhS4dyvHXArKj40U+clgPmIctap+iKpnlIvQf+Z/269+m6odWCsR9K
         ntUbdlZ8j+WRV7g8C6gS7yM5cW9+aEgKCCSvN0rcO8bSeglo1mcEJJ7fFRaxTwcpeJVp
         gSNsgLj/ntbo6sWxH50QL9Nj0zkZvOr/RhJDUsye6+HSO0FP6HzfBn5hI5/QN491MVm2
         N36A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817437; x=1731422237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a38fOOz+PiFTxS8DJuSdkR0Mwl4N0HN/tZsca8HwENU=;
        b=vUhc8hKmJZt8wYpgro9Qysc8j1UEQ0ILZ5HSeYOEJdFInWqpnlKkF2S6IL0fBNYoX6
         Lv/vVbfs7GBmy/E39zVtu6nLeEAQnCx5m8QutIpM+Yc9S2sBe4udlym3w+GWWKO7S8sn
         OFjmapX8O3xB+ce3sznBV5G7oQ7h3efdLTSks7Z2PUx+7gl2GoxNNAbmfwOe2uNmfg2l
         FMjr7i29GcnESdbb/zdUiMsoAfzWecled5LzGSnOJjQNuNa+Vl9OgntdLCsMWBPd1KKD
         Uz1uQC0j0+dxm8o2BbDLkLYNgSkjGfcc2sgim7yC1vJW9IzVf59d1jXPLcrNd6dUo44s
         imBQ==
X-Gm-Message-State: AOJu0YzOHB+XPauv/VnMfdK1o4T126kpBUJgmmkhpj+cRd4bohUTDbTe
	PpuiVLMJcppJP/NzIuLBh/HUlMmnTxblIsn0EBKzdPe6xWHTbdA0AKlkpA==
X-Google-Smtp-Source: AGHT+IEhsSxdGfp9npLJwMrvrqd2UsfUGGDXOWixyBb4K16X0zgvVekLgki/Sz7vMiLjA4PCMhNnBQ==
X-Received: by 2002:a05:690c:3683:b0:6ea:86ae:cbc with SMTP id 00721157ae682-6ea86ae0f5fmr76558437b3.13.1730817437630;
        Tue, 05 Nov 2024 06:37:17 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:37:17 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 82/90] minidlna: fix reproducibility
Date: Tue,  5 Nov 2024 09:35:47 -0500
Message-ID: <20241105143638.2301245-83-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:37:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113500

From: Yoann Congal <yoann.congal@smile.fr>

Minidlna configuration puts os name & version in the binary which lead
to non-reproducibility. Fix this by forcing those variables to constant
values.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 51a400b736db3ab075b72f5115f790bb192197bb)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-multimedia/recipes-multimedia/minidlna/minidlna.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc b/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc
index 8c9ead1489..170e676b24 100644
--- a/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc
+++ b/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc
@@ -21,6 +21,10 @@ S = "${WORKDIR}/git"
 # configure.ac:30: error: required file './ABOUT-NLS' not found
 EXTRA_AUTORECONF = ""
 
+# Reproducibility: force os-name and os-version to constants to avoid host
+# related build differences
+EXTRA_OECONF = "--with-os-name='${DISTRO_NAME}' --with-os-version=''"
+
 do_install:append(){
     install -d ${D}${sysconfdir}
     install -m 0755 minidlna.conf ${D}${sysconfdir}
-- 
2.43.0


