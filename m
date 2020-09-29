Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web10.12801.1601350431106267143
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Sep 2020 20:33:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=default header.b=tWGqhSmp;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: okaya@kernel.org)
Received: from sinanubuntu.ckuic5o5zete5ommc4uz5anrqg.bx.internal.cloudapp.net (unknown [23.96.20.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 3A40E208D5;
	Tue, 29 Sep 2020 03:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601350430;
	bh=FZTrBvuMnEK4W6SFnQ1852qhW2ohsflmouFqBKhsGfY=;
	h=From:To:Cc:Subject:Date:From;
	b=tWGqhSmp5gPprb519m+h37namqJ0ulY8rZnfLNa9gAh+4AaXGzm407DT4C8yeCpwh
	 ayBl/tg8FXBVSJwSlW2YzZa+kfSpcvoaIdktf5V+hlTrZR9uZn18HQWp31LJFvvvI0
	 f7W66NWpCLj4uOVKnfEfWQJfokCYTb8f9KBlgTAM=
From: "Sinan Kaya" <okaya@kernel.org>
To: openembedded-devel@lists.openembedded.org
Cc: Sinan Kaya <okaya@kernel.org>
Subject: [meta-oe][PATCH] collectd: make rrdtool and rrdcached optional
Date: Tue, 29 Sep 2020 03:33:44 +0000
Message-Id: <20200929033344.120687-1-okaya@kernel.org>
X-Mailer: git-send-email 2.17.1

rrdtool plugin pulls x11 library dependencies into the target.
It should be only set on need basis.

Signed-off-by: Sinan Kaya <okaya@kernel.org>
---
 meta-oe/recipes-extended/collectd/collectd_5.12.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb b/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb
index 40a8442a53..b9e735f27d 100644
--- a/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb
+++ b/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb
@@ -49,6 +49,8 @@ PACKAGECONFIG[libesmtp] = "--with-libesmtp,--without-libesmtp,libesmtp"
 PACKAGECONFIG[libmnl] = "--with-libmnl,--without-libmnl,libmnl"
 PACKAGECONFIG[libatasmart] = "--with-libatasmart,--without-libatasmart,libatasmart"
 PACKAGECONFIG[ldap] = "--enable-openldap --with-libldap,--disable-openldap --without-libldap, openldap"
+PACKAGECONFIG[rrdtool] = "--enable-rrdtool,--disable-rrdtool,rrdtool"
+PACKAGECONFIG[rrdcached] = "--enable-rrdcached,--disable-rrdcached,rrdcached"
 
 EXTRA_OECONF = " \
                 ${FPLAYOUT} \
-- 
2.17.1

