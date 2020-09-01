Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web12.8329.1598999776113230509
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Sep 2020 15:36:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=R46Ex0QS;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id gf14so1298146pjb.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Sep 2020 15:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8m92HM6zypGTC5sPyBXchWh2awyvhFpHOwpw1Ai6884=;
        b=R46Ex0QSffiwgMC/Bw083QlM99mg5VP+InRY8FbmekuZvAx7m20ELX9CAerWW6nHPm
         Um+nabLmZcjOqNx1D2K4vY2A17Xe3vj+vWt0FY9B0fMqzRK7uL82kpAmXFBAsHNZoGYB
         92Ms9tLP3heAZbnCnA9Njrz3W3MUZMxCcP7lnREQFNuUzu5uTdFEZu4z0t5GpPGZY8Vu
         cxmZs6d38NEJxqG9Hn6G9MLk7Sg7u1v1GXrzUzy359Gx31vGdqhc27lMlL6TFRyUDHZm
         Bz8qaQYx/lRtn8OJqNQgyZXfJVvtJDDjR5pbnjZHrNcTntxH/5eDxS7uQWDzdJ9Lxkpt
         V+0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8m92HM6zypGTC5sPyBXchWh2awyvhFpHOwpw1Ai6884=;
        b=fhcK1vqAg2FrwRGbTOUgKAIgxdPIapKpTA7i0R1KFiJHQnheoYq6PY9tTd1X4JJIAt
         Z6/OkXkaNqq4LyptffP79jFhfdCxVTuzOtelbe8hJHYGN6D+vvTDdbmr1qFb9PQBRTbQ
         Mc68VNEkvrdm+SabjFFvjMDn/Ied6CrnAG8jrnx3k+P9iWFygGCWb6AC1fOnZvOOohiJ
         si0s9r7qo5yMcz9vrA562RAEywG/T4upUwjWCbPHwyRbgHm/E0jQSzHVZVqXaPiOHCyU
         X+Xv+teMiGVZpDWs3YqK6IiUAYQEuMHg4aK9dU9YZnKsRs1WCmhVh7oDea6HNIdUqtRr
         ud0A==
X-Gm-Message-State: AOAM5305cV5Ry2gMBX8MGOeG1DIgqncz/gz3BhiYLj9i5DZlMkDxUNST
	sYMZJ4lijQACENuD8+jSP9iDd8m1uXNCcQ==
X-Google-Smtp-Source: ABdhPJztbymkAPUWX7zGZd/hSRug9eQjb5zgGQE+82G2Jn+XtHYoG4VArNHUVjMqEnCRj18Vynm96w==
X-Received: by 2002:a17:902:8c94:: with SMTP id t20mr3353312plo.76.1598999775328;
        Tue, 01 Sep 2020 15:36:15 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e89d])
        by smtp.gmail.com with ESMTPSA id q34sm3157964pgl.28.2020.09.01.15.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 15:36:14 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 01/10] networkmanager: Depend on dhcpcd
Date: Tue,  1 Sep 2020 15:36:03 -0700
Message-Id: <20200901223612.1386026-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dhcp-client is being removed from oe-core

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../networkmanager/networkmanager_1.22.14.bb                    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.22.14.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.22.14.bb
index 4e4217c1f4..ac2282ea1b 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.22.14.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.22.14.bb
@@ -74,7 +74,7 @@ PACKAGECONFIG[consolekit] = "--with-session-tracking=consolekit,,consolekit,cons
 PACKAGECONFIG[modemmanager] = "--with-modem-manager-1=yes,--with-modem-manager-1=no,modemmanager"
 PACKAGECONFIG[ppp] = "--enable-ppp,--disable-ppp,ppp,ppp"
 # Use full featured dhcp client instead of internal one
-PACKAGECONFIG[dhclient] = "--with-dhclient=${base_sbindir}/dhclient,,,dhcp-client"
+PACKAGECONFIG[dhclient] = "--with-dhclient=${base_sbindir}/dhclient,,,dhcpcd"
 PACKAGECONFIG[dnsmasq] = "--with-dnsmasq=${bindir}/dnsmasq"
 PACKAGECONFIG[nss] = "--with-crypto=nss,,nss"
 PACKAGECONFIG[resolvconf] = "--with-resolvconf=${base_sbindir}/resolvconf,,,resolvconf"
-- 
2.28.0

