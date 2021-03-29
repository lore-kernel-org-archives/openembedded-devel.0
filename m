Received: from outbound-ip24a.ess.barracuda.com (outbound-ip24a.ess.barracuda.com [209.222.82.206])
 by mx.groups.io with SMTP id smtpd.web11.17119.1616990925568299584
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Mar 2021 21:08:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@digi.com header.s=selector1 header.b=wb+2ksqQ;
 spf=pass (domain: digi.com, ip: 209.222.82.206, mailfrom: ben.gampe@digi.com)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174]) by mx-outbound42-72.us-east-2c.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Mon, 29 Mar 2021 04:08:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OeKqagiS4hCVgRQAX+IljPe2QffoROW/afAk03lyVTQOcaavXIFFLL1L9TfQMhF9lL8vpdwPWLSJMlQZudp4jQor/WigoxEKab5BLKF+vBZbBjZe7qgDnqdt9UM5VsaG2QBzMyZKwN+7nCvEtSYdB3YNRsuiLXNxNKPFxTtJIcErM2AOp58T4uKXsFKiMNJmNoIcmRztyO7VyAcmQxAjCzsqHVqCkYMtFucc2HFaQRGh+PPErPEA8vLcgoP3foPO6XQkTEoHlK9zJ4UE18eVx14YmVN6A7MFoqz8QAfkIDiHnQL0mWyZW1CSpPt4JJy4STEDuvJEvdb6Q4X9BXX+vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wlgsP+bowe7zv+Y/45iKewCfHWIL/6F4gYxGYbpytNc=;
 b=jLZyc2hu3SmJnRnjlcEEQCAmsYmxac9he3M4mC3BtY0/OhnDoECXWypMn2ojlu/OKgGT94QSIUYsWlPBQQTq/L3lRVr29/96DtMh7beoYi0EmZIsD7Oa4R7PeM/6+OEF/XmG1D3XRniBAxOBex0JUQ4psyI24HyvFABZ0vMzZxQu5mTx6nTBrT5xkXJXIWTWITGhp6mxuA1VVib7btNxhTAK7QkxAICB5feqcIgp5tf9GwXMfqvcf+VEFAOAFZAHfDWQM2wHztLITVac1IXhO9xWL3jLo4g55m6ZPnWos4byw59Ps5Br2NeNJ9n9IwV0AuDLgbN0DbweMNEYPKvJ0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wlgsP+bowe7zv+Y/45iKewCfHWIL/6F4gYxGYbpytNc=;
 b=wb+2ksqQDn1wrg4AhSKl1K+p/KU+djN/KzCdjCGCBLw2veVYVWtYIzUkxTWmDm0ynIvAQ6Vs4bAXk9vnD1+upYE5KIEFms52JAJZFzHDGfC+H+QJZxWDtX1IMZQFFULyzhjTdp/QfgRw8cb/QZB9zuJuogclJ3axQNSW6IqToQY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=digi.com;
