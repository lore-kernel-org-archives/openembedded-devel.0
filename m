Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id B40A3731F7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2016 19:51:40 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id r128so4222522qkc.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2016 12:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=K2cWCpwquCjsP406i6gGei7yzd76w8yY2gx7hJzwX10=;
	b=HKJax69m7Ha7lCCyypIJknctIdmyqwWPrJm05kk55ujVMmfqUVk0ufMZUNRKMZr+bw
	MUYnDrQjZh73Za6DAJx2Jam2CytjrnWsPkGheS5O9m9AWbbASWg+hMjmnvcHUpru5P9S
	TRANFiO2iGkpEn6ux+QeXusheQvODatZOqz+r0+H+2GiwV5noYwTTWZvlJ0HAtufJf/L
	MfKROqs2Mnz95rt8wrOu7OqIgjVfhUP9t3uPpuU79cOE79pz6JUcbzAiq/EZsuB1Kitl
	9bVjlLarL/fYdUWcWxGXKCdHS4NQk2ciARbGpracDSW/3oJXEtswBrReI0xa+vXTorJX
	m3jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=K2cWCpwquCjsP406i6gGei7yzd76w8yY2gx7hJzwX10=;
	b=EYPfQ40uR+TTV0jUpjP1F43HZha0INWz9MPk6dsQrB4wkw9uVKHN/wkTuJuyByjIor
	dmC/5aZQiK5dCChgXlNH5GRDX5zqoPGoSNioVpN537oDIU1Eex9sOosNj58BB/vcEtiO
	FIRh335ksx1vDKobHMAFmEkmuBO/tDX1B6bsPnfUkAYL+oTw0g8zYmf7ylwsnLT5dvu/
	QiGYplZ1Axp+xpKpIOv4BXEs7syNmgOEOLJu6zClRLfqgRoJve/4aIJFYEKNBDOpjr1N
	h0h0osflFWUaP6TOMONlCwul260rJdd5W9N1MaScWHdjH8RC2PZNt3G19AhZqreFnHT9
	ig8A==
X-Gm-Message-State: AE9vXwNHmVhceVg7oyymLW9kuW3TwusYVK1u5lw+mXG+PI3qeFwm2ogwNaZBvyggJfRZdw==
X-Received: by 10.55.23.208 with SMTP id 77mr12952711qkx.252.1472673100983;
	Wed, 31 Aug 2016 12:51:40 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.100.224.8])
	by smtp.gmail.com with ESMTPSA id d76sm838648qkc.19.2016.08.31.12.51.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 31 Aug 2016 12:51:39 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 31 Aug 2016 16:51:10 -0300
Message-Id: <1472673070-9887-2-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1472673070-9887-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1472673070-9887-1-git-send-email-fabio.berton@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [meta-python][PATCH 2/2] python-six: Add native and nativesdk to BBCLASSEXTEND
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
X-List-Received-Date: Wed, 31 Aug 2016 19:51:43 -0000

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta-python/recipes-devtools/python/python-six.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-six.inc b/meta-python/recipes-devtools/python/python-six.inc
index e54c0e8..e33c01d 100644
--- a/meta-python/recipes-devtools/python/python-six.inc
+++ b/meta-python/recipes-devtools/python/python-six.inc
@@ -13,3 +13,6 @@ do_install_append() {
 }
 
 RDEPENDS_${PN} += "${PYTHON_PN}-io"
+
+BBCLASSEXTEND = "native nativesdk"
+
-- 
2.1.4


