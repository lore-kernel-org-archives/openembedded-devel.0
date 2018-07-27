Return-Path: <andre.draszik@gmail.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1B6A360851
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 13:29:24 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id s24-v6so3921762edr.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 06:29:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=F5XbPKnW2ikaTqxTDSOMN5ZOWbEH2lDz3Jk3AcUanMU=;
	b=t2j/2feD+WBhisb4Szawa4uCNyxr+h0XtTvztEypEpEfh5v5wHDfBPWtikgsiQ6BHc
	37HOQE47efVjNECRAQMioPVFq5D6JQq6tGWzp87p2a5i7UkRvF6J+2OY0Erm0c1aFZCS
	bL6IX+ChkQj4RIEasRHmFTHZ6zH9HdmY4rxYbButKz1KwcFyca2n/S7VSukeQgBIf4NF
	etw+8P81Yre5ysqMpHrrFUH1plPKunRK1WE5Y8YxAYjcqRr2SgUlO9N6qZdIjlXOBrvI
	bzggJ14z40oUWFy6T34V4zAmiSYj+GazdseXdzKV24gRCk7nLUta9jtJgK4t/wpOqjl0
	WDNg==
X-Gm-Message-State: AOUpUlFRzOC74+Aws+KaBpimArFskwlR+i0B71SCZpJUD3V4W8/Aj87p
	n2PcxAqZ8eYgRogCX/ezIXdyKZve
X-Google-Smtp-Source: AAOMgpeP/v0eQbm4GEs9uVI0BFVLJXKssJHVCHK9p+PRsAl4f6q2zrGRkcNEH13zdKwIE+BtU8cJFw==
X-Received: by 2002:a50:f31a:: with SMTP id
	p26-v6mr3005551edm.68.1532698165549; 
	Fri, 27 Jul 2018 06:29:25 -0700 (PDT)
Received: from tfsielt31850.fritz.box (188-141-55-36.dynamic.upc.ie.
	[188.141.55.36]) by smtp.gmail.com with ESMTPSA id
	s41-v6sm5045259edd.61.2018.07.27.06.29.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Jul 2018 06:29:24 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Jul 2018 14:29:17 +0100
Message-Id: <20180727132923.15149-1-git@andred.net>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Subject: [meta-java][RFC][PATCH 1/7] openjdk-8-native: add meaningful (R)PROVIDES
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
X-List-Received-Date: Fri, 27 Jul 2018 13:29:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

The OpenJDK8-native recipe provides a Java SDK, and a Java Runtime. It
is compatible with Java versions 5 through 8 (including), so add
appropriate (R)PROVIDES, so that recipes depending on it can can specify
that virtual dependency, rather than hard-coding to openjdk-8. This makes
it possible to:
a) add OpenJDK9 and OpenJDK10 recipes in the future without much disruption
b) use a different provider than OpenJDK, e.g. Oracle Java, or Zulu Java

This is the approach taken by e.g. Debian.

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 recipes-core/openjdk/openjdk-8-native.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-core/openjdk/openjdk-8-native.inc b/recipes-core/openjdk/openjdk-8-native.inc
index 761ddc7..2dd31e7 100644
--- a/recipes-core/openjdk/openjdk-8-native.inc
+++ b/recipes-core/openjdk/openjdk-8-native.inc
@@ -87,3 +87,6 @@ do_install() {
         ln -sf "../lib/jvm/${JDK_DIR}/bin/$tool" ${D}${bindir}/$tool
     done
 }
+
+PROVIDES = "${@' '.join('virtual/java'+str(x)+'-sdk-native virtual/java'+str(x)+'-runtime-native' for x in range(5,9))}"
+RPROVIDES_${PN} = "${@' '.join('virtual-java'+str(x)+'-sdk-native virtual-java'+str(x)+'-runtime-native' for x in range(5,9))}"
-- 
2.18.0


