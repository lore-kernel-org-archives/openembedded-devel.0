Return-Path: <mihai.prica@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 23D5C6A95B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Aug 2013 10:09:41 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 27 Aug 2013 03:09:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,967,1367996400"; d="scan'208";a="287264018"
Received: from irsmsx103.ger.corp.intel.com ([163.33.3.157])
	by AZSMGA002.ch.intel.com with ESMTP; 27 Aug 2013 03:09:36 -0700
Received: from irsmsx153.ger.corp.intel.com (163.33.192.75) by
	IRSMSX103.ger.corp.intel.com (163.33.3.157) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Tue, 27 Aug 2013 11:09:36 +0100
Received: from irsmsx101.ger.corp.intel.com ([169.254.1.83]) by
	IRSMSX153.ger.corp.intel.com ([169.254.9.218]) with mapi id
	14.03.0123.003; Tue, 27 Aug 2013 11:09:35 +0100
From: "Prica, Mihai" <mihai.prica@intel.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH] python-docutils: upgrade to 0.11
Thread-Index: AQHOomQBY5htvEyDk0eM2TIdhxpH/5mnhGkAgAFRbPA=
Date: Tue, 27 Aug 2013 10:09:34 +0000
Message-ID: <97BD068FB200C44AA73C2B641F162ECF2C79976A@IRSMSX101.ger.corp.intel.com>
References: <1377525287-9015-1-git-send-email-mihai.prica@intel.com>
	<20130826150018.GS3544@jama>
In-Reply-To: <20130826150018.GS3544@jama>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.181]
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH] python-docutils: upgrade to 0.11
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
X-List-Received-Date: Tue, 27 Aug 2013 10:09:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: openembedded-devel-bounces@lists.openembedded.org
>Subject: Re: [oe] [meta-oe][PATCH] python-docutils: upgrade to 0.11
>
>On Mon, Aug 26, 2013 at 04:54:47PM +0300, Mihai Prica wrote:
>> Signed-off-by: Mihai Prica <mihai.prica@intel.com>
>
>What was changed in license file?

I took a closer look at the license file changes and it seems that some
files which are licensed BSD-2-Clause and GPLv3 have been added to the
package. I will send and updated patch.=20

>
>> ---
>>  ...hon-docutils_0.5.bb =3D> python-docutils_0.11.bb} |    7 +++----
>>  1 file changed, 3 insertions(+), 4 deletions(-)  rename
>> meta-oe/recipes-devtools/python/{python-docutils_0.5.bb =3D>
>> python-docutils_0.11.bb} (55%)
>>
>> diff --git a/meta-oe/recipes-devtools/python/python-docutils_0.5.bb
>> b/meta-oe/recipes-devtools/python/python-docutils_0.11.bb
>> similarity index 55%
>> rename from meta-oe/recipes-devtools/python/python-docutils_0.5.bb
>> rename to meta-oe/recipes-devtools/python/python-docutils_0.11.bb
>> index e4c8a7d..f435e1b 100644
>> --- a/meta-oe/recipes-devtools/python/python-docutils_0.5.bb
>> +++ b/meta-oe/recipes-devtools/python/python-docutils_0.11.bb
>> @@ -2,14 +2,13 @@ DESCRIPTION =3D "Text processing system"
>>  HOMEPAGE =3D "http://docutils.sourceforge.net"
>>  SECTION =3D "devel/python"
>>  LICENSE =3D "PSF"
>> -LIC_FILES_CHKSUM =3D
>"file://COPYING.txt;md5=3Dac6ee29ac0310c091afab5ac4bea2fa3"
>> -PR =3D "r2"
>> +LIC_FILES_CHKSUM =3D
>"file://COPYING.txt;md5=3Dda0d261d1db78ab21ce86c79364a4098"
>>
>>  DEPENDS =3D "python"
>>
>>  SRC_URI =3D "${SOURCEFORGE_MIRROR}/docutils/docutils-${PV}.tar.gz"
>> -SRC_URI[md5sum] =3D "dd72dac92fc8e3eb0f48c3effeef80f6"
>> -SRC_URI[sha256sum] =3D
>"747cf984edfca0575addbb42453274a1bdd98ec7780bd37a883dc8b2a66a610e"
>> +SRC_URI[md5sum] =3D "20ac380a18b369824276864d98ec0ad6"
>> +SRC_URI[sha256sum] =3D
>"9af4166adf364447289c5c697bb83c52f1d6f57e77849abcccd6a4a18a5e7ec9"
>>
>>  S =3D "${WORKDIR}/docutils-${PV}"
>>
>> --
>> 1.7.9.5
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>--
>Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

