Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web08.13196.1632150751997215571
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Sep 2021 08:12:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=joLQPsW0;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id CEE3A80224;
	Mon, 20 Sep 2021 17:12:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1632150750;
	bh=xa7Ss34rpGlnDQAC3UczYXZD26HjKkt7dftMg17mf5w=;
	h=From:To:Cc:Subject:Date:From;
	b=joLQPsW0nyaWEFj3dxjio3XXaildvpnHMFoIa1fyDfat9XIG+7Cgt2Ae6sydOlRl2
	 3xhAU/O5ncy/QukBJz2HbfRvQZ6f7f+OYuurIbm0vYwOwt4Bue9+mAvoHHjute9rnb
	 tUXVKhKnUdxMureQPEBdqUaFxUsaSnttwnC4GWeEonZ1PwL3lp0qt9sXQJRX+NCmGg
	 5P+46WHn4C40EijYO3cbC4uYvc7biQimfFRVAcHbjVSc8fxtZPoUzb8ObXIisiw6wO
	 2t5HVvb1EPkzIslvblLABpC3HALn7LjA0j1J9xn6SvCfLlhcAm8Y9cCg/+AkBkQod0
	 wv0iIm96tDAyQ==
From: "Marek Vasut" <marex@denx.de>
To: openembedded-devel@lists.openembedded.org,
	akuster808@gmail.com
Cc: Marek Vasut <marex@denx.de>,
	Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][dunfell][PATCH] dstat: Add missing python-six runtime dependency
Date: Mon, 20 Sep 2021 17:12:26 +0200
Message-Id: <20210920151226.8816-1-marex@denx.de>
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
index 74af54ca5..0e314b8ee 100644
--- a/meta-oe/recipes-support/dstat/dstat_0.7.4.bb
+++ b/meta-oe/recipes-support/dstat/dstat_0.7.4.bb
@@ -21,4 +21,4 @@ do_install() {
     oe_runmake 'DESTDIR=3D${D}' install
 }
=20
-RDEPENDS_${PN} +=3D "python3-core python3-misc python3-resource python3-=
shell python3-unixadmin"
+RDEPENDS_${PN} +=3D "python3-core python3-misc python3-resource python3-=
shell python3-six python3-unixadmin"
--=20
2.33.0

