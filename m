Return-Path: <samuli.piippo@theqtcompany.com>
X-Greylist: delayed 924 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 24 Aug 2015 09:29:15 UTC
Received: from emea01-am1-obe.outbound.protection.outlook.com
	(mail-am1on0103.outbound.protection.outlook.com [157.56.112.103])
	by mail.openembedded.org (Postfix) with ESMTP id E297A6AC1E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 09:29:15 +0000 (UTC)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=samuli.piippo@theqtcompany.com; 
Received: from piippo.it.local (91.217.248.11) by
	HE1PR02MB1180.eurprd02.prod.outlook.com (10.163.173.150) with Microsoft
	SMTP Server (TLS) id 15.1.243.23; Mon, 24 Aug 2015 09:13:39 +0000
From: Samuli Piippo <samuli.piippo@theqtcompany.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 24 Aug 2015 12:13:19 +0300
Message-ID: <cover.1440407387.git.samuli.piippo@theqtcompany.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [91.217.248.11]
X-ClientProxiedBy: HE1PR02CA0071.eurprd02.prod.outlook.com (25.163.170.39) To
	HE1PR02MB1180.eurprd02.prod.outlook.com (25.163.173.150)
X-Microsoft-Exchange-Diagnostics: 1; HE1PR02MB1180;
	2:WfOlzfu3FYTEtpWLdHkhVaoSsGGkBWMGs6vrTGxOQFsH3h34hpKrvKyuP1xc9W1xfRkULCQQf1v0U5jNcCvJfGrQ+0dwEAKeHqgZyrJJINTEHsqwxNwNBSqmAuQYpL6LJT5VN50fB1BbSJCrmJdQ0xtHnki4bt4/R33O236Ig1k=;
	3:Usp6THP1c8v7Lo0FvhWziBYXqwq8yKuid461vUBC5nyoHVCrZp2s+OgipHySvgLbjJqiejrh43M5n2t3BEWgDh1bIVW3SrkuDT3yG8igz8+wo2T3dnDdv0BLuBW+YY+cQjFY48TI8sxqtJj7Is5fiw==;
	25:oF8Zy52uWxiXgsb9/HLI6Q+vYe3JNmdO3m//AoMVHTgxpkCgZqXcOnQddOtQKpL6hDfTk7S3eBYPL1pJ7TymuQI0V3hdx7oCgk4KVWePOEy+wOGZS1r6VYQfke31/L+jZD3ltodWw1a+bUhD1R2WLfbv59Cv44hTZpwPu+yn48XRgmJCY1Z/qLhS+lpGTnr13zT43Rb6YeslHzuf1bhOH5VMzwS0XJzGuSBhzuqT8l8wznSHnzOpWyk0KTdrG2quDqsX02M5KLhhSNUo565OFA==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:HE1PR02MB1180;
X-Microsoft-Exchange-Diagnostics: 1; HE1PR02MB1180;
	20:1g+zE5RclgHQgJj/pnry6K+b9OWk/6Bh/w4S5KMGZ+IDcJrJoqRgxFzyEdHte4/8pIkua/bNxmBT7COCU4EhB+3IyYztj/RwPuvcoSwpqn2jDMUhsl0fGvRhyuWfZaDdI+58zgW2ZpwpX2j/ALFHP1k/d1UpkljZcy3hT7SW3lZi6txsL3M40mGQ/cgALvNWZx2ZPAUPaujx0lbi+JbMtLBiI/RzV7SgJimrQf6hK7LpgcUnSLmkgQ2DXp0eeGnixifndYKIJDVgmncYpS0OuuF5UucyE2+3M9lo6QmCsKwCqHasX712W7DGJSJdj6STGnweUYlcWnSLgMvwjJVOSm/y0Q4YvptZ+6kHaLBHZSGUZMNMtnw47P0E+EbWbsiIHKWoXc8noYYstaegzC7gYAs9wOIEdlsPAQhqTcZ7HXulTYB1rB15/XteBjrU2JM7PBHp/cfNt0yIpn7OSzS2PIheVKobxAhb1hy8Zmqt4mx3Dubf9fCoqxs/0d/wjtTh;
	4:gCQIpUgD+B6WgcQdyUFWyhClRls86ArpKbKVuScMS2cJYV0zZY48pHSBE7pV7N4jyGu24xn/Hv/cxM/mZj3KVXjUdN9r6xbBgcsTvbM23qyUURgyWL9zqvN+gk7ncSN6HczNx1ucC9X5Drz8Bts+Apui8uCrbmCMgoKLHvoAhdGO0rfmAZhV6JExJQL+F8b8PdCsCfyhWPJLHdiAqvT+rLZ0mLPJwcsNio9VFKZLCP4RYbrY5oKodsnesF6Pd+4/4AGCRSNZF4amTYTeIyo8YKo6a6zYSeVlS9FzRGcrv9VNJx//mQA1G6/dCiKxK+vN
