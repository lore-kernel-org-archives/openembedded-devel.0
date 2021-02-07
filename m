Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.80])
 by mx.groups.io with SMTP id smtpd.web10.18320.1612690757846155485
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Feb 2021 01:39:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Hlod3JVD;
 spf=pass (domain: windriver.com, ip: 40.107.244.80, mailfrom: hongxu.jia@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MP5O8bzc3D1YF1h924MbNWvgFy0XufZrZ1qNfGrxMWJVJKNFw9+zix6zyfl5WZTDhdVodgGB7z9tDwK2y/FWGPRTRrq1LC+huWBMFHmJMfxUDCYg8MxiS08c57REAbZ9n25Ye7fVD5EPFrYV9C6FegL15VhWM6dSMILy1WoZp7jUWkmk0X6JtUDk2R8vjXO9JpR8j10ZfVjnYJXaV/qvNVyVqn8F7KrLaYTrnvdzg/QCv53gFwoRNIr17nny/AGOE+b9JNjyxjP7FjJXB7T25/OUSHAuw9Ld7r17nYmsHRpa6ilBd/XESQnLBfR5cpGbt/yZXdLlV+UJfzv5ME1nAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C0A9ohJmEJqaE2jWXt/UyKqRTsIP2r5ISm4sk23K+fc=;
 b=gRav5VpcLmbTXfQFxUWzNWZy5NSQOlTTobsWxiYPZ4Q5fgUj7as6ZWvsPnjkcGYwHyNPfzUjuwSftKSBm/EUKTSZebBok8RNaPxBkQGfeGh3HkI/xDsfcFi+SkQvZG0ndy/DMy/IkyyoLzJ6gbUmuTKKwyvWRtU1ONrL41ApGKJQwCq6DBB+BQGY6xYwj67SMilLaoT/cNCfot6qZcPJUM/8cimAPJjYtfM77H7LFFhie2Hb7PcvojKetrBZ8NQwbgLzPT29U+F78rYpnpPQiAkr59PJEfC7qNXy3Ns4ouHL2eZSB2gMC++Cf4cjWg3dosJ1X1YroEbz2Go1DqQW2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C0A9ohJmEJqaE2jWXt/UyKqRTsIP2r5ISm4sk23K+fc=;
 b=Hlod3JVDTPFcRRp0KWKdP4cKm9XjzEpTyLaNHm7+6UKrvGi3rrN7kDjwQ1KvZDsdeTHChbGh9l5H9oWB5Li/Ck/IF6VSA61EvtM51A88z/MEO6ZpUazBqie5W2VkEGO90iSz9FOj0hao1QLw1qaZwbQvWwYVZcHi0/Vswx+h3g8=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from DM6PR11MB4380.namprd11.prod.outlook.com (2603:10b6:5:14e::20)
 by DM5PR11MB1770.namprd11.prod.outlook.com (2603:10b6:3:10d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.30; Sun, 7 Feb
 2021 09:39:14 +0000
Received: from DM6PR11MB4380.namprd11.prod.outlook.com
 ([fe80::a500:2ae3:a6c4:bc13]) by DM6PR11MB4380.namprd11.prod.outlook.com
 ([fe80::a500:2ae3:a6c4:bc13%4]) with mapi id 15.20.3825.020; Sun, 7 Feb 2021
 09:39:13 +0000
From: "hongxu" <hongxu.jia@windriver.com>
To: raj.khem@gmail.com
CC: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH V2] openldap: fix build failure with autoconf 2.71
Date: Sun,  7 Feb 2021 17:38:59 +0800
Message-ID: <20210207093859.35756-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <1660CF0D66423C8D.32361@lists.openembedded.org>
References: <1660CF0D66423C8D.32361@lists.openembedded.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR02CA0160.apcprd02.prod.outlook.com
 (2603:1096:201:1f::20) To DM6PR11MB4380.namprd11.prod.outlook.com
 (2603:10b6:5:14e::20)
Return-Path: hongxu.jia@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpggp1.wrs.com (60.247.85.82) by HK2PR02CA0160.apcprd02.prod.outlook.com (2603:1096:201:1f::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19 via Frontend Transport; Sun, 7 Feb 2021 09:39:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 445597aa-a7b3-4b2d-5dc3-08d8cb4c3aa7
X-MS-TrafficTypeDiagnostic: DM5PR11MB1770:
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB177078A74206617329751AC594B09@DM5PR11MB1770.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	o4dZixvLpbvRUONgVj0haKk8P8ep5iR5g1U0nhZxMGjW5g26k/s5eruY0+EjzRTPUQSiNwSMMxqBIarqsMIqaUFIdRTiBKjdms0WKZYJpoEiX/8xvDhTUWEiR4e949Lh5ZBrGiFYV8qxnh/YG5KUtXZgRcdiqUb4NHpHIeorY2rER+ZVHeoYZ5MVuuZPqpeyvZzAofzQH/6ntiXLRQeJXvolxDOPGnoFOg+LwqAZ0lQFtrQdfqBkuU6DQv9Th05ukJRd477kFeJaQoLNCYS0FKfCGf4psS62RPluUez2NsJBLvQipgxlgPzdWyby32S9EfJcjBY5XFO9bXCl3kR83OGgjW3V26ATO17BsVtObG4PGwbrfJcWrW8FmZ65yxanCg8thNtQwrMGnX9NQ3gWGa/cRKi8yy74D04S3UlNuh9Uv+orJi2BUXp6neTctkc5i6cyZXZQANKes6RkZDN7AfaS6SpDOcp3fqIpmOFbgk6GVDeBtTXY1OR47wIvkq5b6NdblXYbinIGDZTtQi64tw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4380.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39830400003)(376002)(396003)(366004)(346002)(136003)(6486002)(8936002)(36756003)(6916009)(44832011)(86362001)(2906002)(16526019)(52116002)(1076003)(8676002)(186003)(26005)(6666004)(316002)(478600001)(83380400001)(66476007)(66946007)(66556008)(5660300002)(6506007)(6512007)(956004)(2616005)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?c9UWpP8F+B7pUHQP8T+7BZ1Q7/9MJ1RceAjpSteAu6my3tvSxULBbTSQ3sN9?=
 =?us-ascii?Q?4E9medArFRWDACBpY63mYuT2Yb8zQh3MKbCKaPYLzR2MGSMbMHG7FoP6wB0n?=
 =?us-ascii?Q?e7v11s+Qy2D2W6JY0jSekKdN7igFoeCte+8iLPs4S8lehofYN1WJYtkT1i29?=
 =?us-ascii?Q?VCiKwW+cYLnRckoV6q9aCoPvRuNlyw7vMnCk32R6ePf5eY+tlUnyI9xY/Q0L?=
 =?us-ascii?Q?/j6Asz1clry7CPe50eSbxloAHIrsaVp0wdKOZkt0s5Jg4lmHHORVLdO7bg2P?=
 =?us-ascii?Q?TaWz8LY/5FmNegXJa3sy8k0iTlxSj7wRD0HgWoBFsBRSVOC024xXmfzF/g/J?=
 =?us-ascii?Q?+C5Xz7GbrB5WdCiDW/2DQrI6b1C575EtdYDHqyEZh7Ges+hacqg5wugTyoP3?=
 =?us-ascii?Q?fDUnu7iuirgZXOf2Tltb9lB3XtO6qS3fcG3SXWQnVytsr6Ajp61Zh61AThDu?=
 =?us-ascii?Q?J9IXSkjGWTKqF6gvyeFxg0S+M6dZQJ+38CNfPXJcW8V/x4mf9pYy/n9PYRip?=
 =?us-ascii?Q?Qv3bQja4zCVFecu74r56tKV4RKujim1GU7CliLDXDfQjg7ch1S+co+C26cMV?=
 =?us-ascii?Q?rLa2axC7weXQyldP7BDb2OFQPcDAX2slsi3H7TNe3KmIP5wQlTeeqynRSYxj?=
 =?us-ascii?Q?ygOeRAmULctvotmgmDuJQzJQtXgG78A6AZD3TxVfBGa/Mo8c/7hWTcFuJUFh?=
 =?us-ascii?Q?N4clFXggGZtItEe8VWtZGy/xx/N8V3XG5s/wNZOBeq+lzWWIkjhxW5rlNAdh?=
 =?us-ascii?Q?KzVsW+sdxzHrT/IOQTUL5ZBN3hOusxposrmgVAq7u6t+2hZj5rP2aanjaoaR?=
 =?us-ascii?Q?nuDOEQrMO/bruPJF4l6yYvgOPuodoZZx8ysZbpNfAFAyYjSXrtFLvv1Grx65?=
 =?us-ascii?Q?BP2mT1SxzaQjF/moQDk9W/ERDYzUxvMJKCtdbgbef9b0TueIOcEMwLKuIWXF?=
 =?us-ascii?Q?1gMd6UqYErgBLqzHUrYQUXuF6XN5T0q/Ei3GEGaKjaLSvBBss5NrZJw4wBki?=
 =?us-ascii?Q?CsO48snDxHO1nvfDRDkgSGMYqI97nW5wtqUuzuL1C6dCUi3Ne3Q/8OQXUz3f?=
 =?us-ascii?Q?CuBlFoyu6iGUvnGRzzx+Ts4wmZLYZWllcoxbUZxVnlelp2Bf3nK3y95wfHu6?=
 =?us-ascii?Q?KSVuxUy8eINJ5Tmka5eNuBM9lODlgZGIL8PKaTDLBJXwy04xblCyBjo8zJ8g?=
 =?us-ascii?Q?kzTU9AUWUaoAvYXpT/rvw47AcxQCHueco0pLBsyfVFHTManiUo1kaWsadDvi?=
 =?us-ascii?Q?cOoZi0ewoMJWqfKqFc2nPaaz4ILR+ZVgAK7ndgG81WnfO/siYEcltaus2H42?=
 =?us-ascii?Q?26oAUxx/1dqE5WhbpNZY5KHD?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 445597aa-a7b3-4b2d-5dc3-08d8cb4c3aa7
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4380.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2021 09:39:13.9102
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ch4enjcxzZQsLaesBtiti8gmV03sj+sGceusmaUcxYdY+g6Z39+9Yv5JR3s9w929U3eRVoURy6Mvpzg79z6SeambjRY66Dvgfn4NaZfKA2Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1770
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

The do_configure failed with autoconf 2.71
...
configure: error: cannot find required auxiliary files: compile missing
...

Run libtoolize with option --install to copy missing auxiliary files
and manually copy the others could workaround the failure

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-support/openldap/openldap_2.4.57.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.57.bb b/meta-oe/=
recipes-support/openldap/openldap_2.4.57.bb
index a282523a3..b2a766614 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.4.57.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.4.57.bb
@@ -151,10 +151,12 @@ CPPFLAGS_append =3D " -D_GNU_SOURCE -DURANDOM_DEVICE=
=3D\'/dev/urandom\' -fPIC"
 LDFLAGS_append =3D " -pthread"
=20
 do_configure() {
-    cp ${STAGING_DATADIR_NATIVE}/libtool/build-aux/ltmain.sh ${S}/build
     rm -f ${S}/libtool
     aclocal
-    libtoolize --force --copy
+    libtoolize --force --copy --install
+    for f in compile missing; do
+        cp ${STAGING_DATADIR_NATIVE}/libtool/build-aux/$f ${S}/build
+    done
     gnu-configize
     autoconf
     oe_runconf
--=20
2.27.0

