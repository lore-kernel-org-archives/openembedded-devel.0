Return-Path: <MANJUKUM@xilinx.com>
X-Greylist: delayed 3580 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 17 Aug 2018 19:07:41 UTC
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0078.outbound.protection.outlook.com
	[104.47.37.78])
	by mail.openembedded.org (Postfix) with ESMTP id 4580978F35
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Aug 2018 19:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=yNDbN7M40Uiy6YO4bGHeBWQ3xmcHZR95VdLt4ZpqE5E=;
	b=1kM++qNjHXq4fGys19J+75qzrFSvf/ApWPjJ5GjK37hjDTaoK7nuoUtwcoviX+oCwWVMDz9rOD2rDK021XNtZpFaUQ6es90Nt469Jvme4wCr/L9f8+iTqd9JbBGNwTh/c0iZfOKPtsTabe58pfy3jAjq4H7w8RtXJgIl08ZUxYs=
Received: from CY4PR02CA0013.namprd02.prod.outlook.com (2603:10b6:903:18::23)
	by SN6PR02MB5229.namprd02.prod.outlook.com (2603:10b6:805:70::22)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1059.19;
	Fri, 17 Aug 2018 17:35:20 +0000
Received: from SN1NAM02FT004.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::209) by CY4PR02CA0013.outlook.office365.com
	(2603:10b6:903:18::23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1059.19 via
	Frontend Transport; Fri, 17 Aug 2018 17:35:19 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT004.mail.protection.outlook.com (10.152.72.175) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1059.14
	via Frontend Transport; Fri, 17 Aug 2018 17:35:19 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1fqied-0006oh-53 for openembedded-devel@lists.openembedded.org;
	Fri, 17 Aug 2018 10:35:19 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1fqieY-0004OM-1l for openembedded-devel@lists.openembedded.org;
	Fri, 17 Aug 2018 10:35:14 -0700
Received: from [172.19.2.216] (helo=xsjmanjukum50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1fqieR-0004K0-5p; Fri, 17 Aug 2018 10:35:07 -0700
From: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 17 Aug 2018 10:35:03 -0700
Message-ID: <1534527303-20012-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39860400002)(376002)(346002)(136003)(396003)(2980300002)(438002)(189003)(199004)(316002)(2351001)(106466001)(50466002)(63266004)(48376002)(107886003)(4326008)(5660300001)(6916009)(47776003)(14444005)(6666003)(36386004)(72206003)(305945005)(50226002)(8936002)(9786002)(126002)(36756003)(16586007)(106002)(486006)(2616005)(7696005)(51416003)(336012)(77096007)(476003)(426003)(26005)(478600001)(8676002)(186003)(81156014)(356003)(81166006)(2906002)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR02MB5229; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1;
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT004;
	1:6+aIesrWO6c6BPRCaZWP0VmfmwN8jVwrGz8rH5Xpxv6UeUW5MOto5DV+fqx26YkemvUIo9n4GsUs6s4Y6TIFvWAfFrLrV9O2/YW2A0/WiCs/xpLLrwWT3UDkD6ILBCJ/
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 842ff35a-801f-4f20-8ca1-08d60467cd91
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989137)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:SN6PR02MB5229; 
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB5229;
	3:oe//mFjNCCRiy4QxtRGmU6x6VaBIVhRxKVckLsIW4UcpJZ6srXkbqfFFOmP06uSLy4OgxlRS6qFsJvjXuZdgypRfvYP+FMRq9miFmCRm8UpJi/ilib7eOL474uk5Yt7B0F/KMmFRoewZrejP69Lm9RuVBthWAFITbYkSVzPgEAcdJ5/XPm56EwWMW8ebiW+2ul5BOBXfhO5+PLHAAkNwUzXUm2Z4qb28ruQOzvYbyNXqbc9ZZmNScuxw99k9QOb3E36ppjHpxl7e04AEFgvCrLOwm2EYmrIsRtp7DWyd1h4ql2YGnnujBgOdYFSU8uX52zlD0DrRsdNJqKNHhSr3OSAEoDkHiROsVaL2gUKVycU=;
	25:eDM/7m22TTrEh3FxSYiVtExe8hbirzZ+GfvnPLg2W5iG6o2Dez4Rog5S7OBwIdNztWno39FvrCdrKUjg3tq6SPOmnbOh1Ohllvyfh+2Z4Zvihcr3cSEZ4eAKwcUmtlxq3jdNWxXW4+vON5WyvY7n/fR2NOrKomwj9U0i3Mo/rhYQk2ZpqVW2xOtM5kIZGbxXo/vVRIrbvEWBehNeJSk/gziQuL7Ve6cdjYNPP1Y8wJEtWH9rEntOQ8BLQLOc9FpZLybBcmznorzL+deuMHDJwtF2Kc5/w3UnnjeSCRe+/9bUJL67WclV9r8NDOyq3Ifg05lPTq7bHKq6Zs+YpxfqfA==