X-Microsoft-Antispam-PRVS: <HE1PR02MB1180C76394BE7B604128868C90620@HE1PR02MB1180.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(8121501046)(3002001);
	SRVR:HE1PR02MB1180; BCL:0; PCL:0; RULEID:; SRVR:HE1PR02MB1180; 
X-Forefront-PRVS: 06780E24F8
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(377424004)(199003)(189002)(92566002)(5001860100001)(97736004)(36756003)(68736005)(81156007)(189998001)(66066001)(50466002)(64706001)(107886002)(110136002)(50226001)(122386002)(47776003)(5001830100001)(48376002)(5001960100002)(19580395003)(450100001)(42186005)(86362001)(4001540100001)(105586002)(15975445007)(101416001)(62966003)(77096005)(33646002)(40100003)(87976001)(5007970100001)(50986999)(229853001)(46102003)(2351001)(5003940100001)(77156002)(106356001)(5004730100002)(7099028)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:HE1PR02MB1180; H:piippo.it.local;
	FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: theqtcompany.com does not
	designate permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; HE1PR02MB1180;
	23:Mqi1uumswKsi8Z0r7uuLq7yWw0vVau4/nV0W9uh43?=
	=?us-ascii?Q?Ya0deEpTWeE2Rc71ja7X4gresnShU8w8vs3Yz2002RAkMnsiF7VQIfde8JaI?=
	=?us-ascii?Q?KDlzaXm9NW6NpwRYjZFA3ImuxNAxFIdgvmAerxFg4wrP+D0u/Wq6mEiBp6VB?=
	=?us-ascii?Q?6VNEz/77PaDnbotlZdNW4oBoQtq2EP2UY9LGewGbAdasF3Keq6DeKP8EGXFd?=
	=?us-ascii?Q?qvGLLLrxhn3+qAUeWjcxVtAhkWvWJCSCFYTCpLZ3bvrx9se2hKZ5X9fRvNmb?=
	=?us-ascii?Q?Wzu6JGlCrfibNqlMdNjChKqHXxk3Oa2kZuAwsxjKcfm5ZALUdXD+kNdeTAAO?=
	=?us-ascii?Q?HEMdo3rPBTKaxRAQBRIHBu6FDWFiAtIv+6GzWOGyHe6GcpaTr8hmLCS0zoBw?=
	=?us-ascii?Q?eyDUE3gNhBAqNRKakKBCSxnqX4+fUQ87s2bstNE1ZswrHYva+W+cEVZjqgBQ?=
	=?us-ascii?Q?JK1gjuMJW2JCBr65tBwGtTcT9UhXoqlLkfoyw01lq0907APvu4FTet2BN13u?=
	=?us-ascii?Q?RYEkxTJIEkBo0xs09qOfMDeXuoNeIaUd5YKTptj28ROBQzXjC4bADTkftO5A?=
	=?us-ascii?Q?2ddqO9KvTiqlTgA2ekYSnElRw+ay1OOBSA/MvOtMcUjxwm3yqm/btlzD9g1g?=
	=?us-ascii?Q?4b27GjmOWwfQKR3yKAgXZUUt8c02O7d57vSIXfTdlIEF2TfPYy+gM3/jhbpG?=
	=?us-ascii?Q?QuXhgNYNVwPGki/bZhe+vuJvUoCwShZ7mqfBpjwX18yx2XxKFbOlX5ka+1Dc?=
	=?us-ascii?Q?BSUcGLDhK4aaOur1UuizozzDDVg3KengA3Z6PnrNf3+/ahJ+M2sYDG5Rn/zG?=
	=?us-ascii?Q?8qx/bWJZ9XSnNVQ+U2ogeDDX51krU0X0ZZP2NpPhxSGGbEPNYa6uW7YNijSX?=
	=?us-ascii?Q?XX4usW+FpTR/wt4scurl8CS3jHFoCTBUaXPZXS/qW3v7q9fyu1Hzhh+b3fBA?=
	=?us-ascii?Q?PD/ykcFBXx9wmCoSs8AJ2hq7o9kkZG0WuF06eadQZnO20SVlMh7Js4iijHTm?=
	=?us-ascii?Q?sy3pY7V7wIpapJ6QxDmqAdLfRypXEkqYnEgWsn4JuKcThHrSZiV1mzpiGST/?=
	=?us-ascii?Q?smDgEYD0z5hI9B3zFk3XU9SUmwOAfOj6sLEuDfW0fnxjxjommZP92cYOHpNq?=
	=?us-ascii?Q?QpjzfCM4FUYDgE7cghmj+pkwKd8HX5XviCniExGgKf6IHPP2UMl4u7ow+kgA?=
	=?us-ascii?Q?HKJVQwquha5jrwCNwCUnXidUzPFY9fHUwzY9epRkthKHiEZBoaORxcYbvpkD?=
	=?us-ascii?Q?V98hZT0m1CYMk2FNEI=3D?=
