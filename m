Return-Path: <Zheng.Qiu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E9BAC4332F
	for <webhook@archiver.kernel.org>; Fri, 25 Nov 2022 17:11:09 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.51829.1669396260601747406
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Nov 2022 09:11:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=W1h1unQ0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8328c4fba4=zheng.qiu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2APGue87024022
	for <openembedded-devel@lists.openembedded.org>; Fri, 25 Nov 2022 09:11:00 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=fcHtD0zJyC6KpqfmNhcThdKS/L+pHVUGIbZAtl7qIFE=;
 b=W1h1unQ0u0G03FCr8oiOb+3Po0tlhSIaS2H5wMeuUJ4tWiweuCrCC/UdiLfpdYqmcbQN
 JGSrKtFS0Py2y35Wl751wtdT6W5oWdbfX7fN4nt+0bdbRGCTu7e9zen0jJt7V7YCpzwB
 nFug+oBrB5loROJjqgkk3v/Cx5SCMcnOvjVm23T1ZHttgf7RWirGiZvUm7VtEedRPZw4
 CGeITpdzrmtU8LGWbEeTwh9ZErYaW4CKc5/qI0mig49zDGjaHMnzAsT0JEAAELKWc7PG
 xWATOtpO7pVXOickSRFjBpKkZ5Uo6kRjAKo3qWwYXADIhbpJpm5GPCUif7HQbm91IPO2 nA== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kxyhqcxyt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 25 Nov 2022 09:11:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jHJXtWEtuLq9kXfA2Rr6gQXdSlvny5VSl7DlO13t1ns/sQKFlSkEA0eyXdOBF2zvW3l0HWCBczLP6FslZKbHOEOz4JvR5Agqr+YLgeBx8hk0P04Pf9P5mJAVicH23p0/vc4od5L4QVA1MXF0SEx5/zvoPAVdPT+i48RT61CHFh9+4OzclxdBbPcv/vlhjb/I4TIwYwqGp4ZKNAaPIjHxbM6A1stWo/gLw7m2qKwDLdovuYS2Elsbi2fX6J27nlGFPjGDJBM0vkU1pnT+rur7ETc13mvkhMtm+JDSfDw2iZDFzOooxkWhF56oEvmJOTdgTS/bDkV8/QJSPDPsm0fuWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fcHtD0zJyC6KpqfmNhcThdKS/L+pHVUGIbZAtl7qIFE=;
 b=hdX6nQKu4OxLunTABVHGVTyf7r+zOeDuNlBF6/xja38UWOpKDXZadrkWmpFjcqrAYksKVJ9Fd5uXbuKS7Q0y3JqO06H4ANWg4anvaNdykD5WqB7RcJT7X3WNtMwNx9QydjE//rEeXT4HX/lJPIYX1TD3fJHcYemfj8AA1ZtUzVQ80m/hK13pJ6/+T4uoLQzdsgYh4zzKuyOuVNZtuZtrFEmLGS96PrANRoV/Ssu2waLn0X8CaRSREHhkwPq59tXfoLAwI/qzcpfn2S6vSE2IQRwsdBJyXuCftCYL8c3ltQ/efrYDrBlwzEIbb+nq6QM/31ihZ3JqvwvqqAuo/qwSeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5536.namprd11.prod.outlook.com (2603:10b6:5:39b::15)
 by DM4PR11MB6453.namprd11.prod.outlook.com (2603:10b6:8:b6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19; Fri, 25 Nov
 2022 17:10:58 +0000
Received: from DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::3fdd:fc11:e12c:46b0]) by DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::3fdd:fc11:e12c:46b0%5]) with mapi id 15.20.5857.020; Fri, 25 Nov 2022
 17:10:58 +0000
