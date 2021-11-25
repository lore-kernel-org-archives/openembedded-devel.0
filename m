Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 863B5C433FE
	for <webhook@archiver.kernel.org>; Thu, 25 Nov 2021 02:45:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.7320.1637808304906449403
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Nov 2021 18:45:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=iO5r6m1P;
 spf=pass (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=6963faa46c=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1AP2fh1J009587
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Nov 2021 02:45:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=cajmjzCqAe8F/GQ+D75DVPQ69o4zV53YlkXLmo6lwU8=;
 b=iO5r6m1PElLnZN5lLJUjpANJ+tMgCmLwH91iueRd729xSZfZh++xORCB0RMDjgT65+v1
 uZy8+EdJRm+2yUMwqQGWSQJ2Rov1vWzxF+fIQJy4InhNwfvJV58k8O8bZYZw7zhZj8S9
 1901nHuJEn3wZYLv7Pok8XkBZzrH7nedEZEWZm5wGJtUU1W1eqB+LHHG+kL5igPIA51v
 BCiRCunWiUIa9O0KqCAq+oc3aCWkFgpvkJQWQFnHA4CtOTgyRXCr5nxZnPccdmVVFJT2
 pP52lBZaugZ5CT/44xItbeb1DGaXCI5NbXHR7uD7kboNh37+nE33JPTR2m/Yu+C/YmSf wQ==
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3chce58yxf-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Nov 2021 02:45:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c8aloI9BjVJAc7Vaw3NVufqCK02+vXVelULSIVuF2meZpd067qnI79rCZejaoJsS0FJkD1jH+Ku+BAGIZQ9mXmO8+Hb8tvvEcGVmcvZzsrwAVBj+QhUrzTwbVChRyttXRMzFL8BI65NW0fvnozn5qQcBUkHWzGPjvev6QFR7pOxp4OiVr4rn4HEZCEcSGIeFK6wunm/x2Em6xzcKycSHVk4XLBE790goiw7C/jy2Gvu3E0FOlHBHtVWJR55ZnUr38rGb2APDWNPNmSy1RaAfMUua1GDc8Z703TqwlI0gCnXSlnA9JTwNfs2wEsMka2cUOWznUcRIr66QALtA/9BcJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cajmjzCqAe8F/GQ+D75DVPQ69o4zV53YlkXLmo6lwU8=;
 b=mHRuyTriFXL7B7f0I026q39nV6vR/dQr5roaC4c3e2PqZOUR2tgD/hWwz1q0ozTiV88F7GMrTIclRUXHzZAbdiXjgT97fTZPlfMd9NFLHBHi6WBMl3AQl1K+I76RKbRei2PFAZWfn/NrkEEcFO08f5YquQzQjvOgspGqsjgLB6fcEjy+PbmofVKzNyivGT14oQAsNxb1XJ1rMEwoVExV47Nqo7NzOpC+84TOJqI5DUSBm1CrrQtEhzM0QzZkc0Gh2/xKbdgQpl3qLyq70LiTyfSsTG6KnWWjIn5GY4m9PNarHOtfPEmQgABpqG4PLZBeRrJIK1bADqJWvRvmII0iXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by CO1PR11MB4803.namprd11.prod.outlook.com (2603:10b6:303:90::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Thu, 25 Nov
 2021 02:45:03 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::455e:9cfb:d106:4480]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::455e:9cfb:d106:4480%9]) with mapi id 15.20.4713.022; Thu, 25 Nov 2021
 02:45:03 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 3/7] libtevent: fix pyext_PATTERN for cross
 compilation
Date: Thu, 25 Nov 2021 10:44:46 +0800
Message-Id: <20211125024450.143364-3-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211125024450.143364-1-yi.zhao@windriver.com>
References: <20211125024450.143364-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR04CA0062.apcprd04.prod.outlook.com
 (2603:1096:202:14::30) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by
 HK2PR04CA0062.apcprd04.prod.outlook.com (2603:1096:202:14::30) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22 via Frontend
 Transport; Thu, 25 Nov 2021 02:45:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b56794da-0e36-44c8-18d9-08d9afbd94ab
