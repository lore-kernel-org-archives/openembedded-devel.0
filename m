Return-Path: <heikki.sarkanen@tamtron.fi>
X-Greylist: delayed 43131 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 25 Apr 2017 11:26:12 UTC
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
	(mail-eopbgr50115.outbound.protection.outlook.com [40.107.5.115])
	by mail.openembedded.org (Postfix) with ESMTP id 9952E6E630
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Apr 2017 11:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=TamtronGroup.onmicrosoft.com; s=selector1-tamtron-fi;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=HtlNIqlmDT1KxgXDHgVVwFZfoQUoKQkqbUJSVfrqnQ4=;
	b=d2RugN58boukod3u0AxF1ajYl01+dT9xFQn88KzEZJN7OcNwWUkI7NnhrAlRHVfIdJw+QGH+5d5s3chnSHxUVkgu0TBatHR1IrlFJsDgLI3H9I08G/G4p8RCv/ekHgcSviawxXejx5UgTBTrhkpWkMka/UjqKPiRn7NwN5U/8Ic=
Received: from HE1PR0301MB2201.eurprd03.prod.outlook.com (10.168.31.136) by
	HE1PR0301MB2201.eurprd03.prod.outlook.com (10.168.31.136) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1047.13; Mon, 24 Apr 2017 16:54:45 +0000
Received: from HE1PR0301MB2201.eurprd03.prod.outlook.com ([10.168.31.136]) by
	HE1PR0301MB2201.eurprd03.prod.outlook.com ([10.168.31.136]) with
	mapi id 15.01.1047.019; Mon, 24 Apr 2017 16:54:45 +0000
From: Heikki Sarkanen <heikki.sarkanen@tamtron.fi>
To: Tim Jaacks <tim.jaacks@garz-fricke.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-qt5] Qt 5.8 examples are not built
Thread-Index: AdK9BboCXHR82hCsR7qalqtqTTLVIgAExs53
Date: Mon, 24 Apr 2017 16:54:44 +0000
Message-ID: <HE1PR0301MB22018DA3B0F9114052C339B5881F0@HE1PR0301MB2201.eurprd03.prod.outlook.com>
References: <32EA6B79577EEF4C84CB32305D45A05958E22AEA@SRV24.hamburg.garz-fricke.de>
In-Reply-To: <32EA6B79577EEF4C84CB32305D45A05958E22AEA@SRV24.hamburg.garz-fricke.de>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: garz-fricke.com; dkim=none (message not signed)
	header.d=none; garz-fricke.com;
	dmarc=none action=none header.from=tamtron.fi; 
x-originating-ip: [25.162.181.4]
x-microsoft-exchange-diagnostics: 1; HE1PR0301MB2201;
	7:ubNUei4ERCT0l1gb0Xxv3oZdx+Rj0wjYL8aGbLpwwcFQJxB7oazwAh9dq9cLIIce7MnGlNFwAmIFJH5A8Kz3QVVDkoASqlYu2aHMTWg+zmrs/IA0xXzWMqh+xYNYXgosgG58lEaHG5J5mIj8IcrJCGPlvOQP84Eczham8EX0vayMDNhLR4/1b56jmwKPG1pxe9+5wFviga7Wy/L+Jr6zHfKZ+N/8/pjcS/c8r9iuOPhiE98K6jfesqUgpWK0MTPvHfpufhwEq5d5o7tMgIbESzi/XufrcK4Ux/qMtbJkMtK61Wbzr/oP7rsw36yhJ5karH2XpmMaBou8mrKEAdrJlQ==
x-ms-office365-filtering-correlation-id: 9c43dc5b-1efa-41e9-6885-08d48b329c4d
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254075)(201703131423075);
	SRVR:HE1PR0301MB2201; 
x-microsoft-antispam-prvs: <HE1PR0301MB22012E6A41DA805FC51791AA881F0@HE1PR0301MB2201.eurprd03.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(166708455590820)(264703809997249);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040450)(601004)(2401047)(8121501046)(5005006)(3002001)(93006095)(93001095)(10201501046)(6041248)(201703131423075)(201702281528075)(201703061421075)(2016111802025)(20161123564025)(20161123560025)(20161123555025)(20161123562025)(6043046)(6072148);
	SRVR:HE1PR0301MB2201; BCL:0; PCL:0; RULEID:;
	SRVR:HE1PR0301MB2201; 
