Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.25555.1613351625305408877
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Feb 2021 17:13:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dC6PxdTB;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id z9so2919311pjl.5
        for <openembedded-devel@lists.openembedded.org>; Sun, 14 Feb 2021 17:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=LAoBhknuDUc377HdyVrggyFmUObwJxspq2r8CkkytuY=;
        b=dC6PxdTBuGOMFxs+1hQskWcbhMxopdEtfBGeC9jgUxkrS5F4R8F1FrjLlSQab6i6fU
         S6pWNEXLZ2TuiIM6xYyxFqRus3ClWwQtRCarrCU9ZUapXE1ssD6ZraLNFC6CWFYRTvW9
         ddEWMsf4IhhETygE2Am1wp9ljcRIb6fhgPI6laUoMhoAGtka8EVQ2X/ijPAvbVmIKKAE
         gHSvRhfH48L9LfaJFKiQD9Nk9VWON3CEKMIAynHvzjY81dX/AGkIqXVT9BHqs/wC7B0N
         MpTPx79vBiRdGStTDHPEcK+it9th85sUBFqd2z8oQXgbl8DELN3JdbomsrdIOsDrr8nV
         spDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=LAoBhknuDUc377HdyVrggyFmUObwJxspq2r8CkkytuY=;
        b=dNNd5JJGptUkdLwePU1O9mofDA9H1sHwFqQNGEgG99Ngz3azvHxOk591/rW4OPavY0
         r11h+Hd9cbfk3eeCVn4iEHycQV6Tgz7iwF7DN8lCqrSdu/4c9WEIbmaaKg33Rwx1PUf9
         QBcaOTRIB884BiR6UnAZLYLot3XgoVHiEtedcH7Wjud4yeTDiO8He2w1jQD1YVz78lke
         u2w9tW99j18jdrTrcHur7Pgym2ePN+svJBKztnandBSPaJCrVaeqlIRUWN/Iv7MzZroO
         9WmmBOLRcWIcamyoVzUOIILtyS7TRWxvSnVpD09JIT8JWT4A8NPszrBoKHH7m6tCaxnk
         C7Xw==
X-Gm-Message-State: AOAM531BJG0A6FzheXEg+pdW7wOSaRrvo+yM9TnYfU0QuF1OWmAK2Nmg
	IXNzSR/asAD7JkpKEv5dkW6qTnv8tx9H8Q==
X-Google-Smtp-Source: ABdhPJyZfOCDUwnqqRwf4r4H1rmOIwsVWxg7BsfRkhUaWMojKUhJXByDyGZ4lDtxu4dfFJzUkCsuag==
X-Received: by 2002:a17:902:6b02:b029:da:c6c0:d650 with SMTP id o2-20020a1709026b02b02900dac6c0d650mr13292259plk.74.1613351624756;
        Sun, 14 Feb 2021 17:13:44 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:c8b8:7fc5:a225:bb8d])
        by smtp.gmail.com with ESMTPSA id t1sm16077998pfl.194.2021.02.14.17.13.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Feb 2021 17:13:44 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 13/15] openipmi: Inherit python3targetconfig
Date: Sun, 14 Feb 2021 17:13:27 -0800
Message-Id: <59d3d64e902d4d2e7ea9c3d2e1fec442912bcdd5.1613349480.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1613349480.git.akuster808@gmail.com>
References: <cover.1613349480.git.akuster808@gmail.com>

From: Khem Raj <raj.khem@gmail.com>

Fixes

configure: error:
  Could not link test program to Python. Maybe the main Python library has been
  installed in some non-standard library path. If so, pass it to configure,
  via the LIBS environment variable.
  Example: ./configure LIBS="-L/usr/non-standard-path/python/lib"

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 59f817bbe374799e4398766c2a444692d932d979)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-support/openipmi/openipmi_2.0.29.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/openipmi/openipmi_2.0.29.bb b/meta-networking/recipes-support/openipmi/openipmi_2.0.29.bb
index 85634a70eb..6918485870 100644
--- a/meta-networking/recipes-support/openipmi/openipmi_2.0.29.bb
+++ b/meta-networking/recipes-support/openipmi/openipmi_2.0.29.bb
@@ -38,7 +38,7 @@ S = "${WORKDIR}/OpenIPMI-${PV}"
 SRC_URI[md5sum] = "46b452e95d69c92e4172b3673ed88d52"
 SRC_URI[sha256sum] = "2244124579afb14e569f34393e9ac61e658a28b6ffa8e5c0d2c1c12a8ce695cd"
 
-inherit autotools-brokensep pkgconfig python3native perlnative update-rc.d systemd cpan-base
+inherit autotools-brokensep pkgconfig python3native perlnative update-rc.d systemd cpan-base python3targetconfig
 
 EXTRA_OECONF = "--disable-static \
                 --with-perl='${STAGING_BINDIR_NATIVE}/perl-native/perl' \
-- 
2.17.1

