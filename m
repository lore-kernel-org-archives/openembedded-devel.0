Received: from [128.222.32.20] (helo=mexforward.lss.emc.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Lin_Lynn@emc.com>) id 1M7lYa-0007PU-Bh
	for openembedded-devel@openembedded.org; Sat, 23 May 2009 09:22:12 +0200
Received: from hop04-l1d11-si03.isus.emc.com (HOP04-L1D11-SI03.isus.emc.com
	[10.254.111.23])
	by mexforward.lss.emc.com (Switch-3.2.5/Switch-3.1.7) with ESMTP id
	n4N7EOCC006794
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Sat, 23 May 2009 03:14:24 -0400 (EDT)
From: Lin_Lynn@emc.com
Received: from mailhub.lss.emc.com (numailhub.lss.emc.com [10.254.144.16]) by
	hop04-l1d11-si03.isus.emc.com (Tablus Interceptor) for
	<openembedded-devel@openembedded.org>;
	Sat, 23 May 2009 03:14:13 -0400
Received: from corpussmtp2.corp.emc.com (corpussmtp2.corp.emc.com
	[128.221.14.146])
	by mailhub.lss.emc.com (Switch-3.3.2/Switch-3.3.2) with ESMTP id
	n4N7ECDE000943 for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 May 2009 03:14:12 -0400
Received: from CORPUSMX100C.corp.emc.com ([128.222.76.50]) by
	corpussmtp2.corp.emc.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Sat, 23 May 2009 03:14:12 -0400
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Sat, 23 May 2009 03:14:10 -0400
Message-ID: <065E68EB87448440A3E75B4DBB5E871C3DA962@CORPUSMX100C.corp.emc.com>
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
Thread-Topic: [oe][patch] fix rpm package in qa stage error
Thread-Index: AcnbdhFgm7ewu8esR8iR2wUIThrlgg==
To: <openembedded-devel@openembedded.org>
X-OriginalArrivalTime: 23 May 2009 07:14:12.0592 (UTC)
	FILETIME=[12DDCF00:01C9DB76]
X-EMM-EM: Active
Subject: [patch] fix rpm package in qa stage error
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
X-List-Received-Date: Sat, 23 May 2009 07:22:12 -0000
X-Groupsio-MsgNum: 10636
Content-class: urn:content-classes:message
Content-Type: multipart/mixed; boundary="----_=_NextPart_001_01C9DB76.12C2F5B2"

------_=_NextPart_001_01C9DB76.12C2F5B2
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

In rpm package,some .debug file weren't in any .debug package
The following patch to fix this bug,pls review ,thanks

Lynn Lin

diff --git a/recipes/rpm/rpm_4.4.2.3.bb b/recipes/rpm/rpm_4.4.2.3.bb
index 3e67378..e1f91c3 100644
--- a/recipes/rpm/rpm_4.4.2.3.bb
+++ b/recipes/rpm/rpm_4.4.2.3.bb
@@ -2,3 +2,4 @@ inherit distutils-base gettext
=20
 DEPENDS =3D "zlib beecrypt file popt python sed-native"
 require ${PN}-${PV}.inc
+FILES_${PN}-dbg +=3D "${libdir}/${PN}/.debug"



 <<fix-qa-stage-error.diff>>=20

------_=_NextPart_001_01C9DB76.12C2F5B2
Content-Type: application/octet-stream;
	name="fix-qa-stage-error.diff"
Content-Transfer-Encoding: base64
Content-Description: fix-qa-stage-error.diff
Content-Disposition: attachment;
	filename="fix-qa-stage-error.diff"

ZGlmZiAtLWdpdCBhL3JlY2lwZXMvcnBtL3JwbV80LjQuMi4zLmJiIGIvcmVjaXBlcy9ycG0vcnBt
XzQuNC4yLjMuYmIKaW5kZXggM2U2NzM3OC4uZTFmOTFjMyAxMDA2NDQKLS0tIGEvcmVjaXBlcy9y
cG0vcnBtXzQuNC4yLjMuYmIKKysrIGIvcmVjaXBlcy9ycG0vcnBtXzQuNC4yLjMuYmIKQEAgLTIs
MyArMiw0IEBAIGluaGVyaXQgZGlzdHV0aWxzLWJhc2UgZ2V0dGV4dAogCiBERVBFTkRTID0gInps
aWIgYmVlY3J5cHQgZmlsZSBwb3B0IHB5dGhvbiBzZWQtbmF0aXZlIgogcmVxdWlyZSAke1BOfS0k
e1BWfS5pbmMKK0ZJTEVTXyR7UE59LWRiZyArPSAiJHtsaWJkaXJ9LyR7UE59Ly5kZWJ1ZyIK

------_=_NextPart_001_01C9DB76.12C2F5B2--