X-MS-TrafficTypeDiagnostic: SN6PR02MB5229:
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB5229;
	31:HFfOv+hZwmA1l+Wrj4f9WfaCyRLXJ/WVJtdh0B5UfnSx7F4+lqEq/J1Atw7GyeGJ9gfdwYxqbkenXsQBxhI/CuBfSZYjy7cT+R0hZxZM2XUrijKZZ2bBc65ivYUISjxGbPk3x1u4SD/f5a22bEOMLwwSEOPuMYUCvFrARPwRKaySDwzp2T1JSHL5LJIWZGuNg/9i8YasMfST5SEbRE36Es/zHmQ6bQhxjQgBOHNEzbc=;
	20:Hx88ej4Y3EDiVrJZKlVXuKa6e/zsFo1DDPyrx7KFwWb9f1w1ROHf6kVfkujuwahPzbFVE44aXjEadecSkGjfu6lf6TODoQKwowBXCOUbQM2ht54046UUb82yc04cE+8/zgT3uBs+T4P+WwL3ajPDPY7ZbOndFo2mZZGgqZGv/m1FJA9K51SInciaOasy9LXHX1rr8G6g+xahALJvFEijcFCQEt+iv5d+3MCuZZpjBQ3LVDKpbLm83VkPcDZRGTJaLpnktIEU3DfHIDaXk3V7LoKUxqw6mpT/isIOok/hhT+vEJYGA08ihJnyWPvbVtAFlX5zpvmi3YvUZhNPLFearrBBjsvwG9AcBf3wOvSNeRnfjTqMMcUXznpN/AFoLlxZtT54MlZ1AgCg6P7m1JTduDxr6vTvFU4QJ74kGJnFuSgbFXP+tSODQZjDxJQTXHv2CU79syUgbcTnDym5/dGrKvbJ/hTIKGTI52GcA2r1td6RvIsqRZW43Sn6d2ZdEx9R
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <SN6PR02MB52298C0CB58BB9F8702CA5FCB93D0@SN6PR02MB5229.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(3002001)(93006095)(93004095)(3231311)(944501410)(52105095)(6055026)(149027)(150027)(6041310)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123564045)(20161123560045)(201708071742011)(7699016);
	SRVR:SN6PR02MB5229; BCL:0; PCL:0; RULEID:; SRVR:SN6PR02MB5229; 
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB5229;
	4:m7GNAgsmDxWWp8HSI/ZThMA7VTQfZREbzgrrFRjYZKypCA7KvipsPYs4Rj6WFYFQ3M5w/gJ+1gxrg/ji4fXVrBU4QSeQXzl3AzYc2yDlyfW1XPYHTLZV8sR9sJ/mfcKcGTssYaoAc6Doz1+QW8k+I63xLlMrAl1ZD6JW1WRjeugtnuRTDTpilg6PlSjPPoNAKrmMn4fUyQa/3ZiT7Acls94Zrbx+PWhX4lfi//k5v77qflsS2uymG9mbqT/GHfntua/QK+5UTi9SMGKBORf54aFze8F1KmUG6ZMC83PN3KjaeR/odvbVKuI/qlpeFFHZ
