Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qt0-f173.google.com (mail-qt0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id 7CC6671A50
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Feb 2017 19:32:31 +0000 (UTC)
Received: by mail-qt0-f173.google.com with SMTP id x49so144511488qtc.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2017 11:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=qcBQZhEsralMPXcMWiTZwWVK8qnojcjTee4P6JxQK7A=;
	b=Qv0xg4SIaY8dmzdx5ZaWXcbXoDbHS7POcg9uO6RvudVg1fJNpWU8uTYHH8Zrunx7qN
	fr4HZz8bO6bRI6Pyse3LzegFYzZCx2lgbCcyTXDBZCjPVm1Y/r8Jp0Sg1b8+6WP2sExv
	l+MMWP4Q3XHLCvGbf6i4ohpeZeJoeHknEAeDzxNUye0vkBExgMLDnlR8iGmgroKgd1Rg
	HWERXFrZ0SG8CJr/PJ/uVva1GM2QbPG2IS4SEuEwLaVins/psyybW9lRpDjv6W/rf0v3
	Efkot3nHC7a5Vg4KxYRCoQsric4SN9KAs/6xAoEdGvKN7AEI1q1jSxdzvs3dVfLMoRMX
	Ulzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=qcBQZhEsralMPXcMWiTZwWVK8qnojcjTee4P6JxQK7A=;
	b=miGaoyl7Z7+58IaAB6WYyhwrB1Cw1EJHUgfgHMi9b6LQNMu3xk4V/cdJ4t8Au1QHhk
	iJGGxdxBTwnMvbE/y/2voBgJGWXe97hboLtrEjPAr/pFHV4lir02YK471a5/UFn+2+ty
	EzAI9dqjP46yPl8d0QmNtBC/wQX+C2LxpigGNCilNNrZVKdlow+P/m/gHjT7LVo3oJZn
	rJ2fsdrpojpghnUHZrpL2WkB+0aW6sbLjvZ69dE8cl/ppXpVqSjo6UFIMuwnY+EYsiNc
	vz0IDv/rvkDs6KS7peejJRHrF+Ns9DBba47DguXumOKZ5BQzwAX7ss8RyAZVBtqJj1dM
	22eQ==
X-Gm-Message-State: AMke39kBSEspWxgOEDDD/J9K6sGDyl3iTN+Y75UKSHg1xV9s3ifFxoAo0BZV4N/NJM9Vyg==
X-Received: by 10.237.62.44 with SMTP id l41mr17786364qtf.16.1486495950953;
	Tue, 07 Feb 2017 11:32:30 -0800 (PST)
Received: from centrium.lab.ossystems.com.br ([189.114.111.135])
	by smtp.gmail.com with ESMTPSA id
	h62sm4171846qkc.23.2017.02.07.11.32.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 07 Feb 2017 11:32:29 -0800 (PST)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Feb 2017 17:32:07 -0200
Message-Id: <20170207193208.5051-2-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170207193208.5051-1-fabio.berton@ossystems.com.br>
References: <20170207193208.5051-1-fabio.berton@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [meta-oe][PATCH 2/3] libuv: Add recipe for version 1.10.2
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
X-List-Received-Date: Tue, 07 Feb 2017 19:32:31 -0000

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta-oe/recipes-connectivity/libuv/libuv_1.10.2.bb | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/libuv/libuv_1.10.2.bb

diff --git a/meta-oe/recipes-connectivity/libuv/libuv_1.10.2.bb b/meta-oe/recipes-connectivity/libuv/libuv_1.10.2.bb
new file mode 100644
index 000000000..fbdbeaa89
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libuv/libuv_1.10.2.bb
@@ -0,0 +1,19 @@
+SUMMARY = "A multi-platform support library with a focus on asynchronous I/O"
+HOMEPAGE = "https://github.com/libuv/libuv"
+BUGTRACKER = "https://github.com/libuv/libuv/issues"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=bb5ea0d651f4c3519327171906045775"
+
+SRC_URI = "https://github.com/libuv/${PN}/archive/v${PV}.tar.gz"
+
+SRC_URI[md5sum] = "6e16d1d1ca464add0730d637effb1c1c"
+SRC_URI[sha256sum] = "2d740a2adea0f1a19058626f55a076ac41a4ac1f95d4e57cae0c8a634a6cd63b"
+
+S = "${WORKDIR}/${PN}-${PV}"
+
+inherit autotools
+
+do_configure() {
+    ${S}/autogen.sh || bbnote "${PN} failed to autogen.sh"
+    oe_runconf
+}
-- 
2.11.0


