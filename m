Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web09.4213.1608693052250409833
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Dec 2020 19:10:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Oxghps6Z;
 spf=pass (domain: linaro.org, ip: 209.85.167.53, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f53.google.com with SMTP id m25so36720054lfc.11
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Dec 2020 19:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=WJzVd1yPkFfY0dHWI4/9R6im1SXcOccfjLmzfufmVns=;
        b=Oxghps6ZWs3MxEjrcA1DRBae9xwD5z7q4LTqLL2WdDTvaJQxhMV+Hy9/qSWopAq5Rf
         zSoBVyEdQSi9XCDfyRc+Nt+V05Mh+JQBuzA9Ca45BbBqP7wsOpm3jjAMUHWGvPpkGvo6
         7HgAji99JrskZgq54+j5ZgNM0ofsR4YWZANSFaQFsAQ0PKmFGdWmyPrL60A9Q3PrWfIR
         dmRFs1Wg2T00zzNjpzwbms/CgfMqIQ0DhTczBht39htdUSpAmPdFB2kxFywGf3m0CTIC
         3/OCOjSiHKcFKnkiv1HnPK1CgPVBHo2T8oKS0Fvldre//urfQGLTsft6pYdc8O8D6/GU
         c4Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WJzVd1yPkFfY0dHWI4/9R6im1SXcOccfjLmzfufmVns=;
        b=KUdtUmwIqpIbg+nl4ufIjGgVqEHm2UHtz2GfBBOHXpkAOnZBgNeymsrgzAZgoe/dm1
         OZti1pR/GLKtvaPZOo1x7ftHktBrT/10GSKsomD/K3xQiBE9Dl4WZHbNGDL3EcCWHSjG
         DDeAKtVChechtH+r4w6xMXfadUvLRaePjAv1rOlq7q25DWyQh94VtMZb7vRMSNyJRJu1
         mt4F6jIjWv4Cyu0Aq/ah+CtOOri5/Sweof+OzEtL0YYqYpc/zfDIJm8qMX5+W1GhVXz/
         zuvLZdDHFB/JHe6/dDIE7SnGk9gGHyAvpVE8bGpsBVPg4IY7vx8plCE9fcbBiMGKkn76
         F9aQ==
X-Gm-Message-State: AOAM530dLBck/jQT+4JMXU0vQ++76ZfUL/sGSTaVKvGBC7ecxAXiEzkA
	gk6sJ1qN0t+8KOzHmbxZxam/ryXf9V4cWA==
X-Google-Smtp-Source: ABdhPJzqPqySJynaBFI6gJoOz7URSXFopmruK/2xi2CoGiItbrmYaDAI16jBy6aSqvg/F9pwPG5Qog==
X-Received: by 2002:ac2:5547:: with SMTP id l7mr9995446lfk.313.1608693050178;
        Tue, 22 Dec 2020 19:10:50 -0800 (PST)
Return-Path: <dmitry.baryshkov@linaro.org>
Received: from umbar.lan ([94.25.228.224])
        by smtp.gmail.com with ESMTPSA id x2sm2963035lff.207.2020.12.22.19.10.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Dec 2020 19:10:48 -0800 (PST)
From: "Dmitry Baryshkov" <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] android-tools-conf: fix android-tools build-deps warning
Date: Wed, 23 Dec 2020 06:10:46 +0300
Message-Id: <20201223031046.513846-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201223031046.513846-1-dmitry.baryshkov@linaro.org>
References: <20201223031046.513846-1-dmitry.baryshkov@linaro.org>
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

