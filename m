Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.62])
 by mx.groups.io with SMTP id smtpd.web08.94.1619718285675700406
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Apr 2021 10:44:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=cUpJws50;
 spf=pass (domain: windriver.com, ip: 40.107.244.62, mailfrom: saul.wold@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W1p1Jjxtf22fwxgtYFuL+XUUb+0y0bLW7zfg26sHFdQ0R1DQ6DgPMj4e/ANSkoI1XLgr13iCU2/cJsD0yjB/t5MhAvIMbx//F+dOQU+sRGZBVc3yYGBVPpgUeRAXfU7rD+u9T4N9Egub9sl6NzaFZV3PwHBvOG0zI8DAXlbIEOOr9D3ruwnWfGn4//GB/N5k0tlguxkX465JQqcb2CzFj2b/jchjD4+645hCDoy8haca/yZBeTztNbssT8XF8zePplIQp3/tR5OU0dwlT2iingKFUX42xZxPTj4M480ZUByWYr/IMFzbv/C9OaYLpEdOV32tk9NaBF0DocnR/QptEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sea9n0iaDkEBEFcyAdcARuylNOSKl6mcmFsOzJKGCoM=;
 b=kPZwt4PfGnRqas84pmoF36lk5AI5lE5RGJ/9soIeuJNWBTdSs3j7x2lj6T6kb4qklrZB3NJN61f4B4IKaDLiot+2ajQMksrNmZNm50UiEGUdIEYKDoHi7cD4LM87C15ngkaX4OdU6qN8I7Yh6Rea/zzm4tWqwEjOfYF/U7TtXbPFajSgLYManWBtyfW0ChagYCMLBF9RX1jtdAnec1fMbWxvSu27a1GuxT8q9nelylY2YhQLnK9U39+Gjk8+1dryqGDTcUoO+GhOj0aGGbdu3GsI3vyAAWb9MsDqhrsl66pum/Enu6NRKHqjV3XH6ntGH0KuCKNJbNIgbO42KxRLHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sea9n0iaDkEBEFcyAdcARuylNOSKl6mcmFsOzJKGCoM=;
 b=cUpJws509/40LH7ZxZqoNTGTbmgvjpnWTpDno/YtTdt6orBFZma0swcLe4Pjh4pGz2DBNCS1CLATwaxnh+0mQTAOe/tXsGdfIznnUA7GU/XX8xo2gJkNdIq1HWkniZkR5UD5HSIYAgIIvoh4QdQOMNNAJyj3EFB9m/Aj04PNNJM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by CO1PR11MB5106.namprd11.prod.outlook.com (2603:10b6:303:93::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20; Thu, 29 Apr
 2021 17:44:44 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::351e:20b5:1ef6:48f7]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::351e:20b5:1ef6:48f7%6]) with mapi id 15.20.4065.027; Thu, 29 Apr 2021
 17:44:44 +0000
From: "Saul Wold" <Saul.Wold@windriver.com>
To: openembedded-devel@lists.openembedded.org
CC: naveen.kumar.saini@intel.com,
	liezhi.yang@windriver.com
Subject: [PATCH][meta-oe] tbb: Disable PPC as COMPATIBLE_MACHINE
Date: Thu, 29 Apr 2021 10:44:33 -0700
Message-ID: <20210429174433.2615632-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [71.238.119.71]
X-ClientProxiedBy: MWHPR18CA0025.namprd18.prod.outlook.com
 (2603:10b6:320:31::11) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
