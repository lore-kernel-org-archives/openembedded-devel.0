Return-Path: <rcalhoun@shotspotter.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com (unknown
	[207.46.163.140])
	by mail.openembedded.org (Postfix) with ESMTP id D2D4E65F69
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 May 2014 20:31:20 +0000 (UTC)
Received: from CO1PR04MB556.namprd04.prod.outlook.com (10.141.73.23) by
	CO1PR04MB554.namprd04.prod.outlook.com (10.141.73.17) with Microsoft
	SMTP Server (TLS) id 15.0.944.11; Tue, 20 May 2014 20:15:59 +0000
Received: from CO1PR04MB556.namprd04.prod.outlook.com ([169.254.8.38]) by
	CO1PR04MB556.namprd04.prod.outlook.com ([169.254.8.38]) with mapi id
	15.00.0944.000; Tue, 20 May 2014 20:15:58 +0000
From: Robert Calhoun <rcalhoun@shotspotter.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH 0/2] gpsd: support gpsd version 3.10
Thread-Index: AQHPdGhPhLfgVKXQLU6OUdJd6WYJ4Q==
Date: Tue, 20 May 2014 20:15:57 +0000
Message-ID: <CFA13021.2834BE%rcalhoun@shotspotter.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/14.4.1.140326
x-originating-ip: [50.43.173.41]
x-forefront-prvs: 02176E2458
x-forefront-antispam-report: SFV:NSPM;
	SFS:(6009001)(428001)(377424004)(189002)(199002)(79102001)(64706001)(21056001)(74502001)(31966008)(20776003)(66066001)(80022001)(85852003)(74662001)(50986999)(54356999)(83322001)(99286001)(19580395003)(2656002)(87936001)(92566001)(77982001)(101416001)(36756003)(15975445006)(92726001)(83506001)(76482001)(81342001)(81542001)(4396001)(99396002)(86362001)(46102001)(83072002);
	DIR:OUT; SFP:; SCL:1; SRVR:CO1PR04MB554;
	H:CO1PR04MB556.namprd04.prod.outlook.com; FPR:; MLV:sfv;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (: shotspotter.com does not designate permitted sender
	hosts)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=rcalhoun@shotspotter.com; 
MIME-Version: 1.0
X-OriginatorOrg: shotspotter.com
Subject: [meta-oe][PATCH 0/2] gpsd: support gpsd version 3.10
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
X-List-Received-Date: Tue, 20 May 2014 20:31:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E531863DC41B014785840C3FCED4AD7D@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

These changes add support for gpsd version 3.10 and adds gpsctl to the
base gpsd package. gpsctl is used to set chipset settings using gpsd.
Recipe is located in meta-oe/meta-oe/recipes-navigation/gpsd.

This commit does include hand merge of
04dcd55c9d293a26a925377055660310bd229b1b
(change of $SRC_URI to "${SAVANNAH_GNU_MIRROR}/${PN}/${P}.tar.gz") but I
have
not been able to test that because poky master currently errors out for
reasons unrelated to this change.

The following changes since commit
6434d97ee958e7f597b9cf358db0275315a33c47:

 log4cplus: use better file for LIC_FILES_CHKSUM (2014-05-15 12:30:22
+0200)

are available in the git repository at:

 git://github.com/ShotSpotter/meta-oe gpsd
 https://github.com/ShotSpotter/meta-oe/tree/gpsd

Rob Calhoun (2):
 * Support gpsd version 3.10
 * Refactor recipe into version-specific file and version-independent
   include file
 * Add explicit list of supported devices/chipsets. By default gpsd
   compiles in support for all known devices. By overriding this
   list, support for unwanted devices/chipsets can be dropped.
 * Make version-specific patch directories and test 3.7 patches against
   3.10;
 * remove patch present in 3.7 recipe that disabled build of
   gpsd-doc because manfile generation now runs without error. Other
   patches appear to still be necessary
 * Fixup patch files so that they apply cleanly to gpsd 3.10 source.
 * refactor gpsd 3.7 recipe so that it refers to include file.
 * bump 3.7 $PR to r15 to show 3.7 recipe has changed substantially
 * set 3.10 $PR to r1 because this is a new version
 * fixup trailing-whitespace following warning from create-pull-request



