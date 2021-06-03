Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.448.1622734266573661355
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Jun 2021 08:31:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=DziYgYxp;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=178868c7c5=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 153FDuC6017157
	for <openembedded-devel@lists.openembedded.org>; Thu, 3 Jun 2021 08:31:06 -0700
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1anam02lp2042.outbound.protection.outlook.com [104.47.57.42])
	by mx0a-0064b401.pphosted.com with ESMTP id 38xd5c0w2b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 03 Jun 2021 08:31:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iF0S/NTnhjxz0jB+4mbMHEoiqagneKnAwSnXrPkto/3cU1kSrTBePsvEkfKd9Hn1Oo4L9N7T/0r+YgzsJlqqWAmppvRUJ8HrYWYyEd6JkUurbMaogcmbZauQD/HTQrNC8cUw+CXDUjKqVpOHxh4HBQcummoNqTdf02zTfmxcghnAEt+ZudAql2yINuieDL5cFbdMNw30KQafsDpYKwvM8PiL5uVusBvzGNir2b7z+80vrhPtVP+o7Ax741QGLYiRgMDAccXquRB2vipbSjIBA4xkjXW5LoCklgMeJh9kQFDAB4kvmu1AtA6Emqxz4Cn9tbCuoC3l6ojMfxddu6CfMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OWOLAHZvLLJrHM7pcXu01vw9BE/F6sfaJ3rXzp2Uw/E=;
 b=nG7zTT35KGL6Ry3lrBBm1bckjpMoI5T4X3W5nhm8dgoGys5k2Uu5k5EhjHBpS3fwDUZU3AfEQptrn5SJM+zW3NVihyDCEbH3GR1AgdF5taFGimEvt5A3wGSZ6/4A9VRPtVXIPkhbbgLcvHXnYphV+MdnNg3Wm3OUW7p1JG4zmL/8gkWiIdsBEBlfFeK7hxk3pplzwd9PZk0NLzJY2fEs5UZ5iUAhaXdDe5CSb6+/OFdCwRZ0m5+CPwgTnEC86uyOZxP0PZCHp655faDwQvr7UEaupWE0pIWXojlPRHp/umzi/l0asMYQ4SsrB6/7eIJACKOKYpnVceF75zqTvzH4bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OWOLAHZvLLJrHM7pcXu01vw9BE/F6sfaJ3rXzp2Uw/E=;
 b=DziYgYxpbPWhPBCHC3+ZcY14+qzt1Og1byyvFnMwH35S6f6hID+gDSgdbz6xod3K5UUzK+ytkJijip6R6F5JJB891gPnBEzg0y8yLXlKJbyAaERMqYK8uslvsY9yQFz6ppsJO+iGaib63sQuhs3E4qLfXwmoF7c7H5S7PAEW4zI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3479.namprd11.prod.outlook.com (2603:10b6:a03:1e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.29; Thu, 3 Jun
 2021 15:31:03 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::b5ac:be57:85a9:f240]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::b5ac:be57:85a9:f240%3]) with mapi id 15.20.4173.030; Thu, 3 Jun 2021
 15:31:03 +0000
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 2/2] nftables: upgrade 0.9.8 -> 0.9.9
Date: Thu,  3 Jun 2021 11:30:55 -0400
Message-Id: <20210603153055.4118106-2-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603153055.4118106-1-trevor.gamblin@windriver.com>
References: <20210603153055.4118106-1-trevor.gamblin@windriver.com>
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: BY5PR17CA0025.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::38) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-tgamblin-fedora2.wrs.com (128.224.252.2) by BY5PR17CA0025.namprd17.prod.outlook.com (2603:10b6:a03:1b8::38) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22 via Frontend Transport; Thu, 3 Jun 2021 15:31:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: defb0358-129a-4332-af1c-08d926a498ec
X-MS-TrafficTypeDiagnostic: BYAPR11MB3479:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3479E26AC3D83D8E1154054F9F3C9@BYAPR11MB3479.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:421;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	G9uBL2rvffqulDAqqvbIu+LE4trvGeKRNzHwC4UMTH4NndD2A5JaJjBTNAI3dq1vjB1d5Uppsw4k2iEpHeD0oqBKntqiMiDkjoAX3XxT84odPbdbOhTx4vQMNoDoeFfHVM1zRAvtkqGMZ7zTKiy4oK7R36iEVrRRu0DZLONb+McBfgbPZSdgsc36Z4FAGSB3mgptqrADNp3Yu0T48sSOmDXcNoYCKy8dNe6Ue4Vq7Is0kH126vqz9PcJ5KTmir2wmCWFrTFzFMmXFBK3nSCm8BOFUIwjrzCKfnmz3ITbMVhimezMfHyBpyYysAwwcwmuXgD2zLZH/zkA8XbuTtPJ7YvW8jXtxi1og3JU9ZXcmi8qS2Rm+zrCQ3Tpm8krD5ha8PhIRnq3SS0FFToROwI9B6ajzyd/D5op1Mxz++aBLfBTK4x/ZxxUlbMI1ellJ5MSKTSUp3QVm5i7SOuywrp8nY8hVO23oojZdzAxWrEthfozWsxq03gTVkDYFKP+o7BUlefQ61CAHXqyOsZBl1LJ35mYtxENduyXU+sVWACg/S3PsFF2U+gUtzymhpgrzAwM30BNQluww2h6Yl4pZlHEh2W7ZTPWC4EOOrYHiGqUqmQ6H4OlLJUmO41QPD0RALkAMfTWqKBSuGVfU3aKrCUvrCwtYtyT6ke3QkqcCytaHSg+o1jYobVZr+RnIs9ArA7CGsjskdk8yyD78eH7+RY0CziPRTJADAJ/a7BoaO/fxkvpdXWBpvN0tP+uuVzMoNbIpvCEptFjfK3QLqhL1z3DiA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39840400004)(396003)(346002)(366004)(136003)(5660300002)(86362001)(38100700002)(316002)(2616005)(44832011)(956004)(478600001)(1076003)(6486002)(26005)(36756003)(52116002)(83380400001)(66476007)(186003)(16526019)(6666004)(6512007)(8676002)(6506007)(6916009)(38350700002)(2906002)(8936002)(66946007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?UXVeHgPC5VzGayO+k20MTq1akJCUGgYYNsJoMR4jXfMb5XfxBeqxpNd2+4tg?=
 =?us-ascii?Q?wHgQgv564od45+eiScR5atSBcq21ZXbC+XHanQfonbXks4YS3V1f7gEcC7Iw?=
 =?us-ascii?Q?x6kEaqZZ/sE/3c9guRZBSvOCb6NaLvCqklpyvbrOtfWT3ZWLO1KeEClXMGuU?=
 =?us-ascii?Q?8RlD3U50vc6zhQbdwE/j0GJdoxwWbK93EolvxmWLQYP+p5NoZYYllMwiJGCv?=
 =?us-ascii?Q?Gg6P/d1Ip0g6GH07nb96DI76NibwMwyt7xc06lxeq8wPOhqVoz86hdLgmp8L?=
 =?us-ascii?Q?PpJF70WFbQgIZ5tAFZXIkKGF7niwQAjz0nCamPp29S17toTHvcWM/WyAl3vR?=
 =?us-ascii?Q?st2qdxE8YizdHvFjh2qOSYsPW87aaYI8HgnwstpOuhBdzhi3lzoDPXO/wLST?=
 =?us-ascii?Q?llDuOF5y6zu8w5A6jkz+mQ8nM9LOGfAF1hyX23Xf7vPrD692sGRtfeTbgyYj?=
 =?us-ascii?Q?I9E+uU3ANlNFyAlOZwgNYVT6eSQPUeiEWZXuPSdJzV29ggn15yTA71Iv/e87?=
 =?us-ascii?Q?8cN6yVOvWT3FcIyc5fO+g58DWwpGpPADNoVKgso/X9PWm4M7rm6QiurkNL4d?=
 =?us-ascii?Q?Mi2/GqQ2xtKFDBAA0Ahvh4g/nJiiSSKpU0jdu4rX2sWLvLX/22L+E+WR2nQf?=
 =?us-ascii?Q?zQKwnZeoWMePoSexUXgZmrPzMmmQetnsbI6ArYlzqvqGKFJA4x6mN8zRxGcO?=
 =?us-ascii?Q?s8MSMmyTPM10FGEd63Lkr5hx8Oui0jVcnDRccljehUmgnBP6234rwh4qL2d8?=
 =?us-ascii?Q?UmWecPEgAm0oxpuF6fediJ9c/Yg4qnMx+R3sATya7p8ehO8aIH6gQZPyP94L?=
 =?us-ascii?Q?oTd0Vl1XbrAw7EJAQCTucgeeoLLXX2hC/cuPcIn+ogR7O2HsT4JdqmNGCWYg?=
 =?us-ascii?Q?Ox/2sgYASqKOIJDmXxrH2YDxwXNVWhCLK3EyGDgt8pO/uRi/c+M0yKqMEkIU?=
 =?us-ascii?Q?YatvGZwZV6FwOB9X2WAg/H86PUbwPn8VCV0iXkAiV9ad6FcbJxJxMQG4N0fg?=
 =?us-ascii?Q?iDEwdn9jsgK2LYixnqJY/w0/0BdBmQrY/tz4L6Apuys+gx5YN8ctvhH8Ub0a?=
 =?us-ascii?Q?PA7VDP86yCttFC85kt+TCrml0zS0Zqe5AU0vcQZ/5T0v0KV3mzb6rzJvG1wv?=
 =?us-ascii?Q?p9ILKk0iOF2L6qigVuBE2piFg6wAGCKtJ7MK8RpZZuT28CKO6EBE/RfhJDQl?=
 =?us-ascii?Q?81fShfR4y8OCXh5kXf0muExoK2CzxYLK2aklyIinwnpjkQmBPUpiRrySeoQV?=
 =?us-ascii?Q?1m5truhnkN1Qxm+/R1fujDFrKbz4KCb3TF+PqgU/fIGDFfSZRac0Enevf0cc?=
 =?us-ascii?Q?iQoj8OIYnBmU+gtiJx3TxEjg?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: defb0358-129a-4332-af1c-08d926a498ec
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2021 15:31:03.3744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6N15loMTiOijjP1rkfAvtKnRQcDn+5/ZOSCiF0EQZNPd65LTxEzMyLy/GQ7Qh2yItGtkBzINUjUEs5ZgNkQBbFkCiBZr+f3VVisATwh/lmQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3479
X-Proofpoint-ORIG-GUID: z-H6Zi8CMJFc7rG2iloyh_ydFrG8-Xu_
X-Proofpoint-GUID: z-H6Zi8CMJFc7rG2iloyh_ydFrG8-Xu_
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-06-03_09:2021-06-03,2021-06-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 lowpriorityscore=0 mlxlogscore=999
 phishscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106030103
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../nftables/{nftables_0.9.8.bb => nftables_0.9.9.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-filter/nftables/{nftables_0.9.8.bb => nftables_0.9.9.bb} (93%)

diff --git a/meta-networking/recipes-filter/nftables/nftables_0.9.8.bb b/meta-networking/recipes-filter/nftables/nftables_0.9.9.bb
similarity index 93%
rename from meta-networking/recipes-filter/nftables/nftables_0.9.8.bb
rename to meta-networking/recipes-filter/nftables/nftables_0.9.9.bb
index 6990ae3ae..cbe2bb399 100644
--- a/meta-networking/recipes-filter/nftables/nftables_0.9.8.bb
+++ b/meta-networking/recipes-filter/nftables/nftables_0.9.9.bb
@@ -10,7 +10,7 @@ DEPENDS = "libmnl libnftnl bison-native \
 UPSTREAM_CHECK_REGEX = "nftables-(?P<pver>\d+(\.\d+){2,}).tar.bz2"
 
 SRC_URI = "http://www.netfilter.org/projects/nftables/files/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "60fc004656dae4fefc4901c939c9d64120b4dedb49738e420a9a34989f108fe4"
+SRC_URI[sha256sum] = "76ef2dc7fd0d79031a8369487739a217ca83996b3a746cec5bda79da11e3f1b4"
 
 inherit autotools manpages pkgconfig
 
-- 
2.31.1