X-Forefront-PRVS: 076777155F
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN6PR02MB5229;
	23:QTyva3WGnn3aXHX1IDM11RJgr4XpKYiz2+5GTqCY8?=
	=?us-ascii?Q?WoW+P/uILe5al0+h40Bv9aKjtOQo+5/FAiZTmw2Dxx78eLQ79RUPdKj2hk+Q?=
	=?us-ascii?Q?cgK6buPTgSv6K+YDoqr/AzHvIR/3j87Gt1pK16MmxqVXPYzwhApu7nKkHY5t?=
	=?us-ascii?Q?dwTMfFa96uYYcebocMHm4dpTKYDQS68FTrkTchd7CyFdhNt5/y/Bdg1kXJpJ?=
	=?us-ascii?Q?8QPYXscFgQEDhTRR9eYw2YBC46SR/GRK3NsVMUCxQb520p0cfzrjKkk7SPl5?=
	=?us-ascii?Q?nre7eV2L7NgTMs/o+KZ80GHwsyuLQq/fLziuFAYbDoVImBWpNgDdmVe31amm?=
	=?us-ascii?Q?ITX6IIWdgwBHa1K6KvPE4Mei1OUR4v0A340JNP05Ud95gmCY+UMsJ2e87Ttb?=
	=?us-ascii?Q?F25prv/cdwIRSLi/rzehNT+6d43jSL2hPrH6xbWAovT/uDJ5dZPK3xkxnx6l?=
	=?us-ascii?Q?eVtWQ/ky6AjJN62F7Mf01d/fnhyQp1JyrmrzSjXoulBfObHMpAUu2ieUW1af?=
	=?us-ascii?Q?G9K1xOpf2NZD+oS9n2FD+m9rgS8+jgijRJfM6dVW9GHKEHsYarUGq/f2HGcd?=
	=?us-ascii?Q?bZY93qNsbfultpGds3PYu1OOrIVd9pLc/lcFSEAnQUkxBnaodLy/pY5H74/Q?=
	=?us-ascii?Q?nCLAKOAkofa0LO+Nhtawv/cSYObOauEBTeOBE1B23S36GQpjjAHeoYexVswB?=
	=?us-ascii?Q?dcLFo0Sim62IA7SLdeztZA+NjTC8XIi+gGibfZTklD1YEiRoXD7rYbEcQzwP?=
	=?us-ascii?Q?TC07Npmv9dvfMuV9nvOyjws6YmTFi6EVTztZV6xw1E5zz2qSoHaFDyHa+OPc?=
	=?us-ascii?Q?kNkvVwMYZCeVY9jq4Yz8KvhJ7u0ssRvmVYIXlTq+ryLCOR2DToYMCiyb4H7k?=
	=?us-ascii?Q?5CNtFoEf4tso0yRpHMznOJiw2eeGsxGfaZin/6kHFRt/0P8S5C4gPUlErqGo?=
	=?us-ascii?Q?ESFR5hPEzn6tqzr3kqtpnTzc2e7PUZ4e3Y2dTeYyhC4V4ndk+3/xW1ez0cO9?=
	=?us-ascii?Q?/laoqiKqZQMJ4BfijujT6Vfn/SBv+NLRcURGPLHGcKdDaotsqpl3LEkeYDXX?=
	=?us-ascii?Q?C6TkmIa8WLBR1GOSVjBdDN0zREM?=
