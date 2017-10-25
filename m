Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 35C6D71D79
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Oct 2017 19:12:02 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id m18so712457pgd.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Oct 2017 12:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=7/1WhFNomRqrf7ewulQb2i41k12lfDQ9GniPRot0oTs=;
	b=d8zg1cfiVkDRMPEF/7/KSB3uFm3rppQlsCfvnYuypxtE3gHhMcI7vuwlgnWZ70uvzo
	f0iYCir2HDe4jAToZi0H4PnrdNVv7jSAuk1m8sCiVdeCRpezBzWl+h5hmW8LfZWXoC7X
	2YoccjjtZ1bLTYD0jMgjR0L0pG28istoT4yt46Y4T8FFqm0PoHRfmKTziBsQpkGb6gEn
	5jXOOU0mZwhx1nvpYKe5jJahPBcUlBbfn8zBsn2UUngwXvdpig4IMjVJTo4OpZ0WRT6y
	xPsohJ1W44Z7z6Mjy+dF/vsjEJX90TyMRfY1wphv/GYR6aeMPzAQX+mAO+Tpjkv+k6ue
	R0EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7/1WhFNomRqrf7ewulQb2i41k12lfDQ9GniPRot0oTs=;
	b=bTIDnqkC6G+6YNCnQfDNswfVZ/HTb7qJksszGlzN7iTUstYhpPoa4zNy5KwjOltAnt
	nMYTDN91oj42kmlwgh/m+6I8OO+E/pNyZ1vftTZixBI/+4jPlLL121DF1Jr5ZljtbJBJ
	i+JBdwkFmbOBESe/CSIp/f830LhQJPkoHpchRJtEDExU/cx5xzrecO0sH4g/vUTcpcEX
	Qtu8HgZqFmL5FXKjHT6qJ1IiXxiTgP3DKGrs5jB7tkMWHJ/gkpxFQxiLXIHkARNloOu3
	oFB+Z3A8Nv6Xf1DlgnfkOyKoQyCwjfQMbQwFqTp66s00judMTuNgSB0u8zbYk4v3U8o7
	hPfw==
X-Gm-Message-State: AMCzsaW5X777P/dqoUdf2cPL8sRDulJZTrRivgYlsSpkLvqrJCJuCYzS
	/K2wp0fw4FbduN7cD9dzaTo2EQ==
X-Google-Smtp-Source: ABhQp+QSJasOKrdkqbTCAxrtomytWLDd1p/1dXhBndyuHznTcy9edC12vnP9TSxAlVPz2z3BU5L1Mw==
X-Received: by 10.98.89.219 with SMTP id k88mr3041576pfj.229.1508958724047;
	Wed, 25 Oct 2017 12:12:04 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	m25sm7059411pfg.49.2017.10.25.12.12.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 25 Oct 2017 12:12:03 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Oct 2017 12:11:57 -0700
Message-Id: <1508958717-31769-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-networking][PATCH] dnsmasq: update SRC_URI for versions 2.69 and earlier
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
X-List-Received-Date: Wed, 25 Oct 2017 19:12:03 -0000

Versions 2.16 to 2.69 have now also moved into the archives folder.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta-networking/recipes-support/dnsmasq/dnsmasq.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
index ef79c5f..4f4bbf1 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
@@ -6,8 +6,8 @@ LICENSE = "GPLv2 | GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
                     file://COPYING-v3;md5=d32239bcb673463ab874e80d47fae504"
 
-#at least versions 2.15 and prior are moved to the archive folder on the server
-SRC_URI = "http://www.thekelleys.org.uk/dnsmasq/${@['archive/', ''][float(d.getVar('PV').split('.')[1]) > 15]}dnsmasq-${PV}.tar.gz;name=dnsmasq-${PV} \
+#at least versions 2.69 and prior are moved to the archive folder on the server
+SRC_URI = "http://www.thekelleys.org.uk/dnsmasq/${@['archive/', ''][float(d.getVar('PV').split('.')[1]) > 69]}dnsmasq-${PV}.tar.gz;name=dnsmasq-${PV} \
            file://init \
            file://dnsmasq.conf \
            file://dnsmasq-resolvconf.service \
-- 
1.9.1


