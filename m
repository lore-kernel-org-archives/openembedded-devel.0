Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web09.9157.1608805890751472676
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Dec 2020 02:31:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Bv4t9eDJ;
 spf=pass (domain: linaro.org, ip: 209.85.167.50, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f50.google.com with SMTP id m12so3830924lfo.7
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Dec 2020 02:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=WJzVd1yPkFfY0dHWI4/9R6im1SXcOccfjLmzfufmVns=;
        b=Bv4t9eDJJ0JskvVUj50JddVdNR+awxSerNyXVsEoJHy3e+DVB9/YK9vUDY+/7id1T+
         d0XRGirhCv8yJgp+CtcBTZGkO/ZvFQ3wtahTQZd0XD+nlaCYGNiFD3KekPZj+KtydlUV
         GBHe4VDrc0TkJAINjbUkU1oRIpaUuFUYuMn7ucNbaJCshqNDSMgD/84eB1Wl+/Ii08XY
         oyaEFK3SrTXpqD3v83nluFlt3144W39DThVK/lFCn+F9b1Uwx7xLD4MMhyeQqh+ZpdxI
         bgM4m5qoV1fseonaD7RWvJZ0LLUslgW2b6y5tIWfnTegsxYEl2ehzkOLvkldWJryQCbc
         1eBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WJzVd1yPkFfY0dHWI4/9R6im1SXcOccfjLmzfufmVns=;
        b=KDrcfXFHNCZmRYiJFPODvQdS5hyGdp3m7YgWkNm2OuwHPJlIQOpC2CYk7s98rvQHHu
         d73Ket5f3+ZUNotRaI5KmzCwsha+3mSYCre5BIfZuSXXUejwR7J6JCQ79jWOtaNikXr3
         KuaS64Zpxql2C/Wt9PCf2Bcj+kFMXkQ2OKf6yG89gPt+iVMOyX4/LQlqaROL/x3OK2Vk
         2KQmEgpwBHQ681tdIyu7Kvw1pf168rbBMl+RCGKYe+woP/BowplRsocHXz0641mClVRH
         OcPtEQY5Ihg4zSk5NyXo8eJKe15hLIjbkD3BsrYDxo35T/SnOSnKwJHsyXAIMIQWf8/u
         nzpQ==
X-Gm-Message-State: AOAM532xDwgIpjdUICzoDxgDy9cerTsFn9K6j3Wl8VfgqwJjnNS0nmXp
	B3vLsSEAuLN2kWinzi4uC1wnvOOv54snVQ==
X-Google-Smtp-Source: ABdhPJxLk2tYHHANpcd6fQ/QiecdiQ224VTzX8IbeOqbotGPzfuOAcx0/f3WVl7n74tqFzl9bL6+Sg==
X-Received: by 2002:a05:651c:11c9:: with SMTP id z9mr13184401ljo.96.1608805888712;
        Thu, 24 Dec 2020 02:31:28 -0800 (PST)
Return-Path: <dmitry.baryshkov@linaro.org>
Received: from umbar.lan ([94.25.228.59])
        by smtp.gmail.com with ESMTPSA id l84sm3552553lfd.75.2020.12.24.02.31.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Dec 2020 02:31:27 -0800 (PST)
From: "Dmitry Baryshkov" <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2 2/2] android-tools-conf: fix android-tools build-deps warning
Date: Thu, 24 Dec 2020 13:31:24 +0300
Message-Id: <20201224103124.3387695-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201224103124.3387695-1-dmitry.baryshkov@linaro.org>
References: <20201224103124.3387695-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If PREFERRED_PROVIDER_android-tool-conf is set, build-deps checker will
incorrectly resolve android-tools-conf runtime dependency to
android-tools-conf recipe rather than the selected recipe. To fix the
following warning, make android-tools-conf recipe raise SkipRecipe if it
is not the preferred android-tools-conf provider.

WARNING: android-tools-5.1.1.r37-r0 do_package_qa: QA Issue: android-tools-adbd rdepends on android-tools-conf, but it isn't a build dependency, missing android-tools-conf in DEPENDS or PACKAGECONFIG? [build-deps]

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../android-tools/android-tools-conf_1.0.bb                | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools-conf_1.0.bb b/meta-oe/recipes-devtools/android-tools/android-tools-conf_1.0.bb
index af98f92f05e2..34b1a9bdd289 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools-conf_1.0.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools-conf_1.0.bb
@@ -11,3 +11,10 @@ do_install() {
     install -d ${D}${bindir}
     install -m 0755 ${WORKDIR}/android-gadget-setup ${D}${bindir}
 }
+
+python () {
+    pn = d.getVar('PN')
+    profprov = d.getVar("PREFERRED_PROVIDER_" + pn)
+    if profprov and pn != profprov:
+        raise bb.parse.SkipRecipe("PREFERRED_PROVIDER_%s set to %s, not %s" % (pn, profprov, pn))
+}
-- 
2.29.2