X-Microsoft-Antispam-Message-Info: t+VtTyaukEg7z273sCklXvTTcuAR1Es6DTHZpcau7NuGqqpZu3V5T4+45DUdrICXNJdUNVzp2Dwm1XVnCXIsF+E+i/wWRCXa8nK/+CHHXcypQYoSjcsVRDzmpIPWcXI0nkJuF0EIP1HuZwVbWLWozF6J7Cw+DSdT1LBu4ii6L9QXpj8Zp8fc042ps6tCyefwGLsmFEiuOqUpUKZtSR+L+lxdRDzmj3M9Qd4dTkkx81Zhcd+GxZ6q1BcSQwkioRpJS8KvxjwLfNvFfcSDmsMqCKmH+0EAAMs4/jk3ncCnNF+esjCz/QdKWAg/jAKZsc58XWHLfbTB+3dXrsk20yhVjP5Ki+AuH6HSJyYEAedZ/VE=
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB5229;
	6:BbwxMLGqHiEjvd68oXb2qW43BJPHnt8sw/8T6i1QgdQZ/NuSN9fjgBbMIKEIMgFyTBD9eZxJuNb6srNIJz3WPIfziz9fqlE18U/UIFbQmepzsoRQO0r6HvU1aoMl4Yr84TgdMS8cAis9Gvb2tDXfoFQWOwKbEyKsoV2HPaNTjDHrCcXtmh9olzNScAcWVPMtIOkVqNl3Ytc8CitWJ940WXbA42DnhD5wXOxioxp7l412EfaKN1+DjCrOsunxI8tSss6ehUMcOm7xisDg1dGpk0FV6YPXiOQOXzNEHsfUWgQkFiT0++O7Bn0EnMsoFPLiSTwcOdmaxDRRq6rNvULrDdTeeGP+vpRLfvyJdA0LdMnmz5wAYwgWEZy7ZT4Z7mfFkvILQf4YXwsxuzoOfTU7zSjd7GR2fiGWXBgtSDjb3CU6sWXK5hUYgMzaGiPSpF7LWpdcs8OafhHS1HxrjNz3lw==;
	5:a/Q9uTnn7/SwFhTVxcowZrjzZnbm4Fnl9KNjiHg/3Lb3WmUWHpe7/iqW1yoMAcNLSdQD0pgjS098ckgh/3XCPS7baLNWQ1WrDHrvHAfsc086SarqlUfUu2bOqU06fhAd7DTL44pJm/CUpMSB/iRFvfV+2wQeltZ8eDX7k4FbFw8=;
	7:JgLB2mI60yedJ2dwiztc+mZzG3TAoSIn0C7j8MQerVsjW+VDSIGIS+1GEFqBV89JX11uSgU8UA3AYgnsCt3RI11+LbxmXxAM/Nw47837hSjnlHlV4crHfCoq+4xQtTsGC5FB35FG7QOf4qKFd2T0GMBIUu3lJ1cdeD4XA41+bbfEaOEepHRiac7ykxiP5SYG30K+yOGcOgMRiD9TKi/WrstlKb5YJ6jl4Je9cJghXhc4+D80MiCdsfhu6ftxzKpA
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2018 17:35:19.5264 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 842ff35a-801f-4f20-8ca1-08d60467cd91
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5229
Subject: [PATCH] wireshark_2.6.2.bb: Add depedency to bison-native
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
X-List-Received-Date: Fri, 17 Aug 2018 19:07:41 -0000
Content-Type: text/plain

Fix the following do_configure failure

| CMake Error at
wireshark-native/1_2.6.2-r0/recipe-sysroot-native/usr/share/cmake-3.11/Modules/FindPackageHandleStandardArgs.cmake:137
(message):
|   Could NOT find YACC (missing: YACC_EXECUTABLE)
| Call Stack (most recent call first):

Add depedency to bison-native which provides byacc to prevent the above
failure

Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
---
 meta-networking/recipes-support/wireshark/wireshark_2.6.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.6.2.bb b/meta-networking/recipes-support/wireshark/wireshark_2.6.2.bb
index e949080..5be7d4f 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_2.6.2.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_2.6.2.bb
@@ -4,7 +4,7 @@ SECTION = "net"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6e271234ba1a13c6e512e76b94ac2f77"
 
-DEPENDS = "pcre expat glib-2.0 glib-2.0-native libgcrypt libgpg-error libxml2"
+DEPENDS = "pcre expat glib-2.0 glib-2.0-native libgcrypt libgpg-error libxml2 bison-native"
 
 DEPENDS_append_class-target = " wireshark-native chrpath-replacement-native "
 
-- 
2.7.4


