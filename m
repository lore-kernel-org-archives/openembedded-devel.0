Return-Path: <lukasz.kubalski.ext@nokia.com>
X-Greylist: delayed 3719 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 18 Dec 2015 12:53:39 UTC
Received: from muemrel002.nsn-inter.net (muemrel002.nsn-inter.net
	[93.183.12.107])
	by mail.openembedded.org (Postfix) with ESMTP id 74D8C731A2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Dec 2015 12:53:39 +0000 (UTC)
Received: from muvmp319.nsn-intra.net ([10.159.32.166])
	by muemrel002.nsn-inter.net (8.15.2/8.15.2) with ESMTPS id
	tBIBpeTa030349
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Dec 2015 11:51:40 GMT
Received: from DEMUHTC001.nsn-intra.net ([10.159.42.32])
	by muvmp319.nsn-intra.net (8.14.3/8.14.3) with ESMTP id tBIBpdmM019132
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Dec 2015 11:51:40 GMT
Received: from DEMUMBX004.nsn-intra.net ([169.254.4.182]) by
	DEMUHTC001.nsn-intra.net ([10.159.42.32]) with mapi id 14.03.0248.002;
	Fri, 18 Dec 2015 12:51:39 +0100
From: "Kubalski, Lukasz (EXT-Espotel - PL/Wroclaw)"
	<lukasz.kubalski.ext@nokia.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: How to force recipe to be parsed eveey time -  dynamic PV value
Thread-Index: AdE5ii5YuxUvjenaTh2wvmACLZIUow==
Date: Fri, 18 Dec 2015 11:51:38 +0000
Message-ID: <1BDA3F91DD18BA459E26B6B10F84A8D7010AB82D@DEMUMBX004.nsn-intra.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.159.42.115]
MIME-Version: 1.0
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
	further information)
X-purgate-size: 3416
X-purgate-ID: 151667::1450439500-00000FCD-95D384C7/0/0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: How to force recipe to be parsed eveey time - dynamic PV value
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
X-List-Received-Date: Fri, 18 Dec 2015 12:53:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I have problem that recipe is not always parsed.
Is it way to force it? Like checksum/signature/stamp invalidation?

Problem details:
   I need to have my PV to be generated dynamically e.g like PV =3D "${@my_=
get_version_func(d)}"

In such case recipe is not parsed every time (checksum doesn't change), PV =
is no reevaluated  and even my_get_version_func would return different valu=
e my image is not rebuilt.

Thanks for any suggestions.


