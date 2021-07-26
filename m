Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.27769.1627291371011192042
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Jul 2021 02:22:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=O3ydjzpk;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2841cce70f=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 16Q8YKug029306
	for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jul 2021 09:22:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=RjiBg3Igl/Nm8XumEPmkKZU1J/XperQJImtwsGifFa4=;
 b=O3ydjzpk2GdXD4rpEz8yf42ZQPVy6E0RjfvEs9EeZmah7j2JTjA2bHnriSYKy0my7hMx
 LwOmPxsBpZ85w4XBjUi16lcEnhDPTX0gtEwmzFSbabO5E34GxRYtVJ/ggiN/Yh4CLfS+
 x+TQv26vT2c4W0YfC+kKC7vb97zzYnJxMri05V5ctHPTVN9TEwVzVUuB7Iqgy/POK0ig
 /n3dYnR77EJmpix1CyHqKNKv3sHH0wTZpIxnTCk/JHD5weTkcoxungIEbkhSbzZWA1Zb
 pJlwf2go2PtLapZjyicbGFDB/cP/jmb5OrlqcdHKA/W5dYlY492tDsqGnElk5mgm9Eby Pg== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
	by mx0a-0064b401.pphosted.com with ESMTP id 3a1417gk9f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jul 2021 09:22:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FexjkqlYYKONlO2P+JGkgfbdgNn8iSWktiu9R2Te55+XO97Bd2S82dwYFooDLoaJ/EyNaa19aVIUN56E32A3HkZtCuenF8Rq7QiObHp20loYNCTgN0vsq6KuW5CcwkBDgejUPKRnbaQV/c+k0dbZhmU7o967iuTHNr9ZvFGVeRXgqE0J5mVvnqNrTyuHya0LOAxnDHr+kfGfOh2203wfhBri+/4HhM20WDDolroybEgeMTnSlznHYT1akxCAeUONO3d43Bz5vUIBSv4zlq4gkSEr+bGYQsOMs7c7FumvmD5rqK7VRwLJZVXs0VT27gsVc1a4e6zrF27mOpd5iluo/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RjiBg3Igl/Nm8XumEPmkKZU1J/XperQJImtwsGifFa4=;
 b=QGbdGGwwQKaFzak2RkTpHwwnqGdXWeaLmgmzfdICoVNxUbOIi46BCe9rotr0JeRO1klgtslep8BaULJrw5SvprAWU+vSueRWpcQ/J0R0jEjtfGlbhqNZWvlk2UAfEimJvusQ1F6ESREJIBAY8YJD/ieUqcMk30R7Kgh+zhIJbhFiZy7LdQHPVFSJHWquaJa8iYCNMDvPgXQROS+6YyO8saz/AvOMS9GqN8XF9XSgHIghAG3IQfncu2xkOTrgQutm4gCMrLuqXl4GAfdHLz6Q/URPFx9g+O6wLqg7+niKwNcs3ICT7nI8kDKdyBXnjBxLNcm1pBh9eRlfZboLwxkOyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MW3PR11MB4698.namprd11.prod.outlook.com (2603:10b6:303:5a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.28; Mon, 26 Jul
 2021 09:22:47 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::6ca0:3d02:dcd0:626c]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::6ca0:3d02:dcd0:626c%7]) with mapi id 15.20.4352.031; Mon, 26 Jul 2021
 09:22:47 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] postfix: upgrade 3.6.1 -> 3.6.2
