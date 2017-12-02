Return-Path: <bill.randle@gmail.com>
Received: from mail-pl0-f45.google.com (mail-pl0-f45.google.com
	[209.85.160.45])
	by mail.openembedded.org (Postfix) with ESMTP id 3E6E0786F4
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  2 Dec 2017 05:13:13 +0000 (UTC)
Received: by mail-pl0-f45.google.com with SMTP id bd8so7439106plb.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Dec 2017 21:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=thTZ1UnxW4ggbViAy3irrZxVvRO80hpB0fj9a2/piLs=;
	b=GM2ZAHNx5f8Mr9peewtJO868ry03hg8mZvPggMGMb3V9V+9TgK2iMBCSMTlq4q72Tx
	AVIZgATVY8pOCdntfEsz54VyGs01GkkNxLzIGfMsrF2vPkdaNXUUpgDnD+79dm+R1Pgg
	31RMb0ROKKuFM26xaNolWXN2gITA+D/Ks5+xaJ5FFs1PIgjl4Ssft7HFqUkzZDwxAsmT
	6MKo2D5NIXz1dkpf2GAYX5Lzi1P4+wwYZOAmxTEKtlDt0XqIBvGPIT3zodZgXYDronaR
	4Y8VLi67KH5Mb7nBiYPuHwuOhohg7J920B+LhzuEEOExN4LqJsRmN5koSZMco8P83siw
	xFjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=thTZ1UnxW4ggbViAy3irrZxVvRO80hpB0fj9a2/piLs=;
	b=FtPvzbaaKG+t56vH3oUd21pigT5AMalJFODS69cj2YemWmyqNqcariP9GqYCqzKqiJ
	DWWWqmZ7hXfZwbpAk8gRuQQr7OG6zEzNHqg9HeaTxf83XS02XrSF21X3H2qGCJpW/+e+
	Jz605ASswwcjXNnobj1VbR6FGPdioO4DIUHR/WG+8LlxeZECiOGgURr3tvuKMcF7CJXD
	4QxuFuZpiWqjlc8PrL3zYPMIUYoNsDVrPr04ygalTDRtERtdOyDZ6g0ex0ZlxxieNBr3
	4whPO+lJy5fQ6BoXw6D/p0tq39T9zlQlLmx+T+4SQ6oVo4gr0Yo6nQug3RZ8J83ZC3ws
	hisA==
X-Gm-Message-State: AJaThX53LAokVhhjh2temNNjMMdY0QjZ1Rys6NYv01TdIl2h1MawnyiO
	MVvLerTX50Vsix8l/bsPxoYgoQ==
X-Google-Smtp-Source: AGs4zMZOPfWqxxWB2GjpecHAaZRReHNNgeBviRrxXLeepO0pqNJeNG0pU6ClKBPfjw1G2WfzklcL6w==
X-Received: by 10.84.168.227 with SMTP id f90mr8176466plb.320.1512191594923;
	Fri, 01 Dec 2017 21:13:14 -0800 (PST)
Received: from neosoft.neocat.org (184-100-225-25.ptld.qwest.net.
	[184.100.225.25]) by smtp.gmail.com with ESMTPSA id
	r1sm14681137pfg.98.2017.12.01.21.13.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 01 Dec 2017 21:13:14 -0800 (PST)
From: Bill Randle <bill.randle@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Dec 2017 21:12:50 -0800
Message-Id: <1512191576-2302-8-git-send-email-bill.randle@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1512191576-2302-1-git-send-email-bill.randle@gmail.com>
References: <1512191576-2302-1-git-send-email-bill.randle@gmail.com>
Cc: ticotim@gmail.com
Subject: [meta-python][PATCH 07/13] python[3]-flask-mail: new recipes
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
X-List-Received-Date: Sat, 02 Dec 2017 05:13:14 -0000

Signed-off-by: Bill Randle <bill.randle@gmail.com>
---
 meta-python/recipes-devtools/python/python-flask-mail.inc    | 12 ++++++++++++
 .../recipes-devtools/python/python-flask-mail_0.9.1.bb       |  2 ++
 .../recipes-devtools/python/python3-flask-mail_0.9.1.bb      |  2 ++
 3 files changed, 16 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-flask-mail.inc
 create mode 100644 meta-python/recipes-devtools/python/python-flask-mail_0.9.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-flask-mail_0.9.1.bb

diff --git a/meta-python/recipes-devtools/python/python-flask-mail.inc b/meta-python/recipes-devtools/python/python-flask-mail.inc
new file mode 100644
index 0000000..bb08703
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-flask-mail.inc
@@ -0,0 +1,12 @@
+SUMMARY = "Flask extension for sending email"
+DESCRIPTION = "A Flask extension for sending email"
+HOMEPAGE = " https://github.com/rduplain/flask-email"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5b16dfa6d3f275ace5985bb92949f770"
+
+SRC_URI[md5sum] = "04b35a42a44ec7aa724ec8ce55e2e08e"
+SRC_URI[sha256sum] = "22e5eb9a940bf407bcf30410ecc3708f3c56cc44b29c34e1726fe85006935f41"
+
+PYPI_PACKAGE = "Flask-Mail"
+
+RDEPENDS_${PN} = "${PYTHON_PN}-flask"
diff --git a/meta-python/recipes-devtools/python/python-flask-mail_0.9.1.bb b/meta-python/recipes-devtools/python/python-flask-mail_0.9.1.bb
new file mode 100644
index 0000000..8324da8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-flask-mail_0.9.1.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools
+require python-flask-mail.inc
diff --git a/meta-python/recipes-devtools/python/python3-flask-mail_0.9.1.bb b/meta-python/recipes-devtools/python/python3-flask-mail_0.9.1.bb
new file mode 100644
index 0000000..0b963be
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-flask-mail_0.9.1.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools3
+require python-flask-mail.inc
-- 
2.7.4


