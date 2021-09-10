Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by mx.groups.io with SMTP id smtpd.web09.11576.1631291413516793313
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Sep 2021 09:30:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=eCecQFA+;
 spf=pass (domain: gmx.de, ip: 212.227.17.21, mailfrom: dl9pf@gmx.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1631291411;
	bh=3BH7quAde5A2DXB5+NMk0VxkP9Eoblwbc3Y02W2mipA=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=eCecQFA+vHlYz+FYlV125X5wp5ELQAqhDYuEZBA2FTOnWoIl4AomaLP/GDE+DHS7K
	 2NS5PwwdlJwZkrNtPu/81PfM0ap0dvmw33Qfn8lXpqDH/7RJwSn9fiEiRulyKImu3U
	 0t1FZidHvCb6ieh26P1RGXrqKASkbSV9i5FdQE54=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from gmx.de ([95.88.57.223]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MMobU-1mhVHr1UJw-00Ihh3; Fri, 10
 Sep 2021 18:30:11 +0200
From: =?UTF-8?B?SmFuLVNpbW9uIE3DtmxsZXI=?= <dl9pf@gmx.de>
To: openembedded-devel@lists.openembedded.org
Cc: Jan-Simon Moeller <dl9pf@gmx.de>
Subject: [meta-oe][PATCH] Remove patch that produces a segfault in the ptest of lua
Date: Fri, 10 Sep 2021 18:29:49 +0200
Message-Id: <20210910162949.3732-1-dl9pf@gmx.de>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:OYLDvwHGJGbr1GiBWAzD3f/YY4q/dnzb4tSEaVz5eU3FFtdXs5x
 Dr25zZmAVVpfhi06AFCaCNpQmJmXc6vSSuPv2/+jqSjnk1nN29zADrAHWsblyMYz+8vdp4w
 esPZQ5CpJ1F/lMxfe0HNqokVrP+lB+lZ+oxM0p5Kc6lOz8dfwuZ7wttq9yvML3cCvJhJk9R
 NZNcDH3K5YoXYHTCyP+5w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ms1qeQLzPyA=:0fVNv4yZKyXD0qmMPRjiEu
 VaB9SiEodwOdNH0vGKe56Qe7AHKVhp6U/3IyrqMlTrlJVv4ef/QHcMmPTIWOaIcdJAYyL/kXs
 gItQw6dsYX+x+jjGksnXBPch5o21Y38eOtlUh+V3Nc78BV/uYu1luxkYSZ4/Z+5/EW9qGPDEY
 80ZgliinntpFXvhb+5Ob/oyrSKUJ0ai3bIx1g+Uu4Kvb9gpLEfnVg81dRMHlZag9bhdc2w9l4
 IJXTgwWdHUOOkqFhGmk/DNETNQTKx94LSugQnM5qHMAKBhGOfBq7InlYiIHY2Pt44i62yVNOK
 prGeuyoexztHbyx5SBUcnfz1DpbfnNgSJ6knTlT6fzWI0GXP9c2s/MUp0+gEd1gK0BupeS95W
 P1036k1UFqgpZGvRTIDpjtiEeAXFIPeQeOcgj2XmH4aPzJj0MBCSoLw/btM50WMaIMDNGBEii
 LYJSpPtczzdrId5sGN7B/nV8rlxOyhcMfRobfrNsPFOMyMUim0Vmclgjqk5nF7WqDimnK6oGP
 YXY/uDg04wHHYPqxZbr6f5WHYigh6++mjIiuRGfiav/vTrU3+7JyuoNNZ1awEobg6vSlCvxDK
 CaenBT90s31xFTdFOnqA+Gbg9unZK0+NIEyp6pP0cH0o4HEYinNr9KcHeq2fQteQ6Rk9ojODH
 Vcz7sNIjf3dUqsFZCvt5BBmi5cQtfNpuIv0kYtTwM9sjoGZYTosS9SFlm2b6IOiKoNwss/ccT
 ZLxwRApQxeZJBXPpz/Cwbabul15zK7R0IlZiWb5FbdZ0ZofwH40AMZcvMb9DRm89Vt64HIzKa
 uAfXALKfTkkx89N2pLVxqWXqVpvsf5sUTJ4KmWRLwLDFWsn1V9gzlBAidaJMfE5PuP7u7DZLJ
 FO3fijKfn8q2rNSgjzcdO9J0d/yTttbrHYv0zxrrB2Mwrpp07h7bEdNl5CBUEfz0FueMI8j3t
 B8ybMJ9M2x/leMarNBfcHZaLtWyYWx6G8fDVeP3D2XWflCIIFBWYvm8RwZ2mMw7KPOCNsLLhM
 WXgBQNfRlOu5Kz7TsJi86hTjdx3qJgB6sWmrQVJbIutYr2SKEcj8+o2k9YRN/uafew==
Content-Transfer-Encoding: quoted-printable

From: Jan-Simon Moeller <dl9pf@gmx.de>

The patch file CVE-2020-15945.patch does cause a segfault in the lua ptest=
 (db.lua test).
According to upstream developers the patch is not correct and causes the s=
egfault.

Reproduce: build core-image-minimal with lua and ptest-pkgs on .
Run: ptest-runner lua

This test passes if the patch is removed.

Please also backport to dunfell as well.

Signed-off-by: Jan-Simon Moeller <dl9pf@gmx.de>
=2D--
 meta-oe/recipes-devtools/lua/lua_5.3.6.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/lua/lua_5.3.6.bb b/meta-oe/recipes-d=
evtools/lua/lua_5.3.6.bb
index f830e0925..af3054dcb 100644
=2D-- a/meta-oe/recipes-devtools/lua/lua_5.3.6.bb
+++ b/meta-oe/recipes-devtools/lua/lua_5.3.6.bb
@@ -8,7 +8,6 @@ SRC_URI =3D "http://www.lua.org/ftp/lua-${PV}.tar.gz;name=
=3Dtarballsrc \
            file://lua.pc.in \
            file://0001-Allow-building-lua-without-readline-on-Linux.patch=
 \
            file://CVE-2020-15888.patch \
-           file://CVE-2020-15945.patch \
            file://0001-Fixed-bug-barriers-cannot-be-active-during-sweep.p=
atch \
            "

=2D-
2.32.0

