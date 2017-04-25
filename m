Return-Path: <heikki.sarkanen@tamtron.fi>
X-Greylist: delayed 101938 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 25 Apr 2017 21:48:16 UTC
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0111.outbound.protection.outlook.com [104.47.2.111])
	by mail.openembedded.org (Postfix) with ESMTP id B51EE77B1A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Apr 2017 21:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=TamtronGroup.onmicrosoft.com; s=selector1-tamtron-fi;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=k6ijMgzPI+L7O4TtV9bhUclujUqZlSGa19/fHEldQJo=;
	b=r4TtTFceN4G4KlDND2jI79IaISREkWwm2Wh3izOzNIMU1YVUvLrU3aK9QCXieFS9F2UpEicdOXuRxHsRzqPOdH42qVj70nuIYeNJjjnmYVUVgVIUr/0dQiEEXi3GWJHyhPFYYASNMdzJUUrs5vD5mo+tV3dN2p8rGniZ5YDOjxA=
Received: from HE1PR0301MB2201.eurprd03.prod.outlook.com (10.168.31.136) by
	HE1PR0301MB2204.eurprd03.prod.outlook.com (10.168.31.139) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1047.13; Tue, 25 Apr 2017 12:14:33 +0000
Received: from HE1PR0301MB2201.eurprd03.prod.outlook.com ([10.168.31.136]) by
	HE1PR0301MB2201.eurprd03.prod.outlook.com ([10.168.31.136]) with
	mapi id 15.01.1047.019; Tue, 25 Apr 2017 12:14:33 +0000
From: Heikki Sarkanen <heikki.sarkanen@tamtron.fi>
To: Tim Jaacks <tim.jaacks@garz-fricke.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-qt5] Qt 5.8 examples are not built
Thread-Index: AdK9o1IOXHR82hCsR7qalqtqTTLVIgAE/udR
Date: Tue, 25 Apr 2017 12:14:33 +0000
Message-ID: <HE1PR0301MB22016771E69FCA8080720EDD881E0@HE1PR0301MB2201.eurprd03.prod.outlook.com>
References: <32EA6B79577EEF4C84CB32305D45A05958E23E24@SRV24.hamburg.garz-fricke.de>
In-Reply-To: <32EA6B79577EEF4C84CB32305D45A05958E23E24@SRV24.hamburg.garz-fricke.de>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: garz-fricke.com; dkim=none (message not signed)
	header.d=none; garz-fricke.com;
	dmarc=none action=none header.from=tamtron.fi; 
x-originating-ip: [25.162.181.4]
x-microsoft-exchange-diagnostics: 1; HE1PR0301MB2204;
	7:kq0xyAnPxbVgb4xpCRuhpYdxIzWeSQpi/ZpixMWcwINlWuExD3CBGz6G7gYsuxM1rr5JTta8sZaJAppQS9b/ItiHIgy6byng0tKVFbrrvlGrpiohHlvMbPTQL61wT+as08+BM0g58rQf8oOrifSKRSF4lZLCZ3Jm1D+9ItYGfOaQVhYoEOCYUj39zIEzBjMe5wvvVDtDLwTJR8lwU+ETdcRmMdTH6J1Blx+hLAY1ADmEYZRbCVuxrxxa3obwKz/XfxRZ7xk+GlLssdE25zk2/gn3BHUDoX+IbazICQjjWBASq/YRqCECabkKf/EkfAAZRitSio0rrEE4GoenYUsDSw==
x-ms-office365-filtering-correlation-id: 7eacec70-dab2-4807-286e-08d48bd4a204
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254075)(201703131423075);
	SRVR:HE1PR0301MB2204; 
x-microsoft-antispam-prvs: <HE1PR0301MB2204E0920012A628E99587BD881E0@HE1PR0301MB2204.eurprd03.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(166708455590820)(264703809997249);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040450)(601004)(2401047)(8121501046)(5005006)(93006095)(93001095)(10201501046)(3002001)(6041248)(20161123564025)(20161123560025)(2016111802025)(20161123555025)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(6043046)(6072148);
	SRVR:HE1PR0301MB2204; BCL:0; PCL:0; RULEID:;
	SRVR:HE1PR0301MB2204; 
x-forefront-prvs: 0288CD37D9
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(39400400002)(39840400002)(39450400003)(39410400002)(33656002)(2501003)(25786009)(74482002)(6116002)(102836003)(3846002)(5660300001)(8676002)(8936002)(15974865002)(16799955002)(81166006)(53546009)(86362001)(966004)(7696004)(7736002)(50986999)(53936002)(66066001)(54356999)(229853002)(2950100002)(2900100001)(76176999)(6246003)(189998001)(6506006)(74316002)(6436002)(77096006)(3660700001)(2906002)(3280700002)(38730400002)(99286003)(122556002)(1720100001)(305945005)(9686003)(55016002)(6306002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:HE1PR0301MB2204;
	H:HE1PR0301MB2201.eurprd03.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: tamtron.fi
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2017 12:14:33.1599 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5b3efc15-2af9-4b23-b6be-9514abe422fb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0301MB2204
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
X-List-Received-Date: Tue, 25 Apr 2017 21:48:18 -0000
Content-Language: en-GB
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello Tim,

Sorry for my partially incorrect answer. Actually you cannot build those "-=
examples" recipes like "qtquickcontrols2-examples" because those are just p=
ackages [1] provided by the "qtquickcontrols2" recipe. Do you see the examp=
les packages with "bitbake -e qtquickcontrols2 | grep ^PACKAGES=3D" ? In an=
y case you should still be able to install the "-examples" packages. One mo=
re possible solution may be to properly clean your environment when upgradi=
ng from Qt 5.7 to 5.8. I think you could achieve that by creating a complet=
ely new build folder by sourcing the init script or by removing the tmp und=
er the current one.

[1] https://github.com/meta-qt5/meta-qt5/blob/9927aacfc3b341eb36764fbe7d5a9=
29d4f05f327/recipes-qt/qt5/qt5.inc#L52

BR,
Heikki Sarkanen
________________________________________
From: Tim Jaacks <tim.jaacks@garz-fricke.com>
Sent: 25 April 2017 12:23
To: Heikki Sarkanen; openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5] Qt 5.8 examples are not built

