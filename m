Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A240C6FD1D
	for <webhook@archiver.kernel.org>; Tue, 14 Mar 2023 11:23:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.6200.1678793002741335375
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Mar 2023 04:23:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=oiYmQtkM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=243785f51c=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32EBJWBD015792
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Mar 2023 04:23:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=ANHrWy0/zJV6qWJpRsgyR4iVpfAhlSWN+oIVJFmW31Y=;
 b=oiYmQtkMH3Bh3XzoMV8sqiuERxTyIgR8hajwsuTF8fKNhqIAAaggn3sasU/tNSVcqt5x
 UQgBxD6hpCk+b7VPxVhrIbIqESo6ARYH4pUgoDUsYYxmqpOuqqRNmiw2dCIiQugNnhei
 NI/NR9PzZZs7QGv+sf/t30NaW9nBw7JW4eHXE6GegbWZdpZrpJNekM4VVLVBNih0+y2B
 whZqv2JEnNh8fvp8/U2Y4jn1ruBxka+eRyoUsViAB1rE+GRK6+keSo8XkNYbmeZK5CPf
 RfYiH3KZKQ7CTI+/nLNfZqoLSdcpcs40HUOYBKkCI+hniNWVWUmWb2OuTycz6p3bSSoA CQ== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3p8t1r2eh5-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Mar 2023 04:23:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SDvBuC6BebC5SRwsli1fcXtjsayt8ETqAOa04FgVlCCrsZ55CfSkaHI1s8QsIiFkyraMUFbcR14r6Nvqpzn4LKR1Fr1NZq4GzVD2LWMCIfp14vLl5BsTXQGO9efN6pIinkPMdK2XvRAtUbLx2Spyo9y8MVj5iYk8vwBB6TNMHzEmqDmkOjGqL820txR1kvUaaVYgs4iGrHenbObrGUD65L4ouRDoof/f65yNL2pggRG9Qh9qhQHE1J7SvM3sJxgWYnURXeTcMwgDYlmoS+2tjq5FnynbL4RAZ6eQvS7E3Yhky7iSwImVnu86uEoR5xwe0XrztNmkMccVdgdSi3LdYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ANHrWy0/zJV6qWJpRsgyR4iVpfAhlSWN+oIVJFmW31Y=;
 b=c8x3zPXhNI/kr8QSQgElhxzB3XP9/XzsBRJcdic6+ACNZQHWLpTOE/Qn8ZTc6h1aeV5VNDzHqyx7krWmG9ySq/qEWMzOKdpt9J8SztQ+MvJYbnsyvQOTQ0KqTutNNyEMLo5Lq6ppjvgoNxvYXTV+0jwJyqfRc5jTyOU67cq3du7Jbdt3iUp1Lz0QJYlulgZeaR7NslP+HFDGw6jEgqEwyOIHPARPNiv5m9Yk7fZem2TFonVVuIejEcp9LrsecSe6Lj4CbKrDmH4+sEY2bY3wIIUn2C5AhL/y+VSWxGnr6jYh4+s2KCiU9GwZHV0+JPjaYT7VFtVU68avelcCMcrP0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by SA3PR11MB8024.namprd11.prod.outlook.com (2603:10b6:806:300::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Tue, 14 Mar
 2023 11:23:19 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::42a3:f515:f89b:4eb3]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::42a3:f515:f89b:4eb3%6]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 11:23:19 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 2/2] samba: upgrade 4.17.5 -> 4.18.0
Date: Tue, 14 Mar 2023 19:23:08 +0800
Message-Id: <20230314112308.2224997-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230314112308.2224997-1-yi.zhao@windriver.com>
References: <20230314112308.2224997-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR04CA0010.namprd04.prod.outlook.com
 (2603:10b6:a03:40::23) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|SA3PR11MB8024:EE_
