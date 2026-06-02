Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C872FCD6E60
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 15:39:04 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1321.1780414742884867053
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jun 2026 08:39:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=O21CdSIi;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490ac357c55so22257375e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 Jun 2026 08:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780414741; x=1781019541; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nwarqPNvn4Z/ywyn626BtrONLcLrTb3fkt+WDahp/j0=;
        b=O21CdSIiOroAXTISI9iAbBbUPQkkGcZRaKOXyB0S0EnsgCR2x64c5IERzdTqByIstG
         eUMHaGVO8T/yIE4Q99KVGvHvp5wt8DP2K6phPzLhu+TmFmXqetny7GX5k5xv1UFjMOf1
         d1a96D7q5u2u7nX5YWTEn7QD75W6EUmvLtB3WlhVKXjQr8V8ml4VCpWcq8oDjwsjp4B5
         ElUsmy7ALDpj6mC20yB9EUgAMWSgWaAVKIFH8oCz9RPg+ydj2QFSLLl9s74yUBr2kSvI
         UFeJf0Rnqr5/NSYIBYBOuyl1axRJgb/fEItxnLtBL5LYkV7bm5G/feuBfM1F7Km/tvQy
         Gg/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780414741; x=1781019541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nwarqPNvn4Z/ywyn626BtrONLcLrTb3fkt+WDahp/j0=;
        b=BYye0IzZ7mpMdHGVTtFFqCySXlFcvzaNZLyIWd686q4GkkLcpHL/KAxO88ekbUpATH
         QFoPCnZZRLNf33QQ8/AUFxsJWvKOyNINuFVDZyFKwlDKblqlxY5eIy3F9tNwuIr3v4Cu
         +FligByPHUpZli4FgJ5xRF74Cl85IL06KYGzVS+h1YdacVqJvw3mERZEj/PFaXlnKOkd
         iat7K/d0dv4uztlUWgm1JHVAihsat29i5bsfsfE/roJS2+BH02df9kiuC4zkfGuqRhBz
         3oBzSYxgT7b4QmYEInQ2jowRK8pMrRHjw4/sgse6Dc1iVhT1WGsPZVi7wFLvzWbG6uuS
         scgA==
X-Gm-Message-State: AOJu0YxkVWQgWZW/WpL3EIDw+O6obEwxCh+Yh1CtYttxgLis5QvZedIO
	gtSpf1Xac8y4HcUZGllkNWySvjFOpyKpshxHWci/VQcl8BwmmGilGbRQNOFjJw==
X-Gm-Gg: Acq92OHzyFeO82+I0FhNTVroBh4756RB/wzFb+RAC+Xpg1Qx4D1W2Dbsphl6rAC5GA0
	V9fKvtBRJWOkoFPUxVDfWRb26kaOxEwX0eNyHEgM5dT2TG139+pHTh7wOwKrYLrtOt6q4GgVAyV
	SFGnMlMiA7tN2D18V+1nFSjrNe9LmDcTSKoqAxFaTBGuM62y9BQcnOc+W9wLFVkFISTsa0sFJ7Q
	kmd0UNGnmCNhuKicwK0QNfwJ4Af6ZEm5YnaI9M5EGnpQD3/6AuNB2bXu5mp68KBMHBHxygXloSp
	QJSiVTpby3wzZwUMAoRoeoGS/VemMUZeu8aZm10oKVmsD0lzaOwxvcdVUUwL9EV17iFx3KUAu/L
	W9lF/dF6PCEMLD7dMLL6rpzMQOiPkpCvEhSh6lrv+Gk7Jrr17BAPCmgMtOSZahpY63pbhCPwslM
	ivyFXdVA1LvDzj2AVsXEnH6tMUxz0DWwBXjqmDquI4VSaFaSfFtgxQqjmO3KQHG+2SaHlJ8QjCl
	Sjke8LlLxyY8p/z2iKGWA==
X-Received: by 2002:a05:600c:3515:b0:490:b355:9c70 with SMTP id 5b1f17b1804b1-490b5058859mr4204895e9.11.1780414741147;
        Tue, 02 Jun 2026 08:39:01 -0700 (PDT)
Received: from localhost.localdomain (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e3431bsm70154115e9.12.2026.06.02.08.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 08:39:00 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-networking][PATCH 2/3] mdns: Unpick directory changes during install
Date: Tue,  2 Jun 2026 16:35:50 +0100
Message-ID: <20260602153548.97549-5-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602153548.97549-3-alex.kiernan@gmail.com>
References: <20260602153548.97549-3-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jun 2026 15:39:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127367

