Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
 by mx.groups.io with SMTP id smtpd.web12.5857.1603344225490372466
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2020 22:23:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pb7ECzSw;
 spf=pass (domain: gmail.com, ip: 209.85.210.193, mailfrom: paulohefagundes@gmail.com)
Received: by mail-pf1-f193.google.com with SMTP id a200so408592pfa.10
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2020 22:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mK8iVmRB4WEif4YYj5taP245cZYZTM9lYi/e13eY2NQ=;
        b=pb7ECzSwXPkIZ6uzhtk+RSrycaT7LeYMAnQsx4bSDI7+6MNDSInlGlrBFeym20wsFn
         Wi9WiM58vAVeFymDLRqFUcX6Y8+uY2jMAHYvqDTuBgOml+MwnSU6+IEaNUnWKf5MNvYS
         oVNv9lB2+pYFrmSRh583/NeH3DtM0ej7Uy40mwxNkMgUsB9LGammxL8UTGzHX+0V5om5
         oUPXmF12EDlcpL81d8+sZKwDHuC2rDBBa2v4WD5H0Cey3/Td++cfKAou7CBbJSm+v+B0
         HdF0AwsR6nrU743jKXgOlorY4zPifvrznpFEcnChbh7UD3J1p+i3mqz1oLwz9iWB+Ivb
         iJdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mK8iVmRB4WEif4YYj5taP245cZYZTM9lYi/e13eY2NQ=;
        b=HiJR46ADDO3rb13228LbpgR8+qQN1zFXyn1SNQ/BlbjxonwNcv5Kx/Jk1KClD6PqJu
         BKMpr3/OCLqELpnok8D3KEoCuoLSvTy2kfperKnhNH5tJL5FKTVHSvgYwS2Y066bnKsm
         1MOG6UQzIgfkbj8HHDY7tDLUThmX2+p/nPm2mayH/NGGKAc/tmiaM1ghh7NcIdMNIvTx
         1uYprLAoDm//Hrzq9kIdSuIKxkeUSFRwAFzqdvNFfCSasHHUdCCnCoge3GfsANKWdu3Y
         GBDNR73K9XH14N3ZmqsSZwB7FL75oXRl/LVUWLxefwihrOojskanuB79XGqeN3D+seCq
         QPIw==
X-Gm-Message-State: AOAM530oBcqpHU4bJoBsoCByditFcQKl60ZpiHaDLHmd/SzhIxLJh2rM
	Smu0J1cIBMMw6Zejm6gwolyfJzUkK7w=
X-Google-Smtp-Source: ABdhPJwuf4Sx0YFtH5AIoxxVgkj+MV33gv7JZdk1dvyod/V1MIGBjQfH1klEM0XsYOdN6ancmrDugA==
X-Received: by 2002:a65:55ce:: with SMTP id k14mr865577pgs.65.1603344224577;
        Wed, 21 Oct 2020 22:23:44 -0700 (PDT)
Return-Path: <paulohefagundes@gmail.com>
Received: from paulo-pc.og.opengear.com (c-174-52-8-24.hsd1.ut.comcast.net. [174.52.8.24])
        by smtp.gmail.com with ESMTPSA id i30sm699071pgb.81.2020.10.21.22.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2020 22:23:44 -0700 (PDT)
From: "Fagundes, Paulo" <paulohefagundes@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Paulo Fagundes <paulohefagundes@gmail.com>
Subject: [meta-networking][PATCH v2] vnstat: add recipe
Date: Wed, 21 Oct 2020 23:23:36 -0600
Message-Id: <20201022052336.97257-1-paulohefagundes@gmail.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vnStat is a console-based network traffic monitor for Linux and BSD
that keeps a log of network traffic for the selected interface(s).

Signed-off-by: Paulo Fagundes <paulohefagundes@gmail.com>
---
 .../recipes-support/vnstat/vnstat_2.6.bb      | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-networking/recipes-support/vnstat/vnstat_2.6.bb

diff --git a/meta-networking/recipes-support/vnstat/vnstat_2.6.bb b/meta-networking/recipes-support/vnstat/vnstat_2.6.bb
new file mode 100644
index 0000000000..7521e9542d
--- /dev/null
+++ b/meta-networking/recipes-support/vnstat/vnstat_2.6.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "vnStat is a console-based network traffic monitor for Linux and BSD that keeps a log of network traffic for the selected interface(s)."
+HOMEPAGE = "https://humdi.net/vnstat/"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+SECTION = "net"
+DEPENDS = "gd sqlite3"
+
+SRC_URI = "https://github.com/vergoh/vnstat/releases/download/v${PV}/${BPN}-${PV}.tar.gz"
+SRC_URI[md5sum] = "fe2928a81243cc8a532a357f97221736"
+SRC_URI[sha256sum] = "89276e0a7281943edb554b874078278ad947dc312938a2451e03eb80679f7ff7"
+
+inherit autotools pkgconfig systemd
+
+EXTRA_OECONF = "--disable-extra-paths"
+
+do_install_append() {
+    install -Dm644 ${S}/examples/systemd/vnstat.service "${D}${systemd_system_unitdir}/vnstat.service"
+}
+
+SYSTEMD_SERVICE_${PN} = "vnstat.service"
-- 
2.29.0

