Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web08.40913.1609123649863544613
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Dec 2020 18:47:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=T7M8C0JA;
 spf=pass (domain: linaro.org, ip: 209.85.167.45, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f45.google.com with SMTP id m12so21011040lfo.7
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Dec 2020 18:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nNfzoYp5w2vrOMcH/8lGIknF5c4/7gr+WHK9Yevh62c=;
        b=T7M8C0JAFSJcEeuy7S4YYCOemCOZX4KJR8T8Lz4InCROwKmvfrYBvoXwE7Ypte6r7A
         mNnENAfwgmQjgQj9/JDdGdkjl2Yw84aEURjmjXOHjF9UFEvguJeAhkGyJK8NPa4chmSs
         j0cnpWRevlB5l1zjABkqCB0VF7X3fxs0haeB5bQ+cI7Nbi+zA/YDNJ6++gciVC4eVK36
         k4e8uPmx+FU3aGz2PEBuz7IBRMrTgK0xwpUHAgK836mF2TW2hpXNLI+iNEYSDc5GtTV3
         9ZR9sr+reXQaEvt8ClSn+kboJ1/+pUD6v868kfWSCoqoeuTGDtXna5yQUsoYGH0f69Cg
         XMVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nNfzoYp5w2vrOMcH/8lGIknF5c4/7gr+WHK9Yevh62c=;
        b=JVLMmLaiEzzGrZ9xPNg1bz/iZ/jsCENmemXw+MfiK5o9EIWOjFX6ooMhqDbixFkITV
         bgoz8XAAC/ET9xrFq8DClNp19GxHYX/AvE/VpBu44PCFF8TgZ8F48WYfJkgjkefn0ySv
         PEHR5JYtQv63N0s0k0+MRWSaB6DSh7edEmb12Mhklerpr3m+lNyWTvr3PvFdMIuKeEHq
         zHQzPt8UhfAoFCNdRZuXUPKv0YRT/2ADItaAHGdFPSx/H/GviKSneZxwjExmXt7ytjBm
         MzE3Go9+rlUvZTmeYie1HZol1pxa9aGV9fb1fU77Gt8ZsnM/nL14LfWlmnasCRE2WBj+
         E39g==
X-Gm-Message-State: AOAM531LD8T3gaLqQgE311QKjMicKf2mCL/ip3e4xkVSl7M3ZPvf9ENV
	VnffL+KIwNvhOa1lZmgY+9MFFUgE6RbcaZXe
X-Google-Smtp-Source: ABdhPJw9c+yWyhobJVkYJ4EBwUSDiGY7DdbR2esxSoH8gL5hDEyFUDy5erNwfGBGUoYCociz6DT60Q==
X-Received: by 2002:a2e:9084:: with SMTP id l4mr19977009ljg.375.1609123647576;
        Sun, 27 Dec 2020 18:47:27 -0800 (PST)
Return-Path: <dmitry.baryshkov@linaro.org>
Received: from umbar.lan ([94.25.228.115])
        by smtp.gmail.com with ESMTPSA id e1sm5166442lfs.279.2020.12.27.18.47.26
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Dec 2020 18:47:27 -0800 (PST)
From: "Dmitry Baryshkov" <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] conf/layer.conf: provide default PREFERRED_PROVIDER_android-tools-conf
Date: Mon, 28 Dec 2020 05:47:25 +0300
Message-Id: <20201228024725.3536422-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the following warning by providing backwards-compatible default for
android-tools-conf preference:

NOTE: Multiple providers are available for runtime android-tools-conf (android-tools-conf, android-tools-conf-configfs)
Consider defining a PREFERRED_RPROVIDER entry to match android-tools-conf

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 meta-oe/conf/layer.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 9b3f2870060c..e58ff6669665 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -42,6 +42,7 @@ LAYERSERIES_COMPAT_openembedded-layer = "gatesgarth hardknott"
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
 PREFERRED_RPROVIDER_libdevmapper = "lvm2"
+PREFERRED_PROVIDER_android-tools-conf ?= "android-tools-conf"
 
 SIGGEN_EXCLUDERECIPES_ABISAFE += " \
   fbset-modes \
-- 
2.29.2

