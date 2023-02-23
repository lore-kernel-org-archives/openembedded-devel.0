Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFDE2C636D6
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 12:41:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.9446.1677156065115180717
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Feb 2023 04:41:05 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=m7OkHwad;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=141849fe7d=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31NCWe0O007352
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Feb 2023 12:41:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=PPS06212021;
 bh=C4EcPr7GRULbTWLeSX1FlU0QuL34rm9m3hOcX1VRWfk=;
 b=m7OkHwadklOmb4FYJrgCyspzZXc/x011xREq0ZgFUEF4RlC4WRsLSK/jZZCodWvS6pAO
 cjRArQN6qVt9VZlDW7zCLt4ggMpGSWoVQ7hpzx8NiXedNRSRM+aVMqaw5KZoToLr9TFF
 p+C13ZEHAYqTH9Owr1vxV7qbNK/lLoEYe6dtWyqJmkSgbaHIhZo627aLx1JxksISBHj0
 NWtL1U0w3fYv3ta7RPy1ChySUfoWnjfqN0vCUz+RskZ0Nfkm/HVp6APCZzU+iqkho1o6
 Y1PDtRBiu7pkkf9xqMs8nKEsy0SKTyo6pKi6VlRx2iUYJUI5pXFzB+MYLiQBZYfs5/e7 og== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ntpd3vqxb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Feb 2023 12:41:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BOcR9N+PSro2GR5ni+ZgHU2qJBFs7F6QKBENv+QSqARpJdMYzZoQVUS2ngJmO9afZ22eSxcljYv0Id0ATWLRDSy4D7EEFRpRLuW6fhon/vrjwAtmwzHoxG2s4LMjusTeHIBT+pZjQXztV+YulDVYCUjPcoLXAJMBU/4gT1Pg7Kswevy5pOSFvpJr1mSjNkJOgghHYDiGzPzJcbs7N066TBU8T4guySYL39ITeNvleCJMJSP3yQEvwUFZ6qfVZR6zidLt67W990q0/t8AUXfPxrz2Za2Ax53HeyRYdIM9g75J46n9lOJhcbG+LyKy9OYDhXp96Z8qxL/qBlowgaz4fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C4EcPr7GRULbTWLeSX1FlU0QuL34rm9m3hOcX1VRWfk=;
 b=k0lmowwqStXb1VRwrSSeq4n9eFT/rePHu7DvoFEteZX7Y2MwhNHDkXmUt73f0r4HEHFBRRHeFGiv2hqdhGvloTZVNWO6wVPZT45rZwA4ScsFbST/vYAMLzlZBbuBUtigOV0mkZ6wiMATBdoIGu/eC2GeRPgVjZRmmhmgN8gl6hX1C6fbFnGWjmI0tT6atJ/AWUOhzT1cASp1SYmGZgAE9HDWwUzQ02Ee/QDlC1Gistt2vRvMTfNApFfjIye+/rIP1PTlQSBIanQ+OVwOLCERY8g04CbqwXEYcBook4+sDsrZ3q/LCPe+yZ828LQvFp16IWSkT4wIppnsYRnegwGz8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by DM4PR11MB7278.namprd11.prod.outlook.com (2603:10b6:8:10a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.20; Thu, 23 Feb
 2023 12:41:00 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::3cb7:edf3:7304:982e]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::3cb7:edf3:7304:982e%2]) with mapi id 15.20.6134.021; Thu, 23 Feb 2023
 12:41:00 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] meta-oe: fix Upstream-Status format
Date: Thu, 23 Feb 2023 20:40:47 +0800
Message-Id: <20230223124050.2282580-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: BY3PR10CA0022.namprd10.prod.outlook.com
 (2603:10b6:a03:255::27) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|DM4PR11MB7278:EE_
