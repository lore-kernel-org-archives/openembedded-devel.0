Return-Path: <mikko.gronoff@qt.io>
X-Greylist: delayed 40574 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 05 Jan 2017 21:21:34 UTC
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
	(mail-ve1eur01on0099.outbound.protection.outlook.com [104.47.1.99])
	by mail.openembedded.org (Postfix) with ESMTP id 78DF471B27
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Jan 2017 21:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=qtcompany.onmicrosoft.com; s=selector1-qt-io;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=JB763CIxVmYa9EzB1o7Y2nvUBk/MGjHMoQ5OfOt4+5M=;
	b=QD3SMWEpZbqunXoyrri/2IMq4DC0j1tRUXLA4gZGhLp78fqP1Kv2eep6y7YNEuWMFlLFGn0fuSMDq2aorHxc/57OzGUGfC/Q5Z+BIfQfz+a9GQMkMwDTCplOSqcsjq3HsXqq2NIHy+GfKpOIu8c1nC1xoczr5yYmxY5QYLoQvFg=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mikko.gronoff@qt.io; 
Received: from qt.intra.qt (192.89.120.53) by
	VI1PR0201MB2174.eurprd02.prod.outlook.com (10.169.131.145) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.817.10;
	Thu, 5 Jan 2017 09:49:46 +0000
From: Mikko Gronoff <mikko.gronoff@qt.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Jan 2017 11:45:57 +0200
Message-Id: <1483609557-7538-1-git-send-email-mikko.gronoff@qt.io>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [192.89.120.53]
X-ClientProxiedBy: VI1PR07CA0125.eurprd07.prod.outlook.com (10.165.229.179) To
	VI1PR0201MB2174.eurprd02.prod.outlook.com (10.169.131.145)
X-MS-Office365-Filtering-Correlation-Id: 9f56f1c3-4081-467d-7990-08d435502ec9
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(22001);
	SRVR:VI1PR0201MB2174; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0201MB2174;
	3:mbdcLTjclL+b63wlUJdI3ml9WkQ9Ux972hr3lwETuNz6sA64WnqKhgnyUATAUzmGMxbh2cjoBNwCvjMPou4LSN99Rb4iMvJCi517V0PEjBzS20ti8J98bKcwkI4DnrUZTU1m469nKH4/NMl5kNG9vHGexFW1Uc0agffSihm1SezAmVvu5u6/GfYdqdCzFNqEiyor062e4MLVbDInNX+nD2t1TucASIUFX/8oq6vb8uI2yJxuRHN50Het47LZCgFvxBw8qUIfmiAxf78DBwOD8g==
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0201MB2174;
	25:peGopRiqoqT6kC5JoQbyVCI6+CYguWz/AqOLhWX2pKJgQaiPK/3HIrf9F//V1qcZ8/Suu3/VCUxUubkBx+LEi2APUM2/SvLfymSF6V5nG9MEHnGysQKDwLfcGx4+P1a2Cfd0k3fBhk8M3jmuk3Nemm0QM6i3Htrpe91mnwAantAoM/301sfR9U3eDD/LP3NNuil1tSbZwTaEadxGjS4DgojOOh+Yea5ug16HMSw4LFWtZHPkLl0BAmNMqerVgbvg99sZGLaM7d5T5QRDDxc+SNQHILa8XPNjiLKN+yUTfUqaBzQWHbpk1JRbHOh++78UtVvzSBuCQTZAPgObK2dPvjLcY+MVExwYBFa4Er+28EplgPWPbu6zG6lPe6iKPJF0ybrYV494H77E6mdIX19UWkULGudc0NPxqkTs+3duALGTYDaZXfvcMMbgbISDOlWH1bj+7Fd0lNdLT2mR0ID7t3+Q1hxrEfegB4LIWVLg7cGNs1U7Z2UnRvxOnrYgOx5jtI/Biutbbxobh5zEBLLWMPwv0Bhh1llf9mpigGUdbKpzTGeiOAhq9FFbKJ7yGIdNbC5S+M6Ehv3AEt9IrX7UmoLZCXE0L4doHMFK1HyUcx3LDZrqNK+5g89+fx03MMVoz8tvFL/tz5y3ZqAKXtVsP9Xxhz7jILoko36K0dBOggqnUc8TugC8amCXiElddUIn7tZNJd+aPnDWhUhSB63Ka1wpMqyKft2rwZpGBhP1ieTi/qyTzGMw0ThOW9UOGCMI9zDweLWyRkAWQpt7W8Pv/Q==
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0201MB2174;
	31:cO8Xm21v9Tyq2vPPQJS8ydf2+hW7VCQ3V/6mbS8rbInvvU55ZefcF8P96ZKn3N2nSKQFk8Z2WjKw9wZs6AM5s+NhLjs1bJgUjs0Gnr0XIEV8ICa1MZtvZVdoqJkeTINACkE0vfV9lNLIe18j6IKXzawqAeO2/CPymf67OOvtB/V0wm4GzeC1Ng/ESMp5bH1IPoog0oqasCPxWTREjPbmiZi5mhLHyP8tsypBYAlmber1PtSjfOyijseO4a0EN+Vo;
	20:f3J/3uIKp5OPJGFlXDHyPr/MIehWiX9KIMV4SwNzJ9VtnFhumaY4m4xtAqdlKdzlPyeqnNpSRScPyFdaO5dSKzfBlvoUx0Mj230gnW0M5YXK+YcO2xEHo5FPDvgBQWAimWsFlrPTa52Wba7z/OKVnujhAcnuORJGaBRj8Dp87skqo87TxE7eedSBZpQLNj+5s3/b8Ec1MzM6FDPDeBpBxf7+n8pLQoAnRjIaMEkiIPTOzC3b+9yUN7vg9RcRF2lG