x-forefront-prvs: 0287BBA78D
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(39400400002)(39410400002)(39840400002)(39450400003)(2900100001)(6506006)(7696004)(2950100002)(74316002)(74482002)(1720100001)(305945005)(7736002)(15974865002)(81166006)(5660300001)(8676002)(55016002)(8936002)(99286003)(53546009)(9686003)(6306002)(77096006)(86362001)(25786009)(122556002)(53936002)(2501003)(6436002)(2906002)(189998001)(229853002)(16799955002)(33656002)(6246003)(102836003)(6116002)(66066001)(3280700002)(3660700001)(76176999)(54356999)(38730400002)(50986999)(3846002)(966004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:HE1PR0301MB2201;
	H:HE1PR0301MB2201.eurprd03.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: tamtron.fi
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2017 16:54:44.9624 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5b3efc15-2af9-4b23-b6be-9514abe422fb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0301MB2201
Subject: Re: [meta-qt5] Qt 5.8 examples are not built
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
X-List-Received-Date: Tue, 25 Apr 2017 11:26:14 -0000
Content-Language: en-GB
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

I don't know how the PACKAGECONFIG in qtbase has worked but I have built Qt=
 examples with meta-qt5 on both Qt 5.7 and 5.8 by using the "<qtrecipe>-exa=
mples" packages like in Wandboard wiki [1]. So if you want to build example=
s for qtquickcontrols2 you should build that package: "bitbake qtquickcontr=
ols2-examples". If you want to include some examples to your image you coul=
d use 'IMAGE_INSTALL_append =3D "qtquickcontrols2-examples qtlocation-examp=
les"'.

[1] http://wiki.wandboard.org/index.php/Building_Qt5_using_yocto_on_Wandboa=
rd

BR,
Heikki Sarkanen

________________________________________
From: openembedded-devel-bounces@lists.openembedded.org <openembedded-devel=
-bounces@lists.openembedded.org> on behalf of Tim Jaacks <tim.jaacks@garz-f=
ricke.com>
Sent: 24 April 2017 17:21
To: openembedded-devel@lists.openembedded.org
Subject: [oe] [meta-qt5] Qt 5.8 examples are not built

Hello,

I recently updated my meta-qt5 layer to the current head version (https://g=
ithub.com/meta-qt5/meta-qt5/commit/9927aacfc3b341eb36764fbe7d5a929d4f05f327=
) resulting in an upgrade to Qt 5.8. Since this upgrade, the Qt examples ar=
e not built anymore, even though I added them to PACKAGECONFIG of qtbase. I=
s this a known issue?

In Qt 5.7 the examples were built correctly. As far as I understand, the li=
ne that used to make this work in versions before Qt 5.8 is in meta-qt5/rec=
ipes-qt/qt5/qt5.inc:

| EXTRA_QMAKEVARS_PRE +=3D "${@bb.utils.contains('PACKAGECONFIG', 'examples=
', 'QT_BUILD_PARTS+=3Dexamples', '', d)}"

The qmake5_base_do_configure function in meta-qt5/classes/qmake5_base.bbcla=
ss evaluates this variable:

| if [ ! -z "${EXTRA_QMAKEVARS_PRE}" ]; then
|     QMAKE_VARSUBST_PRE=3D"${EXTRA_QMAKEVARS_PRE}"
|     bbnote "qmake prevar substitution: '${EXTRA_QMAKEVARS_PRE}'"
| fi

This leads to the following note in log.do_configure of qtbase:

| NOTE: qmake prevar substitution: ' QT_BUILD_PARTS+=3Dexamples'

However, this note is missing in Qt 5.8 because the call to qmake5_base_do_=
configure has been removed from the do_configure task of qtbase here:

https://github.com/meta-qt5/meta-qt5/commit/333949a8239dfa7788b35f105961473=
3e11a6a25#diff-1120c73503f9288cc8a8c2b984fe4038L202

There is no comment on why this has been removed. I tried re-adding it, whi=
ch resulted in a duplicate configure run. Obviously this is caused by this =
change in qtbase:

https://code.qt.io/cgit/qt/qtbase.git/commit/mkspecs/features/qt_parts.prf?=
id=3D60e5a1c8effd4099f7b1414107b5cbb67c266210

Does anybody know whether this change was the reason for removing the qmake=
5_base_do_configure call?

However, the removal breaks the mechanism via EXTRA_QMAKEVARS_PRE, because =
this variable is no longer evaluated. As far as I can see, there is no opti=
on of building the Qt examples at the moment. Or am I missing anything? Any=
 clue would be helpful.


Mit freundlichen Gr=FC=DFen / Best regards
i.A. Tim Jaacks

Software Engineering
Garz & Fricke GmbH
Tempowerkring 2, 21079 Hamburg - Germany
Amtsgericht Hamburg HRB 60514
Gesch=E4ftsf=FChrer: Manfred Garz, Matthias Fricke
Phone: +49 40 791899 - 55
Fax:     +49 40 791899 - 39
tim.jaacks@garz-fricke.com
www.garz-fricke.com


--
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel

