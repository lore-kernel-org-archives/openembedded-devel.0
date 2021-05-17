Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web09.20713.1621265562265366804
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 May 2021 08:32:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=WqA99IWI;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.49, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f49.google.com with SMTP id u4-20020a05600c00c4b02901774b80945cso1975440wmm.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 May 2021 08:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U/AhvfYA5F0R3a8kQQqNkuXlG9AONgDakuISEIxrbHA=;
        b=WqA99IWIEIh+DNSgVPaC3RJrtt+dFTg/OAT/rRz3WcmPmRmEf56gXeDCYqVI2ISfaU
         +kR2Yydv8BfRDj1UyVFBF0OhKN06WfVsjFPcXbpXSjR915nRsx1vVC5YLGChYFsFNXYu
         OwbBgYdy5UUs5wEovwt+n9UFg+F42U//k8wA7CPx3HlcFnMyva/G7nM9kuDL895H0E/C
         k18zjNKfYJk4GjPi/DZp/De6nrCVRBEa9oFEbo/de1fz4xw9SND14POvzAHLVTlPu/BQ
         /0iHEGkTGwcMmYJpC6p5lqjkH0Pmoe0nvQGY18SHLxdTWkjpJ0flMGr5O8OzBZ2KQLBG
         pR2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U/AhvfYA5F0R3a8kQQqNkuXlG9AONgDakuISEIxrbHA=;
        b=U51/4BSffRNgxBS5Dz4PnpB5pyVPBhLobeK0MblGsRtxB0Tex6gA/HYSAYRJP6B8JQ
         rVkI1YjXDVVRbyhVEtd0CWb3nmAAUI/XxiJE2s6jLT597BpIWMjpc85s6+HN2tARGKqx
         Ftrq0/CWdYjgC/jpjrZkI61IwW8Hznoab7nKL1LtLsLNPBdBZDE7K7HejEQ0ZGoCiv1Q
         w1jVaE00lE1NHDvBgrP5v3Ha72oQvaDW2ofbsY10JYIW2H/ds76ySJwUrIGBDXz27D58
         ud53X9ETwfzCWnK2CBGGEDq6MSBYLXosNag8o/ra6l6ww8G+PEJliwykY6gbdyKTOKgS
         RhUA==
X-Gm-Message-State: AOAM531fo7jMiFiJfZTrnaFuB+tFhQdMI5vXBGi6E2oKz/UQoGQ9C/Pe
	+MpvdYE3hsp114ltFvoNWPXuiw==
X-Google-Smtp-Source: ABdhPJwMzsKAJzx/hHbk6+rwZFtPWwmgos3Ha6doUYk5Md6Y40WNjhXpMa7Zcx0X7YLtZy7RuecG8A==
X-Received: by 2002:a1c:1982:: with SMTP id 124mr260980wmz.148.1621265560678;
        Mon, 17 May 2021 08:32:40 -0700 (PDT)
Return-Path: <brgl@bgdev.pl>
Received: from debian-brgl.home (lfbn-nic-1-149-6.w2-15.abo.wanadoo.fr. [2.15.231.6])
        by smtp.gmail.com with ESMTPSA id a129sm4388238wmh.20.2021.05.17.08.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 08:32:40 -0700 (PDT)
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>,
	Tim moto-timo Orling <TicoTimo@gmail.com>,
	Derek Straka <derek@asterius.io>,
	Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: openembedded-devel@lists.openembedded.org,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [meta-python][PATCH] python3-pydbus-manager: add runtime dependencies
Date: Mon, 17 May 2021 17:32:37 +0200
Message-Id: <20210517153237.12626-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This recipe is missing the runtime deps. Add them.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 .../recipes-devtools/python/python3-pydbus-manager_git.bb       | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pydbus-manager_git.bb b/meta-python/recipes-devtools/python/python3-pydbus-manager_git.bb
index ae9e42160..9fb3a485b 100644
--- a/meta-python/recipes-devtools/python/python3-pydbus-manager_git.bb
+++ b/meta-python/recipes-devtools/python/python3-pydbus-manager_git.bb
@@ -11,3 +11,5 @@ SRCREV = "6b576b969cbda50521dca62a7df929167207f9fc"
 PV = "git${SRCPV}"
 
 S = "${WORKDIR}/git"
+
+RDEPENDS_${PN} += "python3-pydbus"
-- 
2.30.1

