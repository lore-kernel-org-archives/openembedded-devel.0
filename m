Return-Path: <akuster@mvista.com>
Received: from mail-pb0-f54.google.com (mail-pb0-f54.google.com
	[209.85.160.54])
	by mail.openembedded.org (Postfix) with ESMTP id 5CC8F6FC1A
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Jun 2014 23:11:45 +0000 (UTC)
Received: by mail-pb0-f54.google.com with SMTP id jt11so175274pbb.41
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Jun 2014 16:11:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=QOIlZehyyInQcIRMWIPgL1UXitNxhnK7g7g79Dfd2ZY=;
	b=D7p48DoBQlmQP/hTkt6fs7CA5YokWyVTB7zvOU1U8i+o0CGGWAhodz2sUYUF5B5rrO
	BoxQVTnuuJS0JfOLJsqPZikt0DwgSZ5mFJGAGkgO4XHqTkiCGIKqmHL6JWgqsfYL8qrW
	BhYDrh2xaiR0JHALAQuLGe2owYWKzdMr/oh9ZJzcqXsDAqoZRNbcqsFd1mtFWpf3p872
	xrlWUJ59VaQgjFXUj6/ehRNmBINt8pymOuphI5N7w4svqjRZZjIhqkGMZabiQbsavrLn
	o77u2VzddocBh5+ITANke42z5c4x5AZrv3W35qDTbP39E/wslaviDBDLhqG9C95Oofr8
	c1xg==
X-Gm-Message-State: ALoCoQlnq2wlvrwAsJlF9lo8p4ddMSJquOfQLJW3PO/QZJKBTP+Nc2jyqXbKoTQ7b2F7xBoQtU7z
X-Received: by 10.68.174.33 with SMTP id bp1mr69532152pbc.74.1401923506309;
	Wed, 04 Jun 2014 16:11:46 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-98-239-95-55.hsd1.ca.comcast.net.
	[98.239.95.55]) by mx.google.com with ESMTPSA id
	ib5sm14753533pbb.55.2014.06.04.16.11.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 04 Jun 2014 16:11:45 -0700 (PDT)
From: Armin Kuster <akuster@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Jun 2014 16:11:42 -0700
Message-Id: <1401923502-22673-1-git-send-email-akuster@mvista.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-networking][PATCH] radvd: fix install issue for S!=B
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
X-List-Received-Date: Wed, 04 Jun 2014 23:11:46 -0000

Some files are in "S" that are needed for install.

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta-networking/recipes-daemons/radvd/radvd.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-daemons/radvd/radvd.inc b/meta-networking/recipes-daemons/radvd/radvd.inc
index 9e19401..b7353fc 100644
--- a/meta-networking/recipes-daemons/radvd/radvd.inc
+++ b/meta-networking/recipes-daemons/radvd/radvd.inc
@@ -33,6 +33,7 @@ do_install_append () {
 
     install -m 0644 ${WORKDIR}/volatiles.03_radvd ${D}${sysconfdir}/default/volatiles/volatiles.03_radvd
     # Documentation
+    cd ${S}
     for i in radvd.conf.example README; do \
         install -m 0644 $i ${D}${docdir}/radvd; \
     done
-- 
1.9.1


