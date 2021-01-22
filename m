Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web08.15930.1611348927058979573
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jan 2021 12:55:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BM6GIoG0;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id g3so9569568ejb.6
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 Jan 2021 12:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p8ngVOH9t+3p4HieQTZBPnnaCdmL1MX2Ki3/dUDqAWg=;
        b=BM6GIoG0unhTu+olFT6pSzKyeKscTVIj7LGX/p+zwP1baoO5NLVwa1qsHb+19vnhzL
         dXE9YElbZKULaK8fVvP/EZKs9CFWsmUsQFdCSctNVGyu55ZPdSGRw7tqyXHV6REI3yYB
         52XywmrcpX/18eC8korF8AmMGKYklIeYiCrBW5ESM3CSPlJD98bY+EEVup+cFl3CAlp5
         38VtGnOgTStWfzET3jY/u3CZuq+Ut+WQkGJsg1Pq0Rade+4ZCerWfuzUZr9ETNqRAlpT
         EGb5jauV9le2HgwrfeFMNYqGebgd3ju45l9qcSmb3sZZx6TcjdYlPYnwSL3TcUb9wjz9
         BorA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p8ngVOH9t+3p4HieQTZBPnnaCdmL1MX2Ki3/dUDqAWg=;
        b=cvuLEaA9id0CMuFJJrlV33+4wBIBcz+4BW8GSYOX6gdrAU4FDKqxaFLY2YHqjCqNPD
         52L6XYaQuGf5LGkjAkU3wulGq9QEbRD+5HsO1/gpcP8uSkqJfvILyd81PkWlLQmg20Ah
         /q3KlErV0jDPHKg5LAuw4jGG5sXRTgzgOmRRsypWZjokkt4n1IiRdXLiRZEkWRDQvEuL
         54ZGBVrEFdiq0hQJJcY5I4EG48Cx+T7Y9H03VvHjrR19HOUB5oAk3E3P9Q/Ef0zguwAi
         WyXpPem8oSUj0zct1Qrj13Q3FNvIDQSbQ1fCutJCQECxc+P8PDPNMVw1dSU5g4kATkgv
         fqBw==
X-Gm-Message-State: AOAM532vIChCINllCzyKCzMa7KEoeZW6RVkcxV/Y8EVybdo+XtBYCDDr
	MKeurliGfWRaUTcJCrIikQYRAU/Bxds=
X-Google-Smtp-Source: ABdhPJwNmD6oFks38e3YFQ7/iTndNWpLTPhizmNo3iJdKPU0S4xwIiUd9DKw2JEPnPxN5hyEPki4GA==
X-Received: by 2002:a17:906:dfda:: with SMTP id jt26mr233211ejc.240.1611348925407;
        Fri, 22 Jan 2021 12:55:25 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id p16sm5188207ejz.103.2021.01.22.12.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jan 2021 12:55:24 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][dunfell][PATCH] networkd-dispatcher: use git fetcher
Date: Fri, 22 Jan 2021 21:55:20 +0100
Message-Id: <20210122205520.3168339-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* now the gitlab QA check was backported to dunfell as well in:
  https://git.openembedded.org/openembedded-core/commit/?h=dunfell&id=72f2c45880afbba1745e5e0cbd841d7fd666f374
  and this started failing with:
  ERROR: networkd-dispatcher-2.0.1-r0 do_package_qa: QA Issue: networkd-dispatcher: SRC_URI uses unstable GitHub/GitLab archives, convert recipe to use git protocol [src-uri-bad]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../networkd-dispatcher/networkd-dispatcher_2.0.1.bb       | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_2.0.1.bb b/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_2.0.1.bb
index 6b73506c2a..61d656b7ca 100644
--- a/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_2.0.1.bb
+++ b/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_2.0.1.bb
@@ -12,9 +12,10 @@ inherit features_check systemd
 RDEPENDS_${PN} = "python3-pygobject python3-dbus"
 REQUIRED_DISTRO_FEATURES = "systemd"
 
-SRC_URI = "https://gitlab.com/craftyguy/networkd-dispatcher/-/archive/${PV}/networkd-dispatcher-${PV}.tar.bz2"
-SRC_URI[md5sum] = "304d7dcc21331ea295e207f8493cb8d8"
-SRC_URI[sha256sum] = "21f84c3646a043329dc64787e4e58dfce592b2559b0e3069af82c469805660c2"
+SRCREV = "333ef1ed1d7c7c17264fcf7629e5c2f78ab4112c"
+SRC_URI = "git://gitlab.com/craftyguy/networkd-dispatcher;protocol=https"
+
+S = "${WORKDIR}/git"
 
 SYSTEMD_PACKAGES = "${PN}"
 SYSTEMD_SERVICE_${PN} = "networkd-dispatcher.service"
-- 
2.27.0

