Return-Path: <samuli.piippo@theqtcompany.com>
Received: from emea01-am1-obe.outbound.protection.outlook.com
	(mail-am1on0147.outbound.protection.outlook.com [157.56.112.147])
	by mail.openembedded.org (Postfix) with ESMTP id 173F36010D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Nov 2015 11:42:16 +0000 (UTC)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=samuli.piippo@theqtcompany.com; 
Received: from piippo.it.local (91.217.248.11) by
	HE1PR02MB1179.eurprd02.prod.outlook.com (10.163.173.149) with Microsoft
	SMTP Server (TLS) id 15.1.331.20; Mon, 23 Nov 2015 11:42:13 +0000
From: Samuli Piippo <samuli.piippo@theqtcompany.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 23 Nov 2015 13:42:05 +0200
Message-ID: <1448278925-1280-1-git-send-email-samuli.piippo@theqtcompany.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [91.217.248.11]
X-ClientProxiedBy: AM3PR07CA0025.eurprd07.prod.outlook.com (10.141.45.153) To
	HE1PR02MB1179.eurprd02.prod.outlook.com (25.163.173.149)
X-Microsoft-Exchange-Diagnostics: 1; HE1PR02MB1179;
	2:8a2I30rm0/SQI/uszOyPaR1DvFNnqb+Qg4wucSxfrfC2EqDr7Ts2mtKJ9OzrKiVQFqL52aYBcP7SSa6QwixEZyZgChRvHr/Ej9sTeG/sPDuUZJQ/7V0FVhNdjLVYkWzwGA277Za0QriHaa9qG5wibQ==;
	3:UWSqlCmub72sd30Agpq3lVWRrJ9YnQN4fqU5LFUid+xX1HwmV7RIcu5rIEJ+ntP7XivPB+EZFUzY9gb9gMl1BGIkQlqjMZfQSpt4jzE9AEO6uDmTjd0nDEf7+2m+n6sh;
	25:n79q9Tel6eAqzCbYM+e6zFTCUIPOmiE7AQG+kYYbA+X9fwDY1HOZy+WrA6NuWeryhYkn/x3yTZjxP9fE2R/iSZqSpcan6pPPXSgLp6sn/XKXwNTEXzHyd7YCYxfGu/WfAN5nwgjNTvLMy8yy11XbQO0yZDay2B9W0lWx2ORE/U2poarX/rajI6TyDIIH8UW+LZkGBGaLISzsl8myJRsOSMjKRGszoodmovMB9dHCFuUQGKnRQTCDvp9bGdKlNMxX
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:HE1PR02MB1179;
X-Microsoft-Exchange-Diagnostics: 1; HE1PR02MB1179;
	20:tPc4IwuXlQfQYJrKuWHZqHhdzBjHOawJWidzA4lBPZlvUbPJ9BEZKUfyRsbFvKW2pFRIhqRsJDy1SBOfloYBGcXm0c73InZ2M9A7Pwr1w9QDWZ8HMauJzmYPvM7FOwTOycc1H51mOVhVxSQUPP0Rm5xhNCG25AOdXy/1kBwYFXYY/x9jzsWxoQu2flIULgCdXZm21s7DrDt5LR/q9TSTCWiIYB/xWcm5yTyyalNOHdxWuCCB3dyH/tDxOkxLEbubtPHv+HGgRbRuEUPWkqXFLEcsWQsR3czyJh6nmdLPUKH2qW0qgeXAslzWMtWr8q+CvuFL+65N9hFWS+Q40RuP7F8rFGlTUN53+GurqKlg7Pw8zuhFMM+SQ0zmvWJUHUgneWZ26/fSvaBvwq/2jiAV9vjNHSuVUD+pilQuOxNlVD+VBcX+AC3moVLkn+SkiMghaG49n5VkY48LvHUb8DnVKDerrrYbPhEzAemS6AvLXT/QGRZiG2KdXOzR3zWww6D8;
	4:GjjPu8l7L1l/30Tqq3WhzQy+UvwYmTt8GB/ZHfNLZwrPGJwuzbcBaiuf/UwQfTV/ApxgIZaLAM7y3R6J2ecgcSRgV7mJipnqV1lC9npAFQZ4AzeajOv3B8yyozJ8C0YB0ZvWEIx5t+1p5dl2fNLIZz8bosJ29VB7sFdKehDG7QNrqpEYryMeTQhp/68ZkqFsSDiDLHMKuNUZUXuRXBa9M+Ljdly3pzzfllG7z6KYEgb19/gOKS2GQUYn0ynZ8UckqSSo5XLcW02w7IFP8R4y3SOftFJ3d+hZG7aeAOBjg08EjBhbItk1FULvZ75TmRJb+nSE93YTNKaOcsngmxW9JNg6ZdDZNJnaWypef70CdpXQfDqQS9afLHEYrrMeFXdRfPen8YHVWtAZveWLgrOEot2RgQywvbjf2xJ4cMWFRFg=
