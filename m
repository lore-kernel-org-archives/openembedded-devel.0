Return-Path: <potin.lai.pt@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6CB6ECAAD4
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 02:11:32 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web12.32219.1661479885189658254
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 19:11:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=epgsy5Lx;
 spf=pass (domain: gmail.com, ip: 209.85.216.46,
 mailfrom: potin.lai.pt@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id
 m10-20020a17090a730a00b001fa986fd8eeso6763240pjk.0
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 19:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=uyed1zXEKGewt8cnrxjS4SJN6UU1O3yRvEMMH8KXD3M=;
        b=epgsy5Lxd1267tiUW/UQYhHUK9B93bRxkPHXUW+XG8hFbBXZ1+NUm/OeeL81/Nic+b
         4+mii4yt4FRN7FQumJQ78Jj0bOFdQ4xs1RWRq5A+shXrx5S/F3w1D3a/vx+4+kyEVPZu
         fhN/PqiOZ3tmtqzrtHWhWzxe8AoVih0jmLSBMZugDvGZ7/273wje80Jlq2Mq0aKbS0H8
         XR2xz6ejFr5BRHUiADd4yZbj1G67GXg0o4EycgFeAS4vim9p/O5XFRmtYACdn5b6lZ19
         knQOKrXYr7VuRlT1RtaZW70BX9+E1YbLYsTd6ouk5gCVFctFA2mhJCjwI1XRJz1wQSZu
         zpZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=uyed1zXEKGewt8cnrxjS4SJN6UU1O3yRvEMMH8KXD3M=;
        b=ZOczANGkV3xcm97zUHIb63Jw3uTLzxSvDekH3oH4SHTxvN4KdGaaV+ZJ/GmBfkUUBS
         xGF1mssPESix8VgXW5uqrjekAsKnWdqrFTAb/N+Jpp9qOxduY8QlRdzjztLvKAym4kz7
         iBJDrNaUb/1OStUm1vjWAX55bq+2BOnVhQootzVglEs5kJ8VUWM3njz6hDOyIO0QTjcB
         WwYgQOg99JlEcQAzN1J5Sc9sYKr3f+2N5oZw1diT2+KbRtYQFBl1f8lNFU4VPvpNKFW1
         jO5I7+kXRh58FXjqtWs2kXOe1d66+pIpTIekGd7f9n497+wm1AzF5yekmF75KfBK01ZR
         zGNg==
X-Gm-Message-State: ACgBeo3CbWoebypCCA4TiaeIdfpkB3HpqOcODYkjfZrLBPxDYfR+Gl/T
	YV0yxUdzimbPQl2sff2ewSzp/nuOZGiYwg==
X-Google-Smtp-Source: 
 AA6agR4A7ly4J68kCSDpi9XIc3BOMW86A9etdoE+RznwuaRo6Nkjgw3G/JrXxtNiuesEGmMcDKi7TA==
X-Received: by 2002:a17:90b:1b4c:b0:1fb:5138:7aeb with SMTP id
 nv12-20020a17090b1b4c00b001fb51387aebmr2003854pjb.68.1661479884168;
        Thu, 25 Aug 2022 19:11:24 -0700 (PDT)
Received: from localhost.localdomain (125-228-123-29.hinet-ip.hinet.net.
 [125.228.123.29])
        by smtp.gmail.com with ESMTPSA id
 z75-20020a63334e000000b0041a67913d5bsm250180pgz.71.2022.08.25.19.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 19:11:23 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Patrick Williams <patrick@stwcx.xyz>,
	Potin Lai <potin.lai@quantatw.com>,
	Potin Lai <potin.lai.pt@gmail.com>
Subject: [meta-oe][PATCH 1/7] libplist: add libplist_git.bb
Date: Fri, 26 Aug 2022 01:32:21 +0000
Message-Id: <20220826013227.181910-2-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220826013227.181910-1-potin.lai.pt@gmail.com>
References: <20220826013227.181910-1-potin.lai.pt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Aug 2022 02:11:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98442

Add libplist_git.bb to point to latest commit on github

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 .../libimobiledevice/libplist_git.bb          | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 meta-oe/recipes-extended/libimobiledevice/libplist_git.bb

diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist_git.bb b/meta-oe/recipes-extended/libimobiledevice/libplist_git.bb
new file mode 100644
index 000000000..82f3e4d0c
--- /dev/null
+++ b/meta-oe/recipes-extended/libimobiledevice/libplist_git.bb
@@ -0,0 +1,37 @@
+SUMMARY = "A library to handle Apple Property List format whereas it's binary or XML"
+HOMEPAGE = "https://github.com/libimobiledevice/libplist"
+LICENSE = "GPL-2.0-only & LGPL-2.1-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ebb5c50ab7cab4baeffba14977030c07 \
+                    file://COPYING.LESSER;md5=6ab17b41640564434dda85c06b7124f7"
+
+DEPENDS = "libxml2 glib-2.0 swig python3"
+
+inherit autotools pkgconfig python3native python3targetconfig
+
+PV = "2.2.0+git${SRCPV}"
+
+SRCREV = "db93bae96d64140230ad050061632531644c46ad"
+SRC_URI = "git://github.com/libimobiledevice/libplist;protocol=https;branch=master"
+
+S = "${WORKDIR}/git"
+
+CVE_CHECK_IGNORE += "\
+    CVE-2017-5834 \
+    CVE-2017-5835 \
+    CVE-2017-5836 \
+"
+
+do_install:append () {
+    if [ -e ${D}${libdir}/python*/site-packages/plist/_plist.so ]; then
+        chrpath -d ${D}${libdir}/python*/site-packages/plist/_plist.so
+    fi
+}
+
+PACKAGES =+ "${PN}-utils \
+             ${PN}++ \
+             ${PN}-python"
+
+FILES:${PN} = "${libdir}/libplist-2.0${SOLIBS}"
+FILES:${PN}++ = "${libdir}/libplist++-2.0${SOLIBS}"
+FILES:${PN}-utils = "${bindir}/*"
+FILES:${PN}-python = "${libdir}/python*/site-packages/*"
-- 
2.31.1


