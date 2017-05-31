Return-Path: <samuli.piippo@qt.io>
X-Greylist: delayed 35963 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 31 May 2017 17:14:36 UTC
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0109.outbound.protection.outlook.com [104.47.2.109])
	by mail.openembedded.org (Postfix) with ESMTP id 41A9E6FF69
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 May 2017 17:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=qtcompany.onmicrosoft.com; s=selector1-qt-io;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=ISKptXJFzDqIGNp4V8ThEzpKphR3E+c3+MzJg5CKf5g=;
	b=ouhzIwiLE5CdSfwMHVAFWyohuC71heJdekFXndYs/JpyDx9aBKrNuG4NpPzvERJlZidgfwI7Xswy8KStBwXrd+Bxyo69XTKqEAEUMsmBW8ItbxqvPva9JW/kQEwotUGIfW3LOzPB1nJx04pdMInefo1V3qId6+cvc6iV9hQCcIE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=qt.io;
Received: from piippo.intra.qt (192.89.120.53) by
	DB6PR0202MB2582.eurprd02.prod.outlook.com (2603:10a6:4:1b::16) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1124.9;
	Wed, 31 May 2017 06:41:05 +0000
From: Samuli Piippo <samuli.piippo@qt.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 31 May 2017 09:40:46 +0300
Message-Id: <1496212846-21304-1-git-send-email-samuli.piippo@qt.io>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [192.89.120.53]
X-ClientProxiedBy: VI1PR0501CA0004.eurprd05.prod.outlook.com
	(2603:10a6:800:92::14) To DB6PR0202MB2582.eurprd02.prod.outlook.com
	(2603:10a6:4:1b::16)
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB6PR0202MB2582:
X-MS-Office365-Filtering-Correlation-Id: 966bc2b0-88f4-48a6-87c4-08d4a7f00376
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131423075)(201703031133081);
	SRVR:DB6PR0202MB2582; 
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0202MB2582;
	3:TZ35kx1t0eFUg6ihvcASfe/MFL1mQQ/2Ok6pclmE3B0HgtOOw/l1WUHavCRB1sq4ZZTJ46kzdL3CkYGggGo9aN12zMmGZvdjeBlwaGvd5IrcQVGRwCFbfE1AQnoJZgdLiAwlqXjp0A3/nFpVmbQiJJcJqOWJMvcqceRtTAPhKgDBAdKwHJJrMowQ2m+NJyz/+C0ew+Kkda1F5f4TprdWDCPexpdDMPEMFxaPZDgvdThCHTHfguXtZzKi+J2F6SQvUq613N/l4KHuEkDr+rr9fQH1EtdQTGEpT3Ku2RMjAPoJ47VSBHu6Dpv+1GBnXG92rq+X6siGJoll61Jw7uZKAQ==;
	25:FyRgpwbPGsBoMmB8A198A2itwk3JPj5PTZDiMDw5rHnHetIMzQ/sewafNiSAixNiTd500+SAe6r2iWTbHPI20IiHecIedzR+9zK64mMDex1XEi7dGoGv3tW5A427w+Ox+GEO82uWLL8f9SFBVogvCIDw9bAnn+TBdyS4UqULOZpbyg2W9c0damn+GrhFfd0hEl6zMcL5DyK+v8B9guxUVhb95S8073PBFZhLb2AINig78tao0q3fTvTZh1v1+fbAu0o0Qq3iTeeia/a/me+aBLhJdpl84jJgHmO2ClU1Ha+xurq8yBUTDk10KX/4psPRp/ueKiHHIAJ5bQ5H0ll8rrnPj5WSMjqP1yCrt6vxSUxScpiHOcYkJ/syv1acu4G3JBr6DPyacYwAw/IFCf1W63s48GxBQM7G9uIv+bNryp7yMCCVIgnvq7vmufyJqt5pn3ro0KiJvdWDM5IzW7NQXd4M6S+u63kDKrXm7ILwrcw=
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0202MB2582;
	31:jNujLJJUTmcCilhIElx0DyrYJkHs3XvVM1B/oqgRTKdZcEaZvygW+pNb9itqOPlLGeqiV4Zb9OC1/4CdYIc14WUVwiKAnCQGUE1svDfn5U0oLzbldesjV7pNPwYRvBFD3rtUqBIzewCBx9baI2fQM5Qk/4IC858YmH9q1zxM6zrQ7vwrhT7IRM7nNZV8JbAhubTYqUk7SwJNeJ0o5dkWXgmd5zOg/Gb6pd+g/8uncsJKjIFWqDjSy9Rm2bIDFjdz;
	20:fueWkFDq3fgXEnW62BUth/+NC2Xq6aDEk9Rw/SE3pxbxvuMWacucH+tOTvK8jzy9SYCFvjPucneovLLsMX9BhJ3X4hKIzDquGyqtX+vzJzTvQy35P/Ex+Fo/YOabkWio5BUj8AITOr7atjxVyZ/oxgNXECaO0R7ZqQW9wuXP4WlYL2Now5jUJtAEo7jSq6MIzqgP+OHaQwRUYFRdpaQg8J8MEfL74hZz49sDfdBju96G2qjBSiPf7qIGIE6AJDr7vmCpgbjElHZTKZ+RQtBoUj0RsUF5clj6bUzHJn5vzud0lSxQ7L+JbltOnX+SB9ZuR0SedGNmGGaU6o/k+L2lIA==
X-Microsoft-Antispam-PRVS: <DB6PR0202MB2582CD9489C86F1AD33C74FAE9F10@DB6PR0202MB2582.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(31051911155226)(788757137089)(8415204561270)(78775014660990);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040450)(601004)(2401047)(8121501046)(5005006)(93006095)(93001095)(10201501046)(3002001)(6041248)(20161123560025)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(20161123564025)(20161123558100)(6072148);
	SRVR:DB6PR0202MB2582; BCL:0; PCL:0; RULEID:;
	SRVR:DB6PR0202MB2582; 
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0202MB2582;
	4:1u2fTWWdyceHgAnH4xd2kBtS9u1fmEWxxUygCN/37mM9xY3aGv+quDY6mPTYc64d1TvKRdbpWOVeNkosZfGU8gf/v37sH5j9rxZbLFDbMjUqblH3sX/ylY0yMfOSky/6gNl976w5VQwvtfUf970hPwPrs+mgtoXkZpS3DhCA2uPQVHscJULAX2awE0hoCMrN7ZBMWWF8CSwS4BQbDxMmBPTCai21nNiRr2rtHLipsgDBAbFXIS/1ZdOeVAvCEFy68MWRiZ4rpchaRcgu1d0tXNpUv6dtXiwnC3wGgPDBUZv5a8dyeP5eWfDwWydJz6Qhe5bE002P/jDKu+unLdbXKRKt96AfnMx7NywerOjjp8FzYN9h86+eyG7Z2CNPYrN8KrWz8jEXvHuUAB8pO9VqV3zitoWyCRcK0ubFSkAMDIE8jl9kTLcY4dYuPU83L9anrN8DEHHpg/ybjxgFTWIFNffViPl/X0W2dxlgq4odw/C9xdc4Rl2nRyBlOPpvMM3Bfbmj6EG52zdTLFxcsMaRAC7bluKxpUFGFzL46xCAqirUA1wQa4I6sPehPzKA8p//N0orQjyoicsCh41jltHgB59XniIL5WvcGYelOC+ULRsODxDd2u+MHmfo2YOfiYFPt7b7BNMZxdOmCsoNO3zhgGfqWoT1jDE4Ik436ye3uykRh34HLMUsjaM6UbAg1iZI0kMblLYLm7TmOZ4Ei8cGUzbyxLcqIC1Itc25xXBExZ/iYvm6r1NoL2O/JoXQsFVJ6u3GhcIaBTP05UYCR/BwflEVTxY62sqYowgtuJZam+TWbxsem6VZw51g3IDZujq0pEgtyJ3gv6ISZVvmFx+/jp0CYTkLvj1FeFXqtsBmYTpIWBRmKos9vN2Quop1Lwy4I8euIpaXVT+bLbZomlGqWOXOhKKkoVKy0+bxqYQlp+8=
