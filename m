Return-Path: <samuli.piippo@qt.io>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0093.outbound.protection.outlook.com [104.47.2.93])
	by mail.openembedded.org (Postfix) with ESMTP id DA4387858D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Nov 2017 16:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=qtcompany.onmicrosoft.com; s=selector1-qt-io;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=fYw49e7jmOc4Kksn5j5JPTg0tYsFFDhir/elrMqA3R4=;
	b=f8PREokwbA247TtQvKmS3ykyWXIgpUtGPfT/ve6WFi8luiDw4Z/9qAlCzlbDkCqp0vCcHRz94+MxnKx9JrjXhOjtd4OedpCFvIQaDDSQFP7PusEaGxavWW+I1JH8OybG3ad19WRAH+4YD/4XQfKBom3DR22/nRT/30Agvvvk1rU=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=samuli.piippo@qt.io; 
Received: from piippo.intra.qt (192.89.120.53) by
	DB6PR0202MB2584.eurprd02.prod.outlook.com (2603:10a6:4:1b::18) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.218.12;
	Fri, 10 Nov 2017 07:11:07 +0000
From: Samuli Piippo <samuli.piippo@qt.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Nov 2017 09:10:53 +0200
Message-Id: <1510297853-716-1-git-send-email-samuli.piippo@qt.io>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [192.89.120.53]
X-ClientProxiedBy: HE1PR0202CA0008.eurprd02.prod.outlook.com
	(2603:10a6:3:8c::18) To DB6PR0202MB2584.eurprd02.prod.outlook.com
	(2603:10a6:4:1b::18)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fc8ddc2c-e995-40fe-cfc5-08d5280a36c0
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603199);
	SRVR:DB6PR0202MB2584; 
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0202MB2584;
	3:p1x8yOBiAVuARY6WYokzCDyLO1EteySwP3MPChFd3YA8iZkpTVb4wS3W9Ry9L17TuRTSnx7AHPlHlpk4u8g6/MygQpKF4yPeMukgK3SwBtEURVDkHjT2mOZ6BbA0Enz+x/qZ3B1G5JIttkeSBE71r0t3cgJDXAb6Pv2My0JPMRCodPOE0dm4aoWsMIzSfNPVX5lIAh6rrE+29NxjTIpaIaVTE6yC1FKQw4czTtFZbHnXnIQzDCLX7pQ0G9zCyScV;
	25:hBGL+S7w1ik0RU+2jLX5pjB5s30oVzTINn1LUq8mbbURwXJBdcK7ixICxf6EG4d5bECWw9+kjAY8vF9QIbnjjxtUYnTJsr4Gzq6zTsxLuLV/MzC8C7iHwQUyImlEWU6tDzg7SwvEXrYtfsFSkzsWgkvtPK57wnhyW6KzC1tQeS5x5CS7IFFRUUzCBcBqlF6yvx+P+wydNhN29xrH571tlQWmwn6hm2P9og0DpHkH98/AHwb7wBaNbXJnLfN0OlAlAp71Fg9HYwbEt1pI+yajN6nT3ZN77x9qbnbs3fk9G358N41doZ1iQyfJ08DdwyhsU/6nu/AAJ2b/sX4eqhZ4Rw==;
	31:GZ//LYVK4WcKXpCmpCwts4E4fuwfktc9c+JZKRQv1EXPHJ7sO96RIFWyXLOId9A6/WCPZVyAlNmSGbSCwytaEF42+rBmAr0h6t4sgFnw9U6oeNI34/YJFPJeRTwIT82r6NoJq8Cpnz+8E2HnHh6zOpjag7nv79fCUn2GDmNXjOL+kXW0UlRQ7640+4WWTxfS6ooVxNx2fj+0njaVeamFj5LjsVEd5NQ5No7SWNT88tU=
X-MS-TrafficTypeDiagnostic: DB6PR0202MB2584:
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0202MB2584;
	20:5V7it3rc4EDwZDnYl23HEyTNmnmpRHIMZD5cStVx6bxaxHIzA7rDAAl3uGyzHnyc7xNlhvxSTXX804Kf8A9ypxWIqQp3+EIK2s8CllY1hq4QR7if5AFe/njpdGwy9XxONSdQ8U+8fs58rjTBMfImGiA3cCcNNpxekIN3esAC59cHsCZvTvSNPyA71tEgfCTHBAMEwY8K5RWb7InXTIx+vPp0mG53/ocxoDpxZ1AJMuo1V8ZiMbODxPpD31qVxpDywoMRIxcBuMCGcsGtJqwl2QcSyqjL6qPaISpbtQE8rVfA59uF/TT5ADFVyE8OixbNY0plYCkdvuO8DD8e63OXufRy7NlFCri8efmFA0huIJwDomiB6Brz3zXHsYRoWJXdc6DpLMKrM34P2OBZA0DbbqfwaO14lYiS4rw50CAsoc6Oi8kR7WrdBsUM2Mrzmu1+/KezyWgqx1+jc39qoqpr/IIqpsyvHBwUWHmfDOxWMXoa6Y5BBAFrTJOL7KSJFAIW;
	4:SXFx3OPf4jLo/zWQlWyI9F8v/tkbjlZCgiXaJnwKq7g/0ItT2ZjALIavsHyoc69+6BNZjH3PTj1oin52I/yzw/9DZdKpC0XsBtOL7yWeNguVRBPhP1eUEMDrMSnH6i1+Lneg1sNrH9S1YSG5RjEeMdY7BWxQ1EPS/svtTtkV4d/yHXJlwizFcS0Wz8VdZDavjwycGRhamOHmQY6c4yby7A2tSHMScd4H3nDQj2ZoP9lbQwcNBqQLVSWl9vv1oB9kuzoFdUyIXDzHQGKzsEPJTw==
