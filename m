Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10762C46CD2
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 15:40:02 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.103968.1703691594403442102
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Dec 2023 07:39:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=B/OA71S3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0725f6c4a5=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BRERq9L021945
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 07:39:54 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=BEwFvtf/E8pyVL1wkU
	ydQTxiCzI6XJi4IfVoQv3Kifs=; b=B/OA71S3oYcjtcYkbCfl223/MGABZfd11Y
	6FE/Uxwe4FGG4m11ovSwR1yYO1DU5SUcFVfNTWdN5zCVZ+UHa8AKn7l3Os10qPi/
	/TFJr++b1aPNGWsBwC7z+dMmw2Dz1cyWp7ykekQJNC+souiET2pUNPHlARiuDb7a
	2JBcrlO6HulHVtfcyOxOChQdXR66Q1EuLWQYLYsgnJzbah8rTG86kiV+3WQncxZ7
	TFJ/Lcl0TKrjizLuEV+020UOESVUmNHfWEHhkgS/32MfqKvCIo1dCCbwkN+UToAA
	mrtLytsDp/UbD9RDqIZj32WNNONvB8IxAP43Dz6b9V//99jBwcxg==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v5uq4k5gk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 07:39:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lyk2NI/Fbkgk6pRNCF2mR4/RU2azNAe4N0zUvBW2EZJO1X7c+mfR6+99/AimwiyGjAOA3xcOI6mYAvJySvFZFxb12jy81kVNr6i4H2JXRzCgjXCgUneXNK8ATZp2ef7gjve1zoFXx4Tk27oOql2NWKFY6ie5alQ9SUXtrZs4/n0OiY0K2UuqAuDARP1aQZ0AUgVah8OfCqTty+l/jLmF6mRkwEnc814GEX634kZvy2QOmhiq+nufYJfDljnK0WH9F7pmO15bm9FeiF1ZUQDtAMYlId3v1Fs6kJ2ryxIF1AI2v53EL/rfts3/RWQWiqmZ17MA5kkdvzjAE5NqfAQBeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BEwFvtf/E8pyVL1wkUydQTxiCzI6XJi4IfVoQv3Kifs=;
 b=UBJjmoChU+c55pnKP9w7j8teyqG0ajdZx/vAcgvuIk+lVOTnnmE4IAZj7KsNq5bnK2gcvWYJgGBCL+7GWY2VLrYH9OUOGDUjAflGIMhQjbrh3Y84arkNPsjSpya3Bqr/k7tJD5wWv6jQfXkj6ckzC/7IVLU8AjcwK3RS001GQKkbdsuelfg++CB4QqQwm1CjcaL2qvBunFDKJpi1UiS3lyC0wMe0GcBhjY72bVAE6YtNuuErLwRODUXLwlj697eJCod2N5clHgPtl9jTK3mfqLNeUyF11483cSXymcRUZc/5VcgsKgTbLCMLQGjsUdxmZG5LAeRmrJ3oouSYxQ/ydw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10)
 by DM4PR11MB5344.namprd11.prod.outlook.com (2603:10b6:5:393::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.18; Wed, 27 Dec
 2023 15:39:50 +0000
Received: from DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::c56:aece:e7ef:6cb3]) by DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::c56:aece:e7ef:6cb3%3]) with mapi id 15.20.7113.029; Wed, 27 Dec 2023
 15:39:50 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] samba: upgrade 4.18.8 -> 4.18.9