X-MS-TrafficTypeDiagnostic: CO1PR11MB4803:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB48034C04E70F9A02CDFC77ECF9629@CO1PR11MB4803.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gL4GRrAbyDDd9qd/EUlcyW1chsoTLMALBnk3aO2HFB1ZA5aKyMqg3HAs64x0ZMB23/K4g05tQfBTOuajk6U2nm0iOuFo4S37Of3BCeofKRx24/xKzfAsdueJMVBnirM9pgkUw4cT38QbeCWtQG+0m9b8SEQPHvzg45oFlC1y5dqZkFM24tn3hUoVRjLMZ3x2G5kQMnwgueJsBqSiLPNWAVARO6eUcG0Za9Az2gCbbJ66W93QILKPKITUdLdKRCWZvARIXzJkYPXFqSa+UvxlxwJ6o4w/sG+tp0jLs6hhuaFnWROztIdYlbulxlq7tvUXg0izGf1yUn6uXxoT7jL1t4ZC56uQV1IcYwpU5nsKXUkxhk2TRUZ+ZCPmZPn8P6IqxyTEXkIpZXGNbHbIMwwwxNAj1Di3PwN97OaLMq1m7AAYTM0ePFDYQXPmzotTNwrp0GL4d9lHbDvaWIszTiSqnXeBxt3cb4uLgzpwC0aDhFYZW5qmwQnEX0OyifDJQ3+a7HhBm3prl4GUn+jt4YuYKd1Af+7nOet/0j0V0R61iu5gSzjP2B1jXv8VmE7fnqQLYGuHV4TDI2d3V+gGzwCSi3M5R25meWzRNfXvG+OwP4i8RPkmHW1IPFEChrT7a8h0lnWChB+T3CJMRtbRfie0kPpnYJi0t6t1odoqj2xa1/mPVizdxDPwQh+M6O8WxJvyGL2UWXvVIY++KJzFXc/Sf++sp2L4NlL0LPD/SYvnnF5tlLMR9wwSH6K0zfbGfoyFGItbLdI3LeJaYOd+BMzmqX2m3oEnM8fvmFWaRXPa7QI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(44832011)(186003)(6916009)(52116002)(26005)(6512007)(2906002)(5660300002)(6666004)(2616005)(956004)(6506007)(508600001)(66946007)(36756003)(1076003)(66556008)(8676002)(86362001)(38350700002)(38100700002)(66476007)(316002)(6486002)(8936002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bGa4Ao7cTFs/FT8ShzmQnatk6gbj9POyRQx3QohBa52CSgz2oE//BBJTBKQ+?=
 =?us-ascii?Q?F2uSHwktBIiIfG+v2ZE2W6R4G2WaZyQa8G6T3/U5Uk6zzK7D3JNn+HP+eAT2?=
 =?us-ascii?Q?GOKmt/G1ek5KgUsZAJWhz1C6sQD2ygEtDPF/Exn3mqWj/5BriroyyRjFWqHc?=
 =?us-ascii?Q?u+a8JRpLMe1CdRdOEOwxD3XVsXdBxJW3tITxD3yKtjjyBYBD9JrjAck9bI55?=
 =?us-ascii?Q?IGYmxMskBvbLIDltxvcSxg9HJTI5LEMSyt6bGygX8rjRew787u2RBCIm+Mj2?=
 =?us-ascii?Q?/h1x/YmTd7Vqv+AoByCv0hgl/py3g9cmcyKmA0gCTMGJ7vB83aQ060bNh44L?=
 =?us-ascii?Q?0kWgWM+/nbgFr8ZwSMhp+Fs+GqPA65UzJ6GT3G/mC4D1B7zz2YIypkQ64h/I?=
 =?us-ascii?Q?hrsqXF6paBYTKfwHZPq2BAkgVaoAgpphJTpPsrt8b2FdALhYcHawPj7jr5cE?=
 =?us-ascii?Q?B2FUzzyA+l2spiPyVJ5vRWJds0GEc/3TxEZD8p0hA1QZuxS1ZGKQTI8xAOVb?=
 =?us-ascii?Q?yCSoKCmL44XrHNiIFb5mhxlyai1grd5cb0A66Sl8XCQbVWr0mhQuaJ6z/6N1?=
 =?us-ascii?Q?LQ+lH4yLn5DLEVZS5RsP274fZUBXNFf+AI0T/QsUMoSIsKnLNaYfUD2Fs4br?=
 =?us-ascii?Q?0OcB7/zobEQ22/PM4aPBZMHb+TEq+k7cwBLPSb+JBN/lc0/aLIXGBZQAET5w?=
 =?us-ascii?Q?G7p9zGSLu9+S/HOMUydt26lgl02AavGztAxLXW/IdbMWhbX+EUehtKvxCFpW?=
 =?us-ascii?Q?S02wjIbMdIeKmuD1gQ1U4r6/oiXqRAquEeiXlUwKRO7C6e1gMH3BbsJ7SKN7?=
 =?us-ascii?Q?nfKyLyMF0mxX0DOM0Fi2ZRYpPeRHtYhA9m30ebkwM0emiABJwurdieJAgGRa?=
 =?us-ascii?Q?/ceSkovdi/Vcqh5OuCg3iQ95N87ahQlbiqq+ldbEenw6DsIm84MkBwrnF99O?=
 =?us-ascii?Q?InyztUlzVhxJ6Oqvzox9WcwlFJAYr3GacJs9q7kxMunJWdQ4vOA66br0QY9K?=
 =?us-ascii?Q?4EA76xSWnMC/RjQzBbfWoHBjLR2Icr5U7lQi2jddbkIMMMFIQQKrxDzj6tJt?=
 =?us-ascii?Q?BMwTATGShc7a2NPiNSi0/KVSYGcdAQFRz++vjfbnW1YY7gWPe96ehoFkTudt?=
 =?us-ascii?Q?rEjEu5syeUQqFSLWsq8loyZOOg0gHO/efEFHw8XRZjOAzcmY1lKbsPMGVwr3?=
 =?us-ascii?Q?WMpxZgTaTC3Wv9VsOVScAtcycQKEJJ1LZnDID73ThSc+edWdobfEoxg4YW4S?=
 =?us-ascii?Q?Qmb/Da0DrL14jo+gcX3G+OPhooX2e3K3zVoujs436IamYDuoNRem4Vn/wWo4?=
 =?us-ascii?Q?V42alXkn3D+g2i2wlZPdsKnSQ16jLjx2JDEPv6FLfWEW3Gv1XuD/T9x9RXW2?=
 =?us-ascii?Q?trHJ9DzjE3YAxE5wHa3IU+ezuf/wL2B9NMheN+OhpNRVHjQkeaYR6TbHiQ3E?=
 =?us-ascii?Q?TyiNOjuZ9ROEvqOCokIyYJOpjnPdESLIfGg1wO9ccmn9ZCg6aKUytRoPXqCk?=
 =?us-ascii?Q?gE8YqzdHs1gm5X0IVtLWD+FJ3nW7z+Zux66fR2aPTpln1n92fKm71SDrwYXx?=
 =?us-ascii?Q?1YPCjHOErBtY+4e757HfcGNAn3mSFGVLhm+Lja97ncOwcYyk0F9IpEcbVjNs?=
 =?us-ascii?Q?yXRa0QIQ7HQ7jkTP+P5luYU=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b56794da-0e36-44c8-18d9-08d9afbd94ab
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2021 02:45:02.9557
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 qa6nI7vaR4f8hGSNt4p9c+PHdrzMfPVUZ/L60NVmkzYUKzRZStIQbRrXIlO9yppBIIuLh8c9lw4jj3D8GRMGeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4803
X-Proofpoint-GUID: dQSUJK5tBSsQfO0nyCbvu2rJ8LlBCoQZ
X-Proofpoint-ORIG-GUID: dQSUJK5tBSsQfO0nyCbvu2rJ8LlBCoQZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-24_06,2021-11-24_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 adultscore=0 mlxlogscore=999 clxscore=1015 impostorscore=0
 suspectscore=0 malwarescore=0 spamscore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111250012
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Nov 2021 02:45:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94118

The pyext_PATTERN will add native arch as suffix when cross compiling.
For example, on qemuarm64, it is expanded to:
pyext_PATTERN ='%s.cpython-310-x86_64-linux-gnu.so'
which will result in the incorrect library name.

root@qemuarm64:~# find /usr/lib/python3.10/ -name \*tevent\*.so
/usr/lib/python3.10/site-packages/_tevent.cpython-310-x86_64-linux-gnu.so
/usr/lib/python3.10/site-packages/_tevent.so

Set pyext_PATTERN to '%s.so' to remove the suffix.
After the patch:
root@qemuarm64:~# find /usr/lib/python3.10/ -name \*tevent\*.so
/usr/lib/python3.10/site-packages/_tevent.so

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...-pyext_PATTERN-for-cross-compilation.patch | 42 +++++++++++++++++++
 .../libtevent/libtevent_0.10.2.bb             |  6 +--
 2 files changed, 43 insertions(+), 5 deletions(-)
 create mode 100644 meta-networking/recipes-support/libtevent/libtevent/0001-Fix-pyext_PATTERN-for-cross-compilation.patch

diff --git a/meta-networking/recipes-support/libtevent/libtevent/0001-Fix-pyext_PATTERN-for-cross-compilation.patch b/meta-networking/recipes-support/libtevent/libtevent/0001-Fix-pyext_PATTERN-for-cross-compilation.patch
new file mode 100644
index 000000000..81abac83a
--- /dev/null
+++ b/meta-networking/recipes-support/libtevent/libtevent/0001-Fix-pyext_PATTERN-for-cross-compilation.patch
@@ -0,0 +1,42 @@
+From 96ddbe6653f87670e4a0bbff229276bbe0aa822a Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Wed, 24 Nov 2021 13:33:35 +0800
+Subject: [PATCH] Fix pyext_PATTERN for cross compilation
+
+The pyext_PATTERN will add native arch as suffix when cross compiling.
+For example, on qemuarm64, it is expanded to:
+pyext_PATTERN ='%s.cpython-310-x86_64-linux-gnu.so'
+which will result in the incorrect library name.
+
+root@qemuarm64:~# find /usr/lib/python3.10/ -name \*tevent\*.so
+/usr/lib/python3.10/site-packages/_tevent.cpython-310-x86_64-linux-gnu.so
+/usr/lib/python3.10/site-packages/_tevent.so
+
+Set pyext_PATTERN to '%s.so' to remove the suffix.
+After the patch:
+root@qemuarm64:~# find /usr/lib/python3.10/ -name \*tevent\*.so
+/usr/lib/python3.10/site-packages/_tevent.so
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ third_party/waf/waflib/Tools/python.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/third_party/waf/waflib/Tools/python.py b/third_party/waf/waflib/Tools/python.py
+index 7c45a76..c9a90f7 100644
+--- a/third_party/waf/waflib/Tools/python.py
++++ b/third_party/waf/waflib/Tools/python.py
+@@ -328,7 +328,7 @@ def check_python_headers(conf, features='pyembed pyext'):
+ 	x = 'MACOSX_DEPLOYMENT_TARGET'
+ 	if dct[x]:
+ 		env[x] = conf.environ[x] = dct[x]
+-	env.pyext_PATTERN = '%s' + dct['SO'] # not a mistake
++	env.pyext_PATTERN = '%s.so'
+ 
+ 
+ 	# Try to get pythonX.Y-config
+-- 
+2.17.1
+
diff --git a/meta-networking/recipes-support/libtevent/libtevent_0.10.2.bb b/meta-networking/recipes-support/libtevent/libtevent_0.10.2.bb
index 5d7e1a0d6..78c092095 100644
--- a/meta-networking/recipes-support/libtevent/libtevent_0.10.2.bb
+++ b/meta-networking/recipes-support/libtevent/libtevent_0.10.2.bb
@@ -9,6 +9,7 @@ RDEPENDS:python3-tevent = "python3"
 SRC_URI = "https://samba.org/ftp/tevent/tevent-${PV}.tar.gz \
            file://options-0.10.0.patch \
            file://0001-libtevent-fix-musl-libc-compile-error.patch \
+           file://0001-Fix-pyext_PATTERN-for-cross-compilation.patch \
 "
 LIC_FILES_CHKSUM = "file://tevent.h;endline=26;md5=4e458d658cb25e21efc16f720e78b85a"
 
@@ -42,11 +43,6 @@ EXTRA_OECONF += "--disable-rpath \
                  --with-libiconv=${STAGING_DIR_HOST}${prefix}\
                  --without-gettext \
                 "
-do_install:append() {
-     # add this link for cross check python module existence. eg: on x86-64 host, check python module
-     # under recipe-sysroot which is mips64. 
-     cd ${D}${PYTHON_SITEPACKAGES_DIR}; ln -s _tevent.*.so _tevent.so
-}
 
 PACKAGES += "python3-tevent"
 
-- 
2.25.1


