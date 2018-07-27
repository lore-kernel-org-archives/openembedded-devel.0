Return-Path: <andre.draszik@gmail.com>
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
	[209.85.208.48])
	by mail.openembedded.org (Postfix) with ESMTP id 1603C745AF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 13:29:26 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id b20-v6so3930658edt.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 06:29:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=1kLkK9xcTVxJraPqhUjkjy256yPiffD58BDXie3+m0o=;
	b=iBLAAacM5q7EjyJlN5O60dXwXr2TAQKNLEBL9KPzE/woBGhf+fQxdjq5VzRC4P6mee
	reTYu3lp85oEnsKyZY+l4T9ryiK0CM92dxv+BfmVYYRHfGuz+HrKJdzGtEmMt6TvOMtk
	XH+qMJUNUYE6ePva2QpIqa7pmBHdo+O7Z8T6H81XlpRNxI7XQHI9DunfgMFMU20aoFfR
	YPJqyrgwMz4u4IQhaauzZEWcEVFvSvxn1bNS4g+KwQUp5rAdp60BRHXlbbwC3l5aL57u
	NgZ0AcqNZqN8nw3j0az6ONwfVMZHo0rc85wD6JkjJa03yah54ikne6I2B60OILy4TiEY
	OWBw==
X-Gm-Message-State: AOUpUlH1mxctMBLGHWV12FPNwt39zCaE3fAIUt5XLtkpsTAC+YsP9Kpo
	n3/GJjF5bosbhb276miX89sbOv/Q
X-Google-Smtp-Source: AAOMgpcRCBDfotHgJjGF5xThmr3KXEx7QguyxI92bp/HfUFsOJQRsAuFMId1p1EmmkPuZYROh4H0lg==
X-Received: by 2002:a50:b6e3:: with SMTP id
	f32-v6mr7395325ede.147.1532698167623; 
	Fri, 27 Jul 2018 06:29:27 -0700 (PDT)
Received: from tfsielt31850.fritz.box (188-141-55-36.dynamic.upc.ie.
	[188.141.55.36]) by smtp.gmail.com with ESMTPSA id
	s41-v6sm5045259edd.61.2018.07.27.06.29.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Jul 2018 06:29:27 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Jul 2018 14:29:19 +0100
Message-Id: <20180727132923.15149-3-git@andred.net>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180727132923.15149-1-git@andred.net>
References: <20180727132923.15149-1-git@andred.net>
MIME-Version: 1.0
Subject: [meta-java][RFC][PATCH 3/7] openjdk-8: add meaningful (R)PROVIDES
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
X-List-Received-Date: Fri, 27 Jul 2018 13:29:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

Then OpenJDK8 recipe provides a Java SDK, and a Java Runtime. It
is compatible with Java versions 5 through 8 (including), so add
appropriate (R)PROVIDES, so that recipes depending on it can can specify
that virtual dependency, rather than hard-coding to openjdk-8. This makes
it possible to:
a) add OpenJDK9 and OpenJDK10 recipes in the future without much disruption
b) use a different provider than OpenJDK, e.g. Oracle Java, or Zulu Java

This is the approach taken by e.g. Debian.

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 recipes-core/openjdk/openjdk-8_172b11.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-core/openjdk/openjdk-8_172b11.bb b/recipes-core/openjdk/openjdk-8_172b11.bb
index 9c2a7a1..77c2a57 100644
--- a/recipes-core/openjdk/openjdk-8_172b11.bb
+++ b/recipes-core/openjdk/openjdk-8_172b11.bb
@@ -45,10 +45,10 @@ FILES_${PN}-doc_append = "\
 
 FILES_${PN}-source = " ${JDK_HOME}/src.zip "
 
-RPROVIDES_${PN} = "java2-vm"
-PROVIDES_${PN} = "java2-vm"
-RPROVIDES_${PN} = "java2-runtime"
-PROVIDES_${PN} = "java2-runtime"
+PROVIDES = "java2-vm java2-runtime"
+PROVIDES += "${@' '.join('virtual/java'+str(x)+'-sdk virtual/java'+str(x)+'-runtime' for x in range(5,9))}"
+RPROVIDES_${PN} = "java2-vm java2-runtime"
+RPROVIDES_${PN} += "${@' '.join('virtual-java'+str(x)+'-sdk virtual-java'+str(x)+'-runtime' for x in range(5,9))}"
 
 inherit update-alternatives
 
-- 
2.18.0


