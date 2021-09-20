Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.13171.1632150669191140128
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Sep 2021 08:11:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=snHavX/9;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id ACEAD80224;
	Mon, 20 Sep 2021 17:11:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1632150666;
	bh=OMvOIYHb/EwixVKhKjNz0oN6UrsghbtkuBBlw6OLLj0=;
	h=From:To:Cc:Subject:Date:From;
	b=snHavX/9q5jefXXN86RR6/PL1czs3u2hMlk72zXSDmnzRA7XH8tz58XOuCeppA95Y
	 HmQO71xkbeUx8IuTksINvqlVZzLjBOz/i9iRFLvhuvqexAhPmTGQ4nPgYBNwYSrhiM
	 sPYkMXzNPmI4UJHjmOFArjcFkQW6C9pLZYLISmiQETmNym7pJZjxf35wa5lsIA328Z
	 /xYQ3/yH/o8BHSJJETIpCeII7IC7I8DmfXgridcoSqlSw2Z4N68AyBFBGnwItipPx6
	 SaMW7tkXTbPbXXGMQPqArZ29sPwKRuHWYjiWzBbBCe04Ka4FfGzsc7E4BivikRZNOA
	 Tcps9hpvThT4g==
From: "Marek Vasut" <marex@denx.de>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Cc: Marek Vasut <marex@denx.de>,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] dstat: Add missing python-six runtime dependency
Date: Mon, 20 Sep 2021 17:10:41 +0200
Message-Id: <20210920151041.8557-1-marex@denx.de>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable

The tool depends on the six module, add it, otherwise the following
traceback happens when running it on the target:

Traceback (most recent call last):
  File "/usr/bin/dstat", line 32, in <module>
    import six
ModuleNotFoundError: No module named 'six'

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Khem Raj <raj.khem@gmail.com>
Cc: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/dstat/dstat_0.7.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/dstat/dstat_0.7.4.bb b/meta-oe/recip=
es-support/dstat/dstat_0.7.4.bb
index 0511f4a30..a1076ccf9 100644
--- a/meta-oe/recipes-support/dstat/dstat_0.7.4.bb
+++ b/meta-oe/recipes-support/dstat/dstat_0.7.4.bb
@@ -21,4 +21,4 @@ do_install() {
     oe_runmake 'DESTDIR=3D${D}' install
 }
=20
-RDEPENDS:${PN} +=3D "python3-core python3-misc python3-resource python3-=
shell python3-unixadmin"
+RDEPENDS:${PN} +=3D "python3-core python3-misc python3-resource python3-=
shell python3-six python3-unixadmin"
--=20
2.33.0