X-Microsoft-Exchange-Diagnostics: 1; HE1PR02MB1180;
	5:k0cZbV+6FKM+pBPjPrhoxfOrtG9tCEgp/kym/IAJSaDzntrPJpP4aeT0ho7eBPOSP+Zkpv0NnXBLQR2sHGuCRww8Lnrbm7HShl/KiiA8HNXYFK7Sb9nM38enF+PHs2TCuRdzj7FYxdrvBrCNiGDomw==;
	24:ZQCr3P8fxxhojOXHDMsJducU6kvLX3SVHiyKnwjK988hJPkilEuZJfdgo/Bz+S0F42ildgpRGJLomNVY3UWFAM+EHDOPBppMfX7cmqH6qWg=;
	20:SUv931PweFc6masm6cOXdk4ul0KUv3Zbur/3/6hW9rLIE9IWG31pZaBpk5rlawZdhD/aSYeLo2btIAX0WRs+Yg==
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: theqtcompany.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2015 09:13:39.2250 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR02MB1180
Subject: [meta-qt5][PATCH 00/11] upstreaming Qt for Device Creation changes
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
X-List-Received-Date: Mon, 24 Aug 2015 09:29:17 -0000
Content-Type: text/plain

As part of Qt for Device Creation [1], we are starting to use meta-qt5 layer
when creating images for our supported devices. We have done number of changes
to the layer when intergrating it with our internal layer. We would now like
to upstream those changes.

[1] https://www.qt.io/qt-for-device-creation

The following changes since commit d2c05c81e8230358dca80cf9df67e49f9f672a29:

  libconnman-qt5: update to 1.0.91 (2015-07-31 16:23:35 +0200)

are available in the git repository at:

  git://github.com/sapiippo/meta-qt5 master
  https://github.com/sapiippo/meta-qt5/tree/master

