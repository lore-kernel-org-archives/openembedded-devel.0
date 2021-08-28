Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.73])
 by mx.groups.io with SMTP id smtpd.web09.4924.1630165494137079886
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Aug 2021 08:44:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=LUtiO/KJ;
 spf=pass (domain: vaisala.com, ip: 40.107.8.73, mailfrom: vesa.jaaskelainen@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XJr9xLa1XfXvDsj5LjOl/6qHTgCc/PMk1vi0tVnlYLc+q8UOesNOU5iaLXsc24/9EHQIJaqzRl9bJqRqrHJel+oxKM0cUxEX6g+eY/A/06wWLH9s9TeiE0p9FZUte4KkGkwZ923H1U++WQPvhiDeyS58uE1j6AT677AgszjuYZR8I6U5jYMC3NtwKSHpc7IIgUxpKDLNXWDfprZeWVR47xGod7V97OekqLITK0kAtjcVmO9Eb/i4GYtOWM0Rw7/X1ifNExCcm4nfCzm9RAZ4A/aO26i+4yRwMp0z2SeH0hh8juZTChglU+Audoch/az73zH6fWDKpY6BYSnTHlOR/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0pK1pZmTugd1cP9nDqOXIBPehChN7FBEeaW1x6gQOrg=;
 b=Dyad2xyeDJTGOv+POkRNj4D8shdYiAgxrJWqg5fuK340GrHk9aToct3cZHBKVbRG86eWzemG2u1Y8QYqNf7B58VVlOLn0RIjkXGI06/kymQL5yRIGuzt7MbYi73Kb/irki/LRPoJ4/cVuyyky8A9CwPyupdUKgQ/ChnUUQ068KacGsy0yFOK1Wf83zt66IePxKdpeplpgmdzNbUaW1cmR/k71GWz4/v52cL0lmVblPhihV2aXoBwrXaMrqEvtYRSBjDUgYaFpUva3tyCjaCwjKQd4Wo06hg+RbL5WJf29EM3V9y6qbxy1w9nabT0I+ge8GDVww6iK/7BPr4zOSqJvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0pK1pZmTugd1cP9nDqOXIBPehChN7FBEeaW1x6gQOrg=;
 b=LUtiO/KJrC2IS5RFmBG71xKN2DyinS1hIh8ERek9w/KXNJZLIfFqcdKXxNYvvz7LAAwP8J4JsuxsP3v8g29Lax6o3mI1cSULOTwb/yiQM1RbZMdCP/XgmOXaSR6AE9/CnOY2MX9cvs1wiq1gfOyxxWHMlDDoSH8CAxuZ+ZH0mkTfTQW68Upg9VTuTn8sY596qQDMrGPICAfQ09r9/k3llCngxsOuURpY2/MUs2kQKkEBul130zRw3ewRwAw+GzcTIecPWrxfBCdAYMJDiz1QthhisGraAK3V8le9+kr7iGpMQFYpM3tyHlvIfJHALEen+F8fh0tIybu2M+qYYLea6Q==
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=vaisala.com;
Received: from HE1PR0602MB3241.eurprd06.prod.outlook.com (2603:10a6:7:17::28)
 by HE1PR0602MB2906.eurprd06.prod.outlook.com (2603:10a6:3:dc::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Sat, 28 Aug
 2021 15:44:50 +0000
Received: from HE1PR0602MB3241.eurprd06.prod.outlook.com
 ([fe80::213c:5e2f:60ab:ecf4]) by HE1PR0602MB3241.eurprd06.prod.outlook.com
 ([fe80::213c:5e2f:60ab:ecf4%3]) with mapi id 15.20.4436.019; Sat, 28 Aug 2021
 15:44:50 +0000
From: =?UTF-8?B?VmVzYSBKw6TDpHNrZWzDpGluZW4=?= <vesa.jaaskelainen@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: =?UTF-8?q?Vesa=20J=C3=A4=C3=A4skel=C3=A4inen?= <vesa.jaaskelainen@vaisala.com>
Subject: [meta-python][PATCH v2 0/2] Add python3-pkcs11 recipe and it's dependencies
Date: Sat, 28 Aug 2021 18:44:28 +0300
Message-ID: <20210828154430.667610-1-vesa.jaaskelainen@vaisala.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: HE1PR0701CA0062.eurprd07.prod.outlook.com
 (2603:10a6:3:9e::30) To HE1PR0602MB3241.eurprd06.prod.outlook.com
 (2603:10a6:7:17::28)
Return-Path: vesa.jaaskelainen@vaisala.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (87.92.181.210) by HE1PR0701CA0062.eurprd07.prod.outlook.com (2603:10a6:3:9e::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.6 via Frontend Transport; Sat, 28 Aug 2021 15:44:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 46dc37e6-a503-4e1e-7c07-08d96a3ac57a
X-MS-TrafficTypeDiagnostic: HE1PR0602MB2906:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<HE1PR0602MB2906991ECC2E81900E10B156EDC99@HE1PR0602MB2906.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LTOsGiJoryCUotTGdPCY1CbkkN+FRid2ZksMVms8ocs988HWrooH3O/pHUt9x2JLZDUDz2t4KByIg9ebeKM2BQkAGUEmsVyMLC0WrWmMgCdfqh8XwoV8fObNOyh+SVycEHj4T5m9K36h5R4bo5INdbdtnvxgIf5EkWTBvzhPNwnsH9J4vcgjwcdwerH7keFqANP7cSX1+q6JrqN1SwxdNYYm7KjYtc+9xtNrKbX5FO4jgYYZWpgCRAOQc7yGkeWmnsy1TgNrue7KVZdBL9BfSXQHpcY0JdZZ43EiJIdoKfJnZBg58UqSBcGwjAIbQxBV++D8BS2DwN8BcpvM6CVWNWfdgBxazs1fjePBsz8bx7r6uPqpRrfj2/rWhH7Yl2riaE5kVVHV6UKVrwC5cF1SSWlpiPhT/0fWg/PS0b3T1Ji2+m0mfIjKZmr6fZj3hkSWViKOyPOlSueskAtua+g0Wn7rtWUnt3t7OqIxjaU3m2NHlhqd2yCiRMCeTvwJ0mMwRbxeCTKSJg05D16uvqLMlln3uQLov/vib5vZa2+XyICT0k+P9Zo0ZNrg//xseFHkR/TmS1rN7VxMsKL3scyzM3DPUxlF5srBHCmcF5+lsPkypQ8NIFgtT5t/R9Nj2Cz/GPHOYBMVBQV5ayXAyCpBjvg2fsj+VFPdQdp8LK/WlklKwjQVGadIHfWGUXGv88PiTRJI9DkzpLnkhWhWkBWCqQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0602MB3241.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(376002)(396003)(136003)(366004)(346002)(38100700002)(38350700002)(86362001)(2616005)(6512007)(6486002)(5660300002)(8676002)(66476007)(66946007)(52116002)(66556008)(36756003)(316002)(26005)(6506007)(956004)(6916009)(186003)(4744005)(107886003)(1076003)(2906002)(8936002)(478600001)(6666004)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0cHQMeWSqskHw8v/Z8E+Iz4cRyIHBQsFfXRRRp4ME70J20JwYYXOYMFA/NIL?=
 =?us-ascii?Q?ICpoOQ66YjjG/0Ewq3egSnlt2ACRCCEZLyPTU/ntygB4sZdVl1MdmNHBdLL+?=
 =?us-ascii?Q?BcsgdDNoeWJGEIF4B+Z0q7bjqZJjffP677WzjypQhDQNgt10YAPwt+e4K6C8?=
 =?us-ascii?Q?IcbNhh7seHCOQUNo6TWXxXo7udIX/WSNbDi2L31vgOwbDHk8pjaD5AWACdHE?=
 =?us-ascii?Q?oe/4StVPfKzIsFY/gntVEj2n9BWwCO6q/DeDi0VI2KicdfLinwAAFmhSSuIQ?=
 =?us-ascii?Q?j00qij7Ov36V3vRl/2Od8IyJd+/4Gg90Y3/B+O/iK1ae0C9dD85hBE8ckZXh?=
 =?us-ascii?Q?Cn03SyGs/X0eTzleXvchPjWn/MHMEVzblGbd1BTYmgGkcvajkHZ/lYqv0AKf?=
 =?us-ascii?Q?1AKXy/niZ021AZCF76RO8GAzeD0ZquP8NRgimO9AZsCvhD8Y0ZBUhuE19M/o?=
 =?us-ascii?Q?JUj4OGkktMWeZo0z8Wz4u617VNfQJ1OL9aJRZkWCVlCpBgoXLe1pjV6LO6hS?=
 =?us-ascii?Q?f+MoBgmxYYyMrBpONHd8np+WrME0tjJj0eOfnN6XCF+5DV65KlxBSLHzyRm7?=
 =?us-ascii?Q?U7cZFk2Yx2sHqngd+3/gURLZQtsqtp+FrI5bLnCtGUGi1BTLXCE+I0XCU7tz?=
 =?us-ascii?Q?ZviL0ienmxMMpX5nZGv46owFVJD7UQo7QdXGoQGUBljJrZ3gc1Bcn7tKxTyA?=
 =?us-ascii?Q?7h7QerZdN8Ci1QKgtxOb7fvzDKHU664V9Pch9M0No3GVe2Q75cChQPhgfRBY?=
 =?us-ascii?Q?7shDMhpa7q7X7LwirnRpCFBqPD1xl3rsJUj96u3yIjdFJ3nj/RqMWnZWZK49?=
 =?us-ascii?Q?NUeX2cpnkAy1Gjbn2I3UNGjNRgCFNKYtmVnkbhGFSZLP9RwaqYg6+jvXSVdX?=
 =?us-ascii?Q?nEFA+N0k+INExZ3gLHmid+CrfsjfQZd8y8aTh7UpzeZjOy55a70L4njr3VeG?=
 =?us-ascii?Q?XWPznCIhhlPv4otQODIXjLl4ugjWR0ycKG/NbfCsI2YuVjGhSW2hAHJPcasL?=
 =?us-ascii?Q?qUJcj0/hpNJ2Cvi86jk+6HRtt3ljIBvxBHgNfaerQDx7mRVxzIKnQq7raFaS?=
 =?us-ascii?Q?Dm6V/YhoXXUS60SBXfVJxw32CR4Zv1Tnpm3onkHK+5YaOkEieHd904KZclb3?=
 =?us-ascii?Q?M3PcH8ZdzzDcHUP2UlaYWOgBPek867AZvSgLuuNWrCuGDJ6bdf8k1Aj4ZeUI?=
 =?us-ascii?Q?qK01mpN+liwbN79Rdo+6tayIXIiFAZpilh09sF+THR7ZqXUrN8qDGapoxInl?=
 =?us-ascii?Q?DMUyifkUCOJAxAIPWkjjUcndn6ZNDzg1fUTY/uos28Au4KUVnZUKNgdKoqbC?=
 =?us-ascii?Q?URr/As0o/q1vk3K4gjd6TGoQ?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46dc37e6-a503-4e1e-7c07-08d96a3ac57a
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0602MB3241.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2021 15:44:50.4611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: av93/OnQT0Sn2U6rplbtFJacbou0I9hwMcVUc/O8Gpymax/r6+qhFqe38M17aCWxbF66I245FhVeEEC8Bh6q+fiDmaY3/dmrSUAWoAaobHg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0602MB2906
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Adds recipe for python3-pkcs11 package and it's dependency for
python3-cached-property.

Vesa J=C3=A4=C3=A4skel=C3=A4inen (2):
  python3-cached-property: Add recipe for version 1.5.2
  python3-pkcs11: Add recipe for version 0.7.0

 .../packagegroups/packagegroup-meta-python.bb |  2 ++
 .../python/python3-cached-property_1.5.2.bb   | 12 +++++++++
 .../python/python3-pkcs11_0.7.0.bb            | 25 +++++++++++++++++++
 3 files changed, 39 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-cached-prop=
erty_1.5.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pkcs11_0.7.=
0.bb

--=20
2.25.1

