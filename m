Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7683E7C6F5
	for <webhook@archiver.kernel.org>; Sat, 31 Jan 2026 21:56:50 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18465.1769896603462510040
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 31 Jan 2026 13:56:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UNtHXF9B;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4806fbc6bf3so34018455e9.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 31 Jan 2026 13:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769896602; x=1770501402; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YSoyCWRcv0CNe+u3pHiCfwCSut4NnCEhlzbpPBbY6tM=;
        b=UNtHXF9BkuuT/8Q5ChpJfyZY12EEeA+8xdgyWlgPjapjOvaqsqkGJwXYGxRkveIMYR
         6VU2qufRnPAJG0DU1MrWzhCzhLD3x6QC0Tql9Dh3vhsd2Da1xxCHpTaJwmGdgFSnMaj6
         TVz+qwfBotq+RZ2otjiDCZuH9hYaebgWnDjILF2GxI9AXGO8KfvBhMyF0jxv9RUmwtAF
         EDjVdnHTaQzk9C1BvOugRXSc3hnTvX7wlE+ueKE32lxL4RtsGOpH00wt4Zpf/DwKGfqR
         aPKkYBQFfKgnQwpPfitDHQ5OMDe7D0cx03RjDU+4Om41ht8XMAiIJHpKmS7Wf6iU5zDb
         oHKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769896602; x=1770501402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YSoyCWRcv0CNe+u3pHiCfwCSut4NnCEhlzbpPBbY6tM=;
        b=Err4k1bnQLcnwcna7aT/00+ix8vS/r73aQpNNh22gEdKyZqrwq7/UsJWvatJfCyFKq
         eaqRKw9LDTGQvZB6JrjjchNv58lIsps4z+/y+0Euk8oqCGfJBTUgq8iqls0kwLHzVJOv
         +0HP3E/7zzl/l3qdi3ErbQfHYcxAPT9GaF/qbgVDAMOEi3twMMFjxTpv1DicvJyAxX+Y
         f11PKKCkyTOqlkO55EsWHA1V6Pjda0Q0p4or7kR4YbGe9L+cZ8xpbe9rjmHGdDH6Pf7r
         Kactufpzei6ld47XcTx04FQUXlDhVcEmjwh5SioOuH00pSk63ftA/SUPwYbrOb86T7LY
         jf3w==
X-Gm-Message-State: AOJu0YwJgc0/aObwOtQr07B2Xp4NMY/M+UIqanoAZVyp82c43Nz1J9tJ
	EKK4Ha3pqURc7BaKrPubQwwXV3Ky8r+MeKlMSUiUfKI2A1sUijXsoe+ttHtL3A==
X-Gm-Gg: AZuq6aLNWm5BT61uj8hQ3lge8LIP+tqWCC8BTraJFcDiDCJ27EocIFqcuhYBVB0/N5P
	/1E7f/Gb+icYQ6OwNdw0to9xgJYeojxrLTgFMaHUncMlMfEt1Xr3ZwW17ptqPl8e7cKM1Th5pXc
	DQxVm+SrYA38zlQgH646RWhgpaV/9bO1tfwoXgpvVzrbROXecszalF0lH9zIsOLrfHl4JMBL5U3
	ZnlCQ0iOoJxK4R6H+cT0OJI6lrv7aSc6wxf1GHyjbGVOdo5C6BdkiGBds5bRGTWtuiB+9nXgXZ2
	NY17SW37GjMo7k5fhXadaQMHMzzg5Xww12hXsxTgN/3LnCeYYWJ1CbmMbgovP2WF+GD9p40k1bJ
	Y52LdhCr02vxGNJ2Zkdmsm6u3P1ecadTuE7pUFmgVfJBpOjG46Qf0F1jB/oo/yh11gWZiWNPav9
	k0SHqtJySRZ+hJe6/2L4Y=
X-Received: by 2002:a05:600c:1549:b0:47e:e779:36e with SMTP id 5b1f17b1804b1-482db49398dmr87862165e9.19.1769896601772;
        Sat, 31 Jan 2026 13:56:41 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806ce56490sm276840065e9.12.2026.01.31.13.56.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 13:56:40 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 3/3] media-types: add recipe
Date: Sat, 31 Jan 2026 22:56:36 +0100
Message-ID: <20260131215636.2633863-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260131215636.2633863-1-skandigraun@gmail.com>
References: <20260131215636.2633863-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 31 Jan 2026 21:56:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124023

This recipe is one of the successors of mime-support, which
provided mailcap and mime.types files. This recipe contains
only the mime.types portion.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../mime-support/media-types_14.0.0.bb        | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 meta-oe/recipes-support/mime-support/media-types_14.0.0.bb

diff --git a/meta-oe/recipes-support/mime-support/media-types_14.0.0.bb b/meta-oe/recipes-support/mime-support/media-types_14.0.0.bb
new file mode 100644
index 0000000000..137d508ebe
--- /dev/null
+++ b/meta-oe/recipes-support/mime-support/media-types_14.0.0.bb
@@ -0,0 +1,39 @@
+SECTION = "base"
+SUMMARY = "MIME files 'mime.types'"
+LICENSE = "PD"
+LIC_FILES_CHKSUM = "file://debian/copyright;md5=f3ace4a4ff8aa9e374be6080e41a822e"
+DEPENDS = "file"
+RDEPENDS:${PN} = "perl"
+RRECOMMENDS:${PN} = "file"
+
+SRC_URI = "${DEBIAN_MIRROR}/main/m/${BPN}/${BPN}_${PV}.tar.xz"
+SRC_URI[sha256sum] = "d5877ac8c1fa3661b3c9ace293ae154c844fad686786f085e954c014f7e73f4d"
+S = "${UNPACKDIR}/work"
+
+inherit update-alternatives
+
+FILES:${PN} += " ${datadir}/bug/media-types"
+
+docdir:append = "/${BPN}"
+
+do_install () {
+    install -d ${D}${sysconfdir}
+    install -d ${D}${datadir}/bug/media-types
+    install -d ${D}${docdir}
+    install -m 644 mime.types         ${D}${sysconfdir}/
+    install -m 644 debian/bug-presubj ${D}${datadir}/bug/media-types/presubj
+    install -m 644 debian/changelog   ${D}${docdir}/changelog
+    install -m 644 debian/copyright   ${D}${docdir}/copyright
+    cd ${D}${docdir}; gzip -9v changelog
+}
+
+ALTERNATIVE_PRIORITY = "90"
+ALTERNATIVE:${PN} = "mime.types"
+ALTERNATIVE_LINK_NAME[mime.types] = "${sysconfdir}/mime.types"
+
+INHIBIT_DEFAULT_DEPS = "1"
+
+# Debian used to have mime-support package which was media-types and
+# mailcap recipes in one.
+PROVIDES += "mime-support"
+RDEPENDS:mime-support = "mailcap"

