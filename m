Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
	[209.85.160.173])
	by mail.openembedded.org (Postfix) with ESMTP id 941E87C470
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Feb 2019 17:37:02 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id a48so805022qtb.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Feb 2019 09:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version:organization
	:content-transfer-encoding;
	bh=IS2Xa7kdmyINUUW3OaW7ChXkTECLNupe9/lwuVKPSB8=;
	b=TlYMds5rDbbXbG9SVkDJ08WupP9dbHi5xNtsb1LmhcL43k7ChpE9GxJJITFdS/PhUd
	qEAH8LVXPXumVtC1u3SsAqE68hLeFS3eeLpJXijBw0PaqAhrmEjCpZ5tCfQhuLKvGxiI
	5dmzCCJIjap4mlkR9DU3BEqI2biz9W6sQCOiflNhTpHQfvzNfk569iTaEQm2QQ5Dl2pG
	SnuZ46e8yl8CIjpqwK6VVzpUQPpD1K/tHzHlSIMwUNNZs97nWhdLQTovHRqAkfYrq133
	L0oCBF8TlRcANu5zIAeMXQ5gMsSAnzjjzMK8yuOWk1U+5oUdmMuRu3sfUYeJqU7W31tq
	9Bqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:organization:content-transfer-encoding;
	bh=IS2Xa7kdmyINUUW3OaW7ChXkTECLNupe9/lwuVKPSB8=;
	b=bDx5rWx5isqmJOVQUTy/JXVB32tE2WW8ryW73j1xs6Ej0jqEdVk9arEkd7D5U9k5zo
	5D6uCt1AgfGO8RYrueDiCz/2F9CeVrGOcJ49OLca0B8j0yCpcbw1XY3kKO9Qi5Xs9t8q
	h34e22nAitjVrMdGNvL3dwf8nDv2D3lW/F8X6sZG34LMMBEXEn6UF13g5GSKJACWSqKt
	hZAsS5a+2sUxqobdSFe3UpY/ZBAmvAbnO1ImXaYp5cnIP/aeA1lFax5Il9Q+chMLPgz/
	0+VJ6RrlJ1m0t6PoBQoIhqhuhaMlq9x4LyntqEm+Oda90fuCueiuOjlWULlNSOGVHHDS
	nVXQ==
X-Gm-Message-State: AHQUAuae8NRe57a3qlWCjKqM49rVQ9VTLN8tNaBNNlSW8N2qu5KyYF26
	v/QNApP367uerzpDuUxI8PGTVibxK9b+MA==
X-Google-Smtp-Source: AHgI3Iabm6HkeXUL25/UDcF1caJQQHDloFVhjlAdovW+Kkq5yLIPDv3cSBCo+fqcn+Y8acG0vVxEjQ==
X-Received: by 2002:ac8:51c3:: with SMTP id d3mr13348455qtn.107.1549561023421; 
	Thu, 07 Feb 2019 09:37:03 -0800 (PST)
Received: from centrium.lab.ossystems ([181.220.86.121])
	by smtp.gmail.com with ESMTPSA id
	n9sm10983987qtn.59.2019.02.07.09.37.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Feb 2019 09:37:02 -0800 (PST)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Feb 2019 15:36:40 -0200
Message-Id: <20190207173643.20893-1-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Subject: [meta-python][PATCH 1/4] python*-jinja2: Add native and nativesdk to BBCLASSEXTEND
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
X-List-Received-Date: Thu, 07 Feb 2019 17:37:02 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta-python/recipes-devtools/python/python-jinja2.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-jinja2.inc b/meta-python/recipes-devtools/python/python-jinja2.inc
index 0c0bf0def..5342eb563 100644
--- a/meta-python/recipes-devtools/python/python-jinja2.inc
+++ b/meta-python/recipes-devtools/python/python-jinja2.inc
@@ -13,3 +13,5 @@ RDEPENDS_${PN} += "${PYTHON_PN}-io ${PYTHON_PN}-pickle ${PYTHON_PN}-crypt \
     ${PYTHON_PN}-json ${PYTHON_PN}-threading ${PYTHON_PN}-numbers"
 
 CLEANBROKEN = "1"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.20.1