X-MS-Office365-Filtering-Correlation-Id: c4f5c37c-c44a-4179-dfb3-08db159b37ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NJdUCmn/7G6AwRx2d/XaMqn7fhFSOzJ3vuR+aGY/OIirXX2+x5LnlabBd29NgRFyDZ6zjnRG1XB8HZ7JtN1BET+C2Wk+5V5X9W3jqNhLtEWalqK6DyFOjErqsJDLVzWDExynEB8N7wJG1VnIlGHW1n72ghhN+BbcTDEjwt0gRSnKqSUzmb07mDGN/Ow036bvxKSw9MJRJiY2LByMhM/hoZ0O2+hWqrD5VQ4cx1wO9+VjhrE0gKY9kjT1EheGjjKqqhdTAJF7VI6SgTBfLE/RFX+YGQnmZVlY9c81UjVYX6f+rGlRw2EmZmoYE0SSnDn5CtGWpEGa2sEdFHhOnMTyyU/MoskcmtcXJxH8ym4c1mMv6l7USQjpi8IZGd7nPmqO/INzY0RguwCmM06kYKg8BJbGJtKeYK4ueyXJuc1Bn2gmxfIKPHMYaM7bzOLIWIe5i9+oC5AVcpB06lmTa9//lozuvYyTiBYFH05KAp0qeIklJ3RtEzN5QKxfCQr9NpNvOM2HeYhgMvxE0GCiy6Zlk90jPAAumfhXFT+mvffA07399NDiafsmCFyS/nUu7V2IHfEk1uETPtXEJBytvHxG+UoTzEq/eHzLjaF7uJZZ7fwFBjEp+jdE0plTa+fBAuR1Ykj0jVN4XzjlREl5Y887+FT68fIQlJRUdqMvZMec213Sb68Ai896opwebB2cD+wUKERJQxki/WR8FSuKduHpTH0r3OLviCWgv4Rps38L5Xk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(366004)(39850400004)(346002)(376002)(451199018)(38350700002)(36756003)(38100700002)(966005)(2616005)(66556008)(26005)(6506007)(52116002)(1076003)(316002)(6916009)(6486002)(6512007)(478600001)(2906002)(66946007)(19627235002)(6666004)(66476007)(8676002)(53546011)(83380400001)(5660300002)(8936002)(186003)(86362001)(44832011)(41300700001)(66574015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UjFNZXRPdEM5Z2hWVUp4eGhwSmJ3VFdIQStmanYxL0RTQWxmeDFEb1lXbXRS?=
 =?utf-8?B?TnVOSS92eUZyVkttUnlFY2JSOUtZMG05alE0Y2NWZW9MclFaajU1RjA0L05r?=
 =?utf-8?B?V01ESDlDQzh5V0lRazg0SS9zV1FvS1ZHNjVDL0RwdWNYaVV1R1lyZXJucWpt?=
 =?utf-8?B?RG5aOUZFbDdETFVVdEtGNW1BSzBOYmNnMVMzN1cwVjhVZWhnVWRQYzFkb1Fu?=
 =?utf-8?B?MmtialBYTTczU3ppMEtoY3FHM2FDYnpmNjZEUTJwNmRkNlBvc0xyNWt3YjRn?=
 =?utf-8?B?ZmhYb3pjYlFYL0xaVC9TcnJ4UXJBdlJNTlpoaFIxSkVPNjBPbjJNaThFNWU0?=
 =?utf-8?B?VHdIWC9zSlVTTHdrdUxVV3E1a2VHa1B1WFZiUFJEbUFNNUU2dVEyS3BlU2dv?=
 =?utf-8?B?NTZGRVRad0hEcVhndkZIOHdMVnIvY245aFZhVVN1UWVsVCtHVTZOWElNalRr?=
 =?utf-8?B?WjJmdlFHcCtJU0lJNDhnNHI2dm1yUHhiSEFJalUzaFNsdU5OODZ1SlZoTkts?=
 =?utf-8?B?dXZRektjODBVUHV6S244NzRyRCttanFZZnBmYnFSMXhqVWRhUjZXVHZYZUFl?=
 =?utf-8?B?cGJQYXRXTk5QSUczRlF1YzZjM05EZmxTQ0FmNkdsUGJ0ZUlVS21LZDFTcXFs?=
 =?utf-8?B?bDJhcHFIV0huZ2JRWEZ5SGptcnV5ajJSa1N0TXA3ZDhTODhiNjBCL1pmNWtM?=
 =?utf-8?B?T1l2bTdTallrclFLdHpha2xEYmM3eDFHNTR2cFc4ZTNVVnBVYTNYZ3dNWGF2?=
 =?utf-8?B?WXAyclYxMFNYYUlWd3I2SFV0aDdoQXBQSURXbjl0TmRSa2dla0h6MEZxUmpZ?=
 =?utf-8?B?UFFKMFNDZk1vVkZhaDA1NzZqWkNWV3IrK3lCRnZyS0dXV2k3dmIrOGtJSVdv?=
 =?utf-8?B?RHlpOSttL20zenlFQjJGaTBvblN3UzBaMDlVVDFvR0FuQlBmQ3JkSEVhMVB3?=
 =?utf-8?B?cGtLaGRZUVp1QVhYSDBEWVo1WWorWkVmYWtPZk1YbkZLc2ZOeHNpbDZ2RDZn?=
 =?utf-8?B?NVJ5emtoY09EUDRpMHhnZG1XV25pcktMcHF6b1poaDl1dTN0Q1J1S09yMFhC?=
 =?utf-8?B?Zyt2cHIzalV1dTl4cktrY2pvMGx0cUFsQ2Z3TVZUQktoOVl0QkUwMUJDL05B?=
 =?utf-8?B?UWhSc3k3OTd0K2ZrM00zTldQeGtYaGk0N1FrQUVpZ3JtaWRvYVBzeWtETGhQ?=
 =?utf-8?B?c2V3R1RRdFNRcUxrZHpLMGRUbit5QlFUWGExZTU0N20xbWVZSmc2dm9jOHgv?=
 =?utf-8?B?NkNiNklJcG5sRkp6cFhoOU5KNnNJMUxTcTE1SFBlclVkelI5WEZiSTQ2blRM?=
 =?utf-8?B?OURTRDh2a1R3Z29VNjhOQjljamw5QThUbWVXQmxwdkh1b1IwRVJBcHlYSk9W?=
 =?utf-8?B?a09Zd0tGTVpucXJRLzRjVTBZRWNaZVFPcE92ekJkMzMveWZFNHJZak5rNWt3?=
 =?utf-8?B?RXBHeHBvQ1R5ZkhLNlE5ZHNYOFk1WlNnanhxME5ZWmU0MUNzaVlXaUFxR1dj?=
 =?utf-8?B?djJpWDdMcWFIQUZoY3VJeFhhcTZqd2JMUXpZbC82N0Zxc0ZVOUVmcVgzOWxp?=
 =?utf-8?B?ZE1keXhFUG9oZEpTUTBjNkRidlZZVG5kNzRjcjA3eUNORkYwa3EvUDkxaXdx?=
 =?utf-8?B?L2JQVmVYY3pqd1c4K3k3OW9oc3lEcldxSGFJbVRPRXpaelhwNVZmNkF3TXda?=
 =?utf-8?B?NW8zaXdkV0k5RFl4N3ZycHQ3ajNwSlRhTXhjMHZIZ2JRbDZ2c0orSUtaaHpa?=
 =?utf-8?B?UE9WbllpQWU1c1h1RGRUSWV3WFpVVHRvTk95a0t5b3lzbklxb3h5dmY4YVFw?=
 =?utf-8?B?dTNtYkFzUnZWZTIwS2I0Y2lLZzVFYU5TeWdid2xQT1pxWUpKVWFMelY3a0RV?=
 =?utf-8?B?cUVuSS8zRnhZRSs3ZnY2N2VGellvcXJRbDhVVGl6bzNuaUowSDB3ZUlFRHhr?=
 =?utf-8?B?eUlBOVhvYkphNmt4WCtGZk5IMmVqNDFoRXVUSDkraytwWFdOZTg4WjZJemhY?=
 =?utf-8?B?RnZsazFHRENaM3R3NW1sR1lQV0s5UVZGUllvRkZCaVdjQzk3anNRTmlvVXV4?=
 =?utf-8?B?ZTVHNGdIWDRGK0VPU01nQlhsSHpIQUw1T3cwN2VmTFJyTFFBNkJTZGtBNHhP?=
 =?utf-8?B?UXdGWDJHVnhSS2tRZEFaYjgxL1Y2eEVqcTdmcFQ5WGdFT2FrZjJpRXpoY0FW?=
 =?utf-8?B?UUE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4f5c37c-c44a-4179-dfb3-08db159b37ca
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 12:41:00.6319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Iw6TVGiNkMlFNjTcJ8+Y3XkW1jE4yYDEdAzH3AFJw1YmV9bZ8irEBwmrMvVPPBDdouLUp94cD0EZMdIsDzJwug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7278
X-Proofpoint-GUID: wxfIVoMDTO0PYwcrEp75BFeXzXfNsr3a
X-Proofpoint-ORIG-GUID: wxfIVoMDTO0PYwcrEp75BFeXzXfNsr3a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-23_06,2023-02-23_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0
 mlxlogscore=999 clxscore=1011 lowpriorityscore=0 phishscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302230102
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 31NCWe0O007352
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Feb 2023 12:41:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101224

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../0001-server-Adjust-the-cache-alignment-assumptions.patch  | 2 +-
 .../obexftp/obexftp/Remove_some_printf_in_obexftpd.patch      | 2 +-
 .../lshw/files/0001-disable-docbook2man.patch                 | 2 +-
 .../fluentbit/0003-mbedtls-Do-not-overwrite-CFLAGS.patch      | 2 +-
 ...rust.configure-do-not-try-to-find-a-suitable-upstrea.patch | 2 +-
 .../lxdm/lxdm/0004-fix-css-under-gtk-3.20.patch               | 4 +---
 .../hddtemp/hddtemp/hddtemp_0.3-beta15-52.diff                | 2 +-
 .../libb64/libb64/0001-example-Do-not-run-the-tests.patch     | 2 +-
 ...configure.ac-do-additional-checks-on-libxml2-also-wh.patch | 4 +---
 .../sharutils/sharutils/CVE-2018-1000097.patch                | 2 +-
 10 files changed, 10 insertions(+), 14 deletions(-)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongo=