Return-Path: saul.wold@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from soho-swold-l2.corp.ad.wrs.com (71.238.119.71) by MWHPR18CA0025.namprd18.prod.outlook.com (2603:10b6:320:31::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.25 via Frontend Transport; Thu, 29 Apr 2021 17:44:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 87449043-d2b3-425e-3978-08d90b367989
X-MS-TrafficTypeDiagnostic: CO1PR11MB5106:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB5106AD6BC553F44F82B26293EE5F9@CO1PR11MB5106.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OVMYCbMm7KX7ctD3UNVaBGfotQzRQc6OqPLY0b/Dzi3nse21nOLKoEMDhh7j/jXyK8VC9KNgO1FqZKmGNtmrbh2rLVjFJ80gXcc36INvjY1nLKJuV55ObFuLB8Pu4fL53g/t4iF794Ehjva/394VgDZvRLy0kh8Hb6tQI55HlNF5ckVLUMDvbU2WfQg76SV56Ldakx8W/zPgg/jivI5UtV740RRW7DtYH3YeqFMV5fG/PSRduOP6MzN+pwRmXaK2jMK/cfipYERiNxm7jS3ihsyYQBv1Lld2Xv07ysK0/W4nzIqNrYUfwmQd6iANSG3GCrNPIvWAm0gkteF1ul6dBN2aVN4esBsJBWK3OdYN0AaHiTkcei6opyGFxLi1wloS0te9TaKDhd1h+z9Vf6i7t/CDS/Mr2Se/XYzvDWQ21N9Fi+Nmux5z7GaNI05VvK79Tl1NsRpnrgWQoJL1Qd51vnyazPkTqGLhqux4P62f/fe/L0jq63fk0klVC1zVkX3laJySFC+/xPg1JnLtlO+uJrrlldBJSopMiU/79BiH4Isabo/pApqdZlx/IYeAlaXWrf6p1s8239AJ+lPYFXYu6qzujLn6zsRwHLj3rBEQ8eqctM/YrjkkY2M7pf5CCeLduA088WAfYLfkDBaLa2QTjbER2lORw3/oS7NRhjITQcw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(376002)(396003)(346002)(136003)(478600001)(6512007)(8676002)(2906002)(2616005)(86362001)(1076003)(5660300002)(66556008)(6486002)(186003)(66476007)(8936002)(4744005)(107886003)(44832011)(26005)(52116002)(66946007)(6506007)(316002)(4326008)(38100700002)(36756003)(38350700002)(16526019)(6666004)(6916009)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?8G/fTKf/ubmFvI4l76D+lJglENOtTgvFxIg+hcq0lc1aaLHadKJJKhaxIsza?=
 =?us-ascii?Q?edpQc6lkfHr176VgH1YSHPToRLGGJfH0jKrOURyqITgYYgLYk0/++yBOTlB6?=
 =?us-ascii?Q?uS/bFQfmOPXXEcS0Bny7/CQq7uPIi9Q5VGn0319CpfR3zK0r+ZX96DfjMN8/?=
 =?us-ascii?Q?FQc73oAIxauGsQcfPbKPhd5P1ONtqAJjO36Of5qZqAfEC/d6DGz+4/q+MO6H?=
 =?us-ascii?Q?xet2/Nb3L04T/oRjk78MbCC/OL+1SqCbC1mqVOh83q8hD8S29yAqc9d1Px7f?=
 =?us-ascii?Q?wZsmZZrCafP/0H5eBrq376KyZPfqknn18ZEPOSbRIFuDn0KXVO8C6hjCjsHE?=
 =?us-ascii?Q?DJuXj/JzWsK1Nr6gQKF100Hsywyf2RIQrpM5gAuwv/qt6DOKjr/fjWjfculV?=
 =?us-ascii?Q?KB1a9zI/ctjkL1hLQEmjcuVD0TtsWgtH+peRukDA5s16kfdO7vM0AdujXMf9?=
 =?us-ascii?Q?2dDqRobBOhrGg7/uAmpxfJyjXhhhGG5cyG94/ZemTO0RXwH1ZymJAnJg9Y09?=
 =?us-ascii?Q?YHbXpfw2WFEzt8MOx+B774NDaWzUlCB83PTBVtVWEk5iLlk9WODnwRPD14jA?=
 =?us-ascii?Q?VjZSH0j92nmOUbllVqPNgYi/E8TKekrcQcqnf4QO6QrbMCH/zYJ/qpScMEAF?=
 =?us-ascii?Q?GvtcfscGKd8LnS12aH7Z6+n2bJMFXCdUpUhYmClazSBJlq/KnwHYsyzCiTiK?=
 =?us-ascii?Q?lEQOHv0uvjzOez8q79XkCZ8cBIe8esHAZubdqT/jHg1yzL3D/cKt3HhZgusp?=
 =?us-ascii?Q?Rm7WS4PnJ7u8o/c3IovV3O6MJOxLz81fC+yHGFwZMpzuFQXHXlUBd1fNl6re?=
 =?us-ascii?Q?uR9lCHeQqyA9mZBAxF35GDjQs93+Lh49e3WGPvIPcAMzg4PsJmTauKCuYZt/?=
 =?us-ascii?Q?YMACSQCOVhyUnCKJ9wRXUD3Zo0nXKpQqA/hgM9W/Wbk3dnliPWu69CRhansb?=
 =?us-ascii?Q?OGpIs0mPB5R2RgafDoWZMVd4CkUsh6VFeUV7ITgLC8XnKbQL3nNJH/mZUtL4?=
 =?us-ascii?Q?ymPU1BNIvH1GmriIc6230+zhjskenWpba2aGNCLihNMCqJgLS4Rhj/8d6oX9?=
 =?us-ascii?Q?GZgghXFvkO4cZkUP10OGKhKwq/fNnBQBHUacIzNVXhd1IrTK8LRmq+1SoraB?=
 =?us-ascii?Q?0kYUNoKquGhF3ZO6/7s/DDglRjyXDxxmGtXZ7r85gv+Ed2eWlTlBjctssALC?=
 =?us-ascii?Q?zEsWD8ECpHA8vQZE51wy7UqQStQkSI9Yo0Y0B3MULNwbRo3J9RIZYBHtPyit?=
 =?us-ascii?Q?SmPe7/Ql/tsb7fh3X2bG7DbE8IdA2ZwNNZobQdBN+xg5z7z7IWreVNbt9xIB?=
 =?us-ascii?Q?d7m/9EwtmaO5Zky/ZD2RMCjq?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87449043-d2b3-425e-3978-08d90b367989
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2021 17:44:44.7340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sS/zZOTBfkW4er3ncXs55qcnHp9ASBuYU+mHUtA1vYxepz2lYmqPmXJOziOQQf0PyZ1GMoUeBE4pH0y6a+LsUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5106
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

The latest version does not support PPC architecture, so disable
the it. Otherwise the following error occurs:

/srv/nvme/yocto/hardknott/builds/tbb/tmp/work/ppc7400-poky-linux/tbb/2021.2=
.0-r0/git/src/tbb/tools_api/ittnotify_config.h:338:12: error: '__TBB_machin=
e_fetchadd4' was not declared in this scope
  338 |     return __TBB_machine_fetchadd4(ptr, 1) + 1L;
      |            ^~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta-oe/recipes-support/tbb/tbb_2021.2.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb b/meta-oe/recipes-=
support/tbb/tbb_2021.2.0.bb
index b05a59dc7..d8a18866c 100644
--- a/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb
+++ b/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb
@@ -43,3 +43,6 @@ LDFLAGS_append_mips =3D " -latomic"
 LDFLAGS_append_mipsel =3D " -latomic"
=20
 LDFLAGS_append_libc-musl =3D " -lucontext"
+
+# The latest version of oneTBB does not support PPC
+COMPATIBLE_MACHINE_powerpc =3D "(!.*ppc).*"
--=20
2.25.1

