Return-Path: <alexander.andrell@alps.se>
X-Greylist: delayed 942 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 11 Dec 2014 20:50:29 UTC
Received: from APAC01-SG1-obe.outbound.protection.outlook.com
	(mail-sg1on0054.outbound.protection.outlook.com [134.170.132.54])
	by mail.openembedded.org (Postfix) with ESMTP id 47D2E723FE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Dec 2014 20:50:29 +0000 (UTC)
Received: from HKXPR04MB0455.apcprd04.prod.outlook.com (25.160.178.155) by
	HKXPR04MB0453.apcprd04.prod.outlook.com (25.160.178.153) with Microsoft
	SMTP Server (TLS) id 15.1.31.17; Thu, 11 Dec 2014 20:34:44 +0000
Received: from HKXPR04MB0455.apcprd04.prod.outlook.com ([25.160.178.155]) by
	HKXPR04MB0455.apcprd04.prod.outlook.com ([25.160.178.155]) with mapi id
	15.01.0036.010; Thu, 11 Dec 2014 20:34:44 +0000
From: Alexander Andrell <alexander.andrell@alps.se>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe][meta-qt5] How to include the geoservice plugins in the image
Thread-Index: AdAVcu/wbkGFNXbBS9Ol1nTM4tDxlg==
Date: Thu, 11 Dec 2014 20:34:43 +0000
Message-ID: <HKXPR04MB045547E4962D46D457489973F2630@HKXPR04MB0455.apcprd04.prod.outlook.com>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [195.198.76.254]
x-microsoft-antispam: BCL:0;PCL:0;RULEID:;SRVR:HKXPR04MB0453;
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:;SRVR:HKXPR04MB0453;
x-forefront-prvs: 0422860ED4
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(199003)(501624003)(189002)(86362001)(107046002)(107886001)(2351001)(229853001)(54606007)(77156002)(66066001)(20776003)(76576001)(64706001)(16236675004)(54356999)(19300405004)(31966008)(62966003)(74482002)(46102003)(450100001)(50986999)(92566001)(120916001)(105586002)(106356001)(40100003)(122556002)(19580395003)(99396003)(97736003)(21056001)(68736005)(87936001)(101416001)(19625215002)(110136001)(33656002)(74316001)(54206007)(4396001)(2656002)(15975445007)(102836002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:HKXPR04MB0453;
	H:HKXPR04MB0455.apcprd04.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; PTR:InfoNoRecords; A:1; MX:3; LANG:en; 
MIME-Version: 1.0
X-OriginatorOrg: alps.se
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-qt5] How to include the geoservice plugins in the image
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
X-List-Received-Date: Thu, 11 Dec 2014 20:50:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,

I would very much appreciate if anyone could help me. I've spent some days =
now trying to get the qt5 geoservice plugins to be baked into an image for =
a Nitrogen6X (imx6) board following various guides, e.g. https://community.=
freescale.com/docs/DOC-99366 and https://community.freescale.com/docs/DOC-9=
4849. I've made some adjustments to the local.conf, specifically added the =
following lines to IMAGE_INSTALL_append:
qtlocation \
qtlocation-plugins \
qtlocation-qmlplugins \
qtlocation-examples \

One would think that the geoservices plugins would be included, sine the ge=
oservices plugins are located under qtlocation (https://qt.gitorious.org/qt=
/qtlocation - src/plugins/geoservices). Especially since the "-plugins" tag=
 is specified, but nope. (Sorry for my limited knowledge, I might be comple=
tely out of line here). No geoservices folder in /usr/lib/qt5/plugins in th=
e baked image. However there is a folder "position" under /usr/lib/qt5/plug=
ins, containing "libposition_positionpoll.so", which is a plugin(?).
I've used the dora branch, switched to dizzy (clean start/new HDD). Perform=
ed repro sync today (11 dec 2014), on the dizzy branch. The meta-qt5 layer =
just got updated too to qt 5.4, which is nice. Then bitbake core-image-base=
. But still no geoservices plugins.
Qt5 is working, I have successfully set up the tool chain and can cross com=
pile and deploy from a Ububtu (64-bit) PC via SSH.
However when running a simple Qt QML application with just a basic map elem=
ent and nokia or osm geoservice plugin the application spits out that no su=
itable plugin can be found. I can run the simple application on the host wh=
en using the RC1 of Qt5.4 since the geoservices plugins seems to be deliver=
ed with the RC1.

I would like to avoid compiling the geoservices plugins by hand and manuall=
y putting them on the device each time I build an image for various reasons=
.
So my question is if anyone knows if there is some way to get the geoservic=
es plugins to be bitbaked in the image? Have anyone successfully bitbaked a=
n image with the qt5 geoservices plugins?

Best regards
Alexander Andr=E9ll
Trade register: HRB 14717, Amtsgericht Duesseldorf Directors: Wilfried Baum=
ann, Takashi Kimoto, Nobuto Okawa, Shuji Takamura VAT numbers: FR0034833805=
4, DE119261426, IE9513462E, NL805332182B01, CZ681776741, GB674296401, SE516=
404971901 Imprint also available on our website: http://www.alps-europe.com=
/imprint/ This electronic message contains information which may be confide=
ntial. The information is intended to be for the use of the individual/s or=
 entity named above. If you are not the intended recipient, be aware that a=
ny disclosure, copying, distribution or use of the contents of this mail is=
 prohibited. Please delete this e-mail if you have received this electronic=
 message in error and kindly notify us by telephone or e-mail immediately (=
contact details are listed above).