db/0001-server-Adjust-the-cache-alignment-assumptions.patch b/meta-oe/dyn=
amic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-server-Adjust-th=
e-cache-alignment-assumptions.patch
index bf083c85f..52c9df9b1 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001=
-server-Adjust-the-cache-alignment-assumptions.patch
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001=
-server-Adjust-the-cache-alignment-assumptions.patch
@@ -15,7 +15,7 @@ src/mongo/db/stats/counters.h:185:47: error: static ass=
ertion failed: cache line
 The structure need to ensure true sharing for both the elements
 so align it to hardware_constructive_interference_size instead
=20
-Upstream-Status: Reported [https://jira.mongodb.org/browse/SERVER-65664]
+Upstream-Status: Inappropriate [https://jira.mongodb.org/browse/SERVER-6=
5664]
=20
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
diff --git a/meta-oe/recipes-connectivity/obexftp/obexftp/Remove_some_pri=
ntf_in_obexftpd.patch b/meta-oe/recipes-connectivity/obexftp/obexftp/Remo=
ve_some_printf_in_obexftpd.patch
index 8b73af32e..23e92885e 100644
--- a/meta-oe/recipes-connectivity/obexftp/obexftp/Remove_some_printf_in_=
obexftpd.patch
+++ b/meta-oe/recipes-connectivity/obexftp/obexftp/Remove_some_printf_in_=
obexftpd.patch
@@ -1,6 +1,6 @@
 Signed-off-by: Jun Zhu <R01007@freescale.com>
=20
-Upstream-Status:  Not applicable
+Upstream-Status: Inappropriate [embedded specific]
=20
 diff -Nru obexftp-0.23/apps.orig/obexftpd.c obexftp-0.23/apps/obexftpd.c
 --- obexftp-0.23/apps.orig/obexftpd.c	2013-11-08 10:42:20.816631583 +080=
0
diff --git a/meta-oe/recipes-devtools/lshw/files/0001-disable-docbook2man=
.patch b/meta-oe/recipes-devtools/lshw/files/0001-disable-docbook2man.pat=
ch
index 00f7b8674..706f2d524 100644
--- a/meta-oe/recipes-devtools/lshw/files/0001-disable-docbook2man.patch
+++ b/meta-oe/recipes-devtools/lshw/files/0001-disable-docbook2man.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] build: Do not build .sgml file
=20
 It needs docbook2man tool which we do not have recipe for