Be explicit about where we're taking the installation pieces from rather than
having the complexity of mixed build/source pieces based on current directory
and then confusing anyone who tries to append to do_install.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 .../mdns/mdns_2881.100.56.0.1.bb              | 44 ++++++++-----------
 1 file changed, 19 insertions(+), 25 deletions(-)

diff --git a/meta-networking/recipes-protocols/mdns/mdns_2881.100.56.0.1.bb b/meta-networking/recipes-protocols/mdns/mdns_2881.100.56.0.1.bb
index 3950ee666fc4..391c4898fb47 100644
--- a/meta-networking/recipes-protocols/mdns/mdns_2881.100.56.0.1.bb
+++ b/meta-networking/recipes-protocols/mdns/mdns_2881.100.56.0.1.bb
@@ -66,42 +66,36 @@ TARGET_CC_ARCH += "${LDFLAGS}"
 MDNS_BUILDDIR = "build/${@bb.utils.contains('PACKAGECONFIG','debug','debug','prod', d)}"
 
 do_install () {
-	cd mDNSPosix
-
+	install -d ${D}${bindir}
+	install -d ${D}${includedir}
+	install -d ${D}${libdir}
+	install -d ${D}${mandir}/man5
+	install -d ${D}${mandir}/man8
 	install -d ${D}${sbindir}
-	install ${MDNS_BUILDDIR}/mdnsd ${D}${sbindir}
+	install -d ${D}${sysconfdir}
+	install -d ${D}${systemd_system_unitdir}
+	install -d ${D}${INIT_D_DIR}
 
-	install -d ${D}${libdir}
-	install -m 0644 ${MDNS_BUILDDIR}/libdns_sd.so ${D}${libdir}/libdns_sd.so.1
-	ln -s libdns_sd.so.1 ${D}${libdir}/libdns_sd.so
+	install ${B}/mDNSPosix/${MDNS_BUILDDIR}/mdnsd ${D}${sbindir}
 
-	install -d ${D}${includedir}
-	install -m 0644 ../mDNSShared/dns_sd.h ${D}${includedir}
+	install -m 0644 ${B}/mDNSPosix/${MDNS_BUILDDIR}/libdns_sd.so ${D}${libdir}/libdns_sd.so.1
+	ln -s libdns_sd.so.1 ${D}${libdir}/libdns_sd.so
 
-	install -d ${D}${mandir}/man8
-	install -m 0644 ../mDNSShared/mDNSResponder.8 ${D}${mandir}/man8/mdnsd.8
+	install -m 0644 ${B}/mDNSShared/dns_sd.h ${D}${includedir}
+	install -m 0644 ${B}/mDNSShared/mDNSResponder.8 ${D}${mandir}/man8/mdnsd.8
 
-	install -d ${D}${bindir}
-	install -m 0755 ../Clients/build/dns-sd ${D}${bindir}
+	install -m 0755 ${B}/Clients/build/dns-sd ${D}${bindir}
 
-	install -d ${D}${libdir}
-	oe_libinstall -C ${MDNS_BUILDDIR} -so libnss_mdns-0.2 ${D}${libdir}
+	oe_libinstall -C ${B}/mDNSPosix/${MDNS_BUILDDIR} -so libnss_mdns-0.2 ${D}${libdir}
 	ln -s libnss_mdns-0.2.so ${D}${libdir}/libnss_mdns.so.2
 
-	install -d ${D}${sysconfdir}
-	install -m 0644 nss_mdns.conf ${D}${sysconfdir}
+	install -m 0644 ${B}/mDNSPosix/nss_mdns.conf ${D}${sysconfdir}
+	install -m 0644 ${B}/mDNSPosix/nss_mdns.conf.5 ${D}${mandir}/man5
+	install -m 0644 ${B}/mDNSPosix/libnss_mdns.8 ${D}${mandir}/man8
 
-	install -d ${D}${mandir}/man5
-	install -m 0644 nss_mdns.conf.5 ${D}${mandir}/man5
-
-	install -d ${D}${mandir}/man8
-	install -m 0644 libnss_mdns.8 ${D}${mandir}/man8
-
-	install -d ${D}${systemd_system_unitdir}
 	install -m 0644 ${UNPACKDIR}/mdns.service ${D}${systemd_system_unitdir}
 
-	install -d ${D}${INIT_D_DIR}
-	install mdnsd.sh ${D}${INIT_D_DIR}/mdns
+	install ${B}/mDNSPosix/mdnsd.sh ${D}${INIT_D_DIR}/mdns
 }
 
 pkg_postinst:${PN}-libnss-mdns () {