X-Microsoft-Antispam-PRVS: <HE1PR02MB11796D3067648B41EDC84E1790070@HE1PR02MB1179.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(226695750432114);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(5005006)(520078)(10201501046)(3002001);
	SRVR:HE1PR02MB1179; BCL:0; PCL:0; RULEID:; SRVR:HE1PR02MB1179; 
X-Forefront-PRVS: 07697999E6
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(199003)(586003)(92566002)(3846002)(33646002)(86362001)(4001430100002)(48376002)(229853001)(5004730100002)(5007970100001)(6116002)(2351001)(66066001)(5008740100001)(50466002)(47776003)(5003940100001)(42186005)(189998001)(50226001)(97736004)(40100003)(50986999)(122386002)(450100001)(77096005)(101416001)(106356001)(36756003)(105586002)(81156007)(19580395003)(87976001)(19580405001)(5001960100002)(107886002)(110136002)(7099028)(228453006);
	DIR:OUT; SFP:1102; SCL:1; SRVR:HE1PR02MB1179; H:piippo.it.local;
	FPR:; SPF:None; PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: theqtcompany.com does not
	designate permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; HE1PR02MB1179;
	23:AonFAJL5RAeVFsbkf3vfvrxilzXdAXWb6WueV2p9v?=
	=?us-ascii?Q?0Ahj/ftDj/3fUEILzithj/R1Z5e8g0MIebj3pbtR2JFAmZ7OUz6uoA8m3oiz?=
	=?us-ascii?Q?E8oK6sTB85zBm665TNeAEASxTDKHQmEf3aB0qZ6KQ+KrlkLuDhLSS62QpF9W?=
	=?us-ascii?Q?ss6kfixi5hDQ3wD1PKOtfCmjBVBchpt/8+xEpHVe8ZVs139dAZG6Wqyu9g/k?=
	=?us-ascii?Q?8Vp7+b8TTrUMmuOIu3z6ZYZwuajio4JAiBw9RJzURTxWghiWlxKgd8mvABdG?=
	=?us-ascii?Q?nd8wJwpaSJZYJC14bzttTX33ccFNagsH0eX2Di2DF5xXooQpJn03/HZZScyS?=
	=?us-ascii?Q?GiQzwz2Wedg0FwKkfmccfVFts7jnlENxAY6i2CAuNXo8er7s9hfRsq4FmVgL?=
	=?us-ascii?Q?n8shdKJa4J9N+m/FOhn7gTgethHVhOZmPJWi+k16jgbYtbclnozHjsSDOI+q?=
	=?us-ascii?Q?/oFz47Uj8P6ntfOxAxABV0NTOU82nzQ5KQuiEnefeM96UjACwRG57i4kH/ys?=
	=?us-ascii?Q?5YAPfNBozSkKxmK+G6iMlM6P1tr++BVKFpc2vKZImEwpJvWRQsP0IILRkN17?=
	=?us-ascii?Q?qI15YwQgX9tt11eIeCIehuZ8U2QRyxdfdd9GRr92e75WB2cxoivK9eBSZ97e?=
	=?us-ascii?Q?tMpBeTpeYbrUHFyZBslK8zhUnVxiSR+hUDLi0VfaFxdqJ7wMIrdbOTKr16dH?=
	=?us-ascii?Q?CxtyH/ScJh81+6TjwiK/ArxbfZCr/Wmuo3B9xVakt2EfXIhQux2kLbjGXYTY?=
	=?us-ascii?Q?GkJJ5Oj/fzvuNmjQfRHO4HyLkl7iyAR+svAWK/tXnltD1hsgUngtjweCoD4Q?=
	=?us-ascii?Q?fg9fgewKPG8/vR8x9wmKKGuABUiPPt7KXo6As1G931r/TfOvccAFdczKksLW?=
	=?us-ascii?Q?O30nHsgwYu/AOh/n0zTSDK/E8W63mT6AthQ3arKCbsxbVRU3eSZhB4mOVkZD?=
	=?us-ascii?Q?MKhQNcVW/drS/oOukbZ76LOadciR3qDbgQckKRmMbkPm+zNI7oG3e4NH4eE8?=
	=?us-ascii?Q?yt1gyyfoexbTYBmy54n14W39wiJGicOUCMAp7u8GmUUX48Vn9JcF/fZd9O90?=
	=?us-ascii?Q?Fwe0CQ6LIGRrZZUL7p1ZPSQNRI+0xbqHR0KnMJyR6uMRijT1ABlhYp0KrKyU?=
	=?us-ascii?Q?F3H25QJ1hc=3D?=