From: Zheng Qiu <zheng.qiu@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: zheng.qiu@windriver.com, randy.macleod@windriver.com
Subject: [master][PATCH] python3-inotify: add ptest
Date: Fri, 25 Nov 2022 12:10:44 -0500
Message-Id: <20221125171044.3649193-1-zheng.qiu@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: QB1P288CA0010.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c00:2d::23) To DM4PR11MB5536.namprd11.prod.outlook.com
 (2603:10b6:5:39b::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5536:EE_|DM4PR11MB6453:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e8d77f0-8ce8-4787-cd05-08dacf080526
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yRobt3LqzqK4iIstRc4grMOiyMC6a1h8ShTql+1LHI+IeSFy+sjKVersA378DZu/Wwth79k0Vfc+93LCdl4Be8ZJ3lWSqfNFtJQrSEmjuaZW73ouwvtggtrm6Skot7iB9P5nBa+4ttfTp5lDZvdkFlGrhwr5NXa/8OCtUPjfWABNZUxJQTj39ah32CeXa9Z48jH9q6S+aQMnuf0mWYXbBN2nxbq4DVBGbqm1xhKslMNgrOlBUpwtSomxP3EDfA5etUODBaV5ZJp0G+xkZHUfLg8SIOmWe1ED7zclS9HjP54QwF4ZDAsqQvEnXggRNoo+1OAaXp2yMFCZ7vCzjmNbbbduGLZLQb0E2qfJ46EgblgOkLfoOT96ecaCi3bE7Hz5q5EF4eDP9ITwEM3tMwYk+loj/r9tFUUVyTo0dYfTBQf/OpQpi3k6uvJKf+OBu16lFN4xe9Ap4K+XPn8ysOXTJw3+n56GtMuUx5ubaFeXtzEX2alKcg0LAOPs/fej+VG/wxQNkjfE3z7+gtCrkYqDvpKChTn1f3wO9MOPyp24hI8BphnMGYmZgb/+YZ4JMITD+gAFSubA8woXNEeAMBT1gcx6giGHGeK2pxnfFgC2kaIW83/UIPERdQJ5bEMVKZMFw/+5+WXMaUoj8MbE/bMgqg5X3jyc5d7u1M30RmbSm6Fb0dV+jsGLZsfxB9jZnftpDcw3VCTRDzFuf56BxLYxiw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5536.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39850400004)(396003)(136003)(346002)(376002)(451199015)(6486002)(5660300002)(8936002)(478600001)(6512007)(52116002)(316002)(6916009)(26005)(66476007)(66946007)(107886003)(6666004)(6506007)(36756003)(66556008)(86362001)(186003)(1076003)(41300700001)(44832011)(2616005)(8676002)(4326008)(2906002)(83380400001)(38100700002)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rfLBrpO/ZwWKnS+aP4n7RP1MsySe4Iz3oVPbgPI/wCKGpno0LGeXSzMgf4RQ?=
 =?us-ascii?Q?ogaM09b3+8pM0/y+7oRB936hEKPGjLqzhLqG380Y1OwuiW45HIKzO5ATd7pF?=
 =?us-ascii?Q?oJVP6bzEuVptbJDpXirJKf1w1vQJe4ngOJzX+ldsviskILkVII8cizx+qxHx?=
 =?us-ascii?Q?uLrmen7n1lUrJnm3Xf9Z6GwNifwSo72UawzSmYm7s2XgowNyw5y9EunfZ8Fq?=
 =?us-ascii?Q?AIEhGb4bhPqb/G6gsQcZQ4CLjo9YVQVdy83LZGOUfjJ0IAwx1tcCTfaIB+fn?=
 =?us-ascii?Q?7JuGY9b2B2F++Ywhojqcu8n7D9b9HrR13+MExbzXpC8V9qkx0etme2GRcXbQ?=
 =?us-ascii?Q?eSYtr99q2tpozyXV/yE8fNBTkRjQ6SzUpHmr66uA7PtCtp9XbHRZIGQlIXZn?=
 =?us-ascii?Q?E8iGScyoCHo3ZVDrCJPdysUZwrDyKeDfva2hH9gEw4uhonml/gIiHKtIGcbQ?=
 =?us-ascii?Q?oPWHipZD0brCKJWLoAncD666vDsXeEffZ6+kGo6gfbPPIXSSOsJhnkSNmxQt?=
 =?us-ascii?Q?TLOyPd9XxxjfZHSPGOcXtt7sn2saD5ke0UHd9lLHAVwcLSLqU677TK3WVr2i?=
 =?us-ascii?Q?soROdFPl7GCNfuM5AogVhxIueRhcVBt8zdt35LDUFQQWyKZsazYMeO+f+4M2?=
 =?us-ascii?Q?NME5c0DM1zkGQLIhn7VoFPsdaQbSOCEvIav7Wg7TnjmKWNWXxBh14M6b/1rW?=
 =?us-ascii?Q?6768/laJ6gFzeG4YvcynzTDLfm7Cj7XLq+QmbmKgJNuBe475rcnNgEtCmTDt?=
 =?us-ascii?Q?jKhfc/p8Y7JJ7azqbdw2YF84k1fPBAeHnZ65sUA7TcE2Rf+2TinnUAodwyXf?=
 =?us-ascii?Q?hJ0g/s4RVtr05xOKeTg9PUNywULJ+Mvg7k7I6nGeCe9UeO0Wa2PlVx0ozI8G?=
 =?us-ascii?Q?nt9VvjKSLxzYe079U1nZoOl/yauORX3mY5rdjiUY8AR2krA6TyahqUSRtSZz?=
 =?us-ascii?Q?nlsUx3OzEZ1i5bJdbiO2pNgL8d98IRo+e/v0cymGVSDyp6BkepBPtJwc5sho?=
 =?us-ascii?Q?14EaNozE1Hv46stJt8cW+HFNV7Q0kbz+XdcTtZ1vPbNeUNB5QPe9y/MYC1Ty?=
 =?us-ascii?Q?/OIGjw//LGXhRqGQ+KSTinZ3imhoAYD1uizsSDS+L32zZNsrgNdB+zUVm84K?=
 =?us-ascii?Q?R885n4iZMsMfvGt8HqzIOhwIrgMIc9g1ya+7qtE4aCYszw4QuoJZIbu7P6ur?=
 =?us-ascii?Q?TG+C9RBbAVgnjqWMr85jEVcWZLq5ILLEN2pC3aeeJJT3PWaExwFi1GEuj7Ii?=
 =?us-ascii?Q?Zrf0iVSTQ9pIqAnhlHqzD4mjbSL33vd1p7ZBwSLaSZKwpH9rzPL+IEfa/HB+?=
 =?us-ascii?Q?w843H6Tuu6qmFHa6NTI5mLWC2U4Mq4qEF1TVuGN0+5/Kegf83Agnql3KJ+LH?=
 =?us-ascii?Q?qLkh+xMnoyIqht0NJexn9xVOtE8Uwb0EOxthcbA8rGeCPGQrYmG7vUZiW2M5?=
 =?us-ascii?Q?qdOGPQMIRwdhD7Ivipc3zGinan6u/FlOoIzhe8vLtFfiGe2NkGZTOmTrTTG2?=
 =?us-ascii?Q?7VvHh/fu7fTyps8zwuJqyudAeDaJ1gu75lZkeR3R3K/xzHMshTo21IFffdDK?=
 =?us-ascii?Q?tlYH3/1uc65WOsgRgkAvuKaUQvAKMIbF1e+mmeAq78Cj4zCUfH+Bt9ibxQ1R?=
 =?us-ascii?Q?2w=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e8d77f0-8ce8-4787-cd05-08dacf080526
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5536.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2022 17:10:58.0258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 07VTF0kSTtRszYyWj+xJQOkvPqSRQOu/Ym4L+qPd2HSV7+Rh9VnPWrYA+gxh04MOeCWmXtW3yO4NSj047PBl8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6453
X-Proofpoint-ORIG-GUID: LRUtiBbZX6ky3mJIlou1B0WCbY4GS8po
X-Proofpoint-GUID: LRUtiBbZX6ky3mJIlou1B0WCbY4GS8po
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-25_08,2022-11-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=934 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211250134
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Nov 2022 17:11:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99735