=20
-Upstream-Status: OE-Specific [needs native docbook2man tool]
+Upstream-Status: Inappropriate [needs native docbook2man tool]
=20
 Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
 ---
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0003-mbedtls-Do=
-not-overwrite-CFLAGS.patch b/meta-oe/recipes-extended/fluentbit/fluentbi=
t/0003-mbedtls-Do-not-overwrite-CFLAGS.patch
index 6c585c2f5..158857ae2 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/0003-mbedtls-Do-not-ov=
erwrite-CFLAGS.patch
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0003-mbedtls-Do-not-ov=
erwrite-CFLAGS.patch
@@ -7,7 +7,7 @@ bitbake passes CFLAGS that are often in conflict with the=
 ones set
 in mbedtls' CMakeLists.txt. Such conflicts are the inability to use
 FORTIFY_SOURCE=3D2 except in release mode
=20
-Upstream-Status: Innapropriate [due to fluent-bit having it's own Releas=
e flags that also overwrite bitbake ones.]
+Upstream-Status: Inappropriate [due to fluent-bit having it's own Releas=
e flags that also overwrite bitbake ones.]
 ---
  lib/mbedtls-2.28.0/CMakeLists.txt | 2 --
  1 file changed, 2 deletions(-)
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-102/0003-rust.configure=
-do-not-try-to-find-a-suitable-upstrea.patch b/meta-oe/recipes-extended/m=
ozjs/mozjs-102/0003-rust.configure-do-not-try-to-find-a-suitable-upstrea.=
patch
index e63b05356..202f12612 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-102/0003-rust.configure-do-not=
-try-to-find-a-suitable-upstrea.patch
+++ b/meta-oe/recipes-extended/mozjs/mozjs-102/0003-rust.configure-do-not=
-try-to-find-a-suitable-upstrea.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] rust.configure: do not try to find a sui=
table upstream target
=20
 OE is using custom targets and so this is bound to fail.
