Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
 by mx.groups.io with SMTP id smtpd.web10.3991.1603426464810052299
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2020 21:14:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tfEJmtpi;
 spf=pass (domain: gmail.com, ip: 209.85.166.177, mailfrom: paulohefagundes@gmail.com)
Received: by mail-il1-f177.google.com with SMTP id j8so139698ilk.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Oct 2020 21:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/M6V5SWpv5YJ3ZplsV8dijQ2a3s+9NrkF+WOv+HB/xk=;
        b=tfEJmtpisKBmAL4TnzuUYNWMs1PYBRn1TCCHfQKaxaJbWlZ5OMsvj8ap90WxrlLBPb
         s3eFE4RsZC6cRELAtIkCd4oZI5wgbUqaMZ2f7aIuntgijVdBFpw1WQcuueAOk1NH2xoe
         Qtin7ui8hOpkW8g0lXGglJkFtBj4l4mS62eCSaP7xSR1ghh8QWa3+aOncSs/cu9o8OGA
         VAYOmSDb7xqZ7Kbd9ECLplfAetoaSCWR+JiU6Qrfyg5k+TLpko1W6cjaZQLX+YCuNXe4
         iGedcjZvsG4sl59bLQTEKCeiGvVT15Gerc8OWxJVVl5mGQbuJkmI1yxL6LcsOkOv+hU2
         dC7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/M6V5SWpv5YJ3ZplsV8dijQ2a3s+9NrkF+WOv+HB/xk=;
        b=KvLYrJoZVWwvp6qPtTx0opT8sPk2A3PKs6dVzhivvqgF4F5HRw9T/A+cun8YOSYBkS
         d3Y931toDrjg8d9m0cuOlyBIMM57uRHw6Dx7luXj524qsugN1wCht5mCNu1zR6ipNDLs
         Ej23oYvtS1KMa6Y3q854sBUgcHK3aDSzPRrnc6s7lbbEI/0MG0Hs71Nz3YTChWTvcawV
         IQ8nVYCkRKlqMd+GBXHusQYId32+wkFAmvD4LXnfONlSQioaaeNxU1vICjKx9BL6B7kK
         H/UrcUM4eQa7KgsUn/9aXjPTLuTkPus4iSu/DqgwgAnDgFYRltzVitylKKyjYIPYs0EE
         XXcQ==
X-Gm-Message-State: AOAM5305dQvg6dHQxiVU7xhPZUmUZKFBo+6omHIOr4Bj54J01mR8HgZz
	ah5JC0rBbdg/xj3fqe/IlJMZKgoXLJI=
X-Google-Smtp-Source: ABdhPJy8sG3W8fO5FsLbnkMy9Yj3UmZJnwCMBKEbTJNUs0NF7U0KC21gNhlANGbIPZMoH+WmIqA9Pw==
X-Received: by 2002:a05:6e02:501:: with SMTP id d1mr308809ils.68.1603426463987;
        Thu, 22 Oct 2020 21:14:23 -0700 (PDT)
Return-Path: <paulohefagundes@gmail.com>
Received: from localhost.localdomain (c-174-52-8-24.hsd1.ut.comcast.net. [174.52.8.24])
        by smtp.gmail.com with ESMTPSA id 2sm50801ill.78.2020.10.22.21.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2020 21:14:23 -0700 (PDT)
From: "Fagundes, Paulo" <paulohefagundes@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Paulo Fagundes <paulohefagundes@gmail.com>
Subject: [meta-networking][PATCH v4] vnstat: add recipe
Date: Thu, 22 Oct 2020 22:14:14 -0600
Message-Id: <20201023041414.167322-1-paulohefagundes@gmail.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vnStat is a console-based network traffic monitor for Linux and BSD
that keeps a log of network traffic for the selected interface(s).

Signed-off-by: Paulo Fagundes <paulohefagundes@gmail.com>
---
 .../packagegroup-meta-networking.bb           |  1 +
 .../recipes-support/vnstat/vnstat_2.6.bb      | 20 +++++++++++++++++++
 2 files changed, 21 insertions(+)
 create mode 100644 meta-networking/recipes-support/vnstat/vnstat_2.6.bb

diff --git a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
index 0e668f7dd3..a9dc6a13ef 100644
--- a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
+++ b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
@@ -250,6 +250,7 @@ RDEPENDS_packagegroup-meta-networking-support = "\
     tinyproxy \
     uftp \
     unbound \
+    vnstat \
     wpan-tools \
     ettercap \
 "
diff --git a/meta-networking/recipes-support/vnstat/vnstat_2.6.bb b/meta-networking/recipes-support/vnstat/vnstat_2.6.bb
new file mode 100644
index 0000000000..9a650f4090
--- /dev/null
+++ b/meta-networking/recipes-support/vnstat/vnstat_2.6.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "vnStat is a console-based network traffic monitor for Linux and BSD that keeps a log of network traffic for the selected interface(s)."
+HOMEPAGE = "https://humdi.net/vnstat/"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
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

