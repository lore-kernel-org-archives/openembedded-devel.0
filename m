Return-Path: <scott@jumpnowtek.com>
X-Greylist: delayed 498 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 12 Nov 2015 15:36:40 UTC
Received: from smtp65.iad3a.emailsrvr.com (smtp65.iad3a.emailsrvr.com
	[173.203.187.65])
	by mail.openembedded.org (Postfix) with ESMTP id 47CCA77234
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 15:36:40 +0000 (UTC)
Received: from smtp1.relay.iad3a.emailsrvr.com (localhost.localdomain
	[127.0.0.1])
	by smtp1.relay.iad3a.emailsrvr.com (SMTP Server) with ESMTP id
	3C875180D1C for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 10:28:20 -0500 (EST)
Received: from app4.wa-webapps.iad3a (relay-webapps.rsapps.net
	[172.27.255.140])
	by smtp1.relay.iad3a.emailsrvr.com (SMTP Server) with ESMTP id
	32B4E180D12 for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 10:28:20 -0500 (EST)
X-Sender-Id: scott@jumpnowtek.com
Received: from app4.wa-webapps.iad3a (relay-webapps.rsapps.net
	[172.27.255.140]) by 0.0.0.0:25 (trex/5.5.4);
	Thu, 12 Nov 2015 10:28:20 -0500
Received: from jumpnowtek.com (localhost.localdomain [127.0.0.1])
	by app4.wa-webapps.iad3a (Postfix) with ESMTP id 1C24C280025
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 10:28:20 -0500 (EST)
Received: by apps.rackspace.com (Authenticated sender: scott@jumpnowtek.com,
	from: scott@jumpnowtek.com) 
	with HTTP; Thu, 12 Nov 2015 10:28:20 -0500 (EST)
Date: Thu, 12 Nov 2015 10:28:20 -0500 (EST)
From: "Scott Ellis" <scott@jumpnowtek.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Importance: Normal
X-Priority: 3 (Normal)
X-Type: plain
X-Auth-ID: scott@jumpnowtek.com
Message-ID: <1447342100.11374493@apps.rackspace.com>
X-Mailer: webmail/11.6.5-RC
Subject: [PATCH][meta-python]: python-requests: Add RDEPENDS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Nov 2015 15:36:44 -0000
Content-Type: text/plain;charset=UTF-8
Content-Transfer-Encoding: quoted-printable

The python-requests module has runtime dependencies.=0A=0ASigned-off-by: Sc=
ott Ellis <scott@jumpnowtek.com>=0A---=0A meta-python/recipes-devtools/pyth=
on/python-requests_2.7.0.bb | 2 ++=0A 1 file changed, 2 insertions(+)=0A=0A=
diff --git a/meta-python/recipes-devtools/python/python-requests_2.7.0.bb b=
/meta-python/recipes-devtools/python/python-requests_2.7.0.bb=0Aindex 1564d=
50..ac47202 100644=0A--- a/meta-python/recipes-devtools/python/python-reque=
sts_2.7.0.bb=0A+++ b/meta-python/recipes-devtools/python/python-requests_2.=
7.0.bb=0A@@ -14,3 +14,5 @@ SRC_URI[sha256sum] =3D "398a3db6d61899d25fd4a06c=
6ca12051b0ce171d705decd7ed5511517b=0A S =3D "${WORKDIR}/${SRCNAME}-${PV}"=
=0A=0A inherit setuptools=0A+=0A+RDEPENDS_${PN} =3D "python-email python-js=
on python-netserver python-zlib"=0A--=0A2.5.0=0A


