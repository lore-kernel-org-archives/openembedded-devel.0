Return-Path: <samuli.piippo@qt.io>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0139.outbound.protection.outlook.com [104.47.2.139])
	by mail.openembedded.org (Postfix) with ESMTP id D491060125
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Nov 2016 16:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=qtcompany.onmicrosoft.com; s=selector1-qt-io;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=OyYr8Ptwqz6Xko8iD51Yb+tQLtVb+VOUo+K4v6Rw/Js=;
	b=MqMRec7sZsCEpK+FHQxuqG66Yv5xs6+u0shiYiROLefTVqRQ04/kZeo64E6ocXgHyphlcnwRxs6jcoIa24eZuCQv3ADksEN/3YQWLWtJ8qnLyx8n0xt2bGv5MNYGAD33get5S4OS3FuZjRArSQbuT9zMtOSwTvqb8G5SKhoO3zc=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=samuli.piippo@qt.io; 
Received: from piippo.intra.qt.io (192.89.120.53) by
	VI1PR0202MB2623.eurprd02.prod.outlook.com (10.173.80.15) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.721.10; Mon, 14 Nov 2016 09:58:32 +0000
From: Samuli Piippo <samuli.piippo@qt.io>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 14 Nov 2016 11:57:35 +0200
Message-ID: <1479117455-23851-1-git-send-email-samuli.piippo@qt.io>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [192.89.120.53]
X-ClientProxiedBy: HE1PR06CA0089.eurprd06.prod.outlook.com (10.169.114.15) To
	VI1PR0202MB2623.eurprd02.prod.outlook.com (10.173.80.15)
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0202MB2623;
	2:0ZmMOBBuEgcUqQC7ajTf3lwfwSUk+xlrbFbjQVMX7LpcFEKCQsqibaS+naIMbvpcNmZ6MT7IoYR7WwLGcXM143X0uqTruATDQwW2FfnWp8owSIIfXM1JcU/y4LxHc90kZjZuKdfBVf6EA+gZabq0OBtK5FLSuhN0jEVLMHLLe2M=;
	3:sgAOiF6ZtSfPXoCjzy35Xkfh/X1baqjDYLzCOmoKBk1kOJlNBXlTRpyNcfkmKSpWRQ6hlpBtr/E2mCDdQGS1mYv+K89axsLYAzi8atR6w7jqGAoSzLXnrKOGB9GM3PTbHK0vD4FAmDR5rg1E1eBAIip0Cm9LZE9SIUY1O4PxG3A=
X-MS-Office365-Filtering-Correlation-Id: e87b2445-cd7b-402e-6e45-08d40c74cb19
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(22001);
	SRVR:VI1PR0202MB2623; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0202MB2623;
	25:IvRWrzWe6G6v2GK0YV51bs4gRqMJ6y9RpQYpMB8QYfcvrpVV4MoOxzX3zPzSEhwQCrjXKVOWB+Xkc4RzFe05Nbo6qYKATMGYL2RWc7Vi8NFbkktpl8VbaT0c0Tz969A+kpxkKznqyNYQfGJjtSi1YrvEsdKs6jKgU/CIr4aoc8o1hFAAkRKbHtVLdMpOMxVV8UyG9MGN2HQGBp7FsiJ0FPOHcULH3fbBUFLgASrC4kSK86QbRMgrWiacLrfJwARzWuF9ahplS1E6sREPuRKTDKPcprfhVF6KVF+Q9Gqfo/3Y4rFyL/w1nRAIHkpwomHm8Z4F0nSSVOi2Zp8fZ2VNOaH7JqtTl0WWdZMcullfvVI/5mM7xIfQwQpuA8TX/hsOgLIn7FsnlB3p45ZCfF7bdp44IYoC1zZZ/7v1tFQLqCZRaIv0X6MBPHmAV8cuTxh3aiqD8ciTUC4OoWWeGleV+zMMaSNhtc0Bw+yh/LSH/OrglwGCj3xb3dwBNzW43yEbb/c5AUryL3nGcU0TDMvPNkEfn5sHVWHe/aazn1E2WkV9sOeog4PTqp+cS7Ap1qX6EXV2LMDEjs39Jeh+EIT/ZiqiKtiAyq3Mk/L4OSNCz6UYHa87wEO+2asp3zpcjLBohsZggK0RiV2ovu6VRgf1AqdXs1XSzfWz/tsENPV1FNj5e3YMztwZwwXxd9gieP/4jn6pgLPi3mtk/j7fNTA6Cp3U+9pdihz93NPFxy+lhqQ3pQS/L2DbmNvIhy5bQQBiSU2EKeRbm9jTj39qCQmn1BrtPDfZYlGvd2vXuLTH7xjp6z9Ym7sxfyhGYQjnZvVzLnmZQ6dovcSaPrQ3un+t3g==
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0202MB2623;
	31:WKEATjjsYyNQ7+VepEiwPpnW6RjjzjGBp0Fc0LTb6qGXpC8JKN60uyRTR+gdyv7NEeAHZaBd545uDlnOu0SRV1Plavet8ogsBosjUJcDfW4kVGOOyzfvbpuKCjGBr3oKufU2nT6KCo1Bk4H8pyLpm6YflA2j0xou6Nvv+XwdvQcpe4syTjGuXMML/gew2tzb8WVEqRULyg0WoUh8MeAXmQHmkg1KYGehBC1ZHFE832Ny+6grkVrsGmSxB/MycHp/;
	20:hDJ6c4iXHvgAfS+vLgftttvKe/8SVYMhXgRyNJG+9NUxVoOuC5LW1zW+THUZOrovxSFh5PzRPh4pySITEQPTtzqz2itjNrrgfSBk7mxnObYz8pp2BnXG3ZfRRWkSGu146Dq2w+5y5V7BvIx9W7dg4PSPDk0zYCT2DVLMEWs2Ni0ULZbbDFQobh3SLlpDfvaPdrIqs1p0iPG9Sx5wt2pc74Ifayig9TzlsGvNYfgROf3NQmCVm0inGyP8Em1zu4mQ
X-Microsoft-Antispam-PRVS: <VI1PR0202MB2623A6A4CBB317DABE26001EE9BC0@VI1PR0202MB2623.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(250305191791016)(22074186197030)(788757137089)(8415204561270)(228905959029699);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6060326)(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046)(6061321)(6043046);
	SRVR:VI1PR0202MB2623; BCL:0; PCL:0; RULEID:;
	SRVR:VI1PR0202MB2623; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0202MB2623;
	4:UGHyaaiEK8AmswbXmFczLCIrPsCw+SXo75qIOcuL1TDQh22jJ0WKCdGywGVfm92NfjX6/YQ/wnek6gPFA2t1HRsOPiLogrz08h+guE/rO6RT62VOvT1ThMITGVpUA8Ixg6NQ6/ttQdbI7Xul3OJ7QNu58y/euBxQd0DTJFSPwISOejjBgDYW3Pkirve1V1xZEHKv/JKPEsW4w9yG4mXdqfSsnkrfQXmJEmDS3aFRtPudM6qfqWYGEB4RkuhHmND/BLGu9Qrqilivbeefr+7ZEinR9fYoi7qi4hGZlaPzAm5rEarum339hOPqkqHbZmbceA1nIO5dmPKJ7RkWxWCnHAXGfh8i170YRFOX62CA1Jy3DOGuZigQSKWS5aRYtobgyPqbEQ59YxFCD2Z09Sp0/skcy3xSkiVs/WPwIZ0dgMLr1/41kShLS/2vx+fbAAM5++MDz6ZftZLbd6BycI34FvULmKC22h78tkqQQYig09IzgeuIqSpRwkMMslBKlKOJrBxKjTctSopLuo71L8WwKOpgde7aGuJTfyJmE+NweGzJSZeCPU1fq3bjR8ZBVrz7sURLwlqRc8TbckJG6Glg1vBIXVbfTWvwjRZiGPw07ag=
