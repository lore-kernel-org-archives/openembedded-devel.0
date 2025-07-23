Return-Path: <guocai.he.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FEA5C83F1A
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 02:19:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.5005.1753237135841859826
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Jul 2025 19:18:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9299de1fec=guocai.he.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56N0ofqE1233994
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 19:18:55 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2055.outbound.protection.outlook.com [40.107.243.55])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 481vqv1mfb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 19:18:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZvogJeJmsrVkGFHsWc9MlJb1DazGRhXfUSX+Kp3kEhEyCQ2o9LNXqhRhbyAfgMgJAJltEL4MbeMTvCQenNEIhmk+7Jw2PvvELpqjiCP4LmA3fqRmRuxZ4FUFS+MSgMBk5WcvPvYm+xEWcVEpLAKQs486iQToKF/tN69xn9s8+97WG0TmaNPmQvz3rz730LCuPXFKewsTMzXv8PNHd8E9tWGT94aTANpVbKv7bOP68azxk8WFI22YfK9U3vBSx56p4EpZC65B/jmKlffd9J1w0WZVjDD8jVhMkxcoHO4+Rtn82U/9KJoWiGzAoBdcLQ/exXjUH1lBhokVspLhYo1MQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KBDR2Df58TTpSaZ2rtj0S34YIul/n/AoWWgtgQ00AxQ=;
 b=JFO2+vI1PStydzVEreKt3kQmn3l/KoBDYhkMnNOasODnvahkyVL4gm+xiD2sV2ko3eZoTkoWknjMHSQUGy6NimAND7Tg7Rn1sVVi6CnczKpB9L1dPgUuHelOvM5MLjOZzdAPRVsa835Ef35Lfv9SBo7yf+Oi8vLHpD/wiBapAUVZQIWsrt8ASjShRqE/iofdUBF9tI12v7UgLQmM5WPZfcOwJypMu74AVb1zHYm2uSMUCV6JeJKCYG8Y/PSOY22HxaT5mw+m3pSwvdSQOQPv/gfDlzCC2fMpAnWhU0sG7Qzr/pyJvY+xvmDRzTkMhIOUwYu7I5JSut7iihWX7e/wfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5586.namprd11.prod.outlook.com (2603:10b6:5:35d::21)
 by CY8PR11MB7058.namprd11.prod.outlook.com (2603:10b6:930:52::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Wed, 23 Jul
 2025 02:18:53 +0000
Received: from CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::813a:3211:c8fd:1f86]) by CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::813a:3211:c8fd:1f86%4]) with mapi id 15.20.8964.019; Wed, 23 Jul 2025
 02:18:53 +0000
