Return-Path: <andre.draszik@gmail.com>
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
	[209.85.208.46])
	by mail.openembedded.org (Postfix) with ESMTP id 35FB574599
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 13:29:30 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id x5-v6so3940874edr.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 06:29:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=w0SjNekypWKMApMZzm7LvBHYirTjc8vLmM26EXw2mXk=;
	b=luO3jTbovOWGYymCaARSoSid6mBrvtZZM0EeRDlIrsWPej/orZc2dbwqXe656Cn2Q9
	6OR+IaiDIAbjtqzHWfm8A5/4IbSCNFcgkhLdr8tfze2ayPcwO5nxg5GWbTzva3FId8q2
	DbV0Ja1VuCbcMqq0GV4aQZU+4k2I+T6dUUkTB0vD1ZHpKuUJ9RQsbNTbCIhg5zTZ2Gpi
	vsd2uVeswjaytg/Nbg0gQDNgKpxQRoZ9EIsFiiqYnXCViycgTydORM/fJV439IR5PbDM
	f8DaBJY/2UgzfKNQ1p4CvFHSZrl84JULqURDN4OU9OqeEdm7T6H+8M3absnxQMwJ6ePo
	NC2Q==
X-Gm-Message-State: AOUpUlG+Jtaym20bhjQp9OQ0mW1lGLYkne5g4RtvJd/gy4lhN8VlsuFb
	LKXHhPGamv8iNhjLggoleoCAJ52H
X-Google-Smtp-Source: AAOMgpeL3UfTP11N10tZG4cepz1i/A21C0IgyNHhywtEPkYShyTg/lyG1zxqGSRmvvF7cKci1AUUbg==
X-Received: by 2002:a50:a7e2:: with SMTP id
	i89-v6mr7168544edc.176.1532698170775; 
	Fri, 27 Jul 2018 06:29:30 -0700 (PDT)
Received: from tfsielt31850.fritz.box (188-141-55-36.dynamic.upc.ie.
	[188.141.55.36]) by smtp.gmail.com with ESMTPSA id
	s41-v6sm5045259edd.61.2018.07.27.06.29.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Jul 2018 06:29:30 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Jul 2018 14:29:22 +0100
Message-Id: <20180727132923.15149-6-git@andred.net>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180727132923.15149-1-git@andred.net>
References: <20180727132923.15149-1-git@andred.net>
MIME-Version: 1.0
Subject: [meta-java][RFC][PATCH 6/7] openjdk-7: (R)PROVIDE virtual Java [567] packages
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
X-List-Received-Date: Fri, 27 Jul 2018 13:29:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

Similar to OpenJDK-8, OpenJDK-7 is a provider of Java 5 through 7
(including).

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 recipes-core/openjdk/openjdk-7-common.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-core/openjdk/openjdk-7-common.inc b/recipes-core/openjdk/openjdk-7-common.inc
index 1ac3154..85a34da 100644
--- a/recipes-core/openjdk/openjdk-7-common.inc
+++ b/recipes-core/openjdk/openjdk-7-common.inc
@@ -22,6 +22,7 @@ JDK_DIR = "java-7-openjdk"
 
 PN = "${JDKPN}-jre"
 PROVIDES += "${JDKPN}"
+PROVIDES += "${@' '.join('virtual/java'+str(x)+'-sdk virtual/java'+str(x)+'-runtime' for x in range(5,8))}"
 
 DEPENDS = " \
     icedtea7-native zip-native ant-native \
@@ -283,6 +284,7 @@ FILES_${JDKPN}-jdk = " \
 RDEPENDS_${JDKPN}-jre = "${JDKPN}-java ${JDKPN}-common"
 RDEPENDS_${JDKPN}-java = "${JDKPN}-common"
 RPROVIDES_${JDKPN}-jre = "java2-runtime"
+RPROVIDES_${JDKPN}-jre += "${@' '.join('virtual-java'+str(x)+'-runtime' for x in range(5,8))}"
 
 RDEPENDS_${JDKPN}-jdk = "${JDKPN}-jre"
 
-- 
2.18.0