=20
-Upstream-Status: Inapppropriate [oe-core specific]
+Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
=20
 ---
diff --git a/meta-oe/recipes-graphics/lxdm/lxdm/0004-fix-css-under-gtk-3.=
20.patch b/meta-oe/recipes-graphics/lxdm/lxdm/0004-fix-css-under-gtk-3.20=
.patch
index afe11f353..d232f6913 100644
--- a/meta-oe/recipes-graphics/lxdm/lxdm/0004-fix-css-under-gtk-3.20.patc=
h
+++ b/meta-oe/recipes-graphics/lxdm/lxdm/0004-fix-css-under-gtk-3.20.patc=
h
@@ -3,9 +3,7 @@ From: dgod <dgod.osa@gmail.com>
 Date: Mon, 21 Mar 2016 19:25:25 +0800
 Subject: [PATCH] fix css under gtk 3.20
=20
-Upstream-Status: Applied [1]
-
-[1] https://git.lxde.org/gitweb/?p=3Dlxde/lxdm.git;a=3Dpatch;h=3D7281289=
4cfd9454d70e4b0753531e46580416771
+Upstream-Status: Backport [https://git.lxde.org/gitweb/?p=3Dlxde/lxdm.gi=
t;a=3Dpatch;h=3D72812894cfd9454d70e4b0753531e46580416771]
 ---
  data/themes/Industrial/gtk.css | 1 +
  1 file changed, 1 insertion(+)