X-MS-Office365-Filtering-Correlation-Id: e21ef37b-7b8f-44e3-9cab-08db247e8360
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	e/2Swbl0cWp2GgfVnU1OJZ8p38NBSC/I4k8u5iBqARy5EEP9TOGP2X2Aun5UTnjI3mXvYCxrSUIwkcVVmlBRhX0v38zDntXczqa9qjvnP+SCwewGcke66d/ICICI0tO8IgCPiofH+MNC5bJR8n/w1w9hvfpRljHgIXWHU5NEr8mi3H3Wk7rmA7QXbGND67N9gX71Pd4pLxLlzNjaiQKKBz01sO3sNN9DC8r7nifRTynycDes5jqobGyk0hhbrhayc8IG9o7VIsfHrG7MuMXaU7//lDzTr5YUPhKMyFxWvg3ri1aaiC3GD2TUWfvbjnfQ7BQYWXCmr76+oM+1sQzGRDkamSvWHxspUvmUrHuQ9WYxEIY1IIDiwusCZIyUQmMArgITOeqsktq8z2FhsMDdetELdjnH0v8+JHWLWRACw58wq7gkHYNXQgKLD4/qdhUMWKkuK2U9m+6dI79lV/1LmzsBT8XSks5AkTOd3UbzI7jUMVRtnzt2T5fSHt1BVYIkxGmXj4N2fE2b99rVd8iHdgdpcKlnMZS42kQK8FBkgT23Bz9I56kw6/+y164dXaXxzzIIujutk/GlMVRx+IlylI9F3fwR8vcxu+X7SX+QnX+BVkgyikfDkbWdo9EGK/gftHqvLqmlfykMFpj5LBDVQ2hS78/OXfvHU0OXYS4ULaF22lem4YIGrCA01lbWFXyk
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39850400004)(136003)(346002)(396003)(376002)(366004)(451199018)(86362001)(36756003)(38100700002)(38350700002)(8936002)(8676002)(66476007)(66556008)(41300700001)(478600001)(6916009)(316002)(2906002)(5660300002)(44832011)(66946007)(2616005)(83380400001)(6486002)(26005)(52116002)(6666004)(186003)(6512007)(1076003)(6506007)(966005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Uq72tEPipR5RTyO8Iv6ve6GyWXOE+UIS2RgvNwagXaA3NA1uJOugKXJWLJ1z?=
 =?us-ascii?Q?megSLRcRG8ejxq3F5bJ8IUPacrDNsUzRFjBCZ1OOyDQX1lFd/QFHHKRkyvqU?=
 =?us-ascii?Q?Vtracewxdj97brKiLjfRsr2qTvAQoqEthGbEY358TZrSxC6L9UHxHMKUrL7C?=
 =?us-ascii?Q?GeSUgyBz2mTTuQ3pJTCKodS8O4bZGgnR8UOVrt11UJB3mLjphOPwHy6AFadD?=
 =?us-ascii?Q?9FlT/AdelVbIlSitsyNSXgrjT1X8HKdmwKG38hskPwGA0r1UzXzxIXpCEif4?=
 =?us-ascii?Q?vGDP6L8w9B/f9RhLjO7phy+ULqIOB14+0c48jHA7r7r+gOSSy7PeP6deGlhV?=
 =?us-ascii?Q?JaN455Ia+fW/6Ch5si0Rph7KcvpwqXiOWDeHXjr5ggYuMvwjAVc24wdpd/PC?=
 =?us-ascii?Q?ZFXPkPufuiBkhHAUS614apcNdHejAb50qVa7s6FaXyl1zQiUt4IZTod3QAt0?=
 =?us-ascii?Q?vUX3wvKxZF/NsxgpMQg/x7G+1qV72YM1tLjytePun3XsgXkATiXlVrpOn69C?=
 =?us-ascii?Q?fbj5VO1F9i6fohypiGzUvVavzz7vKBtyAhftikaviAo2NGLOpt20ZSQCsq+T?=
 =?us-ascii?Q?PLznj3TmYbX2zGkM/qmVm84+1K4hz8mN0LSXEporywjHZrrjoJ5mCfpl3WR7?=
 =?us-ascii?Q?cGyaXYtxoetgaXgAtYmJqquC1xaKbfUIeQPEVTfYdkcGBmppU6OMard6G65h?=
 =?us-ascii?Q?wtfprsR9sCUhOIwNMrIdyIDxc3CoHFpHzU3uzyls35xB3ogQxVJsc35KbPru?=
 =?us-ascii?Q?KjbDX+aWU2/L79j41FJP2kuoUFwmqUddKIQx2MEhlZxMpFQkMQckuyiD2Lb8?=
 =?us-ascii?Q?457I1LBSXO7iyb9ZQFsKP97rLLRT9t29dsMsYpcQ91I9FZXhhDnrhaMSz+bI?=
 =?us-ascii?Q?jET67iJ+u40KYh1mb77Qmdxl/fXcDiMOmh/FuJCmDcAKr/SJRc1oyhNvvnEn?=
 =?us-ascii?Q?5zIJFqgIOS0s6M8dgCT3ja9uUgmSfFtlg20SQy2Lwk1Q3fJx4IGG5aqqURBE?=
 =?us-ascii?Q?PZZ1r7h1Jlnt+I6f2ZKww5yh6XWaxLzzGr+jHuMVRUS2dNR0peC15t/qsE2w?=
 =?us-ascii?Q?2mAEj5L0kYg5gB8V07uvqRzdRJtrfXxvmOYaTVigl8Z/M+JX9b1mucYYsJQ1?=
 =?us-ascii?Q?gKCVn+hbUfALm1Tw3wgPEOzw3hy+2W6cgJ7dtU35wcAMW7SU1WOXprZvpdW5?=
 =?us-ascii?Q?bxW7JBtKwL9qppx4GvRpFooU9cRg+NBFOByKyAPysVuOOfAQAmLMIhMAzbpu?=
 =?us-ascii?Q?5COiFeR+sxeNn7Zhd2R5tkO2YgKEdK++MdYof3McNO+pSiDFBG20zoANFkl/?=
 =?us-ascii?Q?map66xrNFXk3Agl7jdCt0jdQQBI++L2Y/Gx3tB1aiEC0DLX7VZAQWvdPEXzE?=
 =?us-ascii?Q?DYv2QiF6GBlhvH4GBlZXzVZux+iGhGnqS3AQyXluULZZwAshzuBPuZDF6RYk?=
 =?us-ascii?Q?daEpaKVz3YbUhlcFSYi45hie1GJ4XEpApeUxT4CC3oHtHRJ+Z69eOtMNsEKK?=
 =?us-ascii?Q?vIFr+LgGfLKKrXUrJdOLUYBQRXd1KymqMtz2eJnH/mzGGPLLv+afHzyp25en?=
 =?us-ascii?Q?3o6YZ51lBG3pUAbSywpZTMZsVPwqHTOeMVQaeG8Z?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e21ef37b-7b8f-44e3-9cab-08db247e8360
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 11:23:19.4651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YT7sQT1VRc0hWrGWsAX0ulWXzzsCi4oRuKK4g/mGtsUFdlYm0E0qFAqOCd/X1fAcTBEEjr2w19FtTERauGMTaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8024
X-Proofpoint-ORIG-GUID: d7l9tcoIRw44dT1l2WbjwKrnfb1UBpnc
X-Proofpoint-GUID: d7l9tcoIRw44dT1l2WbjwKrnfb1UBpnc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-14_05,2023-03-14_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 mlxlogscore=991
 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303140097
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Mar 2023 11:23:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101518

Release Notes:
https://www.samba.org/samba/history/samba-4.18.0.html

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../samba/{samba_4.17.5.bb => samba_4.18.0.bb}       | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)
 rename meta-networking/recipes-connectivity/samba/{samba_4.17.5.bb => samba_4.18.0.bb} (97%)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.17.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.18.0.bb
