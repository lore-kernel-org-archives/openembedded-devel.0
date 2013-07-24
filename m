Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 6D35F6B37C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 12:41:11 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id e53so216130eek.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 05:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=epj8y/J6iYry5kmwR19XCsBSfHt9vOkdYV8Xp0+QQy0=;
	b=LyKQi44Bqsp5Zvb+0m7mZckYu+Q2pD9Nk9Ta4ZzQsvDZGpHwlw01GsbFb0DQxvavil
	rTeN0y8bmFMeD/gIDLk9TXTWFE7uuNAPxNpCrA1eJFJwEdUuRDPeoJvyktSBU9WKkdn4
	IM6i2ONBPI672JSm1gVga/gw0ZBIQvAAB6pSrY8HbGbyFT+O6fWXjqaI/xkeVPPVQnHV
	8ztSzeL4agBqRYI/p5zJf0Jrfa1/siaU+QemAh8Yf6W5P7x8tRAtgoZ+w4JYNePii8jF
	vMROcUqkS/OKioJ6NXauMf0KoBDvcURI9jDhkJXvkINepny/lHkPG2pF4uFjVTlPOPOd
	Tqyg==
X-Received: by 10.14.8.197 with SMTP id 45mr37077054eer.66.1374669671894;
	Wed, 24 Jul 2013 05:41:11 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	b7sm65840503eef.16.2013.07.24.05.41.11 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 24 Jul 2013 05:41:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Jul 2013 14:40:57 +0200
Message-Id: <5224661c1be3757bc96f9ae8e7053d010a7d243d.1374669516.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <bddf85b42118361920fbde7c54baffd0e085d5a7.1374669516.git.Martin.Jansa@gmail.com>
References: <bddf85b42118361920fbde7c54baffd0e085d5a7.1374669516.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1374669516.git.Martin.Jansa@gmail.com>
References: <cover.1374669516.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 13/29] quagga: add PACKAGECONFIG for capabilities
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Jul 2013 12:41:11 -0000

* it's autodetected from sysroot
* add PACKAGECONFIG to make it deterministic

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-protocols/quagga/quagga.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc b/meta-networking/recipes-protocols/quagga/quagga.inc
index f9a32a9..f5489c6 100644
--- a/meta-networking/recipes-protocols/quagga/quagga.inc
+++ b/meta-networking/recipes-protocols/quagga/quagga.inc
@@ -30,6 +30,9 @@ SRC_URI = "http://download.savannah.gnu.org/releases/quagga${QUAGGASUBDIR}/quagg
            file://watchquagga.default \
            file://volatiles.03_quagga"
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[cap] = "--enable-capabilities,--disable-capabilities,libcap"
+
 inherit autotools update-rc.d useradd
 
 EXTRA_OECONF = "--sysconfdir=${sysconfdir}/quagga \
-- 
1.8.3.2


