Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web12.25169.1591602276453419675
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jun 2020 00:44:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bytedance-com.20150623.gappssmtp.com header.s=20150623 header.b=KLId+l28;
 spf=pass (domain: bytedance.com, ip: 209.85.160.196, mailfrom: yulei.sh@bytedance.com)
Received: by mail-qt1-f196.google.com with SMTP id d27so13938589qtg.4
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Jun 2020 00:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=M+EWjE94HzsXjr/xs+lxIKMTy1taEXaSSXhy53oHsV0=;
        b=KLId+l28jvLDXcLMm5LT8C+LIY5DMsyiDvJPb6kS0VgSNi+tiOVOtR9TY+FtX60eaq
         B5mWQJV9Siusf24rLsigzswSs1kFREiHUcoye7ms+TNhRDnpw7r91O2WJPRuSq+teOUG
         vFwEOwUDt0+BHibSAIOkceJadBM0KIz1NkvQuXddR0cvTVaSRIGrn0jF2JBtCwojn8rF
         JI9PjSvlC5BM8KtnRKgNy1pjCqm0IiCGOlZDLvbZuutLmNdFgqdwA8RXMkSpvSmS+QuG
         e/tkT3dp9yH37zQFScA0tw/Z+Tynu2Wyi+DgD7qScnggC3VkxMasbl7Wo0dmoZ8ik9fz
         fzDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=M+EWjE94HzsXjr/xs+lxIKMTy1taEXaSSXhy53oHsV0=;
        b=j3rOxBo4nzkMDDMfuWTMSaaZXCW4V9Bd89w+4g8Zr0NgR/2cv8Xw43/0G2qsp8TGPo
         HIbvhO5CfPV7Ng2MBPUmJU9nKg1K36UHPR7zq0aFcf0veT7k8bMX/nInMhP2LXyk6Log
         QSG5fzlvLh9wmHz89fjTl7XJAb1BYP6yCMVuIpfJa5O6rRT1cECzXGLkQ/5LsDJzGL0f
         hSlfRYU5UWIEZJjvyU4e/H9fnMOIHkRG4wtvAb/AZR3DInRebI1hSTVlawiZMQ+q1Vzg
         n2UO+gjGqpSdsTNqclFbFoh3yxMnJg2LSk603qKE+HLygtZdyZHt1KBH7C1wcHZs48rD
         gHEA==
X-Gm-Message-State: AOAM533/IackjrWSgg8ZzWZ90m9w70bf1EiGOgNWGrxNtOGwLJ66LF1o
	pO6ACuI5HqQ+IN2nSXtw8Zj11QwcRkecfVk/
X-Google-Smtp-Source: ABdhPJzDXPxnmAjP/nC0isOb92qmtmLSD2zOmbO82c9cZRZpc5HC6Fcb1iBa4g4Gk53uqbkf9eXVgg==
X-Received: by 2002:aed:3b0d:: with SMTP id p13mr22794171qte.263.1591602275257;
        Mon, 08 Jun 2020 00:44:35 -0700 (PDT)
Return-Path: <yulei.sh@bytedance.com>
Received: from n189-046-153.byted.org ([130.44.212.121])
        by smtp.gmail.com with ESMTPSA id l188sm6128240qke.127.2020.06.08.00.44.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Jun 2020 00:44:34 -0700 (PDT)
From: yulei.sh@bytedance.com
To: openembedded-devel@lists.openembedded.org
Cc: Lei YU <yulei.sh@bytedance.com>,
	raj.khem@gmail.com
Subject: [meta-filesystems][PATCH] httpfs2: mount a http url as a file based on FUSE
Date: Mon,  8 Jun 2020 07:44:25 +0000
Message-Id: <20200608074425.3149491-1-yulei.sh@bytedance.com>
X-Mailer: git-send-email 2.11.0

Signed-off-by: Lei YU <yulei.sh@bytedance.com>
---
 .../httpfs2-fuse/httpfs2_0.1.5.bb                  | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-filesystems/recipes-filesystems/httpfs2-fuse/httpfs2_0.1.5.bb

diff --git a/meta-filesystems/recipes-filesystems/httpfs2-fuse/httpfs2_0.1.5.bb b/meta-filesystems/recipes-filesystems/httpfs2-fuse/httpfs2_0.1.5.bb
new file mode 100644
index 000000000..2fa5ec1fb
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/httpfs2-fuse/httpfs2_0.1.5.bb
@@ -0,0 +1,25 @@
+SUMMARY = "This is a filesystem client based on the HTTP using FUSE"
+HOMEPAGE = "http://httpfs.sourceforge.net"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://debian/copyright;md5=83f224c5182f148ec92e0b9f84b3c6c7"
+
+inherit pkgconfig
+
+DEPENDS += "fuse"
+RDEPENDS_${PN} += "fuse"
+
+SRC_URI += "https://astuteinternet.dl.sourceforge.net/project/httpfs/httpfs2/httpfs2-${PV}.tar.gz"
+SRC_URI[sha256sum] = "01cb4bb38deb344f540da6f1464dc7edbdeb51213ad810b8c9c282c1e17e0fc1"
+
+S = "${WORKDIR}/httpfs2-${PV}"
+
+do_compile() {
+    cd ${S}
+    oe_runmake httpfs2
+}
+
+do_install() {
+    cd ${S}
+    install -d ${D}${bindir}
+    install -m 0755 httpfs2 ${D}${bindir}
+}
-- 
2.11.0

