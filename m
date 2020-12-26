Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web12.16647.1608945662861651183
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Dec 2020 17:21:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=qX9gahc4;
 spf=pass (domain: linaro.org, ip: 209.85.167.53, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f53.google.com with SMTP id o17so12296411lfg.4
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Dec 2020 17:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=v451RwjxXM1rSESUl7epFUWbWS9C4bX0Mjdvs5azQAY=;
        b=qX9gahc4goyLWfC4LGFzCIt8vcjcuJtm1GpiDbYN26fUEjJrcBjCy45dUXMn1GDR57
         4qSZ2HR5eS1/0uSBNxgyBLdRI1yvykIade9Sl4MYg8YByTD3UdZQ7GlxYv+Y0mC3Fmw0
         gwkewborJDXBuCVkgjplH3zk56pOatOq0PT6IHNMsHoh1IoROmlfBaXt5sm/NUQ9ucaI
         VenB5Uk6372dWaD9DoKSCHZib0exiRRDIOS22UzzMDuvif2tQ06s1sF6FmuhvJ85W+mf
         moSJRfT5NqyPxEXEEcap+opi/iLK1O91u+vh/N+HutJfyrrTyVG55KnpAUiTnYYcazuT
         2aAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v451RwjxXM1rSESUl7epFUWbWS9C4bX0Mjdvs5azQAY=;
        b=lxtyBwfMhO/8H65cemBD/rlUgfBkDUekR/HGTampDPtMGds/OXaRT3IoYqznQDQMC3
         2efzhRLF40nKYXlMhRhWvbyN9gEpfXByhvGVTv8yQgpV9XjSnkUKkUOV3pmSBzUBJuzN
         hjcxxgHa8o/0qG4yp2SGFb11YiOIiUVLE1XCiS9xPQMKwZCOdCA8ZONaA0U5psdyN8Lo
         h00q04v1wOTzv0bMCNoRuyUZXwm+UZXVOlgBYhCXhqli2HfapPolFWDIri4+R9IfSoAn
         I52pXCVZE1EmB4OsBG9DWvV8M3oYDb8AyAfyHwpVbanNFpA0Ycp8ktvA4VwnxbFyebyx
         G4ew==
X-Gm-Message-State: AOAM530vZLTs+oSKAWY4/dgpgCwRbkTdGfE1pg2PUkLuEhcBIS7iuMHV
	CsNzarGxo20U2QZh99AWzTjfSljfa6howQ==
X-Google-Smtp-Source: ABdhPJz+vRPiN5x1S/wWqO00M4T/N0VsHvUjHULyZJx6iTv+BKY2pHcH5i73T2bQZLMKLTOHabITOg==
X-Received: by 2002:a19:904:: with SMTP id 4mr15883303lfj.64.1608945658725;
        Fri, 25 Dec 2020 17:20:58 -0800 (PST)
Return-Path: <dmitry.baryshkov@linaro.org>
Received: from umbar.lan ([94.25.228.59])
        by smtp.gmail.com with ESMTPSA id a15sm4306317lfg.27.2020.12.25.17.20.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Dec 2020 17:20:58 -0800 (PST)
From: "Dmitry Baryshkov" <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 3/7] obconf: Openbox configuration tool
Date: Sat, 26 Dec 2020 04:20:50 +0300
Message-Id: <20201226012054.3689086-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201226012054.3689086-1-dmitry.baryshkov@linaro.org>
References: <20201226012054.3689086-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a tool to configure Openbox themes.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../recipes-graphics/openbox/obconf_git.bb    | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/openbox/obconf_git.bb

diff --git a/meta-oe/recipes-graphics/openbox/obconf_git.bb b/meta-oe/recipes-graphics/openbox/obconf_git.bb
new file mode 100644
index 000000000000..6c422e2a3957
--- /dev/null
+++ b/meta-oe/recipes-graphics/openbox/obconf_git.bb
@@ -0,0 +1,31 @@
+SUMMARY = "Openbox configuration tool"
+AUTHOR = "Dana Jansens & Tim Riley & Javeed Shaikh"
+HOMEPAGE = "http://openbox.org/wiki/ObConf:About"
+SECTION = "x11/wm"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+DEPENDS = " \
+    openbox \
+    startup-notification \
+    gtk+3 \
+"
+PV = "2.0.4+git${SRCPV}"
+
+SRCREV = "63ec47c5e295ad4f09d1df6d92afb7e10c3fec39"
+SRC_URI = " \
+    git://git.openbox.org/dana/obconf \
+"
+
+S = "${WORKDIR}/git"
+
+inherit autotools gettext pkgconfig mime mime-xdg
+
+EXTRA_AUTORECONF = ""
+
+FILES_${PN} += "\
+    ${datadir}/mime \
+"
+
+do_install_append () {
+    rm -rf ${D}${datadir}/mimelnk
+}
-- 
2.29.2

