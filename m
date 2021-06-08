Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.8808.1623132137247267718
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jun 2021 23:02:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=dUfyXs/k;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=179390addc=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 1585x8O8028410
	for <openembedded-devel@lists.openembedded.org>; Mon, 7 Jun 2021 23:02:17 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
	by mx0a-0064b401.pphosted.com with ESMTP id 391qkqgdgx-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 07 Jun 2021 23:02:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lTBiPnYunmY+4sF25drp7U+RiUhy3s/tBI2KR7NbFTbINuSxNzAqko1r4f+BgCRQUNovnxSN22dn+LJPoJoUjaATcb+PwZ4eYIhWd3+cLkrLyITxDr2P5PlAqVR6IEFLTTscdsChZX8hUQlBMH48Dp/m3ybeGyX8QelA7pzfc6QlOYq6l1bQqQ+sJPRJWN6PClwLNQHu9/KLiEuOcafb4pFig8PqlLjKIim1iPmYw1c93Uvk0Wk5ROj1m/TC09CdfBoQ78laA7XS7uT05wSllkMPyC5s43DrJEco7X8RNsy8swmS2mK4HMeo61wj5wJph9tpRGT044MzLDe+M/7S4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zdgLqwCXpYM1lGLlyv7K2l2KM6LE6TrnYPvdtoBsotE=;
 b=YxU+ZvmOzlewtkKIW8kd98d30lHVjxsdotz1xHv9DwvsP4TLVPnE6l1RYsBiSnEMAdFqHkL1BkCqrjI6vY+3JHHLnTRLSO7StU8XUyC2bch1AGfWINawEePK0rv4DyEAR36ZUgZZ7cIdyZSnpDx/O+GIpOuLuRsNumt6hYHrL8ig1wtlPIkL+XBfyZcywu2yRMaStaBsfw1nC6KNfIfJdakE+5Pizxgssoh4hcT8mnphzv7dDKSBwpvjdiXmqx8J3f/i3p+zKN4Pf3OBQ0j/hTakr/sB03V9fjn+CYlFkF7+UGWhJIXRvAz0oHhgnP+6yFFszMhFUDelQ1/SFv0JpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zdgLqwCXpYM1lGLlyv7K2l2KM6LE6TrnYPvdtoBsotE=;
 b=dUfyXs/kwmv1x58KIZQI+DPJJlkQa0gLGXI3IGQ10de7WSxLLaAyASYjgNqU3kxrxBSuce/jkeG+Dyhjk2zDEc7C/V5xGDdF+OQVBI+mjP1KicmgJw/LituFLvEIY4VNSfCkPBYivYJBP59nOaDXRzTUxhPXfUUAtF1J2beap7E=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MW3PR11MB4698.namprd11.prod.outlook.com (2603:10b6:303:5a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Tue, 8 Jun
 2021 06:02:15 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::55fe:763e:6961:7bbf]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::55fe:763e:6961:7bbf%4]) with mapi id 15.20.4195.030; Tue, 8 Jun 2021
 06:02:15 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 2/4] dhcp-relay: disable backtrace in bundled bind
