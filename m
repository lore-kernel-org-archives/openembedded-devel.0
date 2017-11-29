Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id BF12677E88
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Nov 2017 18:12:08 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id b184so5537457qkc.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Nov 2017 10:12:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=mLSmlOWo1Xq2HkYu0xvQ4Iqga518KmEkSPxj0F3KsUk=;
	b=ARdCKmLL8UbYXweGhZt1FJvdQqCinpFdTr88I3b8oKAfaXrJYzpWrb7kozPg+wfW1J
	Y06VbNMsUoMcTSNWFnlypp7PU2/mrQsXXCcyzvwCzBQmQr2+o/frFPkrBo1F8OAi9xzQ
	vRezvVMLGnbPSD5NlHjm4Bp46LNt1VALAiX6cbD0Hzuy3qHORimFBXJ+J68rEWtgmmth
	BfFIib+0e8AwuBjIuX7y+dwr3g90cJOyQgH4zhzv8KdGQYGGjKjnnS/r2YNFJ5Tl3OBN
	XOFsoBbhTtzuQFTCbOyGrgcMZHchq3mkyvVdJqDe3B88Vt/z2BDCx8bO7va60vLIrRO+
	wisA==
X-Gm-Message-State: AJaThX4SMKJW42lobc8KDqYwF7SjO/b4a1WVDHkNm+p5QooM9vMKSZJ4
	0OZQM1j6Dz0Ew5Zn/hyGc8NcDzQ0
X-Google-Smtp-Source: AGs4zMY4aQuwXXNn0aiMYYFCs9rzQFMv6uLRPyO76uVlp7HRefqBISLaxaWSvwPAUUb1/ZAYcEpIBQ==
X-Received: by 10.55.25.18 with SMTP id k18mr5749237qkh.336.1511979129190;
	Wed, 29 Nov 2017 10:12:09 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	c16sm1628773qtd.80.2017.11.29.10.12.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 29 Nov 2017 10:12:08 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Nov 2017 13:12:01 -0500
Message-Id: <1511979121-6569-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-paho-mqtt: update RDEPENDS to work on minimal python install
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
X-List-Received-Date: Wed, 29 Nov 2017 18:12:09 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-paho-mqtt.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-paho-mqtt.inc b/meta-python/recipes-devtools/python/python-paho-mqtt.inc
index 9efbd2f..6459e68 100644
--- a/meta-python/recipes-devtools/python/python-paho-mqtt.inc
+++ b/meta-python/recipes-devtools/python/python-paho-mqtt.inc
@@ -15,5 +15,7 @@ DEPENDS += "${PYTHON_PN}-pytest-runner-native"
 RDEPENDS_${PN} = "\
                ${PYTHON_PN}-math \
                ${PYTHON_PN}-io \
+               ${PYTHON_PN}-netclient \
                ${PYTHON_PN}-threading \
+               ${PYTHON_PN}-subprocess \
 "
-- 
2.7.4