similarity index 97%
rename from meta-networking/recipes-connectivity/samba/samba_4.17.5.bb
rename to meta-networking/recipes-connectivity/samba/samba_4.18.0.bb
index 1548ffadc..d29c1959e 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.17.5.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.18.0.bb
@@ -32,9 +32,9 @@ SRC_URI:append:libc-musl = " \
            file://cmocka-uintptr_t.patch \
            "
 
-SRC_URI[sha256sum] = "ebb7880d474ffc09d73b5fc77bcbd657f6235910337331a9c24d7f69ca11442b"
+SRC_URI[sha256sum] = "70348656ef807be9c8be4465ca157cef4d99818e234253d2c684cc18b8408149"
 
-UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.17(\.\d+)+).tar.gz"
+UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.18(\.\d+)+).tar.gz"
 
 inherit systemd waf-samba cpan-base perlnative update-rc.d perl-version pkgconfig
 
@@ -210,8 +210,8 @@ do_install:append() {
     fi
 
     oe_runmake -C ${S}/pidl DESTDIR=${D} install_vendor
-    find ${D}${libdir}/ -type f -name "perllocal.pod" | xargs rm -f
-    rm -rf ${D}${libdir}/perl5/vendor_perl/${PERLVERSION}/${BUILD_SYS}/auto/Parse/Pidl/.packlist
+    find ${D}${libdir}/perl5/ -type f -name "perllocal.pod" -delete
+    find ${D}${libdir}/perl5/ -type f -name ".packlist" -delete
     sed -i -e '1s,#!.*perl,#!${bindir}/env perl,' ${D}${bindir}/pidl
 }
 
@@ -329,12 +329,12 @@ FILES:smbclient = "${bindir}/cifsdd \
                    ${bindir}/smbspool \
                    ${bindir}/smbtar \
                    ${bindir}/smbtree \
-                   ${libdir}/samba/smbspool_krb5_wrapper"
+                   ${libexecdir}/samba/smbspool_krb5_wrapper"
 
 FILES:${PN}-pidl = "${bindir}/pidl \
                     ${libdir}/perl5 \
                    "
-RDEPENDS:${PN}-pidl:append = " perl libparse-yapp-perl"
+RDEPENDS:${PN}-pidl += "perl perl-modules libparse-yapp-perl"
 
 RDEPENDS:${PN}-client = "\
     smbclient \
-- 
2.25.1