X-Forefront-PRVS: 0324C2C0E2
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6009001)(39410400002)(39450400003)(39400400002)(39830400002)(377424004)(6512007)(2870700001)(8676002)(6306002)(53416004)(81166006)(6116002)(110136004)(6916009)(42186005)(53936002)(2906002)(53946003)(2361001)(6666003)(33646002)(50986999)(50466002)(74482002)(2351001)(50226002)(6506006)(6486002)(86362001)(36756003)(38730400002)(66066001)(478600001)(4001150100001)(189998001)(5660300001)(966005)(25786009)(53546009)(23676002)(575784001)(7736002)(305945005)(47776003)(579004)(559001)(460985005)(19627235001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB6PR0202MB2582;
	H:piippo.intra.qt; FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtEQjZQUjAyMDJNQjI1ODI7MjM6UUs3Qjdnc0RSRDBocUxIMGpIQ0R1am1S?=
	=?utf-8?B?eXQwRW5jN3J0cWR5R1MvL3ZvSytob1pxT2tZblpmV2lFVG9yY1hPYkl5SENC?=
	=?utf-8?B?QjRtUmFQVmtzc3IwaTZ0Y2dEZ1d3YnVqOGJUKzd5Z2MzSHowY3ZtN2JFdi9V?=
	=?utf-8?B?eEpxcEtVeDlkd1RpTlp1NitTdzc2U1lwTkI5cVhyeGhkdUdua3pERGVUQTNt?=
	=?utf-8?B?RUw3aTUybllJNzhIdnVQMno4QmdUQjBrUUw5SUlRVm44UGh6KzZMNld2RkMz?=
	=?utf-8?B?WUNlS1M4WFplY1RML25aRFQ2bWczS0JDZmxveWxQcEVLLzNzWTRtT1JZejc5?=
	=?utf-8?B?WHpUMlR2cjBNS3NmNjhiVFM3RkJKeDljTXBVTEdTOHU5c09tOXpYNWJRSjhR?=
	=?utf-8?B?OTJ6ZUI0Znc1NVZTSmIzQ3dYQkRaQkozRmlPL2w0aHQ1MlBXd3dQNkNscmIv?=
	=?utf-8?B?eS80SXVTV1o0aGRCL0ZiN2NySlBKWE9SRzdzMERhWTBadktiSmhoYUxuVC9i?=
	=?utf-8?B?WFVOUmpvbHdDRm96SzJzSHJwdzNQSUVkeHRKRVYzK0ZkM1R5TElNZjQrVFJW?=
	=?utf-8?B?WGFRNXluOTVueVhVM3Y1dDMrTWNEVm1sdXIxcVBsc2U3V2ZzazdSUHc4aFhX?=
	=?utf-8?B?V0dlb3hlZ3lTT1JEVXp5L2QzNk9MeWpwZXBVQ2hoby9MTXlMZVo0SElvZjRj?=
	=?utf-8?B?TksyUHNMdjdiNC9vV1RtQmwybjg0L0JtYXlOWlN3UDdaTEg1RW1PSzNmNUQr?=
	=?utf-8?B?cS9IcU9IQnRzcHRBSW50WEU2Uk9aMDFveDNXeGJNUU1lem5zeVJhS1oyT2R1?=
	=?utf-8?B?eW5WVkwzVVVpY3VoV3d6UVdtZG1GU1BiVEtsY2lDblVkMEtoYU1mSGdMR0xw?=
	=?utf-8?B?RU02cTlKNmNLYjJtdEFxMTgzSmhiR2lidU15anpiME03NmVrKzk5ck1vditX?=
	=?utf-8?B?WUl4U1dMNmtkQ1dJVUIxcGtLNzBla3krQUNDakJkVnhkZyt4WUg0QS85dlZ2?=
	=?utf-8?B?NHpPQzg0WUplZ1F3T1ljV3dPaWUvT3pKNjZ5Smo2dWtEZEFLc1JhRk1tczBW?=
	=?utf-8?B?TGJXSnVyWHlYL2dyWndpbHQ3ZkxlQUl2STFTeDdkM3Q1SE5CeXZ2bkZ2cTd4?=
	=?utf-8?B?Q0E0TURUdnRVWXZ1cUFJbVN0KzdPYkl0YWt4ZG9xL3ZwNVFtK0tibHREZWxF?=
	=?utf-8?B?dnJxa3J1MHRlbXlCeDJTNFBWSUlzLzZyUzFDRElycVhlWWJoL2FEcGUwVUNX?=
	=?utf-8?B?OHBrZms2bHhuS25scyt3dGxibWo0ZnFTSlJPNHNha3Y0aExKc2djb0JqMzMx?=
	=?utf-8?B?ZFN4TGd1QlhuSDlyZE4rc1k1Ui9vblJBQmdGQXR1M3hsQlVkWW1BODVQME9p?=
	=?utf-8?B?Rms4S2F0V2M4NGV6RHh3ZzJPajB5L3NwSW5Vb2xTQVE0cGhES2R1UEtOTytY?=
	=?utf-8?B?aHpIMW9IU3FsUUMvVzFlZ3hGWUI4ak1aU3N5MGQ1Tmw4L3FaZmd2SEozaUZs?=
	=?utf-8?B?SklpZWp6eityNG9IOUt0MjMxSklTdmhyVGFQbGtreDEyZGVBdWxaZkpXOU4x?=
	=?utf-8?B?YjZMNlJEVnRMLzh3Y1h3YlJCbTJGTWdRL2RyV2U1aXVtVG5wUTVuc0VOckF0?=
	=?utf-8?B?TnlYdm4yU0I4WUVnNG9YZVZzL3E1QXVtcU5wMUliclRsVUYvSkJxOVZ3Qnc9?=
	=?utf-8?Q?=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0202MB2582;
	6:Uk9/aSUggLPor8lGm7WRJM6a2vufKPV6ozstqxm1fJ63LkQi7xYLLUhB2ZGew+6ao5H1LZ8NTNVh8XVaDdd3JCg86HuHfLvv6WBwq7MUErwSuxx5TKzTh658uQu1CkOkVKa4r2qVu7UwdrYY14w6Ftt2ZZ8sUMp9f2Cy7MkytyYjYJ/ywpZz2SuAt6opAxTSb6RKkM8oI2Ab2G/0DDCSDTnr5Sj6w/53ovVIcdzCcYaCatLixupy6vPjf8461j3zoWgJOvYkpIcuL45vraz2DugMsanKENjB9rqJ7ysr1Qm6uys5aw9nLBp3ffJ71Dnbm2sKiZN1HWKA1x1Pimad4ByrXVa9YPxIaT4uYL96T5Zn/vH7zAIusZUmOUE8xcsD++/UQykMpyA9NjD8JXqDLH8Fuc3l6sHpf3AE4ADuVvFkXYi7m2oDZmu8MypaL3OsPvU9ebUmzg1fYl7Z4ALXqpQm0w0s0JSuy54KB6nGaomGBsvB4RQD1iqR/F7R14BvNJ/jBiAD3M8h6Yq7W87x4A==;
	5:7Nxgc21X1mAoGQFZdcIGHucxS2VRZoU/FjD64IkqwK/mKI2r7yMWSIIs44ZFMTXupisiSXAz+qOAAH5nwtwbF+0S01CKVZbSRfnc9E+drXKmLjSjn6J4WyJ1/jpzP6Idw6b3iIyr9cLIzr1GwixJcA==;
	24:ORMZow7uuk19m9q2uZ//DvKZ1mu5M+wo8KmIqZaQEN8Be9nM5JW/K6R7v+t+iLJIFdAX6taNAY/5u9dFiKuBlYjsZ+toklb/fXXW5TAhSrU=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0202MB2582;
	7:IPwLcFFRLfShkbZ99QGSfBFsJvMPqY2kJ3TFUF74Ff3jdjmzKe6RVCd6E8SlJq3V/Zao0ZziEHjcF47fAa6vyJETJNW9rxWQ3zfPajOIs2AaVktEKBzaM3Y3lJNaS+gMgOa/Z8kGK7rXD9KvfE2DVd+ytO2A3423vChtWsX9MYsaSeufoTIImLrqcHKNDkNdZQVYtqJzL1AYYQcuTpD2XDxf5AZd3/+5j64wJWhOTKTnCAQyoTBALKWY982zv9ZEBcwOjAH1TSmFFvcwk5hle/4OI4a0PPnF/PD5zRrxEnV5VbuHOHafZji/NED3R+fNv1Ov4X3vy2dxYCkwJFrkVQ==
X-OriginatorOrg: qt.io
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2017 06:41:05.5515 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0202MB2582
Subject: [meta-qt5][PATCH] Upgrade to Qt 5.9.0
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
X-List-Received-Date: Wed, 31 May 2017 17:14:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* adapt QtWebEngine recipe to use GN instead of GYP
* add QtRemoteObjects as a new Qt module
* update available QtBase configure arguments
* remove obsolete patches
* patch all .pc files to remove build paths
* include generated QML cache files in packages
* the patch "configure paths for target qmake properly" could not
  be applied anymore and support must be done differently

Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
---
 classes/qmake5_base.bbclass                        |   6 +-
 recipes-qt/qt5/nativesdk-qtbase_git.bb             |   7 +-
 .../qt5/qt3d/0001-Allow-a-tools-only-build.patch   |  16 +++-
 recipes-qt/qt5/qt3d_git.bb                         |   2 +-
 recipes-qt/qt5/qt5-git.inc                         |   4 +-
 recipes-qt/qt5/qt5.inc                             |  10 +-
 recipes-qt/qt5/qtbase-native_git.bb                |   9 +-
 ...ake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch} |   8 +-
 ...le-Fix-pkgconfig-and-libtool-replacements.patch | 106 ---------------------
 ...ump-path-length-from-256-to-512-character.patch |  41 ++++----
 ...configure-paths-for-target-qmake-properly.patch |  75 ---------------
 recipes-qt/qt5/qtbase_git.bb                       |  13 +--
 recipes-qt/qt5/qtcanvas3d_git.bb                   |   2 +-
 recipes-qt/qt5/qtcharts_git.bb                     |   2 +-
 recipes-qt/qt5/qtconnectivity_git.bb               |   6 +-
 recipes-qt/qt5/qtdatavis3d_git.bb                  |   2 +-
 .../qtdeclarative/0002-Fix-memory-leak-in-V4.patch |  44 ---------
 ...leak-in-QQuickWindowPrivate-deliverTouchA.patch |  84 ----------------
 recipes-qt/qt5/qtdeclarative_git.bb                |   8 +-
 recipes-qt/qt5/qtenginio_git.bb                    |   5 -
 recipes-qt/qt5/qtgamepad_git.bb                    |   2 +-
 recipes-qt/qt5/qtgraphicaleffects_git.bb           |   2 +-
 recipes-qt/qt5/qtimageformats_git.bb               |   2 +-
 recipes-qt/qt5/qtlocation_git.bb                   |   9 +-
 recipes-qt/qt5/qtmultimedia_git.bb                 |   6 +-
 recipes-qt/qt5/qtnetworkauth_git.bb                |   3 +-
 recipes-qt/qt5/qtquick1_git.bb                     |   2 +-
 recipes-qt/qt5/qtquickcontrols2_git.bb             |   6 +-
 recipes-qt/qt5/qtquickcontrols_git.bb              |   7 +-
 recipes-qt/qt5/qtremoteobjects_git.bb              |  14 +++
 recipes-qt/qt5/qtscript_git.bb                     |   2 +-
 recipes-qt/qt5/qtscxml_git.bb                      |   2 +-
 recipes-qt/qt5/qtsensors_git.bb                    |   2 +-
 recipes-qt/qt5/qtserialbus_git.bb                  |   2 +-
 recipes-qt/qt5/qtserialport_git.bb                 |   2 +-
 recipes-qt/qt5/qtsvg_git.bb                        |   2 +-
 ...t-help-fix-linking-of-dependent-libraries.patch |  29 ------
 recipes-qt/qt5/qttools_git.bb                      |   8 +-
 recipes-qt/qt5/qttranslations_git.bb               |   2 +-
 recipes-qt/qt5/qtvirtualkeyboard_git.bb            |   2 +-
 recipes-qt/qt5/qtwayland_git.bb                    |   6 +-
 recipes-qt/qt5/qtwebchannel_git.bb                 |   2 +-
 .../0001-Force-host-toolchain-configuration.patch  |  69 ++++++++++++++
 ...se.gypi-include-atomicops_internals_x86_g.patch |  24 -----
 ...um-workaround-for-too-long-.rps-file-name.patch |  42 ++++++++
 ...rf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch |  27 ------
 ...rf-Make-sure-we-only-use-the-file-name-to.patch |  26 -----
 ...s.prf-allow-build-for-linux-oe-g-platform.patch |  30 ------
 ...quickwebengineview_p_p.h-add-include-QCol.patch |  23 -----
 ...-dependency-to-QCoreApplication-translate.patch |  23 -----
 recipes-qt/qt5/qtwebengine_git.bb                  |  54 +++++------
 recipes-qt/qt5/qtwebkit-examples_git.bb            |   2 +-
 .../qtwebkit/0002-Remove-TEXTREL-tag-in-x86.patch  |  76 ---------------
 recipes-qt/qt5/qtwebkit_git.bb                     |   3 +-
 recipes-qt/qt5/qtwebsockets_git.bb                 |   2 +-
 recipes-qt/qt5/qtx11extras_git.bb                  |   2 +-
 recipes-qt/qt5/qtxmlpatterns_git.bb                |   2 +-
 57 files changed, 258 insertions(+), 711 deletions(-)
 rename recipes-qt/qt5/qtbase/{0003-Add-external-hostbindir-option.patch => 0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch} (94%)
 delete mode 100644 recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
 delete mode 100644 recipes-qt/qt5/qtbase/0008-configure-paths-for-target-qmake-properly.patch
 delete mode 100644 recipes-qt/qt5/qtdeclarative/0002-Fix-memory-leak-in-V4.patch
 delete mode 100644 recipes-qt/qt5/qtdeclarative/0003-fix-memory-leak-in-QQuickWindowPrivate-deliverTouchA.patch
 create mode 100644 recipes-qt/qt5/qtremoteobjects_git.bb
 delete mode 100644 recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch
 create mode 100644 recipes-qt/qt5/qtwebengine/0001-Force-host-toolchain-configuration.patch
 delete mode 100644 recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch
 create mode 100644 recipes-qt/qt5/qtwebengine/0001-chromium-workaround-for-too-long-.rps-file-name.patch
 delete mode 100644 recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
 delete mode 100644 recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch
 delete mode 100644 recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch
 delete mode 100644 recipes-qt/qt5/qtwebengine/0004-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch
 delete mode 100644 recipes-qt/qt5/qtwebengine/0005-Include-dependency-to-QCoreApplication-translate.patch
 delete mode 100644 recipes-qt/qt5/qtwebkit/0002-Remove-TEXTREL-tag-in-x86.patch

diff --git a/classes/qmake5_base.bbclass b/classes/qmake5_base.bbclass
index df8f624..a556f4f 100644
--- a/classes/qmake5_base.bbclass
+++ b/classes/qmake5_base.bbclass
@@ -214,7 +214,9 @@ qmake5_base_do_install() {
     qmake5_base_fix_install ${STAGING_DIR_HOST}
     qmake5_base_fix_install ${STAGING_DIR_NATIVE}
 
-    if ls ${D}${libdir}/pkgconfig/Qt5*.pc >/dev/null 2>/dev/null; then
-        sed -i "s@-L${STAGING_LIBDIR}@-L\${libdir}@g" ${D}${libdir}/pkgconfig/Qt5*.pc
+    if ls ${D}${libdir}/pkgconfig/*.pc >/dev/null 2>/dev/null; then
+        sed -i ${D}${libdir}/pkgconfig/*.pc \
+            -e "s@-L${STAGING_LIBDIR}@-L\${libdir}@g" \
+            -e "s@${STAGING_DIR_TARGET}@@g"
     fi
 }
diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index f2ff5f7..fac5791 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -27,9 +27,8 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/qtbase:"
 # common for qtbase-native, qtbase-nativesdk and qtbase
 SRC_URI += "\
     file://0001-Add-linux-oe-g-platform.patch \
+    file://0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch \
     file://0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch \
-    file://0003-Add-external-hostbindir-option.patch \
-    file://0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch \
     file://0005-configure-bump-path-length-from-256-to-512-character.patch \
     file://0009-Disable-all-unknown-features-instead-of-erroring-out.patch \
     file://0010-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch \
@@ -115,6 +114,7 @@ do_configure() {
         -no-opengl \
         -no-openssl \
         -no-xcb \
+        -no-feature-bearermanagement \
         -no-icu \
         -verbose \
         -release \
@@ -134,7 +134,6 @@ do_configure() {
         -testsdir ${OE_QMAKE_PATH_TESTS} \
         -hostbindir ${OE_QMAKE_PATH_HOST_BINS} \
         -hostdatadir ${OE_QMAKE_PATH_HOST_DATA} \
-        -host-option CROSS_COMPILE=${HOST_PREFIX} \
         -external-hostbindir ${OE_QMAKE_PATH_EXTERNAL_HOST_BINS} \
         -no-glib \
         -no-iconv \
@@ -192,4 +191,4 @@ fakeroot do_generate_qt_environment_file() {
 
 addtask generate_qt_environment_file after do_install before do_package
 
-SRCREV = "49dc9aa409d727824f26b246054a22b5a7dd5980"
+SRCREV = "f6b36eaafec24b4c67efff621d380a4ca4257d0b"
diff --git a/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch b/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch
index b19f963..248fb47 100644
--- a/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch
+++ b/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch
@@ -1,12 +1,14 @@
-From 64f46f5399627430f9ce1a888fb9212b33977231 Mon Sep 17 00:00:00 2001
+From b3fbc6be8844cf2eb8a47d39b1b7ce8016ce5d52 Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@theqtcompany.com>
 Date: Wed, 10 Feb 2016 09:02:09 +0200
 Subject: [PATCH] Allow a tools-only build
 
+Change-Id: I4de6b96ec51fe297a0eeb757cef56d8fb40bd6f0
 ---
  qt3d.pro                                  | 7 ++++++-
  src/3rdparty/assimp/assimp_dependency.pri | 2 +-
- 2 files changed, 7 insertions(+), 2 deletions(-)
+ tools/tools.pro                           | 2 +-
+ 3 files changed, 8 insertions(+), 3 deletions(-)
 
 diff --git a/qt3d.pro b/qt3d.pro
 index 2cc347a..81cdeef 100644
@@ -38,3 +40,13 @@ index 8ba2d9a..e973d93 100644
      QMAKE_USE_PRIVATE += assimp
  } else {
      include(assimp.pri)
+diff --git a/tools/tools.pro b/tools/tools.pro
+index 8e973ae..ad51db5 100644
+--- a/tools/tools.pro
++++ b/tools/tools.pro
+@@ -1,4 +1,4 @@
+ TEMPLATE = subdirs
+ QT_FOR_CONFIG += 3dcore-private
+-!android:qtConfig(assimp):qtConfig(commandlineparser): \
++!android:tools-only|qtConfig(assimp):qtConfig(commandlineparser): \
+     SUBDIRS += qgltf
diff --git a/recipes-qt/qt5/qt3d_git.bb b/recipes-qt/qt5/qt3d_git.bb
index f39208a..f0f960a 100644
--- a/recipes-qt/qt5/qt3d_git.bb
+++ b/recipes-qt/qt5/qt3d_git.bb
@@ -34,6 +34,6 @@ do_configure_prepend() {
          ${S}/src/quick3d/imports/input/importsinput.pro
 }
 
-SRCREV = "440589a0747d9668fec3ff924b390d75be5c6733"
+SRCREV = "f39d0a0c32cc489849a0cd5c2880f6e824223485"
 
 BBCLASSEXTEND += "native nativesdk"
diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
index f864953..b7fee9c 100644
--- a/recipes-qt/qt5/qt5-git.inc
+++ b/recipes-qt/qt5/qt5-git.inc
@@ -2,7 +2,7 @@
 # Copyright (C) 2013-2016 Martin Jansa <martin.jansa@gmail.com>
 
 QT_MODULE ?= "${BPN}"
-QT_MODULE_BRANCH ?= "5.8"
+QT_MODULE_BRANCH ?= "5.9"
 QT_MODULE_BRANCH_PARAM ?= "branch=${QT_MODULE_BRANCH};nobranch=1"
 
 # each module needs to define valid SRCREV
@@ -12,4 +12,4 @@ SRC_URI = " \
 
 S = "${WORKDIR}/git"
 
-PV = "5.8.0+git${SRCPV}"
+PV = "5.9.0+git${SRCPV}"
diff --git a/recipes-qt/qt5/qt5.inc b/recipes-qt/qt5/qt5.inc
index 90d7896..4b5fe8a 100644
--- a/recipes-qt/qt5/qt5.inc
+++ b/recipes-qt/qt5/qt5.inc
@@ -97,34 +97,42 @@ FILES_${PN}-qmldesigner += " \
     ${OE_QMAKE_PATH_QML}/*/*/*/designer \
 "
 
-# qmlplugins 1-4 levels of subdirs qmldir + *{.so,*.qmltypes,*.qml,*js}
+# qmlplugins 1-4 levels of subdirs qmldir + *{.so,*.qmltypes,*.qml,*.qmlc,*.js,*.jsc}
 FILES_${PN}-qmlplugins = " \
     ${OE_QMAKE_PATH_QML}/*.qmltypes \
     ${OE_QMAKE_PATH_QML}/*/*${SOLIBSDEV} \
     ${OE_QMAKE_PATH_QML}/*/qmldir \
     ${OE_QMAKE_PATH_QML}/*/*.qmltypes \
     ${OE_QMAKE_PATH_QML}/*/*.qml \
+    ${OE_QMAKE_PATH_QML}/*/*.qmlc \
     ${OE_QMAKE_PATH_QML}/*/*.js \
+    ${OE_QMAKE_PATH_QML}/*/*.jsc \
     ${OE_QMAKE_PATH_QML}/*/*.png \
     ${OE_QMAKE_PATH_QML}/*/*/*${SOLIBSDEV} \
     ${OE_QMAKE_PATH_QML}/*/*/qmldir \
     ${OE_QMAKE_PATH_QML}/*/*/*.qmltypes \
     ${OE_QMAKE_PATH_QML}/*/*/*.qml \
+    ${OE_QMAKE_PATH_QML}/*/*/*.qmlc \
     ${OE_QMAKE_PATH_QML}/*/*/*.js \
+    ${OE_QMAKE_PATH_QML}/*/*/*.jsc \
     ${OE_QMAKE_PATH_QML}/*/*/*.png \
     ${OE_QMAKE_PATH_QML}/*/*/*/*${SOLIBSDEV} \
     ${OE_QMAKE_PATH_QML}/*/*/*/qmldir \
     ${OE_QMAKE_PATH_QML}/*/*/*/images \
     ${OE_QMAKE_PATH_QML}/*/*/*/*.qmltypes \
     ${OE_QMAKE_PATH_QML}/*/*/*/*.qml \
+    ${OE_QMAKE_PATH_QML}/*/*/*/*.qmlc \
     ${OE_QMAKE_PATH_QML}/*/*/*/*.js \
+    ${OE_QMAKE_PATH_QML}/*/*/*/*.jsc \
     ${OE_QMAKE_PATH_QML}/*/*/*/*.png \
     ${OE_QMAKE_PATH_QML}/*/*/*/*.metainfo \
     ${OE_QMAKE_PATH_QML}/*/*/*/*/*${SOLIBSDEV} \
     ${OE_QMAKE_PATH_QML}/*/*/*/*/qmldir \
     ${OE_QMAKE_PATH_QML}/*/*/*/*/*.qmltypes \
     ${OE_QMAKE_PATH_QML}/*/*/*/*/*.qml \
+    ${OE_QMAKE_PATH_QML}/*/*/*/*/*.qmlc \
     ${OE_QMAKE_PATH_QML}/*/*/*/*/*.js \
+    ${OE_QMAKE_PATH_QML}/*/*/*/*/*.jsc \
     ${OE_QMAKE_PATH_QML}/*/*/*/*/*/*.png \
     ${OE_QMAKE_PATH_IMPORTS}/*.qmltypes \
     ${OE_QMAKE_PATH_IMPORTS}/*/*${SOLIBSDEV} \
diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index da69812..66b43e0 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -22,9 +22,8 @@ require qt5-git.inc
 # common for qtbase-native, qtbase-nativesdk and qtbase
 SRC_URI += "\
     file://0001-Add-linux-oe-g-platform.patch \
+    file://0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch \
     file://0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch \
-    file://0003-Add-external-hostbindir-option.patch \
-    file://0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch \
     file://0005-configure-bump-path-length-from-256-to-512-character.patch \
     file://0009-Disable-all-unknown-features-instead-of-erroring-out.patch \
     file://0010-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch \
@@ -107,9 +106,7 @@ do_install() {
         done
     fi
 
-    # for modules which are still using syncqt and call qtPrepareTool(QMAKE_SYNCQT, syncqt)
-    # e.g. qt3d, qtwayland
-    ln -sf syncqt.pl ${D}${OE_QMAKE_PATH_QT_BINS}/syncqt
+    install -m 755 ${B}/bin/qfloat16-tables ${D}${OE_QMAKE_PATH_BINS}
 }
 