Add ptest provided from the source code, and run it using pytest.

Since the tarball provided with pypi does not include ptest, switch the
source to be its git repo.

Signed-off-by: Zheng Qiu <zheng.qiu@windriver.com>
---
 .../python/python3-inotify/run-ptest          |  3 +++
 .../python/python3-inotify_0.2.10.bb          | 23 ++++++++++++++++++-
 2 files changed, 25 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-inotify/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-inotify/run-ptest b/meta-python/recipes-devtools/python/python3-inotify/run-ptest
new file mode 100644
index 000000000..3385d6893
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-inotify/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-inotify_0.2.10.bb b/meta-python/recipes-devtools/python/python3-inotify_0.2.10.bb
index 524c3a0d2..3306438a1 100644
--- a/meta-python/recipes-devtools/python/python3-inotify_0.2.10.bb
+++ b/meta-python/recipes-devtools/python/python3-inotify_0.2.10.bb
@@ -6,9 +6,30 @@ LIC_FILES_CHKSUM = "file://setup.py;md5=79b7ec72aa0d446a552d3cceb5799e41;beginli
 
 SRC_URI[sha256sum] = "974a623a338482b62e16d4eb705fb863ed33ec178680fc3e96ccdf0df6c02a07"
 
-inherit pypi setuptools3
+SRC_URI = " \
+    git://github.com/dsoprea/pyinotify.git;branch=master;protocol=https \
+    file://run-ptest \
+"
+
+SRCREV = "f77596ae965e47124f38d7bd6587365924dcd8f7"
+
+S = "${WORKDIR}/git"
+
+inherit setuptools3 ptest
+PIP_INSTALL_PACKAGE = "inotify"
+PIP_INSTALL_DIST_PATH = "${S}/dist"
+
 
 RDEPENDS:${PN} += " \
     python3-ctypes \
     python3-logging \
 "
+
+RDEPENDS:${PN}-ptest += " \
+    ${PYTHON_PN}-pytest \
+"
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
-- 
2.33.0