X-Microsoft-Antispam-PRVS: <VI1PR0201MB21743C9A1A6EDED66272D511E9600@VI1PR0201MB2174.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040375)(601004)(2401047)(5005006)(8121501046)(10201501046)(3002001)(6041248)(20161123555025)(20161123560025)(20161123564025)(20161123562025)(6072148);
	SRVR:VI1PR0201MB2174; BCL:0; PCL:0; RULEID:;
	SRVR:VI1PR0201MB2174; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0201MB2174;
	4:D2TJgXKRZzJ99QqKmarQUCAvqaqroSJMPP/M4gmySj/mpjYDpaJ12aVdbEYS/wQ8uFwyMjcN+vNnQ3n3dPocEoJg0b9u5FirKnJTAO79z4OmqnKOwb8feGR5wfek35zD7oLfLs2DxdFJAODfOZRC5pNHId2pMYFH/E2CiIgiOx7+frYRvXm/fLgzTKFd3ZA8/XHDP4776w/NYEzL3uLiPiiHAhg7KkYtu1WkRYtEzhOC9FIfgoh/8tZz8F1JArmLEjwmOhoJhXN0Vqf0ymHdkeTU3nh/pLITSgdlhLuphzMpZ/Tn2msbCYQSuC06nzf8mVaQykw+btqjgHQLitrlSRVvRco/47hOLDhbnWuE0GUUCiTuZ0y+tu4caWu3ovCItNQsrQ8cbWl59uTPOyRXXq3PY3I/oqJFLyAle8bTgCrw6zNuqiYVgdbim+Kcy9C5zRBuQpbqb+gFLDRh7//e65+JEz3TahauG5OuGs+GWpOt4CNAehSiVgj2oLjoNISYRKISX6NtNw86kojuvuIiiiu50lYR834qe144h5uJb1u79vmJqzmGIeUF2VaSBKyJQ1Wz1ziFjN/dkLTeSlBjPg==