From: guocai.he.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][scarthgap][PATCH V2] mariadb: File conflicts for multilib
Date: Wed, 23 Jul 2025 10:18:37 +0800
Message-Id: <20250723021837.2580975-1-guocai.he.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0212.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:19::6) To CO6PR11MB5586.namprd11.prod.outlook.com
 (2603:10b6:5:35d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5586:EE_|CY8PR11MB7058:EE_
X-MS-Office365-Filtering-Correlation-Id: 25550676-3790-45d4-a8f3-08ddc98f44ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?z3xFoWRHSkiPbGB58DSJPUAA75zkvqiJUgyIuICq/9Agxxa0RhIx2WwXy5a7?=
 =?us-ascii?Q?Qy/MLZMdmypNsOUmaw3ts35LcyX/VMKulvmc5EhVhWhs2wbX9p31aDwuQF+0?=
 =?us-ascii?Q?JQzpo76TOJEHetQIMCiyZVxqt2qOOEkTP3TJ0eUZ2DVBc3dMy2+W8R/Uif26?=
 =?us-ascii?Q?txrmfQb2IjKCK0SY1l3qohNHw+xAZzXB4o5+9h3ifozNHLwcm3gb0hvNqOBe?=
 =?us-ascii?Q?FdDZAJXAZokuN36AN4dYJ0S9o+IIofXODeeeG5pmsz07pwKMNBqTXT3vtHYS?=
 =?us-ascii?Q?txWjC3EBVlYss81Hu6oogOZj5O+cVn2KtSwC3vqSCXVbByTjDm5R61KNH+QZ?=
 =?us-ascii?Q?gEXt69KdQke9JxEAq/AOO4wpoHrdFmM32tPhvE+yIV1nWgQoQkHmyvhRfOlA?=
 =?us-ascii?Q?uLBrce0ewyoW7jGRpfRbGHCJd3Mk4wkOjuF31V2hLi3Hv9Z74Hdaq85Zxoxp?=
 =?us-ascii?Q?ak1Z3O/jZf4kRo9urnPC/lBK/vjEPFTdsB961CGPlAxfciotI5Wnnh/HcJWO?=
 =?us-ascii?Q?4V8bodbcJ4RdoXqgfyWDeyAk0OPDwf7FPCWNCf7fwapypD9Zli5GyToG1y1z?=
 =?us-ascii?Q?a2UM62HTohlhTBy0+q/M3LmWOJ22CPYybvz/QFRY3jUUuhL3ezb1sk0pX98a?=
 =?us-ascii?Q?7JsOm19MtsSWPaCKOD1DQp4xpx2WR2kG3N6Nqxo7eN+xVSMyChYmhzqlvf2u?=
 =?us-ascii?Q?LVFvfjfsmF6WTdpsBUn2dsN2s2RbXj/XSJl9ay0MiD7TQtmlhspm3bq7HQHp?=
 =?us-ascii?Q?Gav3pC0F8wnu8VQHkX+dx39ayQSIi/0gYfdTCn3EepnCGTRztHkS38V9zXHU?=
 =?us-ascii?Q?uIxgFVyr2kpomDe68G9YovBzeqaTQJVGMRoKLlwxZR3igrWodQGcNSexoz7v?=
 =?us-ascii?Q?mV5euLYLkzT+nVWm/7RkU2opAAKexwB6kE1ycjIIrBYEwbT/gMQ94f1ENs/J?=
 =?us-ascii?Q?Jlb5DzxHUkwC63PXyZ8FDp6sDiF56iONeXWnqYqQ49nv6nR2D5OXTM43tWEF?=
 =?us-ascii?Q?rSDT3pHHuPMVXa73TEsDW5qAABK3/yA0voYKnx6IihsA2CTjSowNGk2CcWr5?=
 =?us-ascii?Q?obpc2I08uO3WfvqUcmpDqEiaQggOYMOsylWrqKkMfUJFX2+mlPWYQrPcKmUS?=
 =?us-ascii?Q?5F/154UgnBMcttQfkLndrcOrD2052qKF8NfwXdykgQfW7OtBUPgufk028Vzy?=
 =?us-ascii?Q?CTtj46LTMWnH3Wl2/UQ2qjtrA4AJpFUC28NnwGo4gWHdIzFZ6O4ludlM4JxF?=
 =?us-ascii?Q?lOCEONN+TtAZ+OPhGAzSmkt8El/WjZqA1itaWh34mIH9qAgdOFNh0Jhm29YX?=
 =?us-ascii?Q?jEIo/YEwvgjjhOeplCpsddCsD+BHQmPTDUxGhWLaz4IPuq0855WxwGRFfqdU?=
 =?us-ascii?Q?fCVoRIplrmqGAPM1GLUQthV8/5YzY/fLHFgg0CPfQXd5S7bRD3Wmlaxe/1eO?=
 =?us-ascii?Q?1T3UYvZFi4K0G6Tta2T5vJ5254BpmvYO0BMPud4IcSqMXA47ZhKy6Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?L+VeuyO1I8QnbEf8pXAWZkKSIYxlAF1PBJgUCdmNRzepCL8pUKWGMlvSIOuo?=
 =?us-ascii?Q?rIl5Ncw4dUu1hod6IkQxFQDB0ZsFpNMWEnNV1xvbfmC34bu6o+DoIdwwIMgI?=
 =?us-ascii?Q?PHF4jonr78yh7wC05nsgoh7UMJ7wHwhDMM+FaYTlxADavYXsls9gQi/DLQez?=
 =?us-ascii?Q?uw/vWjnhjiz7fKxi+XWBtrH318TpUS51QISyBcdeIcq9f4gjdvaRiqvQxWoy?=
 =?us-ascii?Q?UQ2dS1xs0bcFVW6D7blSrt0353WslbbkJ/bslsYZJID92YBPBOtIB4lfjGbi?=
 =?us-ascii?Q?ENDjxq7v/7BW4N1Ed7RLdYnfB4eGYib6c+Dl9T7ZEqh/MVCzyaOoi8NEX1Hp?=
 =?us-ascii?Q?6MpmqUOZaXOyXyivLc1CpQ1zskSLFIFRWDY0mzfyAhNqiX4gy+EJsjPDIQ9Q?=
 =?us-ascii?Q?X+vyhyszXgreaB47GlGd3yDxdsyLybMibjjnbazjCgP0WFeKF/74Ex3bSKLT?=
 =?us-ascii?Q?9Ph+kSczPRe9J40LT3RtnQT6NcvcjhpL0yDiYwEeZiOllNKzQJA2s59srvGF?=
 =?us-ascii?Q?WiR9ouVJZ2/TL6HR9zEErnUnSYYvPwOD5WlEobizbgdJlWHc+NRl4o0SI+lY?=
 =?us-ascii?Q?NOc0cv1RvIWlkwWtd0T+4W06Tty4ik2krda17em1ekGdwCkOOrEkJG/6D6ms?=
 =?us-ascii?Q?54b6IGhytwAp+HLE2uhIjxuHfgpkYbhbORkId7H/WgjKz+Jk3ALmEp9vkU4b?=
 =?us-ascii?Q?U3GIixPbESJEujbpVRjGKXG62iFEwd7MhROk1oAiY3lVZlmA/lkLUESp8RIT?=
 =?us-ascii?Q?uupdIgTuW5mUvVpcomNWsgAicuaqiqkiiFbwQ+2fNDzBz4U5shjjl8hWgw52?=
 =?us-ascii?Q?kEqYO97/IXvR0YeqzVzuoBGV3SDMbJ6GCQUjLwSBlU1U9YokjO6N6zLSpImv?=
 =?us-ascii?Q?AvvBytplqrH5kNh+eK+R9NatsQH0GD6Osl1NubEb1D/VvIoTxdZjz7nrCkcI?=
 =?us-ascii?Q?LrbMx81T0OTLc5QbjZrtMy9ypPUSQzbCFhYDS9dsUpPgN4UyiuPNQeUb0lD0?=
 =?us-ascii?Q?b4PeRBDxddW8RFlUD167QBdo9crFDh9iby2BpHlypmFBgnNWsAz6qR6r4UoL?=
 =?us-ascii?Q?jb08fPm9RSiV5TzWRuWhxUbm5W+nSbdqaV/H/i1odxRyRGNBW5zjoz5aU6iV?=
 =?us-ascii?Q?IxI4B1ncmPjEksLqV5G7prIq64ls1r9OJHADfJ+HjFMJzL3Xf3oQ2gqDvWwH?=
 =?us-ascii?Q?UvuS7csXbViUgAqJDRFHiu/gGQis8JrWX5lAivUUEV7Tsg8i7PANhsM/XYkH?=
 =?us-ascii?Q?Fc/mNfkHmcSO5WaqyQHyZ5x54DweTQnPBjvIOy0aPnpR5B0KiBurJP60SaBS?=
 =?us-ascii?Q?BVB6DoESd7JHglrUYOApRqxZ39lOveyat8bwe6y5QzU+QDZ3ybUPrJoce2sj?=
 =?us-ascii?Q?qnO/CCalB7TWyFPOU8lQG6oB/KtzvCyi70rvwAR1LTJpEoZWRiITDKq4UlDy?=
 =?us-ascii?Q?ARSBagk8ticO0PTXlgmr4KJkUm99WnFAryEQ78S/yAr84UZ1xFv05um/nl4u?=
 =?us-ascii?Q?5jTmwgCxQmCHCn9PFboAHXaX3DNAPd5fYaeEdSBDI2mnOXUcOWIqwZp4Jivl?=
 =?us-ascii?Q?nTeAd1xq0ACuiAhOSTjK48QHcwQSzcfmIFZn868yE9cXXIsGnKvuechnjbHJ?=
 =?us-ascii?Q?Zg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25550676-3790-45d4-a8f3-08ddc98f44ff
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 02:18:53.3244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qm6g/vbduvCkwiUsBdUtSgLfhN30aGW/XibOuz+46HZIBBf6m/xVeRyX1cYsQWxNsrehPC07NKIg39MU5edhh9UmDAj1+SfUb3VXLxaGZzk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7058
X-Proofpoint-ORIG-GUID: maqIfKvwed_3Gm5dDK2FWJBSe6J8gq9f
X-Authority-Analysis: v=2.4 cv=coubk04i c=1 sm=1 tr=0 ts=6880468f cx=c_pps
 a=6kUXyxSL3GSgDGyJuzBerg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=Um4z8P8mbPEqFpxDQRsA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: maqIfKvwed_3Gm5dDK2FWJBSe6J8gq9f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDAxOCBTYWx0ZWRfX6N/YK5xhQrAY
 zg6oSf+RST0P9wF3MM7wFefeBMCvVlEqG5exmEaoKjyTTjBEB3gdNw8a1aTBxKd+sVd6/KWM14x
 f3dnGHDGeEngUos98rZ1Cym7GIWOyj6aY+sQHrLjxtbiBoSJH3tV5Ss8UyYd5blz3qJh0GSMCcE
 fQz+XRmFgEGhP/odk3RaKDKdOuIT9SJvqHLIFYyZeDBEXS0RuKpMjmuVH8rbrSproYA2wkP/ymx
 1CIZw87o0fYAmCPqjfNRVR/QNE2buKBxypAtlMIrD6whr8CAjOyw3Jy2iA8Aw4Uyg/aq69wqETd
 R6SpdoAJfFAE2rcfWNCYNNOJvI6pAfa1tcwSM6ZqTRYm+QdNP24rTnapjXPvW5Krkpvw6qAU3D9
 EvE0oZue
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_04,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 clxscore=1015 phishscore=0
 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507210000 definitions=main-2507210183
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Jul 2025 02:19:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118709

From: Guocai He <guocai.he.cn@windriver.com>

File conflicts between attempted installs of mariadb and lib32-mariadb

Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>

(master rev: ddd322323eba44542b6b631d455e3298c50c4535)
Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
---
V2:
update commit info
---
 meta-oe/recipes-dbs/mysql/mariadb.inc | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index f52947f359..abcf0b3cda 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -33,10 +33,12 @@ S = "${WORKDIR}/mariadb-${PV}"
 
 BINCONFIG_GLOB = "mysql_config"
 
-inherit cmake gettext binconfig update-rc.d systemd multilib_script pkgconfig
+inherit cmake gettext binconfig update-rc.d systemd multilib_script multilib_header pkgconfig
 
 MULTILIB_SCRIPTS = "${PN}-server:${bindir}/mariadbd-safe \
-                    ${PN}-setupdb:${bindir}/mariadb-install-db"
+                    ${PN}-setupdb:${bindir}/mariadb-install-db \
+                    libmysqlclient-dev:${bindir}/mysql_config \
+                    "
 
 INITSCRIPT_PACKAGES = "${PN}-server ${PN}-setupdb"
 INITSCRIPT_NAME:${PN}-server = "mysqld"
@@ -159,6 +161,7 @@ mariadb_sysroot_preprocess () {
 
 do_install() {
     oe_runmake 'DESTDIR=${D}' install
+    oe_multilib_header mysql/mariadb_version.h mysql/server/my_config.h mysql/server/private/config.h
 
     install -d ${D}/${sysconfdir}/init.d
     install -m 0644 ${WORKDIR}/my.cnf ${D}/${sysconfdir}/
-- 
2.34.1