diff --git a/meta-oe/recipes-support/hddtemp/hddtemp/hddtemp_0.3-beta15-5=
2.diff b/meta-oe/recipes-support/hddtemp/hddtemp/hddtemp_0.3-beta15-52.di=
ff
index 057b1fd1d..60953381a 100644
--- a/meta-oe/recipes-support/hddtemp/hddtemp/hddtemp_0.3-beta15-52.diff
+++ b/meta-oe/recipes-support/hddtemp/hddtemp/hddtemp_0.3-beta15-52.diff
@@ -6,7 +6,7 @@ Filtered with:
   filterdiff -p1 -x README -x 'debian/*'
=20
=20
-Upstream-Status: unmaintained
+Upstream-Status: Inappropriate [unmaintained]
=20
 Index: hddtemp-0.3-beta15/doc/hddtemp.8
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
diff --git a/meta-oe/recipes-support/libb64/libb64/0001-example-Do-not-ru=
n-the-tests.patch b/meta-oe/recipes-support/libb64/libb64/0001-example-Do=
-not-run-the-tests.patch
index ea3ddfb64..b3ee24d9d 100644
--- a/meta-oe/recipes-support/libb64/libb64/0001-example-Do-not-run-the-t=
ests.patch
+++ b/meta-oe/recipes-support/libb64/libb64/0001-example-Do-not-run-the-t=
ests.patch
@@ -3,7 +3,7 @@ From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 27 Mar 2021 21:41:04 -0700
 Subject: [PATCH] example: Do not run the tests
=20
-Upstream-Status: Inappropritate [Cross-compile specific]
+Upstream-Status: Inappropriate [Cross-compile specific]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  examples/Makefile | 3 ---
diff --git a/meta-oe/recipes-support/raptor2/files/0001-configure.ac-do-a=
dditional-checks-on-libxml2-also-wh.patch b/meta-oe/recipes-support/rapto=
r2/files/0001-configure.ac-do-additional-checks-on-libxml2-also-wh.patch
index 7faeb130a..490b61f1f 100644
--- a/meta-oe/recipes-support/raptor2/files/0001-configure.ac-do-addition=
al-checks-on-libxml2-also-wh.patch
+++ b/meta-oe/recipes-support/raptor2/files/0001-configure.ac-do-addition=
al-checks-on-libxml2-also-wh.patch
@@ -7,9 +7,7 @@ MIME-Version: 1.0
 Content-Type: text/plain; charset=3DUTF-8
 Content-Transfer-Encoding: 8bit
=20
-Upstream-Status: Applied [1]
-
-[1] https://github.com/dajobe/raptor/pull/33
+Upstream-Status: Backport [https://github.com/dajobe/raptor/commit/e75b1=
dbb7f2a6514b8d391b200c45a2bec6268bf]
=20
 Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
 ---
diff --git a/meta-oe/recipes-support/sharutils/sharutils/CVE-2018-1000097=
.patch b/meta-oe/recipes-support/sharutils/sharutils/CVE-2018-1000097.pat=
ch
index 99dc4e304..47eb9cfd6 100644
--- a/meta-oe/recipes-support/sharutils/sharutils/CVE-2018-1000097.patch
+++ b/meta-oe/recipes-support/sharutils/sharutils/CVE-2018-1000097.patch
@@ -36,7 +36,7 @@ This was reported in
 <http://lists.gnu.org/archive/html/bug-gnu-utils/2018-02/msg00004.html>.
=20
 CVE: CVE-2018-1000097
-Upstream-Status: no upstream [http://lists.gnu.org/archive/html/bug-gnu-=
utils/2018-02/msg00004.html]
+Upstream-Status: Inappropriate [no upstream]
 Signed-off-by: Petr P=C3=ADsa=C5=99 <ppisar@redhat.com>
 Signed-off-by: Sinan Kaya <okaya@kernel.org>
 ---
--=20
2.25.1


