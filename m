Return-Path: <samuli.piippo@qt.io>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0094.outbound.protection.outlook.com [104.47.2.94])
	by mail.openembedded.org (Postfix) with ESMTP id 2F710745BB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 May 2018 17:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=qtcompany.onmicrosoft.com; s=selector1-qt-io;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=xl7aePHkCh+rUaN/vpKDK3MBzzSE4odBdBEQQ8mtibI=;
	b=i0uvon/IvW/usqBph5Z9aZfRR1bGimMrckIeNMKV5eA6fFDATWBBre7txPTu+NTrOkqYRc2gnYAUQIOYjnfKh3wNmHWlkIvvWOiAhzAjugzwIohApr5dExqEnXStudiqLWnZkoxQ6p2xg2BxELLs9Hixo5gmCVscbzbXsGcy/lo=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=samuli.piippo@qt.io; 
Received: from piippo.intra.qt (192.89.120.53) by
	AM5PR0201MB2258.eurprd02.prod.outlook.com (2603:10a6:203:32::10) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.797.11;
	Tue, 29 May 2018 09:26:19 +0000
From: Samuli Piippo <samuli.piippo@qt.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 May 2018 12:25:56 +0300
Message-Id: <20180529092556.25053-1-samuli.piippo@qt.io>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
X-Originating-IP: [192.89.120.53]
X-ClientProxiedBy: AM5PR0602CA0002.eurprd06.prod.outlook.com
	(2603:10a6:203:a3::12) To AM5PR0201MB2258.eurprd02.prod.outlook.com
	(2603:10a6:203:32::10)
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(7021125)(5600026)(4534165)(7022125)(4603075)(4627221)(201702281549075)(7048125)(7024125)(7027125)(7028125)(7023125)(2017052603328)(7153060)(7193020);
	SRVR:AM5PR0201MB2258; 
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0201MB2258;
	3:tX2vw7XF5KmT5hsUVlAayTRN/CaFTjuUsD56/BqIrXVoXwrBuhLOOItQztLktFcODFF4rNA4hKdQjlIkRcZ2k3oEffjjYcVvp2xda3R4DJPq1YVhjUcWfZHIRBsouRC3MFJtkq+i+YD9twsVued3j+tEDQ8++peonwwgrCX4HOcj00jACdtsXFnz1mlwKaSk3ArxTSBXeLSrXW6JGxyztwErxwoefA6qXOZgPS8/JBhk0mpZFdcNkNp9Yk0zlke/;
	25:Jfc3NUc7yrwWujpNgcjCjTNDhI5wDnaRfd3RxqFMcfJrFctmf3nWqhvaeeiDRGPppFX7l+p93FJ4WLCGXJC4hQaNbtlMn+f+DhxB2dPnpyJIIzyb7O1VHu0d/I4Iu8tL1zhSKUnnCAHcjNte3kJHzU0d7ZHWtOgolvEvUMitFYPq3iRx+b5j8n+0Vbrp4OKuuSSYgzrCIU92Je6cR5vGFDJ1getT3nBtU7+u0FD6a9zdmYT5p18R7O1OyQqW3f3LtHR3IkoeSS1T16YKH6xxBfRQfFkvyHi4SPoN1ZyYUUNBzHv/Z2QmHUF/WUusJEzghkp9KE6niBDBkE1HGuWBXg==;
	31:JBQF8gj4QvD0yorlcQIQ78d87//pfwWvkffMtyQfeSGKBnTFTRsa9fBMMlVK+VjEbUqrLbsyGAwZRbbgpeY/Dpa6t/LLVIyZlD30Fd5fE/EaetrvoGBMrM74LZ2cxUCvSsXtFOo5dTOuXcTJODGTNkFsuPMAJOflg8RA4LyTe4V0Pq0ZkPMHe93vGHsbHUFgdV5maHzglwCkI9MAa7pd/vZOhb83lMUtmTm+dirHIOM=
X-MS-TrafficTypeDiagnostic: AM5PR0201MB2258:
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0201MB2258;
	20:MriQRsPp+ZbwkelrodP+asMNAEQdCkG8o1oT5MLxOE6fDsbEJ9wpmzUqlNBZ3uwwygyjZlcWchgYzW/ohPhbtpXWzzHyqPVWYad6Vq3QuiEgssFiek6GZBRt9qCzq8jS2/lj39P70AnzpFS0qscKsrH3HKHm2VNUqwrJ8FpJuhfGTiBry548pSvwmXuTac/+aix3979N/KH/yZBgistOlGVQSAMSvVSFQcJLhpwH5kTtBWk6u1bqV6UU5//Xm10b2IkyXVoMYZ/JrTLQH+p1MiBLCNMb9hVtrAN9k+Z0Llu5glCdCGXrw7ezyAD+Eqd9gEyBbK20qloc7DSTHRTqDRE4Lco5klaG/LIwJ3Wec/RC32BDvkeI+prd0wNzIzx//OqLFlBV5aOFKnMO1FhVMAiScUUUtzP3ivxOZZU9osQaKgX+EYaCh5lxie8jyOINXEHcdJ4oZdLfunox6tpdoyGYJut1TUTtptqvSsQTXgJvvyPQZ63rDJwTYIw2iRZ7;
	4:I9CeAj63cHTx4jykY060pOXGI/Jk0pXz6F9zBi8jw/5g5SRMP8JrViGNBQ+IbSEvPTFbvQPhf7CCdODw7GLCm/c0s/kFkjmU5KgQlf7f7HKTPs3aJ8L5cKmpak/NBEUBNtwVRu+1amZEKhYcgBKhK3sEhvLljL/YHLjkvgPf6C5sVnD8pxDF+gN5oo97e4Ev4KqAvnpwoxWkvf5mq9aptkgCxcDRAWGKMv6lNgmRyUfMvXpnNWfN35oh20Y5WZMgsrlc9PhzOa3wRtGvUEmalhCrg9XrNdbLaBYFeW6Ocjxg810Bv3LqM2Gd2Zy0R+P0
X-Microsoft-Antispam-PRVS: <AM5PR0201MB2258BFEC332B045FED027073E96D0@AM5PR0201MB2258.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(3002001)(93006095)(93001095)(3231254)(944501410)(52105095)(10201501046)(149027)(150027)(6041310)(2016111802025)(20161123558120)(20161123560045)(20161123562045)(20161123564045)(6043046)(6072148)(201708071742011)(7699016);
	SRVR:AM5PR0201MB2258; BCL:0; PCL:0; RULEID:;
	SRVR:AM5PR0201MB2258; 
