Return-Path: <zhe.he@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E24A8C352A1
	for <webhook@archiver.kernel.org>; Wed,  7 Dec 2022 11:40:50 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.13192.1670413250284861259
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Dec 2022 03:40:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=eDo0zgPq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=93402ee8fe=zhe.he@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B7BYKR2025979
	for <openembedded-devel@lists.openembedded.org>; Wed, 7 Dec 2022 03:40:50 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-type : mime-version; s=PPS06212021;
 bh=jvyRHP2rLT+lGcmrcjl5oQ6Qfwqac88kdmUNZLsbmxk=;
 b=eDo0zgPqtWo399a43n1I0boK5t9ClDnWxXugSbcRvBSGgL72ttu9XY3cx/BrDz6ZYNL3
 2ALSn7p46QyHtdKrfdHbajwAMlfmPYwVDhSv5kMGL79DvCVsUXm35duIZFE++lxCX9ns
 j9KQ7wWahFLRgG9jJRM5Fy6OpssQ0oLolBcCXkv6Sf6Vos35unyT/BMJ6Nrv+1JlU/5A
 3W05uAj0QviVVM+wgio983AXVFpkPEfdFV9FhJUY+tcNqkUP9MaZvO429lEvtul6L9d1
 6+0MMZ8x9dDlipPX+fJGZI96cdXNPDtjmviMz+/qF9ELsON0c5eVeHJYAX/SZ5cSjSUv rA== 
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m82m6u8mu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 07 Dec 2022 03:40:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nKsSOIYW0GWozhK67BZN8ypkyUoIehWM/YqwhbdCgs1HPIUEHeb5hwyw+J6TxiWXikw+Gd71rubj7mGSHyEQ18nsu6NVkjS9BcwXdRkLTouJqG/l9AwT02C6IVUaHlbZhcfdyoudfVwyHgUO0xFIdiH3AWfCAs/VXMOCGWIRsQUuOwcAlEqWSmcvsM3s79lSqJUzW9gfo+kIUUTIwNnqgDHsl6CFk1+n8Ea7OpUxW9oQPMeC4WBZz7fRDsnIQrRVPGvu/4KpowqMRSHj/9HZS3g5iJIkKUpKzIAr1dtHIAL6LJ01phbHrixm5N5+x8dKrK2JeGai+1MbI7KIDRIu7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jvyRHP2rLT+lGcmrcjl5oQ6Qfwqac88kdmUNZLsbmxk=;
 b=i/64FYFRI390Vjd52WtoiRT6GpolSOoIEDdeUpsODwvHhEx5217DARn+iyo80atDyGkIRy0fEiBCzs61nLXp49Ri2pFXPot5mUOeHWJtC+8RtZaH+Wz1dFZni5ucQI0IfP7xl2UZpq/wOZpALuxMsGzFYckGgnI24f4msVWocUl3sXpvjBaqNGIbDX48odRlT0FQ4bN4QkCrh9SeEka4oNY4Nb8MCIfSkOdP3MeRRC2mHUtoGo8UzR5/ajn7yNjmyAIMnDhiaYb3PfH+bK4Zg73YKy48ksHd3ePPKEsm8jQMKBMUKlHYDBVr51TfqhtgXu5sPqLoMuFRhsd53wqSQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MWHPR11MB1358.namprd11.prod.outlook.com (2603:10b6:300:23::8)
 by SJ0PR11MB6742.namprd11.prod.outlook.com (2603:10b6:a03:47b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Wed, 7 Dec
 2022 11:40:48 +0000
Received: from MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::dfdc:1e8b:daa4:455c]) by MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::dfdc:1e8b:daa4:455c%3]) with mapi id 15.20.5880.014; Wed, 7 Dec 2022
 11:40:48 +0000
