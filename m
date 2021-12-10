Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 880C3C433EF
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 06:02:42 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web08.3748.1639116161285461715
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Dec 2021 22:02:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=TlHpoDOi;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.208.180, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f180.google.com with SMTP id m12so12248882ljj.6
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Dec 2021 22:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/18M424FIZKhIiWBE8p5Q5iE2HPrE6P/8GfT4rbbFcE=;
        b=TlHpoDOiDuBrhtCGDhIcscOMvrt2G4sz90sjlzJnEwWaqdzZQl+QUa6nwp4yA7fInL
         5wxtgvNMoP9taQxvRwmHgeF+wzFqW6q+Ei2pQZDMEaVNVqFq1/wi2HGMK6qr4W+qfY1O
         jpZZAwaeKpnAgvDKDaEXlyz9Lqf5uwcZPVGN69TvTQg4XAwSusqkeeIy5aj6931UOY/P
         VGZDcnU8thU4/Ir0CYWOJ8tNicRsk/B//wha4jaefgrJuC08/FXw/Uh3UiXUgU8mDxM6
         1SWVFzdHm3t9tqQkVNOHvkiCPjmPhdoQamE9IAhvUYQjW9VzrZomEP9D0DAb7E3V/fJo
         cXDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/18M424FIZKhIiWBE8p5Q5iE2HPrE6P/8GfT4rbbFcE=;
        b=ld8tU/SN4jGCp6lsAizWWMMYRFEhSJjW+5ewCf6PxeAnqWBnIEX2gjBQLUq0dBvIGt
         WVeJRpDKLWHw5YEnt+4aGzUng0AX3BdaSGz/CC8sHvD+LOuoPLBOCDml0R2r7x/fax9+
         D/gbigsI8VNIZw2Ew0CSiEuOHMEOT3z82IIK4y5MZi6uX94/9wgfye5gIEu9kgGSvdEE
         W/V5GZXmKrl4tuVg//hiZJxsnlAhtR2ZHUt7qJsy6sg2JHBNS3Wc2VI3OUewGyDDlLaA
         UrLXWtpxM8M+GCs6RCPVbaJoNYaVsFD4Ay+IAOodCaKSRiFyJC0Nuc6uwDHHqxsKtZPT
         jmWA==
X-Gm-Message-State: AOAM5320S9WKAOiRiRZFzjD3XG+s7na5mv86VHbrSRajBB6wVrfz0rN+
	0x8/o3la3v8/QngKWvRBsN1xqZTHjThIqz2B
X-Google-Smtp-Source: 
 ABdhPJxDDAJw+/s8TkJh5XOAlnK+aweNN8ymwO3/glseCAFoA1WSy3qdNV338QYSowaW47u1ms8SJg==
X-Received: by 2002:a2e:a726:: with SMTP id
 s38mr11169619lje.415.1639116158858;
        Thu, 09 Dec 2021 22:02:38 -0800 (PST)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 h17sm231029lfj.160.2021.12.09.22.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 22:02:38 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-gnome][PATCH] libnma: update to 1.8.32
Date: Fri, 10 Dec 2021 07:02:32 +0100
Message-Id: <20211210060232.1390831-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Dec 2021 06:02:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94267

Changelog:
* Fix crash in PKCS11 login dialog.
* Fix clearing password when restoring a valid configuration
  to be displayed to a user.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../libnma/{libnma_1.8.30.bb => libnma_1.8.32.bb}              | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-gnome/recipes-connectivity/libnma/{libnma_1.8.30.bb => libnma_1.8.32.bb} (87%)

diff --git a/meta-gnome/recipes-connectivity/libnma/libnma_1.8.30.bb b/meta-gnome/recipes-connectivity/libnma/libnma_1.8.32.bb
similarity index 87%
rename from meta-gnome/recipes-connectivity/libnma/libnma_1.8.30.bb
rename to meta-gnome/recipes-connectivity/libnma/libnma_1.8.32.bb
index fffd2b7df..747c67b03 100644
--- a/meta-gnome/recipes-connectivity/libnma/libnma_1.8.30.bb
+++ b/meta-gnome/recipes-connectivity/libnma/libnma_1.8.32.bb
@@ -10,8 +10,7 @@ inherit gnomebase gobject-introspection gtk-doc gettext vala features_check
 REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG','gcr','x11','',d)}"
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-SRC_URI[archive.md5sum] = "e1ccac96405861ecab195be5524baae6"
-SRC_URI[archive.sha256sum] = "da33e72a49e07d855d97a52aa9a8962a4c96f52b9168c4e0027117ad8ffdafb4"
+SRC_URI[archive.sha256sum] = "0a57b93a2fad43acc763f320dd3a7a93c429b0e3118dfa549d67824cddc4e905"
 
 PACKAGECONFIG ?= "gcr iso_codes mobile_broadband_provider_info"
 PACKAGECONFIG[gcr] = "-Dgcr=true,-Dgcr=false,gcr"
-- 
2.25.1


