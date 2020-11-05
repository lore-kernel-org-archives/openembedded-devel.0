Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
 by mx.groups.io with SMTP id smtpd.web11.1603.1604605800107385777
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2020 11:50:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Q7j5bepX;
 spf=pass (domain: gmail.com, ip: 209.85.219.65, mailfrom: rosbrookn@gmail.com)
Received: by mail-qv1-f65.google.com with SMTP id da2so1294900qvb.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2020 11:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W48r466Q6+xhXGy1eL51IHYljJS6bjJy9Gv03eDCBwg=;
        b=Q7j5bepXN/MTRHueUwDmSdzRZ/ZajOL+WNDOyXVgPakRqCeF10IA9WWDR487G7UhZU
         52rLBADR8I+WRr/XgcOOham+c5ce73f9rVkJhfYbpITP4cYPDSytCZADKkTjbmcrcxor
         8hoMTB8UXVtNV6F5ISVSpZ7PONkrfQewcz/WVtmCFbGFIYrLIIh4dtDhyUHuREi4Xsbl
         ++2K40sjPc9qCiRH6d/VfJtTkkztiC17OOHKo8F99x9m9h0Yo/8v+C7AWAx9ayW8lJwy
         KiCBOzZDcXr5W9m0lc6uOfNb/jXNxgL2qv+oo07VTqfiZmDDzFl2p3g86HrOeUPmp6lq
         ATig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W48r466Q6+xhXGy1eL51IHYljJS6bjJy9Gv03eDCBwg=;
        b=L+WYCgXzZ059sQ5wDWOPB4mCTgeQpvDi6lstRLLmWKskTAV8SADhCTHsh2SqjIUf3j
         9zStXrOu5UedUdDW5paLjWVJ5DtqUU9UYXahSn9AJSuoj50SAuxG7yVgLp6VTZIw7ttV
         KfHZ08NeY/3N4wxMFDwp3ud0YcpWGzggmrXZs1WNeb83z5BOBrWo+2ELGd47nTSqr31A
         2CRsF0jow02fZTuJLw1V5eh4zUPoD9kNRlFvGSoeOfOgjPjrdel2mSVo6QoGfISfvKid
         ksv8r/99n5e/XPE+t0c+gvmrZvIsGKVh2GYWu2nZt60jaW1P+8mYPsPcPkVB0fv6z3nI
         7EcA==
X-Gm-Message-State: AOAM532MXn64Is1KH8tVcDylSeymInKTaddAaP0vxKkAuRkc0as4D3ZV
	jNoD64DXtDZBxP7ZUd0/EVXPHzXvQcGb+g==
X-Google-Smtp-Source: ABdhPJzGD/T0T1L9BuZu+85Id+6bw6j8U6rWjQvcbdQx/DLInB2VH4SEoO1ZMY6iiBVwiYg9N2A0Zw==
X-Received: by 2002:ad4:4f22:: with SMTP id fc2mr4052070qvb.28.1604605798780;
        Thu, 05 Nov 2020 11:49:58 -0800 (PST)
Return-Path: <rosbrookn@gmail.com>
Received: from FED-nrosbr-BE.crux.rad.ainfosec.com (209-217-208-226.northland.net. [209.217.208.226])
        by smtp.gmail.com with ESMTPSA id q27sm1694224qki.60.2020.11.05.11.49.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Nov 2020 11:49:57 -0800 (PST)
From: "Nick Rosbrook" <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com,
	Nick Rosbrook <rosbrookn@ainfosec.com>
Subject: [meta-networking][PATCH 1/2] strongswan: do not use deprecated stroke and starter by default
Date: Thu,  5 Nov 2020 14:49:52 -0500
Message-Id: <78fd054347adbdb03d3faaae803d9ab3ad4da060.1604605168.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1604605168.git.rosbrookn@ainfosec.com>
References: <cover.1604605168.git.rosbrookn@ainfosec.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The swanctl and vici configuration of strongswan is preferred, as the stroke
plugin used with starter is deprecated. As a reasonable default, add swanctl
systemd-charon to PACKAGECONFIG by default, removing charon and stroke.

While here, make sure strongswan-starter.service is only installed when
charon is enabled. The current unconditional installation of
strongswan-starter.service can break systems which install strongswan.service
for use with swanctl.

Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
---
 .../recipes-support/strongswan/strongswan_5.8.4.bb    | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb b/meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb
index 8a8809243..59641cb83 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb
@@ -25,7 +25,7 @@ EXTRA_OECONF = " \
 
 EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)}"
 
-PACKAGECONFIG ??= "charon curl gmp openssl stroke sqlite3 \
+PACKAGECONFIG ??= "curl gmp openssl sqlite3 swanctl systemd-charon \
         ${@bb.utils.filter('DISTRO_FEATURES', 'ldap', d)} \
 "
 PACKAGECONFIG[aesni] = "--enable-aesni,--disable-aesni,,${PN}-plugin-aesni"
@@ -133,4 +133,11 @@ RDEPENDS_${PN} += "\
 RPROVIDES_${PN} += "${PN}-systemd"
 RREPLACES_${PN} += "${PN}-systemd"
 RCONFLICTS_${PN} += "${PN}-systemd"
-SYSTEMD_SERVICE_${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'swanctl', '${BPN}.service', '', d)} ${BPN}-starter.service"
+
+# The deprecated legacy 'strongswan-starter' service should only be used when charon and
+# stroke are enabled. When swanctl is in use, 'strongswan.service' is needed.
+# See: https://wiki.strongswan.org/projects/strongswan/wiki/Charon-systemd
+SYSTEMD_SERVICE_${PN} = " \
+    ${@bb.utils.contains('PACKAGECONFIG', 'swanctl', '${BPN}.service', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'charon', '${BPN}-starter.service', '', d)} \
+"
-- 
2.17.1

