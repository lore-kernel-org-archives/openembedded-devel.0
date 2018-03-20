Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id AAA37789B6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Mar 2018 13:30:57 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id s78so1579928qkl.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Mar 2018 06:30:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=LxqPYqs5dA7k3nIxiwYO12RaN2QyijUDRKrb5/bn4ZQ=;
	b=ByeCpsC1DGl7oITjGkH3Il8U4exA3BiTfdBrwL9HV2d9meQOuOyHeBNuDUAWZRreOi
	i8StlcyeqiglIHAbfi9RryB6e5hhFgO+uyYCroIzA3UGTSULVOPqgyP0hlbzu6wzvtIl
	P4EOm1qchiygcAo3RfNbRjZNPlrqgGeh2se24VSI1TPNcSFQVYAR9ZliL6++Eo706C00
	v09QeTGRNb5chLgoCK/f1urO8sNUD7UQy8a63rSKWcHbgQzA89WFkexI/qMBt/pwM1U+
	R8tOhEyxHbOqjAhVixG5uT6cJ8xgYMzHno1zv9WADR7E2HWiV1g3B1QJJ/qa3HXVCNw2
	aSJw==
X-Gm-Message-State: AElRT7GytjuvzsHVQQWXPRabydfTJhsRlOTep8mSB3LV8kqPihYIbTHA
	cq/gMrGvCNjzi4VldfHPrGE6wTaL
X-Google-Smtp-Source: AG47ELsoXKO12h/6jn4es9Xsn4H4qE1ujBh/PaQKxaqvW++w7EAopr6H0VTnnY1pM/yEn91/FHFqOg==
X-Received: by 10.55.145.70 with SMTP id t67mr23232668qkd.114.1521552658458;
	Tue, 20 Mar 2018 06:30:58 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	v81sm1709998qka.12.2018.03.20.06.30.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 20 Mar 2018 06:30:57 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Mar 2018 09:30:48 -0400
Message-Id: <1521552648-10248-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-paho-mqtt: add logging to RDEPENDS
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
X-List-Received-Date: Tue, 20 Mar 2018 13:30:57 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-paho-mqtt.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-paho-mqtt.inc b/meta-python/recipes-devtools/python/python-paho-mqtt.inc
index 2316916..f834e6f 100644
--- a/meta-python/recipes-devtools/python/python-paho-mqtt.inc
+++ b/meta-python/recipes-devtools/python/python-paho-mqtt.inc
@@ -13,8 +13,9 @@ SRC_URI[sha256sum] = "31911f6031de306c27ed79dc77b690d7c55b0dcb0f0434ca34ec6361d0
 DEPENDS += "${PYTHON_PN}-pytest-runner-native"
 
 RDEPENDS_${PN} = "\
-    ${PYTHON_PN}-math \
     ${PYTHON_PN}-io \
+    ${PYTHON_PN}-logging \
+    ${PYTHON_PN}-math \
     ${PYTHON_PN}-netclient \
     ${PYTHON_PN}-threading \
 "
-- 
2.7.4


