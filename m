Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by mx.groups.io with SMTP id smtpd.web09.6943.1628685627321325736
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Aug 2021 05:40:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=gE/QWyTZ;
 spf=pass (domain: gmx.de, ip: 212.227.17.21, mailfrom: dl9pf@gmx.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1628685622;
	bh=POOashv++G+mpLccbL8CAemCIZw/WgmTpg41clKtJbI=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=gE/QWyTZQopyWw6C9h+g76hblb1XrYm7QIzfJDLXjifi7MDxFrkD9s8NfBKDRFAmX
	 xGB6+eaKHqSSpM+6qVio3RfBuDvxXOXiqY8xjm9bca4ghZ9kzWVPHyHyLgdCK84k5M
	 wEqrcUb/DIMfdC26mJIr1L5FxzB9iErIXEO9MYc4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from samweis.speedport.ip ([79.254.218.141]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1M4JmT-1mDWPn0KVl-000I9F; Wed, 11 Aug 2021 14:40:22 +0200
From: =?UTF-8?B?SmFuLVNpbW9uIE3DtmxsZXI=?= <dl9pf@gmx.de>
To: openembedded-devel@lists.openembedded.org
Cc: Anatol Belski <anbelski@linux.microsoft.com>,
	Khem Raj <raj.khem@gmail.com>,
	Jan-Simon Moeller <dl9pf@gmx.de>
Subject: [meta-oe][dunfell][PATCH] backport: xmlsec1: Fix configure QA error caused by host lookup path
Date: Wed, 11 Aug 2021 14:39:43 +0200
Message-Id: <20210811123943.32085-1-dl9pf@gmx.de>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:oaiO4uxljE7j8fzEudt46/RCizR0M0eHq2VJ7Zbhop2ypAugi5Q
 iph3yoE79tDpfvU0iTkXVxafcLG+0r0V5U46TCzrQYlLUNKsuJjAs9jHWWGYx0aGTRww4dn
 IZEa+kyFDuzjf7IPvBGjSLg3Z8EUpvYKs7tQNVkbOU2wOUfH2uTSv6ZzENYl/Pf/w1DxLBg
 xgILSsXSFMLu/WM3Djg/A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:N2991ZojDtQ=:WhiwMY1K11rUBKIyhjCe2M
 Sv/JZo4dvldttpAktY6CtOiTB7pA0AgMJVsxAhOgVaSQGk8UU8iYjevfJuXzkUzfDcANP2WtY
 tXko+A+baQYmz8/Y97CKp3Zzo7eMeZfUT3b5oUTY/RnVVkOcPhOcBJ/TzmLsSeGTxDnj7tKT9
 iSIW3o7BA0qQJbliKszSiHSVQ/48kujMTmpsqbaRzGe4N9Gaef3/yg+z/seYR0hXsEHVddxGL
 GFWDBlutpz6yzh6sjm0GMPGXo7p2yQgJCKiYFudg/SoKeji/ARq8q332T4/L7YI4FF+zf5BYS
 DYx+yCwjvcwmns603OXyPXXcmzpxixS6tgqzV+O6OpchReG072UZ2eaKbtCrHYf5emXOIz4nQ
 8BjOpyq+5zidZpckZ5EB+2Esqof7fNBdxZnKmwi7HGZ9wIHxacYVqhbvama6EqHkbMkq5VL0D
 JqztbdlPS7+jrbOMQQ40PE8AFClyJhHiqTBZXUBRrtiLwe4idl3PxMMu3xoPDFlZFlTDSDV+/
 yDMWpJjOH6BuEMXIrpbIzbSpp86Og4Zvnxl3XZkZN/Kx2C2DO9vXPRlguBeKVesq9ncqPmDNV
 CG4REVX0eOkDOGLQ/NzkUo+nqdTdAONdpBjrpqn4zrohWMIjfUKlibSPPk7otwRcscaI/p7Id
 X9kUMJAsJCkmHuMQlERyvLL+nPQbNJpl134QcMncshredS8K3UGe0IoLaqXhsD7dh+ytvDmnG
 gSsNmUdJ9KefmUEJAhcU2s3yQywsXGbCaWsqTkJCZHyMP6oFAWGB3BVihMtCNFxat1oMfXAzd
 K5OGFYml5Sn17vpvktdHEMjh1aB5cmv76mKXNZYYC1osStUUyzepWKfgG/+pnfJsfO34wHbi5
 VNub7rPeGZrioTXli2pL4NG428hQ/6mL2gmlUFob4vGznn97FEboRGbQDpLpPwSt2nLh2JIRG
 RboRNtH4s7l1qfIZ5MjiLAGLXhbhIok26rtSlvdMV7cib5vlJImMYTlBeulAMmzQV8WCvPGoE
 KzIE95fnGbS8T5g8KsBNVWw/Qxws++9igyHlt7TQ8FJu5nA93rY0eWuoIi7Jz0sibxgZm7TOi
 wrVnGkYux9jPLLdj8H/wXi6oT6o0ZDpgviz
Content-Transfer-Encoding: quoted-printable

From: Anatol Belski <anbelski@linux.microsoft.com>

The configure script contains hardcoded lookup paths to /usr and other
paths that might interfere with the host. These are overwritten with the
staging dir locations for Poky compatibility.

Backport from meta-oe master rev. 74b66d1911118bac53033f77ba6d3923f4809d5a

Signed-off-by: Anatol Belski <anbelski@linux.microsoft.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Jan-Simon Moeller <dl9pf@gmx.de>
=2D--
 .../xmlsec1/ensure-search-path-non-host.patch | 22 +++++++++++++++++++
 .../recipes-support/xmlsec1/xmlsec1_1.2.30.bb |  1 +
 2 files changed, 23 insertions(+)
 create mode 100644 meta-oe/recipes-support/xmlsec1/xmlsec1/ensure-search-=
path-non-host.patch

diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1/ensure-search-path-no=
n-host.patch b/meta-oe/recipes-support/xmlsec1/xmlsec1/ensure-search-path-=
non-host.patch
new file mode 100644
index 000000000..a5a298af0
=2D-- /dev/null
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1/ensure-search-path-non-host.=
patch
@@ -0,0 +1,22 @@
+xmlsec1: Fix configure QA error caused by host lookup path
+
+ERROR: mc:my-sdk:xmlsec1-1.2.30-r0 do_configure: QA Issue: This autoconf =
log indicates errors, it looked at host include and/or library paths while=
 determining system capabilities.
+
+It will eventually arise after the configure QA as the configure script s=
hould only look at the staging sysroot dir, not at the host.
+
+Upstream-Status: Inappropriate [embedded specific]
+Signed-off-by: Anatol Belski <anbelski@linux.microsoft.com>
+
+--- a/configure.ac.orig   2021-01-13 14:37:42.254991177 +0000
++++ b/configure.ac        2021-01-13 14:40:56.546269330 +0000
+@@ -250,8 +250,8 @@
+ dnl =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
+ dnl Common installation locations
+ dnl =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
+-COMMON_INCLUDE_DIR=3D"/usr/include /usr/local/include"
+-COMMON_LIB_DIR=3D"/usr/lib /usr/lib64 /usr/local/lib"
++COMMON_INCLUDE_DIR=3D"${STAGING_INCDIR}"
++COMMON_LIB_DIR=3D"${STAGING_LIBDIR}"
+ case $host in
+     i*86-*-linux-gnu)   COMMON_LIB_DIR=3D"$COMMON_LIB_DIR /usr/lib/i386-=
linux-gnu" ;;
+     x86_64-*-linux-gnu) COMMON_LIB_DIR=3D"$COMMON_LIB_DIR /usr/lib/x86_6=
4-linux-gnu" ;;
diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.30.bb b/meta-oe/r=
ecipes-support/xmlsec1/xmlsec1_1.2.30.bb
index 20c7b2d37..391614b5f 100644
=2D-- a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.30.bb
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.30.bb
@@ -19,6 +19,7 @@ SRC_URI =3D "http://www.aleksey.com/xmlsec/download/${BP=
}.tar.gz \
     file://xmlsec1-examples-allow-build-in-separate-dir.patch \
     file://0001-nss-nspr-fix-for-multilib.patch \
     file://run-ptest \
+    file://ensure-search-path-non-host.patch \
     "

 SRC_URI[md5sum] =3D "b66ec21e0a0ac331afb4b1bc5c9ef966"
=2D-
2.32.0