From: He Zhe <zhe.he@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][kirkstone][PATCH] python3-protobuf: upgrade 3.20.0 -> 3.20.3
Date: Wed,  7 Dec 2022 19:40:33 +0800
Message-Id: <20221207114033.28237-1-zhe.he@windriver.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0094.KORP216.PROD.OUTLOOK.COM (2603:1096:101:3::9)
 To MWHPR11MB1358.namprd11.prod.outlook.com (2603:10b6:300:23::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1358:EE_|SJ0PR11MB6742:EE_
X-MS-Office365-Filtering-Correlation-Id: b898a8e0-0568-4ac0-15f8-08dad847e2a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gFybf6oIU+zxe0lFcMS8FqYi1Z2sjdp6kXFDVvZ0ZqCVMg7i0S1KLN6hfTPamMuxZahpU/EOLiS+lmKUjIeC47Cvnkh7mJKRbheRMgoxd7gOIw8eCAnphNs0Mwf9qS2rBQzsrpBbBQ+ZX7HlA4PQ/ijso4ebjxLaAGCmMCLht3jHW3sA2xtOWSCcvpKlUPuRO44Hq6ID+j0RzRV11lycumuAighAvYg+jUVNJYdGkLj0LJlCCnKmxnxaMXWl2mRFzoGWVNzIxEMcr32tUAxotNmyYzGA+TysLBHZq3YhYHo9fMPCkK/HRZa2c5FYuS5qB9z5q655N1ltXDi7mADPFxq3RAcgI34UHMGltgqoSiv0+v1cUWOrMgmNRsGdmCtV34jy/Rm3rpAgJC99jAwG/WuChwfZY+8a93qZaZNFZxa50XEhpSjzzlzhDD0cTRiU5shsdBGEHN4btPl0Tpqq6665b8lZ6czgD+1qa1d/cWkDsSDt652vGgJcdUf7oOaQZXL0ZaNw3AlotsuJdRjqJ7S9R3aHRuYJU3N4qna3kEbhGZNouSsO1hd9lZyWvC9w6vOSj71pNhThCup0+c/hUqnoRzSccwwqv45qFhuFaMQ/jxwvFaYrJ5Uk+i/2drTg8QAWC+PcCv6dL9yTMvZgT8oxH7HajDaFOWat7ufhrxG2N5ERNCwO6yzTJ7qZwdXgxCTgCU/HHgqiksQOEyVdFoXr6x2vWJ7iJiZbiCynuG8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1358.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(346002)(39850400004)(136003)(396003)(376002)(451199015)(8936002)(83380400001)(5660300002)(41300700001)(66946007)(66476007)(66556008)(8676002)(2616005)(36756003)(38350700002)(38100700002)(2906002)(6666004)(1076003)(26005)(6512007)(86362001)(52116002)(6506007)(186003)(6486002)(316002)(478600001)(966005)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TLwgKRkQeM3r+m4dTtgBDc0SbXLILuIdIYHDb+gBGrhYBlKj5JqljTmpC7nD?=
 =?us-ascii?Q?KTaq9wHpX/Sd9NC0OvVKWvO7cZJdz1vmh1ZCxxm8j5nj4XjiGGpaMjK/Okus?=
 =?us-ascii?Q?cpHQZN0aDs5LX+yLzZ/Afdgt45JLyVaHYOY78w5pCfC6kHIJ7Y7HtxULsSZK?=
 =?us-ascii?Q?rbQL5lyoW4WWU4YPpQxIbrWZRQdJkrnaYAbnu4l3gEwrOZmRMRP1baNVd4vl?=
 =?us-ascii?Q?dtiQw3gETq5uj3vsqjiNqw/CfVSE6g6QxTf4HZyDtzaHXgE4pbnFdN05k9bL?=
 =?us-ascii?Q?/VHL271VN1DOV5HFBFfaUPgW+j9gOK4WbzMtmbepLNFNFVw+f3QHsd4hTm5f?=
 =?us-ascii?Q?ODi9xTijX0bPxVZSNjMuOJv6RsbfeoUIlxmM5veqZnorF/ckCH7II5124b2A?=
 =?us-ascii?Q?LLQkJZyXryNZhYMW7ptWtBgfA22jcuZa7lnXWVUjKj1jElZCE1Cbdub+pgdx?=
 =?us-ascii?Q?QurOF1tQWSA9G1YRn+GedatG8YHPPVx3qkPxdUmqqEd020G6fn5OO2ZYqNiW?=
 =?us-ascii?Q?xHpH1zP40jrrS80aGEp2uXZdP005T55GTv/W/KaUsYwd2b0oD+dfyzV/ehgq?=
 =?us-ascii?Q?r7E1aaFdR+nQYUau2Svlr4BpnweoZ4LqZsvx2d52zgZaQnCwY8wslRwhDvF7?=
 =?us-ascii?Q?Q7DL7Kva/cDbfLFQxj3QrGgEu6TNTHhQyCKPq4w4ywGqvvoFs1O7FxoRaNi6?=
 =?us-ascii?Q?lF1NNQN8IBzDJuVFBgPuvTTspCtmdPOkN/Y25JqYH/OT6hDqzgLlM87rGwv6?=
 =?us-ascii?Q?tBaviEjCycsPGM39QuLT1r4WqylVTkRWCEMkrMOVc8Tldlqc8nSUTrAn7uic?=
 =?us-ascii?Q?6nlB3FXGQy2HvOqKrDQX5WFSkOvpJ0sHz+QEQ+5qTxiVyZMeFqodxEAlReXc?=
 =?us-ascii?Q?Pc3jGLrN8HY4qLjURK5VjlwhSPgM/UlKCIBQPiMK269Mz/RqAULspajvSsVV?=
 =?us-ascii?Q?d0MydTBoDfYb6o2McmxA9TdUuMphFYSKhGITqzkkyHBD9Es5fVY4d0iSy1GC?=
 =?us-ascii?Q?doYZZmCdp3o7hscgxQ8/p/ft+n0GXP1CHBAW3M0Udmx5AeNG0rU4rtgRmTHK?=
 =?us-ascii?Q?EC4qOlW3GtXnlhZ1YYsk6d9kP60EmUzyqc0PIyyIdQbSU+p/JA/TGVpgHRm9?=
 =?us-ascii?Q?mYOidQCERV5oBFssc6DrJ7TkzGJnAT+2ROk9wwaCFG2zTkXNdhN2FutVpOVi?=
 =?us-ascii?Q?J6MACyypEOh3rHaN6t8Wx5x7He3Am5rY5J0Nt16WbWTlvp1JF+ji4wvg55tU?=
 =?us-ascii?Q?M5XhAjW9Q2T8/6PnBeSOXhgW8XDi8gyw7dtUvO8jHQxkPW+sRPc017oNPBCB?=
 =?us-ascii?Q?5I6u/tDgaoU78WUj4+2tbbYHTowr82VUjPjuMKzh15X5rTUA+YQP9MbIi1MS?=
 =?us-ascii?Q?aWkSGbV02vyF5yfGoQS4TWMyVjShTEYfm/7fkKhy0bPWm5JKqeUQk8qPryjA?=
 =?us-ascii?Q?A31YGdVO/het0rcOgMIpOTe6SjO9+44UCxEi9SKE/fWwjqsAzIfuS5VVVGC9?=
 =?us-ascii?Q?jmRBNwU0iZaaJ0RS8ezkdpP409ffdfoxUP7rc7i+WLYiAEx2pe9wG9SVPBiW?=
 =?us-ascii?Q?qYGXnfTS36vMxgM2uHkIzqe2AgDe8pAZsW/y62nQ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b898a8e0-0568-4ac0-15f8-08dad847e2a5
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 11:40:48.6218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K3q+U9KvWoHcag2xMS9ilc0dX46XWfVPqgp+AeXCKb+LhSWrnxiTBN3P0C9xgbYRChxb82un6N19/s1eKjj6CQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6742
X-Proofpoint-ORIG-GUID: n3tGX-eB8wbZ4j1Rfh8p-edOHYFDCSUl
X-Proofpoint-GUID: n3tGX-eB8wbZ4j1Rfh8p-edOHYFDCSUl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-07_05,2022-12-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 bulkscore=0 mlxlogscore=731 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2212070101
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Dec 2022 11:40:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99975

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 .../{python3-protobuf_3.20.0.bb => python3-protobuf_3.20.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-protobuf_3.20.0.bb => python3-protobuf_3.20.3.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_3.20.0.bb b/meta-python/recipes-devtools/python/python3-protobuf_3.20.3.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-protobuf_3.20.0.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_3.20.3.bb
index 5c4de4ac2..76b48e1ff 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_3.20.0.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_3.20.3.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=53dbfa56f61b90215a
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "71b2c3d1cd26ed1ec7c8196834143258b2ad7f444efff26fdc366c6f5e752702"
+SRC_URI[sha256sum] = "2e3427429c9cffebf259491be0af70189607f365c2f41c7c3764af6f337105f2"
 
 # http://errors.yoctoproject.org/Errors/Details/184715/
 # Can't find required file: ../src/google/protobuf/descriptor.proto
-- 
2.17.1