Hello Hekki,

thanks for your reply. I cannot use sub-packages as a parameter to bitbake,=
 it accepts recipe names only. Is this a new feature? I am on Yocto Jethro.

However, adding the qtbase-examples package to IMAGE_INSTALL does not make =
any difference. Maybe this works for other Qt packages (which use the qmake=
5_base_do_configure function just like before), but it doesn't work for qtb=
ase, because the qtbase-examples packages is empty. As I said, the examples=
 are not compiled at all, so they cannot be installed either.


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


> -----Urspr=FCngliche Nachricht-----
> Von: Heikki Sarkanen [mailto:heikki.sarkanen@tamtron.fi]
> Gesendet: Montag, 24. April 2017 18:55
> An: Tim Jaacks; openembedded-devel@lists.openembedded.org
> Betreff: Re: [meta-qt5] Qt 5.8 examples are not built
>
> Hi,
>
> I don't know how the PACKAGECONFIG in qtbase has worked but I have built
> Qt examples with meta-qt5 on both Qt 5.7 and 5.8 by using the "<qtrecipe>=
-
> examples" packages like in Wandboard wiki [1]. So if you want to build
> examples for qtquickcontrols2 you should build that package: "bitbake
> qtquickcontrols2-examples". If you want to include some examples to your
> image you could use 'IMAGE_INSTALL_append =3D "qtquickcontrols2-examples
> qtlocation-examples"'.
>
> [1]
> http://wiki.wandboard.org/index.php/Building_Qt5_using_yocto_on_Wand
> board
>
> BR,
> Heikki Sarkanen
>
> ________________________________________
> From: openembedded-devel-bounces@lists.openembedded.org
> <openembedded-devel-bounces@lists.openembedded.org> on behalf of
> Tim Jaacks <tim.jaacks@garz-fricke.com>
> Sent: 24 April 2017 17:21
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-qt5] Qt 5.8 examples are not built
>
> Hello,
>
> I recently updated my meta-qt5 layer to the current head version
> (https://github.com/meta-qt5/meta-
> qt5/commit/9927aacfc3b341eb36764fbe7d5a929d4f05f327) resulting in an
> upgrade to Qt 5.8. Since this upgrade, the Qt examples are not built
> anymore, even though I added them to PACKAGECONFIG of qtbase. Is this a
> known issue?
>
> In Qt 5.7 the examples were built correctly. As far as I understand, the =
line
> that used to make this work in versions before Qt 5.8 is in meta-qt5/reci=
pes-
> qt/qt5/qt5.inc:
>
> | EXTRA_QMAKEVARS_PRE +=3D "${@bb.utils.contains('PACKAGECONFIG',
> 'examples', 'QT_BUILD_PARTS+=3Dexamples', '', d)}"
>
> The qmake5_base_do_configure function in meta-
> qt5/classes/qmake5_base.bbclass evaluates this variable:
>
> | if [ ! -z "${EXTRA_QMAKEVARS_PRE}" ]; then
> |     QMAKE_VARSUBST_PRE=3D"${EXTRA_QMAKEVARS_PRE}"
> |     bbnote "qmake prevar substitution: '${EXTRA_QMAKEVARS_PRE}'"
> | fi
>
> This leads to the following note in log.do_configure of qtbase:
>
> | NOTE: qmake prevar substitution: ' QT_BUILD_PARTS+=3Dexamples'
>
> However, this note is missing in Qt 5.8 because the call to
> qmake5_base_do_configure has been removed from the do_configure task
> of qtbase here:
>
> https://github.com/meta-qt5/meta-
> qt5/commit/333949a8239dfa7788b35f1059614733e11a6a25#diff-
> 1120c73503f9288cc8a8c2b984fe4038L202
>
> There is no comment on why this has been removed. I tried re-adding it,
> which resulted in a duplicate configure run. Obviously this is caused by =
this
> change in qtbase:
>
> https://code.qt.io/cgit/qt/qtbase.git/commit/mkspecs/features/qt_parts.pr
> f?id=3D60e5a1c8effd4099f7b1414107b5cbb67c266210
>
> Does anybody know whether this change was the reason for removing the
> qmake5_base_do_configure call?
>
> However, the removal breaks the mechanism via EXTRA_QMAKEVARS_PRE,
> because this variable is no longer evaluated. As far as I can see, there =
is no
> option of building the Qt examples at the moment. Or am I missing anythin=
g?
> Any clue would be helpful.
>
>
> Mit freundlichen Gr=FC=DFen / Best regards
> i.A. Tim Jaacks
>
> Software Engineering
> Garz & Fricke GmbH
> Tempowerkring 2, 21079 Hamburg - Germany Amtsgericht Hamburg HRB
> 60514
> Gesch=E4ftsf=FChrer: Manfred Garz, Matthias Fricke
> Phone: +49 40 791899 - 55
> Fax:     +49 40 791899 - 39
> tim.jaacks@garz-fricke.com
> www.garz-fricke.com
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