X-Exchange-Antispam-Report-Test: UriScan:;
X-Microsoft-Antispam-PRVS: <DB6PR0202MB25846F0C0AB6754369DB1C28E9540@DB6PR0202MB2584.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(10201501046)(3231021)(100000703101)(100105400095)(93006095)(93001095)(3002001)(6041248)(20161123555025)(20161123560025)(20161123562025)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:DB6PR0202MB2584; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:DB6PR0202MB2584; 
X-Forefront-PRVS: 0487C0DB7E
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(376002)(39830400002)(346002)(189002)(199003)(66066001)(6916009)(316002)(53936002)(68736007)(5660300001)(6666003)(16586007)(16526018)(50466002)(5003940100001)(97736004)(3846002)(47776003)(53416004)(2906002)(6116002)(74482002)(48376002)(305945005)(6486002)(7736002)(106356001)(69596002)(50986999)(189998001)(2351001)(2361001)(36756003)(6506006)(33646002)(105586002)(50226002)(6512007)(101416001)(25786009)(478600001)(8936002)(81156014)(8676002)(86362001)(81166006);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB6PR0202MB2584;
	H:piippo.intra.qt; FPR:; SPF:None; PTR:InfoNoRecords; MX:1; A:1;
	LANG:en; 
Received-SPF: None (protection.outlook.com: qt.io does not designate permitted
	sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DB6PR0202MB2584;
	23:vMvJz29Ic4dUcEuX+8GnFbmbfOUb0OLKopB1rpU?=
	=?us-ascii?Q?x4AcmeujJZkROMHMXbe2C/wnmzNi1KWoc3Y22WzSn70ADry05jbzFfYPmQU0?=
	=?us-ascii?Q?Ri5+w0FecXXgwh8RncpgoILdbaN35nxqR4NslcQ0aIzvLOXj+3voizCxTu2U?=
	=?us-ascii?Q?kUYRksQBT/Ep6SBS+3J8Rwk2g42alt5ecG8Pb8QP89SVjvHuq9wup7IcIPxK?=
	=?us-ascii?Q?9wXCqJkNM1R2Lia1KXGPxmX6otQMENcb6NokmGIyyjLydHMFKo2gvTOZu5MA?=
	=?us-ascii?Q?0nKVdIF47j+IO5TC8B33hTociOh2KJ4xQCmNz5wmcKjQDdedAi6kUR3WUtyB?=
	=?us-ascii?Q?mJOwB7GrVB7sP4pTwnpZLEZcX3ajfpa/ki3kOJp780w2njH9HByliGkPdDTC?=
	=?us-ascii?Q?UYdsFvy1f8xgkbuVIb6gEGp8JpzueNryR6R+/iWa1aT+oCJCZw72qBXqQFta?=
	=?us-ascii?Q?uvpNNV0TKkAU9sHQCg1cqRTyhWi6aKW9m2rK9gD0RGeNhi/1gEB59zjDdTj5?=
	=?us-ascii?Q?A9N8jR5UVmZZM8eBM7dIVo+mlk5r1W6s/Xnb07J5wOsIFZqHyoB2lp9jDsFP?=
	=?us-ascii?Q?CkoVpNczGD6ZAn8zLyw76wppxTmW8k2HIwBrmXYuaaSoUDjcp47bqd1mSfOz?=
	=?us-ascii?Q?KSUSkkc1dzy54BACc9unwgmQ0RzscvOEvL7URU5mvAR2XuEAkk35bD5lgK/F?=
	=?us-ascii?Q?dsH5aIXx3VGCQfgVfNoKAe7GGuVpbU3n2K6h50V9YHLmlUyTj+qtHmgcgAdi?=
	=?us-ascii?Q?qcr9ZuJdgcciijzahThkiX7JqvBzBGvdis+qkwu5uJ6mir2ualOvqy9XIjXe?=
	=?us-ascii?Q?MAMPkqyYL1sxcFs7L8w/+NbWzS1n096ZtonEtw1MuqykRbM0ON0HWF81vVsx?=
	=?us-ascii?Q?TmNFszvDeA2wnpzxy4clTbOGki0EwcbMn2lsRs8nPlXs3wDj/gz6jYXyL4mf?=
	=?us-ascii?Q?M5oaJAWWsCq8oBw+lPtbbv/1uFEdirjKGO062dsOURngVQlqSsBO6tYatpsT?=
	=?us-ascii?Q?jJj8DHqL7Ejile32GFHJAHIDm3og+RhYsVgYu05Ne2vPqJlo18AQPeUlM8ft?=
	=?us-ascii?Q?q+Y9AvPjdLAKyVmqywsHkgY72YAhTlwS8GLgobEw5Zxl2MkxqBYCrmTRQVGy?=
	=?us-ascii?Q?kp5Y8zfu0aY8=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0202MB2584;
	6:NmRoOUAdww1rhkHiukhI48qMUQj2SKX6u3oLulHTfr19TRCJTo3UXdmSu+rFgLXksXJ+rcCm3OosLVMJsl75hz8JAmDM2rdeZVWL85l9FVj75qUt86F/HtS0Gu8TMxt+8q4AsaTjm+CsDAzKvhNHpJAQRnGU/MnbiCxQQBhmGVqVvv67JzH28NLStlNf1UA0fCM31a6N2bCV3Po5ABR7/TGt+TeMTcOE62rXOIiOTec2OmvpGW/8AIJWdMq+gB7D8KcK9O1fDSvcFS1aXqCNc5o+pQV/II9flf9zYZmMAeMsnP6lrF/yDeusIom32Indic0KbkHzI7ydxoqXsqLSgilIsx/dSfJCwD5TqIWH1g8=;
	5:xs+HF6r4LT4G3U8RpoXblZJB6lLNdmAdug+Gy58ABxOoLf5rkfCaCWOrngx9Xuww0CH+zzteGtL8MmLkkYfwf0kdo7hbNdjfpjarbBnWWmuB3/Sq84PRnFlHRQlrY5wtyXpopArOMcUTuQN0IjiVbPWPC41V9JTRAu5nY/6z3Dc=;
	24:Nuk6huIB6WnQC4rnN7Srb74lnXOiWEF8vYRWIlQUrSjKTXg+8PthxDhkTuiYuaT36V7Eq4ky5OPZUqW2L43SrjwXXnUX9qvc17V9Aqr+cpk=;
	7:z3wXYl43JEexkmpCK0fAvSFVpQ8qX0aUlOaqTwNP//wGqqGQSph+7b3MD1xTBboFnrIPESBUFGJeS8d0lLHyrpbbMfezfbkQ0NAuusIuoZH4vG7EawvRgqAo6tzS+ipRNWuzsTCZg6WelqKAJ9KxVCnwDjndTKkw3ygkAJ55YzEsgEI7yAHFWJ7UhcJCZO+NVkHRQZ+KxP2RERsv0DjuOTJPAyfmJbQuHd+mUJpprfDndzayFpdrGCeSejpx3UnF
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: qt.io
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2017 07:11:07.3682 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc8ddc2c-e995-40fe-cfc5-08d5280a36c0
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 20d0b167-794d-448a-9d01-aaeccc1124ac
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0202MB2584
Subject: [meta-qt5][PATCH] qtlocation: correct PACKAGECONFIG for mapboxgl
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
X-List-Received-Date: Fri, 10 Nov 2017 16:44:23 -0000
Content-Type: text/plain

Previous patch was removed, but PACKAGECONFIG was not changed
to match the new feature flag.

Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
---
 recipes-qt/qt5/qtlocation_git.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/qtlocation_git.bb
index baa25d8..cce6601 100644
--- a/recipes-qt/qt5/qtlocation_git.bb
+++ b/recipes-qt/qt5/qtlocation_git.bb
@@ -17,9 +17,8 @@ PACKAGECONFIG ??= ""
 # older geoclue 0.12.99 is needed
 PACKAGECONFIG[geoclue] = ",,geoclue"
 PACKAGECONFIG[gypsy] = "-feature-gypsy,-no-feature-gypsy,gconf gypsy"
-PACKAGECONFIG[mapboxgl] = ""
+PACKAGECONFIG[geoservices_mapboxgl] = "-feature-geoservices_mapboxgl,-no-feature-geoservices_mapboxgl"
 
-EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'mapboxgl', 'CONFIG+=mapboxgl', '', d)}"
 EXTRA_QMAKEVARS_CONFIGURE += "${PACKAGECONFIG_CONFARGS}"
 
 # The same issue as in qtbase:
-- 
2.7.4


