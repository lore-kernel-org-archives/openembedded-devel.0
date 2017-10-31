Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2410978220
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Oct 2017 19:51:40 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id w134so205104qkb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Oct 2017 12:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:organization;
	bh=ycY4W0AJfUX+t5EvL5XJWe3BkaX+tUbwusn5l6Pj6Ow=;
	b=HeDgpiwM4zEULtS/KA1Cdl+mzYkSm21KNuPU2wkW4QIWtxwPeYLl29kA9w0dZueUlc
	mvq9/brBnR6Zfbng29URzsjkOHSKZEuQ69LcLPvsd6QbxzxCsUvlgZlwWgPXaeZIQ5OC
	u0J7l+lBg3+uC9vBS8Y0FwYfJhPXeKT+gN2wosv2M+PCzsIZbpF1Iymq0igaYQUgG45H
	OWoecYiv+ojqUh04m/IFD0zOK4IopV6LzOs5WZy7wjZ4UwSvj4Nzf2TQCqv01ql0Zzi9
	hvCHMcq7dlwvT21Z/O1/E6eo8TcF/h+h3z2pbLoBzYsFFGJu9RsdKO/sTO7OAIJevc75
	gQqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=ycY4W0AJfUX+t5EvL5XJWe3BkaX+tUbwusn5l6Pj6Ow=;
	b=hPvIoSx9NvcGKYDFq2reUg/OGlCnzl8c6wGdcJHt0MwpDEEMEDjaEm7jCWqxBjJZWH
	Nc5bvbT14VPdY4UGX72tw7S5LPwYiOC9OuC1eAv5pF5GZSOOyONUqFomC7vLQoX6qrbK
	MycUfmWhMZqzWVnAMt8sCqx5iSLZLe09pHu/sfqiVA5WLZ7tZ1gdtpBbZMcusisLAKCp
	jjEkjzGI7933ZBX08OzDZZ/ykQXDjIf5G5pqFA01AARJTqTa7qewBYL3PFwpkOom5yjg
	rs/lY8HCFYsbvFBV2uu4Yq1+RHAfNeWSq1qXaweyGPieEOFPko3nvRetmDscd7xfp9Gz
	XhxQ==
X-Gm-Message-State: AMCzsaUWv75159hQ/Z8w85BeefwJ9UH5ueuaUJYLabDXC1oxTdD1LtyN
	/WTneQQdEBJZbF3GqzuBSrulaGPd
X-Google-Smtp-Source: ABhQp+SVufDr2TPVeWTBHfHyI+foXz9DGv2pCKrr8AZSsY9HJQOdUKhxuok2SDpvBc0ux2C0XEYk0Q==
X-Received: by 10.233.221.66 with SMTP id r63mr4654640qkf.79.1509479501707;
	Tue, 31 Oct 2017 12:51:41 -0700 (PDT)
Received: from centrium.lab.ossystems ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id l1sm1455841qtf.5.2017.10.31.12.51.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 31 Oct 2017 12:51:40 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Oct 2017 17:51:22 -0200
Message-Id: <20171031195122.23729-1-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.14.2
Organization: O.S. Systems Software LTDA.
Subject: [meta-networking][PATCH v3] arptables: Fix do_install task
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
X-List-Received-Date: Tue, 31 Oct 2017 19:51:41 -0000

We need to run oe_runmake install with DESTDIR variable to install all
arptables files. Without this the only file installed in package is
systemd unit.

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta-networking/recipes-support/arptables/arptables_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/arptables/arptables_git.bb b/meta-networking/recipes-support/arptables/arptables_git.bb
index 274a55d91..cec1d1f77 100644
--- a/meta-networking/recipes-support/arptables/arptables_git.bb
+++ b/meta-networking/recipes-support/arptables/arptables_git.bb
@@ -23,7 +23,8 @@ inherit systemd
 
 EXTRA_OEMAKE = "'BINDIR=${sbindir}' 'MANDIR=${mandir}'"
 
-do_install_append() {
+do_install() {
+    oe_runmake install DESTDIR=${D}
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
         install -d ${D}${systemd_unitdir}/system
         install -m 644 ${WORKDIR}/arptables.service ${D}${systemd_unitdir}/system
-- 
2.14.2


