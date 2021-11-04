Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72EFDC433EF
	for <webhook@archiver.kernel.org>; Thu,  4 Nov 2021 13:52:04 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.12049.1636033923324093507
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Nov 2021 06:52:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=a2PvW1NW;
 spf=pass (domain: gmail.com, ip: 209.85.214.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id u17so7295184plg.9
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Nov 2021 06:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ngj7ufsowicagT+cy1YkWRL9T6O/IN1hzNe6kXuzL9I=;
        b=a2PvW1NWxhJRpIMmujzT3XYcYAXgektN59Jv/uTmS45AHugHL20QBn1Pt4LT3wCruN
         sfNHfB7DAmoPgzb8X0al4TNDC/zo7h+l8Rkc7qoa53kLPRSiinyoXjE6YuN870zVlnxg
         Tk6ndei47iUhpfCDYV4PY1+mjNBfl6PS7rlpmT3LgO6fOPqq1tQhreEzkUYho0s5G2v1
         Odv9TozWK/fu59l5OcgBILnDAReQUu58FfZVoU62L/18m/LVYNTv3PYm7lAc+KMo9Qqi
         exElfssgTLggsCGeG4q8sAuaZyOpQpM9joEefZcmDIkN83lIVka3ID2g0lnFhYxm8rng
         B/ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ngj7ufsowicagT+cy1YkWRL9T6O/IN1hzNe6kXuzL9I=;
        b=QILZCie41w4oUeX0XtXrc1QSPSG5PC0R4+a/dCAnTJX5nQ0y3icWrUiIIBa8WrE3FT
         Z6KVUD0bAjuX+sGRxbN91ilTO45k3pJ9MioivdqsMUkCi9eus8locHt/uPPXZYQCqDw2
         2J8KHT4ILbndCqxgLEc3OJpPg7kHi9ts1lwElvQjNG2PDQPN9XsD8xW8ALd+pn8YZVHG
         pcTPUqvXkrOzioMt5T9F+v6miyM1UI3LfiFOANn2HSimm+LAkGXauJdZn8og3BVYqwV9
         zRVQspHhqARr8yS701B+N7hV3hngvSr3VjTcNJtlo6Y7kfW2vu4/farQeTkSyHrYvn+5
         SJLA==
X-Gm-Message-State: AOAM531f+1fDGF0hlDLEa8N15cN/V6AeTuuGrUE0481lLuzYWCnFsSUq
	UDrNv9ue0cNui/t+l/ncczyUKAHckXU=
X-Google-Smtp-Source: 
 ABdhPJy4LCL78fJKUf3Fl1cL+QAvdgIW72KTB05IgwEbUSS4qPrNRz+7NoyvPu7Em7eSFb0xNTfBBw==
X-Received: by 2002:a17:90a:7d11:: with SMTP id
 g17mr22380075pjl.19.1636033922547;
        Thu, 04 Nov 2021 06:52:02 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::f94a])
        by smtp.gmail.com with ESMTPSA id 8sm7476509pjt.46.2021.11.04.06.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Nov 2021 06:52:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-webserver][PATCH v2 2/2] hiawatha: Create /var/log /var/run at
 runtime
Date: Thu,  4 Nov 2021 06:51:59 -0700
Message-Id: <20211104135159.2379714-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211104135159.2379714-1-raj.khem@gmail.com>
References: <20211104135159.2379714-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Nov 2021 13:52:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93819

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Limit the change to /var/log and /var/run

 .../recipes-httpd/hiawatha/hiawatha_10.12.bb  | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.12.bb b/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.12.bb
index f66ec7d736..f13f144fcc 100644
--- a/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.12.bb
+++ b/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.12.bb
@@ -50,7 +50,23 @@ do_install:append() {
         install -m 644 ${WORKDIR}/hiawatha.service ${D}/${systemd_unitdir}/system
     fi
 
-    rmdir --ignore-fail-on-non-empty "${D}${localstatedir}" "${D}${localstatedir}/run"
+    # /var/log/hiawatha and /var/lib/hiawatha needs to be created in runtime.
+    # Use rmdir to catch if upstream stops creating these dirs, or adds
+    # something else in /var/log.
+    rmdir ${D}${localstatedir}/log/${BPN} ${D}${localstatedir}/log
+    rmdir ${D}${localstatedir}/run
+    rmdir --ignore-fail-on-non-empty ${D}${localstatedir}
+
+    # Create /var/log/hiawatha at runtime.
+    if [ "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}" ]; then
+        install -d ${D}${nonarch_libdir}/tmpfiles.d
+        echo "d ${localstatedir}/log/${BPN} - - - -" > ${D}${nonarch_libdir}/tmpfiles.d/${BPN}.conf
+    fi
+    if [ "${@bb.utils.filter('DISTRO_FEATURES', 'sysvinit', d)}" ]; then
+        install -d ${D}${sysconfdir}/default/volatiles
+        echo "d root root 0755 ${localstatedir}/log/${BPN} none" > ${D}${sysconfdir}/default/volatiles/99_${BPN}
+    fi
+
 }
 
 CONFFILES:${PN} = " \
@@ -61,4 +77,5 @@ CONFFILES:${PN} = " \
     ${sysconfdir}/hiawatha/php-fcgi.conf \
 "
 
+FILES:${PN} += "${nonarch_libdir}/tmpfiles.d"
 FILES:${PN}-dev = "${libdir}/hiawatha/*${SOLIBSDEV}"
-- 
2.33.1