X-Microsoft-Exchange-Diagnostics: 1; HE1PR02MB1179;
	5:hK/R2fnzlUJovwnhCYkIHda2yIylbczFPNab7tK03ismT6adidoXwa3lNRUBd0lLh2rYFSZd+9QiIKaDWeXW5qnMfW/iAyMeyI+y1sMv5UW4F1USQhr+Y1ptyesoF6F0n2FU17XshOeI2V3mUbuX7g==;
	24:a6dVE5XUvlBgwypUsik/NGIc1HDIbELkwjoJOthdrzt5Z+28jI8+sz+gOW9XXF7M5gNMWStoLe+8g2l9TlR7aokzEWHuuQqmHBNpJjMZPCQ=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: theqtcompany.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2015 11:42:13.7791 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR02MB1179
Subject: [meta-qt5][PATCH] qt5: overwrite RRECOMMENDS_${PN} for native packages
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
X-List-Received-Date: Mon, 23 Nov 2015 11:42:19 -0000
Content-Type: text/plain

The class-target overwrite for RRECOMMENDS_${PN} prevented appending
new packages to the list in other recipes, without using the
class-target overwrite there as well. Instead set RECOMMENDS to empty
for native packages, where it is not needed.

Signed-off-by: Samuli Piippo <samuli.piippo@theqtcompany.com>
---
 recipes-qt/qt5/qt5.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qt5.inc b/recipes-qt/qt5/qt5.inc
index 39f7c3c..4b748fb 100644
--- a/recipes-qt/qt5/qt5.inc
+++ b/recipes-qt/qt5/qt5.inc
@@ -48,10 +48,11 @@ PACKAGES =. "${PN}-qmlplugins-dbg ${PN}-tools-dbg ${PN}-plugins-dbg ${PN}-qmldes
 ALLOW_EMPTY_${PN} = "1"
 ALLOW_EMPTY_${PN}-dbg = "1"
 
-RRECOMMENDS_${PN}_class-target = " \
+RRECOMMENDS_${PN} = " \
     ${PN}-plugins \
     ${PN}-qmlplugins \
     "
+RRECOMMENDS_${PN}_class-native = ""
 
 RRECOMMENDS_${PN}-dev = " \
     ${PN} \
-- 
1.9.1


