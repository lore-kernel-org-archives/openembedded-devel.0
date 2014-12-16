Return-Path: <rapphil@gmail.com>
Received: from mail-qa0-f45.google.com (mail-qa0-f45.google.com
	[209.85.216.45])
	by mail.openembedded.org (Postfix) with ESMTP id A698A725FD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Dec 2014 18:15:38 +0000 (UTC)
Received: by mail-qa0-f45.google.com with SMTP id i13so2299059qae.32
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Dec 2014 10:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=w60KXdHUqUhDoqXKd+z4HySSdjUJFP8onZH3NtKguBs=;
	b=gqByBsj+ByDNuuJTt38el5GaCBAdRBgBp6sh0ydLuzvWt1vHBOupxnI3O8GnzoyGek
	eHReY14W5TFAKoRj8rzMX2cCD3KFXA563T2kQjL3JLa63BskEmyEiP9FVtmxEUCutUSC
	Z/HWAhA2juGUsi7GOs2hj9+1IOYj1u2tWSr9yWRo6x6MzYnEzyoSgSiSAQBuJGByv68r
	1RYyZyhlFMdXyDhS+vvKY3RR3lAtCtNal48pmVmwAN19l3J9OPypLBOV4bh3LvJsjoE9
	loyBBIAgLS2KyoaBLfZNGmYO6HNaBO1cnENkmhzyOOyrkmpt6BQoNl4dt7ptbvEQbP6G
	6BlQ==
X-Received: by 10.140.36.239 with SMTP id p102mr35703597qgp.8.1418753739394;
	Tue, 16 Dec 2014 10:15:39 -0800 (PST)
Received: from localhost.localdomain (host29.reason.com.br. [187.49.239.29])
	by mx.google.com with ESMTPSA id h36sm1488696qge.25.2014.12.16.10.15.37
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 16 Dec 2014 10:15:38 -0800 (PST)
From: Raphael Silva <rapphil@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Dec 2014 16:15:22 -0200
Message-Id: <1418753722-2555-2-git-send-email-rapphil@gmail.com>
X-Mailer: git-send-email 2.2.0
In-Reply-To: <1418753722-2555-1-git-send-email-rapphil@gmail.com>
References: <1418753722-2555-1-git-send-email-rapphil@gmail.com>
Subject: [meta-oe][PATCH 2/2] omgps: fixing B!=S build issue
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
X-List-Received-Date: Tue, 16 Dec 2014 18:15:42 -0000

Fixed relative path affected by B != S, otherwise
It has a do_compile error:
 No rule to make target `data/etc/*.*'

Signed-off-by: Raphael Silva <rapphil@gmail.com>
---
 meta-oe/recipes-navigation/omgps/omgps_svn.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-navigation/omgps/omgps_svn.bb b/meta-oe/recipes-navigation/omgps/omgps_svn.bb
index 14c5801..f2cdb88 100644
--- a/meta-oe/recipes-navigation/omgps/omgps_svn.bb
+++ b/meta-oe/recipes-navigation/omgps/omgps_svn.bb
@@ -13,6 +13,7 @@ S = "${WORKDIR}/${PN}"
 do_configure_prepend() {
     sed -i "s#PY_VERSION = 2.6#PY_VERSION = ${PYTHON_BASEVERSION}#g" ${S}/Makefile.am
     sed -i "s#PY_INC_DIR = \$(OPIEDIR)#PY_INC_DIR = ${STAGING_DIR_HOST}#g" ${S}/Makefile.am
+    sed -i "s#dist_conf_DATA = data/etc/\*\.\*#dist_conf_DATA = ${S}/data/etc/\*\.\*#g" ${S}/Makefile.am
 }
 
 SRC_URI = "svn://omgps.googlecode.com/svn/trunk;module=omgps;protocol=http \
-- 
2.2.0


