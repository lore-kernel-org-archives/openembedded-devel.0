Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
 by mx.groups.io with SMTP id smtpd.web08.10972.1612985335540963098
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Feb 2021 11:28:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=BY0ROtwA;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.67, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f67.google.com with SMTP id m22so4596039lfg.5
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Feb 2021 11:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PpV2B/V2lkE/httHg0Oes8Rqu9blgBb9YRnZhQm6vC4=;
        b=BY0ROtwAdJ2Pc8AtNbY7W5PJlP2ckXnLz7ozGSjPSgareRESFEj+Hk9tGxse5Eubtg
         O3nV5g/TkYrid6x8JGUp+1f4r5m+QMsmTzdsMmDYdc3zJM3qmHusMeVSzel8d4ORuOWy
         1y8LkGsHzJix8cHzHtYlRjLUdomHerfE6oXBFo1HQ22CPkd2yGGI6VO0LbHTmg+oo0RD
         4/ZCrfWdrv0KX/WTjDGjpDKwKFXasYhAce/c/LwcKTQmasDC8sKjImZk5rgMhRh39AK3
         UCXZsog+1/GHsexZ2IghGGEnMIHmOs/wsvJXAIytsxLTIT1TtajKvabpUgPIbauKiRZQ
         vWEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PpV2B/V2lkE/httHg0Oes8Rqu9blgBb9YRnZhQm6vC4=;
        b=RGtwoXtoOIIkmQqp7RPlUc6ych+a+vGDGLQRyz5I1mYqrtDBls5SHTVn/XYOAweXRW
         tOsXgtlXbrA6qfJCp1x8wsAPdt5iqqDsiL0ujfa2cfhe58Ov2J+0nfVDlNjUigRwRNNv
         O6BeLd3lKf9JD8mGrFFOdYia8/2ukByv/ngCmJxSZ0qstjTTw1A7WyTk/4yFK0nQTs/6
         SYJoNXT89cf12USVht5+z/S89j1XPbGtNVlPguAE0My18EYuuJSaVrj7bIG7qpB0rK0t
         p+arzpAaKMQsln13Ex2cc1l+NSDPT7MDo6BlmZMFakBgUB8NOfHlyD2CvQBUBqXCmgQH
         i17A==
X-Gm-Message-State: AOAM531lm2khbFXDZwVoUpfJraaGqRGW1gwVtjO1Dmc3r2bhkTBJeaiq
	cEEcbUYZ8wcJx/COsODF8BQ9ADXV+YHpKf3I
X-Google-Smtp-Source: ABdhPJyJz+Sv8yiLz/PL5lXpicl7tRRtIKOhVy/k+WgU40BpL+PvAD3IV6G03nhRzwCHIImNdjmbgQ==
X-Received: by 2002:a19:e007:: with SMTP id x7mr2633803lfg.280.1612985333263;
        Wed, 10 Feb 2021 11:28:53 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id w13sm435858lfu.299.2021.02.10.11.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 11:28:52 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-networking][PATCH] fetchmail: udpate to 6.4.16
Date: Wed, 10 Feb 2021 20:28:50 +0100
Message-Id: <20210210192850.1461260-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: copyright years.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{fetchmail_6.4.4.bb => fetchmail_6.4.16.bb}        | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)
 rename meta-networking/recipes-support/fetchmail/{fetchmail_6.4.4.bb => fetchmail_6.4.16.bb} (50%)

diff --git a/meta-networking/recipes-support/fetchmail/fetchmail_6.4.4.bb b/meta-networking/recipes-support/fetchmail/fetchmail_6.4.16.bb
similarity index 50%
rename from meta-networking/recipes-support/fetchmail/fetchmail_6.4.4.bb
rename to meta-networking/recipes-support/fetchmail/fetchmail_6.4.16.bb
index efab0c808..71163c8d9 100644
--- a/meta-networking/recipes-support/fetchmail/fetchmail_6.4.4.bb
+++ b/meta-networking/recipes-support/fetchmail/fetchmail_6.4.16.bb
@@ -1,16 +1,18 @@
 SUMMARY = "Fetchmail retrieves mail from remote mail servers and forwards it via SMTP"
 HOMEPAGE = "http://www.fetchmail.info/"
-DESCRIPTION = "Fetchmail is a full-featured, robust, well-documented remote-mail retrieval and forwarding utility intended to be used over on-demand TCP/IP links (such as SLIP or PPP connections). It supports every remote-mail protocol now in use on the Internet: POP2, POP3, RPOP, APOP, KPOP, all flavors of IMAP, ETRN, and ODMR. It can even support IPv6 and IPSEC."
+DESCRIPTION = "Fetchmail is a full-featured, robust, well-documented remote-mail retrieval \
+and forwarding utility intended to be used over on-demand TCP/IP links (such as SLIP or PPP \
+connections). It supports every remote-mail protocol now in use on the Internet: POP2, POP3, \
+RPOP, APOP, KPOP, all flavors of IMAP, ETRN, and ODMR. It can even support IPv6 and IPSEC."
 SECTION = "mail"
 LICENSE = "GPLv2 & MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=ca53985c1fd053ae0bffffaa89ed49f1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=06a8d16599e1d0b131390bec01fb571c"
 
 DEPENDS = "openssl"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz \
            "
-SRC_URI[md5sum] = "53d52179c8bf8e2f57489538b49bfda9"
-SRC_URI[sha256sum] = "511b60daabf7543a01de06af07c8772290c6807cd53c42a8504960e978f3abea"
+SRC_URI[sha256sum] = "044b9a0ac03afbae7744979defe3e2e32e39141bca68fd0c8deda2ed40884fb9"
 
 inherit autotools gettext python3-dir python3native
 
-- 
2.25.1

