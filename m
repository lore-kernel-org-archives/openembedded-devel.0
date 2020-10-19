Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web11.2978.1603132229930752772
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Oct 2020 11:30:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@koncepto.io header.s=default header.b=d/NijksI;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1148-234.w90-120.abo.wanadoo.fr [90.120.95.234])
	by koncepto.io (Postfix) with ESMTPSA id E5308602D9;
	Mon, 19 Oct 2020 20:30:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1603132227;
	bh=tpwXMFgiz3SOKONxmlM2T1VkAIGpdeFFPQldTHfE/kM=;
	h=From:To:Cc:Subject:Date:From;
	b=d/NijksIXdrjc+x6It4/GgFQCyDS0gjujfyM8sO4K7A7ZdcLp+eyhsVmj4Q+M2rQw
	 DIONRzFitDiqSR/s5MK7HjPx46GCITgihrr/wtN3+lqrEWA+XfYd7aoIx+zQxjAMbZ
	 a6qg2c/FO0OA0lA9yGLhJddK7VIImh0OA+4laLYPPJODWNXe9116dfJALfcJDWs5/b
	 n/rH0K8Le/sAP2rfRH7dQNu7Kl5Enavaasuv9fgmnCvMBe54CGjbP/1JwWPd8eLfXY
	 hLz5/UlWMpHYBY4DAZYoGiboLP0hAQdfWWsRG/Bu4y5ooKb7XWqJLqNVU1BGzIF6k9
	 /y0zienZqHOkg==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-oe][PATCH] stunnel: upgrade 5.56 -> 5.57
Date: Mon, 19 Oct 2020 20:30:24 +0200
Message-Id: <1603132224-3771-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

License-Update: copyright years updated.

This is a bug fix release:

 - X.509 v3 extensions required by modern versions of OpenSSL are added t=
o generated self-signed test certificaes.
 - Fixed a tiny memory leak in configuration file reload error handling (=
thx to Richard K=C3=B6nning).
 - Merged Debian 05-typos.patch (thx to Peter Pentchev).
 - Merged with minor changes Debian 06-hup-separate.patch (thx to Peter P=
entchev).
 - Merged Debian 07-imap-capabilities.patch (thx to Ansgar).
 - Merged Debian 08-addrconfig-workaround.patch (thx to Peter Pentchev).
 - Fixed tests on the WSL2 platform.

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 .../recipes-support/stunnel/{stunnel_5.56.bb =3D> stunnel_5.57.bb}     |=
 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-support/stunnel/{stunnel_5.56.bb =3D> stu=
nnel_5.57.bb} (86%)

diff --git a/meta-networking/recipes-support/stunnel/stunnel_5.56.bb b/me=
ta-networking/recipes-support/stunnel/stunnel_5.57.bb
similarity index 86%
rename from meta-networking/recipes-support/stunnel/stunnel_5.56.bb
rename to meta-networking/recipes-support/stunnel/stunnel_5.57.bb
index 3411e5d..8f6de57 100644
--- a/meta-networking/recipes-support/stunnel/stunnel_5.56.bb
+++ b/meta-networking/recipes-support/stunnel/stunnel_5.57.bb
@@ -6,7 +6,7 @@ SECTION =3D "net"
 # a combined work based on stunnel. Thus, the terms and conditions of th=
e GNU
 # General Public License cover the whole combination.
 LICENSE =3D "GPLv2"
-LIC_FILES_CHKSUM =3D "file://COPYING.md;md5=3Dd6d635d290ba1705821254a027=
8f1ef7"
+LIC_FILES_CHKSUM =3D "file://COPYING.md;md5=3D6bae28875b3b599f8f621f4335=
b17955"
=20
 DEPENDS =3D "autoconf-archive libnsl2 openssl"
=20
@@ -14,8 +14,7 @@ SRC_URI =3D "ftp://ftp.stunnel.org/stunnel/archive/5.x/=
${BP}.tar.gz \
            file://fix-openssl-no-des.patch \
 "
=20
-SRC_URI[md5sum] =3D "01b0ca9e071f582ff803a85d5ed72166"
-SRC_URI[sha256sum] =3D "7384bfb356b9a89ddfee70b5ca494d187605bb516b4fff59=
7e167f97e2236b22"
+SRC_URI[sha256sum] =3D "af5ab973dde11807c38735b87bdd87563a47d2fa1c72a079=
29fcfce80a600fe1"
=20
 inherit autotools
=20
--=20
2.7.4

