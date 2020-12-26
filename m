Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.16815.1608945659686507220
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Dec 2020 17:21:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=peVlQ7/s;
 spf=pass (domain: linaro.org, ip: 209.85.167.47, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f47.google.com with SMTP id 23so12232873lfg.10
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Dec 2020 17:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=/nDw9BAMAJ8sSkYMhTIeO3UsbX/+zL6FISYjk+uNwxk=;
        b=peVlQ7/sEVy6kHKEbS3QioMX3kFQNUUqexhlLaOpLmvnX+rrO93/iFAs7/XvNSNZHZ
         zCzUiPBYlQDhOBO5WpVfe8rqb1OXW75lDRjr9Z1CidjWrXtCZY4udo8H0Q14U89KwWfq
         jtlA6UoxCabvY/17FeYX+/oCTNauiBFpw1iuPUMYAhZ42moNNvvxbPFb+fIAXEmBijsK
         mRwoEYRuzWZOciMtCgF8xQeBE9+DHbz51yddKaok4swiY5agVndIjDhBu0F4APQA6Njj
         C+J3uxJ0pEqMTKt/NI/a5vIoD/TzdmckX8htFxIrlcYyMfV5IFB4Q/7M9I7UPifSrMYi
         uv2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/nDw9BAMAJ8sSkYMhTIeO3UsbX/+zL6FISYjk+uNwxk=;
        b=FkOLuGawbRQMLYOTrzvgTuW+NGnQVgEXSEmklBXiPXX9Z4KrOtkvfWKZV/ZNIh7m7H
         70n+UJ/HQr0606mDmJcRjKtiMBe6sP6NrWL/AMVbQu52nxZ3D0j8lR1nQOBhW2UsoaTY
         HrmbYzaGAM0abhn/nbMfMjsP3ekRHEgI5oaQvtRzAqYA6sibFLroqUBSRD2EOlVEUiay
         pvJVCCjX2kckmk2hYIJdqseFcZsdd2ebGcLSJtaK88R2Q+/rdH4scAF2il7ChCgtL5It
         6Vtr34+dhH8Fe1fV9ECtO32BnvUogsaY7qT+4sJmcca4qYbaGr6I+tw7f6UhM4u1Q/8G
         Oy7Q==
X-Gm-Message-State: AOAM532oMbvktatzdQYdfK0MBAKQyYxLR9ml+RZZpghChWpvZYkn9sHA
	JU1Jhl/14lgg6D0+lqZXSaZAUZUcxSdYgw==
X-Google-Smtp-Source: ABdhPJxYyQ2uvnUPOp4U+o6xH6KNjpU9LafEr3UTd1Hikk07hHxMv4vqECelfkDkF7APFKOrsAKp6A==
X-Received: by 2002:ac2:50c1:: with SMTP id h1mr16364859lfm.350.1608945657641;
        Fri, 25 Dec 2020 17:20:57 -0800 (PST)
Return-Path: <dmitry.baryshkov@linaro.org>
Received: from umbar.lan ([94.25.228.59])
        by smtp.gmail.com with ESMTPSA id a15sm4306317lfg.27.2020.12.25.17.20.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Dec 2020 17:20:57 -0800 (PST)
From: "Dmitry Baryshkov" <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/7] feh: imlib2 based image viewer
Date: Sat, 26 Dec 2020 04:20:49 +0300
Message-Id: <20201226012054.3689086-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201226012054.3689086-1-dmitry.baryshkov@linaro.org>
References: <20201226012054.3689086-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add feh, small but powerfull image viewer. One of its features is an
ability to set X11 root window background.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 meta-oe/recipes-graphics/feh/feh_3.6.1.bb | 29 +++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/feh/feh_3.6.1.bb

diff --git a/meta-oe/recipes-graphics/feh/feh_3.6.1.bb b/meta-oe/recipes-graphics/feh/feh_3.6.1.bb
new file mode 100644
index 000000000000..b8aa3d503d3a
--- /dev/null
+++ b/meta-oe/recipes-graphics/feh/feh_3.6.1.bb
@@ -0,0 +1,29 @@
+SUMMARY = "X11 image viewer aimed mostly at console users"
+AUTHOR = "Tom Gilbert & Daniel Friesel"
+HOMEPAGE = "https://feh.finalrewind.org/"
+SECTION = "x11/utils"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f91bd06901085c94bdc50649d98c5059"
+DEPENDS = "\
+    imlib2 \
+    virtual/libx11 libxt\
+"
+
+SRC_URI = "https://feh.finalrewind.org/feh-${PV}.tar.bz2"
+SRC_URI[sha256sum] = "9b1edec52cbae97b17530cb5db10666abfb9983f51a5d820c89added6f7b1ea8"
+
+inherit mime-xdg
+
+EXTRA_OEMAKE = "curl=0 xinerama=0 PREFIX=/usr"
+
+do_compile () {
+     oe_runmake
+}
+
+do_install () {
+     oe_runmake install app=1 'DESTDIR=${D}' 'ICON_PREFIX=${D}${datadir}/icons'
+}
+
+RDEPENDS_${PN} += "imlib2-loaders"
+
+FILES_${PN} += "${datadir}/icons"
-- 
2.29.2