Date: Mon, 26 Jul 2021 17:22:33 +0800
Message-Id: <20210726092233.12922-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: SL2P216CA0046.KORP216.PROD.OUTLOOK.COM
 (2603:1096:100:1a::32) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by SL2P216CA0046.KORP216.PROD.OUTLOOK.COM (2603:1096:100:1a::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26 via Frontend Transport; Mon, 26 Jul 2021 09:22:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 48f57c20-6925-411e-9e4d-08d95016ee5d
X-MS-TrafficTypeDiagnostic: MW3PR11MB4698:
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB4698390BF3297E23A6EEFC65F9E89@MW3PR11MB4698.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:538;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	q19BMinkSgR8CefoCnFlGVWKgtu6DJptGBwtiXv1zXVEsprn3UdUy1AdwsvzNhuQoDfL5pNYSUl6it0fZhWR5sDYDBApkiHFDEI68lq++jdEljqi9c15JtZTsgEa1cIydq+4ptKVAR7TmSfSLNrvQQ5Isiuo1yClEMiuQVqrwJBANoMWbhMlpS+032AcrV9xWg47BQ8CBrOCHIEnWoem7oZ9iYgSAmuV+73NHR9Gjsyl3yF4B9wLHs4EwKuhyqSBbrnzjfXDWs9L39oeLv/H3Gp1p1qqKTKwILJmN+6Scfamlk7xt6DAZpGAq8+AjABz+bDzwPy2REqobSHqzr809WPVYyuzktnpWiMx9cRz0NNTLrlYI/Q6HuySsblquZ4QGQT9YPeIkAmBZgrotTrcE1IGdyzH99F88KdPEg/DTM3RjpuILq+H0WRuwlLlFYZTYKq4mKZjp61wlMA8kXCgT7cf6N+gvuPZidr2JV3nRWD5mSHbb/hdl9upk6KWMP0O0QgJnXPMRxGJtdNPATlR7H778r5ZWWjcyF/Xhn+O7oLZBAgKkELok9cGWLmoSiNP+kZNihLkcNZtQfCzMHejQ9YNtrqeE1SFPsrJwyhbLOzwlt9bVtYuk6VIkuaSjDXuXv3n/xCAi4hvXCIFoPeSifN7uT6B42IKfYBAmm2gBlraEsPUUA1YZ7zX8Pz/YHneDKWXHZz5enCBj1cC4a1JWjHGGzGqV22WQwTNbtjqYB+ok0EseV5o6rayk4R4CYA84TBXWiC2VOpo3v2F7FkfA8Yw/5BD+5Agmid+skgEXw0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(38100700002)(86362001)(6506007)(38350700002)(1076003)(956004)(8676002)(44832011)(66476007)(66556008)(52116002)(6666004)(2616005)(6486002)(5660300002)(6512007)(66946007)(6916009)(508600001)(36756003)(83380400001)(316002)(186003)(8936002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ze8/sZdgYKGK8Vr09cDlpbJaMZS7DsNrsUnaAUrjUuIlG7K4sO55fnd1qyRu?=
 =?us-ascii?Q?TBzgK4KeuXjmh1qasXNJylsDcT4xNFy7r0W6yjmTDSewmV7kkbkrtp40wI/i?=
 =?us-ascii?Q?fn8eCcclPpPCxvGV35sq78vCFSwsLGLCKJ3cZkvN+WlTLG9Yw76y4LIQ9YjC?=
 =?us-ascii?Q?2MftyytGMUUwPYpHKtpNENCZHyDwwV1gYSbOpwNO32AkkXM/i4eVt3584gs+?=
 =?us-ascii?Q?bZu8HRb4JmYbVRz27WrOWXljukz0bvCuzdSs6uyzUjOde6fmn+DrLZ3Ai/2B?=
 =?us-ascii?Q?+cEMV0T7lusveQyNMrnCl3HTbKOMby/2J3EYTj7bLY52ozl3liYSOE3NlvEX?=
 =?us-ascii?Q?3pCQ8aS60asJ4I2N3YUXacMxtz0wZBtbbAA9ixh7yCN7mRhEDo8lVuJchDpm?=
 =?us-ascii?Q?SLh1ukPk4EhqPAHqHB23E0sQALIM1CppKDqZyGK+QfpUdRLU1rQV/e+SaFl+?=
 =?us-ascii?Q?V1Hxt10I3Fq8QvhP8ovBEUempPxBaZeYRd4RZc9gP0LpdGeikMi4mXXidD/B?=
 =?us-ascii?Q?kmG9TaO7G+tMEGcojzIabDY2xpg7pLlj3JUXVNT6gt7kLPm7sk1gz5faYLCK?=
 =?us-ascii?Q?hpUFi3vFk7vRTzLCNqtCaUap+oKB7xSg0R5IlFBBtlTN2j+lX7hEYyQTX+oc?=
 =?us-ascii?Q?8PRDXnqgJrurCkV5dyFUkTf/dplqr9vBkYcImAj2M9rg/NjH726owD5GTMA3?=
 =?us-ascii?Q?bSP1TdcuxpWSY9UFfK8V5vivTymj9cPiB1T1NjozzlVA/dWmVnvTGkBSo3FZ?=
 =?us-ascii?Q?0cWWFqQgeu6cjXoEAoN9My3jXdEir3e+oLXSgiwV0zEv9ZCxjrkSRd4XSlAB?=
 =?us-ascii?Q?vCq/gIthwtvztNxdqza3jTjFh90DIbqnz3SdkcsV1voNC9mrlmIhs6Fv7Gsx?=
 =?us-ascii?Q?Wk3jHFNNv6s4KwwjulyMkdp8aeliWD2lRBUNMnm9/DEjfpUgFTbV8Q2pN0r0?=
 =?us-ascii?Q?2m8pmeHK11xTx+ML7YrriaQnig5VeN89V5xtvf9Sl6Qy3IAwbpyefYTATWrj?=
 =?us-ascii?Q?NEnHOljcfviOLvkM+gJ3gjV0JqqKCsVOpSK3K5NPe+3bceuNVJJ+wbUrFDbU?=
 =?us-ascii?Q?PbAyyzmfdyy6tcxvpXxpa24X5tPqABao3+QaeDgEI0eJZQ7S462MO6zIHx78?=
 =?us-ascii?Q?JqIs/4IHH1+GzOQv9DvoQ93QRHgrMCgkQzExcLFKXzMaCFT31qnvVrSahptY?=
 =?us-ascii?Q?13B5dYwUuOJt9K4nwZSYxYYrCofOj3TWfcndM5LzBctIsWC7A5oq1szwNaVq?=
 =?us-ascii?Q?kPNlFpa/Uk+kasZapzP/oWHgg8bBTpACYZYMOkQNf/GyCbtGvo/ktFxyyuS2?=
 =?us-ascii?Q?OeqYq7g0gLu4kXMEDYI+feG3?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48f57c20-6925-411e-9e4d-08d95016ee5d
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2021 09:22:47.0600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9+Wv0e0esjl82qsd1EVZVjuL2FAUvKMpFiD7/zFbzB65ezXkW7ynhC9K84B1Pyal1bERa432SO9VTfhcX7WTaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4698
X-Proofpoint-ORIG-GUID: zewsD2WBMbN07pbjXnu-4PZi8sUGBldo
X-Proofpoint-GUID: zewsD2WBMbN07pbjXnu-4PZi8sUGBldo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-07-26_05,2021-07-26_03,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 phishscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=856 impostorscore=0 clxscore=1011
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107260053
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../postfix/{postfix_3.6.1.bb => postfix_3.6.2.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-daemons/postfix/{postfix_3.6.1.bb => postfix_3.6.2.bb} (82%)

diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.6.1.bb b/meta-networking/recipes-daemons/postfix/postfix_3.6.2.bb
similarity index 82%
rename from meta-networking/recipes-daemons/postfix/postfix_3.6.1.bb
rename to meta-networking/recipes-daemons/postfix/postfix_3.6.2.bb
index c139f0661..982544d5c 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.6.1.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.6.2.bb
@@ -15,5 +15,5 @@ SRC_URI += "ftp://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${P
            file://0001-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch \
            file://0007-correct-signature-of-closefrom-API.patch \
            "
-SRC_URI[sha256sum] = "20a805625601e7b95989220832c8fa14ce374f0711da054188f8cec6a92fd71c"
-UPSTREAM_CHECK_REGEX = "postfix\-(?P<pver>3\.3(\.\d+)+).tar.gz"
+SRC_URI[sha256sum] = "507323d20d7b3f705f49cf8c07d437c6d8090bed07e15a3c0ec405edad54a7d4"
+UPSTREAM_CHECK_REGEX = "postfix\-(?P<pver>3\.6(\.\d+)+).tar.gz"
-- 
2.25.1

