Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 508C3D5B17D
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 22:15:16 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web10.128.1730140106542348124
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Oct 2024 11:28:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DTEdaEfb;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6e2e41bd08bso54977547b3.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 11:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730140105; x=1730744905; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TjRpGUcf2kELaOGjkjmDxeJLjxEQJX2IrRau7FIXqiw=;
        b=DTEdaEfbtP4fvfzmbg+Pyv88fAg6Q+gVGS8o+HPKXDdYCRXcfZSVWBcD+AtS+uriI7
         k5OPTThI/s0HekG9K0IDl/obPouwTEs8ELBjtEocu43TZM1usqotXEzokmSBUYIGGBwC
         p5V/Sb9iQS3rgpbf/l5NYsAMtzTQ9VvjaQz5JOqxd4yk1TKnecVAXnc2smZtxYti1aNP
         rF7Hep6FM9IyeDgE05RaDfQ2QlfVaGKdx34s30mxNJFQLJ81YTBqMGCxB3ThOFSmTPFF
         KAzBEpS5UPl5RM6mJhLp15NSBc/mlWcvwYPKbhAqm3Y2EuGRc4nbzgHfvV+YPz6lglcQ
         FScg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730140105; x=1730744905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TjRpGUcf2kELaOGjkjmDxeJLjxEQJX2IrRau7FIXqiw=;
        b=TBlchJ5eixk35cCeoFsMn+U7knPSi//ZBXpOs5o2zzHH3MyZeRKvjoSi5BNNYe+vQ9
         hPFNr9kSVE17McwnczMhRzQ28TZt2uII6w5dLbWaZEKIYrNbtjnCjLzSPvWCzN6+G42F
         ON8dzgp2NT041jDqe0AJjYUsMAQ0euCUgaL3jkHsR37Hmi3keYSeMW5dILpI7Y+MLZP2
         yPanakfZ1MP9R1UyLUPesILa3g6eRWMErpK/7LqbB8wGY5QUDNnaWKHALaPA43BUcpzq
         aTo24XSxcXp6mhu5jXwZXfaw8/Yti97V822ZONKx5UutPrNYa8GU9Aqvk/nfCOESgdEH
         237A==
X-Gm-Message-State: AOJu0YwDPJoK1/R27MY4K1FWe+Dob+JOAhGZKSSZ5ndjRAhANm5AOqin
	rV7f1ew6GCLOqSdXe0fTfOTsZKPAMbr1xRWIY91LCenDOhC7rSmUSTVzYg==
X-Google-Smtp-Source: AGHT+IEQeGA67sIFDKwwpXSlmE7+cNgSNouVHA/twO8JyC/wKebGm9OTyb20F8x6LRYfNsVephO8ng==
X-Received: by 2002:a05:690c:4b06:b0:6e3:ed8:7f17 with SMTP id 00721157ae682-6e9d8a14461mr84963927b3.16.1730140105128;
        Mon, 28 Oct 2024 11:28:25 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6c770cfsm15493397b3.99.2024.10.28.11.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 11:28:24 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-perl][PATCH 22/22] libxml-sax-writer-perl: Use
Date: Mon, 28 Oct 2024 14:20:38 -0400
Message-ID: <20241028182749.5058-23-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028182749.5058-1-schonm@gmail.com>
References: <20241028182749.5058-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 22:15:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113290

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.57.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.57.bb b/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.57.bb
index f906cda2e..d4a027e6d 100644
--- a/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.57.bb
+++ b/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.57.bb
@@ -12,7 +12,7 @@ HOMEPAGE = "https://metacpan.org/dist/XML-SAX-Writer"
 DEPENDS += "libxml-filter-buffertext-perl-native"
 RDEPENDS:${PN} += "libxml-filter-buffertext-perl"
 
-SRC_URI = "https://cpan.metacpan.org/authors/id/P/PE/PERIGRIN/XML-SAX-Writer-${PV}.tar.gz"
+SRC_URI = "${CPAN_MIRROR}/authors/id/P/PE/PERIGRIN/XML-SAX-Writer-${PV}.tar.gz"
 SRC_URI[sha256sum] = "3d61d07ef43b0126f5b4de4f415a256fa859fa88dc4fdabaad70b7be7c682cf0"
 
 LIC_FILES_CHKSUM = "file://README;beginline=45;endline=46;md5=d41d8cd98f00b204e9800998ecf8427e"
-- 
2.43.0