X-Forefront-PRVS: 0126A32F74
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6009001)(7916002)(189002)(377424004)(199003)(2906002)(92566002)(189998001)(66066001)(106356001)(50986999)(6116002)(5660300001)(47776003)(110136003)(101416001)(7736002)(6916009)(575784001)(86362001)(42186005)(7846002)(36756003)(53416004)(1720100001)(77096005)(105586002)(81156014)(81166006)(5003940100001)(69596002)(2351001)(31430400001)(50226002)(50466002)(450100001)(8676002)(68736007)(33646002)(74482002)(48376002)(107886002)(3846002)(4001150100001)(305945005)(97736004)(586003)(290074003)(2004002)(21314002)(579004)(569005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0202MB2623;
	H:piippo.intra.qt.io; FPR:; SPF:None; PTR:InfoNoRecords; MX:1;
	A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: qt.io does not designate permitted
	sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; VI1PR0202MB2623;
	23:LrJFnQjHHCco9+lrG+Mah/TeD3of9tp+LrG/pk+?=
	=?us-ascii?Q?LPNmKBA9rSlVZ0ht1YlGdJg3mWYfk+fMEys3eRLo8/86JblJzqIKiARCyCMh?=
	=?us-ascii?Q?d+YLurM2uH0XB4qmlYJlJ6qn77JGnXlwMTwWcE0AcFqShN8fPhCd8b5oihi9?=
	=?us-ascii?Q?/NuGhSBNIB5kpGLBGgJL8iwFe/XdBpNVYZ6hmFksDoUgaR2QdjK1UCZirp3u?=
	=?us-ascii?Q?qAmBglaqdWO3b5QL0Y8R3GHcx+ivHht+Pq3XEgPk+qWLtG8PxXkwdTf1s9yZ?=
	=?us-ascii?Q?iY/ttMrIuYo7chobfZGu0t1dVEDVAB3UMWDDVPlkv2vjgG0r2JPojW8BsGRL?=
	=?us-ascii?Q?NOXD2T+Qc4+AC1tNjYNp0GsFUJxVmbeVJuNDT5qqeRGU5R2W8skq+/HWtn78?=
	=?us-ascii?Q?RDgl+qDh5/vO7QwtlXJ84pXKzfhJIkmDTWbnPhvO93eg2LURd9xcC/Y0nvrC?=
	=?us-ascii?Q?8aJ7RdY4LuTUND5xYST0SI3oMU4WTLdLgakjGsxcr02+ULOM+FPjzmo+SlUg?=
	=?us-ascii?Q?3otZKsKRDMTzwV8Kh/i3PgjEsxPiwSc77iKyXS6Mx+WxdiGjzLNk0JZ+vXvb?=
	=?us-ascii?Q?WsZtyepP9uLBMZqMfeL9vaNDRTidEzk2gFWenrpqCQZunTY7QHTkToxZUORd?=
	=?us-ascii?Q?4uV5VMqdcENECACzJHEMhcP4bLIF4Zdq3PFDZPSOmWP9KxxTrEprXQJld/0i?=
	=?us-ascii?Q?qr/+7djMEGzPDNNKiVxJ/KwobX6y5ik3QpChl5MSufParelAfUUQn9NbEjo4?=
	=?us-ascii?Q?bj4gyIjXBBUs5/SPDlo3cvroMOQlxMsPF+H6VI+DhgROqqWwY7daY05hQ39M?=
	=?us-ascii?Q?ReXj6tSBcjQjylQmKOlC+1ybWvkIgH7U00pdnQFUlHjjV8fv/kHu7Jplj8oo?=
	=?us-ascii?Q?tqNsFFwfOZnTC/AHNGPfkSvQ1APQ5fg22ueaiS4hJAbU375jg36rZPpWfSG4?=
	=?us-ascii?Q?+3rxGop7B4QtArG+ZHwBoW7RomZoGK/z2Y+FlnIVEt/nzXd4lAAammyhjQh5?=
	=?us-ascii?Q?eQvN4rQL+LElWUUm8ylNQOmAtinXMYiJE1Uwp1qyp5SVH/nzeT+qgkYhugVY?=
	=?us-ascii?Q?j6scwhPvJ8tLClfsVpl2odHG7kIrbROqNEVWXbb+AU2ZO8QB+b0I2Qn7TEhg?=
	=?us-ascii?Q?+9C8bz72bn9opc27Ovi1JHdrqMyVdVb5ogvt0yq2RCqKg6hkDUfR9Vuc8K4t?=
	=?us-ascii?Q?2G+x+9j13w6jjoauMhlvFropTumy1gBvXofnE25bqi3nkxzNfCYlMaceWoJ0?=
	=?us-ascii?Q?PHBAqbKogg15XDp/+dN/vFfPA0LYWWybFfQHMBF7B?=
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0202MB2623;
	6:CaHNYrKfQHUfA1GLSarGVQ2w89AWYE0hTamVyOaC/WXxAwX8/htsFlxJuEXMiE5X7SZsZrq5hrM4PH4/2otvfe9nxHEWwwO43TCx7V/ptudLGkFmFk9Ifb0Wri1f1ubjU3f5GE3Jc3Mm5y7lYNcaXk3HeNHC9vpjjraad4RJ7ibzTTbr5pyoxJhnLYRzajp3AdcgzUzGNpXYO7oqMeoKTYmy4PXD1sC7kuM9wspNBsNOq7IIYzffukXIahApvnGYbAT6LIQtOfoTnfdRoVjPwmLYuc1bi0PVCsNBVhUrHfES+JNc4XwHnm4xCULgLTn8/Qb4T9vlLtYwp0l3gjyV0zU2DrSpwLNUz3MgxDEH+sZLM8YKzps/bDcVkc32NvWZ;
	5:vGavRZHza/oFAaKkFmeqeDZSMzexcISo9eFMMCADWwXKUH3jOk/U+AH/NeSdCm+OlZL28XJoHbtLhr/i7I71AZu6Yg+i1q3CfvoQ2iPbRoUJT8nIeiAaMs6f3WTK/uIOf9eBPE3CzG5vE4D033wXZg==;
	24:PsmuTu+fmydT948klmw4H5xi+oJL6Z8Em9hVSLfDq4LS35ysDwfR1qAjhUs2BnB+YS6niQFUoYp1akiU+Av2L+gQkv04Oe/UitYDOtb2Iuc=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0202MB2623;
	7:gl7x/DDvVLaQI9dpScyPR2vN/xd37iAPW6ibvUQ9Nw9kszUm19UJWOu/dVhxhX1y5SVamG74gP1XBXZslB2KuBPP9R4R7rcCvNAQ8LO8BPpOQTPkMSUMRdlZs/oK4mdUBxM/h0luT1Hs0uxDEdHZWOKCmhLcIXd742Y6/OeEkkXCKQJezbRb355OqeAMTnbf44eC286Cr+5cFi/tcvo+XCdz3RatQcztLI0JqdhYutxOJVdEgPK1qVxbyotcnA7XxbhcYzUno6hEuY/7RxHiuRQPTzjRBuQV0fhTsu7MjW2C/kLDH/ZhlSTGeERd+FzYbw0BGuURsWyyDPR/TsuaGOrnPGNmDJLbQ/ZiJdfEzIw=
X-OriginatorOrg: qt.io
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2016 09:58:32.7091 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0202MB2623
Subject: [meta-qt5][PATCH] Upgrade to Qt 5.8
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
X-List-Received-Date: Mon, 14 Nov 2016 16:34:10 -0000
Content-Type: text/plain

The linux-oe-g++ mkspec is changed to use $$(...) operator to obtain
the contents of an environment value when qmake is run instead of when
Makefile is processed. All OE_QMAKE_xxx variables need to be exported
for qmake to find them. configure's setBootstrapVariable function needs
to change $$(..) to normal $(...) operator to work with qmake's Makefile.

qt.conf generation for qtbase recipes is not needed, as configure will
generate its own version based on configure arguments. Skip running
qmake, since configure is now automatically invoked when it's run in
qtbase's root folder.

Update PACKAGECONFIGs for qtbase to match current configure options.

Merge the two qtwayland recipes to one that supports all three targets
(target, native, nativesdk) without need for additional patch.

Change-Id: Ib37c4d7323e8b45aa2b171e8427b6ec15aaee213
Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
---
 classes/qmake5.bbclass                             |   4 -
 classes/qmake5_base.bbclass                        |  91 +++---
 .../packagegroup-qt5-toolchain-target.bb           |   1 -
 recipes-qt/qt5/nativesdk-qtbase_git.bb             |  92 +-----
 .../qt5/qt3d/0001-Allow-a-tools-only-build.patch   |   8 +-
 recipes-qt/qt5/qt3d_git.bb                         |  10 +-
 recipes-qt/qt5/qt5-git.inc                         |   4 +-
 recipes-qt/qt5/qt5.inc                             |   2 +
 recipes-qt/qt5/qtbase-native_git.bb                |  30 +-
 .../qt5/qtbase/0001-Add-linux-oe-g-platform.patch  | 314 ++++-----------------
 ...o-allow-to-set-qt.conf-from-the-outside-u.patch |  36 ---
 .../0003-Add-external-hostbindir-option.patch      | 154 +---------
 ...le-Fix-pkgconfig-and-libtool-replacements.patch |  10 +-
 ...Invert-conditional-for-defining-QT_SOCKLE.patch |  32 ---
 ...configure-paths-for-target-qmake-properly.patch |  18 +-
 ...-unknown-features-instead-of-erroring-out.patch |  28 ++
 ...EGL-libraries-from-pkgconfig-and-defaults.patch |  95 -------
 ...external-hostbindir-option-for-native-sdk.patch | 131 ---------
 .../qtbase/0013-Fix-build-with-QT_NO_OPENGL.patch  |  33 ---
 recipes-qt/qt5/qtbase_git.bb                       |  85 ++----
 recipes-qt/qt5/qtcanvas3d_git.bb                   |   8 +-
 recipes-qt/qt5/qtcharts_git.bb                     |   2 +-
 recipes-qt/qt5/qtconnectivity_git.bb               |   2 +-
 recipes-qt/qt5/qtdatavis3d_git.bb                  |   2 +-
 recipes-qt/qt5/qtdeclarative-render2d_git.bb       |  12 -
 ...crashes-in-QtQml-code-related-to-dead-sto.patch |  44 ---
 recipes-qt/qt5/qtdeclarative_git.bb                |   8 +-
 recipes-qt/qt5/qtenginio_git.bb                    |   9 +-
 recipes-qt/qt5/qtgraphicaleffects_git.bb           |  10 +-
 recipes-qt/qt5/qtimageformats_git.bb               |  10 +-
 recipes-qt/qt5/qtlocation_git.bb                   |  10 +-
 recipes-qt/qt5/qtmultimedia_git.bb                 |   2 +-
 recipes-qt/qt5/qtquick1_git.bb                     |   4 +-
 recipes-qt/qt5/qtquickcontrols2_git.bb             |   6 +-
 recipes-qt/qt5/qtquickcontrols_git.bb              |   8 +-
 recipes-qt/qt5/qtscript_git.bb                     |   2 +-
 recipes-qt/qt5/qtsensors_git.bb                    |  10 +-
 recipes-qt/qt5/qtserialbus_git.bb                  |   2 +-
 recipes-qt/qt5/qtserialport_git.bb                 |  10 +-
 recipes-qt/qt5/qtsvg_git.bb                        |   8 +-
 ...w-to-build-only-lrelease-lupdate-lconvert.patch |   6 +-
 recipes-qt/qt5/qttools_git.bb                      |   7 +-
 recipes-qt/qt5/qttranslations_git.bb               |   2 +-
 recipes-qt/qt5/qtvirtualkeyboard_git.bb            |   2 +-
 recipes-qt/qt5/qtwayland-native_git.bb             |  31 --
 ...-qtwaylandscanner-tool-to-the-native-side.patch |  29 --
 ...yland-include-server-buffer-only-when-bui.patch |  27 --
 recipes-qt/qt5/qtwayland_git.bb                    |  20 +-
 recipes-qt/qt5/qtwebchannel_git.bb                 |   2 +-
 recipes-qt/qt5/qtwebengine_git.bb                  |  12 +-
 recipes-qt/qt5/qtwebkit-examples_git.bb            |   2 +-
 ...move-unused-check-for-the-private_headers.patch |  35 +++
 recipes-qt/qt5/qtwebkit_git.bb                     |   3 +-
 recipes-qt/qt5/qtwebsockets_git.bb                 |   8 +-
 recipes-qt/qt5/qtx11extras_git.bb                  |  10 +-
 recipes-qt/qt5/qtxmlpatterns_git.bb                |   2 +-
 56 files changed, 327 insertions(+), 1218 deletions(-)
 delete mode 100644 recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
 delete mode 100644 recipes-qt/qt5/qtbase/0007-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch
 create mode 100644 recipes-qt/qt5/qtbase/0009-Disable-all-unknown-features-instead-of-erroring-out.patch
 delete mode 100644 recipes-qt/qt5/qtbase/0009-Reorder-EGL-libraries-from-pkgconfig-and-defaults.patch
 delete mode 100644 recipes-qt/qt5/qtbase/0012-Add-external-hostbindir-option-for-native-sdk.patch
 delete mode 100644 recipes-qt/qt5/qtbase/0013-Fix-build-with-QT_NO_OPENGL.patch
 delete mode 100644 recipes-qt/qt5/qtdeclarative-render2d_git.bb
 delete mode 100644 recipes-qt/qt5/qtdeclarative/0003-Workaround-crashes-in-QtQml-code-related-to-dead-sto.patch
 delete mode 100644 recipes-qt/qt5/qtwayland-native_git.bb
 delete mode 100644 recipes-qt/qt5/qtwayland/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch
 delete mode 100644 recipes-qt/qt5/qtwayland/0001-examples-wayland-include-server-buffer-only-when-bui.patch
 create mode 100644 recipes-qt/qt5/qtwebkit/0004-Remove-unused-check-for-the-private_headers.patch

diff --git a/classes/qmake5.bbclass b/classes/qmake5.bbclass
index 2b43f2e..1a960e8 100644
--- a/classes/qmake5.bbclass
+++ b/classes/qmake5.bbclass
@@ -17,7 +17,3 @@ do_install() {
 do_install_class-native() {
     qmake5_base_native_do_install
 }
-
-do_install_class-nativesdk() {
-    qmake5_base_nativesdk_do_install
-}
diff --git a/classes/qmake5_base.bbclass b/classes/qmake5_base.bbclass
index a4b7d1b..fa1bc56 100644
--- a/classes/qmake5_base.bbclass
+++ b/classes/qmake5_base.bbclass
@@ -30,27 +30,29 @@ EXTRA_OEMAKE = " \
     OE_QMAKE_INCDIR_QT='${STAGING_DIR_TARGET}/${OE_QMAKE_PATH_HEADERS}' \
 "
 
-OE_QMAKESPEC = "${QMAKE_MKSPEC_PATH_NATIVE}/mkspecs/${OE_QMAKE_PLATFORM_NATIVE}"
-OE_XQMAKESPEC = "${QMAKE_MKSPEC_PATH}/mkspecs/${OE_QMAKE_PLATFORM}"
 OE_QMAKE_QMAKE = "${STAGING_BINDIR_NATIVE}${QT_DIR_NAME}/qmake"
-OE_QMAKE_COMPILER = "${CC}"
-OE_QMAKE_CC = "${CC}"
-OE_QMAKE_CFLAGS = "${CFLAGS}"
-OE_QMAKE_CXX = "${CXX}"
-OE_QMAKE_CXXFLAGS = "${CXXFLAGS}"
-OE_QMAKE_LINK = "${CXX}"
-OE_QMAKE_LDFLAGS = "${LDFLAGS}"
-OE_QMAKE_AR = "${AR}"
-OE_QMAKE_STRIP = "echo"
-OE_QMAKE_WAYLAND_SCANNER = "${STAGING_BINDIR_NATIVE}/wayland-scanner"
-
-# this one needs to be exported, because qmake reads it from shell env
-export QT_CONF_PATH = "${WORKDIR}/qt.conf"
+export OE_QMAKE_COMPILER = "${CC}"
+export OE_QMAKE_CC = "${CC}"
+export OE_QMAKE_CFLAGS = "${CFLAGS}"
+export OE_QMAKE_CXX = "${CXX}"
+export OE_QMAKE_CXXFLAGS = "${CXXFLAGS}"
+export OE_QMAKE_LINK = "${CXX}"
+export OE_QMAKE_LDFLAGS = "${LDFLAGS}"
+export OE_QMAKE_AR = "${AR}"
+export OE_QMAKE_STRIP = "echo"
+export OE_QMAKE_WAYLAND_SCANNER = "${STAGING_BINDIR_NATIVE}/wayland-scanner"
+OE_QMAKE_QTCONF_PATH = "${WORKDIR}/qt.conf"
+export OE_QMAKE_QTCONF = "-qtconf ${OE_QMAKE_QTCONF_PATH}"
 
 inherit qmake5_paths remove-libtool
 
 do_generate_qt_config_file() {
-    cat > ${QT_CONF_PATH} <<EOF
+    generate_qt_config_file_paths
+    generate_qt_config_file_effective_paths
+}
+
+generate_qt_config_file_paths() {
+    cat > ${OE_QMAKE_QTCONF_PATH} <<EOF
 [Paths]
 Prefix = ${OE_QMAKE_PATH_PREFIX}
 Headers = ${OE_QMAKE_PATH_HEADERS}
@@ -70,12 +72,21 @@ Tests = ${OE_QMAKE_PATH_TESTS}
 HostBinaries = ${OE_QMAKE_PATH_HOST_BINS}
 HostData = ${OE_QMAKE_PATH_HOST_DATA}
 HostLibraries = ${OE_QMAKE_PATH_HOST_LIBS}
-HostSpec = ${OE_QMAKESPEC}
-TartgetSpec = ${OE_XQMAKESPEC} 
+HostSpec = ${OE_QMAKE_PLATFORM_NATIVE}
+TargetSpec = ${OE_QMAKE_PLATFORM}
 ExternalHostBinaries = ${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}
 Sysroot = ${STAGING_DIR_TARGET}
 EOF
 }
+
+generate_qt_config_file_effective_paths() {
+    cat >> ${OE_QMAKE_QTCONF_PATH} <<EOF
+[EffectivePaths]
+HostBinaries = ${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}
+HostData = ${OE_QMAKE_PATH_HOST_DATA}
+HostPrefix = ${STAGING_DIR_NATIVE}${prefix_native}
+EOF
+}
 #
 # Allows to override following values (as in version 5.0.1)
 # Prefix The default prefix for all paths.
@@ -154,8 +165,8 @@ qmake5_base_do_configure () {
     # for config.tests to read this
     export QMAKE_MAKE_ARGS="${EXTRA_OEMAKE}"
 
-    CMD="${OE_QMAKE_QMAKE} -makefile -o Makefile ${OE_QMAKE_DEBUG_OUTPUT} ${OE_QMAKE_RECURSIVE} $QMAKE_VARSUBST_PRE $AFTER $PROFILES $QMAKE_VARSUBST_POST"
-    ${OE_QMAKE_QMAKE} -makefile -o Makefile ${OE_QMAKE_DEBUG_OUTPUT} ${OE_QMAKE_RECURSIVE} $QMAKE_VARSUBST_PRE $AFTER $PROFILES $QMAKE_VARSUBST_POST || die "Error calling $CMD"
+    CMD="${OE_QMAKE_QMAKE} -makefile -o Makefile ${OE_QMAKE_QTCONF} ${OE_QMAKE_DEBUG_OUTPUT} ${OE_QMAKE_RECURSIVE} $QMAKE_VARSUBST_PRE $AFTER $PROFILES $QMAKE_VARSUBST_POST"
+    ${OE_QMAKE_QMAKE} -makefile -o Makefile ${OE_QMAKE_QTCONF} ${OE_QMAKE_DEBUG_OUTPUT} ${OE_QMAKE_RECURSIVE} $QMAKE_VARSUBST_PRE $AFTER $PROFILES $QMAKE_VARSUBST_POST || die "Error calling $CMD"
 }
 
 qmake5_base_native_do_install() {
@@ -166,37 +177,37 @@ qmake5_base_native_do_install() {
     fi
 }
 
-qmake5_base_nativesdk_do_install() {
-    # Fix install paths for all
-    find . -name "Makefile*" | xargs -r sed -i "s,(INSTALL_ROOT)${STAGING_DIR_HOST},(INSTALL_ROOT),g"
-
-    oe_runmake install INSTALL_ROOT=${D}
-    if ls ${D}${libdir}/pkgconfig/Qt5*.pc >/dev/null 2>/dev/null; then
-        sed -i "s@-L${STAGING_LIBDIR}@-L\${libdir}@g" ${D}${libdir}/pkgconfig/Qt5*.pc
+qmake5_base_fix_install() {
+    STAGING_PATH=$1
+    if [ -d ${D}${STAGING_PATH} ] ; then
+        echo "Some files are installed in wrong directory ${D}${STAGING_PATH}"
+        cp -ra ${D}${STAGING_PATH}/* ${D}
+        rm -rf ${D}${STAGING_PATH}
+        # remove empty dirs
+        TMP=`dirname ${D}${STAGING_PATH}`
+        while test ${TMP} != ${D}; do
+            rmdir ${TMP}
+            TMP=`dirname ${TMP}`;
+        done
     fi
 }
 
 qmake5_base_do_install() {
     # Fix install paths for all
     find . -name "Makefile*" | xargs -r sed -i "s,(INSTALL_ROOT)${STAGING_DIR_TARGET},(INSTALL_ROOT),g"
+    find . -name "Makefile*" | xargs -r sed -i "s,(INSTALL_ROOT)${STAGING_DIR_HOST},(INSTALL_ROOT),g"
+    find . -name "Makefile*" | xargs -r sed -i "s,(INSTALL_ROOT)${STAGING_DIR_NATIVE},(INSTALL_ROOT),g"
 
     oe_runmake install INSTALL_ROOT=${D}
 
     # everything except HostData and HostBinaries is prefixed with sysroot value,
     # but we cannot remove sysroot override, because that's useful for pkg-config etc
-    # In some cases like QtQmlDevTools in qtdeclarative, the sed above does not work,
-    # fix them manually
-    if [ -d ${D}${STAGING_DIR_TARGET} ] ; then
-        echo "Some files are installed in wrong directory ${D}${STAGING_DIR_TARGET}"
-        cp -ra ${D}${STAGING_DIR_TARGET}/* ${D}
-        rm -rf ${D}${STAGING_DIR_TARGET}
-        # remove empty dirs
-        TMP=`dirname ${D}/${STAGING_DIR_TARGET}`
-        while test ${TMP} != ${D}; do
-            rmdir ${TMP}
-            TMP=`dirname ${TMP}`;
-        done
-    fi
+    # concurrent builds may cause qmake to regenerate Makefiles and override the above
+    # sed changes. If that happens, move files manually to correct location.
+    qmake5_base_fix_install ${STAGING_DIR_TARGET}
+    qmake5_base_fix_install ${STAGING_DIR_HOST}
+    qmake5_base_fix_install ${STAGING_DIR_NATIVE}
+
     if ls ${D}${libdir}/pkgconfig/Qt5*.pc >/dev/null 2>/dev/null; then
         sed -i "s@-L${STAGING_LIBDIR}@-L\${libdir}@g" ${D}${libdir}/pkgconfig/Qt5*.pc
     fi
diff --git a/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb b/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
index 25bc530..1521dbf 100755
--- a/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
+++ b/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
@@ -53,7 +53,6 @@ RDEPENDS_${PN} += " \
     qttranslations-qtconnectivity \
     qtdeclarative-dev \
     qtdeclarative-mkspecs \
-    qtdeclarative-plugins \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'qtdeclarative-qmlplugins', '', d)} \
     qtdeclarative-tools \
     qtdeclarative-staticdev \
diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index 7452648..526a9c1 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -27,21 +27,18 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/qtbase:"
 # common for qtbase-native, qtbase-nativesdk and qtbase
 SRC_URI += "\
     file://0001-Add-linux-oe-g-platform.patch \
-    file://0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch \
     file://0003-Add-external-hostbindir-option.patch \
     file://0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch \
     file://0005-configure-bump-path-length-from-256-to-512-character.patch \
     file://0006-QOpenGLPaintDevice-sub-area-support.patch \
-    file://0007-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch \
     file://0008-configure-paths-for-target-qmake-properly.patch \
-    file://0009-Reorder-EGL-libraries-from-pkgconfig-and-defaults.patch \
+    file://0009-Disable-all-unknown-features-instead-of-erroring-out.patch \
     file://0010-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch \
 "
 
 # common for qtbase-native and nativesdk-qtbase
 SRC_URI += " \
     file://0011-Always-build-uic.patch \
-    file://0012-Add-external-hostbindir-option-for-native-sdk.patch \
 "
 
 # CMake's toolchain configuration of nativesdk-qtbase
@@ -58,10 +55,11 @@ FILES_${PN}-tools-dev = " \
     ${FILES_SOLIBSDEV} ${libdir}/*.la \
     ${libdir}/*.prl \
     ${OE_QMAKE_PATH_ARCHDATA}/mkspecs \
+    ${OE_QMAKE_PATH_LIBS}/*.prl \
 "
 
 FILES_${PN}-tools-staticdev = " \
-    ${libdir}/libQt5Bootstrap.a \
+    ${OE_QMAKE_PATH_LIBS}/*.a \
 "
 
 FILES_${PN}-tools-dbg = " \
@@ -95,71 +93,10 @@ QT_CONFIG_FLAGS += " \
 OE_QMAKE_PATH_HOST_DATA = "${libdir}${QT_DIR_NAME}"
 OE_QMAKE_PATH_HOST_LIBS = "${libdir}"
 
-do_generate_qt_config_file() {
-    cat > ${QT_CONF_PATH} <<EOF
-[Paths]
-Prefix = ${OE_QMAKE_PATH_PREFIX}
-Headers = ${OE_QMAKE_PATH_HEADERS}
-Libraries = ${OE_QMAKE_PATH_LIBS}
-ArchData = ${OE_QMAKE_PATH_ARCHDATA}
-Data = ${OE_QMAKE_PATH_DATA}
-Binaries = ${OE_QMAKE_PATH_BINS}
-LibraryExecutables = ${OE_QMAKE_PATH_LIBEXECS}
-Plugins = ${OE_QMAKE_PATH_PLUGINS}
-Imports = ${OE_QMAKE_PATH_IMPORTS}
-Qml2Imports = ${OE_QMAKE_PATH_QML}
-Translations = ${OE_QMAKE_PATH_TRANSLATIONS}
-Documentation = ${OE_QMAKE_PATH_DOCS}
-Settings = ${OE_QMAKE_PATH_SETTINGS}
-Examples = ${OE_QMAKE_PATH_EXAMPLES}
-Tests = ${OE_QMAKE_PATH_TESTS}
-HostBinaries = ${OE_QMAKE_PATH_HOST_BINS}
-HostData = ${OE_QMAKE_PATH_HOST_DATA}
-HostLibraries = ${OE_QMAKE_PATH_HOST_LIBS}
-HostSpec = ${OE_QMAKESPEC}
-TartgetSpec = ${OE_XQMAKESPEC}
-ExternalHostBinaries = ${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}
-Sysroot =
-EOF
-}
-
-do_generate_qt_config_file_append() {
-    cat >> ${QT_CONF_PATH} <<EOF
-
-[EffectivePaths]
-Prefix=..
-EOF
-}
-
-# qtbase is exception, we need to use mkspecs from ${S}
-QMAKE_MKSPEC_PATH = "${B}"
-
-# qtbase is exception, configure script is using our get(X)QEvalMakeConf and setBootstrapEvalVariable functions to read it from shell
-export OE_QMAKE_COMPILER
-export OE_QMAKE_CC
-export OE_QMAKE_CFLAGS
-export OE_QMAKE_CXX
-export OE_QMAKE_CXXFLAGS
-export OE_QMAKE_LINK
-export OE_QMAKE_LDFLAGS
-export OE_QMAKE_AR
-export OE_QMAKE_STRIP
-
-# another exception is that we need to run bin/qmake, because EffectivePaths are relative to qmake location
-OE_QMAKE_QMAKE_ORIG = "${STAGING_BINDIR_NATIVE}${QT_DIR_NAME}/qmake"
-OE_QMAKE_QMAKE = "bin/qmake"
-
 do_configure() {
-    # we need symlink in path relative to source, because
-    # EffectivePaths:Prefix is relative to qmake location
-    if [ ! -e ${B}/bin/qmake ]; then
-        mkdir -p ${B}/bin
-        ln -sf ${OE_QMAKE_QMAKE_ORIG} ${B}/bin/qmake
-    fi
-
     ${S}/configure -v \
         -opensource -confirm-license \
-        -sysroot ${STAGING_DIR_NATIVE} \
+        -sysroot ${STAGING_DIR_TARGET} \
         -no-gcc-sysroot \
         -system-zlib \
         -dbus-runtime \
@@ -193,33 +130,22 @@ do_configure() {
         -testsdir ${OE_QMAKE_PATH_TESTS} \
         -hostbindir ${OE_QMAKE_PATH_HOST_BINS} \
         -hostdatadir ${OE_QMAKE_PATH_HOST_DATA} \
+        -host-option CROSS_COMPILE=${HOST_PREFIX} \
         -external-hostbindir ${OE_QMAKE_PATH_EXTERNAL_HOST_BINS} \
         -no-glib \
         -no-iconv \
         -silent \
         -nomake examples \
         -nomake tests \
-        -nomake libs \
         -no-compile-examples \
         -no-rpath \
-        -platform ${OE_QMAKESPEC} \
-        -xplatform linux-oe-g++ \
+        -platform ${OE_QMAKE_PLATFORM_NATIVE} \
+        -xplatform ${OE_QMAKE_PLATFORM} \
         ${QT_CONFIG_FLAGS}
-
-    bin/qmake ${OE_QMAKE_DEBUG_OUTPUT} ${S} -o Makefile || die "Configuring qt with qmake failed. PACKAGECONFIG_CONFARGS was ${PACKAGECONFIG_CONFARGS}"
 }
 
 do_install() {
-    # Fix install paths for all
-    find . -name "Makefile*" | xargs sed -i "s,(INSTALL_ROOT)${STAGING_DIR_NATIVE}${STAGING_DIR_NATIVE},(INSTALL_ROOT)${STAGING_DIR_NATIVE},g"
-
-    oe_runmake install INSTALL_ROOT=${D}
-
-    install -m 755 ${B}/bin/qmake-target ${D}${OE_QMAKE_PATH_HOST_BINS}/qmake
-
-    # for modules which are still using syncqt and call qtPrepareTool(QMAKE_SYNCQT, syncqt)
-    # e.g. qt3d, qtwayland
-    ln -sf syncqt.pl ${D}${OE_QMAKE_PATH_QT_BINS}/syncqt
+    qmake5_base_do_install
 
     # remove things unused in nativesdk, we need the headers and libs
     rm -rf ${D}${datadir} \
@@ -262,4 +188,4 @@ fakeroot do_generate_qt_environment_file() {
 
 addtask generate_qt_environment_file after do_install before do_package
 
-SRCREV = "69b43e74d78e050cf5e40197acafa4bc9f90c0bd"
+SRCREV = "969bb10eed646313209fcdd9b84605aa98fc88de"
diff --git a/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch b/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch
index bb337fd..2e8d887 100644
--- a/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch
+++ b/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch
@@ -1,4 +1,4 @@
-From befe1fd63c485b8d10d1b9f1eca3368f3ee0042b Mon Sep 17 00:00:00 2001
+From 19e8db58f5c344cc15aba5c0525ceddaa307d39d Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@theqtcompany.com>
 Date: Wed, 10 Feb 2016 09:02:09 +0200
 Subject: [PATCH] Allow a tools-only build
@@ -8,12 +8,12 @@ Subject: [PATCH] Allow a tools-only build
  1 file changed, 6 insertions(+), 1 deletion(-)
 
 diff --git a/qt3d.pro b/qt3d.pro
-index a26e76d..016fb30 100644
+index 83e0ffc..9bb7690 100644
 --- a/qt3d.pro
 +++ b/qt3d.pro
 @@ -1,4 +1,4 @@
--requires(contains(QT_CONFIG, opengl))
-+!tools-only:requires(contains(QT_CONFIG, opengl))
+-requires(qtConfig(opengl))
++!tools-only:requires(qtConfig(opengl))
  
  load(configure)
  qtCompileTest(assimp)
diff --git a/recipes-qt/qt5/qt3d_git.bb b/recipes-qt/qt5/qt3d_git.bb
index 9708ec9..2922173 100644
--- a/recipes-qt/qt5/qt3d_git.bb
+++ b/recipes-qt/qt5/qt3d_git.bb
@@ -3,9 +3,9 @@ require qt5-git.inc
 
 LICENSE = "LGPL-3.0 | GPL-2.0"
 LIC_FILES_CHKSUM = " \
-    file://LICENSE.LGPLv3;md5=3dcffeed712d3c916f9a2d9135703aff \
-    file://LICENSE.GPLv3;md5=40f9bf30e783ddc201497165dfb32afb \
-    file://LICENSE.GPL;md5=05832301944453ec79e40ba3c3cfceec \
+    file://LICENSE.LGPLv3;md5=8211fde12cc8a4e2477602f5953f5b71 \
+    file://LICENSE.GPLv3;md5=88e2b9117e6be406b5ed6ee4ca99a705 \
+    file://LICENSE.GPL;md5=c96076271561b0e3785dad260634eaa8 \
 "
 
 DEPENDS += "qtbase"
@@ -18,7 +18,7 @@ SRC_URI += " \
 PACKAGECONFIG ??= ""
 PACKAGECONFIG_class-native ??= "tools-only"
 PACKAGECONFIG_class-nativesdk ??= "tools-only"
-PACKAGECONFIG[tools-only] = "CONFIG+=tools-only"
+PACKAGECONFIG[tools-only] = "CONFIG+=tools-only QMAKE_USE_PRIVATE+=zlib"
 
 EXTRA_QMAKEVARS_PRE += "${PACKAGECONFIG_CONFARGS}"
 
@@ -27,6 +27,6 @@ FILES_${PN}-qmlplugins += " \
     ${OE_QMAKE_PATH_QML}/*/*/*.obj \
 "
 
-SRCREV = "c3fdb888fbd94de0f6b7b1a6859cba8132ecc93d"
+SRCREV = "6e8e228852f0930638b0e0272509809a0fb9ab42"
 
 BBCLASSEXTEND += "native nativesdk"
diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
index e1e25ba..a1dd16a 100644
--- a/recipes-qt/qt5/qt5-git.inc
+++ b/recipes-qt/qt5/qt5-git.inc
@@ -2,7 +2,7 @@
 # Copyright (C) 2013-2016 Martin Jansa <martin.jansa@gmail.com>
 
 QT_MODULE ?= "${BPN}"
-QT_MODULE_BRANCH ?= "5.7"
+QT_MODULE_BRANCH ?= "5.8"
 QT_MODULE_BRANCH_PARAM ?= "branch=${QT_MODULE_BRANCH}"
 
 # each module needs to define valid SRCREV
@@ -12,4 +12,4 @@ SRC_URI = " \
 
 S = "${WORKDIR}/git"
 
-PV = "5.7.0+git${SRCPV}"
+PV = "5.8.0+git${SRCPV}"
diff --git a/recipes-qt/qt5/qt5.inc b/recipes-qt/qt5/qt5.inc
index b066dde..a01c490 100644
--- a/recipes-qt/qt5/qt5.inc
+++ b/recipes-qt/qt5/qt5.inc
@@ -103,11 +103,13 @@ FILES_${PN}-qmlplugins = " \
     ${OE_QMAKE_PATH_QML}/*/*.qmltypes \
     ${OE_QMAKE_PATH_QML}/*/*.qml \
     ${OE_QMAKE_PATH_QML}/*/*.js \
+    ${OE_QMAKE_PATH_QML}/*/*.png \
     ${OE_QMAKE_PATH_QML}/*/*/*${SOLIBSDEV} \
     ${OE_QMAKE_PATH_QML}/*/*/qmldir \
     ${OE_QMAKE_PATH_QML}/*/*/*.qmltypes \
     ${OE_QMAKE_PATH_QML}/*/*/*.qml \
     ${OE_QMAKE_PATH_QML}/*/*/*.js \
+    ${OE_QMAKE_PATH_QML}/*/*/*.png \
     ${OE_QMAKE_PATH_QML}/*/*/*/*${SOLIBSDEV} \
     ${OE_QMAKE_PATH_QML}/*/*/*/qmldir \
     ${OE_QMAKE_PATH_QML}/*/*/*/images \
diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index 4da5640..b8dc6f3 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -22,33 +22,23 @@ require qt5-git.inc
 # common for qtbase-native, qtbase-nativesdk and qtbase
 SRC_URI += "\
     file://0001-Add-linux-oe-g-platform.patch \
-    file://0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch \
     file://0003-Add-external-hostbindir-option.patch \
     file://0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch \
     file://0005-configure-bump-path-length-from-256-to-512-character.patch \
     file://0006-QOpenGLPaintDevice-sub-area-support.patch \
-    file://0007-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch \
     file://0008-configure-paths-for-target-qmake-properly.patch \
-    file://0009-Reorder-EGL-libraries-from-pkgconfig-and-defaults.patch \
+    file://0009-Disable-all-unknown-features-instead-of-erroring-out.patch \
     file://0010-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch \
 "
 
 # common for qtbase-native and nativesdk-qtbase
 SRC_URI += " \
     file://0011-Always-build-uic.patch \
-    file://0012-Add-external-hostbindir-option-for-native-sdk.patch \
 "
 
 CLEANBROKEN = "1"
 
-QT_CONF_PATH = "${B}/qt.conf"
-
-do_generate_qt_config_file() {
-    :
-}
-
 PACKAGECONFIG_CONFARGS = " \
-    -prefix ${prefix} \
     -sysroot ${STAGING_DIR_NATIVE} \
     -no-gcc-sysroot \
     -system-zlib \
@@ -68,11 +58,15 @@ PACKAGECONFIG_CONFARGS = " \
     -verbose \
     -release \
     -prefix ${OE_QMAKE_PATH_PREFIX} \
+    -hostprefix ${OE_QMAKE_PATH_PREFIX} \
     -bindir ${OE_QMAKE_PATH_BINS} \
+    -hostbindir ${OE_QMAKE_PATH_BINS} \
     -libdir ${OE_QMAKE_PATH_LIBS} \
+    -hostlibdir ${OE_QMAKE_PATH_LIBS} \
     -headerdir ${OE_QMAKE_PATH_HEADERS} \
     -archdatadir ${OE_QMAKE_PATH_ARCHDATA} \
     -datadir ${OE_QMAKE_PATH_DATA} \
+    -hostdatadir ${QMAKE_MKSPEC_PATH_NATIVE} \
     -docdir ${OE_QMAKE_PATH_DOCS} \
     -sysconfdir ${OE_QMAKE_PATH_SETTINGS} \
     -no-glib \
@@ -84,20 +78,8 @@ PACKAGECONFIG_CONFARGS = " \
     -platform linux-oe-g++ \
 "
 
-# qtbase is exception, configure script is using our get(X)QEvalMakeConf and setBootstrapEvalVariable functions to read it from shell
-export OE_QMAKE_COMPILER
-export OE_QMAKE_CC
-export OE_QMAKE_CFLAGS
-export OE_QMAKE_CXX
-export OE_QMAKE_CXXFLAGS
-export OE_QMAKE_LINK
-export OE_QMAKE_LDFLAGS
-export OE_QMAKE_AR
-export OE_QMAKE_STRIP
-
 do_configure_prepend() {
     MAKEFLAGS="${PARALLEL_MAKE}" ${S}/configure -opensource -confirm-license ${PACKAGECONFIG_CONFARGS} || die "Configuring qt failed. PACKAGECONFIG_CONFARGS was ${PACKAGECONFIG_CONFARGS}"
-    bin/qmake ${OE_QMAKE_DEBUG_OUTPUT} ${S} -o Makefile || die "Configuring qt with qmake failed. PACKAGECONFIG_CONFARGS was ${PACKAGECONFIG_CONFARGS}"
 }
 
 do_install() {
@@ -123,4 +105,4 @@ do_install() {
     ln -sf syncqt.pl ${D}${OE_QMAKE_PATH_QT_BINS}/syncqt
 }
 
-SRCREV = "69b43e74d78e050cf5e40197acafa4bc9f90c0bd"
+SRCREV = "969bb10eed646313209fcdd9b84605aa98fc88de"
diff --git a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
index b28ca8b..df2016e 100644
--- a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
+++ b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
@@ -1,4 +1,4 @@
-From d6c75f788e15fb552eacb08359698a1342a97f20 Mon Sep 17 00:00:00 2001
+From 2784921c40d0b523c75e613e48b7fd1e90ba3ef1 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 15 Apr 2013 04:29:32 +0200
 Subject: [PATCH] Add linux-oe-g++ platform
@@ -7,176 +7,53 @@ Subject: [PATCH] Add linux-oe-g++ platform
   shell environment, because it's easier for qt recipes to export
   *FLAGS or CC specific for given recipe
 
-* configure: add getQEvalMakeConf and getXQEvalMakeConf
-  Allow expansion of $(...) references from qmake.conf to generate
-  qmake environment from shell environment as exported by qmake5_base
-
-* configure: don't export SYSTEM_VARIABLES to .qmake.vars
-  linux-oe-g++ should handle this correctly and exporting LD as QMAKE_LINK is
-  causing issues as we need g++ to be used as linker
+* configure: extend setBootstrapVariable to convert $$(...) operator
+  to $(...) operator to work in qmake's Makefiles
 
 * configure.prf: Allow to add extra arguments to make
   sometimes we would like to add -e or define some variable and respect it from both
   Makefiles used in configure tests and also Makefiles to build the application
 
-* OE_QMAKE_CXX in order to allow compiler version check to succeed
-  which allows WebKit to be enabled.
-
-* Other variables in order to let config.tests to use our -platform
-  settings
-
-* Add setBootstrapEvalVariable to bootstrap qmake with our environment
-  too, this allows us to use -platform linux-oe-g++ also for native
-  recipe
-
-* disable gdb_dwarf_index
-  * qmake is trying to call native gdb and we don't depend on gdb-native
-    (or even provide gdb-native)
-  * fixes errors like this:
-    /bin/sh: gdb: command not found
-    /bin/sh: line 0: test: -gt: unary operator expected
-    which are not fatal, but still misleading in do_configure output
-
-* add -target suffix to qmake built in qtbase configure, this way we can
-  use qmake from qtbase-native, but then include qmake built for target
-  in qtbase-tools package (smilarly for nativesdk-qtbase).
-
 Upstream-Status: Inappropriate [embedded specific]
                  too OE specific, probably cannot be upstreamed
 
 Change-Id: I0591ed5da0d61d7cf1509d420e6b293582f1863c
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
- configure                            |  55 ++++++++++++-------
- mkspecs/features/configure.prf       |   4 +-
- mkspecs/linux-oe-g++/qmake.conf      |  42 +++++++++++++++
- mkspecs/linux-oe-g++/qplatformdefs.h | 100 +++++++++++++++++++++++++++++++++++
- 4 files changed, 181 insertions(+), 20 deletions(-)
+ configure                            |  2 +-
+ mkspecs/features/configure.prf       |  4 ++--
+ mkspecs/features/qt_functions.prf    |  2 +-
+ mkspecs/linux-oe-g++/qmake.conf      | 43 ++++++++++++++++++++++++++++++++++++
+ mkspecs/linux-oe-g++/qplatformdefs.h |  1 +
+ 5 files changed, 48 insertions(+), 4 deletions(-)
  create mode 100644 mkspecs/linux-oe-g++/qmake.conf
  create mode 100644 mkspecs/linux-oe-g++/qplatformdefs.h
 
 diff --git a/configure b/configure
-index 0ba0c31..052872e 100755
+index 789ba4c..59cce01 100755
 --- a/configure
 +++ b/configure
-@@ -333,6 +333,16 @@ getQMakeConf()
-     getSingleQMakeVariable "$1" "$specvals"
- }
- 
-+# OE qmake.conf is reading some variables from shell env
-+# read them from qmake.conf, replace qmake () syntax with shell and eval
-+getQEvalMakeConf()
-+{
-+    VAL=`getQMakeConf "$1" | sed -n 's/$[(]\([0-9a-zA-Z_]*\)[)]/$\1/pg'`
-+    EVAL=`eval "echo ${VAL}"`
-+#    echo "Running getQEvalMakeConf: var='$1', val='`getQMakeConf \"$1\"`, val-sed='$VAL', eval='$EVAL'" >&2
-+    eval "echo ${VAL}"
-+}
-+
- getXQMakeConf()
+@@ -1624,7 +1624,7 @@ fi
+ # is where the resulting variable is written to
+ setBootstrapVariable()
  {
-     if [ -z "$xspecvals" ]; then
-@@ -357,6 +367,16 @@ testXConfig()
-     esac
- }
- 
-+# OE qmake.conf is reading some variables from shell env
-+# read them from qmake.conf, replace qmake () syntax with shell and eval
-+getXQEvalMakeConf()
-+{
-+    VAL=`getXQMakeConf "$1" | sed -n 's/$[(]\([0-9a-zA-Z_]*\)[)]/$\1/pg'`
-+    EVAL=`eval "echo ${VAL}"`
-+#    echo "Running getXQEvalMakeConf: var='$1', val='`getXQMakeConf \"$1\"`, val-sed='$VAL', eval='$EVAL'" >&2
-+    eval "echo ${VAL}"
-+}
-+
- compilerSupportsFlag()
- {
-     cat >conftest.cpp <<EOF
-@@ -578,24 +598,14 @@ fi
- # initalize variables
- #-------------------------------------------------------------------------------
- 
--SYSTEM_VARIABLES="AR RANLIB STRIP OBJDUMP LD CC CXX CFLAGS CXXFLAGS LDFLAGS"
--for varname in $SYSTEM_VARIABLES; do
-+# Export all OE variables for qmake.conf from shell env to QMakeVars
-+OE_VARIABLES="AR CC CFLAGS COMPILER CXX CXXFLAGS LDFLAGS LINK QT_CONFIG STRIP"
-+for varname in $OE_VARIABLES; do
-     qmakevarname="${varname}"
--    qmakecmdargs=""
--    # use LDFLAGS for autoconf compat, but qmake uses QMAKE_LFLAGS
--    if [ "${varname}" = "LDFLAGS" ]; then
--        qmakevarname="LFLAGS"
--    elif [ "${varname}" = "LD" ]; then
--        qmakevarname="LINK"
--    elif [ "${varname}" = "AR" ]; then
--        # QMAKE_AR needs to be set to "/path/to/ar cqs" but the
--        # environment variable will be set to the command only so we
--        # need to append " cqs" for autoconf compatibility
--        qmakecmdargs=" cqs"
--    fi
-     cmd=`echo \
--'if [ -n "\$'${varname}'" ]; then
--    QMakeVar set QMAKE_'${qmakevarname}' "\$'${varname}${qmakecmdargs}'"
-+'if [ -n "\$OE_QMAKE_'${varname}'" ]; then
-+    QMakeVar set OE_QMAKE_'${qmakevarname}' "\$OE_QMAKE_'${varname}'"
-+#    echo "Exporting OE_QMAKE_'${qmakevarname}' value=\"\$OE_QMAKE_'${varname}'\"" >&2
- fi'`
-     eval "$cmd"
- done
-@@ -3443,7 +3453,7 @@ if [ "$XPLATFORM_MAC" = "yes" ]; then
-     [ "$CFG_GTK" = "auto" ] && CFG_GTK=no
- fi
- 
--QMAKE_CONF_COMPILER=`getXQMakeConf QMAKE_CXX`
-+QMAKE_CONF_COMPILER=`getXQEvalMakeConf QMAKE_CXX`
- 
- TEST_COMPILER=$QMAKE_CONF_COMPILER
- 
-@@ -3494,7 +3504,7 @@ if [ "$XPLATFORM_ANDROID" = "yes" ] ; then
-     fi
- fi
- 
--TEST_COMPILER_CXXFLAGS=`getXQMakeConf QMAKE_CXXFLAGS`
-+TEST_COMPILER_CXXFLAGS=`getXQEvalMakeConf QMAKE_CXXFLAGS`
- 
- GCC_MACHINE_DUMP=
- case "$TEST_COMPILER" in *g++) GCC_MACHINE_DUMP=$($TEST_COMPILER -dumpmachine);; esac
-@@ -3893,6 +3903,14 @@ setBootstrapVariable()
-     getQMakeConf "$1" | echo ${2-$1} = `if [ -n "$3" ]; then sed "$3"; else cat; fi` >> "$mkfile"
+-    getQMakeConf "$1" | echo ${2-$1} = `if [ -n "$3" ]; then sed "$3"; else cat; fi` >> "$mkfile"
++    getQMakeConf "$1" | sed 's:\$\$(:\$(:' | echo ${2-$1} = `if [ -n "$3" ]; then sed "$3"; else cat; fi` >> "$mkfile"
  }
  
-+# OE qmake.conf is reading some variables from shell env
-+# read them from qmake.conf, replace qmake () syntax with shell and eval
-+setBootstrapEvalVariable()
-+{
-+    getQEvalMakeConf "$1" | echo ${2-$1} = `if [ -n "$3" ]; then sed "$3"; else cat; fi` >> "$mkfile"
-+}
-+
-+
  # build qmake
- if true; then ###[ '!' -f "$outpath/bin/qmake" ];
-     echo "Creating qmake..."
-@@ -3986,6 +4004,7 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
-             EXEEXT=
-             ;;
-         esac
-+        [ "$QT_CROSS_COMPILE" = "yes" ] && EXEEXT=-target
-         if [ "$BUILD_ON_MAC" = "yes" ]; then
-             echo "COCOA_LFLAGS =-framework Foundation -framework CoreServices" >>"$mkfile"
-             echo "CARBON_LFLAGS =-framework ApplicationServices" >>"$mkfile"
 diff --git a/mkspecs/features/configure.prf b/mkspecs/features/configure.prf
-index a890c7f..151630c 100644
+index f275e3a..5aa15f5 100644
 --- a/mkspecs/features/configure.prf
 +++ b/mkspecs/features/configure.prf
-@@ -71,14 +71,14 @@ defineTest(qtCompileTest) {
+@@ -37,14 +37,14 @@ defineTest(qtCompileTest) {
      }
  
      # Clean up after previous run
 -    exists($$test_out_dir/Makefile):qtRunLoggedCommand("$$test_cmd_base $$QMAKE_MAKE distclean")
 +    exists($$test_out_dir/Makefile):qtRunLoggedCommand("$$test_cmd_base $$QMAKE_MAKE $$(QMAKE_MAKE_ARGS) distclean")
  
-     mkpath($$test_out_dir)|error("Aborting.")
+     mkpath($$test_out_dir)|error()
  
      !isEmpty (QMAKE_QTCONF): qtconfarg = -qtconf $$QMAKE_QTCONF
  
@@ -186,157 +63,72 @@ index a890c7f..151630c 100644
              log("yes$$escape_expand(\\n)")
              msg = "test $$1 succeeded"
              write_file($$QMAKE_CONFIG_LOG, msg, append)
+diff --git a/mkspecs/features/qt_functions.prf b/mkspecs/features/qt_functions.prf
+index 708815d..097ac49 100644
+--- a/mkspecs/features/qt_functions.prf
++++ b/mkspecs/features/qt_functions.prf
+@@ -67,7 +67,7 @@ defineTest(qtHaveModule) {
+ defineTest(qtPrepareTool) {
+     cmd = $$eval(QT_TOOL.$${2}.binary)
+     isEmpty(cmd) {
+-        cmd = $$[QT_HOST_BINS]/$$2
++        cmd = $$[QT_HOST_BINS/get]/$$2
+         exists($${cmd}.pl) {
+             $${1}_EXE = $${cmd}.pl
+             cmd = perl -w $$system_path($${cmd}.pl)
 diff --git a/mkspecs/linux-oe-g++/qmake.conf b/mkspecs/linux-oe-g++/qmake.conf
 new file mode 100644
-index 0000000..311ba04
+index 0000000..c1837e6
 --- /dev/null
 +++ b/mkspecs/linux-oe-g++/qmake.conf
-@@ -0,0 +1,42 @@
+@@ -0,0 +1,43 @@
 +#
 +# qmake configuration for linux-g++ with modifications for building with OpenEmbedded
 +#
 +
-+MAKEFILE_GENERATOR	= UNIX
++MAKEFILE_GENERATOR = UNIX
 +CONFIG += incremental
 +QMAKE_INCREMENTAL_STYLE = sublib
 +
 +include(../common/linux.conf)
 +
 +# QMAKE_<TOOL> (moc, uic, rcc) are gone, overwrite only ar and strip
-+QMAKE_AR              = $(OE_QMAKE_AR) cqs
-+QMAKE_STRIP           = $(OE_QMAKE_STRIP)
-+QMAKE_WAYLAND_SCANNER = $(OE_QMAKE_WAYLAND_SCANNER)
++QMAKE_AR              = $$(OE_QMAKE_AR) cqs
++QMAKE_STRIP           = $$(OE_QMAKE_STRIP)
++QMAKE_WAYLAND_SCANNER = $$(OE_QMAKE_WAYLAND_SCANNER)
 +
 +include(../common/gcc-base-unix.conf)
 +
 +# *FLAGS from gcc-base.conf
-+QMAKE_CFLAGS                += $(OE_QMAKE_CFLAGS)
-+QMAKE_CXXFLAGS              += $(OE_QMAKE_CXXFLAGS)
-+QMAKE_LFLAGS                += $(OE_QMAKE_LDFLAGS)
++QMAKE_CFLAGS                += $$(OE_QMAKE_CFLAGS)
++QMAKE_CXXFLAGS              += $$(OE_QMAKE_CXXFLAGS)
++QMAKE_LFLAGS                += $$(OE_QMAKE_LDFLAGS)
 +
 +include(../common/g++-unix.conf)
 +
 +# tc settings from g++-base.conf
-+QMAKE_COMPILER = $(OE_QMAKE_COMPILER) gcc
-+QMAKE_CC       = $(OE_QMAKE_CC)
-+QMAKE_CXX      = $(OE_QMAKE_CXX)
++QMAKE_COMPILER = $$(OE_QMAKE_COMPILER) gcc
++QMAKE_CC       = $$(OE_QMAKE_CC)
++QMAKE_CXX      = $$(OE_QMAKE_CXX)
 +
-+QMAKE_CFLAGS_RELEASE_WITH_DEBUGINFO += $(OE_QMAKE_CFLAGS)
++QMAKE_CFLAGS_RELEASE_WITH_DEBUGINFO += $$(OE_QMAKE_CFLAGS)
 +
-+QMAKE_LINK         = $(OE_QMAKE_LINK)
-+QMAKE_LINK_SHLIB   = $(OE_QMAKE_LINK)
-+QMAKE_LINK_C       = $(OE_QMAKE_LINK)
-+QMAKE_LINK_C_SHLIB = $(OE_QMAKE_LINK)
++QMAKE_LINK         = $$(OE_QMAKE_LINK)
++QMAKE_LINK_SHLIB   = $$(OE_QMAKE_LINK)
++QMAKE_LINK_C       = $$(OE_QMAKE_LINK)
++QMAKE_LINK_C_SHLIB = $$(OE_QMAKE_LINK)
 +
 +# for the SDK
-+isEmpty(QMAKE_QT_CONFIG):QMAKE_QT_CONFIG = $(OE_QMAKE_QT_CONFIG)
++isEmpty(QMAKE_QT_CONFIG):QMAKE_QT_CONFIG = $$(OE_QMAKE_QT_CONFIG)
 +
 +include(../oe-device-extra.pri)
 +
++load(device_config)
 +load(qt_config)
 diff --git a/mkspecs/linux-oe-g++/qplatformdefs.h b/mkspecs/linux-oe-g++/qplatformdefs.h
 new file mode 100644
-index 0000000..dd12003
+index 0000000..5d22fb4
 --- /dev/null
 +++ b/mkspecs/linux-oe-g++/qplatformdefs.h
-@@ -0,0 +1,100 @@
-+/****************************************************************************
-+**
-+** Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
-+** Contact: http://www.qt-project.org/legal
-+**
-+** This file is part of the qmake spec of the Qt Toolkit.
-+**
-+** $QT_BEGIN_LICENSE:LGPL$
-+** Commercial License Usage
-+** Licensees holding valid commercial Qt licenses may use this file in
-+** accordance with the commercial license agreement provided with the
-+** Software or, alternatively, in accordance with the terms contained in
-+** a written agreement between you and Digia.  For licensing terms and
-+** conditions see http://qt.digia.com/licensing.  For further information
-+** use the contact form at http://qt.digia.com/contact-us.
-+**
-+** GNU Lesser General Public License Usage
-+** Alternatively, this file may be used under the terms of the GNU Lesser
-+** General Public License version 2.1 as published by the Free Software
-+** Foundation and appearing in the file LICENSE.LGPL included in the
-+** packaging of this file.  Please review the following information to
-+** ensure the GNU Lesser General Public License version 2.1 requirements
-+** will be met: http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
-+**
-+** In addition, as a special exception, Digia gives you certain additional
-+** rights.  These rights are described in the Digia Qt LGPL Exception
-+** version 1.1, included in the file LGPL_EXCEPTION.txt in this package.
-+**
-+** GNU General Public License Usage
-+** Alternatively, this file may be used under the terms of the GNU
-+** General Public License version 3.0 as published by the Free Software
-+** Foundation and appearing in the file LICENSE.GPL included in the
-+** packaging of this file.  Please review the following information to
-+** ensure the GNU General Public License version 3.0 requirements will be
-+** met: http://www.gnu.org/copyleft/gpl.html.
-+**
-+**
-+** $QT_END_LICENSE$
-+**
-+****************************************************************************/
-+
-+#ifndef QPLATFORMDEFS_H
-+#define QPLATFORMDEFS_H
-+
-+// Get Qt defines/settings
-+
-+#include "qglobal.h"
-+
-+// Set any POSIX/XOPEN defines at the top of this file to turn on specific APIs
-+
-+// 1) need to reset default environment if _BSD_SOURCE is defined
-+// 2) need to specify POSIX thread interfaces explicitly in glibc 2.0
-+// 3) it seems older glibc need this to include the X/Open stuff
-+#ifndef _GNU_SOURCE
-+#  define _GNU_SOURCE
-+#endif
-+
-+#include <unistd.h>
-+
-+
-+// We are hot - unistd.h should have turned on the specific APIs we requested
-+
-+#include <features.h>
-+#include <pthread.h>
-+#include <dirent.h>
-+#include <fcntl.h>
-+#include <grp.h>
-+#include <pwd.h>
-+#include <signal.h>
-+
-+#include <sys/types.h>
-+#include <sys/ioctl.h>
-+#include <sys/ipc.h>
-+#include <sys/time.h>
-+#include <sys/shm.h>
-+#include <sys/socket.h>
-+#include <sys/stat.h>
-+#include <sys/wait.h>
-+#include <netinet/in.h>
-+#ifndef QT_NO_IPV6IFNAME
-+#include <net/if.h>
-+#endif
-+
-+#define QT_USE_XOPEN_LFS_EXTENSIONS
-+#include "../common/posix/qplatformdefs.h"
-+
-+#undef QT_SOCKLEN_T
-+
-+#if defined(__GLIBC__) && (__GLIBC__ >= 2)
-+#define QT_SOCKLEN_T            socklen_t
-+#else
-+#define QT_SOCKLEN_T            int
-+#endif
-+
-+#if defined(_XOPEN_SOURCE) && (_XOPEN_SOURCE >= 500)
-+#define QT_SNPRINTF		::snprintf
-+#define QT_VSNPRINTF		::vsnprintf
-+#endif
-+
-+#endif // QPLATFORMDEFS_H
+@@ -0,0 +1 @@
++#include "../linux-g++/qplatformdefs.h"
diff --git a/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch b/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
deleted file mode 100644
index 699e385..0000000
--- a/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From e5f8607cfa1d2bcc798686cdf7c87ea0c6577d30 Mon Sep 17 00:00:00 2001
-From: Holger Freyther <zecke@selfish.org>
-Date: Wed, 26 Sep 2012 17:22:30 +0200
-Subject: [PATCH] qlibraryinfo: allow to set qt.conf from the outside using the
- environment
-
-Allow to set a qt.conf from the outside using the environment. This allows
-to inject new prefixes and other paths into qmake. This is needed when using
-the same qmake binary to build qt/x11 and qt/embedded
-
-Upstream-Status: Inappropriate [embedded specific]
-  again very OE specific to read everything from environment (reusing the same
-  qmake from sstate and replacing all configured paths in it with qt.conf from
-  environment).
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- src/corelib/global/qlibraryinfo.cpp | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/src/corelib/global/qlibraryinfo.cpp b/src/corelib/global/qlibraryinfo.cpp
-index 4582001..ff65ef9 100644
---- a/src/corelib/global/qlibraryinfo.cpp
-+++ b/src/corelib/global/qlibraryinfo.cpp
-@@ -163,7 +163,10 @@ void QLibrarySettings::load()
- 
- QSettings *QLibraryInfoPrivate::findConfiguration()
- {
--    QString qtconfig = QStringLiteral(":/qt/etc/qt.conf");
-+    QByteArray config = getenv("QT_CONF_PATH");
-+    QString qtconfig = QFile::decodeName(config);
-+    if(!QFile::exists(qtconfig))
-+        qtconfig = QStringLiteral(":/qt/etc/qt.conf");
-     if (QFile::exists(qtconfig))
-         return new QSettings(qtconfig, QSettings::IniFormat);
- #ifdef QT_BUILD_QMAKE
diff --git a/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch b/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
index 381cde2..8224171 100644
--- a/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
+++ b/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
@@ -1,165 +1,23 @@
-From c1dc6165d6a085f162ed32ef5697f645019f9ee0 Mon Sep 17 00:00:00 2001
+From 502b95b840a5f79e5a68e9bd5b10dbdc92485f1f Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 6 Apr 2013 13:15:07 +0200
 Subject: [PATCH] Add -external-hostbindir option
 
-* when cross-compiling it's sometimes useful to use existing tools from machine
-  (or in OpenEmbedded built with separate native recipe) when building for target
-
-* this way we can skip bootstraping tools we already have
-
-* qt_functions: temporary remove isEmpty check
-* now we assume that every build will provide QT_EXTERNAL_HOST_BINS value
-* isEmpty works correctly only with qmake variables (e.g. $$FOO -
-  isEmpty(FOO)), but doesn't work with system properties like $$[FOO].
-
 * cmake: Use OE_QMAKE_PATH_EXTERNAL_HOST_BINS to determine path to host binaries
 
-Upstream-Status: Pending
-  is a lot better for upstreaming (and it was already sort of approved by
-  Oswald) but in 5.2.0 I've noticed that he added something similar for
-  android builds
+Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 Signed-off-by: Simon Busch <morphis@gravedo.de>
 Signed-off-by: Jonathan Liu <net147@gmail.com>
 
-Conflicts:
-        configure
-
 Change-Id: Iacaa1c5531cd6dcc094891610c351673db55d7b2
 ---
- configure                                   | 14 ++++++++++++++
- mkspecs/features/qt_functions.prf           |  6 +++++-
- mkspecs/features/qt_tool.prf                |  4 +++-
- qtbase.pro                                  | 16 ++++++++++++++++
- src/corelib/Qt5CoreConfigExtras.cmake.in    |  6 +++---
- src/dbus/Qt5DBusConfigExtras.cmake.in       |  4 ++--
- src/widgets/Qt5WidgetsConfigExtras.cmake.in |  2 +-
- 7 files changed, 44 insertions(+), 8 deletions(-)
+ src/corelib/Qt5CoreConfigExtras.cmake.in    | 6 +++---
+ src/dbus/Qt5DBusConfigExtras.cmake.in       | 4 ++--
+ src/widgets/Qt5WidgetsConfigExtras.cmake.in | 2 +-
+ 3 files changed, 6 insertions(+), 6 deletions(-)
 
-diff --git a/configure b/configure
-index 052872e..1fcbb3a 100755
---- a/configure
-+++ b/configure
-@@ -834,6 +834,7 @@ QT_HOST_BINS=
- QT_HOST_LIBS=
- QT_HOST_DATA=
- QT_EXT_PREFIX=
-+QT_EXTERNAL_HOST_BINS=
- 
- #flags for SQL drivers
- QT_CFLAGS_PSQL=
-@@ -953,6 +954,7 @@ while [ "$#" -gt 0 ]; do
-     -testsdir| \
-     -hostdatadir| \
-     -hostbindir| \
-+    -external-hostbindir| \
-     -hostlibdir| \
-     -extprefix| \
-     -sysroot| \
-@@ -1185,6 +1187,9 @@ while [ "$#" -gt 0 ]; do
-     extprefix)
-         QT_EXT_PREFIX="$VAL"
-         ;;
-+    external-hostbindir)
-+        QT_EXTERNAL_HOST_BINS="$VAL"
-+        ;;
-     pkg-config)
-         if [ "$VAL" = "yes" ] || [ "$VAL" = "no" ]; then
-             CFG_PKGCONFIG="$VAL"
-@@ -2447,6 +2452,10 @@ Installation options:
-     -hostdatadir <dir> . Data used by qmake will be installed to <dir>
-                          (default HOSTPREFIX)
- 
-+    -external-hostbindir <dir> Use external host executables instead of building them
-+                         (not used by defaut)
-+
-+
- Configure options:
- 
-  The defaults (*) are usually acceptable. A plus (+) denotes a default value
-@@ -3209,6 +3218,11 @@ fi
- # command line and environment validation
- #-------------------------------------------------------------------------------
- 
-+# default is empty, don't call makeabs if it is empty
-+if [ ! -z "$QT_EXTERNAL_HOST_BINS" ]; then
-+    QT_EXTERNAL_HOST_BINS=`"$relpath/config.tests/unix/makeabs" "$QT_EXTERNAL_HOST_BINS"`
-+fi
-+
- # update QT_CONFIG to show our current predefined configuration
- CFG_QCONFIG_PATH=$relpath/src/corelib/global/qconfig-${CFG_QCONFIG}.h
- case "$CFG_QCONFIG" in
-diff --git a/mkspecs/features/qt_functions.prf b/mkspecs/features/qt_functions.prf
-index 54641ce..7d7baa4 100644
---- a/mkspecs/features/qt_functions.prf
-+++ b/mkspecs/features/qt_functions.prf
-@@ -71,7 +71,11 @@ defineTest(qtHaveModule) {
- defineTest(qtPrepareTool) {
-     cmd = $$eval(QT_TOOL.$${2}.binary)
-     isEmpty(cmd) {
--        cmd = $$[QT_HOST_BINS]/$$2
-+        QT_EXTERNAL_HOST_BINS = $$[QT_EXTERNAL_HOST_BINS]
-+        isEmpty(QT_EXTERNAL_HOST_BINS): \
-+            cmd = $$[QT_HOST_BINS]/$$2
-+        else: \
-+            cmd = $$[QT_EXTERNAL_HOST_BINS]/$$2
-         exists($${cmd}.pl) {
-             $${1}_EXE = $${cmd}.pl
-             cmd = perl -w $$system_path($${cmd}.pl)
-diff --git a/mkspecs/features/qt_tool.prf b/mkspecs/features/qt_tool.prf
-index bdeb59c..b8c539f 100644
---- a/mkspecs/features/qt_tool.prf
-+++ b/mkspecs/features/qt_tool.prf
-@@ -14,10 +14,12 @@ load(qt_app)
- CONFIG += console
- DEFINES *= QT_USE_QSTRINGBUILDER
- 
-+QT_EXTERNAL_HOST_BINS = $$[QT_EXTERNAL_HOST_BINS]
-+
- # If we are doing a prefix build, create a "module" pri which enables
- # qtPrepareTool() to work with the non-installed build.
- # Non-bootstrapped tools always need this because of the environment setup.
--!build_pass:if(!host_build|!force_bootstrap|force_independent|!isEmpty(HOST_QT_TOOLS)) {
-+!build_pass:if(!host_build|!force_bootstrap|force_independent|!isEmpty(HOST_QT_TOOLS)):isEmpty(QT_EXTERNAL_HOST_BINS) {
-     isEmpty(MODULE):MODULE = $$TARGET
- 
-     load(qt_build_paths)
-diff --git a/qtbase.pro b/qtbase.pro
-index 11cff9e..ec03669 100644
---- a/qtbase.pro
-+++ b/qtbase.pro
-@@ -38,6 +38,19 @@ CONFIG -= qt
- 
- ### installations ####
- 
-+QT_EXTERNAL_HOST_BINS = $$[QT_EXTERNAL_HOST_BINS]
-+
-+#qmake
-+qmake.path = $$[QT_HOST_BINS]
-+qmake.files = $$OUT_PWD/bin/qmake
-+!isEmpty(QT_EXTERNAL_HOST_BINS) {
-+   qmake.files = $$[QT_EXTERNAL_HOST_BINS]/qmake
-+}
-+equals(QMAKE_HOST.os, Windows) {
-+   qmake.files = $${qmake.files}.exe
-+}
-+INSTALLS += qmake
-+
- #licheck
- licheck.path = $$[QT_HOST_BINS]
- licheck.files = $$PWD/bin/$$QT_LICHECK
-@@ -51,6 +64,9 @@ INSTALLS += fixqt4headers
- #syncqt
- syncqt.path = $$[QT_HOST_BINS]
- syncqt.files = $$PWD/bin/syncqt.pl
-+!isEmpty(QT_EXTERNAL_HOST_BINS) {
-+   syncqt.files = $$[QT_EXTERNAL_HOST_BINS]/syncqt.pl
-+}
- INSTALLS += syncqt
- 
- # If we are doing a prefix build, create a "module" pri which enables
 diff --git a/src/corelib/Qt5CoreConfigExtras.cmake.in b/src/corelib/Qt5CoreConfigExtras.cmake.in
 index a5ed8b2..0e11a1e 100644
 --- a/src/corelib/Qt5CoreConfigExtras.cmake.in
diff --git a/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch b/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
index e24d475..c105488 100644
--- a/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
+++ b/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
@@ -1,4 +1,4 @@
-From d83234c35de8f52ce3bf6eb262ad8e6af467ac34 Mon Sep 17 00:00:00 2001
+From bf1498618415e7b1e57b54881b1e56d74f2cdf6b Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 27 Apr 2013 23:15:37 +0200
 Subject: [PATCH] qt_module: Fix pkgconfig and libtool replacements
@@ -68,7 +68,7 @@ Signed-off-by: Jonathan Liu <net147@gmail.com>
  2 files changed, 14 insertions(+), 1 deletion(-)
 
 diff --git a/mkspecs/features/qt.prf b/mkspecs/features/qt.prf
-index 71e96b4..0d7535c 100644
+index 0c5f080..a6e4f09 100644
 --- a/mkspecs/features/qt.prf
 +++ b/mkspecs/features/qt.prf
 @@ -317,6 +317,19 @@ contains(TEMPLATE, .*app) {
@@ -89,13 +89,13 @@ index 71e96b4..0d7535c 100644
 +}
 +
  QT_PLUGIN_VERIFY = DEPLOYMENT_PLUGIN
- contains(QT_CONFIG, static) {
+ qtConfig(static) {
      QT_PLUGIN_VERIFY += QTPLUGIN
 diff --git a/mkspecs/features/qt_common.prf b/mkspecs/features/qt_common.prf
-index b367bc1..209cc43 100644
+index e754a17..4c1530e 100644
 --- a/mkspecs/features/qt_common.prf
 +++ b/mkspecs/features/qt_common.prf
-@@ -38,7 +38,7 @@ contains(TEMPLATE, .*lib) {
+@@ -37,7 +37,7 @@ contains(TEMPLATE, .*lib) {
          lib_replace.replace =
      } else {
          lib_replace.match = $$rplbase/lib
diff --git a/recipes-qt/qt5/qtbase/0007-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch b/recipes-qt/qt5/qtbase/0007-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch
deleted file mode 100644
index 4ea4061..0000000
--- a/recipes-qt/qt5/qtbase/0007-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 7ab6ff7ba20a3173c10a76814d3c9ed312c80627 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 8 Jun 2015 13:59:25 -0700
-Subject: [PATCH] linux-oe-g++: Invert conditional for defining QT_SOCKLEN_T
-
-This helps to make sure that QT_SOCKLEN_T is defined to be 'int'
-only when its glibc < 2 and not also for the libraries which may define
-it as per standards but are not glibc, e.g. musl
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- mkspecs/linux-oe-g++/qplatformdefs.h | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/mkspecs/linux-oe-g++/qplatformdefs.h b/mkspecs/linux-oe-g++/qplatformdefs.h
-index dd12003..8623651 100644
---- a/mkspecs/linux-oe-g++/qplatformdefs.h
-+++ b/mkspecs/linux-oe-g++/qplatformdefs.h
-@@ -86,10 +86,10 @@
- 
- #undef QT_SOCKLEN_T
- 
--#if defined(__GLIBC__) && (__GLIBC__ >= 2)
--#define QT_SOCKLEN_T            socklen_t
--#else
-+#if defined(__GLIBC__) && (__GLIBC__ < 2)
- #define QT_SOCKLEN_T            int
-+#else
-+#define QT_SOCKLEN_T            socklen_t
- #endif
- 
- #if defined(_XOPEN_SOURCE) && (_XOPEN_SOURCE >= 500)
diff --git a/recipes-qt/qt5/qtbase/0008-configure-paths-for-target-qmake-properly.patch b/recipes-qt/qt5/qtbase/0008-configure-paths-for-target-qmake-properly.patch
index bac1841..6d64e6b 100644
--- a/recipes-qt/qt5/qtbase/0008-configure-paths-for-target-qmake-properly.patch
+++ b/recipes-qt/qt5/qtbase/0008-configure-paths-for-target-qmake-properly.patch
@@ -1,4 +1,4 @@
-From 0f4ab3e27938002134e8f3f9eb12cf9c50b2ab95 Mon Sep 17 00:00:00 2001
+From cc926956758bf8170c4e49c66e1066524b43f65f Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Fri, 13 Nov 2015 12:36:11 +0100
 Subject: [PATCH] configure paths for target qmake properly
@@ -19,11 +19,11 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 19 insertions(+), 4 deletions(-)
 
 diff --git a/configure b/configure
-index f49a674..d30d0ca 100755
+index 8b33c5b..1df248f 100755
 --- a/configure
 +++ b/configure
-@@ -3792,8 +3792,13 @@ if [ "$CFG_COMPILE_EXAMPLES" = "yes" ]; then
-     QMAKE_CONFIG="$QMAKE_CONFIG compile_examples"
+@@ -1545,8 +1545,13 @@ if [ -z "$QT_REL_HOST_DATA" ]; then
+     fi
  fi
  
 -shortxspec=`echo $XQMAKESPEC | sed "s,^${relpath}/mkspecs/,,"`
@@ -38,7 +38,7 @@ index f49a674..d30d0ca 100755
  
  QT_CONFIGURE_STR_OFF=0
  
-@@ -3826,7 +3831,11 @@ QT_CONFIGURE_STRS_ALL=$QT_CONFIGURE_STRS
+@@ -1579,7 +1584,11 @@ QT_CONFIGURE_STRS_ALL=$QT_CONFIGURE_STRS
  
  QT_CONFIGURE_STR_OFFSETS=
  QT_CONFIGURE_STRS=
@@ -51,7 +51,7 @@ index f49a674..d30d0ca 100755
  addConfStr "$QT_REL_HOST_BINS"
  addConfStr "$QT_REL_HOST_LIBS"
  addConfStr "$QT_REL_HOST_DATA"
-@@ -3838,6 +3847,12 @@ addConfStr "$shortspec"
+@@ -1591,6 +1600,12 @@ addConfStr "$shortspec"
  #-------------------------------------------------------------------------------
  [ -d "$outpath/src/corelib/global" ] || mkdir -p "$outpath/src/corelib/global"
  
@@ -62,9 +62,9 @@ index f49a674..d30d0ca 100755
 +fi
 +
  cat > "$outpath/src/corelib/global/qconfig.cpp.new" <<EOF
- /* License Info */
- static const char qt_configure_licensee_str          [256 + 12] = "qt_lcnsuser=$Licensee";
-@@ -3850,7 +3865,7 @@ static const char qt_configure_installation          [12+11]    = "qt_instdate=2
+ /* Installation date */
+ static const char qt_configure_installation          [12+11]    = "qt_instdate=2012-12-20";
+@@ -1599,7 +1614,7 @@ static const char qt_configure_installation          [12+11]    = "qt_instdate=2
  static const char qt_configure_prefix_path_str       [512 + 12] = "qt_prfxpath=$QT_INSTALL_PREFIX";
  #ifdef QT_BUILD_QMAKE
  static const char qt_configure_ext_prefix_path_str   [512 + 12] = "qt_epfxpath=$QT_EXT_PREFIX";
diff --git a/recipes-qt/qt5/qtbase/0009-Disable-all-unknown-features-instead-of-erroring-out.patch b/recipes-qt/qt5/qtbase/0009-Disable-all-unknown-features-instead-of-erroring-out.patch
new file mode 100644
index 0000000..cb9de79
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0009-Disable-all-unknown-features-instead-of-erroring-out.patch
@@ -0,0 +1,28 @@
+From 9eb81e3bdeda4f90e5f2942400aef38b51a356bd Mon Sep 17 00:00:00 2001
+From: Samuli Piippo <samuli.piippo@qt.io>
+Date: Mon, 24 Oct 2016 09:45:18 +0300
+Subject: [PATCH] Disable all unknown features instead of erroring out
+
+Task-number: QTBUG-56656
+Change-Id: Ib884fe33cac74439f9592b145937f6b75ced8447
+---
+ mkspecs/features/qt_configure.prf | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/mkspecs/features/qt_configure.prf b/mkspecs/features/qt_configure.prf
+index e8fa0c6..0ca5670 100644
+--- a/mkspecs/features/qt_configure.prf
++++ b/mkspecs/features/qt_configure.prf
+@@ -1009,7 +1009,8 @@ defineReplace(qtConfEvaluateSingleExpression) {
+                     error("Expression '$$1' is accessing field '$$var' of non-local feature $${feature}.")
+                 return($$result)
+             }
+-            error("Unknown feature object $${feature} in expression '$${1}'.")
++            warning("Unknown feature object $${feature} in expression '$${1}'.")
++            result = false
+         }
+         !qtConfCheckFeature($$feature): \
+             error("Expression '$$1' is accessing non-emitted feature $${feature}.")
+-- 
+1.9.1
+
diff --git a/recipes-qt/qt5/qtbase/0009-Reorder-EGL-libraries-from-pkgconfig-and-defaults.patch b/recipes-qt/qt5/qtbase/0009-Reorder-EGL-libraries-from-pkgconfig-and-defaults.patch
deleted file mode 100644
index 23d0ab3..0000000
--- a/recipes-qt/qt5/qtbase/0009-Reorder-EGL-libraries-from-pkgconfig-and-defaults.patch
+++ /dev/null
@@ -1,95 +0,0 @@
-From 91b87aed0a2a96b0d6b54757ea13c75ee648a9b0 Mon Sep 17 00:00:00 2001
-From: Julien Gueytat <contact@jgueytat.fr>
-Date: Wed, 27 Apr 2016 19:24:39 +0200
-Subject: [PATCH] Reorder EGL libraries from pkgconfig and defaults:
-
-https://bugreports.qt.io/browse/QTBUG-50838
-https://bugreports.qt.io/browse/QTBUG-52739
-
-The modification is the less intrusive possible. It only swaps LIBS and QMAKE_LIBS_EGL.
-The reason behind that was that for the RaspberryPi:
- *  -lEGL -GLESv2 can link
- *  -lGLESv2 -lEGL can't
-
-Adding -lEGL -lGLESv2 and then -lEGL gives -lGLESv2 -lEGL ... the libraries swaped.
-
-Signed-off-by: Julien Gueytat <contact@jgueytat.fr>
----
- config.tests/qpa/egl/egl.pro               |  5 ++++-
- config.tests/qpa/eglfs-brcm/eglfs-brcm.pro | 12 +++++++-----
- configure                                  | 16 ++++++++++++++--
- 3 files changed, 25 insertions(+), 8 deletions(-)
-
-diff --git a/config.tests/qpa/egl/egl.pro b/config.tests/qpa/egl/egl.pro
-index b5396da..828b674 100644
---- a/config.tests/qpa/egl/egl.pro
-+++ b/config.tests/qpa/egl/egl.pro
-@@ -5,6 +5,9 @@ for(p, QMAKE_LIBDIR_EGL) {
- }
- 
- !isEmpty(QMAKE_INCDIR_EGL): INCLUDEPATH += $$QMAKE_INCDIR_EGL
--!isEmpty(QMAKE_LIBS_EGL): LIBS += $$QMAKE_LIBS_EGL
-+
-+BACKUP_LIBS = $$LIBS
-+!isEmpty(QMAKE_LIBS_EGL): LIBS = $$QMAKE_LIBS_EGL
-+LIBS += $$BACKUP_LIBS
- 
- CONFIG -= qt
-diff --git a/config.tests/qpa/eglfs-brcm/eglfs-brcm.pro b/config.tests/qpa/eglfs-brcm/eglfs-brcm.pro
-index d8b1c3e..06f7241 100644
---- a/config.tests/qpa/eglfs-brcm/eglfs-brcm.pro
-+++ b/config.tests/qpa/eglfs-brcm/eglfs-brcm.pro
-@@ -1,11 +1,13 @@
- SOURCES = eglfs-brcm.cpp
- 
--CONFIG -= qt
--
--INCLUDEPATH += $$QMAKE_INCDIR_EGL
--
- for(p, QMAKE_LIBDIR_EGL) {
-     LIBS += -L$$p
- }
- 
--LIBS += -lEGL -lGLESv2 -lbcm_host
-+INCLUDEPATH += $$QMAKE_INCDIR_EGL
-+
-+BACKUP_LIBS = $$LIBS
-+LIBS = -lEGL -lGLESv2 -lbcm_host
-+LIBS += $$BACKUP_LIBS
-+
-+CONFIG -= qt
-diff --git a/configure b/configure
-index d30d0ca..14f348c 100755
---- a/configure
-+++ b/configure
-@@ -5891,7 +5891,9 @@ if [ "$CFG_EGL" != "no" ]; then
-         QMakeVar set QMAKE_INCDIR_EGL "$QMAKE_INCDIR_EGL"
-         QMakeVar set QMAKE_LIBS_EGL "$QMAKE_LIBS_EGL"
-         QMakeVar set QMAKE_CFLAGS_EGL "`echo " $QMAKE_CFLAGS_EGL " | sed -e 's, -I[^ ]* , ,g;s,^ ,,;s, $,,'`"
--    fi       # detect EGL support
-+    fi
-+    
-+    # detect EGL support
-     if compileTest qpa/egl "EGL" $QMAKE_CFLAGS_EGL $QMAKE_LIBS_EGL; then
-         CFG_EGL=yes
-         if compileTest qpa/egl-x11 "EGL-X11" $QMAKE_CFLAGS_EGL $QMAKE_LIBS_EGL; then
-@@ -5914,8 +5916,18 @@ fi
- if [ "$CFG_EGLFS" != "no" ]; then
-     if [ "$XPLATFORM_QNX" = "no" ] && [ "$CFG_OPENGL" != "no" ]; then
-         CFG_EGLFS="$CFG_EGL"
-+
-+        if [ -n "$PKG_CONFIG" ] && $PKG_CONFIG --exists egl 2>/dev/null; then
-+            QMAKE_INCDIR_EGL=`$PKG_CONFIG --cflags-only-I egl 2>/dev/null | sed -e 's,^-I,,g' -e 's, -I, ,g'`
-+            QMAKE_LIBS_EGL=`$PKG_CONFIG --libs egl 2>/dev/null`
-+            QMAKE_CFLAGS_EGL=`$PKG_CONFIG --cflags egl 2>/dev/null`
-+            QMakeVar set QMAKE_INCDIR_EGL "$QMAKE_INCDIR_EGL"
-+            QMakeVar set QMAKE_LIBS_EGL "$QMAKE_LIBS_EGL"
-+            QMakeVar set QMAKE_CFLAGS_EGL "`echo " $QMAKE_CFLAGS_EGL " | sed -e 's, -I[^ ]* , ,g;s,^ ,,;s, $,,'`"
-+        fi
-+
-         # Detect eglfs backends.
--        if compileTest qpa/eglfs-brcm "eglfs-brcm"; then
-+        if compileTest qpa/eglfs-brcm "eglfs-brcm" $QMAKE_CFLAGS_EGL $QMAKE_LIBS_EGL; then
-             CFG_EGLFS_BRCM=yes
-         else
-             CFG_EGLFS_BRCM=no
diff --git a/recipes-qt/qt5/qtbase/0012-Add-external-hostbindir-option-for-native-sdk.patch b/recipes-qt/qt5/qtbase/0012-Add-external-hostbindir-option-for-native-sdk.patch
deleted file mode 100644
index 1ab8abe..0000000
--- a/recipes-qt/qt5/qtbase/0012-Add-external-hostbindir-option-for-native-sdk.patch
+++ /dev/null
@@ -1,131 +0,0 @@
-From cb66a3193b1b1b8b402548b615c3675c4adcf13a Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Sat, 6 Apr 2013 13:15:07 +0200
-Subject: [PATCH] Add -external-hostbindir option for native(sdk)
-
-* when cross-compiling it's sometimes useful to use existing tools from machine
-  (or in OpenEmbedded built with separate native recipe) when building for target
-
-* this way we can skip bootstraping tools we already have
-
-* qt_functions: temporary remove isEmpty check
-* now we assume that every build will provide QT_EXTERNAL_HOST_BINS value
-* isEmpty works correctly only with qmake variables (e.g. $$FOO -
-  isEmpty(FOO)), but doesn't work with system properties like $$[FOO].
-
-* cmake: Use OE_QMAKE_PATH_EXTERNAL_HOST_BINS to determine path to host binaries
-
-Upstream-Status: Pending
-  is a lot better for upstreaming (and it was already sort of approved by
-  Oswald) but in 5.2.0 I've noticed that he added something similar for
-  android builds
-
-Change-Id: I4f6e634bf0b2cb96065ee5c38b9cd8a224c3bd37
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-Signed-off-by: Simon Busch <morphis@gravedo.de>
-Signed-off-by: Jonathan Liu <net147@gmail.com>
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
-Conflicts:
-        tools/configure/configureapp.cpp
----
- configure                           |  1 +
- qmake/property.cpp                  |  1 +
- src/corelib/global/qlibraryinfo.cpp |  3 ++-
- src/corelib/global/qlibraryinfo.h   |  1 +
- tools/configure/configureapp.cpp    | 11 +++++++++++
- 5 files changed, 16 insertions(+), 1 deletion(-)
-
-diff --git a/configure b/configure
-index 14f348c..61f22e8 100755
---- a/configure
-+++ b/configure
-@@ -3839,6 +3839,7 @@ fi
- addConfStr "$QT_REL_HOST_BINS"
- addConfStr "$QT_REL_HOST_LIBS"
- addConfStr "$QT_REL_HOST_DATA"
-+addConfStr "$QT_EXTERNAL_HOST_BINS"
- addConfStr "$shortxspec"
- addConfStr "$shortspec"
- 
-diff --git a/qmake/property.cpp b/qmake/property.cpp
-index 9ee08f4..e6ecf92 100644
---- a/qmake/property.cpp
-+++ b/qmake/property.cpp
-@@ -63,6 +63,7 @@ static const struct {
-     { "QT_HOST_DATA", QLibraryInfo::HostDataPath, true },
-     { "QT_HOST_BINS", QLibraryInfo::HostBinariesPath, true },
-     { "QT_HOST_LIBS", QLibraryInfo::HostLibrariesPath, true },
-+    { "QT_EXTERNAL_HOST_BINS", QLibraryInfo::ExternalHostBinariesPath, true },
-     { "QMAKE_SPEC", QLibraryInfo::HostSpecPath, true },
-     { "QMAKE_XSPEC", QLibraryInfo::TargetSpecPath, true },
- };
-diff --git a/src/corelib/global/qlibraryinfo.cpp b/src/corelib/global/qlibraryinfo.cpp
-index ff65ef9..3726831 100644
---- a/src/corelib/global/qlibraryinfo.cpp
-+++ b/src/corelib/global/qlibraryinfo.cpp
-@@ -381,7 +381,7 @@ QLibraryInfo::isDebugBuild()
-  */
- 
- static const struct {
--    char key[19], value[13];
-+    char key[21], value[13];
- } qtConfEntries[] = {
-     { "Prefix", "." },
-     { "Documentation", "doc" }, // should be ${Data}/doc
-@@ -406,6 +406,7 @@ static const struct {
-     { "HostBinaries", "bin" },
-     { "HostLibraries", "lib" },
-     { "HostData", "." },
-+    { "ExternalHostBinaries", "" },
-     { "TargetSpec", "" },
-     { "HostSpec", "" },
-     { "HostPrefix", "" },
-diff --git a/src/corelib/global/qlibraryinfo.h b/src/corelib/global/qlibraryinfo.h
-index 362d47d..a2326e2 100644
---- a/src/corelib/global/qlibraryinfo.h
-+++ b/src/corelib/global/qlibraryinfo.h
-@@ -87,6 +87,7 @@ public:
-         HostBinariesPath,
-         HostLibrariesPath,
-         HostDataPath,
-+        ExternalHostBinariesPath,
-         TargetSpecPath,
-         HostSpecPath,
-         HostPrefixPath,
-diff --git a/tools/configure/configureapp.cpp b/tools/configure/configureapp.cpp
-index 0fa205b..2921e2b 100644
---- a/tools/configure/configureapp.cpp
-+++ b/tools/configure/configureapp.cpp
-@@ -1219,6 +1219,13 @@ void Configure::parseCmdLine()
-             dictionary[ "QT_EXT_PREFIX" ] = configCmdLine.at(i);
-         }
- 
-+        else if (configCmdLine.at(i) == "-external-hostbindir") {
-+            ++i;
-+            if (i == argCount)
-+                break;
-+            dictionary[ "QT_EXTERNAL_HOST_BINS" ] = configCmdLine.at(i);
-+        }
-+
-         else if (configCmdLine.at(i) == "-make-tool") {
-             ++i;
-             if (i == argCount)
-@@ -4171,6 +4178,9 @@ void Configure::generateQConfigCpp()
- 
-     if (dictionary["QT_REL_HOST_DATA"].isEmpty())
-         dictionary["QT_REL_HOST_DATA"] = haveHpx ? "." : dictionary["QT_REL_INSTALL_ARCHDATA"];
-+    
-+    if (dictionary["QT_EXTERNAL_HOST_BINS"].isEmpty())
-+        dictionary["QT_EXTERNAL_HOST_BINS"] = haveHpx ? "bin" : dictionary["QT_REL_INSTALL_BINS"];
- 
-     confStringOff = 0;
-     addConfStr(0, dictionary["QT_REL_INSTALL_DOCS"]);
-@@ -4190,6 +4200,7 @@ void Configure::generateQConfigCpp()
-     addConfStr(1, dictionary["QT_REL_HOST_BINS"]);
-     addConfStr(1, dictionary["QT_REL_HOST_LIBS"]);
-     addConfStr(1, dictionary["QT_REL_HOST_DATA"]);
-+    addConfStr(1, dictionary["QT_EXTERNAL_HOST_BINS"]);
-     addConfStr(1, targSpec);
-     addConfStr(1, hostSpec);
- 
diff --git a/recipes-qt/qt5/qtbase/0013-Fix-build-with-QT_NO_OPENGL.patch b/recipes-qt/qt5/qtbase/0013-Fix-build-with-QT_NO_OPENGL.patch
deleted file mode 100644
index 7b681dc..0000000
--- a/recipes-qt/qt5/qtbase/0013-Fix-build-with-QT_NO_OPENGL.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 2e176e3d10535e4fdaa6ecc919538f66f4a2930d Mon Sep 17 00:00:00 2001
-From: Andy Nichols <andy.nichols@qt.io>
-Date: Mon, 11 Jul 2016 09:18:33 +0200
-Subject: QWidgetBackingStore: Fix build with QT_NO_OPENGL
-
-A define moved out of the #ifndef QT_NO_OPENGL scope.
-
-Change-Id: I41c943b97f165b5171581e01f3a4b2d3fb25747e
-Reviewed-by: Laszlo Agocs <laszlo.agocs@qt.io>
-
-Upstream-Status: Backport
-Signed-off-by: Johannes Pointner <johannes.pointner@br-automation.com>
----
- src/widgets/kernel/qwidgetbackingstore.cpp | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/widgets/kernel/qwidgetbackingstore.cpp b/src/widgets/kernel/qwidgetbackingstore.cpp
-index 32aabce..242e625 100644
---- a/src/widgets/kernel/qwidgetbackingstore.cpp
-+++ b/src/widgets/kernel/qwidgetbackingstore.cpp
-@@ -67,7 +67,9 @@ QT_BEGIN_NAMESPACE
-
- extern QRegion qt_dirtyRegion(QWidget *);
-
-+#ifndef QT_NO_OPENGL
- Q_GLOBAL_STATIC(QPlatformTextureList, qt_dummy_platformTextureList)
-+#endif
-
- /**
-  * Flushes the contents of the \a backingStore into the screen area of \a widget.
---
-cgit v1.0-4-g1e03
-
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index eda57ac..eccb435 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -17,16 +17,13 @@ LIC_FILES_CHKSUM = " \
 # common for qtbase-native, qtbase-nativesdk and qtbase
 SRC_URI += "\
     file://0001-Add-linux-oe-g-platform.patch \
-    file://0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch \
     file://0003-Add-external-hostbindir-option.patch \
     file://0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch \
     file://0005-configure-bump-path-length-from-256-to-512-character.patch \
     file://0006-QOpenGLPaintDevice-sub-area-support.patch \
-    file://0007-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch \
     file://0008-configure-paths-for-target-qmake-properly.patch \
-    file://0009-Reorder-EGL-libraries-from-pkgconfig-and-defaults.patch \
+    file://0009-Disable-all-unknown-features-instead-of-erroring-out.patch \
     file://0010-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch \
-    file://0013-Fix-build-with-QT_NO_OPENGL.patch \
 "
 
 DEPENDS += "qtbase-native"
@@ -43,7 +40,7 @@ RDEPENDS_${PN}-tools += "perl"
 
 PACKAGECONFIG_GL ?= "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gl', '', d)}"
 PACKAGECONFIG_FB ?= "${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)}"
-PACKAGECONFIG_X11 ?= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xcb xsync xshape xrender xrandr xfixes xinput2 xcursor glib xkb', '', d)}"
+PACKAGECONFIG_X11 ?= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xcb xrender xinput2 glib xkb', '', d)}"
 PACKAGECONFIG_FONTS ?= ""
 PACKAGECONFIG_SYSTEM ?= "jpeg libpng zlib"
 PACKAGECONFIG_MULTIMEDIA ?= "${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)}"
@@ -52,7 +49,7 @@ PACKAGECONFIG_DISTRO ?= ""
 PACKAGECONFIG_RELEASE ?= "release"
 # This is in qt5.inc, because qtwebkit-examples are using it to enable ca-certificates dependency
 # PACKAGECONFIG_OPENSSL ?= "openssl"
-PACKAGECONFIG_DEFAULT ?= "dbus udev evdev widgets tools libs"
+PACKAGECONFIG_DEFAULT ?= "dbus udev evdev widgets tools libs freetype"
 
 PACKAGECONFIG ?= " \
     ${PACKAGECONFIG_RELEASE} \
@@ -70,27 +67,31 @@ PACKAGECONFIG ?= " \
 PACKAGECONFIG[release] = "-release,-debug"
 PACKAGECONFIG[debug] = ""
 PACKAGECONFIG[developer] = "-developer-build"
+PACKAGECONFIG[qml-debug] = "-qml-debug,-no-qml-debug"
 PACKAGECONFIG[sm] = "-sm,-no-sm"
 PACKAGECONFIG[tests] = "-make tests,-nomake tests"
 PACKAGECONFIG[examples] = "-make examples -compile-examples,-nomake examples"
 PACKAGECONFIG[tools] = "-make tools,-nomake tools"
 # only for completeness, configure will add libs even if you try to explicitly remove it
-PACKAGECONFIG[libs] = "-make libs,-nomake libs"
+PACKAGECONFIG[libs] = "-make libs"
 # accessibility is required to compile qtquickcontrols
 PACKAGECONFIG[accessibility] = "-accessibility,-no-accessibility"
 PACKAGECONFIG[glib] = "-glib,-no-glib,glib-2.0"
 # use either system freetype or bundled freetype, if you disable freetype completely
 # fontdatabases/basic/qbasicfontdatabase.cpp will fail to build and system freetype
 # works only together with fontconfig
-PACKAGECONFIG[freetype] = "-system-freetype,-freetype,freetype"
+PACKAGECONFIG[freetype] = "-system-freetype,-qt-freetype,freetype"
 PACKAGECONFIG[harfbuzz] = "-system-harfbuzz,-no-harfbuzz,harfbuzz"
 PACKAGECONFIG[jpeg] = "-system-libjpeg,-no-libjpeg,jpeg"
 PACKAGECONFIG[libpng] = "-system-libpng,-no-libpng,libpng"
+PACKAGECONFIG[gif] = "-gif,-no-gif"
+PACKAGECONFIG[ico] = "-ico,-no-ico"
 PACKAGECONFIG[zlib] = "-system-zlib,-qt-zlib,zlib"
 PACKAGECONFIG[pcre] = "-system-pcre,-qt-pcre,pcre"
 PACKAGECONFIG[eglfs] = "-eglfs,-no-eglfs,drm"
 PACKAGECONFIG[gl] = "-opengl desktop,,virtual/libgl"
 PACKAGECONFIG[gles2] = "-opengl es2,,virtual/libgles2 virtual/egl"
+PACKAGECONFIG[no-opengl] = "-no-opengl"
 PACKAGECONFIG[tslib] = "-tslib,-no-tslib,tslib"
 PACKAGECONFIG[cups] = "-cups,-no-cups,cups"
 PACKAGECONFIG[dbus] = "-dbus,-no-dbus,dbus"
@@ -104,14 +105,8 @@ PACKAGECONFIG[sql-tds] = "-sql-tds,-no-sql-tds"
 PACKAGECONFIG[sql-db2] = "-sql-db2,-no-sql-db2"
 PACKAGECONFIG[sql-sqlite2] = "-sql-sqlite2,-no-sql-sqlite2,sqlite"
 PACKAGECONFIG[sql-sqlite] = "-sql-sqlite -system-sqlite,-no-sql-sqlite,sqlite3"
-PACKAGECONFIG[xcursor] = "-xcursor,-no-xcursor,libxcursor"
 PACKAGECONFIG[xinput2] = "-xinput2,-no-xinput2,libxi"
-PACKAGECONFIG[xfixes] = "-xfixes,-no-xfixes,libxfixes"
-PACKAGECONFIG[xrandr] = "-xrandr,-no-xrandr,libxrandr"
 PACKAGECONFIG[xrender] = "-xrender,-no-xrender,libxrender"
-PACKAGECONFIG[xshape] = "-xshape,-no-xshape"
-PACKAGECONFIG[xsync] = "-xsync,-no-xsync"
-PACKAGECONFIG[openvg] = "-openvg,-no-openvg"
 PACKAGECONFIG[iconv] = "-iconv,-no-iconv,virtual/libiconv"
 PACKAGECONFIG[xkb] = "-xkb,-no-xkb -no-xkbcommon,libxkbcommon"
 PACKAGECONFIG[xkbcommon-evdev] = "-xkbcommon-evdev,-no-xkbcommon-evdev,libxkbcommon,xkeyboard-config"
@@ -122,8 +117,8 @@ PACKAGECONFIG[fontconfig] = "-fontconfig,-no-fontconfig,fontconfig"
 PACKAGECONFIG[gtk] = "-gtk,-no-gtk,gtk+"
 PACKAGECONFIG[directfb] = "-directfb,-no-directfb,directfb"
 PACKAGECONFIG[linuxfb] = "-linuxfb,-no-linuxfb"
-PACKAGECONFIG[mitshm] = "-mitshm,-no-mitshm,mitshm"
-PACKAGECONFIG[kms] = "-kms,-no-kms,virtual/mesa virtual/egl"
+PACKAGECONFIG[kms] = "-kms,-no-kms,drm virtual/egl"
+PACKAGECONFIG[gbm] = "-gbm,-no-gbm,gbm"
 # needed for qtwebkit
 PACKAGECONFIG[icu] = "-icu,-no-icu,icu"
 PACKAGECONFIG[udev] = "-libudev,-no-libudev,udev"
@@ -144,44 +139,10 @@ QT_CONFIG_FLAGS += " \
     ${PACKAGECONFIG_CONFARGS} \
 "
 
-do_generate_qt_config_file_append() {
-    cat >> ${QT_CONF_PATH} <<EOF
-
-[EffectivePaths]
-Prefix=..
-EOF
-}
-
-# qtbase is exception, we need to use mkspecs from ${S}
-QMAKE_MKSPEC_PATH = "${B}"
-
-# another exception is that we need to run bin/qmake, because EffectivePaths are relative to qmake location
-OE_QMAKE_QMAKE_ORIG = "${STAGING_BINDIR_NATIVE}${QT_DIR_NAME}/qmake"
-OE_QMAKE_QMAKE = "bin/qmake"
-
-# qtbase is exception, configure script is using our get(X)QEvalMakeConf and setBootstrapEvalVariable functions to read it from shell
-export OE_QMAKE_COMPILER
-export OE_QMAKE_CC
-export OE_QMAKE_CFLAGS
-export OE_QMAKE_CXX
-export OE_QMAKE_CXXFLAGS
-export OE_QMAKE_LINK
-export OE_QMAKE_LDFLAGS
-export OE_QMAKE_AR
-export OE_QMAKE_STRIP
-
 do_configure() {
-    # we need symlink in path relative to source, because
-    # EffectivePaths:Prefix is relative to qmake location
-    if [ ! -e ${B}/bin/qmake ]; then
-        mkdir -p ${B}/bin
-        ln -sf ${OE_QMAKE_QMAKE_ORIG} ${B}/bin/qmake
-    fi
-
     ${S}/configure -v \
         -opensource -confirm-license \
         -sysroot ${STAGING_DIR_TARGET} \
-        -no-gcc-sysroot \
         -prefix ${OE_QMAKE_PATH_PREFIX} \
         -bindir ${OE_QMAKE_PATH_BINS} \
         -libdir ${OE_QMAKE_PATH_LIBS} \
@@ -197,37 +158,29 @@ do_configure() {
         -translationdir ${OE_QMAKE_PATH_TRANSLATIONS} \
         -testsdir ${OE_QMAKE_PATH_TESTS} \
         -examplesdir ${OE_QMAKE_PATH_EXAMPLES} \
+        -hostprefix ${OE_QMAKE_PATH_HOST_PREFIX} \
+        -hostlibdir ${OE_QMAKE_PATH_HOST_LIBS} \
         -hostbindir ${OE_QMAKE_PATH_HOST_BINS} \
         -external-hostbindir ${OE_QMAKE_PATH_EXTERNAL_HOST_BINS} \
         -hostdatadir ${OE_QMAKE_PATH_HOST_DATA} \
-        -platform ${OE_QMAKESPEC} \
+        -platform ${OE_QMAKE_PLATFORM_NATIVE} \
         -xplatform linux-oe-g++ \
         ${QT_CONFIG_FLAGS}
-
-    qmake5_base_do_configure
 }
 
 do_install_append() {
     # Avoid qmake error "Cannot read [...]/usr/lib/qt5/mkspecs/oe-device-extra.pri: No such file or directory"
     touch ${D}/${OE_QMAKE_PATH_QT_ARCHDATA}/mkspecs/oe-device-extra.pri
 
-    install -m 0755 ${B}/bin/qmake-target ${D}/${bindir}${QT_DIR_NAME}/qmake
-
-    # Remove example.pro file as it is useless
-    rm -f ${D}${OE_QMAKE_PATH_EXAMPLES}/examples.pro
-
-    # Remove macx-ios-clang directory because /usr/lib/qt5/mkspecs/macx-ios-clang/rename_main.sh:#!/bin/bash
-    # triggers QA Issue: qtbase-mkspecs requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
-    rm -rf ${D}/${OE_QMAKE_PATH_QT_ARCHDATA}/mkspecs/macx-ios-clang
-    # and this one has /bin/bash shebang, but checkbashisms doesn't show any reason for it
-    sed -i 's@^#!/bin/bash$@#!/bin/sh@g' ${D}/${OE_QMAKE_PATH_QT_ARCHDATA}/mkspecs/features/data/mac/objc_namespace.sh
-
     # Replace host paths with qmake built-in properties
-    sed -i -e 's|${STAGING_DIR_NATIVE}${prefix_native}|$$[QT_HOST_PREFIX]|g' \
+    sed -i -e 's|${STAGING_DIR_NATIVE}${prefix_native}|$$[QT_HOST_PREFIX/get]|g' \
         -e 's|${STAGING_DIR_HOST}|$$[QT_SYSROOT]|g' \
         ${D}/${OE_QMAKE_PATH_QT_ARCHDATA}/mkspecs/*.pri
 }
 
+# mkspecs have mac specific scripts that depend on perl and bash
+INSANE_SKIP_${PN}-mkspecs += "file-rdeps"
+
 RRECOMMENDS_${PN}-plugins += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libx11-locale', '', d)}"
 
-SRCREV = "69b43e74d78e050cf5e40197acafa4bc9f90c0bd"
+SRCREV = "969bb10eed646313209fcdd9b84605aa98fc88de"
diff --git a/recipes-qt/qt5/qtcanvas3d_git.bb b/recipes-qt/qt5/qtcanvas3d_git.bb
index 8cf316b..d45c9d4 100644
--- a/recipes-qt/qt5/qtcanvas3d_git.bb
+++ b/recipes-qt/qt5/qtcanvas3d_git.bb
@@ -3,11 +3,11 @@ require qt5-git.inc
 
 LICENSE = "LGPL-3.0 | GPL-3.0"
 LIC_FILES_CHKSUM = " \
-    file://LICENSE.LGPLv3;md5=b8c75190712063cde04e1f41b6fdad98 \
-    file://LICENSE.GPLv3;md5=40f9bf30e783ddc201497165dfb32afb \
-    file://LICENSE.GPLv2;md5=05832301944453ec79e40ba3c3cfceec \
+    file://LICENSE.LGPLv3;md5=e0459b45c5c4840b353141a8bbed91f0 \
+    file://LICENSE.GPLv3;md5=88e2b9117e6be406b5ed6ee4ca99a705 \
+    file://LICENSE.GPLv2;md5=c96076271561b0e3785dad260634eaa8 \
 "
 
 DEPENDS = "qtdeclarative"
 
-SRCREV = "1568c60d2a0d1758acfeec9f002af7ff5b4d28ee"
+SRCREV = "6c5121eab75e61f807c2df0f14988317f220b945"
diff --git a/recipes-qt/qt5/qtcharts_git.bb b/recipes-qt/qt5/qtcharts_git.bb
index 21f6f13..a1477b1 100644
--- a/recipes-qt/qt5/qtcharts_git.bb
+++ b/recipes-qt/qt5/qtcharts_git.bb
@@ -8,4 +8,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative qtmultimedia"
 
-SRCREV = "03a6177a3223f928a5f329c8b1fc4d5fe376deed"
+SRCREV = "15447eed96be05b2607fa23c6455c37ab1990282"
diff --git a/recipes-qt/qt5/qtconnectivity_git.bb b/recipes-qt/qt5/qtconnectivity_git.bb
index 67f882a..5fad984 100644
--- a/recipes-qt/qt5/qtconnectivity_git.bb
+++ b/recipes-qt/qt5/qtconnectivity_git.bb
@@ -28,4 +28,4 @@ do_configure_prepend() {
     sed -i 's/^qtCompileTest(bluez)/OE_BLUEZ_ENABLED:qtCompileTest(bluez)/g' ${S}/qtconnectivity.pro
 }
 
-SRCREV = "8755a1f2460fa523782e27b6ca7a430a0176ac61"
+SRCREV = "515ff5b0f9a2245a13cec6f2d37edd1715cdae8c"
diff --git a/recipes-qt/qt5/qtdatavis3d_git.bb b/recipes-qt/qt5/qtdatavis3d_git.bb
index 50a0bcc..8eb56ae 100644
--- a/recipes-qt/qt5/qtdatavis3d_git.bb
+++ b/recipes-qt/qt5/qtdatavis3d_git.bb
@@ -8,4 +8,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative qtmultimedia qtxmlpatterns"
 
-SRCREV = "d6a8da66dc3c141621c9be4b7509a6e43c60e15c"
+SRCREV = "96086b01a3e732cfb58cfd6e15a8dfc53550eb13"
diff --git a/recipes-qt/qt5/qtdeclarative-render2d_git.bb b/recipes-qt/qt5/qtdeclarative-render2d_git.bb
deleted file mode 100644
index cb2ee8b..0000000
--- a/recipes-qt/qt5/qtdeclarative-render2d_git.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require qt5.inc
-require qt5-git.inc
-
-LICENSE = "GPL-3.0 | The-Qt-Company-TPLA-2.4"
-LIC_FILES_CHKSUM = " \
-    file://LICENSE.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
-    file://LICENSE.PREVIEW.COMMERCIAL;md5=c458c2ae1b463cca5219eaee54f6287e \
-"
-
-DEPENDS += "qtbase qtdeclarative"
-
-SRCREV = "13a6c51f26128015c0a3c335bdae676b46df6ed6"
diff --git a/recipes-qt/qt5/qtdeclarative/0003-Workaround-crashes-in-QtQml-code-related-to-dead-sto.patch b/recipes-qt/qt5/qtdeclarative/0003-Workaround-crashes-in-QtQml-code-related-to-dead-sto.patch
deleted file mode 100644
index d3ee42e..0000000
--- a/recipes-qt/qt5/qtdeclarative/0003-Workaround-crashes-in-QtQml-code-related-to-dead-sto.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From fcc2c95421710f98c7b2dec73e2c8b0d9164bc9b Mon Sep 17 00:00:00 2001
-From: Jonathan Liu <net147@gmail.com>
-Date: Wed, 24 Aug 2016 11:18:37 +1000
-Subject: [PATCH] Workaround crashes in QtQml code related to dead-store
- elimination
-
-When compiled in release mode with GCC 6, QtQml may crash.
-This is because the C++ compiler is more aggressive about dead-store
-elimination in situations where a memory store to a location precedes
-the construction of an object at that memory location.
-
-The QV4::MemoryManager::allocate{Managed,Object} functions allocate
-memory and write to it before the caller does a placement new to
-construct an object in the same memory. The compiler considers these
-writes before the constructor as "dead stores" and eliminates them.
-
-The -fno-lifetime-dse compiler flag is added to disable this more
-aggressive dead-store eliminiation optimization.
-
-This is a temporary workaround until a proper solution is found.
-
-Upstream-Status: Accepted
-
-Task-number: QTBUG-55482
-Change-Id: I7dbae6e9e613e53ce5fb25957c449bc6657803b5
-Reviewed-by: Thiago Macieira <thiago.macieira@intel.com>
-Signed-off-by: Jonathan Liu <net147@gmail.com>
----
- src/qml/qml.pro | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/qml/qml.pro b/src/qml/qml.pro
-index f4862a1..651afa6 100644
---- a/src/qml/qml.pro
-+++ b/src/qml/qml.pro
-@@ -18,7 +18,7 @@ exists("qqml_enable_gcov") {
- 
- greaterThan(QT_GCC_MAJOR_VERSION, 5) {
-     # Our code is bad. Temporary workaround.
--    QMAKE_CXXFLAGS += -fno-delete-null-pointer-checks
-+    QMAKE_CXXFLAGS += -fno-delete-null-pointer-checks -fno-lifetime-dse
- }
- 
- QMAKE_DOCS = $$PWD/doc/qtqml.qdocconf
diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/qtdeclarative_git.bb
index 5cc4caa..c1d6b77 100644
--- a/recipes-qt/qt5/qtdeclarative_git.bb
+++ b/recipes-qt/qt5/qtdeclarative_git.bb
@@ -19,7 +19,6 @@ DEPENDS += "qtbase"
 SRC_URI += " \
     file://0001-qmltestexample-fix-link.patch \
     file://0002-qquickviewcomparison-fix-QCoreApplication-has-not-be.patch \
-    file://0003-Workaround-crashes-in-QtQml-code-related-to-dead-sto.patch \
 "
 
 EXTRA_OEMAKE += "QMAKE_SYNCQT=${STAGING_BINDIR_NATIVE}${QT_DIR_NAME}/syncqt"
@@ -36,8 +35,13 @@ do_configure_prepend() {
     echo "QT_TOOL.syncqt.binary = \"${STAGING_BINDIR_NATIVE}${QT_DIR_NAME}/syncqt\"" > ${B}/.qmake.cache
 }
 
+do_install_append_class-nativesdk() {
+    # qml files not needed in nativesdk
+    rm -rf ${D}${OE_QMAKE_PATH_QML}
+}
+
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'qtxmlpatterns', 'CONFIG+=OE_QTXMLPATTERNS_ENABLED', '', d)}"
 
-SRCREV = "d48b397cc79265e80c8437888f9ded0b0364e418"
+SRCREV = "9d085bf0024c442b14b7d22bc629574058176deb"
 
 BBCLASSEXTEND =+ "native nativesdk"
diff --git a/recipes-qt/qt5/qtenginio_git.bb b/recipes-qt/qt5/qtenginio_git.bb
index e77d358..c2455bf 100644
--- a/recipes-qt/qt5/qtenginio_git.bb
+++ b/recipes-qt/qt5/qtenginio_git.bb
@@ -3,16 +3,17 @@ require qt5-git.inc
 
 LICENSE = "GFDL-1.3 & BSD & ( GPL-3.0 & The-Qt-Company-GPL-Exception-1.0 | The-Qt-Company-Commercial ) & ( GPL-2.0+ | LGPL-3.0 | The-Qt-Company-Commercial )"
 LIC_FILES_CHKSUM = " \
-    file://LICENSE.LGPLv21;md5=4bfd28363f541b10d9f024181b8df516 \
-    file://LICENSE.LGPLv3;md5=e0459b45c5c4840b353141a8bbed91f0 \
-    file://LICENSE.GPLv3;md5=88e2b9117e6be406b5ed6ee4ca99a705 \
+    file://LICENSE.LGPLv21;md5=58a180e1cf84c756c29f782b3a485c29 \
+    file://LICENSE.LGPLv3;md5=b8c75190712063cde04e1f41b6fdad98 \
+    file://LICENSE.GPLv3;md5=40f9bf30e783ddc201497165dfb32afb \
     file://LGPL_EXCEPTION.txt;md5=9625233da42f9e0ce9d63651a9d97654 \
     file://LICENSE.FDL;md5=f70ee9a6c44ae8917586fea34dff0ab5 \
 "
 
 DEPENDS += "qtbase qtdeclarative qtxmlpatterns"
 
-SRCREV = "cedca298f081e1c1cdac615eed6171fe687f35e2"
+QT_MODULE_BRANCH = "dev"
+SRCREV = "b0ad5907f480307853f7ac951bacfaa61dcbd94e"
 
 do_install_append() {
     if ls ${D}${libdir}/pkgconfig/Enginio.pc >/dev/null 2>/dev/null; then
diff --git a/recipes-qt/qt5/qtgraphicaleffects_git.bb b/recipes-qt/qt5/qtgraphicaleffects_git.bb
index 6c62a68..d0a31ca 100644
--- a/recipes-qt/qt5/qtgraphicaleffects_git.bb
+++ b/recipes-qt/qt5/qtgraphicaleffects_git.bb
@@ -4,13 +4,13 @@ require qt5-git.inc
 LICENSE = "GFDL-1.3 & BSD & ( GPL-3.0 & The-Qt-Company-GPL-Exception-1.0 | The-Qt-Company-Commercial ) & ( GPL-2.0+ | LGPL-3.0 | The-Qt-Company-Commercial )"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPL3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
-    file://LICENSE.LGPLv21;md5=58a180e1cf84c756c29f782b3a485c29 \
-    file://LICENSE.LGPLv3;md5=b8c75190712063cde04e1f41b6fdad98 \
+    file://LICENSE.LGPLv21;md5=4bfd28363f541b10d9f024181b8df516 \
+    file://LICENSE.LGPLv3;md5=e0459b45c5c4840b353141a8bbed91f0 \
     file://LICENSE.GPL2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
     file://LICENSE.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
     file://LICENSE.GPL3-EXCEPT;md5=763d8c535a234d9a3fb682c7ecb6c073 \
-    file://LICENSE.GPLv2;md5=05832301944453ec79e40ba3c3cfceec \
-    file://LICENSE.GPLv3;md5=40f9bf30e783ddc201497165dfb32afb \
+    file://LICENSE.GPLv2;md5=c96076271561b0e3785dad260634eaa8 \
+    file://LICENSE.GPLv3;md5=88e2b9117e6be406b5ed6ee4ca99a705 \
     file://LGPL_EXCEPTION.txt;md5=9625233da42f9e0ce9d63651a9d97654 \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
 "
@@ -19,4 +19,4 @@ DEPENDS += "qtdeclarative"
 
 RDEPENDS_${PN}-dev = ""
 
-SRCREV = "d3023be0d839440ac046adf2af75d9e4306dd5ef"
+SRCREV = "8b5cb6185a014eb65150bef11aebdecb6a723aef"
diff --git a/recipes-qt/qt5/qtimageformats_git.bb b/recipes-qt/qt5/qtimageformats_git.bb
index 7f8179e..88ca684 100644
--- a/recipes-qt/qt5/qtimageformats_git.bb
+++ b/recipes-qt/qt5/qtimageformats_git.bb
@@ -4,13 +4,13 @@ require qt5-git.inc
 LICENSE = "GFDL-1.3 & BSD & ( GPL-3.0 & The-Qt-Company-GPL-Exception-1.0 | The-Qt-Company-Commercial ) & ( GPL-2.0+ | LGPL-3.0 | The-Qt-Company-Commercial )"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPL3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
-    file://LICENSE.LGPLv21;md5=58a180e1cf84c756c29f782b3a485c29 \
-    file://LICENSE.LGPLv3;md5=b8c75190712063cde04e1f41b6fdad98 \
+    file://LICENSE.LGPLv21;md5=4bfd28363f541b10d9f024181b8df516 \
+    file://LICENSE.LGPLv3;md5=e0459b45c5c4840b353141a8bbed91f0 \
     file://LICENSE.GPL2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
     file://LICENSE.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
     file://LICENSE.GPL3-EXCEPT;md5=763d8c535a234d9a3fb682c7ecb6c073 \
-    file://LICENSE.GPLv2;md5=05832301944453ec79e40ba3c3cfceec \
-    file://LICENSE.GPLv3;md5=40f9bf30e783ddc201497165dfb32afb \
+    file://LICENSE.GPLv2;md5=c96076271561b0e3785dad260634eaa8 \
+    file://LICENSE.GPLv3;md5=88e2b9117e6be406b5ed6ee4ca99a705 \
     file://LGPL_EXCEPTION.txt;md5=9625233da42f9e0ce9d63651a9d97654 \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
 "
@@ -32,4 +32,4 @@ EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'jasper', 'CONFIG+
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'libtiff', 'CONFIG+=OE_LIBTIFF_ENABLED', '', d)}"
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'libwebp', 'CONFIG+=OE_LIBWEBP_ENABLED', '', d)}"
 
-SRCREV = "d4401c9f519dfe82c38fe9ded674e454655f1866"
+SRCREV = "99d9e0c527ad91f186628ece1c8b3a5ec07f7add"
diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/qtlocation_git.bb
index 7a9ecb4..49579dd 100644
--- a/recipes-qt/qt5/qtlocation_git.bb
+++ b/recipes-qt/qt5/qtlocation_git.bb
@@ -3,12 +3,12 @@ require qt5-git.inc
 
 LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1 | LGPL-3.0) | GPL-2.0"
 LIC_FILES_CHKSUM = " \
-    file://LICENSE.LGPLv21;md5=58a180e1cf84c756c29f782b3a485c29 \
-    file://LICENSE.LGPLv3;md5=b8c75190712063cde04e1f41b6fdad98 \
-    file://LICENSE.GPLv3;md5=40f9bf30e783ddc201497165dfb32afb \
+    file://LICENSE.LGPLv21;md5=4bfd28363f541b10d9f024181b8df516 \
+    file://LICENSE.LGPLv3;md5=e0459b45c5c4840b353141a8bbed91f0 \
+    file://LICENSE.GPLv3;md5=88e2b9117e6be406b5ed6ee4ca99a705 \
     file://LGPL_EXCEPTION.txt;md5=9625233da42f9e0ce9d63651a9d97654 \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
-    file://LICENSE.GPLv2;md5=05832301944453ec79e40ba3c3cfceec \
+    file://LICENSE.GPLv2;md5=c96076271561b0e3785dad260634eaa8 \
 "
 
 DEPENDS += "qtbase qtxmlpatterns qtdeclarative qtquickcontrols"
@@ -29,4 +29,4 @@ do_configure_prepend() {
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'geoclue', 'CONFIG+=OE_GEOCLUE_ENABLED', '', d)}"
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'gypsy', 'CONFIG+=OE_GYPSY_ENABLED', '', d)}"
 
-SRCREV = "4e1008b4ac1eea776585ca41a6a3db127cf500ff"
+SRCREV = "8aabdb0975c3532324d299dfa62aa333a56d2d3b"
diff --git a/recipes-qt/qt5/qtmultimedia_git.bb b/recipes-qt/qt5/qtmultimedia_git.bb
index 3bbfb6e..e93904a 100644
--- a/recipes-qt/qt5/qtmultimedia_git.bb
+++ b/recipes-qt/qt5/qtmultimedia_git.bb
@@ -38,4 +38,4 @@ SRC_URI += "\
     file://0001-Initial-porting-effort-to-GStreamer-1.0.patch \
 "
 
-SRCREV = "1be4f74843b41f8bc1d1d64e83485f4eb864e8b4"
+SRCREV = "0cb4dc5c1fded81b4f47945b51b8de0b0151bf67"
diff --git a/recipes-qt/qt5/qtquick1_git.bb b/recipes-qt/qt5/qtquick1_git.bb
index 4107c3a..e9b6185 100644
--- a/recipes-qt/qt5/qtquick1_git.bb
+++ b/recipes-qt/qt5/qtquick1_git.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPLv21;md5=4bfd28363f541b10d9f024181b8df516 \
     file://LICENSE.LGPLv3;md5=e0459b45c5c4840b353141a8bbed91f0 \
     file://LICENSE.GPLv2;md5=c96076271561b0e3785dad260634eaa8 \
-    file://LICENSE.GPLv3;md5=88e2b9117e6be406b5ed6ee4ca99a705 \
     file://LGPL_EXCEPTION.txt;md5=9625233da42f9e0ce9d63651a9d97654 \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
 "
@@ -23,4 +22,5 @@ do_configure_prepend() {
     sed -i 's#^qtHaveModule(webkitwidgets):#qtHaveModule(webkitwidgets):!contains(CONFIG, noqtwebkit):#g' ${S}/src/imports/imports.pro
 }
 
-SRCREV = "857fc5ec4644a6111ba8725e4e1a84dd5ea6bfca"
+QT_MODULE_BRANCH = "dev"
+SRCREV = "64faeb0d8003e699a4d09e7dcee1ef6eb10302ad"
diff --git a/recipes-qt/qt5/qtquickcontrols2_git.bb b/recipes-qt/qt5/qtquickcontrols2_git.bb
index 7271a19..b93cd6c 100644
--- a/recipes-qt/qt5/qtquickcontrols2_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols2_git.bb
@@ -4,10 +4,10 @@ require qt5-git.inc
 LICENSE = "GFDL-1.3 & BSD & LGPL-3.0 | GPL-3.0"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
-    file://LICENSE.LGPLv3;md5=8ba7f2099d17d636d5fcc8303bb17587 \
-    file://LICENSE.GPLv3;md5=40f9bf30e783ddc201497165dfb32afb \
+    file://LICENSE.LGPLv3;md5=a37e6cd7102174853307e03e6edc5f30 \
+    file://LICENSE.GPLv3;md5=88e2b9117e6be406b5ed6ee4ca99a705 \
 "
 
 DEPENDS += "qtdeclarative"
 
-SRCREV = "cc0ee8e4f3345023f1b85fc815739c0a75ea5686"
+SRCREV = "e09a8591990e5281929ca2a7bb180bb3a35556ba"
diff --git a/recipes-qt/qt5/qtquickcontrols_git.bb b/recipes-qt/qt5/qtquickcontrols_git.bb
index 176035c..54aaad4 100644
--- a/recipes-qt/qt5/qtquickcontrols_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols_git.bb
@@ -4,12 +4,12 @@ require qt5-git.inc
 LICENSE = "GFDL-1.3 & BSD & ( GPL-3.0 & The-Qt-Company-GPL-Exception-1.0 | The-Qt-Company-Commercial ) & ( GPL-2.0+ | LGPL-3.0 | The-Qt-Company-Commercial )"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPL3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
-    file://LICENSE.LGPLv3;md5=b8c75190712063cde04e1f41b6fdad98 \
+    file://LICENSE.LGPLv3;md5=e0459b45c5c4840b353141a8bbed91f0 \
     file://LICENSE.GPL2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
     file://LICENSE.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
     file://LICENSE.GPL3-EXCEPT;md5=763d8c535a234d9a3fb682c7ecb6c073 \
-    file://LICENSE.GPLv2;md5=05832301944453ec79e40ba3c3cfceec \
-    file://LICENSE.GPLv3;md5=40f9bf30e783ddc201497165dfb32afb \
+    file://LICENSE.GPLv2;md5=c96076271561b0e3785dad260634eaa8 \
+    file://LICENSE.GPLv3;md5=88e2b9117e6be406b5ed6ee4ca99a705 \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
 "
 
@@ -21,4 +21,4 @@ SRC_URI += " \
     file://0001-texteditor-fix-invalid-use-of-incomplete-type-class-.patch \
 "
 
-SRCREV = "37f8b753be1b16975220c8b611b17a428eafb9e9"
+SRCREV = "3bc99dd69fb9099a13dd94ebd081dba5c68d6def"
diff --git a/recipes-qt/qt5/qtscript_git.bb b/recipes-qt/qt5/qtscript_git.bb
index bee833d..2058e22 100644
--- a/recipes-qt/qt5/qtscript_git.bb
+++ b/recipes-qt/qt5/qtscript_git.bb
@@ -25,4 +25,4 @@ ARM_INSTRUCTION_SET_armv5 = "arm"
 
 DEPENDS += "qtbase"
 
-SRCREV = "b8845794b95376e8be39dbdafca2c85b5ec4c195"
+SRCREV = "89e980b8e0007a3615d01286d1f590fb95757233"
diff --git a/recipes-qt/qt5/qtsensors_git.bb b/recipes-qt/qt5/qtsensors_git.bb
index af45d89..d1ea63f 100644
--- a/recipes-qt/qt5/qtsensors_git.bb
+++ b/recipes-qt/qt5/qtsensors_git.bb
@@ -3,14 +3,14 @@ require qt5-git.inc
 
 LICENSE = "GFDL-1.3 & BSD & ( GPL-3.0 & The-Qt-Company-GPL-Exception-1.0 | The-Qt-Company-Commercial ) & ( GPL-2.0+ | LGPL-3.0 | The-Qt-Company-Commercial )"
 LIC_FILES_CHKSUM = " \
-    file://LICENSE.LGPLv21;md5=58a180e1cf84c756c29f782b3a485c29 \
-    file://LICENSE.LGPLv3;md5=b8c75190712063cde04e1f41b6fdad98 \
-    file://LICENSE.GPLv3;md5=40f9bf30e783ddc201497165dfb32afb \
+    file://LICENSE.LGPLv21;md5=4bfd28363f541b10d9f024181b8df516 \
+    file://LICENSE.LGPLv3;md5=e0459b45c5c4840b353141a8bbed91f0 \
+    file://LICENSE.GPLv3;md5=88e2b9117e6be406b5ed6ee4ca99a705 \
     file://LGPL_EXCEPTION.txt;md5=9625233da42f9e0ce9d63651a9d97654 \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
-    file://LICENSE.GPLv2;md5=05832301944453ec79e40ba3c3cfceec \
+    file://LICENSE.GPLv2;md5=c96076271561b0e3785dad260634eaa8 \
 "
 
 DEPENDS += "qtbase qtdeclarative"
 
-SRCREV = "e03c37077ea4841b9e0b591d29a34737d7d8dd32"
+SRCREV = "8065e461421ea17a942ea09d67aaa053a136a54e"
diff --git a/recipes-qt/qt5/qtserialbus_git.bb b/recipes-qt/qt5/qtserialbus_git.bb
index 397ac4e..5b90395 100644
--- a/recipes-qt/qt5/qtserialbus_git.bb
+++ b/recipes-qt/qt5/qtserialbus_git.bb
@@ -11,4 +11,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtserialport"
 
-SRCREV = "88554d068d287870740b842864a50604f53e8509"
+SRCREV = "8e4bd5bcfd6093c980866a6b258311e7d8ae5bbf"
diff --git a/recipes-qt/qt5/qtserialport_git.bb b/recipes-qt/qt5/qtserialport_git.bb
index d5f37d5..e2917b4 100644
--- a/recipes-qt/qt5/qtserialport_git.bb
+++ b/recipes-qt/qt5/qtserialport_git.bb
@@ -5,14 +5,14 @@ require qt5-git.inc
 # other qt* components use :/
 LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
 LIC_FILES_CHKSUM = " \
-    file://LICENSE.LGPLv21;md5=58a180e1cf84c756c29f782b3a485c29 \
-    file://LICENSE.LGPLv3;md5=b8c75190712063cde04e1f41b6fdad98 \
-    file://LICENSE.GPLv3;md5=40f9bf30e783ddc201497165dfb32afb \
+    file://LICENSE.LGPLv21;md5=4bfd28363f541b10d9f024181b8df516 \
+    file://LICENSE.LGPLv3;md5=e0459b45c5c4840b353141a8bbed91f0 \
+    file://LICENSE.GPLv3;md5=88e2b9117e6be406b5ed6ee4ca99a705 \
     file://LGPL_EXCEPTION.txt;md5=bb426f3367c4805d1e12fad05bd0b750 \
     file://LICENSE.FDL;md5=3801d7932fdc07fd9efe89f9854a6caa \
-    file://LICENSE.GPLv2;md5=05832301944453ec79e40ba3c3cfceec \
+    file://LICENSE.GPLv2;md5=c96076271561b0e3785dad260634eaa8 \
 "
 
 DEPENDS += "qtbase"
 
-SRCREV = "7346857f4f675f57572d54f15cfad9111af2abde"
+SRCREV = "e2a658a2472d9fa710c251a065f488bae981c0ae"
diff --git a/recipes-qt/qt5/qtsvg_git.bb b/recipes-qt/qt5/qtsvg_git.bb
index 21e06ff..9e0c4fb 100644
--- a/recipes-qt/qt5/qtsvg_git.bb
+++ b/recipes-qt/qt5/qtsvg_git.bb
@@ -3,13 +3,13 @@ require qt5-git.inc
 
 LICENSE = "GFDL-1.3 & BSD & ( GPL-3.0 & The-Qt-Company-GPL-Exception-1.0 | The-Qt-Company-Commercial ) & ( GPL-2.0+ | LGPL-3.0 | The-Qt-Company-Commercial )"
 LIC_FILES_CHKSUM = " \
-    file://LICENSE.LGPLv21;md5=58a180e1cf84c756c29f782b3a485c29 \
-    file://LICENSE.LGPLv3;md5=b8c75190712063cde04e1f41b6fdad98 \
-    file://LICENSE.GPLv3;md5=40f9bf30e783ddc201497165dfb32afb \
+    file://LICENSE.LGPLv21;md5=4bfd28363f541b10d9f024181b8df516 \
+    file://LICENSE.LGPLv3;md5=e0459b45c5c4840b353141a8bbed91f0 \
+    file://LICENSE.GPLv3;md5=88e2b9117e6be406b5ed6ee4ca99a705 \
     file://LGPL_EXCEPTION.txt;md5=9625233da42f9e0ce9d63651a9d97654 \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
 "
 
 DEPENDS += "qtbase"
 
-SRCREV = "64ca369c7e3d61f0416bc1fd6a102f0c62924433"
+SRCREV = "5a00abdefd1c050aae8760dfc01ae5e3631077aa"
diff --git a/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch b/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
index 94cd048..46ab795 100644
--- a/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
+++ b/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
@@ -116,9 +116,11 @@ index 387d54f..56b7d0c 100644
 -qtHaveModule(dbus): SUBDIRS += qdbus
 +!linguistonly:qtHaveModule(dbus): SUBDIRS += qdbus
  
- win32|winrt:SUBDIRS += windeployqt
- winrt:SUBDIRS += winrtrunner
+-win32|winrt:SUBDIRS += windeployqt
+-winrt:SUBDIRS += winrtrunner
 -qtHaveModule(gui):!android:!ios:!qnx:!wince*:!winrt*:SUBDIRS += qtdiag
++!linguistonly:win32|winrt:SUBDIRS += windeployqt
++!linguistonly:winrt:SUBDIRS += winrtrunner
 +!linguistonly:qtHaveModule(gui):!android:!ios:!qnx:!wince*:!winrt*:SUBDIRS += qtdiag
  
  qtNomakeTools( \
diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/qttools_git.bb
index 56c1205..3d77ec7 100644
--- a/recipes-qt/qt5/qttools_git.bb
+++ b/recipes-qt/qt5/qttools_git.bb
@@ -17,7 +17,6 @@ LIC_FILES_CHKSUM = " \
 DEPENDS += "qtbase qtdeclarative qtxmlpatterns"
 
 SRC_URI += " \
-    file://0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch \
     file://0002-assistant-help-fix-linking-of-dependent-libraries.patch \
     file://0003-add-noqtwebkit-configuration.patch \
     file://0004-linguist-tools-cmake-allow-overriding-the-location-f.patch \
@@ -27,14 +26,10 @@ FILES_${PN}-tools += "${datadir}${QT_DIR_NAME}/phrasebooks"
 FILES_${PN}-examples = "${datadir}${QT_DIR_NAME}/examples"
 
 PACKAGECONFIG ??= ""
-PACKAGECONFIG_class-native ??= "linguistonly"
-PACKAGECONFIG_class-nativesdk ??= "linguistonly"
-PACKAGECONFIG[linguistonly] = ""
 PACKAGECONFIG[qtwebkit] = ",,qtwebkit"
 
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'qtwebkit', '', 'CONFIG+=noqtwebkit', d)}"
-EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'linguistonly', 'CONFIG+=linguistonly', '', d)}"
 
-SRCREV = "0597b535f82d3458a1db1828c5e5f725bbcf59fd"
+SRCREV = "b8113e90e2a1d9ea38a478990a93615f432ac35b"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/recipes-qt/qt5/qttranslations_git.bb b/recipes-qt/qt5/qttranslations_git.bb
index 2a37d14..c259244 100644
--- a/recipes-qt/qt5/qttranslations_git.bb
+++ b/recipes-qt/qt5/qttranslations_git.bb
@@ -114,4 +114,4 @@ FILES_${PN}-qt = " \
     ${OE_QMAKE_PATH_TRANSLATIONS}/qt_*.qm \
 "
 
-SRCREV = "2209b3fd6a56bfc44da5369c4fbd345bbca31777"
+SRCREV = "64f3b105fb67d813512b287be6fdaec409d6d943"
diff --git a/recipes-qt/qt5/qtvirtualkeyboard_git.bb b/recipes-qt/qt5/qtvirtualkeyboard_git.bb
index 7e2f445..c93a9bd 100644
--- a/recipes-qt/qt5/qtvirtualkeyboard_git.bb
+++ b/recipes-qt/qt5/qtvirtualkeyboard_git.bb
@@ -48,4 +48,4 @@ FILES_${PN} += "${OE_QMAKE_PATH_DATA}/qtvirtualkeyboard/lipi_toolkit"
 
 DEPENDS += "qtbase qtdeclarative qtmultimedia qtquickcontrols qtsvg qtxmlpatterns"
 
-SRCREV = "626e78c9660cff063e1f9370538b5a424631571c"
+SRCREV = "947a55149aec2724158934efde1be496b3c5e04e"
diff --git a/recipes-qt/qt5/qtwayland-native_git.bb b/recipes-qt/qt5/qtwayland-native_git.bb
deleted file mode 100644
index a214346..0000000
--- a/recipes-qt/qt5/qtwayland-native_git.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-require qt5-native.inc
-require qt5-git.inc
-
-LICENSE = "GFDL-1.3 & BSD & ( GPL-3.0 & The-Qt-Company-GPL-Exception-1.0 | The-Qt-Company-Commercial ) & ( GPL-2.0+ | LGPL-3.0 | The-Qt-Company-Commercial )"
-LIC_FILES_CHKSUM = " \
-    file://LICENSE.LGPL3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
-    file://LICENSE.LGPLv21;md5=4bfd28363f541b10d9f024181b8df516 \
-    file://LICENSE.LGPLv3;md5=e0459b45c5c4840b353141a8bbed91f0 \
-    file://LICENSE.GPL2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-    file://LICENSE.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
-    file://LICENSE.GPL3-EXCEPT;md5=763d8c535a234d9a3fb682c7ecb6c073 \
-    file://LICENSE.GPLv3;md5=88e2b9117e6be406b5ed6ee4ca99a705 \
-    file://LGPL_EXCEPTION.txt;md5=9625233da42f9e0ce9d63651a9d97654 \
-    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
-"
-
-DEPENDS = "qtbase-native wayland-native"
-
-SRC_URI += " \
-    file://0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch \
-"
-
-do_configure() {
-    ${OE_QMAKE_QMAKE} ${OE_QMAKE_DEBUG_OUTPUT} -r ${S}/src/qtwaylandscanner
-}
-
-do_install() {
-    oe_runmake install INSTALL_ROOT=${D}
-}
-
-SRCREV = "a172672484b9496819e588b51ac2ff9fb4a21941"
diff --git a/recipes-qt/qt5/qtwayland/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch b/recipes-qt/qt5/qtwayland/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch
deleted file mode 100644
index 847ba06..0000000
--- a/recipes-qt/qt5/qtwayland/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 47457635603ddb484a479834a052699cce5b34a3 Mon Sep 17 00:00:00 2001
-From: Simon Busch <morphis@gravedo.de>
-Date: Fri, 19 Jul 2013 13:35:14 +0000
-Subject: [PATCH] Install the qtwaylandscanner tool to the native side
-
-Upstream-Status: Inappropiate [configuration]
-
-Signed-off-by: Simon Busch <morphis@gravedo.de>
----
- src/qtwaylandscanner/qtwaylandscanner.pro | 8 ++++++--
- 1 file changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/src/qtwaylandscanner/qtwaylandscanner.pro b/src/qtwaylandscanner/qtwaylandscanner.pro
-index ac2d07b..7a46a24 100644
---- a/src/qtwaylandscanner/qtwaylandscanner.pro
-+++ b/src/qtwaylandscanner/qtwaylandscanner.pro
-@@ -1,6 +1,10 @@
- option(host_build)
- 
--SOURCES += qtwaylandscanner.cpp
-+TARGET = qtwaylandscanner$$qtPlatformTargetSuffix()
-+CONFIG += console warn_off
-+QT = core
- 
--load(qt_tool)
-+SOURCES += qtwaylandscanner.cpp
- 
-+target.path = $$[QT_HOST_BINS]
-+INSTALLS += target
diff --git a/recipes-qt/qt5/qtwayland/0001-examples-wayland-include-server-buffer-only-when-bui.patch b/recipes-qt/qt5/qtwayland/0001-examples-wayland-include-server-buffer-only-when-bui.patch
deleted file mode 100644
index a21c109..0000000
--- a/recipes-qt/qt5/qtwayland/0001-examples-wayland-include-server-buffer-only-when-bui.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 733a85c14cb4ade510a0c78b32cd12cb2d70dbbd Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Sat, 22 Feb 2014 17:47:44 +0100
-Subject: [PATCH] examples/wayland: include server-buffer only when building
- with opengles2
-
-* it's using glBindBuffer in
-  server-buffer/client/serverbufferrenderer.cpp
-
-Change-Id: I8412dfd4ebb95c147328ac6e4dfff14a0cff4e78
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- examples/wayland/wayland.pro | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/examples/wayland/wayland.pro b/examples/wayland/wayland.pro
-index 503190c..9943c52 100644
---- a/examples/wayland/wayland.pro
-+++ b/examples/wayland/wayland.pro
-@@ -10,4 +10,6 @@ qtHaveModule(quick) {
-     SUBDIRS += custom-extension
- }
- 
--SUBDIRS += server-buffer
-+contains(QT_CONFIG, opengles2) {
-+    SUBDIRS += server-buffer
-+}
diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
index b208961..923befa 100644
--- a/recipes-qt/qt5/qtwayland_git.bb
+++ b/recipes-qt/qt5/qtwayland_git.bb
@@ -24,6 +24,12 @@ PACKAGECONFIG ?= " \
     xkb \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xcompositor xkb glx', '', d)} \
 "
+PACKAGECONFIG_class-native ?= ""
+PACKAGECONFIG_class-nativesdk ?= ""
+QMAKE_PROFILES_class-native = "${S}/src/qtwaylandscanner"
+QMAKE_PROFILES_class-nativesdk = "${S}/src/qtwaylandscanner"
+B_class-native = "${SEPB}/src/qtwaylandscanner"
+B_class-nativesdk = "${SEPB}/src/qtwaylandscanner"
 
 PACKAGECONFIG[compositor-api] = "CONFIG+=wayland-compositor"
 PACKAGECONFIG[xcompositor] = "CONFIG+=config_xcomposite CONFIG+=done_config_xcomposite,CONFIG+=done_config_xcomposite,libxcomposite"
@@ -36,16 +42,6 @@ PACKAGECONFIG[libhybris-egl] = "CONFIG+=config_libhybris_egl_server CONFIG+=done
 
 EXTRA_QMAKEVARS_PRE += "${PACKAGECONFIG_CONFARGS}"
 
-FILES_${PN}-plugins += " \
-    ${OE_QMAKE_PATH_PLUGINS}/*/*/*${SOLIBSDEV} \
-"
-
-FILES_${PN}-plugins-dbg += " \
-    ${OE_QMAKE_PATH_PLUGINS}/*/*/.debug/* \
-"
-
-SRC_URI += " \
-    file://0001-examples-wayland-include-server-buffer-only-when-bui.patch \
-"
+SRCREV = "3443483c9efdcfbfe049f96c83f83a5bf1d81e61"
 
-SRCREV = "a172672484b9496819e588b51ac2ff9fb4a21941"
+BBCLASSEXTEND =+ "native nativesdk"
diff --git a/recipes-qt/qt5/qtwebchannel_git.bb b/recipes-qt/qt5/qtwebchannel_git.bb
index 45ac814..a108a22 100644
--- a/recipes-qt/qt5/qtwebchannel_git.bb
+++ b/recipes-qt/qt5/qtwebchannel_git.bb
@@ -17,4 +17,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtdeclarative qtwebsockets"
 
-SRCREV = "3836fd7d12777fc53836a72d6542d2fbf2f20ac9"
+SRCREV = "bf66a8531e0ada3ade7e873bc3fae824237acd3e"
diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index aedd141..24f94d5 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -81,11 +81,11 @@ do_configure() {
     export QMAKE_CACHE_EVAL="${PACKAGECONFIG_CONFARGS}"
 
     # Disable autodetection from sysroot:
-    sed -i 's/packagesExist([^)]*vpx[^)]*):/false:/g; s/config_srtp:/false:/g; s/config_snappy:/false:/g; s/packagesExist(nss):/false:/g; s/packagesExist(minizip, zlib):/false:/g; s/packagesExist(libwebp,libwebpdemux):/false:/g; s/packagesExist(libxml-2.0,libxslt):/false:/g; s/^ *packagesExist($$package):/false:/g' ${S}/tools/qmake/mkspecs/features/configure.prf
+    sed -i 's/packagesExist([^)]*vpx[^)]*):/false:/g; s/config_libvpx:/false:/g; s/config_srtp:/false:/g; s/config_snappy:/false:/g; s/packagesExist(nss):/false:/g; s/packagesExist(minizip, zlib):/false:/g; s/packagesExist(libwebp,libwebpdemux):/false:/g; s/packagesExist(libxml-2.0,libxslt):/false:/g; s/^ *packagesExist($$package):/false:/g' ${S}/tools/qmake/mkspecs/features/configure.prf
 
     # qmake can't find the OE_QMAKE_* variables on it's own so directly passing them as
     # arguments here
-    ${OE_QMAKE_QMAKE} -r ${EXTRA_QMAKEVARS_PRE} QTWEBENGINE_ROOT="${S}" \
+    ${OE_QMAKE_QMAKE} ${OE_QMAKE_QTCONF} -r ${EXTRA_QMAKEVARS_PRE} QTWEBENGINE_ROOT="${S}" \
         QMAKE_CXX="${OE_QMAKE_CXX}" QMAKE_CC="${OE_QMAKE_CC}" \
         QMAKE_LINK="${OE_QMAKE_LINK}" \
         QMAKE_CFLAGS="${OE_QMAKE_CFLAGS}" \
@@ -109,7 +109,7 @@ RDEPENDS_${PN}-examples += " \
     qtdeclarative-qmlplugins \
 "
 
-QT_MODULE_BRANCH_CHROMIUM = "49-based"
+QT_MODULE_BRANCH_CHROMIUM = "53-based"
 
 SRC_URI += " \
     ${QT_GIT}/qtwebengine-chromium.git;name=chromium;branch=${QT_MODULE_BRANCH_CHROMIUM};destsuffix=git/src/3rdparty \
@@ -122,10 +122,8 @@ SRC_URI += " \
     file://0002-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch \
 "
 
-SRCREV_qtwebengine = "dbf7dd27428ff755444eac5e975cb69802ac9771"
-# This is in git submodule, but we're using the latest in 49-based
-# SRCREV_chromium = "c109a95a067af783e48f93d1cdeca870cda98878"
-SRCREV_chromium = "29c16917b33c26ad32893fa05af971c6c6f50297"
+SRCREV_qtwebengine = "ac3d8780a0293793dbc3cd47b96aab4613dec5d9"
+SRCREV_chromium = "f3ce802c71aeaeb7dd218180a3bc5c6ac63b445d"
 SRCREV = "${SRCREV_qtwebengine}"
 
 SRCREV_FORMAT = "qtwebengine_chromium"
diff --git a/recipes-qt/qt5/qtwebkit-examples_git.bb b/recipes-qt/qt5/qtwebkit-examples_git.bb
index e5075de..95446fb 100644
--- a/recipes-qt/qt5/qtwebkit-examples_git.bb
+++ b/recipes-qt/qt5/qtwebkit-examples_git.bb
@@ -17,4 +17,4 @@ DEPENDS += "qtwebkit qtxmlpatterns"
 RDEPENDS_${PN}-examples += "qtwebkit-qmlplugins"
 RDEPENDS_${PN}-examples += "${@bb.utils.contains('PACKAGECONFIG_OPENSSL', 'openssl', 'ca-certificates', '', d)}"
 
-SRCREV = "1ac4ee240214a0e36b504fa1bcbc0c716d50620f"
+SRCREV = "1a839b50564782feac2e5dd439686c2a0ed7d985"
diff --git a/recipes-qt/qt5/qtwebkit/0004-Remove-unused-check-for-the-private_headers.patch b/recipes-qt/qt5/qtwebkit/0004-Remove-unused-check-for-the-private_headers.patch
new file mode 100644
index 0000000..b6eabfd
--- /dev/null
+++ b/recipes-qt/qt5/qtwebkit/0004-Remove-unused-check-for-the-private_headers.patch
@@ -0,0 +1,35 @@
+From 6f4746e59c3768a56336f202054ec5498a7d376f Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jkt@kde.org>
+Date: Wed, 14 Sep 2016 23:51:14 +0200
+Subject: [PATCH] Remove unused check for private_tests
+
+It turns out that qt_developer_build is never used anyway.
+
+I did some git archeology and it looks like it was nuked when doing the
+5.2 merge from upstream. The original purpose was apparently to control
+-Werror, which is nowadays controlled by CONFIG -= production_build.
+
+This actually fixes the build, as the QT_FOR_CONFIG += core-private which
+would have been required for qtConfig(private_tests) is missing.
+
+Task-number: QTBUG-55950
+Change-Id: Iaaaad184b29b523ce4a4ed8afec2ac527d8f93e3
+---
+ Tools/qmake/mkspecs/features/default_pre.prf | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/Tools/qmake/mkspecs/features/default_pre.prf b/Tools/qmake/mkspecs/features/default_pre.prf
+index 6bb52d0..8aa806d 100644
+--- a/Tools/qmake/mkspecs/features/default_pre.prf
++++ b/Tools/qmake/mkspecs/features/default_pre.prf
+@@ -62,10 +62,6 @@ win32-msvc*: MAKEFILE_NOOP_COMMAND = @echo >NUL
+ scratchbox: PYTHON = python2.6
+ else: PYTHON = python
+ 
+-# We use private_tests to detect developer build, since the destdir will
+-# always be our webkit build dir. This might change as configure changes.
+-qtConfig(private_tests): CONFIG += qt_developer_build
+-
+ # By default we enable "production build", and build-webkit, which is
+ # used by bots and developers, will disable it, to enable warnings etc.
+ CONFIG += production_build
diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_git.bb
index 78ca1f5..6944603 100644
--- a/recipes-qt/qt5/qtwebkit_git.bb
+++ b/recipes-qt/qt5/qtwebkit_git.bb
@@ -22,6 +22,7 @@ SRC_URI += "\
     file://0001-qtwebkit-fix-QA-issue-bad-RPATH.patch \
     file://0002-Remove-TEXTREL-tag-in-x86.patch \
     file://0003-Exclude-backtrace-API-for-non-glibc-libraries.patch \
+    file://0004-Remove-unused-check-for-the-private_headers.patch \
 "
 
 PACKAGECONFIG ??= "gstreamer qtlocation qtmultimedia qtsensors qtwebchannel \
@@ -83,4 +84,4 @@ PACKAGES_remove = "${PN}-examples-dev ${PN}-examples-staticdev ${PN}-examples-db
 RUBY_SYS = "${@ '${BUILD_SYS}'.replace('i486', 'i386').replace('i586', 'i386').replace('i686', 'i386') }"
 export RUBYLIB="${STAGING_DATADIR_NATIVE}/rubygems:${STAGING_LIBDIR_NATIVE}/ruby:${STAGING_LIBDIR_NATIVE}/ruby/${RUBY_SYS}"
 
-SRCREV = "76e2732f013732461c09a1d6c6b4c77fcab1c0d0"
+SRCREV = "431520f1508e92272171c214b087183e71d08ec5"
diff --git a/recipes-qt/qt5/qtwebsockets_git.bb b/recipes-qt/qt5/qtwebsockets_git.bb
index 8c238db..4897d25 100644
--- a/recipes-qt/qt5/qtwebsockets_git.bb
+++ b/recipes-qt/qt5/qtwebsockets_git.bb
@@ -3,12 +3,12 @@ require qt5-git.inc
 
 LICENSE = "GFDL-1.3 & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
 LIC_FILES_CHKSUM = " \
-    file://LICENSE.LGPLv21;md5=58a180e1cf84c756c29f782b3a485c29 \
-    file://LICENSE.LGPLv3;md5=b8c75190712063cde04e1f41b6fdad98 \
-    file://LICENSE.GPLv3;md5=40f9bf30e783ddc201497165dfb32afb \
+    file://LICENSE.LGPLv21;md5=4bfd28363f541b10d9f024181b8df516 \
+    file://LICENSE.LGPLv3;md5=e0459b45c5c4840b353141a8bbed91f0 \
+    file://LICENSE.GPLv3;md5=88e2b9117e6be406b5ed6ee4ca99a705 \
     file://LGPL_EXCEPTION.txt;md5=bb426f3367c4805d1e12fad05bd0b750 \
 "
 
 DEPENDS += "qtbase qtdeclarative"
 
-SRCREV = "8d17ddfc2f62df56ac067bd0f9736c6e8d37aa97"
+SRCREV = "ccb138548314a767a897496c74c04a261a391027"
diff --git a/recipes-qt/qt5/qtx11extras_git.bb b/recipes-qt/qt5/qtx11extras_git.bb
index 9a4d6d7..16db113 100644
--- a/recipes-qt/qt5/qtx11extras_git.bb
+++ b/recipes-qt/qt5/qtx11extras_git.bb
@@ -3,14 +3,14 @@ require qt5-git.inc
 
 LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1 | LGPL-3.0) | GPL-2.0"
 LIC_FILES_CHKSUM = " \
-    file://LICENSE.LGPLv21;md5=58a180e1cf84c756c29f782b3a485c29 \
-    file://LICENSE.LGPLv3;md5=b8c75190712063cde04e1f41b6fdad98 \
-    file://LICENSE.GPLv3;md5=40f9bf30e783ddc201497165dfb32afb \
+    file://LICENSE.LGPLv21;md5=4bfd28363f541b10d9f024181b8df516 \
+    file://LICENSE.LGPLv3;md5=e0459b45c5c4840b353141a8bbed91f0 \
+    file://LICENSE.GPLv3;md5=88e2b9117e6be406b5ed6ee4ca99a705 \
     file://LGPL_EXCEPTION.txt;md5=9625233da42f9e0ce9d63651a9d97654 \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
-    file://LICENSE.GPLv2;md5=05832301944453ec79e40ba3c3cfceec \
+    file://LICENSE.GPLv2;md5=c96076271561b0e3785dad260634eaa8 \
 "
 
 DEPENDS += "qtbase"
 
-SRCREV = "bae8bfc7a811af2bf51b227cbf8467e50a2a149a"
+SRCREV = "0f91218091da69a81eb3e3336d1bdbe572a21908"
diff --git a/recipes-qt/qt5/qtxmlpatterns_git.bb b/recipes-qt/qt5/qtxmlpatterns_git.bb
index e4c3d7f..73f5dbf 100644
--- a/recipes-qt/qt5/qtxmlpatterns_git.bb
+++ b/recipes-qt/qt5/qtxmlpatterns_git.bb
@@ -16,6 +16,6 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "574d92a43e1fc5480a7f5f79cc6baf566a53349f"
+SRCREV = "977d0fb3f0bf776e2aad3c8ff795115ce62909ff"
 
 BBCLASSEXTEND =+ "native nativesdk"
-- 
1.9.1