X-Forefront-PRVS: 0687389FB0
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(366004)(39380400002)(376002)(39840400004)(346002)(396003)(199004)(189003)(2616005)(476003)(486006)(44832011)(50466002)(6306002)(6512007)(1857600001)(53936002)(8676002)(81156014)(81166006)(316002)(69596002)(26005)(16526019)(186003)(2906002)(2361001)(68736007)(1076002)(2870700001)(2351001)(8936002)(25786009)(956004)(53386004)(6506007)(50226002)(74482002)(3846002)(6116002)(106356001)(66066001)(386003)(575784001)(86362001)(36756003)(97736004)(5660300001)(6666003)(966005)(6916009)(6486002)(47776003)(59450400001)(52116002)(105586002)(305945005)(53416004)(33896004)(23676004)(7736002)(478600001)(19627235001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM5PR0201MB2258;
	H:piippo.intra.qt; FPR:; SPF:None; LANG:en; PTR:InfoNoRecords;
	A:1; MX:1; 
Received-SPF: None (protection.outlook.com: qt.io does not designate permitted
	sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtBTTVQUjAyMDFNQjIyNTg7MjM6SC9YWEJkK2YxVmhyenNiTWdQRVhydFFP?=
	=?utf-8?B?RUt1TkJFSVR2dDc1cHpWc1VKeFJGMWE3ekxWQkZtOHNkMEtYSnR2SUJkQmFT?=
	=?utf-8?B?YURoOFZIK2RWVmowZjYzRTZpaG1kTGRzbzdMVWxQeW5yTGI5U3kyOHYwRVhC?=
	=?utf-8?B?NUlmbk5sa2ZuMW45SndNblF3elFxSUI2SE12TnMyTlA2TzZ1ODBFQTQwbm1x?=
	=?utf-8?B?YURRWm0vRmhUM3EyM1plNDM1TjdnWmZ0N2pmcU55UTgzakIvV05TYyt2cUlR?=
	=?utf-8?B?NTdoN3ZkNE1SRUpuSUQyakd4bmdzTWpJUFJDTjI1c24rb2c0SmE2R2dDOXNx?=
	=?utf-8?B?UThuTmJ3bUViRlZtbWxkTzVlOHYrbnlnSnJsNHhOOFNFQ0UrRWdDMHhLUXE4?=
	=?utf-8?B?RjJIbStlcHBIUW5qcWtKY05ZdkVwTGpPelJMQTNZcmJkTXBEd2VUSW4wemNT?=
	=?utf-8?B?KzZ2QklUMHdrRkdOTDNLRTZhVXUrZkdPSmlpNkRpc1dsS0NudUJSR2xjUGF1?=
	=?utf-8?B?dXRBTzZiNWpWTXMxY3NueHhrTGRuYXBaaW5TZEtZU1hzbjd1YXBhdFFPUVJF?=
	=?utf-8?B?TGw1MEgrL3cyRmtNSkhyNlhXZmQySE8zaW9maWZwelk4czVhdWpsQXlOWFo1?=
	=?utf-8?B?NXdRakpwMVBIVnpGUjVmbGFDaFA1OUVCeUFJSytCY2pPRlBqMW56L0V5UDE3?=
	=?utf-8?B?UnVyRXpDT1RUSWhsV3Z1NStuazl6K21hN1ZCaUNLZmVVVTk3VExVVGlhY2h4?=
	=?utf-8?B?MkJPdVUzZ3FzRjR4WTNWL0xQQ21JYm5CY1o5cUhKQ0hBRmw0T21HZ2d5V01T?=
	=?utf-8?B?c2pnSy9uajArYmhXalZaTFpXWld1dGYvYlFEV0NnR0t1TWwyNWVsSHFrK240?=
	=?utf-8?B?c0l0eDl6MmlXbkJKeDRQNG1TY2xYanZFb3dWTEU4SFVDaEVCR0ZZMmViM0Zm?=
	=?utf-8?B?a0lPcmJjQ0dTZmVhRHdWQ2FXSURHUDhUS0RleUFmZ0UvV0dCZVVzZXE3Y014?=
	=?utf-8?B?bWlkaEdXd2dpSDducmRxVGpiTG5nS01yempvaDhBbkwwd05CRitRSnVCTGZk?=
	=?utf-8?B?dEhrSjJyK0RGZFZqZU5QaHQzOEtBS2F6UjZySk8rQ1dVYkwxclU4emlSTHdk?=
	=?utf-8?B?VVAvZDBqR2xZOU45RkJwNit6WmRwKzdLa3RQTGd0b1JWdDc5MjArK2x2K0FC?=
	=?utf-8?B?eEZnTE5IQmwvNkluMCtpYnYxdkN0b1VlU2M2WmFIRGk4Ny9jdnNCT2FlcEhY?=
	=?utf-8?B?M29FMHdrREtUaUdwMmtVQlcxVVgyWDhrN0dDWjZrSWc1OGhEZDdYdGJ5MGNF?=
	=?utf-8?B?SE4yM0puZGpZaCtyMGFXZHFQL09lcUZDcFlzeDVUM1NPSDN1SC9mY3NXVDJs?=
	=?utf-8?B?Wmt5K1E1YVB1ZWN3TnduL1B3Sk5uVk5hQnoxM3hMWSsrWTVTbWJVRWIwQVl1?=
	=?utf-8?B?YUhXSzgwMGtyWmVHZFdSeTh3UXlwdTU5QkdTd2dPQTFjZ1FWV1FSRk9WZHkz?=
	=?utf-8?B?Q0Y4M2IreWhWY2JqcStWRmlaVFIwMnB6SzFnL3F5WEg0eTJqVWJ6N1dGNXMy?=
	=?utf-8?B?Znl2VG9ReC96bTR4dGE1STJINkx6cFZCQ3lBSGEyeFlGdEMxWVFUcG1sTnpn?=
	=?utf-8?B?WVBGOXdFSXlqWjZWY0JIa3lmWDNIc01tc3Q3K3ExV1UycW1XTTdtbEFTcWhy?=
	=?utf-8?B?d3JOeEtlY3hVbUlORTB6Y2xDTWVTMzE4NzgxRU1KcFNQTXR2R3RVT1krYVZo?=
	=?utf-8?B?Sk5SalVRVmtMbDQydGM2Y0hMWmRuMWJBaTMxTXZuOWFUemQ1RGtMbE9MRGt5?=
	=?utf-8?B?bHQ5ejRLdk55ZmVIK3FmalRoN1VkNXR0dERyMjNXYlZUYm9oSndWeUJiQzh5?=
	=?utf-8?Q?R/HlnD9h/bwBqVCIpWmmrXzHRf5mFOy4j1?=
X-Microsoft-Antispam-Message-Info: 8YZo7XoZkDDkrhwE7vaWRWeR1gULbpt5hpiApHYu2Tn2pMXf75xILtVOxgjxRshjyTHSc/uVIfj2cEBoxhri6PNoD10RPnMf6dDGd4nAuw9/UqJPCoaWQwYOS+ZkeLxo/XFgBVjS4FCVcd+dG48gXqMYVjchFXYrTjG7Ub6mFlPDqwzkzHxXBN+Caw1ECH9O
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0201MB2258;
	6:J03AQPZ6+nXSS+Q0fYwT5Pccdu3bSaCmiLod4ECUvus/MZoEebTkt5AO7wU2e/1177Ho/H4tux1fwvgh1143RJU/4T1zbL2HrYwzgTrljuHSenZskWIAWyWjZZNIh/U9ueLOFwWuj2ygUilMisWw1/3cjN46fCPFPSmJeIXXdA/YavZHW0LDJRboH5kOV6q9GeOzpTSNdvxgz8MJ9Ma88EGdqyJwcJT+XaKs6QbKP0RLYMaepmj9isRlS95xwUE+upL+OLpqBvEmJuSify1kf+NnKaQy8Oqz85UrQ0wEAmEzRsV+Lk3GUNK0uzEQfqN8S5Gbuq1xpQIMfWBIL0xI6tPF5t/C0r6QTITV4VEjjcHCnckRzRnxc6Aw0QU3pe2bzuWZvz899gxq1oC8VIV0CrbH17wl1gIf8bIJsL5g8y/ZgB1h8PODCHApuORCTpiTh3UvAWRFKPdyRbMqMhpyGQ==;
	5:OKkpzPYEAORi1H/W3kJElkgS5/ybYaOoCIO4B+G2pujZvel99r0OADywQMDJGkNNFGWgDNWvmKFZFv6RTRun9fgL9HEHNUdWMvlPudXy1cDH8mdDcp7130fjKoDvzlmMU9FIcoLGcmLnqTtPit6XMMBjRsmMjnMaqAUvebI4STs=;
	24:Zkf1L0BY3D7gbawpQX/vyC6YZO/+fPATAfKkuTVJcoAX7sMptS2kKGSx8H0KB78sJdydizdSQNkDlvF+TREmZOX7eVNviiQpG2zdH2BqEAg=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0201MB2258;
	7:j+C/bK2TSUmV/mLOXHiN8XrFlr8ZkgBHdcOXEL38/dRyxZ9SeWErjyrK73VJBDPyBz7KfvzUXG2BgazNDVTQTu2CpHwjvKikYh/dWS4fsqzHfIKu6DJcDVn5i8WP+q8KG4UTVcUiiXRRzZFPnPHBMRwZjK2bhxQplHSonoKZrxazJ0EfbWArSU45mh7CyDHjoNCSaB+Q2oSmg39AWWxDGUWQY+dt5lA7/KALDo4NJU71mNMKihYNvicPX7+bKmtT
X-MS-Office365-Filtering-Correlation-Id: de3c504f-7767-4741-b18b-08d5c5463cb4
X-OriginatorOrg: qt.io
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2018 09:26:19.7306 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de3c504f-7767-4741-b18b-08d5c5463cb4
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 20d0b167-794d-448a-9d01-aaeccc1124ac
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0201MB2258
Subject: [meta-qt5][PATCH] qt5: Update to Qt 5.11.0
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
X-List-Received-Date: Tue, 29 May 2018 17:59:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add recipes for Qt OPC UA and Qt WebGL platform plugin.
---
 recipes-qt/qt5/nativesdk-qtbase_git.bb        |  7 +-
 recipes-qt/qt5/qt3d_git.bb                    |  2 +-
 recipes-qt/qt5/qt5-git.inc                    |  2 +-
 recipes-qt/qt5/qtbase-native_git.bb           |  3 +-
 recipes-qt/qt5/qtbase_git.bb                  |  7 +-
 recipes-qt/qt5/qtcanvas3d_git.bb              |  2 +-
 recipes-qt/qt5/qtcharts_git.bb                |  2 +-
 recipes-qt/qt5/qtconnectivity_git.bb          |  2 +-
 recipes-qt/qt5/qtdeclarative_git.bb           |  6 +-
 recipes-qt/qt5/qtgamepad_git.bb               |  2 +-
 recipes-qt/qt5/qtgraphicaleffects_git.bb      |  2 +-
 recipes-qt/qt5/qtimageformats_git.bb          |  2 +-
 recipes-qt/qt5/qtknx_git.bb                   |  2 +-
 recipes-qt/qt5/qtlocation_git.bb              | 10 +--
 recipes-qt/qt5/qtmultimedia_git.bb            |  2 +-
 recipes-qt/qt5/qtopcua_git.bb                 | 13 ++++
 recipes-qt/qt5/qtpurchasing_git.bb            |  2 +-
 recipes-qt/qt5/qtquickcontrols2_git.bb        |  2 +-
 recipes-qt/qt5/qtquickcontrols_git.bb         |  2 +-
 recipes-qt/qt5/qtremoteobjects_git.bb         |  2 +-
 recipes-qt/qt5/qtscript_git.bb                |  2 +-
 recipes-qt/qt5/qtscxml_git.bb                 |  2 +-
 recipes-qt/qt5/qtsensors_git.bb               |  2 +-
 recipes-qt/qt5/qtserialbus_git.bb             |  2 +-
 recipes-qt/qt5/qtserialport_git.bb            |  7 +-
 recipes-qt/qt5/qtsvg_git.bb                   |  2 +-
 recipes-qt/qt5/qttools_git.bb                 |  2 +-
 recipes-qt/qt5/qtvirtualkeyboard_git.bb       |  2 +-
 ...01-fix-build-without-xkbcommon-evdev.patch | 68 -------------------
 recipes-qt/qt5/qtwayland_git.bb               |  9 +--
 recipes-qt/qt5/qtwebchannel_git.bb            |  2 +-
 recipes-qt/qt5/qtwebengine_git.bb             |  4 +-
 recipes-qt/qt5/qtwebglplugin_git.bb           | 21 ++++++
 recipes-qt/qt5/qtwebsockets_git.bb            |  2 +-
 recipes-qt/qt5/qtwebview_git.bb               |  2 +-
 recipes-qt/qt5/qtx11extras_git.bb             |  2 +-
 recipes-qt/qt5/qtxmlpatterns_git.bb           |  2 +-
 37 files changed, 84 insertions(+), 123 deletions(-)
 create mode 100644 recipes-qt/qt5/qtopcua_git.bb
 delete mode 100644 recipes-qt/qt5/qtwayland/0001-fix-build-without-xkbcommon-evdev.patch
 create mode 100644 recipes-qt/qt5/qtwebglplugin_git.bb

diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index 27bd563..5971eeb 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -6,7 +6,6 @@ HOMEPAGE = "http://qt-project.org"
 LICENSE = "GFDL-1.3 & BSD & ( GPL-3.0 & The-Qt-Company-GPL-Exception-1.0 | The-Qt-Company-Commercial ) & ( GPL-2.0+ | LGPL-3.0 | The-Qt-Company-Commercial )"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPL3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
-    file://LICENSE.LGPLv3;md5=86d02ed8764e77c1c0b194fde895a51b \
     file://LICENSE.GPL2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
     file://LICENSE.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
     file://LICENSE.GPL3-EXCEPT;md5=763d8c535a234d9a3fb682c7ecb6c073 \
@@ -174,8 +173,8 @@ do_install() {
     install -m 644 ${WORKDIR}/OEQt5Toolchain.cmake ${D}${datadir}/cmake/OEToolchainConfig.cmake.d/
 
     # Fix up absolute paths in scripts
-    grep -lr /usr/bin/python ${D}${OE_QMAKE_PATH_QT_ARCHDATA}/ | \
-        xargs -r sed -i -e '1s,#!.*python,#! ${USRBINPATH}/env python,'
+    sed -i -e '1s,#!/usr/bin/python,#! ${USRBINPATH}/env python,' \
+        ${D}${OE_QMAKE_PATH_QT_ARCHDATA}/mkspecs/features/uikit/devices.py
 }
 
 fakeroot do_generate_qt_environment_file() {
@@ -210,4 +209,4 @@ fakeroot do_generate_qt_environment_file() {
 do_generate_qt_environment_file[umask] = "022"
 addtask generate_qt_environment_file after do_install before do_package
 
-SRCREV = "2b5587d901a0cc23749bf27a923d50bf0e5860d3"
+SRCREV = "6eef81ee1c82f934e14d47047d8b6103b8755321"
diff --git a/recipes-qt/qt5/qt3d_git.bb b/recipes-qt/qt5/qt3d_git.bb
index 6b5ddeb..07b28ac 100644
--- a/recipes-qt/qt5/qt3d_git.bb
+++ b/recipes-qt/qt5/qt3d_git.bb
@@ -36,6 +36,6 @@ do_configure_prepend() {
          ${S}/src/quick3d/imports/input/importsinput.pro
 }
 
-SRCREV = "6d73c51d44d10925a05804cd8e70978f155643df"
+SRCREV = "15e863517ea37ca7ba6bcb75b078272eddbc5d37"
 
 BBCLASSEXTEND += "native nativesdk"
diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
index ae7394c..41ad280 100644
--- a/recipes-qt/qt5/qt5-git.inc
+++ b/recipes-qt/qt5/qt5-git.inc
@@ -14,4 +14,4 @@ CVE_PRODUCT = "qt"
 
 S = "${WORKDIR}/git"
 
-PV = "5.10.1+5.11-beta3+git${SRCPV}"
+PV = "5.11.0+git${SRCPV}"
diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index d6c53ad..0d7e598 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -6,7 +6,6 @@ HOMEPAGE = "http://qt-project.org"
 LICENSE = "GFDL-1.3 & BSD & ( GPL-3.0 & The-Qt-Company-GPL-Exception-1.0 | The-Qt-Company-Commercial ) & ( GPL-2.0+ | LGPL-3.0 | The-Qt-Company-Commercial )"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPL3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
-    file://LICENSE.LGPLv3;md5=86d02ed8764e77c1c0b194fde895a51b \
     file://LICENSE.GPL2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
     file://LICENSE.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
     file://LICENSE.GPL3-EXCEPT;md5=763d8c535a234d9a3fb682c7ecb6c073 \
@@ -135,4 +134,4 @@ do_install() {
     echo 'set(_qt5_corelib_extra_includes "${_qt5Core_install_prefix}/lib${QT_DIR_NAME}/mkspecs/linux-oe-g++")' > ${D}${libdir}/cmake/Qt5Core/Qt5CoreConfigExtrasMkspecDir.cmake
 }
 
-SRCREV = "2b5587d901a0cc23749bf27a923d50bf0e5860d3"
+SRCREV = "6eef81ee1c82f934e14d47047d8b6103b8755321"
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index a599fc9..cc002b3 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -5,7 +5,6 @@ require qt5-ptest.inc
 LICENSE = "GFDL-1.3 & BSD & ( GPL-3.0 & The-Qt-Company-GPL-Exception-1.0 | The-Qt-Company-Commercial ) & ( GPL-2.0+ | LGPL-3.0 | The-Qt-Company-Commercial )"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPL3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
-    file://LICENSE.LGPLv3;md5=86d02ed8764e77c1c0b194fde895a51b \
     file://LICENSE.GPL2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
     file://LICENSE.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
     file://LICENSE.GPL3-EXCEPT;md5=763d8c535a234d9a3fb682c7ecb6c073 \
@@ -233,6 +232,10 @@ do_install_append() {
     echo "isEmpty(QMAKE_STRIP): QMAKE_STRIP = ${TARGET_PREFIX}strip" >> $conf
 
     generate_target_qt_config_file ${D}${OE_QMAKE_PATH_BINS}/qt.conf
+
+    # Fix up absolute paths in scripts
+    sed -i -e '1s,#!/usr/bin/python,#! ${USRBINPATH}/env python,' \
+        ${D}${OE_QMAKE_PATH_QT_ARCHDATA}/mkspecs/features/uikit/devices.py
 }
 
 # mkspecs have mac specific scripts that depend on perl and bash
@@ -240,4 +243,4 @@ INSANE_SKIP_${PN}-mkspecs += "file-rdeps"
 
 RRECOMMENDS_${PN}-plugins += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libx11-locale', '', d)}"
 
-SRCREV = "2b5587d901a0cc23749bf27a923d50bf0e5860d3"
+SRCREV = "6eef81ee1c82f934e14d47047d8b6103b8755321"
diff --git a/recipes-qt/qt5/qtcanvas3d_git.bb b/recipes-qt/qt5/qtcanvas3d_git.bb
index 57e79be..8757967 100644
--- a/recipes-qt/qt5/qtcanvas3d_git.bb
+++ b/recipes-qt/qt5/qtcanvas3d_git.bb
@@ -10,4 +10,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS = "qtdeclarative"
 
-SRCREV = "ff771b7d57eb3654f6321eb105129a594ec2841e"
+SRCREV = "9d555f6d21d013c990793aaaa23a5085529631a5"
diff --git a/recipes-qt/qt5/qtcharts_git.bb b/recipes-qt/qt5/qtcharts_git.bb
index c360ecf..a6ec17f 100644
--- a/recipes-qt/qt5/qtcharts_git.bb
+++ b/recipes-qt/qt5/qtcharts_git.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative qtmultimedia"
 
-SRCREV = "d3f9275cbaa6a6059298ec248dd28dd6ef065e51"
+SRCREV = "4f66d1ffeecd95b4bf6666b71536c42dea7450ed"
 
 # The same issue as in qtbase:
 # http://errors.yoctoproject.org/Errors/Details/152641/
diff --git a/recipes-qt/qt5/qtconnectivity_git.bb b/recipes-qt/qt5/qtconnectivity_git.bb
index 6f1f7d3..e23f632 100644
--- a/recipes-qt/qt5/qtconnectivity_git.bb
+++ b/recipes-qt/qt5/qtconnectivity_git.bb
@@ -19,4 +19,4 @@ PACKAGECONFIG[bluez] = "-feature-bluez,-no-feature-bluez,${BLUEZ}"
 
 EXTRA_QMAKEVARS_CONFIGURE += "${PACKAGECONFIG_CONFARGS}"
 
-SRCREV = "e68b5e17b071ca11974474546be04c7d564eae3a"
+SRCREV = "43f063427a3ffc62bd85237801b28c9f9826d562"
diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/qtdeclarative_git.bb
index 33f15dd..510fd45 100644
--- a/recipes-qt/qt5/qtdeclarative_git.bb
+++ b/recipes-qt/qt5/qtdeclarative_git.bb
@@ -14,8 +14,10 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-PACKAGECONFIG ??= "qtxmlpatterns"
+PACKAGECONFIG ??= "qtxmlpatterns qml-debug qml-network"
 PACKAGECONFIG[qtxmlpatterns] = ",,qtxmlpatterns"
+PACKAGECONFIG[qml-debug] = "-qml-debug,-no-qml-debug"
+PACKAGECONFIG[qml-network] = "-qml-network, -no-qml-network"
 
 do_configure_prepend() {
     # disable qtxmlpatterns test if it isn't enabled by PACKAGECONFIG
@@ -30,6 +32,6 @@ do_install_append_class-nativesdk() {
 
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'qtxmlpatterns', 'CONFIG+=OE_QTXMLPATTERNS_ENABLED', '', d)}"
 
-SRCREV = "6069cc1cd1a6309cdffeb8bdd9c4035f33742228"
+SRCREV = "1e82f11629e5572783e5bfc36f24ad10c235ca53"
 
 BBCLASSEXTEND =+ "native nativesdk"
diff --git a/recipes-qt/qt5/qtgamepad_git.bb b/recipes-qt/qt5/qtgamepad_git.bb
index 485a6d9..3981bd1 100644
--- a/recipes-qt/qt5/qtgamepad_git.bb
+++ b/recipes-qt/qt5/qtgamepad_git.bb
@@ -14,4 +14,4 @@ PACKAGECONFIG[sdl2] = "-feature-sdl2,-no-feature-sdl2,libsdl2"
 
 EXTRA_QMAKEVARS_CONFIGURE += "${PACKAGECONFIG_CONFARGS}"
 
-SRCREV = "313f221381507eee36c8e3bd0069b3e7962da140"
+SRCREV = "e175347926b2aa8be045aed485e09b99ae72f51c"
diff --git a/recipes-qt/qt5/qtgraphicaleffects_git.bb b/recipes-qt/qt5/qtgraphicaleffects_git.bb
index 5f820a5..12f60b4 100644
--- a/recipes-qt/qt5/qtgraphicaleffects_git.bb
+++ b/recipes-qt/qt5/qtgraphicaleffects_git.bb
@@ -18,4 +18,4 @@ RDEPENDS_${PN}-dev = ""
 # http://errors.yoctoproject.org/Errors/Build/44912/
 LDFLAGS_append_x86 = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
 
-SRCREV = "df80153bf07b08e5d2ae8ba18f85a9ec15dbaef8"
+SRCREV = "80b9da7ac42468453b7d130bd0a322a1312ad0e3"
diff --git a/recipes-qt/qt5/qtimageformats_git.bb b/recipes-qt/qt5/qtimageformats_git.bb
index 05384b1..5afa44d 100644
--- a/recipes-qt/qt5/qtimageformats_git.bb
+++ b/recipes-qt/qt5/qtimageformats_git.bb
@@ -26,4 +26,4 @@ PACKAGECONFIG[libwebp] = ",CONFIG+=done_config_libwebp,libwebp"
 
 EXTRA_QMAKEVARS_PRE += "${PACKAGECONFIG_CONFARGS}"
 
-SRCREV = "b83a0a9460432abb82218da247710a1aaf321336"
+SRCREV = "92e49329edfb98c8b3f9cdcbaf116f0c601c7739"
diff --git a/recipes-qt/qt5/qtknx_git.bb b/recipes-qt/qt5/qtknx_git.bb
index 9f15a57..bbcabc1 100644
--- a/recipes-qt/qt5/qtknx_git.bb
+++ b/recipes-qt/qt5/qtknx_git.bb
@@ -9,4 +9,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "8a8a343446146f51056b6f530ce341f34199c811"
+SRCREV = "4640a41071ff153c01ef2c518675dded257f6de5"
diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/qtlocation_git.bb
index e197dfb..1a79093 100644
--- a/recipes-qt/qt5/qtlocation_git.bb
+++ b/recipes-qt/qt5/qtlocation_git.bb
@@ -4,10 +4,8 @@ require qt5-git.inc
 LICENSE = "Apache-2.0 & MIT & openssl & BSL-1.0 & GFDL-1.3 & BSD & ( GPL-3.0 & The-Qt-Company-GPL-Exception-1.0 | The-Qt-Company-Commercial ) & ( GPL-2.0+ | LGPL-3.0 | The-Qt-Company-Commercial )"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPL3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
-    file://LICENSE.LGPLv3;md5=e0459b45c5c4840b353141a8bbed91f0 \
     file://LICENSE.GPL2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
     file://LICENSE.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
-    file://LICENSE.GPLv3;md5=88e2b9117e6be406b5ed6ee4ca99a705 \
     file://LICENSE.GPL3-EXCEPT;md5=763d8c535a234d9a3fb682c7ecb6c073 \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
     file://src/3rdparty/mapbox-gl-native/LICENSE.md;md5=0ab9025299bcee16858021d557f09449 \
@@ -27,11 +25,13 @@ EXTRA_QMAKEVARS_CONFIGURE += "${PACKAGECONFIG_CONFARGS}"
 # http://errors.yoctoproject.org/Errors/Details/152640/
 LDFLAGS_append_x86 = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
 
+QT_MODULE_BRANCH_MAPBOXGL = "upstream/qt-staging-5.11.0"
+
 SRC_URI += " \
-    ${QT_GIT}/qtlocation-mapboxgl.git;name=qtlocation-mapboxgl;branch=upstream/qt-staging;protocol=${QT_GIT_PROTOCOL};destsuffix=git/src/3rdparty/mapbox-gl-native \
+    ${QT_GIT}/qtlocation-mapboxgl.git;name=qtlocation-mapboxgl;branch=${QT_MODULE_BRANCH_MAPBOXGL};protocol=${QT_GIT_PROTOCOL};destsuffix=git/src/3rdparty/mapbox-gl-native \
 "
 
-SRCREV_qtlocation = "3d2281ccf7400a782f69b7b74cb45d0889708bcc"
-SRCREV_qtlocation-mapboxgl = "8c1be4ec01ef46bf453856531ebf53b48ce3dbe7"
+SRCREV_qtlocation = "139414573ab27bd1df1b491aeb6003a6fc0d3d5d"
+SRCREV_qtlocation-mapboxgl = "74df5203628b47931b4edcb5e8fe352f40fe7df4"
 
 SRCREV_FORMAT = "qtlocation_qtlocation-mapboxgl"
diff --git a/recipes-qt/qt5/qtmultimedia_git.bb b/recipes-qt/qt5/qtmultimedia_git.bb
index 7ae9a24..0f272e5 100644
--- a/recipes-qt/qt5/qtmultimedia_git.bb
+++ b/recipes-qt/qt5/qtmultimedia_git.bb
@@ -37,4 +37,4 @@ SRC_URI += "\
 # http://errors.yoctoproject.org/Errors/Build/44914/
 LDFLAGS_append_x86 = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
 
-SRCREV = "bb7ffc4d847bb2b558693a4ca5d7f3a45c9b9231"
+SRCREV = "b39c391853245f8293d19431541eab20d78b8678"
diff --git a/recipes-qt/qt5/qtopcua_git.bb b/recipes-qt/qt5/qtopcua_git.bb
new file mode 100644
index 0000000..7abe028
--- /dev/null
+++ b/recipes-qt/qt5/qtopcua_git.bb
@@ -0,0 +1,13 @@
+require qt5.inc
+require qt5-git.inc
+
+LICENSE = "GFDL-1.3 & ( GPL-2.0+ | LGPL-3.0 ) | The-Qt-Company-Commercial"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE.FDL;md5=f70ee9a6c44ae8917586fea34dff0ab5 \
+    file://LICENSE.GPLv2;md5=05832301944453ec79e40ba3c3cfceec \
+    file://LICENSE.LGPLv3;md5=c4fe8c6de4eef597feec6e90ed62e962 \
+"
+
+DEPENDS += "qtbase"
+
+SRCREV = "78d016e79ed8bc3d2d3f1c2dac90a4c75392d35b"
diff --git a/recipes-qt/qt5/qtpurchasing_git.bb b/recipes-qt/qt5/qtpurchasing_git.bb
index df4a6e0..cb6b9eb 100644
--- a/recipes-qt/qt5/qtpurchasing_git.bb
+++ b/recipes-qt/qt5/qtpurchasing_git.bb
@@ -10,4 +10,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative"
 
-SRCREV = "02246cd68ca14345d95cbd8893fd24ff60faa73f"
+SRCREV = "607617cacc1c6ced9fa3bbfb0cd24e115b623daa"
diff --git a/recipes-qt/qt5/qtquickcontrols2_git.bb b/recipes-qt/qt5/qtquickcontrols2_git.bb
index a8fc2c2..ee5e926 100644
--- a/recipes-qt/qt5/qtquickcontrols2_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols2_git.bb
@@ -10,4 +10,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtdeclarative qtdeclarative-native"
 
-SRCREV = "c0232099a9fac03ef0f5287b6a26dbbd46669c06"
+SRCREV = "60f3106b3fe537f1f26230bf0b59525cf98d6789"
diff --git a/recipes-qt/qt5/qtquickcontrols_git.bb b/recipes-qt/qt5/qtquickcontrols_git.bb
index 372ed0c..f23e96d 100644
--- a/recipes-qt/qt5/qtquickcontrols_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols_git.bb
@@ -17,4 +17,4 @@ FILES_${PN}-qmlplugins += " \
   ${OE_QMAKE_PATH_QML}/QtQuick/Dialogs/qml/icons.ttf \
 "
 
-SRCREV = "0689a8256c0a21087c01fff3998fd3b606a5ac4c"
+SRCREV = "88ff352d5145b5761179ee42164a0bfcd4f1d54a"
diff --git a/recipes-qt/qt5/qtremoteobjects_git.bb b/recipes-qt/qt5/qtremoteobjects_git.bb
index 1efac5c..ff61321 100644
--- a/recipes-qt/qt5/qtremoteobjects_git.bb
+++ b/recipes-qt/qt5/qtremoteobjects_git.bb
@@ -24,6 +24,6 @@ PACKAGECONFIG[tools-only] = "CONFIG+=tools-only"
 
 EXTRA_QMAKEVARS_PRE += "${PACKAGECONFIG_CONFARGS}"
 
-SRCREV = "556539365ab1eeaab339fc527c4c2130c2f804ff"
+SRCREV = "24fade01e0e38acbf5ffdb9ffab712e8b7e86e30"
 
 BBCLASSEXTEND += "native nativesdk"
diff --git a/recipes-qt/qt5/qtscript_git.bb b/recipes-qt/qt5/qtscript_git.bb
index 9982877..fe4612d 100644
--- a/recipes-qt/qt5/qtscript_git.bb
+++ b/recipes-qt/qt5/qtscript_git.bb
@@ -30,4 +30,4 @@ DEPENDS += "qtbase"
 # http://errors.yoctoproject.org/Errors/Build/44915/
 LDFLAGS_append_x86 = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
 
-SRCREV = "c2657d346455a5a7821fbfbe3b1107d7cf9b0949"
+SRCREV = "693f0320e92cb1ab93f6261c72702432abdcb11d"
diff --git a/recipes-qt/qt5/qtscxml_git.bb b/recipes-qt/qt5/qtscxml_git.bb
index 1a81beb..dae2cde 100644
--- a/recipes-qt/qt5/qtscxml_git.bb
+++ b/recipes-qt/qt5/qtscxml_git.bb
@@ -10,7 +10,7 @@ require qt5-git.inc
 
 DEPENDS += "qtbase qtdeclarative qtxmlpatterns qtscxml-native"
 
-SRCREV = "67d48807b44735a2385b88db7ada01f7cd7eacfd"
+SRCREV = "71a101b5cbdbe9e32053ce61a5b6417a6990d780"
 
 # Patches from https://github.com/meta-qt5/qtscxml/commits/b5.11
 # 5.11.meta-qt5.2
diff --git a/recipes-qt/qt5/qtsensors_git.bb b/recipes-qt/qt5/qtsensors_git.bb
index 5c6a83d..a9885f7 100644
--- a/recipes-qt/qt5/qtsensors_git.bb
+++ b/recipes-qt/qt5/qtsensors_git.bb
@@ -12,4 +12,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative"
 
-SRCREV = "29f2041f4da53815491affbf19ec008820c76e29"
+SRCREV = "b4e80891f3d51b3d6a7ead74c8650b84e0f070ea"
diff --git a/recipes-qt/qt5/qtserialbus_git.bb b/recipes-qt/qt5/qtserialbus_git.bb
index 5c196ec..effe91b 100644
--- a/recipes-qt/qt5/qtserialbus_git.bb
+++ b/recipes-qt/qt5/qtserialbus_git.bb
@@ -11,4 +11,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtserialport"
 
-SRCREV = "fb561e9aa52d24b0156dc2c3987216954ad52107"
+SRCREV = "c66a364cf34b4945208f07362deabe0020e5b596"
diff --git a/recipes-qt/qt5/qtserialport_git.bb b/recipes-qt/qt5/qtserialport_git.bb
index 9bac24e..79d9394 100644
--- a/recipes-qt/qt5/qtserialport_git.bb
+++ b/recipes-qt/qt5/qtserialport_git.bb
@@ -5,14 +5,13 @@ require qt5-git.inc
 # other qt* components use :/
 LICENSE = "GFDL-1.3 & BSD & ( GPL-3.0 & The-Qt-Company-GPL-Exception-1.0 | The-Qt-Company-Commercial ) & ( GPL-2.0+ | LGPL-3.0 | The-Qt-Company-Commercial )"
 LIC_FILES_CHKSUM = " \
-    file://LICENSE.LGPL3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
+    file://LICENSE.FDL;md5=3801d7932fdc07fd9efe89f9854a6caa \
     file://LICENSE.GPL2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
     file://LICENSE.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
     file://LICENSE.GPL3-EXCEPT;md5=763d8c535a234d9a3fb682c7ecb6c073 \
-    file://LGPL_EXCEPTION.txt;md5=bb426f3367c4805d1e12fad05bd0b750 \
-    file://LICENSE.FDL;md5=3801d7932fdc07fd9efe89f9854a6caa \
+    file://LICENSE.LGPL3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
 "
 
 DEPENDS += "qtbase"
 
-SRCREV = "b5f0519e8e6f8f125f711d61832072649d841dfe"
+SRCREV = "a9ada995489b899cb938602308ffa1a8814acd2a"
diff --git a/recipes-qt/qt5/qtsvg_git.bb b/recipes-qt/qt5/qtsvg_git.bb
index c15a9e3..dae0e7d 100644
--- a/recipes-qt/qt5/qtsvg_git.bb
+++ b/recipes-qt/qt5/qtsvg_git.bb
@@ -13,4 +13,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "1fd6226d52b8d3d201b117902ff1ecd84cc1a1e5"
+SRCREV = "b1ca1bb725fd8768782d8105b782932f95b70908"
diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/qttools_git.bb
index 7fbf4ee..447164c 100644
--- a/recipes-qt/qt5/qttools_git.bb
+++ b/recipes-qt/qt5/qttools_git.bb
@@ -29,7 +29,7 @@ PACKAGECONFIG[qtwebkit] = ",,qtwebkit"
 
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'qtwebkit', '', 'CONFIG+=noqtwebkit', d)}"
 
-SRCREV = "38b62511970b048b4a0edc5c8bcdea8c37fa76c7"
+SRCREV = "a42d3f2ac4b910ecc910ff144191cb729a745c9a"
 
 BBCLASSEXTEND = "native nativesdk"
 
diff --git a/recipes-qt/qt5/qtvirtualkeyboard_git.bb b/recipes-qt/qt5/qtvirtualkeyboard_git.bb
index fbacf93..4154b2a 100644
--- a/recipes-qt/qt5/qtvirtualkeyboard_git.bb
+++ b/recipes-qt/qt5/qtvirtualkeyboard_git.bb
@@ -49,4 +49,4 @@ FILES_${PN} += "${OE_QMAKE_PATH_DATA}/qtvirtualkeyboard/lipi_toolkit"
 
 DEPENDS += "qtbase qtdeclarative qtmultimedia qtquickcontrols qtsvg qtxmlpatterns qtdeclarative-native"
 
-SRCREV = "14f4ea59491e40e7f95df9d7307433ef2c249ab5"
+SRCREV = "b92f0da2f8725ab529ec81c4e1b4b538e66258d2"
diff --git a/recipes-qt/qt5/qtwayland/0001-fix-build-without-xkbcommon-evdev.patch b/recipes-qt/qt5/qtwayland/0001-fix-build-without-xkbcommon-evdev.patch
deleted file mode 100644
index 2842807..0000000
--- a/recipes-qt/qt5/qtwayland/0001-fix-build-without-xkbcommon-evdev.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From ca13ad2d1a5c119fb3f45c805d2f3caaede95a7d Mon Sep 17 00:00:00 2001
-From: Raphael Freudiger <laser_b@gmx.ch>
-Date: Tue, 10 Jan 2017 15:49:55 +0100
-Subject: [PATCH] fix build without xkbcommon-evdev
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Change-Id: I4f52c4ad741fdd7063a18b67f5777b52f03726fe
-Signed-off-by: Raphael Freudiger <laser_b@gmx.ch>
-Signed-off-by: Gordan Markuš <gordan.markus@pelagicore.com>
----
- src/client/client.pro                              |  2 ++
- src/compositor/compositor.pro                      |  2 ++
- src/compositor/compositor_api/qwaylandkeyboard.cpp | 13 +++++++------
- 3 files changed, 11 insertions(+), 6 deletions(-)
-
-diff --git a/src/client/client.pro b/src/client/client.pro
-index eae7ad5..0bb7b18 100644
---- a/src/client/client.pro
-+++ b/src/client/client.pro
-@@ -147,3 +147,5 @@ MODULE_PLUGIN_TYPES = \
-             wayland-decoration-client \
-             wayland-shell-integration
- load(qt_module)
-+
-+LIBS += -lxkbcommon
-diff --git a/src/compositor/compositor.pro b/src/compositor/compositor.pro
-index 47be591..805c81e 100644
---- a/src/compositor/compositor.pro
-+++ b/src/compositor/compositor.pro
-@@ -34,3 +34,5 @@ MODULE_PLUGIN_TYPES = \
-     wayland-hardware-layer-integration \
- 
- load(qt_module)
-+
-+LIBS += -lxkbcommon
-diff --git a/src/compositor/compositor_api/qwaylandkeyboard.cpp b/src/compositor/compositor_api/qwaylandkeyboard.cpp
-index 7ab8bff..8c36774 100644
---- a/src/compositor/compositor_api/qwaylandkeyboard.cpp
-+++ b/src/compositor/compositor_api/qwaylandkeyboard.cpp
-@@ -334,12 +334,6 @@ void QWaylandKeyboardPrivate::createXKBState(xkb_keymap *keymap)
-     xkb_state = xkb_state_new(keymap);
- }
- 
--uint QWaylandKeyboardPrivate::toWaylandXkbV1Key(const uint nativeScanCode)
--{
--    const uint offset = 8;
--    Q_ASSERT(nativeScanCode >= offset);
--    return nativeScanCode - offset;
--}
- 
- void QWaylandKeyboardPrivate::createXKBKeymap()
- {
-@@ -369,6 +363,13 @@ void QWaylandKeyboardPrivate::createXKBKeymap()
- }
- #endif
- 
-+uint QWaylandKeyboardPrivate::toWaylandXkbV1Key(const uint nativeScanCode)
-+{
-+    const uint offset = 8;
-+    Q_ASSERT(nativeScanCode >= offset);
-+    return nativeScanCode - offset;
-+}
-+
- void QWaylandKeyboardPrivate::sendRepeatInfo()
- {
-     Q_FOREACH (Resource *resource, resourceMap()) {
diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
index 762e612..d6cb114 100644
--- a/recipes-qt/qt5/qtwayland_git.bb
+++ b/recipes-qt/qt5/qtwayland_git.bb
@@ -37,14 +37,7 @@ PACKAGECONFIG[libhybris-egl-server] = "-feature-libhybris-egl-server,-no-feature
 
 EXTRA_QMAKEVARS_CONFIGURE += "${PACKAGECONFIG_CONFARGS}"
 
-SRCREV = "434f3e9a952b5858abc1f0ed1179ea5d2fca6a19"
-
-# Patches from https://github.com/meta-qt5/qtwayland/commits/b5.11
-# 5.11.meta-qt5.2
-# From https://bugreports.qt.io/browse/QTBUG-57767
-#SRC_URI += " \
-#    file://0001-fix-build-without-xkbcommon-evdev.patch \
-#"
+SRCREV = "87621266ec66df5fc98cce165e5c80b7721983aa"
 
 BBCLASSEXTEND =+ "native nativesdk"
 
diff --git a/recipes-qt/qt5/qtwebchannel_git.bb b/recipes-qt/qt5/qtwebchannel_git.bb
index 0bcbf56..efad58c 100644
--- a/recipes-qt/qt5/qtwebchannel_git.bb
+++ b/recipes-qt/qt5/qtwebchannel_git.bb
@@ -12,4 +12,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtdeclarative qtwebsockets"
 
-SRCREV = "01241eb3704af785e8d98fb2f6e223ca62a64175"
+SRCREV = "9800f7d13e770e6409113e83f663ac4a419908a0"
diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index 80928a4..1b8f933 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -158,8 +158,8 @@ SRC_URI_append_libc-musl = "\
     file://0014-chromium-musl-tcmalloc-Use-off64_t-insread-of-__off6.patch;patchdir=src/3rdparty \
 "
 
-SRCREV_qtwebengine = "b7e5722cce95730004ef6cb9f4aabde5bbd5685d"
-SRCREV_chromium = "e173cb17d97aa3c2065189275c85db79eb7d1748"
+SRCREV_qtwebengine = "28e0320235d33f00c6c141a549dc0553ee0043a5"
+SRCREV_chromium = "1785e2c1eb5a3b9a9a97ef3125c8f444d9b62afb"
 SRCREV = "${SRCREV_qtwebengine}"
 
 SRCREV_FORMAT = "qtwebengine_chromium"
diff --git a/recipes-qt/qt5/qtwebglplugin_git.bb b/recipes-qt/qt5/qtwebglplugin_git.bb
new file mode 100644
index 0000000..62601bb
--- /dev/null
+++ b/recipes-qt/qt5/qtwebglplugin_git.bb
@@ -0,0 +1,21 @@
+require qt5.inc
+require qt5-git.inc
+
+LICENSE = "GPL-3.0 | The-Qt-Company-Commercial"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
+"
+
+DEPENDS += "qtbase qtwebsockets"
+
+PACKAGECONFIG ?= "qtdeclarative"
+PACKAGECONFIG[qtdeclarative] = ",,qtdeclarative"
+
+do_configure_prepend() {
+    # disable qtdeclarative test if it isn't enabled by PACKAGECONFIG
+    sed -e 's/^\(qtHaveModule(quick)\)/OE_QTDECLARATIVE_ENABLED:\1/' -i ${S}/src/plugins/platforms/webgl/webgl.pro
+}
+
+EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'qtdeclarative', 'CONFIG+=OE_QTDECLARATIVE_ENABLED', '', d)}"
+
+SRCREV = "62a5226c6147ee45f488a2e2c65870c1f836a5be"
diff --git a/recipes-qt/qt5/qtwebsockets_git.bb b/recipes-qt/qt5/qtwebsockets_git.bb
index cd55bdd..a95b162 100644
--- a/recipes-qt/qt5/qtwebsockets_git.bb
+++ b/recipes-qt/qt5/qtwebsockets_git.bb
@@ -11,4 +11,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative"
 
-SRCREV = "34ce4b65ba35a487bdb8afa5e59b57cfa3f9b0e0"
+SRCREV = "91bb60bba33a8c7df49835bfacfe9a8dc7381a1e"
diff --git a/recipes-qt/qt5/qtwebview_git.bb b/recipes-qt/qt5/qtwebview_git.bb
index f8c2425..61b7409 100644
--- a/recipes-qt/qt5/qtwebview_git.bb
+++ b/recipes-qt/qt5/qtwebview_git.bb
@@ -19,4 +19,4 @@ COMPATIBLE_MACHINE_armv7a = "(.*)"
 COMPATIBLE_MACHINE_armv7ve = "(.*)"
 COMPATIBLE_MACHINE_aarch64 = "(.*)"
 
-SRCREV = "bb7dda99936b97cc262f07b25fcb500f8a552c8a"
+SRCREV = "87c9572897daf98f3c4177f6d6acd00bafcc70fd"
diff --git a/recipes-qt/qt5/qtx11extras_git.bb b/recipes-qt/qt5/qtx11extras_git.bb
index b3ce945..d56d185 100644
--- a/recipes-qt/qt5/qtx11extras_git.bb
+++ b/recipes-qt/qt5/qtx11extras_git.bb
@@ -13,4 +13,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "d80236f50559f4fe785fba598a03aaa7f05d37ac"
+SRCREV = "e239c7919f31798ef567498104bfeeae108b872d"
diff --git a/recipes-qt/qt5/qtxmlpatterns_git.bb b/recipes-qt/qt5/qtxmlpatterns_git.bb
index 399adc3..72478df 100644
--- a/recipes-qt/qt5/qtxmlpatterns_git.bb
+++ b/recipes-qt/qt5/qtxmlpatterns_git.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "e4abf2c6e3de158d3a6eb3c46b5158f741136c9d"
+SRCREV = "17c45f3235f0bcb224379b0d1059c7669eb91487"
 
 BBCLASSEXTEND =+ "native nativesdk"
 
-- 
2.17.0