Date: Wed, 27 Dec 2023 23:39:38 +0800
Message-Id: <20231227153938.3880648-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0079.apcprd02.prod.outlook.com
 (2603:1096:4:90::19) To DS0PR11MB7484.namprd11.prod.outlook.com
 (2603:10b6:8:14c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7484:EE_|DM4PR11MB5344:EE_
X-MS-Office365-Filtering-Correlation-Id: 8db17ad4-c40c-41a0-c608-08dc06f20fe1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aUR5oX/GvdBP6SYwouxu7nufIuthpE8GTkG28DwpzXhqLineF6UdMs+iM9tYWh6LexCZ9HpdbMVwulnLTGR0Shm/oVwsj6Ni3fom8h4cFBsg2rLlsIx19+wDCKqxaIxi1BaaSIrGKyn3IzKyExQu+TeIr0Z2vHQMCkwMQaLJP3e+YJtQnDv25M3nZ7eHbVjD6cNxY5C5PusHKUlmjfZmz4SmD2EbA+m0vQrXFZgBqrNHtEsj0OKBR26eXUVAjtoITU0aDbL0fJiGQwHtMbdJjiRDeo9444WCxngkmmxaOLq9+Pv6oKJgq0I92Y68HnQfrT4DWlma/IP6CyQb/atP/c43RpXkE5AEsxBMSCpe9HP68RL/H+jUbt9e13qDSAF9aDGZmqmW2jxGvl0DEH0tO6uVvbfBSUcP1MtXfVQgzZGDqjyDAciH3w3SM7izPKcXPD0g4eaFL+MvaizBeYmDzs7Q3N/G6SGrhUklFxJ+3NG3Wob/KkiyOTi97/rbfg3uswkUIT45EAWACARG55YVKnCMJ7la5wSMEdWnzMDO6z4zqC9YImg5QcMZsT/hUtf8o+B8pkoypg9oPCkAEwIu1rzD8S9z52M+fDrYLN6OkIk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7484.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(376002)(136003)(396003)(346002)(366004)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(316002)(8936002)(8676002)(6666004)(36756003)(478600001)(6486002)(966005)(86362001)(2616005)(6506007)(26005)(6512007)(1076003)(52116002)(38100700002)(83380400001)(38350700005)(41300700001)(6916009)(66476007)(66946007)(44832011)(5660300002)(2906002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Civ7lBsuCEvkYC1F2WmYXcwZS7yDJke49iygHiCq5+wopElP+zSrlLdtFooR?=
 =?us-ascii?Q?rjppPiANDM9TD9jybPJpBE3LBgsWYFWSqvORCNu4POJMCvfcXt5Hu0nF0CGN?=
 =?us-ascii?Q?T8JJe4m4vv4E53X2t/qYutx+s4FtgdWAtynzJl+v9W1KOQmRQdtobeLMO1OM?=
 =?us-ascii?Q?1M0Rz04K+nWtH9nCpeNbgrA4pSzw4rotyPB5nFAY83SGzSHLT8jXd+s6dC+g?=
 =?us-ascii?Q?zyTw360o5nwQN9fsuNKXjaBQAZxL5gHgq807RaClVQInyTicS8f3rnlojajO?=
 =?us-ascii?Q?ZiLciZ+A8KivZXFIlNuEx/kG1Zm1Te/RpN++NApnzBM83lslIbr8Rrd1NZJ1?=
 =?us-ascii?Q?Cn4rke6U57R3TpbF2INy2sELHY3RlNVZLRZxplwc3DsfXkr58E9KhdsN1BMU?=
 =?us-ascii?Q?JsWbYG+5hj1oCMGMD/17PdOSxAW6ze1C1vRuEyNOwmzhxe8YPMPU3DyzE5B1?=
 =?us-ascii?Q?1Qf05hcoOVXaEfnol6QIx05Ktywkv1zcHvviQb9B9GFdLsjUbHTHYOyvkN+w?=
 =?us-ascii?Q?Aw+YrfKXXfLeciUNmcvmpL4aABaS5q7yMS9Fkr1SrGFCbGrla7nwluQyBptk?=
 =?us-ascii?Q?qWk8jPZ/bXDWpN6zJGxNWPonyhxcB0wL92J61wlab2hpPiZoiahsfIXRq54D?=
 =?us-ascii?Q?MQxVetOOMcRFU4mEWfz55ymM0dR3v1rXtdz4GadVlJYu8fn1HTwgN6ZAc//c?=
 =?us-ascii?Q?IxR4kTiAMQgc+AwkD/HVtjCyjSPBqsV9GGtckPUqDvPhlJg1W8WF6AWEIo45?=
 =?us-ascii?Q?S02bxDJcZWW35RlVLHU9dtjZDOi7PoBvNdrl4OoQmofoKePXZ0TWCLka3kHV?=
 =?us-ascii?Q?k/7zWlczR6MkDx3FU0l0Nx4IvR8H/ou1WQLjF0HvA7tfm0FI3XSX+f0Er7mQ?=
 =?us-ascii?Q?xUWzj+SbazkXro4shnOzlImxOACEBuP2qpT1EnfFHgWuILyGd4wmA7bI78I7?=
 =?us-ascii?Q?wIIkufK2ipBocuD/16DL9FCV0rI4wZ5EaiXlzOoUNslVS8+oJA/qgpbiPZW+?=
 =?us-ascii?Q?zu0q8OfZdqIzSjN/DuvzUIxXIi42pLQ1Pvvap8iyMaz0POd7zK20WoVZW4KW?=
 =?us-ascii?Q?iVx/wHob4aI2W9F9tEvq1qQiiWb8fCRP0EihFqw+IvTZP4kK/wEs1UuF7Ytz?=
 =?us-ascii?Q?xROfErywPpF6kNFkYd7wD6+rmp6sp0ceuHOuVn3t4sqBJfL/7IvuhYpYg43g?=
 =?us-ascii?Q?Z8DxHvrzqj3FH36895KAxsckt3tf0nD3dzD1hw0cZcjKhIk0eNVrjWGQVd9Y?=
 =?us-ascii?Q?JWJaX6H4r/mYk0HnNNST3EvY+ejmuLt/s2dmSkhcd/uhxmmlNSA0i87jG00C?=
 =?us-ascii?Q?2lnREsMLvmIhD37dadUxLd1LskBJMpd9mItFsCWILd4v1i+2ks1zBKIRQp98?=
 =?us-ascii?Q?dNDCAcJIdp4ihWsdG4YRfUOyQj2GyK0qFEYntuDtfTFIlda6Z+BooMtUXffN?=
 =?us-ascii?Q?m9r6NSDMgGmcGpMdf3A8AeWYnMp0O0eBBLO4SXY3ZjrV3Vy1Tf3TA2ifMBGm?=
 =?us-ascii?Q?f7TKTtVIaoV54JyV0XTB9wObYHGL2LoZ/0zwB7m7eNEIUqlTV/0JIf23Ervj?=
 =?us-ascii?Q?Vxv5Ki0EO/Xd6nW6Fp/tMsV4wA96bQGpQjyOSFNz?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8db17ad4-c40c-41a0-c608-08dc06f20fe1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7484.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2023 15:39:50.0000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rHIGDDVe40tvEvBEhnZADurAqBaw6QRKVaSmwvSj4p1lltF3HSI+CKaboRJ4VW7q3ZMoYXEbKS/LpXAMY4utYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5344
X-Proofpoint-GUID: 9VxYw06tLbG1kBHlfSfmwHBXb24xyMjF
X-Proofpoint-ORIG-GUID: 9VxYw06tLbG1kBHlfSfmwHBXb24xyMjF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 mlxlogscore=837 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312270115
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 15:40:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107867

This is the latest stable release of the Samba 4.18 release series.
It contains the security-relevant bugfix CVE-2018-14628:

    Wrong ntSecurityDescriptor values for "CN=Deleted Objects"
    allow read of object tombstones over LDAP
    (Administrator action required!)
    https://www.samba.org/samba/security/CVE-2018-14628.html

Release Notes:
https://www.samba.org/samba/history/samba-4.18.9.html

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../samba/{samba_4.18.8.bb => samba_4.18.9.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/samba/{samba_4.18.8.bb => samba_4.18.9.bb} (99%)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.18.8.bb b/meta-networking/recipes-connectivity/samba/samba_4.18.9.bb
similarity index 99%
rename from meta-networking/recipes-connectivity/samba/samba_4.18.8.bb
rename to meta-networking/recipes-connectivity/samba/samba_4.18.9.bb
index f80742640..73ceb7b75 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.18.8.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.18.9.bb
@@ -31,7 +31,7 @@ SRC_URI:append:libc-musl = " \
            file://samba-4.3.9-remove-getpwent_r.patch \
            "
 
-SRC_URI[sha256sum] = "4fb87bceaeb01d832a59046c197a044b7e8e8000581548b5d577a6cda03344d1"
+SRC_URI[sha256sum] = "f455c1d6351ed3a36fc2cb6e8ab1bfd0effe54a56686ffd495d64ab52d50f245"
 
 UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.18(\.\d+)+).tar.gz"
 
-- 
2.25.1