-SRCREV = "49dc9aa409d727824f26b246054a22b5a7dd5980"
+SRCREV = "f6b36eaafec24b4c67efff621d380a4ca4257d0b"
diff --git a/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch b/recipes-qt/qt5/qtbase/0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch
similarity index 94%
rename from recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
rename to recipes-qt/qt5/qtbase/0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch
index 8224171..4ab4724 100644
--- a/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
+++ b/recipes-qt/qt5/qtbase/0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch
@@ -1,9 +1,9 @@
-From 502b95b840a5f79e5a68e9bd5b10dbdc92485f1f Mon Sep 17 00:00:00 2001
+From f49d55a883369dee488cc59feda29c770a803458 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 6 Apr 2013 13:15:07 +0200
-Subject: [PATCH] Add -external-hostbindir option
+Subject: [PATCH] cmake: Use OE_QMAKE_PATH_EXTERNAL_HOST_BINS
 
-* cmake: Use OE_QMAKE_PATH_EXTERNAL_HOST_BINS to determine path to host binaries
+... to determine path to host binaries
 
 Upstream-Status: Inappropriate [OE specific]
 
@@ -19,7 +19,7 @@ Change-Id: Iacaa1c5531cd6dcc094891610c351673db55d7b2
  3 files changed, 6 insertions(+), 6 deletions(-)
 
 diff --git a/src/corelib/Qt5CoreConfigExtras.cmake.in b/src/corelib/Qt5CoreConfigExtras.cmake.in
-index a5ed8b2..0e11a1e 100644
+index 545b9a3..c991a9b 100644
 --- a/src/corelib/Qt5CoreConfigExtras.cmake.in
 +++ b/src/corelib/Qt5CoreConfigExtras.cmake.in
 @@ -5,7 +5,7 @@ if (NOT TARGET Qt5::qmake)
diff --git a/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch b/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
deleted file mode 100644
index c105488..0000000
--- a/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
+++ /dev/null
@@ -1,106 +0,0 @@
-From bf1498618415e7b1e57b54881b1e56d74f2cdf6b Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Sat, 27 Apr 2013 23:15:37 +0200
-Subject: [PATCH] qt_module: Fix pkgconfig and libtool replacements
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-* in situation like this:
-  QT_SYSROOT:/OE/oe-core/tmp-eglibc/sysroots/qemuarm
-  QT_INSTALL_LIBS:/OE/oe-core/tmp-eglibc/sysroots/qemuarm/usr/lib
-  QT_INSTALL_LIBS/raw:/usr/lib
-  QT_INSTALL_LIBS/get:/OE/oe-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/qtbase/5.0.0-r0.0/build/lib
-
-  I don't want the replacement like this:
-  sed
-    -e "s,/OE/oe-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/qtbase/5.0.0-r0.0/build/include,/usr/include/qt5,g"
-    -e "s,/OE/oe-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/qtbase/5.0.0-r0.0/build/lib,/usr/lib,g"
-    "../../lib/pkgconfig/Qt5Core.pc"
-    >"/OE/oe-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/qtbase/5.0.0-r0.0/image/OE/oe-core/tmp-eglibc/sysroots/qemuarm/usr/lib/pkgconfig/Qt5Core.pc"
-  because that way I'll end with -L/usr/lib in .pc file which is
-  cross-compile unfriendly, keeping ${libdir}/${includedir} works better
-  in my case
-
-* qt_module: Fix paths in .prl files
-* qmake does not prefix them with QT_SYSROOT when using them
-  so e.g. when building qtdeclarative we get -L/usr/lib to LINKAGE
-  variable, which is unsafe for cross-compilation
-* writting QT_SYSROOT in .prl files is dangerous for sstate when
-  builds are in different directories, so we need
-  SSTATE_SCAN_FILES += "*.pri *.prl"
-  to make them relocateble
-
-* fix paths in packageconfig files
-  This reverts parts of:
-
-  enable path replacement in installed prl files on all platforms
-
-  Task-number: QTBUG-33794
-  Change-Id: Id0d38715673b8a1c0c034e9c15783eb255c4315b
-  Reviewed-by: Joerg Bornemann <joerg.bornemann@digia.com>
-
-* to debug this, rebuild qtbase and read build/src/corelib/Makefile
-* this is example of broken install_target rule (added line feeds):
-  -$(SED) -e s,/OE/5.3.1-r0/build/lib,/usr/lib,g
-          -e 's,/OE/5.3.1-r0/build/include,$$\{includedir},g'
-          -e 's,/OE/5.3.1-r0/build/lib,$$\{libdir},g'
-     "../../lib/pkgconfig/Qt5Core.pc"
-     >"$(INSTALL_ROOT)/usr/lib/pkgconfig/Qt5Core.pc"
-  change .prf files, create copy of WORKDIR, re-excecute only
-  do_configure task and compare generated Makefile, repeat until
-  replace in generated Makefile works ok, then refresh patch and
-  try complete rebuild for qtbase
-* if everything is ok, then try:
-  image $ grep -R "\-L/usr" .
-  image $ grep -R "\-I/usr" .
-  and it should return only few cases of
-  qmake.conf:QMAKE_LFLAGS_THREAD     = -L/usr/lib/threads
-  for aix* platformas
-
-Change-Id: Ie1c94b15f2a4e736b65b4d0924d99eb2a7d92a6c
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
-Signed-off-by: Jonathan Liu <net147@gmail.com>
----
- mkspecs/features/qt.prf        | 13 +++++++++++++
- mkspecs/features/qt_common.prf |  2 +-
- 2 files changed, 14 insertions(+), 1 deletion(-)
-
-diff --git a/mkspecs/features/qt.prf b/mkspecs/features/qt.prf
-index 0c5f080..a6e4f09 100644
---- a/mkspecs/features/qt.prf
-+++ b/mkspecs/features/qt.prf
-@@ -317,6 +317,19 @@ contains(TEMPLATE, .*app) {
-     QTPLUGIN = $$manualplugs $$autoplugs
- }
- 
-+contains(TEMPLATE, .*lib) {
-+    pkgconfig_prefix_replace.match = "prefix=$$[QT_SYSROOT]"
-+    pkgconfig_prefix_replace.replace = "prefix="
-+    pkgconfig_prefix_replace.CONFIG = path
-+    QMAKE_PKGCONFIG_INSTALL_REPLACE += pkgconfig_prefix_replace
-+
-+    # drop -L/usr/lib in .prl files
-+    prl_replace.match = "-L\$${libdir}"
-+    prl_replace.replace = ""
-+    prl_replace.CONFIG = path
-+    QMAKE_PRL_INSTALL_REPLACE += prl_replace
-+}
-+
- QT_PLUGIN_VERIFY = DEPLOYMENT_PLUGIN
- qtConfig(static) {
-     QT_PLUGIN_VERIFY += QTPLUGIN
-diff --git a/mkspecs/features/qt_common.prf b/mkspecs/features/qt_common.prf
-index e754a17..4c1530e 100644
---- a/mkspecs/features/qt_common.prf
-+++ b/mkspecs/features/qt_common.prf
-@@ -37,7 +37,7 @@ contains(TEMPLATE, .*lib) {
-         lib_replace.replace =
-     } else {
-         lib_replace.match = $$rplbase/lib
--        lib_replace.replace = $$qqt_libdir
-+        lib_replace.replace = "\$$\\{libdir}"
-     }
-     lib_replace.CONFIG = path
-     QMAKE_PRL_INSTALL_REPLACE += lib_replace
diff --git a/recipes-qt/qt5/qtbase/0005-configure-bump-path-length-from-256-to-512-character.patch b/recipes-qt/qt5/qtbase/0005-configure-bump-path-length-from-256-to-512-character.patch
index d455d2c..7c80c6b 100644
--- a/recipes-qt/qt5/qtbase/0005-configure-bump-path-length-from-256-to-512-character.patch
+++ b/recipes-qt/qt5/qtbase/0005-configure-bump-path-length-from-256-to-512-character.patch
@@ -1,4 +1,4 @@
-From 60f490b57faf979a912074506a75c74767a27d3b Mon Sep 17 00:00:00 2001
+From c8f856115df0f5be64dfbeef0c1e9a4f02ba161a Mon Sep 17 00:00:00 2001
 From: Denys Dmytriyenko <denys@ti.com>
 Date: Tue, 25 Aug 2015 10:05:15 -0400
 Subject: [PATCH] configure: bump path length from 256 to 512 characters
@@ -8,26 +8,27 @@ from 256 to 512 characters, as nativesdk path can be quite long.
 
 Also update length of EXT_PREFIX and HOST_PREFIX now.
 
+Change-Id: If98dd57160efe9c98c36148cdf872f50b3d38118
 Signed-off-by: Denys Dmytriyenko <denys@ti.com>
 ---
- configure | 6 +++---
+ configure.pri | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)
 
