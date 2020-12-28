Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web08.40793.1609122860882246543
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Dec 2020 18:34:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ZD0vHTyz;
 spf=pass (domain: linaro.org, ip: 209.85.167.42, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f42.google.com with SMTP id o17so20995385lfg.4
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Dec 2020 18:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=D86YDL8XPlMYIcDGZvFiMCNZKNXvwNIrONwP44J02pI=;
        b=ZD0vHTyzDNEgOudssqtVAGvce9ETjyaZpd6PfUh18xs9vpj7HZE+LNG25YgQliv3RB
         urHRyrem/rYKREPyQSt/WOj7lR1OOqo0IEQik9hPQjiOPMJb6qJbCWsjcp7eEFiDS5x5
         muciPWgejMglAlensvJWsM4DCssX+SApH5jhD5THZnlPcw7ZevNmp2Z60fFcYKnu0xio
         ik9eUS0i5QrY1BZ5+48o1DIoaKlB6YkuCjWnNSm2/3eGCG7CETjjQiTPFNPzhShZMFth
         bF5I0qL+/rRAkm4Wt0hsnY8eMgrqaxZnFxZrNB0KSmTqnk/PJfRIDSXjmK888T4ht3bj
         Vk8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D86YDL8XPlMYIcDGZvFiMCNZKNXvwNIrONwP44J02pI=;
        b=hicwhvYf4zuBtxeeRiIISxsJh59JMFuSPqZubf5j1tigqkdDdx3axX3bQUGlD3ek+8
         TAowYmAS5q/QYcFlJOshK9gJnkmRXvcKUngCScTR8EGbIS8TxkmWkjBreDI6oUIYPCZQ
         cw3m3wewiziCGHjAbijcO/vBafk0CAt7KCpb+EComugAFUjxzbF3sYutIvBpvZ840Xmg
         wCqo48KDpHZhFhz/iXEnggTW6XHS0kqW9JMQAIEGqrz1iwwkggujt+ThQqh9Dme4lm1P
         phb7S5NWtWeXqQFG7XcmMm0Hzj6junUQ0ue7DnhrC3FbXzFAiAuB298LNDf1XQq/GEwV
         U6eA==
X-Gm-Message-State: AOAM532otLx81JApigU6qPgrkvPUNOgFHcNlp+sT7RozQ0/4QHq94My+
	vjygpkPGzUlGUgjvoQjUkdsle3LfElhvVHLH
X-Google-Smtp-Source: ABdhPJz7ApeT8F1yrzDnYW6OXR96vFtj9LCzjJYsRvkD5OZQWQlxx0T0Y/++sMc4m+htZuv4dV7hJA==
X-Received: by 2002:a2e:878a:: with SMTP id n10mr19945067lji.236.1609122858903;
        Sun, 27 Dec 2020 18:34:18 -0800 (PST)
Return-Path: <dmitry.baryshkov@linaro.org>
Received: from umbar.lan ([94.25.228.115])
        by smtp.gmail.com with ESMTPSA id t15sm5194248lfl.33.2020.12.27.18.34.17
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Dec 2020 18:34:18 -0800 (PST)
From: "Dmitry Baryshkov" <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2 3/8] obconf: Openbox configuration tool
Date: Mon, 28 Dec 2020 05:34:02 +0300
Message-Id: <20201228023407.3498609-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201228023407.3498609-1-dmitry.baryshkov@linaro.org>
References: <20201228023407.3498609-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a tool to configure Openbox themes.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../packagegroups/packagegroup-meta-oe.bb     |  1 +
 .../recipes-graphics/openbox/obconf_git.bb    | 33 +++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/openbox/obconf_git.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 47ff91a4f872..488667d654b9 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -462,6 +462,7 @@ RDEPENDS_packagegroup-meta-oe-graphics ="\
     libforms \
     lxdm \
     numlockx \
+    obconf \
     openbox \
     packagegroup-fonts-truetype \
     qrencode \
diff --git a/meta-oe/recipes-graphics/openbox/obconf_git.bb b/meta-oe/recipes-graphics/openbox/obconf_git.bb
new file mode 100644
index 000000000000..53c58982115a
--- /dev/null
+++ b/meta-oe/recipes-graphics/openbox/obconf_git.bb
@@ -0,0 +1,33 @@
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
+inherit autotools gettext pkgconfig mime mime-xdg features_check
+# depends on openbox, which is X11-only
+REQUIRED_DISTRO_FEATURES = "x11"
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

