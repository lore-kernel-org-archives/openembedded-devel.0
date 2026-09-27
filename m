Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 538EFC9833E
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 10:50:43 +0000 (UTC)
Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34499.1790506236815759587
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 03:50:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ARlypPyE;
 spf=pass (domain: gmail.com, ip: 74.125.228.40, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f40.google.com with SMTP id d2e1a72fcca58-8804c1728f9so1564686b3a.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 03:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790506236; x=1791111036; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E+zPpVHFnQrKAKBN+L9Yl6kfjRPERZRBc3PWlzRNAsQ=;
        b=ARlypPyEVaH78gcLYcw0T/QudaMnCbx4VuaKaCe6/Lz8bEzQCXzsJe832AXGcoyLX3
         hWgexDkOniVWO/qCsRtpoG26PB5Nqhau+QUR2Vyd94ZeCu29CBTnx7Ti4+WlMLTybw/i
         QqR8g3qNsoUTYXzulrremvZWg04xBEzKtyawogJ35x6K6t0VrUu7MOuUlgqyzoFbbvtb
         xZWB0k+WQ1nitr2T+DKKbRGF7wAHc3MB9zbo1xSbtmYp4apJUJDfc4Q4z785r69XHmlt
         c6BXZCCnq16q6DirbOfCEUSl2MeMGaP5hMOUsf/2wItSMLZwLe1WJNAzD7xytVjIML0l
         afOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790506236; x=1791111036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E+zPpVHFnQrKAKBN+L9Yl6kfjRPERZRBc3PWlzRNAsQ=;
        b=tQ8qglAfS13XGWNuqGYsHxxsS6odRFUWLJm792Gn3ci9SSuha2XPKKIkYbuUMehHYG
         vbf0g76j7CSqLjEXG3DOGgOu+OHIQ1hpx2gVJyEJ2pjo/8lHRS9FJiz1B/+ZVbv2yB50
         NKKRTL6HGv/X5zF2WYyBluwwd4R7y/zsefFlbSekFavfLiMlFbHcbCTsXD/QE9lS7bDq
         dVraUd5mSaq+TVO+p1eb8Uqg6ECVlW18EM4TmEv3M3tcu80XHTPGKc9kAqZ2voc+v4Sc
         nw5YSp3Z55cL6uixr8JSy3OPxClCByiuqldjOOwCAVTsfJbN+khrWNyRdThuL3ucwDRc
         rzAQ==
X-Gm-Message-State: AFuF++kPAPvW8UhvocottdCsiXqSiwqk00KIPYM09Ica3mPCaV2mDcIU
	l2m9q3S4KNXbYMkDj+87G15fy4FeZgiy/aWX9wu+3OFccIch5NpY4/oIQ5A3EA==
X-Gm-Gg: AYBFou0ZwTjSTSZdsJXsipXRnVjcL0BlUkRuh5T5oT9GYpvGZ+MTjnakb/I5czmkKjl
	Wzt76wlpSexr0YwnXnSlD4ASRit10VG19GuQJ+KLQc6UL92T1liqle/V8z/Zh+zWvwJ94toDQhu
	trmHtbxTYM20/re09aaxcHxHL19yFMpae3xANGH+qDyYQ1gcD3M9/dT12+mu/RlX2y8rzsyKyIp
	kEtWS/0JFJKIsdeyegIoGhlphqZDAqZRrM2h7kVubaxXV+TvylfaZh88vKEpjDbBHOaEqmyQtFF
	tiFSWql0TpKS8E3UlAnclo7S1cLA1E/rO7YsLYnzxdnmxlFA2x8JIEnQTkiTCQzK0Olyk2y2737
	Hztali2GLm3ENSlpMS0ayZv+0YZA4xs74IwLz/ZGNuoOpqNhVh1k71uH7RBEjDcdrTMvi75EV7J
	06PGlhTQoMBFpvyGDonZQz/22brOtHsuXwGVIt+k8PK2yVGk3fZqkpwn7zxKwnNzYYES+RkSpqt
	DxbXPX8OhK70BvUZNlbEBw=
X-Received: by 2002:a05:6a00:3cd6:b0:881:3462:cf7b with SMTP id d2e1a72fcca58-8813462d33dmr3123267b3a.21.1790506236161;
        Sun, 27 Sep 2026 03:50:36 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88268c5ed75sm640542b3a.48.2026.09.27.03.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 03:50:35 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 10/35] libnftnl: upgrade 1.3.1 -> 1.3.2
Date: Sun, 27 Sep 2026 23:49:37 +1300
Message-ID: <20260927105002.1832451-10-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
References: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 10:50:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130344

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libnftnl/{libnftnl_1.3.1.bb => libnftnl_1.3.2.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-filter/libnftnl/{libnftnl_1.3.1.bb => libnftnl_1.3.2.bb} (96%)

diff --git a/meta-networking/recipes-filter/libnftnl/libnftnl_1.3.1.bb b/meta-networking/recipes-filter/libnftnl/libnftnl_1.3.2.bb
similarity index 96%
rename from meta-networking/recipes-filter/libnftnl/libnftnl_1.3.1.bb
rename to meta-networking/recipes-filter/libnftnl/libnftnl_1.3.2.bb
index 9a7743b5e0..ae72631d08 100644
--- a/meta-networking/recipes-filter/libnftnl/libnftnl_1.3.1.bb
+++ b/meta-networking/recipes-filter/libnftnl/libnftnl_1.3.2.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://git.netfilter.org/libnftnl;branch=master;tag=${BP} \
 
 # See https://www.netfilter.org/mirrors.html#git
 PREMIRRORS:append = " git://git.netfilter.org/libnftnl git://repo.or.cz/libnftnl.git;protocol=https"
-SRCREV = "0f48d7638800bb48c863e6b7e5f2fe92972bb31c"
+SRCREV = "3d7184970506df2c09868dc6ef3c21aba383db63"
 
 
 inherit autotools pkgconfig ptest

