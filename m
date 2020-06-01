Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.48786.1591047963601982202
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jun 2020 14:46:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Il6qaY39;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id l10so1293599wrr.10
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jun 2020 14:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=C66t6QYuA6VPuAaMeKzvz6TcDQ9BTNgwmZZavGE5KNU=;
        b=Il6qaY39iKTp76aXAyhGcKKhH7zsM4WFLsc8qILBOlODmxpWVGnPCxqCB6Wgq9Ry/I
         yUQjyx6LrjTT2haoGcrECQLRzCqHIbuuJKKnV7+9Lwm4/jsGal9jzKQyRbJPuqRvrpQU
         Mdl+HlsXK7TEfCDfssc3sCfwqTRfND2j0y70SPZfXX6rwqV131XCVhk/DB6yFVj7UF18
         dXEFAcX1f+pUdJTLJpCLloVuvjQ6kM41oqwGrWAX6Ms424l9sQcoB8YQI2zl6DOyA2g8
         Wj7laKHg7ZlHMDwLIOBt6C1gQPnP6Ak5YNeBfTHN0mQKpjpF8YYm4XZ5HKKHpPYH4ybO
         wwJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C66t6QYuA6VPuAaMeKzvz6TcDQ9BTNgwmZZavGE5KNU=;
        b=hXs0ZXGhBWo44x/Kg7U2gDBIVZu6XYOBjjf26cFZOgmMXtosDcoSsUHLHc5/bujjIM
         JYnIaVYdhcjTtOFVN4rjtDW/sg7Ahi6qg55WQOoTGDzlp3YSbAgJYj7DHrOuAwbNuaTD
         9+exOxFjwhY3gGObb6UXL8IPbEpByGGMW1Cw1LoiviBdnb9/4eH++Aqeq9H8tKtmCtEM
         SxsPDrzzhQiSny0C7eOSbmW07RdVzAlV9gToyr4cxQ/WpJMFFbpVfJSTgPtfe0czcPws
         e7zNFMeAWEh0YlMydeajaNoj/tmqLX3bD2BthxdLTXLW6Nlgni9uXQT3xDYTmQu95F99
         AJmw==
X-Gm-Message-State: AOAM530CrHGAcN8o42aI5mdvMyZYwZ1q4YBMocBFuzqFYTWGeovGs5Mb
	d3y8jo0P0Apy1HABKsAvll8PVuleNH0=
X-Google-Smtp-Source: ABdhPJzaiuqvF0Ocir47Zwurq7mL4xg9TKZij1c/FA7WD9PYRbgvqSyH6ez3wy6PV/zOG0Fmi6PGSw==
X-Received: by 2002:adf:f44b:: with SMTP id f11mr4187950wrp.165.1591047961862;
        Mon, 01 Jun 2020 14:46:01 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f06ad34da2c69d11ac2eac0.dip0.t-ipconnect.de. [2003:f0:7f06:ad34:da2c:69d1:1ac2:eac0])
        by smtp.gmail.com with ESMTPSA id 40sm1050119wrc.15.2020.06.01.14.46.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 14:46:01 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 35/38] yelp-xsl: upgrade 3.34.2 -> 3.36.0
Date: Mon,  1 Jun 2020 23:45:13 +0200
Message-Id: <20200601214516.26624-36-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200601214516.26624-1-schnitzeltony@gmail.com>
References: <20200601214516.26624-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

3.36.0
======
* Added a syntax highlighter for Ducktype
* Support multiple desc elements for links (MEP-0008)
* Fixed missing link when group specified twice on topic links
* Typo fix in docs
* Updated translations:
  dz    (Andre Klapper)
  en_GB (Zander Brown)
  ms    (Umarzuki Bin Mochlis Moktar)
  tr    (Emin Tufan Ã‡etin)

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../yelp/{yelp-xsl_3.34.2.bb => yelp-xsl_3.36.0.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/yelp/{yelp-xsl_3.34.2.bb => yelp-xsl_3.36.0.bb} (77%)

diff --git a/meta-gnome/recipes-gnome/yelp/yelp-xsl_3.34.2.bb b/meta-gnome/recipes-gnome/yelp/yelp-xsl_3.36.0.bb
similarity index 77%
rename from meta-gnome/recipes-gnome/yelp/yelp-xsl_3.34.2.bb
rename to meta-gnome/recipes-gnome/yelp/yelp-xsl_3.36.0.bb
index 38947d1be..6b9d769b7 100644
--- a/meta-gnome/recipes-gnome/yelp/yelp-xsl_3.34.2.bb
+++ b/meta-gnome/recipes-gnome/yelp/yelp-xsl_3.36.0.bb
@@ -10,8 +10,8 @@ inherit gnomebase gettext itstool
 
 DEPENDS += "libxml2"
 
-SRC_URI[archive.md5sum] = "b9c1c53a9114b42054789f212ab37f59"
-SRC_URI[archive.sha256sum] = "0c3fe6146113df26fb1295901b1c7baed9f0fe67a87f4345e11543aefe7cb7ad"
+SRC_URI[archive.md5sum] = "7d71af68fff4a92bcb2b8989f126be6c"
+SRC_URI[archive.sha256sum] = "4fe51c0233b79a4c204c68498d45f09b342c30ed02c4e418506c0e35f0904ec3"
 
 RDEPENDS_${PN}_append_class-target = " libxml2 itstool"
 
-- 
2.21.3

