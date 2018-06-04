Return-Path: <Noor_Ahsan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 5F180719AF
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jun 2018 08:53:18 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=svr-ies-mbx-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-SHA384:256)
	id 1fPlEs-0005gX-RJ from Noor_Ahsan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Jun 2018 01:53:18 -0700
Received: from svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1) by
	svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1) with Microsoft SMTP
	Server (TLS) id 15.0.1320.4; Mon, 4 Jun 2018 09:53:15 +0100
Received: from svr-ies-mbx-01.mgc.mentorg.com ([fe80::15aa:fe76:2483:1cce]) by
	svr-ies-mbx-01.mgc.mentorg.com ([fe80::15aa:fe76:2483:1cce%22]) with
	mapi id 15.00.1320.000; Mon, 4 Jun 2018 09:53:15 +0100
From: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-networking][PATCH] radvd: Fix missing yacc error.
Thread-Index: AQHT9CUvzp69w6j1FkWceaFB/6uKTKRP2kQw
Date: Mon, 4 Jun 2018 08:53:15 +0000
Message-ID: <3ab64a7c59f14cce82d9c3c07364cf4d@svr-ies-mbx-01.mgc.mentorg.com>
References: <1527249332-31097-1-git-send-email-noor_ahsan@mentor.com>
	<1527249332-31097-2-git-send-email-noor_ahsan@mentor.com>
In-Reply-To: <1527249332-31097-2-git-send-email-noor_ahsan@mentor.com>
Accept-Language: en-US, en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [137.202.0.87]
MIME-Version: 1.0
Subject: Re: [meta-networking][PATCH] radvd: Fix missing yacc error.
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
X-List-Received-Date: Mon, 04 Jun 2018 08:53:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

Any update on this. Kindly apply think on master and Sumo release.

Noor

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedde=
d-devel-bounces@lists.openembedded.org] On Behalf Of Ahsan, Noor
Sent: Friday, May 25, 2018 4:56 PM
To: openembedded-devel@lists.openembedded.org
Subject: [oe] [meta-networking][PATCH] radvd: Fix missing yacc error.

* Following error apprear in do configure. Fix it by adding bison-native in=
 DEPENDS.
  ../radvd-2.17/ylwrap: line 176: yacc: command not found

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 meta-networking/recipes-daemons/radvd/radvd.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/radvd/radvd.inc b/meta-network=
ing/recipes-daemons/radvd/radvd.inc
index bff693c..06d16a4 100644
--- a/meta-networking/recipes-daemons/radvd/radvd.inc
+++ b/meta-networking/recipes-daemons/radvd/radvd.inc
@@ -8,7 +8,7 @@ addresses and some other parameters. They also can \  choos=
e a default router based on these advertisements."
 HOMEPAGE =3D "http://www.litech.org/radvd/"
 SECTION =3D "net"
-DEPENDS =3D "flex-native libdaemon"
+DEPENDS =3D "flex-native bison-native libdaemon "
=20
 # License is BSD-Style (with advertising clause) but also has an additiona=
l 0th clause  LICENSE =3D "radvd"
--
2.7.4

--
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel

