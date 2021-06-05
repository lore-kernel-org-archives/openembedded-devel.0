Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.12339.1622901834195085720
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Jun 2021 07:03:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=HzR8fv20;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=179073020c=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 155DwQ9A021487
	for <openembedded-devel@lists.openembedded.org>; Sat, 5 Jun 2021 07:03:54 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by mx0a-0064b401.pphosted.com with ESMTP id 3908sp0208-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 05 Jun 2021 07:03:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZROs9l8Vj/4s9IwkanObSa0c2fQYEPSfAlmxayD+YdVEy5enQdQtCGIgaArVUsV+QhmhIcslgGWWVDwDFUrtteNEjKNjQ5kKJMfH3U/AAjJqi/QLiefGBRhLR+u1RFDxX2u+cbH+ADd65sXpjiczEbpfjQiOAn2ya7NTXwW4nAa8b0CKWsvUIp1oPZj8ZjY5gfrjSyEMeP2zVtT6dGFHjuA4SlrmSW7uqz8Bul1FAhHZFRTnu12D4fRnr0anUD6YKzHScyi7x/qRCB3UvFzoEiYaoe88Cy8SY8l75nl8dHp89b9mf31qkBIF5qmSRuFnIE0Lj/GSVAsPRImOgCRw+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TQCQeuvhxzuAZIv3OfA6Z+ZuanZz+JRfasecROE68Cw=;
 b=Sgr6FrvY/lJTJgOA+hWaBJZvgMpcEi+/2/JSFrrBWqRdh9ZvqltkXt/O/TzAYpDmmW6S28Z/BhAUb3L98W1BwZirE7JWy5OFlN+mEYisnA1dmMdeTC8WmoJpMAln9MzVcamZez/im277OwAewuMOCvev2K6v3B3D7GXgIFaBY2cntfLdeZmhkECVwBp4zGOlkUGaFydCsi81tB8XBHhwbqnAwkqlZ4fVNoC+/aMVUw38Zebu7ItuNLyRBe04yuU268GKW0jzh8EqVIt4ceDur3vgxAjBiUesh9AHi0g869zk2WptFH60QS96uW/s+iEb6wExLSSA0qJ8hZsN4DqMmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TQCQeuvhxzuAZIv3OfA6Z+ZuanZz+JRfasecROE68Cw=;
 b=HzR8fv20CpoM9HFhWLlWkxbAa87xNWOOOi8u1pX2BX+Z+B6W8hlqEOUVzhXjVPW4lBSap4IGm7s9o/ieDrJEh+x+fxAsLzRJd8GWp1CwMYA+8wMbsk/BLi51y8S42RTjUw1C3x5+hRWbMQhmZ8msKRILLziKZwmIu3FajjQ/ZHI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR11MB1853.namprd11.prod.outlook.com (2603:10b6:300:112::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22; Sat, 5 Jun
 2021 13:48:27 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::55fe:763e:6961:7bbf]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::55fe:763e:6961:7bbf%4]) with mapi id 15.20.4195.029; Sat, 5 Jun 2021
 13:48:27 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 0/4] upgrade samba to 4.14.4
Date: Sat,  5 Jun 2021 21:48:13 +0800
Message-Id: <20210605134817.163302-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: BY5PR04CA0025.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::35) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by BY5PR04CA0025.namprd04.prod.outlook.com (2603:10b6:a03:1d0::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20 via Frontend Transport; Sat, 5 Jun 2021 13:48:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2937df45-43c2-44a5-e5b2-08d9282898b6
X-MS-TrafficTypeDiagnostic: MWHPR11MB1853:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB1853706B32C333BFA2D75D38F93A9@MWHPR11MB1853.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1+rWhZzAk4BTnn+sgXsUl4uqSeVAFIvtzR+Xslbj192dynxRRMdEgegCUDKc+YO7bu+ebG50kd/WK8hF8RIeqny9/yuzl8/EJpW7Vhh5AE15mtWS4sTCL0jLP5hSz6Yoghhd+7awjI2LPb2sa14O/n6CI60jUSJT57lQ5wowPdyhGeEuBN4cWFmVdIhhHSZufCtt/Cm9kIkO5Lrpt3h/twFCn5+imiJbFtOjID/W7iWG8N/MB2NTS37P67CTwetEIKP0qxEB1upNLwycmZwbR6Ye1b7mLI1wif2CWWNt0QX2fdRNi4sSY2dcVmywPu0Ed6ozV3sOz1lmoNXqoHZ7s19wA4GVAvN+F0mC8qOYsX63VnUkbGkxkkmYSITnnC1c5QuJgQabtBYXiNlXtzjz0IOrF7xw/lYICGXd1KPf8fIY+DUuvWzspDQFrfrlO4QZlp3rG+S4vS4QD9PRQGI+qaveVbX1jRC2TwQoxQoGpZXaibHZp67sbBm/iTI8GhmRCV6ggK/axG5dzuvVmd2RQhcLMHNYkdGluY+sZF3TVCOsvXhdKjco2MwiFe8+aRjAxaK19GukMAPeyRMuXlfoCEvmeDj1sCME/YVcanZgqNfTE34VuHCLebPpgkZv+wZRzQh9X7l+bS/xbfU4E0U9qedKyHVIisN0Yv7CsqBhK7c=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(396003)(366004)(39840400004)(186003)(16526019)(6666004)(6486002)(86362001)(8676002)(956004)(6512007)(26005)(83380400001)(2906002)(38350700002)(38100700002)(8936002)(316002)(2616005)(5660300002)(1076003)(66556008)(66476007)(44832011)(66946007)(6506007)(478600001)(36756003)(52116002)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?9Wo9CkKG8U/mVGCenh6l7kwX6EwssPhIjKXNyGJkaJJE/Swh8f5diBXRPamn?=
 =?us-ascii?Q?6j93IRZDWSNEibwr5QA0fMfUDyvNnJzsVGrKSnaDXX5Nwhg3x7j3Pu9TA6XU?=
 =?us-ascii?Q?2PMlMC3PFrE1bW0beM9H0b0DsqNhpQ0wYQu19wueIsBMNEYeglzfgfmCIwkh?=
 =?us-ascii?Q?/jgAe3fBrwg6y2yrIDG0tjqoehv/ahMJWpnxys8ruOuEVZFOQLpw4VUbKALv?=
 =?us-ascii?Q?lEvxcI6RKUX5CK3aEdc/A4ojNd3vN85cznVKuvdDvqfxZfQoTESHysprMJWS?=
 =?us-ascii?Q?cVgp1nTYZy/Zw0VZvMohm1lAB9aKtsk4MjxWbAVcV/CW5FgJ7TZZRqgUV4ue?=
 =?us-ascii?Q?PDqeOCqV1O5KdudGCrGHWSGoua/BXBcCznn4ca2ngom2QiS/MutdNIYe0cjr?=
 =?us-ascii?Q?KTaYLQzafBsgrcMiwr+i76WRpMMo87ZRnPxboEmKrX6mmswXFdnXZiqzn6IT?=
 =?us-ascii?Q?hsF4maFtABQA5f5Bz/a2ZBGb1cIhPz0vCDit0qwPFHu8Se5JxYt/f75Lem9N?=
 =?us-ascii?Q?HJds5dwAiechFDTQ2TfB1d1PBMaqbKSpVA16f2Tb7jsLLwwsXSdz4UWXastf?=
 =?us-ascii?Q?AvA6g4mlGQEjdTTO5+C5CIO+c48OBOZsIpYmzpxz90MLwIMoak1Wn8GaR3XT?=
 =?us-ascii?Q?DMPlBwx5kpPCgi+4bCV7zg2Qj7WnRtyyGQ4M+xRUsTrMeo0jWUTj6FI7QRP6?=
 =?us-ascii?Q?424vbIejxurJWitA3iuSrWnAJOnTPJ7xJe5TI8wwxi1K1a/qzk6DFubHCXty?=
 =?us-ascii?Q?p0ZemnILgORlNa1PrheC+ByGo2NBphMszbnUVLtwMCMkqbRGrtWoQakGqX43?=
 =?us-ascii?Q?Kd1xbmlOJrnwC3YbyUvz6ztOLf3hb54ufHO6J98mOj3SUR2vouP7Fj5MCbXZ?=
 =?us-ascii?Q?jfNZp4xSJTsDSK69792zYJSteRx3jkxPkRnTUDHB7s3oC7fjysknTB2PMNno?=
 =?us-ascii?Q?QysqvzQjf73wUVCZU3/2v9/UI1thhNsRUwRVbXAFV8SH1GZrzzNDrJAzGD5j?=
 =?us-ascii?Q?32ZEXe8LNyGVlnknA8kzY56ggUOohUSUzl38FYvFvfRkFThqdD6IkicbQ3M8?=
 =?us-ascii?Q?rCb0jHXowodf/frp2Y7EHUHjef0pVL2nHa3KXLzqPn7HcGT419TcvSb+PqhI?=
 =?us-ascii?Q?+fmgFnkE+0g9EKG27TfOUbOrDTGnpM/r6mo92M7jLC9c7SE6t+wc5JvfVgg2?=
 =?us-ascii?Q?HfBfxmJIUAIwTdv0ROeX8RHcTSKGo3zq8E89UccfxoGhcuJ3oEdmWDW7SxgU?=
 =?us-ascii?Q?UvSVWqaMQoM3lI3mKbdm+V4roS95BJDPa+IuodPcTVU96ay4/iqO57e9kt7G?=
 =?us-ascii?Q?XgYIuoe8ewudlAgyMAfvvLfm?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2937df45-43c2-44a5-e5b2-08d9282898b6
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2021 13:48:27.8259
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3WwwQjq+2Gk9J/8LqL4+rzkAv00VvcU6DH0Z4TOopODxjH3L5aQIcWySTA+apuEVphTdAwO0BwJMxwzame3riA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1853
X-Proofpoint-GUID: 8-DuhJFBR_7jryKjLKTH-Tqnp4ACYOWv
X-Proofpoint-ORIG-GUID: 8-DuhJFBR_7jryKjLKTH-Tqnp4ACYOWv
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-06-05_09:2021-06-04,2021-06-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 mlxscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 adultscore=0 mlxlogscore=999 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106050101
Content-Transfer-Encoding: 8bit
Content-Type: text/plain



Yi Zhao (4):
  libldb: upgrade 1.5.8 -> 2.3.0
  libparse-yapp-perl: add recipe
  samba: upgrade 4.10.18 -> 4.14.4
  samba: update smb.conf

 ... 0001-Don-t-check-xsltproc-manpages.patch} |  24 +--
 ...ipt-Avoid-generating-nested-main-fun.patch |  30 ----
 ....c-Avoid-nss-function-conflicts-with.patch |  96 ------------
 ...001-waf-add-support-of-cross_compile.patch |  62 --------
 ...t-target-module-while-cross-compile.patch} |   8 +-
 ...ve-__thread-variable-to-global-scope.patch |  58 -------
 ...-Add-config-option-without-valgrind.patch} |  12 +-
 ...ions-to-configure-the-use-of-libbsd.patch} |  45 +++---
 ...5-samba-build-dnsserver_common-code.patch} |  13 +-
 ...tch => 0006-samba-defeat-iconv-test.patch} |  20 ++-
 ...e_system_gnutls-disable-check-gnutls.patch |  39 +++++
 ...cript-disable-check-fcntl-F_OWNER_EX.patch |  79 ++++++++++
 .../samba/samba/CVE-2020-14318.patch          | 142 ------------------
 .../samba/samba/CVE-2020-14383.patch          | 112 --------------
 .../samba/samba/glibc_only.patch              |  28 ----
 ... samba-fix-musl-lib-without-innetgr.patch} |   0
 .../recipes-connectivity/samba/samba/smb.conf |  40 ++---
 .../samba/samba/smb_conf-4.7.0.patch          |  28 ----
 ...wscript-disable-check-fcntl-RW_HINTS.patch |  92 ++++++++++++
 .../{samba_4.10.18.bb => samba_4.14.4.bb}     |  66 ++++----
 ...t-target-module-while-cross-compile.patch} |  12 +-
 ...001-waf-add-support-of-cross_compile.patch |  62 --------
 ...-Add-configure-options-for-packages.patch} |  38 ++---
 ...> 0003-avoid-openldap-unless-wanted.patch} |  13 +-
 ...bldb-fix-musl-libc-unkown-type-error.patch |  31 ----
 .../{libldb_1.5.8.bb => libldb_2.3.0.bb}      |  12 +-
 .../perl/libparse-yapp-perl_1.21.bb           |  21 +++
 27 files changed, 382 insertions(+), 801 deletions(-)
 rename meta-networking/recipes-connectivity/samba/samba/{16-do-not-check-xsltproc-manpages.patch => 0001-Don-t-check-xsltproc-manpages.patch} (77%)
 delete mode 100644 meta-networking/recipes-connectivity/samba/samba/0001-lib-replace-wscript-Avoid-generating-nested-main-fun.patch
 delete mode 100644 meta-networking/recipes-connectivity/samba/samba/0001-nsswitch-nsstest.c-Avoid-nss-function-conflicts-with.patch
 delete mode 100644 meta-networking/recipes-connectivity/samba/samba/0001-waf-add-support-of-cross_compile.patch
 rename meta-networking/{recipes-support/libldb/libldb/do-not-import-target-module-while-cross-compile.patch => recipes-connectivity/samba/samba/0002-do-not-import-target-module-while-cross-compile.patch} (94%)
 delete mode 100644 meta-networking/recipes-connectivity/samba/samba/0002-util_sec.c-Move-__thread-variable-to-global-scope.patch
 rename meta-networking/recipes-connectivity/samba/samba/{21-add-config-option-without-valgrind.patch => 0003-Add-config-option-without-valgrind.patch} (88%)
 rename meta-networking/recipes-connectivity/samba/samba/{0001-Add-options-to-configure-the-use-of-libbsd.patch => 0004-Add-options-to-configure-the-use-of-libbsd.patch} (76%)
 rename meta-networking/recipes-connectivity/samba/samba/{dnsserver-4.7.0.patch => 0005-samba-build-dnsserver_common-code.patch} (55%)
 rename meta-networking/recipes-connectivity/samba/samba/{iconv-4.7.0.patch => 0006-samba-defeat-iconv-test.patch} (52%)
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/0007-wscript_configure_system_gnutls-disable-check-gnutls.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/0008-source3-wscript-disable-check-fcntl-F_OWNER_EX.patch
 delete mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2020-14318.patch
 delete mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-2020-14383.patch
 delete mode 100644 meta-networking/recipes-connectivity/samba/samba/glibc_only.patch
 rename meta-networking/recipes-connectivity/samba/samba/{0001-samba-fix-musl-lib-without-innetgr.patch => samba-fix-musl-lib-without-innetgr.patch} (100%)
 delete mode 100644 meta-networking/recipes-connectivity/samba/samba/smb_conf-4.7.0.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/source3-wscript-disable-check-fcntl-RW_HINTS.patch
 rename meta-networking/recipes-connectivity/samba/{samba_4.10.18.bb => samba_4.14.4.bb} (85%)
 rename meta-networking/{recipes-connectivity/samba/samba/20-do-not-import-target-module-while-cross-compile.patch => recipes-support/libldb/libldb/0001-do-not-import-target-module-while-cross-compile.patch} (90%)
 delete mode 100644 meta-networking/recipes-support/libldb/libldb/0001-waf-add-support-of-cross_compile.patch
 rename meta-networking/recipes-support/libldb/libldb/{options-1.5.4.patch => 0002-ldb-Add-configure-options-for-packages.patch} (90%)
 rename meta-networking/recipes-support/libldb/libldb/{avoid-openldap-unless-wanted.patch => 0003-avoid-openldap-unless-wanted.patch} (68%)
 delete mode 100644 meta-networking/recipes-support/libldb/libldb/libldb-fix-musl-libc-unkown-type-error.patch
 rename meta-networking/recipes-support/libldb/{libldb_1.5.8.bb => libldb_2.3.0.bb} (85%)
 create mode 100644 meta-oe/recipes-devtools/perl/libparse-yapp-perl_1.21.bb

-- 
2.25.1

