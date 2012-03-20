Received: from 217-162-240-44.dynamic.hispeed.ch ([217.162.240.44]
	helo=server.ataraxic.org) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cixarata@ataraxic.org>) id 1SA09u-00011m-JJ
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Mar 2012 15:35:34 +0100
Received: from localhost (ns1 [127.0.0.1])
	by server.ataraxic.org (Postfix) with ESMTP id 9EA6328606C9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Mar 2012 15:20:50 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at server.ataraxic.org
Received: from server.ataraxic.org ([127.0.0.1])
	by localhost (server.ataraxic.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uN7-f6F-u7J7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Mar 2012 15:20:49 +0100 (CET)
Received: from ataraxic.org (ns1 [127.0.0.1])
	by server.ataraxic.org (Postfix) with ESMTP id 0D0712860E57
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Mar 2012 15:20:49 +0100 (CET)
Received: from 84.253.37.166
	(SquirrelMail authenticated user cixarata@ataraxic.org)
	by ataraxic.org with HTTP; Tue, 20 Mar 2012 15:20:49 +0100
Message-ID: <948b25806fcb2ca6d6388562222c96be.squirrel@ataraxic.org>
Date: Tue, 20 Mar 2012 15:20:49 +0100
From: cixarata@ataraxic.org
To: openembedded-devel@lists.openembedded.org
User-Agent: SquirrelMail/1.4.22
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Subject: [PATCH] dhcpcd: fix GNU hash
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 20 Mar 2012 14:35:34 -0000
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

Fixed adding that to the recipe:
TARGET_CC_ARCH +=3D "${LDFLAGS}"

Signed-off-by: Yury Georgievskiy <cixarata@ataraxic.org>
---
 recipes/dhcpcd/dhcpcd_1.3.22-pl4.bb |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes/dhcpcd/dhcpcd_1.3.22-pl4.bb
b/recipes/dhcpcd/dhcpcd_1.3.22-pl4.bb
index a9f57b4..189d263 100644
--- a/recipes/dhcpcd/dhcpcd_1.3.22-pl4.bb
+++ b/recipes/dhcpcd/dhcpcd_1.3.22-pl4.bb
@@ -5,7 +5,7 @@ RFC1541-compliant DHCP client daemon. It gets an IP addre=
ss \
 and other information from the DHCP server, automatically \
 configures the network interface, and tries to renew the \
 lease time according to RFC2131 or RFC1541."
-PR =3D "r1"
+PR =3D "r2"

 sbindir =3D "/sbin"

@@ -15,6 +15,7 @@ SRC_URI =3D
"http://www.phystech.com/ftp/dhcpcd-${PV}.tar.gz \

 inherit autotools

+TARGET_CC_ARCH +=3D "${LDFLAGS}"

 SRC_URI[md5sum] =3D "dd627a121e43835bead3ffef5b1a72fd"
 SRC_URI[sha256sum] =3D
"f435e14e1f54dc8792f4e655463d07f2bdbe6d8a8581bd62f5167334ab18bb87"
--=20
1.7.9.2