Date: Tue,  8 Jun 2021 14:02:02 +0800
Message-Id: <20210608060204.38115-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210608060204.38115-1-yi.zhao@windriver.com>
References: <20210608060204.38115-1-yi.zhao@windriver.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: BY3PR05CA0030.namprd05.prod.outlook.com
 (2603:10b6:a03:254::35) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by BY3PR05CA0030.namprd05.prod.outlook.com (2603:10b6:a03:254::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.10 via Frontend Transport; Tue, 8 Jun 2021 06:02:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4947865f-fb80-4e03-420b-08d92a42f753
X-MS-TrafficTypeDiagnostic: MW3PR11MB4698:
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB4698B976DCD535CFC49FEF1CF9379@MW3PR11MB4698.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	V0QaTWdAxTlEoOR7BynklYs+OWNokGyGkB91mZqvYmbRMiEdBrryksLZwvejasuX0MFByv9cvQI2mOxtGxkf9MNN2oq97vEdk/ZM3Z6IGUcMyPK433HhsJb3RcUzqr19KHl32J95NRbdkSKBY8xH0Cjz2swi3P+JakkuovJg0GXdp8CfIEomyaSuGQ4bOwGr5hodj8btdVoZssJw4wPSMwD/k/nYZ5YeyQHDOVSi3mw6Jp4KKEFxSDmw6MYvx2QDsExdW5lVaGTkOFRcevRx4jQULe+K1FElNeab3HBTypWvzXrL3ITw+yFKTi6iEvQ3GH0xQVxJk2Krmi6A0lDt5r3As/iHa8kmi9mx4jyGRls/WylRQvRp5oydFU1IuTqjMfWyt486Nwd1e0zic3p+rQwguHyEPxTsXzFE6BIoat1xPoI9izHzr+60az2JKnrsFEFlqXSN0AN50/V9IGR9ew+oBOSy9+6vCzbC01yR6qz2bNNW4/i3OQYrSZMYwO4IEDNRqbiIgBnpSi9PUmO1cHpJNFZTC9QetAgj2DhfqKbPcbIBmWmlgajVhJYEAlyxVtcpP0/rGz8aaVaoKEZuR2iKdH1K5txkj6BLLFokqhYN0uRAO7mOeGhw/ZVWWe4r3iOGc4l6URQKAKW6ViP0hPwgSaCcnkK+GL530Zby2CDBUtWoPiHGpLoYt2AMEztz5QJccspVc5AEiStymTBlW1b96f3Bg+eS7UFARHGUXDiIjGyzTpRgQ1d1AK9eweVYa5f/nVSPG2STWBtG7KKk/w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(366004)(396003)(39850400004)(83380400001)(6666004)(6512007)(316002)(38350700002)(186003)(1076003)(16526019)(86362001)(38100700002)(5660300002)(66556008)(66946007)(2616005)(956004)(36756003)(8936002)(52116002)(6916009)(44832011)(8676002)(6506007)(6486002)(2906002)(26005)(478600001)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DxVMjJZnszbmx+g9cWod8McbJ26TT5E9rDe0w+x1VId/m7CwZ/1T1BQNsXsz?=
 =?us-ascii?Q?aqlAW283vA/g5ex7O9zmBHPm/FWjSEkNzF6CIFJxMnbRr4RXMrn2xPeYEQHX?=
 =?us-ascii?Q?T2UXHR5LWi2ADgqgLWgBErYcQ5Y7adVEJd8u3k2F6fAlqZqWVR9lu50uum1k?=
 =?us-ascii?Q?Fb8DQ7H5/8OvXXizh9P2KX3nGh0ltEIwrwlg8yWOdvdmGNlUYZYQlbak5Fw1?=
 =?us-ascii?Q?iK1oCItUEdcjWBydYdB40waIygBtK7zyFQH7AX0JZcF+aAXCo7+F1XHnXB/U?=
 =?us-ascii?Q?HHQ1ZjVqJdKfpZks8CEkQqb17F/7/Bpi7LNpOw25xmWrBCOGCzYfbm9DMD3o?=
 =?us-ascii?Q?e4swPKeeA4h/FWCUumplpkb7s1TGKhUSeGU5zhG7oZ1cMFM9aieFeWQThgVJ?=
 =?us-ascii?Q?wRHl++dPILPK9gBk5jdXiHlXYIlDTicy9bx9iJCnPNGVam6yTgfDMVteFBh8?=
 =?us-ascii?Q?NCIeK6fBeqStkJ/IGXJv5kdrrPkSp/GAr39RuLHD/yFh7jf5aijtjYgyLJwC?=
 =?us-ascii?Q?FaH7koAm6AD/lG9fM89EzIruiGqS+a1ymTdu7bNzHwFT0Kzg4/MNSbXojJV5?=
 =?us-ascii?Q?TWsaXUQGXnOf5qsFWfN8XodjcKK/ViRf+AOh4/cnjVQSBHP0+lnsLURupPVt?=
 =?us-ascii?Q?zO6Ww8/mp+U0XqWq86GdtMBqum/BF0UDK1gp0bW+YkLR+1VT+LEegZqsCGai?=
 =?us-ascii?Q?/2Tsv3z4hc9hUdscQX7zc8Lxpf3NYQ0cynosSTphKywQ+s+QiGCpSqcOVjgI?=
 =?us-ascii?Q?nkafD2Hmhj1T5ABIrqjyTPQvgjucJELQSALEEjPHvfy07VWjkx3ZaOjayT6c?=
 =?us-ascii?Q?+3+Y4KJLWOfaB5nzjCD9DloWOknuCr6qEZa1MTxfWxZC11/KJc6Vu1AEocb4?=
 =?us-ascii?Q?aF4ED+1ps6XX2MMpn4/4VqNnN143eTTre27eBHNcM+p1AfAfnnUM8+ruMsTn?=
 =?us-ascii?Q?baeN1xpGFbrkQI6qtVXPL6xJzZm1iLcuoY9mK32jZw6YhWiNJMQJjMFtu6ZH?=
 =?us-ascii?Q?DmWI/wWYcsoRQfV2t5bouQ3f2G7AjsnoKvZ+bAK32YKIXXtefkGGGbPdkMM2?=
 =?us-ascii?Q?osbSfS15OhtuqPOgMvJq88SJSFbxOh8QmSJ3G92QYktqTYblCcbbSynM6ygf?=
 =?us-ascii?Q?eed4ZG4Ec+julL1OGEjhOzmzGT758vDIzGBtsqjBDHYtGa54POuwWoxxqYys?=
 =?us-ascii?Q?iwXhXcVw68iZ3oSYiMU/aP2tOLe+1RAzVpfAQntTXP1a3Rnh9MiLrJxwCc19?=
 =?us-ascii?Q?9hcvHOfj1jafI6FmYHQIY5Q0EMpxHI49XRMSKzNZMGJ9sxn4rZUTL40/rgiC?=
 =?us-ascii?Q?jjabq/6AsKD15alzcbIW4KI+?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4947865f-fb80-4e03-420b-08d92a42f753
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2021 06:02:15.7791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s9lanaknbx1PWfty+o1YWvx3+dI7lu5azxgYSO7aVURTLreR4BorcTACT9zrl8fRtvwtYBApUBFyiX/6VMNHhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4698
X-Proofpoint-GUID: w-VdEVp04VCGu2T5hSPY0614V1zeOuIA
X-Proofpoint-ORIG-GUID: w-VdEVp04VCGu2T5hSPY0614V1zeOuIA
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-06-08_05:2021-06-04,2021-06-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106080041
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Disable backtrace in bundled bind to fix build error for qemuarm on
musl.

Fixes:
bind/bind-9.11.32/lib/isc/.libs/libisc.so: undefined reference to `_Unwind_GetIP'

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../dhcp/dhcp-relay_4.4.2.bb                  |  1 +
 ...3-bind-Makefile.in-disable-backtrace.patch | 31 +++++++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/dhcp/files/0003-bind-Makefile.in-disable-backtrace.patch

diff --git a/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2.bb b/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2.bb
index 671fbf054..563a6180c 100644
--- a/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2.bb
+++ b/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2.bb
@@ -17,6 +17,7 @@ SRC_URI = "https://ftp.isc.org/isc/dhcp/${PV}/dhcp-${PV}.tar.gz \
            file://dhcrelay.service \
            file://0001-Makefile.am-only-build-dhcrelay.patch \
            file://0002-bind-version-update-to-latest-version.patch \
+           file://0003-bind-Makefile.in-disable-backtrace.patch \
            "
 
 SRC_URI[md5sum] = "2afdaf8498dc1edaf3012efdd589b3e1"
diff --git a/meta-networking/recipes-connectivity/dhcp/files/0003-bind-Makefile.in-disable-backtrace.patch b/meta-networking/recipes-connectivity/dhcp/files/0003-bind-Makefile.in-disable-backtrace.patch
new file mode 100644
index 000000000..51520bc62
--- /dev/null
+++ b/meta-networking/recipes-connectivity/dhcp/files/0003-bind-Makefile.in-disable-backtrace.patch
@@ -0,0 +1,31 @@
+From bc9c5d64ad4829c7830ef70fcaff94470974247c Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Tue, 8 Jun 2021 10:13:57 +0800
+Subject: [PATCH] bind/Makefile.in: disable backtrace
+
+Fixes build error for qemuarm on musl:
+libisc.so: undefined reference to `_Unwind_GetIP'
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ bind/Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/bind/Makefile.in b/bind/Makefile.in
+index 8fe8883..1058160 100644
+--- a/bind/Makefile.in
++++ b/bind/Makefile.in
+@@ -22,7 +22,7 @@ prefix = @prefix@
+ exec_prefix = @exec_prefix@
+ 
+ bindconfig = --without-openssl --without-libxml2 --without-libjson \
+-	--without-gssapi --disable-threads --without-lmdb \
++	--without-gssapi --disable-threads --without-lmdb --disable-backtrace \
+ 	--includedir=@includedir@ --libdir=@libdir@  --without-python\
+ 	@BINDLT@ @BINDIOMUX@ @BINDCONFIG@ --enable-full-report
+ 
+-- 
+2.17.1
+
-- 
2.25.1