-diff --git a/configure b/configure
-index 1fcbb3a..f49a674 100755
---- a/configure
-+++ b/configure
-@@ -3847,10 +3847,10 @@ static const char qt_configure_licensed_products_str [256 + 12] = "qt_lcnsprod=$
- static const char qt_configure_installation          [12+11]    = "qt_instdate=2012-12-20";
- 
- /* Installation Info */
--static const char qt_configure_prefix_path_str       [256 + 12] = "qt_prfxpath=$QT_INSTALL_PREFIX";
-+static const char qt_configure_prefix_path_str       [512 + 12] = "qt_prfxpath=$QT_INSTALL_PREFIX";
- #ifdef QT_BUILD_QMAKE
--static const char qt_configure_ext_prefix_path_str   [256 + 12] = "qt_epfxpath=$QT_EXT_PREFIX";
--static const char qt_configure_host_prefix_path_str  [256 + 12] = "qt_hpfxpath=$QT_HOST_PREFIX";
-+static const char qt_configure_ext_prefix_path_str   [512 + 12] = "qt_epfxpath=$QT_EXT_PREFIX";
-+static const char qt_configure_host_prefix_path_str  [512 + 12] = "qt_hpfxpath=$QT_HOST_PREFIX";
- #endif
- 
- static const short qt_configure_str_offsets[] = {
+diff --git a/configure.pri b/configure.pri
+index efd0f81..5a027fe 100644
+--- a/configure.pri
++++ b/configure.pri
+@@ -837,10 +837,10 @@ defineTest(qtConfOutput_preparePaths) {
+         "static const char qt_configure_installation     [12+11]  = \"qt_instdate=2012-12-20\";" \
+         "" \
+         "/* Installation Info */" \
+-        "static const char qt_configure_prefix_path_str  [12+256] = \"qt_prfxpath=$$config.input.prefix\";" \
++        "static const char qt_configure_prefix_path_str  [12+512] = \"qt_prfxpath=$$config.input.prefix\";" \
+         "$${LITERAL_HASH}ifdef QT_BUILD_QMAKE" \
+-        "static const char qt_configure_ext_prefix_path_str   [12+256] = \"qt_epfxpath=$$config.input.extprefix\";" \
+-        "static const char qt_configure_host_prefix_path_str  [12+256] = \"qt_hpfxpath=$$config.input.hostprefix\";" \
++        "static const char qt_configure_ext_prefix_path_str   [12+512] = \"qt_epfxpath=$$config.input.extprefix\";" \
++        "static const char qt_configure_host_prefix_path_str  [12+512] = \"qt_hpfxpath=$$config.input.hostprefix\";" \
+         "$${LITERAL_HASH}endif" \
+         "" \
+         "static const short qt_configure_str_offsets[] = {" \
diff --git a/recipes-qt/qt5/qtbase/0008-configure-paths-for-target-qmake-properly.patch b/recipes-qt/qt5/qtbase/0008-configure-paths-for-target-qmake-properly.patch
deleted file mode 100644
index 6d64e6b..0000000
--- a/recipes-qt/qt5/qtbase/0008-configure-paths-for-target-qmake-properly.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From cc926956758bf8170c4e49c66e1066524b43f65f Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Fri, 13 Nov 2015 12:36:11 +0100
-Subject: [PATCH] configure paths for target qmake properly
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-to use this patch in all qtbase/qtbase-native(sdk) changes ore made
-conditionally based on QT_CROSS_COMPILE
-
-Upstream-Status: Inappropriate [OE specific]
-
-Change-Id: I2b2f00c496216e98fbe14801f9e840ef5333c4b6
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- configure | 23 +++++++++++++++++++----
- 1 file changed, 19 insertions(+), 4 deletions(-)
-
-diff --git a/configure b/configure
-index 8b33c5b..1df248f 100755
---- a/configure
-+++ b/configure
-@@ -1545,8 +1545,13 @@ if [ -z "$QT_REL_HOST_DATA" ]; then
-     fi
- fi
- 
--shortxspec=`echo $XQMAKESPEC | sed "s,^${relpath}/mkspecs/,,"`
--shortspec=`echo $QMAKESPEC | sed "s,^${relpath}/mkspecs/,,"`
-+if [ "$QT_CROSS_COMPILE" = "yes" ] ; then
-+    shortxspec=linux-g++
-+    shortspec=linux-g++
-+else
-+    shortxspec=`echo $XQMAKESPEC | sed "s,^${relpath}/mkspecs/,,"`
-+    shortspec=`echo $QMAKESPEC | sed "s,^${relpath}/mkspecs/,,"`
-+fi
- 
- QT_CONFIGURE_STR_OFF=0
- 
-@@ -1579,7 +1584,11 @@ QT_CONFIGURE_STRS_ALL=$QT_CONFIGURE_STRS
- 
- QT_CONFIGURE_STR_OFFSETS=
- QT_CONFIGURE_STRS=
--addConfStr "$CFG_SYSROOT"
-+if [ "$QT_CROSS_COMPILE" = "yes" ] ; then
-+    addConfStr ""
-+else
-+    addConfStr "$CFG_SYSROOT"
-+fi
- addConfStr "$QT_REL_HOST_BINS"
- addConfStr "$QT_REL_HOST_LIBS"
- addConfStr "$QT_REL_HOST_DATA"
-@@ -1591,6 +1600,12 @@ addConfStr "$shortspec"
- #-------------------------------------------------------------------------------
- [ -d "$outpath/src/corelib/global" ] || mkdir -p "$outpath/src/corelib/global"
- 
-+if [ "$QT_CROSS_COMPILE" = "yes" ] ; then
-+    QT_TARGET_PREFIX=$QT_EXT_PREFIX
-+else
-+    QT_TARGET_PREFIX=$QT_HOST_PREFIX
-+fi
-+
- cat > "$outpath/src/corelib/global/qconfig.cpp.new" <<EOF
- /* Installation date */
- static const char qt_configure_installation          [12+11]    = "qt_instdate=2012-12-20";
-@@ -1599,7 +1614,7 @@ static const char qt_configure_installation          [12+11]    = "qt_instdate=2
- static const char qt_configure_prefix_path_str       [512 + 12] = "qt_prfxpath=$QT_INSTALL_PREFIX";
- #ifdef QT_BUILD_QMAKE
- static const char qt_configure_ext_prefix_path_str   [512 + 12] = "qt_epfxpath=$QT_EXT_PREFIX";
--static const char qt_configure_host_prefix_path_str  [512 + 12] = "qt_hpfxpath=$QT_HOST_PREFIX";
-+static const char qt_configure_host_prefix_path_str  [512 + 12] = "qt_hpfxpath=$QT_TARGET_PREFIX";
- #endif
- 
- static const short qt_configure_str_offsets[] = {
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 27d0de1..09d6cec 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -17,19 +17,13 @@ LIC_FILES_CHKSUM = " \
 # common for qtbase-native, qtbase-nativesdk and qtbase
 SRC_URI += "\
     file://0001-Add-linux-oe-g-platform.patch \
+    file://0002-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS.patch \
     file://0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch \
-    file://0003-Add-external-hostbindir-option.patch \
-    file://0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch \
     file://0005-configure-bump-path-length-from-256-to-512-character.patch \
     file://0009-Disable-all-unknown-features-instead-of-erroring-out.patch \
     file://0010-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch \
 "
 
-# only for target qtbase
-SRC_URI += "\
-    file://0008-configure-paths-for-target-qmake-properly.patch \
-"
-
 DEPENDS += "qtbase-native"
 
 # LGPL-3.0 is used only in src/plugins/platforms/android/extract.cpp
@@ -40,7 +34,7 @@ RDEPENDS_${PN}-tools += "perl"
 # separate some parts of PACKAGECONFIG which are often changed
 PACKAGECONFIG_GL ?= "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gl', '', d)}"
 PACKAGECONFIG_FB ?= "${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)}"
-PACKAGECONFIG_X11 ?= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xcb xrender xinput2 glib xkb xkbcommon-evdev', '', d)}"
+PACKAGECONFIG_X11 ?= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xcb xinput2 glib xkb xkbcommon-evdev', '', d)}"
 PACKAGECONFIG_FONTS ?= ""
 PACKAGECONFIG_SYSTEM ?= "jpeg libpng zlib"
 PACKAGECONFIG_DISTRO ?= ""
@@ -104,7 +98,6 @@ PACKAGECONFIG[sql-db2] = "-sql-db2,-no-sql-db2"
 PACKAGECONFIG[sql-sqlite2] = "-sql-sqlite2,-no-sql-sqlite2,sqlite"
 PACKAGECONFIG[sql-sqlite] = "-sql-sqlite -system-sqlite,-no-sql-sqlite,sqlite3"
 PACKAGECONFIG[xinput2] = "-xinput2,-no-xinput2,libxi"
-PACKAGECONFIG[xrender] = "-xrender,-no-xrender,libxrender"
 PACKAGECONFIG[iconv] = "-iconv,-no-iconv,virtual/libiconv"
 PACKAGECONFIG[xkb] = "-xkb,-no-xkb -no-xkbcommon,libxkbcommon"
 PACKAGECONFIG[xkbcommon-evdev] = "-xkbcommon-evdev,-no-xkbcommon-evdev,libxkbcommon,xkeyboard-config"
@@ -189,4 +182,4 @@ INSANE_SKIP_${PN}-mkspecs += "file-rdeps"
 
 RRECOMMENDS_${PN}-plugins += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libx11-locale', '', d)}"
 
-SRCREV = "49dc9aa409d727824f26b246054a22b5a7dd5980"
+SRCREV = "f6b36eaafec24b4c67efff621d380a4ca4257d0b"
diff --git a/recipes-qt/qt5/qtcanvas3d_git.bb b/recipes-qt/qt5/qtcanvas3d_git.bb
index 3ca6647..b2a0724 100644
--- a/recipes-qt/qt5/qtcanvas3d_git.bb
+++ b/recipes-qt/qt5/qtcanvas3d_git.bb
@@ -10,4 +10,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS = "qtdeclarative"
 
-SRCREV = "5962967a3712ee711fd9ab58da664a3eb0acb24e"
+SRCREV = "116737dc8fa244282dda95a8f13624b66fdb5521"
diff --git a/recipes-qt/qt5/qtcharts_git.bb b/recipes-qt/qt5/qtcharts_git.bb
index 1369dee..6b895aa 100644
--- a/recipes-qt/qt5/qtcharts_git.bb
+++ b/recipes-qt/qt5/qtcharts_git.bb
@@ -8,4 +8,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative qtmultimedia"
 
-SRCREV = "057b3e2d6a96b42b890a0d007a8801d260c3de48"
+SRCREV = "de7f741c428febfe3c81a28f955996d2314953fc"
diff --git a/recipes-qt/qt5/qtconnectivity_git.bb b/recipes-qt/qt5/qtconnectivity_git.bb
index de7764d..0d13dc4 100644
--- a/recipes-qt/qt5/qtconnectivity_git.bb
+++ b/recipes-qt/qt5/qtconnectivity_git.bb
@@ -4,13 +4,9 @@ require qt5-git.inc
 LICENSE = "GFDL-1.3 & BSD & ( GPL-3.0 & The-Qt-Company-GPL-Exception-1.0 | The-Qt-Company-Commercial ) & ( GPL-2.0+ | LGPL-3.0 | The-Qt-Company-Commercial )"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPL3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
-    file://LICENSE.LGPLv21;md5=4bfd28363f541b10d9f024181b8df516 \
-    file://LICENSE.LGPLv3;md5=e0459b45c5c4840b353141a8bbed91f0 \
     file://LICENSE.GPL2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
     file://LICENSE.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
     file://LICENSE.GPL3-EXCEPT;md5=763d8c535a234d9a3fb682c7ecb6c073 \
-    file://LICENSE.GPLv3;md5=88e2b9117e6be406b5ed6ee4ca99a705 \
-    file://LGPL_EXCEPTION.txt;md5=9625233da42f9e0ce9d63651a9d97654 \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
 "
 
@@ -23,4 +19,4 @@ PACKAGECONFIG[bluez] = "-feature-bluez,-no-feature-bluez,${BLUEZ}"
 
 EXTRA_QMAKEVARS_CONFIGURE += "${PACKAGECONFIG_CONFARGS}"
 
-SRCREV = "1afb57ed92a25bbc000ea4c4d7662cb8b9e267ee"
+SRCREV = "8dcbf68e4579e03ea6d2808ac0c670169b59d0df"
diff --git a/recipes-qt/qt5/qtdatavis3d_git.bb b/recipes-qt/qt5/qtdatavis3d_git.bb
index 7d6a51f..0cbd04e 100644
--- a/recipes-qt/qt5/qtdatavis3d_git.bb
+++ b/recipes-qt/qt5/qtdatavis3d_git.bb
@@ -8,4 +8,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative qtmultimedia qtxmlpatterns"
 
-SRCREV = "a78f8d6bef57dd4283094a52551705ee02909970"
+SRCREV = "84490ff75be5acdaeb3fd93900e4ebf7ba8f539b"
diff --git a/recipes-qt/qt5/qtdeclarative/0002-Fix-memory-leak-in-V4.patch b/recipes-qt/qt5/qtdeclarative/0002-Fix-memory-leak-in-V4.patch
deleted file mode 100644
index 423681e..0000000
--- a/recipes-qt/qt5/qtdeclarative/0002-Fix-memory-leak-in-V4.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 80e63c5a2981473dd7ee3a4f382e54948bb99f75 Mon Sep 17 00:00:00 2001
-From: Gunnar Sletta <gunnar@crimson.no>
-Date: Thu, 19 Jan 2017 09:05:46 +0100
-Subject: [PATCH 2/3] Fix memory leak in V4
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Transitions contain both an id and a set of flags, but the sorting
-failed to take the flags into account in the operator<. As a result
-we would some times end up with duplicate entries if the same id
-was added multiple times with different flags.
-
-If the same id was added again and again with varying flags, this
-could lead to an ever expanding list filled with duplicate entries.
-
-Fix this by also taking flags into account in operator< so that
-operator< and operator== are symetric and the list gets correctly
-sorted.
-
-Change-Id: I762ec3f0c5b4ed9a1aecb9a883187a0445491591
-Reviewed-by: Simon Hausmann <simon.hausmann@qt.io>
-Reviewed-by: Robin Burchell <robin.burchell@crimson.no>
-Signed-off-by: Gordan Markuš <gordan.markus@pelagicore.com>
----
- src/qml/jsruntime/qv4internalclass_p.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/qml/jsruntime/qv4internalclass_p.h b/src/qml/jsruntime/qv4internalclass_p.h
-index dcda949..1d8ef4b 100644
---- a/src/qml/jsruntime/qv4internalclass_p.h
-+++ b/src/qml/jsruntime/qv4internalclass_p.h
-@@ -234,7 +234,7 @@ struct InternalClassTransition
-     { return id == other.id && flags == other.flags; }
- 
-     bool operator<(const InternalClassTransition &other) const
--    { return id < other.id; }
-+    { return id < other.id || (id == other.id && flags < other.flags); }
- };
- 
- struct InternalClass : public QQmlJS::Managed {
--- 
-2.9.3
-
diff --git a/recipes-qt/qt5/qtdeclarative/0003-fix-memory-leak-in-QQuickWindowPrivate-deliverTouchA.patch b/recipes-qt/qt5/qtdeclarative/0003-fix-memory-leak-in-QQuickWindowPrivate-deliverTouchA.patch
deleted file mode 100644
index 79a48f5..0000000
--- a/recipes-qt/qt5/qtdeclarative/0003-fix-memory-leak-in-QQuickWindowPrivate-deliverTouchA.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-From 6aa9001064c19e75e58c830eedc583e2342a7f20 Mon Sep 17 00:00:00 2001
-From: Shawn Rutledge <shawn.rutledge@qt.io>
-Date: Wed, 1 Feb 2017 12:06:26 +0100
-Subject: [PATCH 3/3] fix memory leak in
- QQuickWindowPrivate::deliverTouchAsMouse
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-A QTouchEvent is allocated with a reduced subset of TouchPoints for
-each Item to which we attempt to deliver it, and thrown away afterwards.
-(Ιt's not efficient to heap-allocate it, but we can't avoid doing it
-at all without changing behavior.)  So now it's stored in a QScopedPointer.
-
-Change-Id: I48badb493610d0a715e582a2eedae95e2006eb2b
-Reviewed-by: Jan Arve Sæther <jan-arve.saether@qt.io>
-Signed-off-by: Gordan Markuš <gordan.markus@pelagicore.com>
----
- src/quick/items/qquickwindow.cpp | 14 +++++++-------
- 1 file changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/src/quick/items/qquickwindow.cpp b/src/quick/items/qquickwindow.cpp
-index 1297dde..c130aec 100644
---- a/src/quick/items/qquickwindow.cpp
-+++ b/src/quick/items/qquickwindow.cpp
-@@ -629,8 +629,8 @@ bool QQuickWindowPrivate::deliverTouchAsMouse(QQuickItem *item, QQuickPointerEve
- 
-     // FIXME: make this work for mouse events too and get rid of the asTouchEvent in here.
-     Q_ASSERT(pointerEvent->asPointerTouchEvent());
--    QTouchEvent *event = pointerEvent->asPointerTouchEvent()->touchEventForItem(item);
--    if (!event)
-+    QScopedPointer<QTouchEvent> event(pointerEvent->asPointerTouchEvent()->touchEventForItem(item));
-+    if (event.isNull())
-         return false;
- 
-     // For each point, check if it is accepted, if not, try the next point.
-@@ -647,7 +647,7 @@ bool QQuickWindowPrivate::deliverTouchAsMouse(QQuickItem *item, QQuickPointerEve
-                 break;
- 
-             qCDebug(DBG_TOUCH_TARGET) << "TP (mouse)" << p.id() << "->" << item;
--            QScopedPointer<QMouseEvent> mousePress(touchToMouseEvent(QEvent::MouseButtonPress, p, event, item, false));
-+            QScopedPointer<QMouseEvent> mousePress(touchToMouseEvent(QEvent::MouseButtonPress, p, event.data(), item, false));
- 
-             // Send a single press and see if that's accepted
-             QCoreApplication::sendEvent(item, mousePress.data());
-@@ -661,7 +661,7 @@ bool QQuickWindowPrivate::deliverTouchAsMouse(QQuickItem *item, QQuickPointerEve
-                 pointerEventPoint->setGrabber(item);
- 
-                 if (checkIfDoubleClicked(event->timestamp())) {
--                    QScopedPointer<QMouseEvent> mouseDoubleClick(touchToMouseEvent(QEvent::MouseButtonDblClick, p, event, item, false));
-+                    QScopedPointer<QMouseEvent> mouseDoubleClick(touchToMouseEvent(QEvent::MouseButtonDblClick, p, event.data(), item, false));
-                     QCoreApplication::sendEvent(item, mouseDoubleClick.data());
-                     event->setAccepted(mouseDoubleClick->isAccepted());
-                     if (!mouseDoubleClick->isAccepted()) {
-@@ -678,7 +678,7 @@ bool QQuickWindowPrivate::deliverTouchAsMouse(QQuickItem *item, QQuickPointerEve
-         } else if (touchMouseDevice == device && p.id() == touchMouseId) {
-             if (p.state() & Qt::TouchPointMoved) {
-                 if (QQuickItem *mouseGrabberItem = q->mouseGrabberItem()) {
--                    QScopedPointer<QMouseEvent> me(touchToMouseEvent(QEvent::MouseMove, p, event, mouseGrabberItem, false));
-+                    QScopedPointer<QMouseEvent> me(touchToMouseEvent(QEvent::MouseMove, p, event.data(), mouseGrabberItem, false));
-                     QCoreApplication::sendEvent(item, me.data());
-                     event->setAccepted(me->isAccepted());
-                     if (me->isAccepted()) {
-@@ -689,7 +689,7 @@ bool QQuickWindowPrivate::deliverTouchAsMouse(QQuickItem *item, QQuickPointerEve
-                     // no grabber, check if we care about mouse hover
-                     // FIXME: this should only happen once, not recursively... I'll ignore it just ignore hover now.
-                     // hover for touch???
--                    QScopedPointer<QMouseEvent> me(touchToMouseEvent(QEvent::MouseMove, p, event, item, false));
-+                    QScopedPointer<QMouseEvent> me(touchToMouseEvent(QEvent::MouseMove, p, event.data(), item, false));
-                     if (lastMousePosition.isNull())
-                         lastMousePosition = me->windowPos();
-                     QPointF last = lastMousePosition;
-@@ -707,7 +707,7 @@ bool QQuickWindowPrivate::deliverTouchAsMouse(QQuickItem *item, QQuickPointerEve
-             } else if (p.state() & Qt::TouchPointReleased) {
-                 // currently handled point was released
-                 if (QQuickItem *mouseGrabberItem = q->mouseGrabberItem()) {
--                    QScopedPointer<QMouseEvent> me(touchToMouseEvent(QEvent::MouseButtonRelease, p, event, mouseGrabberItem, false));
-+                    QScopedPointer<QMouseEvent> me(touchToMouseEvent(QEvent::MouseButtonRelease, p, event.data(), mouseGrabberItem, false));
-                     QCoreApplication::sendEvent(item, me.data());
- 
-                     if (item->acceptHoverEvents() && p.screenPos() != QGuiApplicationPrivate::lastCursorPosition) {
--- 
-2.9.3
-
diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/qtdeclarative_git.bb
index c19bbd5..a578a06 100644
--- a/recipes-qt/qt5/qtdeclarative_git.bb
+++ b/recipes-qt/qt5/qtdeclarative_git.bb
@@ -4,20 +4,14 @@ require qt5-git.inc
 LICENSE = "GFDL-1.3 & BSD & ( GPL-3.0 & The-Qt-Company-GPL-Exception-1.0 | The-Qt-Company-Commercial ) & ( GPL-2.0+ | LGPL-3.0 | The-Qt-Company-Commercial )"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPL3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
-    file://LICENSE.LGPLv21;md5=4bfd28363f541b10d9f024181b8df516 \
-    file://LICENSE.LGPLv3;md5=e0459b45c5c4840b353141a8bbed91f0 \
     file://LICENSE.GPL2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
     file://LICENSE.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
     file://LICENSE.GPL3-EXCEPT;md5=763d8c535a234d9a3fb682c7ecb6c073 \
-    file://LICENSE.GPLv3;md5=88e2b9117e6be406b5ed6ee4ca99a705 \
-    file://LGPL_EXCEPTION.txt;md5=9625233da42f9e0ce9d63651a9d97654 \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
 "
 
 SRC_URI += " \
     file://0001-Fix-QQmlExpression-leaking-QQmlError-objects.patch \
-    file://0002-Fix-memory-leak-in-V4.patch \
-    file://0003-fix-memory-leak-in-QQuickWindowPrivate-deliverTouchA.patch \
 "
 
 DEPENDS += "qtbase"
@@ -38,6 +32,6 @@ do_install_append_class-nativesdk() {
 
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'qtxmlpatterns', 'CONFIG+=OE_QTXMLPATTERNS_ENABLED', '', d)}"
 
-SRCREV = "fffb997e192a72b4dcd66edc2fbad5473dd359f3"
+SRCREV = "96f6ba5f562073f508cd8569ac354592fdd48f4a"
 
 BBCLASSEXTEND =+ "native nativesdk"
diff --git a/recipes-qt/qt5/qtenginio_git.bb b/recipes-qt/qt5/qtenginio_git.bb
index 2f32a88..8b4fb71 100644
--- a/recipes-qt/qt5/qtenginio_git.bb
+++ b/recipes-qt/qt5/qtenginio_git.bb
@@ -15,8 +15,3 @@ DEPENDS += "qtbase qtdeclarative qtxmlpatterns"
 QT_MODULE_BRANCH = "dev"
 SRCREV = "0555cf73c8b5abd41d8a4ff02457315c9e7c667d"
 
-do_install_append() {
-    if ls ${D}${libdir}/pkgconfig/Enginio.pc >/dev/null 2>/dev/null; then
-        sed -i "s@-L${STAGING_LIBDIR}@-L\${libdir}@g" ${D}${libdir}/pkgconfig/Enginio.pc
-    fi
-}
diff --git a/recipes-qt/qt5/qtgamepad_git.bb b/recipes-qt/qt5/qtgamepad_git.bb
index 6abf8b7..94f04a4 100644
--- a/recipes-qt/qt5/qtgamepad_git.bb
+++ b/recipes-qt/qt5/qtgamepad_git.bb
@@ -14,4 +14,4 @@ PACKAGECONFIG[sdl2] = "-feature-sdl2,-no-feature-sdl2,libsdl2"
 
 EXTRA_QMAKEVARS_CONFIGURE += "${PACKAGECONFIG_CONFARGS}"
 
-SRCREV = "13bbe6ea378d127b9b1d70e2858e41e86e754dc7"
+SRCREV = "ef8850fee38e2552d535379a8477c9abebdf8bb4"
diff --git a/recipes-qt/qt5/qtgraphicaleffects_git.bb b/recipes-qt/qt5/qtgraphicaleffects_git.bb
index f4b43e7..d98d77e 100644
--- a/recipes-qt/qt5/qtgraphicaleffects_git.bb
+++ b/recipes-qt/qt5/qtgraphicaleffects_git.bb
@@ -19,4 +19,4 @@ DEPENDS += "qtdeclarative"
 
 RDEPENDS_${PN}-dev = ""
 
-SRCREV = "1583bb5569cfc50141d879107a46146d5ccccf28"
+SRCREV = "db93af5b2bb49af74fbad6c9cd80bd7010434e78"
diff --git a/recipes-qt/qt5/qtimageformats_git.bb b/recipes-qt/qt5/qtimageformats_git.bb
index 3725441..4dd64df 100644
--- a/recipes-qt/qt5/qtimageformats_git.bb
+++ b/recipes-qt/qt5/qtimageformats_git.bb
@@ -26,4 +26,4 @@ PACKAGECONFIG[libwebp] = ",CONFIG+=done_config_libwebp,libwebp"
 
 EXTRA_QMAKEVARS_PRE += "${PACKAGECONFIG_CONFARGS}"
 
-SRCREV = "cd2de115c6216ad747cf4803e65a4ce4af220795"
+SRCREV = "71ccf0dff82835ce7b5aed74c37829afdef44cde"
diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/qtlocation_git.bb
index f25d57e..af29576 100644
--- a/recipes-qt/qt5/qtlocation_git.bb
+++ b/recipes-qt/qt5/qtlocation_git.bb
@@ -20,4 +20,11 @@ PACKAGECONFIG[gypsy] = "-feature-gypsy,-no-feature-gypsy,gconf gypsy"
 
 EXTRA_QMAKEVARS_CONFIGURE += "${PACKAGECONFIG_CONFARGS}"
 
-SRCREV = "41cc347040226d2c5c16b9df001d03f2724b87e5"
+SRC_URI += " \
+    ${QT_GIT}/qtlocation-mapboxgl.git;name=qtlocation-mapboxgl;branch=upstream/qt-staging;protocol=${QT_GIT_PROTOCOL};destsuffix=git/src/3rdparty/mapbox-gl-native \
+    "
+
+SRCREV_qtlocation = "888d351cb0c7fe6d05ab1efe8d4dbb4b6f06cd5f"
+SRCREV_qtlocation-mapboxgl = "d45c177e8a23eefcc94930af9fa085e61136bb94"
+
+SRCREV_FORMAT = "qtlocation_qtlocation-mapboxgl"
diff --git a/recipes-qt/qt5/qtmultimedia_git.bb b/recipes-qt/qt5/qtmultimedia_git.bb
index 7d3c3cc..c1ae786 100644
--- a/recipes-qt/qt5/qtmultimedia_git.bb
+++ b/recipes-qt/qt5/qtmultimedia_git.bb
@@ -4,13 +4,9 @@ require qt5-git.inc
 LICENSE = "GFDL-1.3 & BSD & ( GPL-3.0 & The-Qt-Company-GPL-Exception-1.0 | The-Qt-Company-Commercial ) & ( GPL-2.0+ | LGPL-3.0 | The-Qt-Company-Commercial )"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPL3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
-    file://LICENSE.LGPLv21;md5=4bfd28363f541b10d9f024181b8df516 \
-    file://LICENSE.LGPLv3;md5=e0459b45c5c4840b353141a8bbed91f0 \
     file://LICENSE.GPL2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
     file://LICENSE.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
     file://LICENSE.GPL3-EXCEPT;md5=763d8c535a234d9a3fb682c7ecb6c073 \
-    file://LICENSE.GPLv3;md5=88e2b9117e6be406b5ed6ee4ca99a705 \
-    file://LGPL_EXCEPTION.txt;md5=9625233da42f9e0ce9d63651a9d97654 \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
 "
 
@@ -33,4 +29,4 @@ SRC_URI += "\
     file://0001-qtmultimedia-fix-a-conflicting-declaration.patch \
 "
 
-SRCREV = "544a8a4251ff9694780e563ddb6e4af1325e0115"
+SRCREV = "559c305ded730e23505e8b29536a98dc59e2acfa"
diff --git a/recipes-qt/qt5/qtnetworkauth_git.bb b/recipes-qt/qt5/qtnetworkauth_git.bb
index 5657c86..eb5e4f6 100644
--- a/recipes-qt/qt5/qtnetworkauth_git.bb
+++ b/recipes-qt/qt5/qtnetworkauth_git.bb
@@ -1,7 +1,6 @@
 LICENSE = "BSD & GPL-3.0 & The-Qt-Company-GPL-Exception-1.0 | The-Qt-Company-Commercial"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
-    file://LICENSE.GPLv3;md5=88e2b9117e6be406b5ed6ee4ca99a705 \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
 "
 
@@ -10,4 +9,4 @@ require qt5-git.inc
 
 DEPENDS += "qtbase"
 
-SRCREV = "ec7663382bc6382323f3261ab199ec2edbeb5e37"
+SRCREV = "86c5036848ad004208803d9d497cfcd08c9623d6"
diff --git a/recipes-qt/qt5/qtquick1_git.bb b/recipes-qt/qt5/qtquick1_git.bb
index e9b6185..2f16a36 100644
--- a/recipes-qt/qt5/qtquick1_git.bb
+++ b/recipes-qt/qt5/qtquick1_git.bb
@@ -23,4 +23,4 @@ do_configure_prepend() {
 }
 
 QT_MODULE_BRANCH = "dev"
-SRCREV = "64faeb0d8003e699a4d09e7dcee1ef6eb10302ad"
+SRCREV = "695460401d9a89d2f156016d51601b2e59b64105"
diff --git a/recipes-qt/qt5/qtquickcontrols2_git.bb b/recipes-qt/qt5/qtquickcontrols2_git.bb
index 42acb8a..a84cfb3 100644
--- a/recipes-qt/qt5/qtquickcontrols2_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols2_git.bb
@@ -4,10 +4,10 @@ require qt5-git.inc
 LICENSE = "GFDL-1.3 & BSD & LGPL-3.0 | GPL-3.0"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
-    file://LICENSE.LGPLv3;md5=a37e6cd7102174853307e03e6edc5f30 \
-    file://LICENSE.GPLv3;md5=88e2b9117e6be406b5ed6ee4ca99a705 \
+    file://LICENSE.LGPLv3;md5=382747d0119037529ec2b98b24038eb0 \
+    file://LICENSE.GPLv3;md5=dce746aa5261707df6d6999ab9958d8b \
 "
 
 DEPENDS += "qtdeclarative"
 
-SRCREV = "6f7852a307c7ebbdb3b6efa00cbf7626b072bbc1"
+SRCREV = "ef6b8d3081f0bf93d6d59e67c8e3f82c63c511c3"
diff --git a/recipes-qt/qt5/qtquickcontrols_git.bb b/recipes-qt/qt5/qtquickcontrols_git.bb
index 69f3d3b..83ed908 100644
--- a/recipes-qt/qt5/qtquickcontrols_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols_git.bb
@@ -17,8 +17,13 @@ DEPENDS += "qtdeclarative"
 
 RDEPENDS_${PN}-dev = ""
 
+FILES_${PN}-qmlplugins += " \
+  ${OE_QMAKE_PATH_QML}/QtQuick/Controls/Shaders \
+  ${OE_QMAKE_PATH_QML}/QtQuick/Dialogs/qml/icons.ttf \
+"
+
 SRC_URI += " \
     file://0001-texteditor-fix-invalid-use-of-incomplete-type-class-.patch \
 "
 
-SRCREV = "201c86391c7ff78d570fdec6e0c0b71eb1e9aae4"
+SRCREV = "dacb91916b202208681471ba764504c7c7d086f0"
diff --git a/recipes-qt/qt5/qtremoteobjects_git.bb b/recipes-qt/qt5/qtremoteobjects_git.bb
new file mode 100644
index 0000000..550e030
--- /dev/null
+++ b/recipes-qt/qt5/qtremoteobjects_git.bb
@@ -0,0 +1,14 @@
+LICENSE = "BSD & ( GPL-3.0 & The-Qt-Company-GPL-Exception-1.0 ) & ( GPL-2.0+ | LGPL-3.0 ) | The-Qt-Company-Commercial"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE.GPL2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+    file://LICENSE.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
+    file://LICENSE.GPL3-EXCEPT;md5=763d8c535a234d9a3fb682c7ecb6c073 \
+    file://LICENSE.LGPL3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
+"
+
+require qt5.inc
+require qt5-git.inc
+
+DEPENDS += "qtbase qtdeclarative"
+
+SRCREV = "ae0b101884b05355e3a7bc06dbca722ad3d08d0f"
diff --git a/recipes-qt/qt5/qtscript_git.bb b/recipes-qt/qt5/qtscript_git.bb
index 3f8b64a..ae5e0da 100644
--- a/recipes-qt/qt5/qtscript_git.bb
+++ b/recipes-qt/qt5/qtscript_git.bb
@@ -25,4 +25,4 @@ ARM_INSTRUCTION_SET_armv5 = "arm"
 
 DEPENDS += "qtbase"
 
-SRCREV = "c35df2ec0ee05351912e768d298a7c627dbdd1ef"
+SRCREV = "e00ca9b6bec2adf78fd14e02376ecf1b55a93b0c"
diff --git a/recipes-qt/qt5/qtscxml_git.bb b/recipes-qt/qt5/qtscxml_git.bb
index d69d00f..c2c00e1 100644
--- a/recipes-qt/qt5/qtscxml_git.bb
+++ b/recipes-qt/qt5/qtscxml_git.bb
@@ -10,7 +10,7 @@ require qt5-git.inc
 
 DEPENDS += "qtbase qtdeclarative qtxmlpatterns qtscxml-native"
 
-SRCREV = "4704292500b98143eee9b0fb0b6a34a858ed1253"
+SRCREV = "eff82ac957e051f16f64c287f2dfaec9049bdfc1"
 
 SRC_URI += "file://0001-Use-external-host-bin-path-for-cmake-file.patch"
 
diff --git a/recipes-qt/qt5/qtsensors_git.bb b/recipes-qt/qt5/qtsensors_git.bb
index 93a0971..17d0639 100644
--- a/recipes-qt/qt5/qtsensors_git.bb
+++ b/recipes-qt/qt5/qtsensors_git.bb
@@ -13,4 +13,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative"
 
-SRCREV = "1220a31e6c2f91b34b4a05773621dddab8c4315a"
+SRCREV = "0c3c4d01ea34ed98a0d2928662f07b673f00535d"
diff --git a/recipes-qt/qt5/qtserialbus_git.bb b/recipes-qt/qt5/qtserialbus_git.bb
index 325d975..93a826b 100644
--- a/recipes-qt/qt5/qtserialbus_git.bb
+++ b/recipes-qt/qt5/qtserialbus_git.bb
@@ -11,4 +11,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtserialport"
 
-SRCREV = "c8fe92ef54b2d310e8c8c143962fd6f43bf46c27"
+SRCREV = "20811e3b004af817e3f02982c755e8b1560b8c3d"
diff --git a/recipes-qt/qt5/qtserialport_git.bb b/recipes-qt/qt5/qtserialport_git.bb
index edecc04..957000c 100644
--- a/recipes-qt/qt5/qtserialport_git.bb
+++ b/recipes-qt/qt5/qtserialport_git.bb
@@ -15,4 +15,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "74aad2578ecb6739007449a06a54dd7abd64c85b"
+SRCREV = "687f5a9bd44a45a29d24925f29470c43d6729dee"
diff --git a/recipes-qt/qt5/qtsvg_git.bb b/recipes-qt/qt5/qtsvg_git.bb
index 24a0d91..fb8d44e 100644
--- a/recipes-qt/qt5/qtsvg_git.bb
+++ b/recipes-qt/qt5/qtsvg_git.bb
@@ -12,4 +12,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "1b3a7ae14d25f1caa3f6bedad3cfeb7d83b3904e"
+SRCREV = "4fd787e90c70afbaa168abb3efdb8757ba77f3a4"
diff --git a/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch b/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch
deleted file mode 100644
index 17d5d51..0000000
--- a/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 95a418157ce5f49052ec1c349581d1811a79c9eb Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Fri, 17 Jan 2014 14:33:19 +0100
-Subject: [PATCH] assistant/help: fix linking of dependent libraries
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-else we get:
-| ...ld: warning: libQt5CLucene.so.5, needed by ...libQt5Help.so, not found (try using -rpath or -rpath-link)
-| ...undefined reference to `QCLucenePhraseQuery::getTerms() const'
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- src/assistant/help/help.pro | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/assistant/help/help.pro b/src/assistant/help/help.pro
-index 37d5ba4..8de8763 100644
---- a/src/assistant/help/help.pro
-+++ b/src/assistant/help/help.pro
-@@ -60,3 +60,5 @@ HEADERS += qhelpsearchindexwriter_clucene_p.h \
-     qhelpsearchindexreader_clucene_p.h
- 
- load(qt_module)
-+
-+LIBS += -lQt5CLucene
diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/qttools_git.bb
index 5c0f51c..9ca90a2 100644
--- a/recipes-qt/qt5/qttools_git.bb
+++ b/recipes-qt/qt5/qttools_git.bb
@@ -4,13 +4,9 @@ require qt5-git.inc
 LICENSE = "GFDL-1.3 & BSD & ( GPL-3.0 & The-Qt-Company-GPL-Exception-1.0 | The-Qt-Company-Commercial ) & ( GPL-2.0+ | LGPL-3.0 | The-Qt-Company-Commercial )"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPL3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
-    file://LICENSE.LGPLv21;md5=fb91571854638f10b2e5f36562661a5a \
-    file://LICENSE.LGPLv3;md5=a909b94c1c9674b2aa15ff03a86f518a \
     file://LICENSE.GPL2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
     file://LICENSE.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
     file://LICENSE.GPL3-EXCEPT;md5=763d8c535a234d9a3fb682c7ecb6c073 \
-    file://LICENSE.GPLv3;md5=bfdd8aa675169432d6d9b63d056de148 \
-    file://LGPL_EXCEPTION.txt;md5=9625233da42f9e0ce9d63651a9d97654 \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
 "
 
@@ -20,8 +16,6 @@ DEPENDS += "qtbase qtdeclarative qtxmlpatterns"
 
 SRC_URI += " \
     file://run-ptest \
-    file://0002-assistant-help-fix-linking-of-dependent-libraries.patch \
-    file://0003-add-noqtwebkit-configuration.patch \
     file://0004-linguist-tools-cmake-allow-overriding-the-location-f.patch \
 "
 
@@ -33,7 +27,7 @@ PACKAGECONFIG[qtwebkit] = ",,qtwebkit"
 
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'qtwebkit', '', 'CONFIG+=noqtwebkit', d)}"
 
-SRCREV = "30c10900adecca55faa1d59c2f0caac74b1f9df6"
+SRCREV = "88e02bb0a9b97d68a4b270e4ddfb6d0847c702a9"
 
 BBCLASSEXTEND = "native nativesdk"
 
diff --git a/recipes-qt/qt5/qttranslations_git.bb b/recipes-qt/qt5/qttranslations_git.bb
index 53ab199..822517f 100644
--- a/recipes-qt/qt5/qttranslations_git.bb
+++ b/recipes-qt/qt5/qttranslations_git.bb
@@ -114,4 +114,4 @@ FILES_${PN}-qt = " \
     ${OE_QMAKE_PATH_TRANSLATIONS}/qt_*.qm \
 "
 
-SRCREV = "c0ae29b2328922f16cb2305f8579c2a869c871b0"
+SRCREV = "3e727a890f7856978469ee38ef0619b1b59a8ca7"
diff --git a/recipes-qt/qt5/qtvirtualkeyboard_git.bb b/recipes-qt/qt5/qtvirtualkeyboard_git.bb
index 08914b1..6d45a50 100644
--- a/recipes-qt/qt5/qtvirtualkeyboard_git.bb
+++ b/recipes-qt/qt5/qtvirtualkeyboard_git.bb
@@ -49,4 +49,4 @@ FILES_${PN} += "${OE_QMAKE_PATH_DATA}/qtvirtualkeyboard/lipi_toolkit"
 
 DEPENDS += "qtbase qtdeclarative qtmultimedia qtquickcontrols qtsvg qtxmlpatterns"
 
-SRCREV = "cfa4ab4cbf13971d4b71ee920353822755a3bf31"
+SRCREV = "bdf61afe76e94ef03da1332c4540646f18f5852f"
diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
index bcddb32..26ef853 100644
--- a/recipes-qt/qt5/qtwayland_git.bb
+++ b/recipes-qt/qt5/qtwayland_git.bb
@@ -7,13 +7,9 @@ DEPENDS_append_class-target = " libxkbcommon"
 LICENSE = "GFDL-1.3 & BSD & ( GPL-3.0 & The-Qt-Company-GPL-Exception-1.0 | The-Qt-Company-Commercial ) & ( GPL-2.0+ | LGPL-3.0 | The-Qt-Company-Commercial )"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPL3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
-    file://LICENSE.LGPLv21;md5=4bfd28363f541b10d9f024181b8df516 \
-    file://LICENSE.LGPLv3;md5=e0459b45c5c4840b353141a8bbed91f0 \
     file://LICENSE.GPL2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
     file://LICENSE.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
     file://LICENSE.GPL3-EXCEPT;md5=763d8c535a234d9a3fb682c7ecb6c073 \
-    file://LICENSE.GPLv3;md5=88e2b9117e6be406b5ed6ee4ca99a705 \
-    file://LGPL_EXCEPTION.txt;md5=9625233da42f9e0ce9d63651a9d97654 \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
 "
 
@@ -41,7 +37,7 @@ PACKAGECONFIG[libhybris-egl-server] = "-feature-libhybris-egl-server,-no-feature
 
 EXTRA_QMAKEVARS_CONFIGURE += "${PACKAGECONFIG_CONFARGS}"
 
-SRCREV = "0e2a950895805457a45abe860bc91a7cc4ba405e"
+SRCREV = "f1cf62fa8e9ffa2548c9968906848596f50dbc0b"
 
 # From https://bugreports.qt.io/browse/QTBUG-57767
 SRC_URI += " \
diff --git a/recipes-qt/qt5/qtwebchannel_git.bb b/recipes-qt/qt5/qtwebchannel_git.bb
index d5f8685..f1167a9 100644
--- a/recipes-qt/qt5/qtwebchannel_git.bb
+++ b/recipes-qt/qt5/qtwebchannel_git.bb
@@ -17,4 +17,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtdeclarative qtwebsockets"
 
-SRCREV = "e3ddde4b26a72d57beeeed4e2d3384896e3a399d"
+SRCREV = "6383f0fc5eec4935697a6d2d2f87b511bbeb678e"
diff --git a/recipes-qt/qt5/qtwebengine/0001-Force-host-toolchain-configuration.patch b/recipes-qt/qt5/qtwebengine/0001-Force-host-toolchain-configuration.patch
new file mode 100644
index 0000000..130f3a3
--- /dev/null
+++ b/recipes-qt/qt5/qtwebengine/0001-Force-host-toolchain-configuration.patch
@@ -0,0 +1,69 @@
+From 5c879db32cde9bee9c9073842ecc281172f19453 Mon Sep 17 00:00:00 2001
+From: Samuli Piippo <samuli.piippo@qt.io>
+Date: Wed, 15 Mar 2017 13:53:28 +0200
+Subject: [PATCH] Force host toolchain configuration
+
+Force gcc/g++ to be used for parts using host toolchain, since
+the option(host_build) does not work in yocto builds.
+
+Upstream-Status: Inappropriate [OE specific]
+Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
+---
+ src/buildtools/configure_host.pro | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/src/buildtools/configure_host.pro b/src/buildtools/configure_host.pro
+index d8d731d..89dade4 100644
+--- a/src/buildtools/configure_host.pro
++++ b/src/buildtools/configure_host.pro
+@@ -16,9 +16,9 @@ GN_CONTENTS = \
+ "import(\"//build/config/sysroot.gni\")" \
+ "import(\"//build/toolchain/gcc_toolchain.gni\")" \
+ "gcc_toolchain(\"host\") {" \
+-"  cc = \"$$which($$QMAKE_CC)\" " \
+-"  cxx = \"$$which($$QMAKE_CXX)\" " \
+-"  ld = \"$$which($$QMAKE_LINK)\" " \
++"  cc = \"$$which(gcc)\" " \
++"  cxx = \"$$which(g++)\" " \
++"  ld = \"$$which(g++)\" " \
+ "  ar = \"$$which(ar)\" " \
+ "  nm = \"$$which(nm)\" " \
+ "  toolchain_args = { " \
+@@ -27,9 +27,9 @@ GN_CONTENTS = \
+ "  } " \
+ "}" \
+ "gcc_toolchain(\"v8_snapshot\") {" \
+-"  cc = \"$$which($$QMAKE_CC)\" " \
+-"  cxx = \"$$which($$QMAKE_CXX)\" " \
+-"  ld = \"$$which($$QMAKE_LINK)\" " \
++"  cc = \"$$which(gcc)\" " \
++"  cxx = \"$$which(g++)\" " \
++"  ld = \"$$which(g++)\" " \
+ "  ar = \"$$which(ar)\" " \
+ "  nm = \"$$which(nm)\" " \
+ "  toolchain_args = { " \
+diff --git a/src/3rdparty/chromium/tools/gn/bootstrap/bootstrap.py b/src/3rdparty/chromium/tools/gn/bootstrap/bootstrap.py
+index 75b9690..601f688 100755
+--- a/src/3rdparty/chromium/tools/gn/bootstrap/bootstrap.py
++++ b/src/3rdparty/chromium/tools/gn/bootstrap/bootstrap.py
+@@ -298,14 +298,14 @@ def write_gn_ninja(path, root_gen_dir, options):
+     ld = os.environ.get('LD', 'link.exe')
+     ar = os.environ.get('AR', 'lib.exe')
+   else:
+-    cc = os.environ.get('CC', 'cc')
+-    cxx = os.environ.get('CXX', 'c++')
++    cc = os.environ.get('CC_host', 'cc')
++    cxx = os.environ.get('CXX_host', 'c++')
+     ld = cxx
+-    ar = os.environ.get('AR', 'ar')
++    ar = os.environ.get('AR_host', 'ar')
+ 
+-  cflags = os.environ.get('CFLAGS', '').split()
+-  cflags_cc = os.environ.get('CXXFLAGS', '').split()
+-  ldflags = os.environ.get('LDFLAGS', '').split()
++  cflags = os.environ.get('CFLAGS_host', '').split()
++  cflags_cc = os.environ.get('CXXFLAGS_host', '').split()
++  ldflags = os.environ.get('LDFLAGS_host', '').split()
+   include_dirs = [root_gen_dir, SRC_ROOT]
+   libs = []
+ 
diff --git a/recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch b/recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch
deleted file mode 100644
index ccd43e2..0000000
--- a/recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From db56cd0fd185a9f3858f5aa6e95b24e63dee119f Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Fri, 3 Oct 2014 03:52:11 +0200
-Subject: [PATCH] <chromium> base.gypi: include atomicops_internals_x86_gcc.cc
- when building for x64 arch
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- src/3rdparty/chromium/base/base.gypi | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/3rdparty/chromium/base/base.gypi b/src/3rdparty/chromium/base/base.gypi
-index 63c3f76..331c975 100644
---- a/src/3rdparty/chromium/base/base.gypi
-+++ b/src/3rdparty/chromium/base/base.gypi
-@@ -801,7 +801,7 @@
-                 ['include', '^nix/'],
-               ],
-           }],
--          ['use_qt==1 and target_arch=="ia32"', {
-+          ['use_qt==1 and target_arch=="ia32" or target_arch=="x64"', {
-               'sources/': [
-                 ['include', 'atomicops_internals_x86_gcc.cc'],
-               ],
diff --git a/recipes-qt/qt5/qtwebengine/0001-chromium-workaround-for-too-long-.rps-file-name.patch b/recipes-qt/qt5/qtwebengine/0001-chromium-workaround-for-too-long-.rps-file-name.patch
new file mode 100644
index 0000000..42ceeac
--- /dev/null
+++ b/recipes-qt/qt5/qtwebengine/0001-chromium-workaround-for-too-long-.rps-file-name.patch
@@ -0,0 +1,42 @@
+From c72097e8790553771daf3231124c3fbe1a438379 Mon Sep 17 00:00:00 2001
+From: Samuli Piippo <samuli.piippo@qt.io>
+Date: Thu, 30 Mar 2017 11:37:24 +0300
+Subject: [PATCH] chromium: workaround for too long .rps file name
+
+Ninja may fail when the build directory is too long:
+
+ninja: error: WriteFile(__third_party_WebKit_Source_bindings_modules_\
+interfaces_info_individual_modules__home_qt_work_build_build-nitrogen\
+6x_tmp_work_cortexa9hf-neon-mx6qdl-poky-linux-gnueabi_qtwebengine_5.9\
+.0_gitAUTOINC_29afdb0a34_049134677a-r0_build_src_toolchain_target__ru\
+le.rsp): Unable to create file. File name too long
+
+Task-number: QTBUG-59769
+Change-Id: I73c5e64ae5174412be2a675e35b0b6047f2bf4c1
+---
+ src/3rdparty/chromium/tools/gn/ninja_action_target_writer.cc | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/src/3rdparty/chromium/tools/gn/ninja_action_target_writer.cc b/src/3rdparty/chromium/tools/gn/ninja_action_target_writer.cc
+index a5bc6cd..5cefbfe 100644
+--- a/src/3rdparty/chromium/tools/gn/ninja_action_target_writer.cc
++++ b/src/3rdparty/chromium/tools/gn/ninja_action_target_writer.cc
+@@ -115,9 +115,18 @@ std::string NinjaActionTargetWriter::WriteRuleDefinition() {
+     // strictly necessary for regular one-shot actions, but it's easier to
+     // just always define unique_name.
+     std::string rspfile = custom_rule_name;
++
++    //quick workaround if filename length > 255 - ".rsp", just cut the dirs starting from the end
++    //please note ".$unique_name" is not used at the moment
++    int pos = 0;
++    std::string delimiter("_");
++    while (rspfile.length() > 251 && (pos = rspfile.find_last_of(delimiter)) != std::string::npos)
++        rspfile = rspfile.substr(0,pos);
++
+     if (!target_->sources().empty())
+       rspfile += ".$unique_name";
+     rspfile += ".rsp";
++
+     out_ << "  rspfile = " << rspfile << std::endl;
+ 
+     // Response file contents.
diff --git a/recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch b/recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
deleted file mode 100644
index b7bd5a4..0000000
--- a/recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 793db05d66b7a92ebe069dc76093487489dd8b69 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Mon, 30 Jun 2014 20:08:17 +0200
-Subject: [PATCH] functions.prf: Don't match QMAKE_EXT_CPP or QMAKE_EXT_H
- anywhere in path, but at the end
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- tools/qmake/mkspecs/features/functions.prf | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/tools/qmake/mkspecs/features/functions.prf b/tools/qmake/mkspecs/features/functions.prf
-index 20fb278..7aa0b4a 100644
---- a/tools/qmake/mkspecs/features/functions.prf
-+++ b/tools/qmake/mkspecs/features/functions.prf
-@@ -168,9 +168,9 @@ defineReplace(mocOutput) {
-   out = $$1
-   # The order is important, since the output of the second replace would end up accidentaly transformed by the first one
-   for(ext, $$list($${QMAKE_EXT_CPP})): \
--      out = $$replace(out, ^(.*)($$re_escape($${ext})), $${QMAKE_CPP_MOD_MOC}\\1$${QMAKE_EXT_CPP_MOC})
-+      out = $$replace(out, ^(.*)($$re_escape($${ext}))$, $${QMAKE_CPP_MOD_MOC}\\1$${QMAKE_EXT_CPP_MOC})
-   for(ext, $$list($${QMAKE_EXT_H})): \
--      out = $$replace(out, ^(.*)($$re_escape($${ext})), $${QMAKE_H_MOD_MOC}\\1$${first(QMAKE_EXT_CPP)})
-+      out = $$replace(out, ^(.*)($$re_escape($${ext}))$, $${QMAKE_H_MOD_MOC}\\1$${first(QMAKE_EXT_CPP)})
-   return($$out)
- }
- 
diff --git a/recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch b/recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch
deleted file mode 100644
index e487c6a..0000000
--- a/recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From aa5bb11072bc0e441dc6533f53ed5359c5000088 Mon Sep 17 00:00:00 2001
-From: Simon Busch <morphis@gravedo.de>
-Date: Tue, 18 Nov 2014 10:38:18 +0100
-Subject: [PATCH] functions.prf: Make sure we only use the file name to
- generate it's moc'ed abbreviation
-
-Signed-off-by: Simon Busch <morphis@gravedo.de>
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- tools/qmake/mkspecs/features/functions.prf | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/tools/qmake/mkspecs/features/functions.prf b/tools/qmake/mkspecs/features/functions.prf
-index 7aa0b4a..9b3a639 100644
---- a/tools/qmake/mkspecs/features/functions.prf
-+++ b/tools/qmake/mkspecs/features/functions.prf
-@@ -165,7 +165,8 @@ defineReplace(findIncludedMocFiles) {
- }
- 
- defineReplace(mocOutput) {
--  out = $$1
-+  in = $$1
-+  out = $$basename(in)
-   # The order is important, since the output of the second replace would end up accidentaly transformed by the first one
-   for(ext, $$list($${QMAKE_EXT_CPP})): \
-       out = $$replace(out, ^(.*)($$re_escape($${ext}))$, $${QMAKE_CPP_MOD_MOC}\\1$${QMAKE_EXT_CPP_MOC})
diff --git a/recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch b/recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch
deleted file mode 100644
index 786a383..0000000
--- a/recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 6918d25c54ec4bc17a9b612c0d24b0f01be3aca1 Mon Sep 17 00:00:00 2001
-From: Frieder Schrempf <frieder.schrempf@online.de>
-Date: Mon, 1 Dec 2014 14:34:40 +0000
-Subject: [PATCH] functions.prf: allow build for linux-oe-g++ platform
-
-Upstream-Status: Inappropriate [OE specific]
-
-Signed-off-by: Frieder Schrempf <frieder.schrempf@online.de>
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- tools/qmake/mkspecs/features/functions.prf | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/tools/qmake/mkspecs/features/functions.prf b/tools/qmake/mkspecs/features/functions.prf
-index 9b3a639..dc5ed1c 100644
---- a/tools/qmake/mkspecs/features/functions.prf
-+++ b/tools/qmake/mkspecs/features/functions.prf
-@@ -5,6 +5,12 @@ defineTest(isPlatformSupported) {
-       return(false)
-     }
-     gcc:!clang:!isGCCVersionSupported(): return(false)
-+  } else:linux-oe-g++* {
-+    !gcc:!clang {
-+      skipBuild("Qt WebEngine on Linux requires clang or GCC.")
-+      return(false)
-+    }
-+    gcc:!clang:!isGCCVersionSupported(): return(false)
-   } else:win32 {
-     winrt {
-       skipBuild("WinRT is not supported.")
diff --git a/recipes-qt/qt5/qtwebengine/0004-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch b/recipes-qt/qt5/qtwebengine/0004-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch
deleted file mode 100644
index d10ddf7..0000000
--- a/recipes-qt/qt5/qtwebengine/0004-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From 6ed60f35761ab268004727be544e9ccf70594211 Mon Sep 17 00:00:00 2001
-From: Cleiton Bueno <cleitonrbueno@gmail.com>
-Date: Fri, 25 Dec 2015 18:16:05 -0200
-Subject: [PATCH] WebEngine qquickwebengineview_p_p.h add include QColor
-
-Signed-off-by: Cleiton Bueno <cleitonrbueno@gmail.com>
----
- src/webengine/api/qquickwebengineview_p_p.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/webengine/api/qquickwebengineview_p_p.h b/src/webengine/api/qquickwebengineview_p_p.h
-index f13bfd0..0e12244 100644
---- a/src/webengine/api/qquickwebengineview_p_p.h
-+++ b/src/webengine/api/qquickwebengineview_p_p.h
-@@ -60,6 +60,8 @@
- #include <QString>
- #include <QtCore/qcompilerdetection.h>
- #include <QtGui/qaccessibleobject.h>
-+#include <QColor>
-+
- 
- namespace QtWebEngineCore {
- class WebContentsAdapter;
diff --git a/recipes-qt/qt5/qtwebengine/0005-Include-dependency-to-QCoreApplication-translate.patch b/recipes-qt/qt5/qtwebengine/0005-Include-dependency-to-QCoreApplication-translate.patch
deleted file mode 100644
index 27bd141..0000000
--- a/recipes-qt/qt5/qtwebengine/0005-Include-dependency-to-QCoreApplication-translate.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From 4105c12d6f91171934f60b4dbb74b1ca7a9a3eb2 Mon Sep 17 00:00:00 2001
-From: Cleiton Bueno <cleitonrbueno@gmail.com>
-Date: Thu, 24 Dec 2015 15:59:51 -0200
-Subject: [PATCH] Include dependency to QCoreApplication::translate()
-
-Signed-off-by: Cleiton Bueno <cleitonrbueno@gmail.com>
----
- src/core/media_capture_devices_dispatcher.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/core/media_capture_devices_dispatcher.h b/src/core/media_capture_devices_dispatcher.h
-index b13a9da..8a54cce 100644
---- a/src/core/media_capture_devices_dispatcher.h
-+++ b/src/core/media_capture_devices_dispatcher.h
-@@ -46,6 +46,8 @@
- #include <map>
- #include <QtCore/qcompilerdetection.h>
- 
-+#include <QCoreApplication>
-+
- #include "web_contents_adapter_client.h"
- 
- #include "base/callback.h"
diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index deb336f..26d2e28 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -14,6 +14,7 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += " \
     ninja-native \
+    yasm-native \
     qtwebchannel \
     qtbase qtdeclarative qtxmlpatterns qtquickcontrols \
     qtlocation \
@@ -23,12 +24,12 @@ DEPENDS += " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa-lib', '', d)} \
 "
 
-DEPENDS += "yasm-native"
 EXTRA_QMAKEVARS_PRE += "GYP_CONFIG+=use_system_yasm GYP_CONFIG+=generate_character_data=0"
+EXTRA_QMAKEVARS_CONFIGURE += "-feature-system-ninja -no-feature-system-gn"
 
 # To use system ffmpeg you need to enable also libwebp, opus, vpx											    
 # Only depenedencies available in oe-core are enabled by default
-PACKAGECONFIG ??= "libwebp flac libevent libxslt speex"
+PACKAGECONFIG ??= "libwebp flac libevent libxslt speex nss"
 PACKAGECONFIG[opus] = "WEBENGINE_CONFIG+=use_system_opus,,libopus"
 PACKAGECONFIG[icu] = "WEBENGINE_CONFIG+=use_system_icu,,icu"
 PACKAGECONFIG[ffmpeg] = "WEBENGINE_CONFIG+=use_system_ffmpeg,,libav"
@@ -38,6 +39,7 @@ PACKAGECONFIG[libevent] = "WEBENGINE_CONFIG+=use_system_libevent,,libevent"
 PACKAGECONFIG[libxslt] = "WEBENGINE_CONFIG+=use_system_libxslt,,libxslt"
 PACKAGECONFIG[speex] = "WEBENGINE_CONFIG+=use_system_speex,,speex"
 PACKAGECONFIG[vpx] = "WEBENGINE_CONFIG+=use_system_vpx,,libvpx"
+PACKAGECONFIG[nss] = "WEBENGINE_CONFIG+=use_nss,,nss"
 
 EXTRA_QMAKEVARS_PRE += "${PACKAGECONFIG_CONFARGS}"
 
@@ -61,37 +63,35 @@ def gettext_oeconf(d):
 require qt5.inc
 require qt5-git.inc
 
-export NINJA_PATH="${STAGING_BINDIR_NATIVE}/ninja"
-
 do_configure() {
-    # replace LD with CXX, to workaround a possible gyp inheritssue?
-    export LD="${CXX}"
-    export CC="${CC}"
-    export CXX="${CXX}"
-    export CC_host="gcc"
-    export CXX_host="g++"
-    export QMAKE_MAKE_ARGS="${EXTRA_OEMAKE}"
-    export QMAKE_CACHE_EVAL="${PACKAGECONFIG_CONFARGS}"
-
     # Disable autodetection from sysroot:
-    sed -i 's/packagesExist([^)]*vpx[^)]*):/false:/g; s/config_libvpx:/false:/g; s/config_srtp:/false:/g; s/config_snappy:/false:/g; s/packagesExist(nss):/false:/g; s/packagesExist(minizip, zlib):/false:/g; s/packagesExist(libwebp,libwebpdemux):/false:/g; s/packagesExist(libxml-2.0,libxslt):/false:/g; s/^ *packagesExist($$package):/false:/g' ${S}/tools/qmake/mkspecs/features/configure.prf
+    sed -e 's/packagesExist([^)]*vpx[^)]*):/false:/g'\
+        -e 's/config_libvpx:/false:/g' \
+        -e 's/config_srtp:/false:/g' \
+        -e 's/config_snappy:/false:/g' \
+        -e 's/packagesExist(nss):/false:/g' \
+        -e 's/packagesExist(minizip, zlib):/false:/g' \
+        -e 's/packagesExist(libwebp,libwebpdemux):/false:/g' \
+        -e 's/packagesExist(libxml-2.0,libxslt):/false:/g'\
+        -e 's/^ *packagesExist($$package):/false:/g' \
+        -i ${S}/mkspecs/features/configure.prf
 
     # qmake can't find the OE_QMAKE_* variables on it's own so directly passing them as
     # arguments here
-    ${OE_QMAKE_QMAKE} -r ${EXTRA_QMAKEVARS_PRE} ${S} \
-        QMAKE_CXX="${OE_QMAKE_CXX}" QMAKE_CC="${OE_QMAKE_CC}" \
+    ${OE_QMAKE_QMAKE} ${EXTRA_QMAKEVARS_PRE} ${S} \
+        QMAKE_CXX="${OE_QMAKE_CXX}" \
+        QMAKE_CC="${OE_QMAKE_CC}" \
         QMAKE_LINK="${OE_QMAKE_LINK}" \
         QMAKE_CFLAGS="${OE_QMAKE_CFLAGS}" \
         QMAKE_CXXFLAGS="${OE_QMAKE_CXXFLAGS}" \
-        QMAKE_AR="${OE_QMAKE_AR} cqs" \
-        -after ${EXTRA_QMAKEVARS_POST}
+        -after ${EXTRA_QMAKEVARS_POST} -- \
+        ${EXTRA_QMAKEVARS_CONFIGURE}
 }
 
 do_compile[progress] = "outof:^\[(\d+)/(\d+)\]\s+"
 
 do_install_append() {
-    rmdir ${D}${OE_QMAKE_PATH_PLUGINS}/${BPN} ${D}${OE_QMAKE_PATH_PLUGINS} || true
-    sed -i 's@ -Wl,--start-group.*-Wl,--end-group@@g; s@-L${B}[^ ]* @ @g' ${D}${libdir}/pkgconfig/Qt5WebEngineCore.pc
+    sed -i 's@ -Wl,--start-group.*-Wl,--end-group@@g; s@[^ ]*${B}[^ ]* @@g' ${D}${libdir}/pkgconfig/Qt5WebEngineCore.pc
 }
 PACKAGE_DEBUG_SPLIT_STYLE = "debug-without-src"
 
@@ -104,21 +104,17 @@ RDEPENDS_${PN}-examples += " \
     qtdeclarative-qmlplugins \
 "
 
-QT_MODULE_BRANCH_CHROMIUM = "53-based"
+QT_MODULE_BRANCH_CHROMIUM = "56-based"
 
 SRC_URI += " \
     ${QT_GIT}/qtwebengine-chromium.git;name=chromium;branch=${QT_MODULE_BRANCH_CHROMIUM};protocol=${QT_GIT_PROTOCOL};destsuffix=git/src/3rdparty \
-    file://0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch \
-    file://0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch \
-    file://0003-functions.prf-allow-build-for-linux-oe-g-platform.patch \
-    file://0004-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch \
-    file://0005-Include-dependency-to-QCoreApplication-translate.patch \
-    file://0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch \
+    file://0001-Force-host-toolchain-configuration.patch \
+    file://0001-chromium-workaround-for-too-long-.rps-file-name.patch \
     file://0002-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch \
 "
 
-SRCREV_qtwebengine = "d740d6a7dbfec387752c7bc8a8b06db0e757c9dc"
-SRCREV_chromium = "15d257fd921f37b32ef643225f21df0ea24c8302"
+SRCREV_qtwebengine = "73f7be5b2a95eab3dce11caede538eeb7beb71f2"
+SRCREV_chromium = "aa2fdd6be3d465280d2a0c3aacdc738bb4ffec05"
 SRCREV = "${SRCREV_qtwebengine}"
 
 SRCREV_FORMAT = "qtwebengine_chromium"
diff --git a/recipes-qt/qt5/qtwebkit-examples_git.bb b/recipes-qt/qt5/qtwebkit-examples_git.bb
index 84b4d0b..286aeca 100644
--- a/recipes-qt/qt5/qtwebkit-examples_git.bb
+++ b/recipes-qt/qt5/qtwebkit-examples_git.bb
@@ -17,4 +17,4 @@ DEPENDS += "qtwebkit qtxmlpatterns"
 RDEPENDS_${PN}-examples += "qtwebkit-qmlplugins"
 RDEPENDS_${PN}-examples += "${@bb.utils.contains('PACKAGECONFIG_OPENSSL', 'openssl', 'ca-certificates', '', d)}"
 
-SRCREV = "f0898f83abdcacc8bd3bca3479884376b0963398"
+SRCREV = "822426abc77a74752b0ee0da4d0a1c106c4dac22"
diff --git a/recipes-qt/qt5/qtwebkit/0002-Remove-TEXTREL-tag-in-x86.patch b/recipes-qt/qt5/qtwebkit/0002-Remove-TEXTREL-tag-in-x86.patch
deleted file mode 100644
index d7627ec..0000000
--- a/recipes-qt/qt5/qtwebkit/0002-Remove-TEXTREL-tag-in-x86.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From f6989fec34f0bafdeda549d71751f236ef1f3b96 Mon Sep 17 00:00:00 2001
-From: Magnus Granberg <zorry@gentoo.org>
-Date: Fri, 27 Feb 2015 11:55:09 +0100
-Subject: [PATCH] Remove TEXTREL tag in x86
-
-Fix textrel QA warnings when building qtwebkit for x86:
-
-  WARNING: QA Issue: ELF binary '/home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/qtwebkit/5.4.0-r0/packages-split/qtwebkit/usr/lib/libQt5WebKit.so.5.4.0' has relocations in .text [textrel]
-
-Patch from upstream webkit:
-
-  https://bugs.webkit.org/show_bug.cgi?id=70610
-
-Minor refresh required to apply cleanly to the older webkit sources used
-by qtwebkit. Specifically, the patch needed to be modified to account
-for PLATFORM(MAC) -> OS(DARWIN) renaming in recent webkit which is not
-part of qtwebkit yet ( https://bugs.webkit.org/show_bug.cgi?id=99683 ).
-
-Upstream status [webkit] : backport
-Upstream status [qtwebkit] : unclear
-
-Bug: https://bugs.webkit.org/show_bug.cgi?id=70610
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- Source/JavaScriptCore/jit/ThunkGenerators.cpp | 24 ++++++++++++++++++++++++
- Source/WTF/wtf/InlineASM.h                    |  2 ++
- 2 files changed, 26 insertions(+)
-
-diff --git a/Source/JavaScriptCore/jit/ThunkGenerators.cpp b/Source/JavaScriptCore/jit/ThunkGenerators.cpp
-index 9684df2..8af82d8 100644
---- a/Source/JavaScriptCore/jit/ThunkGenerators.cpp
-+++ b/Source/JavaScriptCore/jit/ThunkGenerators.cpp
-@@ -524,6 +524,30 @@ double jsRound(double d)
-     } \
-     static MathThunk UnaryDoubleOpWrapper(function) = &function##Thunk;
- 
-+#elif CPU(X86) && COMPILER(GCC) && OS(LINUX) && defined(__PIC__)
-+#define defineUnaryDoubleOpWrapper(function) \
-+    asm( \
-+        ".text\n" \
-+        ".globl " SYMBOL_STRING(function##Thunk) "\n" \
-+        HIDE_SYMBOL(function##Thunk) "\n" \
-+        SYMBOL_STRING(function##Thunk) ":" "\n" \
-+        "pushl %ebx\n" \
-+        "subl $20, %esp\n" \
-+        "movsd %xmm0, (%esp) \n" \
-+        "call __x86.get_pc_thunk.bx\n" \
-+        "addl $_GLOBAL_OFFSET_TABLE_, %ebx\n" \
-+        "call " GLOBAL_REFERENCE(function) "\n" \
-+        "fstpl (%esp) \n" \
-+        "movsd (%esp), %xmm0 \n" \
-+        "addl $20, %esp\n" \
-+        "popl %ebx\n" \
-+        "ret\n" \
-+    );\
-+    extern "C" { \
-+        MathThunkCallingConvention function##Thunk(MathThunkCallingConvention); \
-+    } \
-+    static MathThunk UnaryDoubleOpWrapper(function) = &function##Thunk;
-+
- #elif CPU(X86) && COMPILER(GCC) && (PLATFORM(MAC) || OS(LINUX))
- #define defineUnaryDoubleOpWrapper(function) \
-     asm( \
-diff --git a/Source/WTF/wtf/InlineASM.h b/Source/WTF/wtf/InlineASM.h
-index 0a2fe78..2dc40ef 100644
---- a/Source/WTF/wtf/InlineASM.h
-+++ b/Source/WTF/wtf/InlineASM.h
-@@ -46,6 +46,8 @@
- #define GLOBAL_REFERENCE(name) #name "@plt"
- #elif CPU(X86) && COMPILER(MINGW)
- #define GLOBAL_REFERENCE(name) "@" #name "@4"
-+#elif OS(LINUX) && CPU(X86) && defined(__PIC__)
-+#define GLOBAL_REFERENCE(name) SYMBOL_STRING(name) "@plt"
- #else
- #define GLOBAL_REFERENCE(name) SYMBOL_STRING(name)
- #endif
diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_git.bb
index 4845d0f..722af85 100644
--- a/recipes-qt/qt5/qtwebkit_git.bb
+++ b/recipes-qt/qt5/qtwebkit_git.bb
@@ -20,7 +20,6 @@ ARM_INSTRUCTION_SET_armv5 = "arm"
 
 SRC_URI += "\
     file://0001-qtwebkit-fix-QA-issue-bad-RPATH.patch \
-    file://0002-Remove-TEXTREL-tag-in-x86.patch \
     file://0003-Exclude-backtrace-API-for-non-glibc-libraries.patch \
 "
 
@@ -86,4 +85,4 @@ PACKAGES_remove = "${PN}-examples-dev ${PN}-examples-staticdev ${PN}-examples-db
 RUBY_SYS = "${@ '${BUILD_SYS}'.replace('i486', 'i386').replace('i586', 'i386').replace('i686', 'i386') }"
 export RUBYLIB="${STAGING_DATADIR_NATIVE}/rubygems:${STAGING_LIBDIR_NATIVE}/ruby:${STAGING_LIBDIR_NATIVE}/ruby/${RUBY_SYS}"
 
-SRCREV = "74ac5b0f3489f9a08d083b6c9607c9d5c2d4afd2"
+SRCREV = "f27089657a207ef8c5c9d27d661d3d12c3af8df2"
diff --git a/recipes-qt/qt5/qtwebsockets_git.bb b/recipes-qt/qt5/qtwebsockets_git.bb
index 043b394..41ec27f 100644
--- a/recipes-qt/qt5/qtwebsockets_git.bb
+++ b/recipes-qt/qt5/qtwebsockets_git.bb
@@ -11,4 +11,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative"
 
-SRCREV = "afb3c58d035db1119666c8556c215187be4f64b8"
+SRCREV = "1421c3e4ae4213ca18f2f51d5ddb38e223450222"
diff --git a/recipes-qt/qt5/qtx11extras_git.bb b/recipes-qt/qt5/qtx11extras_git.bb
index 81c72ec..bf03e9b 100644
--- a/recipes-qt/qt5/qtx11extras_git.bb
+++ b/recipes-qt/qt5/qtx11extras_git.bb
@@ -13,4 +13,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "54cc3158acfc75d12338df3b678e013909e66f60"
+SRCREV = "9e83ff8713c1a3f69ce514bf3e31335194668da7"
diff --git a/recipes-qt/qt5/qtxmlpatterns_git.bb b/recipes-qt/qt5/qtxmlpatterns_git.bb
index c7efaf3..8556386 100644
--- a/recipes-qt/qt5/qtxmlpatterns_git.bb
+++ b/recipes-qt/qt5/qtxmlpatterns_git.bb
@@ -16,6 +16,6 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "9f7e01b582b1bd83cc6b8a854c510871335e2e74"
+SRCREV = "c1c3af0ae456247c9bcd30161d51a94c9b38dc52"
 
 BBCLASSEXTEND =+ "native nativesdk"
-- 
2.7.4


