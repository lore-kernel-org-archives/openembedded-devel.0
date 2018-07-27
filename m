Return-Path: <andre.draszik@gmail.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id 316C97453F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 13:29:28 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id r4-v6so3925197edp.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 06:29:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Y4vp96Wgp+MsPYsBgJXoynztimqtpPteIAam3Yd01E4=;
	b=hJKQwypRU3s7CeZeif9hoep8hyPy6eBpikhfTP9t3eD6JhxA+9JkTSmNQK8fiVYluC
	HQs0Gi3xMxvWSKO4q4ns0uUYoPicgjk2oLv/GvoGcbVQ6SkrQAIZf3YgB4f/gIajwFt3
	E2H6plRKxf59PhH0IQ1905gd+N7eioUtE2huTbN62Oa9yw1G85mx4Ew6tDW5iGBx9fDs
	tmPlNI9qBwL57Ly+UFTETD2t2zvNk23wlv7FTDAvFmCE/RYWf8zITmTBBTiMfrzHGbvq
	bdKbC9cb5J7p5BTXlED5YmdXbWQrnvQtcLCg51pxudkDocp8h4XcY29o5BTxdpE32JWI
	T7pg==
X-Gm-Message-State: AOUpUlEeLW0Lc+mqZ008MOlM/WVAN9PcU2fjhDRAUPJ6m/dhpNY54AcM
	agbCPy63QZ8oFQz3OPJ+EKIZ++fF
X-Google-Smtp-Source: AAOMgpf+C5UCGmODj02pkdecOCXc9vQPIldcYfjqr2PNqG0T63UpLgfQMJ2Llb+Gjd/uyPb0QpNKKg==
X-Received: by 2002:a50:9069:: with SMTP id
	z38-v6mr7604783edz.79.1532698168660; 
	Fri, 27 Jul 2018 06:29:28 -0700 (PDT)
Received: from tfsielt31850.fritz.box (188-141-55-36.dynamic.upc.ie.
	[188.141.55.36]) by smtp.gmail.com with ESMTPSA id
	s41-v6sm5045259edd.61.2018.07.27.06.29.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Jul 2018 06:29:28 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Jul 2018 14:29:20 +0100
Message-Id: <20180727132923.15149-4-git@andred.net>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180727132923.15149-1-git@andred.net>
References: <20180727132923.15149-1-git@andred.net>
MIME-Version: 1.0
Subject: [meta-java][RFC][PATCH 4/7] openjre-8: add meaningful (R)PROVIDES
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Jul 2018 13:29:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

Then OpenJRE8 recipe provides a Java Runtime. It
is compatible with Java versions 5 through 8 (including), so add
appropriate (R)PROVIDES, so that recipes depending on it can can specify
that virtual dependency, rather than hard-coding to openjre-8. This makes
it possible to:
a) add OpenJRE9 and OpenJRE10 recipes in the future without much disruption
b) use a different provider than OpenJDK, e.g. Oracle Java, or Zulu Java

This is the approach taken by e.g. Debian.

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 recipes-core/openjdk/openjre-8_172b11.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-core/openjdk/openjre-8_172b11.bb b/recipes-core/openjdk/openjre-8_172b11.bb
index 220dc01..eac5e5e 100644
--- a/recipes-core/openjdk/openjre-8_172b11.bb
+++ b/recipes-core/openjdk/openjre-8_172b11.bb
@@ -33,10 +33,10 @@ FILES_${PN}-doc_append = "\
     ${JRE_HOME}/THIRD_PARTY_README \
 "
 
-RPROVIDES_${PN} = "java2-vm"
-PROVIDES_${PN} = "java2-vm"
-RPROVIDES_${PN} = "java2-runtime"
-PROVIDES_${PN} = "java2-runtime"
+PROVIDES = "java2-vm java2-runtime"
+PROVIDES += "${@' '.join('virtual/java'+str(x)+'-runtime' for x in range(5,9))}"
+RPROVIDES_${PN} = "java2-vm java2-runtime"
+RPROVIDES_${PN} += "${@' '.join('virtual-java'+str(x)+'-runtime' for x in range(5,9))}"
 
 inherit update-alternatives
 
-- 
2.18.0