Received: from BYAPR10MB3320.namprd10.prod.outlook.com (2603:10b6:a03:15b::21)
 by BYAPR10MB4102.namprd10.prod.outlook.com (2603:10b6:a03:129::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Mon, 29 Mar
 2021 04:08:43 +0000
Received: from BYAPR10MB3320.namprd10.prod.outlook.com
 ([fe80::3cd7:c100:494e:cecc]) by BYAPR10MB3320.namprd10.prod.outlook.com
 ([fe80::3cd7:c100:494e:cecc%7]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 04:08:43 +0000
From: "Ben Gampe" <bgampe@digi.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ben Gampe <bgampe@digi.com>
Subject: [meta-python][PATCH v3 2/3] python3-pydantic: new package
Date: Mon, 29 Mar 2021 14:08:06 +1000
Message-Id: <20210329040807.2600673-2-bgampe@digi.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210329040807.2600673-1-bgampe@digi.com>
References: <20210329040807.2600673-1-bgampe@digi.com>
X-Originating-IP: [49.197.127.171]
X-ClientProxiedBy: SY6PR01CA0088.ausprd01.prod.outlook.com
 (2603:10c6:10:110::21) To BYAPR10MB3320.namprd10.prod.outlook.com
 (2603:10b6:a03:15b::21)
Return-Path: bgampe@digi.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from beng-dev-laptop.beng.bne.opengear.com (49.197.127.171) by SY6PR01CA0088.ausprd01.prod.outlook.com (2603:10c6:10:110::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25 via Frontend Transport; Mon, 29 Mar 2021 04:08:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c7b8965-5181-4e75-b214-08d8f26857b8
X-MS-TrafficTypeDiagnostic: BYAPR10MB4102:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR10MB4102452B85DC3B4D5E7908F98F7E9@BYAPR10MB4102.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NXtOavo3RICOj+5Fx5LHUzZdsJlRlc/OMDSLXJbmkv12D/fd+pGidtlMLwnqXtOVjgDixJ+UvEF3yTNvIi6lr/BxYsZ8eSfy24qMauqUn3czm1SSOAtmmWXM66YGwejjxFDGDZH1XceuDC++ODb17+4mWw7PAixlgeJ2NNqymqeuDkqVFIIGdq1pCCVVYObpYoeEci2kFjYDR/N9sjC+9a9oQrQcGYiGBVEo9V6WPy/QxoKHwbuRonwXvy92NpUWGhB5Nw8uy/MTYDMZpYKalqK8YoKuX1U+ecqHHPBAeAvtc73Zk7JGiE2JRI9S2Is0JCoT6PAnqtSaHeiGgAP8b/VruBLDaUhGaLE5sbJrmVqWB6/LLLK71/ct8LABozfSiwXdMrD/hr05lrkaZ1hepzVfC5ik22lvpGhvgPDS4Ei8y8GirEg8XZQ4C3yACvd17etAL+781kawjbJe0NLYvcVcMEGJQQVfFQ0q9DUz68nQRpGpQfGhn+wnCplxBBDzQ4kaJR0gop0mhKBJTDKOvFMIB1X6nQNhV5KkcqsgZDpj8jpgykVPMy2q6G/4mu9jGMEymIF/G2FxLsuj3E++4u01iy677xwCLkRQFj9jyJ/lGWtDslZmfAtAxer/ZCuvElSvOjCpUqTmta6nI+YAz1gfzEDArfH0OMuX/DKk5hkhDrefpQ/3Mc/+++oTEuDaTcEJy72mNxeCNMzTtx7fvjltOKUjRYF3j3bkxfjuaNw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3320.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39840400004)(136003)(346002)(366004)(396003)(5660300002)(6512007)(6486002)(6916009)(316002)(52116002)(2906002)(6506007)(8936002)(66476007)(38100700001)(66946007)(66556008)(36756003)(4326008)(956004)(186003)(16526019)(107886003)(1076003)(2616005)(9686003)(26005)(8676002)(6666004)(478600001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?W+Bu1b6q4bt351hOdvAzyYGvfjqG34rf38RTtZpcaDp19/iqsfZWb+arflEH?=
 =?us-ascii?Q?AeD5i/Fcs6JkGFqB6INFnDFzPOK5S5Ujj13avX7ErBxwJhxfz4DLXKrT94AD?=
 =?us-ascii?Q?sUACLd07f7ELKnG42n6H4ws0+oTL3LUB2CEuDJn2wevIOibiR66rfT1oZfg6?=
 =?us-ascii?Q?vpk8GzScm9fLPv2JCdF6t4mryvtcbJBOHC5FbLgT7fpuveQszobxHJL3RL7T?=
 =?us-ascii?Q?+uEoHhTYvZrJOhmMs2MS+GIRwerNG1LD+7u6vIU69qlyUUT/gwcE7rCsd4qL?=
 =?us-ascii?Q?susbqdwUIvjeaFIHxsjFBaC6JXjBtTXQanHmmIgu2L5qWD6zKRxFPAB336To?=
 =?us-ascii?Q?cm0zPZwaH3KHKrhiabGhD2DlTNCfW6/qM5Qxsx+ax8XfIg1jPJgqBKuBFt8O?=
 =?us-ascii?Q?effaMy8lXnMtvoEpIyjLdaaM67qSKZqVUzRwKdFBvLiYUq6RgkuKpVlr4skF?=
 =?us-ascii?Q?kHCm8+icsGNvXfDhATjI6dpJeVDhO35/nOhEHeQvpO666JT+VubQV7WDTtiw?=
 =?us-ascii?Q?cYt6QbEPRrXDf3096dgZe0DP/lNJT1iQSWfzqhbte6ySoeG5YS9rvf2lPg8k?=
 =?us-ascii?Q?qsq8/1/P/43nn6DHcUD3AB5+Nm4Kr/FJGYnpH6xAQcc/jhvs8uZ7GxwsYMN+?=
 =?us-ascii?Q?CCWhkzYNf7Fe3FoNE1CNKIY6FI9TaI5Bf6hlHMPxmQr/B+GeZADq5X03xtTJ?=
 =?us-ascii?Q?m9b/xyCQ3itJLVhpcPuf9CA0/hp5xFEWyMaqeL1OZOrl5ovsnqvM0zrXy75X?=
 =?us-ascii?Q?FYMPc76zPEINcDF3+qnDlTKCvT3Rw3GpyxiIO4KRORJmdCbfo0LJSN3w+0bU?=
 =?us-ascii?Q?FlrJgPwWf1M+onYA0kwac54EWxLSKlBiD+sDtWaiQYUjzDqxU2PY8B1pJoS5?=
 =?us-ascii?Q?Q74FkbZqMeyXg7wqbODPWnqpt036+j8NxGEmdercqrXWM7RZS0bKUQejIZ3U?=
 =?us-ascii?Q?UpVTqir7OUtcOVM6esDh5zxIG4VDH0wkz3Zkp2mytDekqKiJyk+w65m8Reeg?=
 =?us-ascii?Q?un2xQm5owPqTx3vs12Qeti+15OupAtRriR/gTBlbt5ZzYfCHLZx0JuKJRb+p?=
 =?us-ascii?Q?E7B6kT/ZgWwufeR/z5LSmUWWiEwp67Q1MTtIrsgwnTaUvDy96c3zREdDfmFn?=
 =?us-ascii?Q?8gRysZqHo7SfFKFOOL8KgFDwG6QoIfKo5Ls+FzFUNSwbQN1oERLiOQZvjm13?=
 =?us-ascii?Q?eOKcpUDlqLZOjSG9BOTZ0+UnUaLx6Q2+OCcG6ck5HVAMhF3SWYlPlGbUqVzE?=
 =?us-ascii?Q?SQvIh6izWEZ3T46Wvn6VdiDXNv+T3c9Vnb+VcoE+4nmtLk7b8EeMBgpQz23b?=
 =?us-ascii?Q?wtT1YATjnI+DYr95uDk3iQpm?=
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c7b8965-5181-4e75-b214-08d8f26857b8
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3320.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 04:08:43.6886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vQ5gx6yBklfp3TNl9ZKUkl8ekB9cotntQLec5nXFX7RON4ZnoVpDO+nxrUD4Jzxd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB4102
X-BESS-ID: 1616990924-110824-5438-61566-1
X-BESS-VER: 2019.1_20210325.2126
X-BESS-Apparent-Source-IP: 104.47.55.174
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.231167 [from 
	cloudscan9-206.us-east-2a.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 MSGID_FROM_MTA_HEADER  META: Message-Id was added by a relay 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
	0.00 NO_REAL_NAME           HEADER: From: does not include a real name 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=MSGID_FROM_MTA_HEADER, BSF_BESS_OUTBOUND, NO_REAL_NAME
X-BESS-BRTS-Status: 1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Ben Gampe <bgampe@digi.com>

Add recipe for python3-pydantic: data validation and settings
management using python 3.6 type hinting

Signed-off-by: Ben Gampe <bgampe@digi.com>
---
 .../packagegroups/packagegroup-meta-python.bb       |  1 +
 .../python/python3-pydantic_1.7.3.bb                | 13 +++++++++++++
 2 files changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pydantic_1.7.3.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index fd78ee0a2..c0132abaa 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -498,6 +498,7 @@ RDEPENDS_packagegroup-meta-python3-ptest = "\
     python3-prettytable-ptest \
     python3-ptyprocess-ptest \
     python3-pyasn1-modules-ptest \
+    python3-pydantic \
     python3-pyroute2-ptest \
     python3-pyserial-ptest \
     python3-pytoml-ptest \
diff --git a/meta-python/recipes-devtools/python/python3-pydantic_1.7.3.bb b/meta-python/recipes-devtools/python/python3-pydantic_1.7.3.bb
new file mode 100644
index 000000000..637561c8e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pydantic_1.7.3.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Data validation and settings management using python 3.6 type hinting"
+HOMEPAGE = "https://github.com/samuelcolvin/pydantic"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=215ca7f54cdc98f95ee96c7511d64158"
+
+RDEPENDS_${PN} += "\
+    python3-image \
+    python3-typing \
+"
+
+inherit pypi setuptools3
+
+SRC_URI[sha256sum] = "213125b7e9e64713d16d988d10997dabc6a1f73f3991e1ff8e35ebb1409c7dc9"
-- 
2.25.1