Samuli Piippo (11):
  qt5: make populate_sdk_qt5 reusable
  qt5: improve Qt module package handling
  qt5: improve support for native and nativesdk modules
  qt5: add host paths to qt.conf
  qt5: disable debian auto renaming
  qt5: make qt5.inc reusable qt5-module.bbclass
  qttools: use one recipe for all compilations
  qtbase: remove dependency to sqlite
  qtbase: PACKAGECONFIGs for libproxy and libinput
  qtlocation: use correct dependencies
  qtwebengine: fix problem with recursive qmake call

 classes/populate_sdk_qt5.bbclass                   | 11 +---
 classes/qmake5.bbclass                             |  8 +++
 classes/qmake5_base.bbclass                        | 11 ++++
 .../qt5/qt5.inc => classes/qt5-module.bbclass      | 38 +++++++++++-
 recipes-qt/examples/cinematicexperience_1.0.bb     |  2 +-
 recipes-qt/examples/qt5everywheredemo_1.0.bb       |  2 +-
 recipes-qt/examples/qt5nmapcarousedemo_1.0.bb      |  2 +-
 recipes-qt/examples/qt5nmapper_1.0.bb              |  2 +-
 recipes-qt/examples/qtsmarthome_1.0.bb             |  2 +-
 recipes-qt/examples/quitbattery_1.0.0.bb           |  2 +-
 recipes-qt/examples/quitindicators_1.0.1.bb        |  2 +-
 recipes-qt/libconnman-qt/libconnman-qt5_git.bb     |  2 +-
 recipes-qt/meta/meta-toolchain-qt5.bb              |  4 ++
 recipes-qt/qt5/nativesdk-qttools_git.bb            | 45 --------------
 recipes-qt/qt5/qt3d_git.bb                         |  2 +-
 recipes-qt/qt5/qtbase_git.bb                       |  6 +-
 recipes-qt/qt5/qtconnectivity_git.bb               |  2 +-
 recipes-qt/qt5/qtdeclarative_git.bb                |  4 +-
 recipes-qt/qt5/qtenginio_git.bb                    |  2 +-
 recipes-qt/qt5/qtgraphicaleffects_git.bb           |  2 +-
 recipes-qt/qt5/qtimageformats_git.bb               |  2 +-
 recipes-qt/qt5/qtlocation_git.bb                   |  5 +-
 recipes-qt/qt5/qtmultimedia_git.bb                 |  2 +-
 recipes-qt/qt5/qtquick1_git.bb                     |  2 +-
 recipes-qt/qt5/qtquickcontrols_git.bb              |  2 +-
 recipes-qt/qt5/qtscript_git.bb                     |  2 +-
 recipes-qt/qt5/qtsensors_git.bb                    |  2 +-
 recipes-qt/qt5/qtserialport_git.bb                 |  2 +-
 recipes-qt/qt5/qtsvg_git.bb                        |  2 +-
 recipes-qt/qt5/qtsystems_git.bb                    |  2 +-
 recipes-qt/qt5/qttools-native_git.bb               | 26 --------
 recipes-qt/qt5/qttools_git.bb                      | 11 +++-
 recipes-qt/qt5/qttranslations_git.bb               |  2 +-
 recipes-qt/qt5/qtwayland_git.bb                    |  2 +-
 recipes-qt/qt5/qtwebchannel_git.bb                 |  2 +-
 .../0005-Generate-usable-qmake_extras.gypi.patch   | 71 ++++++++++++++++++++++
 recipes-qt/qt5/qtwebengine_git.bb                  |  3 +-
 recipes-qt/qt5/qtwebkit-examples_git.bb            |  2 +-
 recipes-qt/qt5/qtwebkit_git.bb                     |  2 +-
 recipes-qt/qt5/qtwebsockets_git.bb                 |  2 +-
 recipes-qt/qt5/qtx11extras_git.bb                  |  2 +-
 recipes-qt/qt5/qtxmlpatterns_git.bb                |  4 +-
 42 files changed, 183 insertions(+), 120 deletions(-)
 rename recipes-qt/qt5/qt5.inc => classes/qt5-module.bbclass (86%)
 delete mode 100644 recipes-qt/qt5/nativesdk-qttools_git.bb
 delete mode 100644 recipes-qt/qt5/qttools-native_git.bb
 create mode 100644 recipes-qt/qt5/qtwebengine/0005-Generate-usable-qmake_extras.gypi.patch

-- 
1.9.1


