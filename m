Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 227B4D1036F
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 20:36:35 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web10.6210.1729801162782223517
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Oct 2024 13:19:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mjji5VZo;
 spf=pass (domain: gmail.com, ip: 209.85.219.173, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e29327636f3so1577166276.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 13:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729801162; x=1730405962; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eoO6+H5DFkFTnFrMMeVcjft4ymrQO8Ca3UxUi1gXFPg=;
        b=mjji5VZoZjhI3kR6z0PAkFHPsp9fd95efh/goZa9hyRfb4fdmPhnsz/KymOPYNgJ5N
         o/a3V50fs6vSmR/8Xo+kWqOYw0+qTkWZiaON3HQteQdEMz5yIAwxkqnimRYZG7bWRCXf
         IvoRkSKLiKiFYaJlbhmdZiN06dimBrD1JVGS0lyosLvwCnDIqNdpz9eU4VNRYBEjg3C2
         raJpa+3kusW2qvUxmK6vSZXlo8RdyCex8cGu0SNvi0GBl6gacVWx99xpz+VYhZfLHjHk
         vEtZF1B1F2sjwje+BTN47WW6nu/c3pb1bSgvRF+myez/fhKhXdYjx1XfPE/Ute6OU/Vb
         eQZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729801162; x=1730405962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eoO6+H5DFkFTnFrMMeVcjft4ymrQO8Ca3UxUi1gXFPg=;
        b=BzWFHD6iewgRZ2vqTc9Vbvr5AQTEnxtelmVD/pYlL+wvJALK6132ZAtYk4V0hPq/PO
         9RmtklJL9YgoOzoY1oLZsvqGs8b2PNih687Eqa+7R7+buMIVPSoBijIAFGMJPA5jBUsQ
         6F7/HCSB//4HH9q19umjZTSidwHcKYx51ZARXYqTygoNR7hy+nHPMwjhkDqu1ziXscht
         SFBo7q/gBxNu1ReFsyTWdi0pDS2GxcoFE+OdihQXwra06jDKNLsb8WulYcr4wj8sRAHt
         THdOpP0FjQkMOJNkig3euOIRGMV0olwnCt5+CTjByPtfSe5QK72urTCF4jQecQTcxLES
         opLw==
X-Gm-Message-State: AOJu0Yw+LiOK5XYEMPQ5iOaqcHo0caHtHHRJtgjm7Yexak2cNkwHb3pH
	9gt/x61AvR5zqlSh8R6O+ZVj7dX1OCiUtqGOEMzIWnZyJSTroE815kALJg==
X-Google-Smtp-Source: AGHT+IFVJ0PkxrCN5S7aRcI/ie1O6+Hg06JXVUGg/guKdcY9enT2PVmJ7zwgY961O7l2hVi/AKm1HQ==
X-Received: by 2002:a05:690c:289:b0:6db:3b2f:a18a with SMTP id 00721157ae682-6e7f0e3e41bmr73780887b3.11.1729801161412;
        Thu, 24 Oct 2024 13:19:21 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f59f551csm21484897b3.10.2024.10.24.13.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 13:19:21 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 42/42] libxml-sax-writer-perl: Change references to search.cpan.org to use metacpan.org
Date: Thu, 24 Oct 2024 16:08:01 -0400
Message-ID: <20241024201806.440273-43-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241024201806.440273-1-schonm@gmail.com>
References: <20241024201806.440273-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 20:36:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113220

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.57.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.57.bb b/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.57.bb
index c3dee2bcb..f906cda2e 100644
--- a/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.57.bb
+++ b/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.57.bb
@@ -8,11 +8,11 @@ the AxKit XML Application Server. \
 "
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
-HOMEPAGE = "http://search.cpan.org/dist/XML-SAX-Writer/"
+HOMEPAGE = "https://metacpan.org/dist/XML-SAX-Writer"
 DEPENDS += "libxml-filter-buffertext-perl-native"
 RDEPENDS:${PN} += "libxml-filter-buffertext-perl"
 
-SRC_URI = "http://search.cpan.org/CPAN/authors/id/P/PE/PERIGRIN/XML-SAX-Writer-${PV}.tar.gz"
+SRC_URI = "https://cpan.metacpan.org/authors/id/P/PE/PERIGRIN/XML-SAX-Writer-${PV}.tar.gz"
 SRC_URI[sha256sum] = "3d61d07ef43b0126f5b4de4f415a256fa859fa88dc4fdabaad70b7be7c682cf0"
 
 LIC_FILES_CHKSUM = "file://README;beginline=45;endline=46;md5=d41d8cd98f00b204e9800998ecf8427e"
-- 
2.43.0