X-Forefront-PRVS: 0178184651
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6009001)(7916002)(39450400003)(199003)(189002)(450100001)(8676002)(6486002)(305945005)(4326007)(110136003)(7736002)(38730400001)(101416001)(15650500001)(36756003)(50466002)(25786008)(105586002)(106356001)(81156014)(69596002)(6506006)(6512006)(189998001)(50986999)(81166006)(48376002)(74482002)(92566002)(97736004)(6666003)(5660300001)(50226002)(47776003)(2361001)(2351001)(68736007)(33646002)(42186005)(2906002)(66066001)(6116002)(5003940100001)(6916009)(53416004)(86362001)(575784001)(3846002)(19627235001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0201MB2174; H:qt.intra.qt;
	FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: qt.io does not designate permitted
	sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; VI1PR0201MB2174;
	23:wWGoMHlLutb1AxUPTKQjWB02TZDlxm8M+fg0p0j?=
	=?us-ascii?Q?9E2H4odEqdXUuQrHZzISJgzQK3Lb9AhX3aOc4lPNXfRyLuu0JB4Zcc83I5nv?=
	=?us-ascii?Q?ky9+ETI/WaCeOWXlYQ6Ku19Tv2Lp0my3ruV7lRLqAo0AYeijhhrTgI/Arj7q?=
	=?us-ascii?Q?6SfOl43VHrO1FgPzH4Y0CHb4ZoDfuuynBdxrdQaU1EVdDhgTUo35S6skKRzc?=
	=?us-ascii?Q?MXFaDPjlcC6N7wtkp/n8n82ZNJP/F0oCbZEDOzzHAdLh3V9+xhzaCyg8P99o?=
	=?us-ascii?Q?F39ot70XXWb1n6WIO5Ni6SC+jfhfBPBKYFnb06iRbML9KG3cRGh7/KuRc45E?=
	=?us-ascii?Q?SGLkuabuKQgdZAS9Fb63E80LHtrMX7Ce+xagqDMsc4B2Oszj/LmC3FETaBnJ?=
	=?us-ascii?Q?vyKUKp9WuClAjUBGnNG2niQnfbOaLb7Q6PeVDAlOWuWogP5mMF4SwoiRTnz7?=
	=?us-ascii?Q?s01Xt2g4KmIti1V3rjn7E1NOEZ2EkEeIEgT48XL+mnhP1kG2SdUbbAj5M5hg?=
	=?us-ascii?Q?sbXTXZuKsYjvT9LTHvqRk+mgmXyVnY7oQsRVGtR8dE0fqGLqTemt441vTfuq?=
	=?us-ascii?Q?B6wWMouWrSzboJ5PJvMpMDuI3gjK2AjJiohSFtd1uohp8PiTSPGXsIQ3bnHY?=
	=?us-ascii?Q?F+JchhiQTlQ304X6dHAUGAaUFGgTDsXIbAEjlN4lJOw9m8mszzrb+HOM4si9?=
	=?us-ascii?Q?5zVj/PpGzV1HLVey4cZbp16WEZkwnoI2Va+MemCNzDh9jEf4RJFjClUBNZAP?=
	=?us-ascii?Q?1qygSb0N4u+kpY5Hx7+LTkv05AvoInesx2OwJiZ0yYWds8IaFtpMx6kr3dmn?=
	=?us-ascii?Q?SqbYZ6Q8p7cAnCOALq70xZyV//d+l+MOsPbjEcvTJH/Z6/9gzgEr2JGHztNA?=
	=?us-ascii?Q?XseVpq9vHyZE7gjn/NvTIk8HgqwlehZzScACokjmiQhz74W6EhzJeaIK6+Ej?=
	=?us-ascii?Q?Qu/dZWmo8kHCoShcA8bhVpJWNjyBnWoF+N0IvNZl3RVcgK/eDwtifj4SzIXZ?=
	=?us-ascii?Q?JI3udaBld1lXquljZ3E1E1CGMwUahmv8XG+vT9b2Nsa3r6gVAnl0bvtkbJl4?=
	=?us-ascii?Q?z0feqqpb15y69MyTXJLPmM28joXAFUok7BNyShp3hamOdej6nLAzb0IBAK+c?=
	=?us-ascii?Q?rUOIQ0jG2AwBwoqad0RntMsFiOYXJimyS5Vv23+ZSFkJ5C9+E+8HNhT1Kdxy?=
	=?us-ascii?Q?L3cJbHwEUPvwbox2aPALnKTnbisD+82oV8C4cPgaHYCORxBFr/bPNdUW85g?=
	=?us-ascii?Q?=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0201MB2174;
	6:LOHXeCE+6i4Ff+z+gJWpwOECRT34N/asqnTWpCTcrIMiQwpvUvTBDqVYGe2Qh1f807FEEKvJTHrpfrEvvxKutiO4/vX6YOLXHHKU+BXXC0+rBVygkdgjtIOQOGwn2YIw9zeimXPEhhUIgWRKE1AUJqXaWuE+8LmIwjG5vmkD0me5B9xKo/SiCyDZB/viH2qgd4Ba68meWV1m5ZX3267GGTQCRX0nFEZzRAyu+HGkolgWXqvU2OahsbJmZ95j67Xdyp1IGtGKWOoQVwAzVexvNry+FeEjvDLrp78gm4qbzv0oE3Pmv/EZny8Bve2xKdIog2e2g02+M8cUeoMq3E7ugx4s0upKq8RzpHoF3/DXiOZJXzluuV0Rz3uPpDLJ4q+DhfjZUvq/CJazIiP+G4DlYmXvP7Kn88qO4jcPw6Ec3VU=;
	5:ngEWDpe6tG/gjLHFP2pw6Eq9AxTLgPSUjXEbhX7fODWepaDi8sXyjdIYrwstn2HhyyEepSuRjYvF4VlWbOCEJr1lwBspChfchB1Fuj5vg1OeanxECEo03RE9nBrm1e6N1gKjbJyJJEj3B/Kk5J8Vog==;
	24:n8aNGWLdM/5S9RXK/U3zGuxw4/7GK00a/n5CbMLE6+zCyy4O0ZMkMTpjfFyG5vGy7D9vzpJZFlX7a40sM2pXPW754jS0r0DI1UGA01asosc=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0201MB2174;
	7:nGr49BoeN3xydH1ZHSDfvAr0mbK3D6ehWroW76MYnT1eATQi2gIRd1XuCExA0JAM9JOYrV4e1/+pcfE54vlxNSPTkCFBLndCSVKZi6xE2GxdgHVT1kuj2zOhJKBwVAFkdTEjSPAdFCYs9hFa9KQfA2DHPckugkTInf++G6D2GTlkaV2TChYuY9zhOomTe3D3Wp20/iuAeiQHu+uxLst+Pfscgtaw9fHvQuNQrDmkU+/Se5tjKwbSqDCw1jkHH0ZdsdKaNKK2aUgsUpIjdLgb5DvZzcceS5U0QnqLgF1OVHnjmAmcYYh1b6PFSTLUjPvkRx6t3QttQHLiMTGDvfsBTE1d88KarkrIRNR9q+PzWlh1DQcYDIUeab6CpVrFD4vwDjRAF63R/eMwUKCM7H+q+PQU/fLpZHMEsT92vkDl17aVdhadyVU36AGRVXpRt+vkUoL1F8xSWe+y2B3Sj9oKjQ==
X-OriginatorOrg: qt.io
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2017 09:49:46.0870 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0201MB2174
Subject: [meta-qt5][morty][PATCH] qtwayland: update patch to apply with Qt 5.7.1
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
X-List-Received-Date: Thu, 05 Jan 2017 21:21:43 -0000
Content-Type: text/plain

Update 0001-Fix-building-of-QWaylandIntegration-if-some-Qt5-feat.patch
to apply on Qt 5.7.1 sources.

Change-Id: Iaeba8a919cc354eead1c68bd5e96e8e59f0c1c77
Signed-off-by: Mikko Gronoff <mikko.gronoff@qt.io>
---
 ...g-of-QWaylandIntegration-if-some-Qt5-feat.patch | 75 ++++++----------------
 1 file changed, 19 insertions(+), 56 deletions(-)

diff --git a/recipes-qt/qt5/qtwayland/0001-Fix-building-of-QWaylandIntegration-if-some-Qt5-feat.patch b/recipes-qt/qt5/qtwayland/0001-Fix-building-of-QWaylandIntegration-if-some-Qt5-feat.patch
index d173e67..9f276dc 100644
--- a/recipes-qt/qt5/qtwayland/0001-Fix-building-of-QWaylandIntegration-if-some-Qt5-feat.patch
+++ b/recipes-qt/qt5/qtwayland/0001-Fix-building-of-QWaylandIntegration-if-some-Qt5-feat.patch
@@ -1,4 +1,4 @@
-From de85e1c1ee76be845a21b441d9e4ea12a30d84c7 Mon Sep 17 00:00:00 2001
+From 9d31fbbe3a22985e200e49f164e2971dfa6d963c Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Vesa=20J=C3=A4=C3=A4skel=C3=A4inen?= <dachaac@gmail.com>
 Date: Sun, 18 Sep 2016 11:51:59 +0300
 Subject: [PATCH] Fix building of QWaylandIntegration if some Qt5 features are
@@ -9,15 +9,15 @@ QT_NO_CLIPBOARD, QT_NO_DRAGANDDROP, QT_NO_ACCESSIBILITY and
 QT_NO_SESSIONMANAGER, these has to be taken into account when compiling
 QtWayland.
 ---
- src/client/qwaylandintegration.cpp | 21 ++++++++++++++++++---
- src/client/qwaylandintegration_p.h | 12 ++++++++++++
- 2 files changed, 30 insertions(+), 3 deletions(-)
+ src/client/qwaylandintegration.cpp | 17 ++++++++++++++++-
+ src/client/qwaylandintegration_p.h | 10 ++++++++--
+ 2 files changed, 24 insertions(+), 3 deletions(-)
 
 diff --git a/src/client/qwaylandintegration.cpp b/src/client/qwaylandintegration.cpp
-index 39fff53..481e3d6 100644
+index df88a48..b9ce6fe 100644
 --- a/src/client/qwaylandintegration.cpp
 +++ b/src/client/qwaylandintegration.cpp
-@@ -39,7 +39,9 @@
+@@ -45,7 +45,9 @@
  #include "qwaylandinputcontext_p.h"
  #include "qwaylandshmbackingstore_p.h"
  #include "qwaylandnativeinterface_p.h"
@@ -27,7 +27,7 @@ index 39fff53..481e3d6 100644
  #include "qwaylanddnd_p.h"
  #include "qwaylandwindowmanagerintegration_p.h"
  #include "qwaylandscreen_p.h"
-@@ -57,7 +59,9 @@
+@@ -63,7 +65,9 @@
  #include <QSocketNotifier>
  
  #include <qpa/qplatforminputcontextfactory_p.h>
@@ -37,16 +37,7 @@ index 39fff53..481e3d6 100644
  #include <qpa/qplatforminputcontext.h>
  
  #include "qwaylandhardwareintegration_p.h"
-@@ -117,8 +121,6 @@ QWaylandIntegration::QWaylandIntegration()
-     , mNativeInterface(new QWaylandNativeInterface(this))
- #ifndef QT_NO_ACCESSIBILITY
-     , mAccessibility(new QPlatformAccessibility())
--#else
--    , mAccessibility(0)
- #endif
-     , mClientBufferIntegrationInitialized(false)
-     , mServerBufferIntegrationInitialized(false)
-@@ -126,9 +128,12 @@ QWaylandIntegration::QWaylandIntegration()
+@@ -132,9 +136,12 @@ QWaylandIntegration::QWaylandIntegration()
  {
      initializeInputDeviceIntegration();
      mDisplay = new QWaylandDisplay(this);
@@ -58,9 +49,9 @@ index 39fff53..481e3d6 100644
 -
 +#endif
      QString icStr = QPlatformInputContextFactory::requested();
-     icStr.isNull() ? mInputContext.reset(new QWaylandInputContext(mDisplay))
-                    : mInputContext.reset(QPlatformInputContextFactory::create(icStr));
-@@ -136,8 +141,12 @@ QWaylandIntegration::QWaylandIntegration()
+     if (!icStr.isNull()) {
+         mInputContext.reset(QPlatformInputContextFactory::create(icStr));
+@@ -153,8 +160,12 @@ QWaylandIntegration::QWaylandIntegration()
  
  QWaylandIntegration::~QWaylandIntegration()
  {
@@ -73,7 +64,7 @@ index 39fff53..481e3d6 100644
  #ifndef QT_NO_ACCESSIBILITY
      delete mAccessibility;
  #endif
-@@ -213,15 +222,19 @@ QPlatformFontDatabase *QWaylandIntegration::fontDatabase() const
+@@ -230,15 +241,19 @@ QPlatformFontDatabase *QWaylandIntegration::fontDatabase() const
      return mFontDb;
  }
  
@@ -93,47 +84,28 @@ index 39fff53..481e3d6 100644
  
  QPlatformInputContext *QWaylandIntegration::inputContext() const
  {
-@@ -243,10 +256,12 @@ QVariant QWaylandIntegration::styleHint(StyleHint hint) const
-     return QPlatformIntegration::styleHint(hint);
- }
- 
-+#ifndef QT_NO_ACCESSIBILITY
- QPlatformAccessibility *QWaylandIntegration::accessibility() const
- {
-     return mAccessibility;
- }
-+#endif
- 
- QPlatformServices *QWaylandIntegration::services() const
- {
 diff --git a/src/client/qwaylandintegration_p.h b/src/client/qwaylandintegration_p.h
-index 987d805..b50ad95 100644
+index 9a49902..0d27f4e 100644
 --- a/src/client/qwaylandintegration_p.h
 +++ b/src/client/qwaylandintegration_p.h
-@@ -80,15 +80,21 @@ public:
+@@ -85,11 +85,13 @@ public:
+     QPlatformFontDatabase *fontDatabase() const Q_DECL_OVERRIDE;
  
      QPlatformNativeInterface *nativeInterface() const Q_DECL_OVERRIDE;
- 
+-
 +#ifndef QT_NO_CLIPBOARD
      QPlatformClipboard *clipboard() const Q_DECL_OVERRIDE;
 +#endif
  
 +#ifndef QT_NO_DRAGANDDROP
      QPlatformDrag *drag() const Q_DECL_OVERRIDE;
+-
 +#endif
- 
      QPlatformInputContext *inputContext() const Q_DECL_OVERRIDE;
  
      QVariant styleHint(StyleHint hint) const Q_DECL_OVERRIDE;
- 
-+#ifndef QT_NO_ACCESSIBILITY
-     QPlatformAccessibility *accessibility() const Q_DECL_OVERRIDE;
-+#endif
- 
-     QPlatformServices *services() const Q_DECL_OVERRIDE;
- 
-@@ -117,12 +123,18 @@ private:
-     void initializeInputDeviceIntegration();
+@@ -126,8 +128,12 @@ private:
+     QWaylandShellIntegration *createShellIntegration(const QString& interfaceName);
  
      QPlatformFontDatabase *mFontDb;
 +#ifndef QT_NO_CLIPBOARD
@@ -145,12 +117,3 @@ index 987d805..b50ad95 100644
      QWaylandDisplay *mDisplay;
      QPlatformNativeInterface *mNativeInterface;
      QScopedPointer<QPlatformInputContext> mInputContext;
-+#ifndef QT_NO_ACCESSIBILITY
-     QPlatformAccessibility *mAccessibility;
-+#endif
-     bool mClientBufferIntegrationInitialized;
-     bool mServerBufferIntegrationInitialized;
-     bool mShellIntegrationInitialized;
--- 
-2.7.4
-
-- 
2.7.4


