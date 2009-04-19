Received: from [208.51.207.131] (helo=mail.2mi.com.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcos@2mi.com.br>) id 1LvNj4-0007nZ-3e
	for openembedded-devel@lists.openembedded.org;
	Sun, 19 Apr 2009 05:29:50 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.2mi.com.br (Postfix) with ESMTP id 210C85010909
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Apr 2009 00:33:57 -0300 (BRT)
X-Virus-Scanned: amavisd-new at 2mi.com.br
Received: from mail.2mi.com.br ([127.0.0.1])
	by localhost (mail.2mi.com.br [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i6DAep4G6+1y
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Apr 2009 00:33:52 -0300 (BRT)
Received: from [192.168.0.108] (201-68-110-159.dsl.telesp.net.br
	[201.68.110.159])
	by mail.2mi.com.br (Postfix) with ESMTP id 3F1AA502762D
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Apr 2009 00:33:52 -0300 (BRT)
From: Marcos Amorim <marcos@2mi.com.br>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <be7a9f3d0904170709p59ad1833qb56ed8d7558783bf@mail.gmail.com>
References: <1239948775.4599.12.camel@faraday>
	<be7a9f3d0904170709p59ad1833qb56ed8d7558783bf@mail.gmail.com>
Organization: 2MI Tecnologia
Date: Sun, 19 Apr 2009 00:25:46 -0300
Message-Id: <1240111546.6360.9.camel@faraday>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: Add missing file to ipkg-utils
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
X-List-Received-Date: Sun, 19 Apr 2009 03:29:51 -0000
X-Groupsio-MsgNum: 9515
Content-Type: multipart/mixed; boundary="=-+5JjKxwf0E0ln/h3FQNK"

--=-+5JjKxwf0E0ln/h3FQNK
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Sorry by the short description, I fix the patch.







Marcos Amorim
Diretor de Tecnologia
2MI Tecnologia
+55 11 8222-1476
+55 11 2527-2749








Em Sex, 2009-04-17 =C3=A0s 11:09 -0300, Otavio Salvador escreveu:
> Hello Marcos,
>=20
> On Fri, Apr 17, 2009 at 3:12 AM, Marcos Amorim <marcos@2mi.com.br> wrot=
e:
> > The arfile.py is required by ipkg.py but not was install
>=20
> NACK!
>=20
> Your patch is right but the comment you've used doesn't make clear
> where it is acting. Please amend your patch and send it again
> with an improved comment.
>=20
> Besides that it looks ok.
>=20

--=-+5JjKxwf0E0ln/h3FQNK
Content-Disposition: attachment; filename=0001-ipkg-util-add-file-arfile.py-into-package.patch
Content-Type: application/mbox; name=0001-ipkg-util-add-file-arfile.py-into-package.patch
Content-Transfer-Encoding: 7bit

From 974c9847d630c3e54c409b9e94258a4d159b30c4 Mon Sep 17 00:00:00 2001
From: Marcos Amorim <marcos@2mi.com.br>
Date: Sun, 19 Apr 2009 00:22:30 -0300
Subject: [PATCH] ipkg-util: add file 'arfile.py' into package

---
 recipes/ipkg-utils/ipkg-utils_1.6+cvs20050404.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/ipkg-utils/ipkg-utils_1.6+cvs20050404.bb b/recipes/ipkg-utils/ipkg-utils_1.6+cvs20050404.bb
index 8baffd2..f0c72fa 100644
--- a/recipes/ipkg-utils/ipkg-utils_1.6+cvs20050404.bb
+++ b/recipes/ipkg-utils/ipkg-utils_1.6+cvs20050404.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL"
 CONFLICTS = "ipkg-link"
 RDEPENDS = "python"
 SRCDATE = "20050404"
-PR = "r23"
+PR = "r24"
 
 SRC_URI = "${HANDHELDS_CVS};module=ipkg-utils \
            file://ipkg-utils-fix.patch;patch=1 \
@@ -19,7 +19,7 @@ SRC_URI = "${HANDHELDS_CVS};module=ipkg-utils \
 
 S = "${WORKDIR}/ipkg-utils"
 
-INSTALL = "ipkg-build ipkg-deb-unbuild ipkg-unbuild ipkg-compare-versions ipkg-upload ipkg-make-index ipkg-link ipkg.py ipkg-list-fields"
+INSTALL = "ipkg-build ipkg-deb-unbuild ipkg-unbuild ipkg-compare-versions ipkg-upload ipkg-make-index ipkg-link ipkg.py arfile.py ipkg-list-fields"
 
 do_compile() {
 	oe_runmake ipkg-compare-versions
-- 
1.5.6.5


--=-+5JjKxwf0E0ln/h3FQNK--
