Return-Path: <andrei@gherzan.ro>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id AA0A260119
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Jul 2016 10:26:19 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id k123so5033779wme.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jul 2016 03:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gherzan-ro.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=mJ4O3oJcQEt49fUDwUIOuX6b2gwcEuv2W1HvA5i2SDw=;
	b=pf/gcB7troUCKDEMw7V1fCnuogwdhwF1zqd7w3Cn9o6+fX888lMGWcXUN4wg+CxTeH
	mFMXdp8C2ImUiPh/DRfF7lN8Cxb8p3mU7WC7f+QThihE4GkkJeseZAgj4Q5YFb88KNky
	U8/J/fkWl5OVoPcgUpnLQRK7QiH+J6DZi4Ndvrh0ds0Y8zbHi8j1y3IsJZHjlsC4cllQ
	lxtDu/htJT1+3goSuqtbECUDZppemR0e+dZM5K67/s8l6hEozr9YILuShB2CB/peHgBN
	gQ8xO+/zqSUiNKbZ+3v+dJOVP0dTtwbuI6QfFjeluYMzI1LBgohxIJWT2kQ5sAUcth7N
	f7yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=mJ4O3oJcQEt49fUDwUIOuX6b2gwcEuv2W1HvA5i2SDw=;
	b=MFJuHpau4bEgI548gzPyvVMAkwFWET4n1VHg+anuYRmUqTkm7T7a6Z98VJwrbyjpEM
	vZNKmbuJl0S41QISQC6nbCZnNz99qLi7xIpApQVN12mqFTwduMpJHYzbTEIA8Ks6bJia
	Oy1Gb9b24yCnvNI/xN/8z23rRiGSrDh1xcn7HVec1MQyoIqNLSjT5/a2wqKhGTek2m6F
	S7H1TfN+g/0InBTVwZO+zHN1EzTwiMLm8d+zWtoLFa0MHsJXV7jQv9/odqZBxBqIu5mt
	jnKb/fN4n9+pIQyYHMrWWg92w4e/2s055q0Mqje3Lp2lwH83kKxBaxFJrp7v80i4OqxA
	rITg==
X-Gm-Message-State: ALyK8tKMfwJDhZftlCTG6W8V1G13ZIVzOAdd3fQuRH+CfQtpOX0zUSvd07RLpqLxwDq8zA==
X-Received: by 10.28.68.213 with SMTP id r204mr2713665wma.23.1467973579922;
	Fri, 08 Jul 2016 03:26:19 -0700 (PDT)
Received: from resin.home (host86-179-71-94.range86-179.btcentralplus.com.
	[86.179.71.94]) by smtp.gmail.com with ESMTPSA id
	o142sm1289626wme.20.2016.07.08.03.26.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Jul 2016 03:26:18 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
X-Google-Original-From: Andrei Gherzan <andrei@resin.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Jul 2016 11:26:07 +0100
Message-Id: <20160708102607.7068-1-andrei@resin.io>
X-Mailer: git-send-email 2.9.0
Subject: [meta-python][PATCH] netmap: blacklist
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
X-List-Received-Date: Fri, 08 Jul 2016 10:26:21 -0000

From: Martin Jansa <Martin.Jansa@gmail.com>

* it's broken for very long time

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---
 meta-networking/recipes-kernel/netmap/netmap_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-kernel/netmap/netmap_git.bb b/meta-networking/recipes-kernel/netmap/netmap_git.bb
index a028585..667e7cc 100644
--- a/meta-networking/recipes-kernel/netmap/netmap_git.bb
+++ b/meta-networking/recipes-kernel/netmap/netmap_git.bb
@@ -32,3 +32,6 @@ do_install () {
 FILES_${PN} += "${bindir}"
 RDEPENDS_${PN} = "kernel-module-netmap"
 RRECOMMENDS_${PN} = "kernel-module-netmap"
+
+# http://errors.yoctoproject.org/Errors/Details/69733/
+PNBLACKLIST[netmap] ?= "BROKEN: Tries to build kernel module and fails, either it should be disabled or there should be dependency on kernel like in netmap-modules"
-- 
2.9.0


