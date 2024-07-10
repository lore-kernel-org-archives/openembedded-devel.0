Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3875C38150
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 06:48:57 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.8109.1720594136796454136
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jul 2024 23:48:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=792143356b=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46A55sug005708
	for <openembedded-devel@lists.openembedded.org>; Wed, 10 Jul 2024 06:48:56 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 406vw63fms-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 10 Jul 2024 06:48:55 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nmdh8eR7zfLy05/Zab9ww9eGVNmN1h96AI6hWJgJnMx0S07yC1JUhsDtd4DsdjFRdKwDy7iIGS3DsNSz0lbhhFj3fEg5MMKzQX5bCBSmZlz+0DA7iT5nOTl5CDQjp09hPjWDnUrcbGK+Dw8OtAf+16vwq4kDQt99JUws0z7SzNKMoy2I8gCiVJRiIFmAhi6HuRz0N9yyU9ZzXvwvnyxB1E0uGO3QRX06iAOkRQkVzdXyMjSdzqn7NNCiab5jL6ni/MGmJnm7+Pqri2m3uT8INuadd7TgJzEjeoucqt9ihqL/xNpUDWJ51qkM68PIHmHBW2AMMIzxbs6mMwtKqDm31Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J0JKYDkHeYCabZdlH8O0hd8r5t27HD01vvSAWGkn5Vs=;
 b=mQLRKEoWM6Ghuox65GT8R9wxmI/CUtZYaIzjYytXLuQo28YwKwHlocBb/ZqXjTYrvDHzmE8VGW+WLkt0hSpMOue+FXQCY9txmENqKWWlEwGjHafX2z3Kn0R7gVFBGC2bLM9rWqLrRQIljLVo9diAcBBqz5Xn8KEw4woJeAjPJw7XqO+h/RBDGDEY9Csx2V44J6MXNWXdghAK3SBeHGspZ3FlhKz3RH269Cp2WIvsjzfA7TCDfuYcFKFt6xB3J9Mrd2nJyXnmnhTFncdF6OjR8xblsDihjFGOZBegGIr45aztoEV6qWud75bYGb3YFfdm9UD9rbvyKSTD8CKxesmYKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by SA3PR11MB7433.namprd11.prod.outlook.com (2603:10b6:806:31e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.34; Wed, 10 Jul
 2024 06:48:52 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%6]) with mapi id 15.20.7741.033; Wed, 10 Jul 2024
 06:48:51 +0000
From: "Yan, Haixiao (CN)" <Haixiao.Yan.CN@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Recall: Subject: [meta-xfce][kirkstone][PATCH]
 xfce4-panel-profiles:fix tar error
Thread-Topic: Subject: [meta-xfce][kirkstone][PATCH] xfce4-panel-profiles:fix
 tar error
Thread-Index: AQHa0pU5xs87HF1JFUGejYaIjTlwbA==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 1
X-FaxNumberOfPages: 0
Date: Wed, 10 Jul 2024 06:48:51 +0000
Message-ID: 
 <CH0PR11MB8189C5239D58A33DFCA6A6AEDFA42@CH0PR11MB8189.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB8189:EE_|SA3PR11MB7433:EE_
x-ms-office365-filtering-correlation-id: 69a4da29-144c-4d25-993f-08dca0ac5c0c
x-ms-exchange-recallreportgenerated: true
x-ms-exchange-recallreportcfmgenerated: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?6u6WcRyliaAfdnwdye4OKmbMiYIlZbyjFL7ALNpmhp+wQIi4GAtLEe/gIW3s?=
 =?us-ascii?Q?Udt8ZIKbqoQ6gGjhDqilHhsWZmXCuXTmhod9Y59oP2pR5ucPGL5ZDpZjKf4Z?=
 =?us-ascii?Q?6BII1//rwaaSgpB/5Dr280sw2wxQVU6FFrZ+4g1LHBH3UULg/J5v1BOppX3P?=
 =?us-ascii?Q?/zzGDUnx3PxaTAoClL/5FIDyUIc2s68QZ5tTump3dJpp7stKRwSeZgLHbWNc?=
 =?us-ascii?Q?z0cr75gRs/NJr5M9rdZB6wmR0iTNnE0zG874FxNToDsvqZnEfFsP8ejzei3s?=
 =?us-ascii?Q?SGg1eHcOQUKEci32QelOayun978Kd39gwlSXZe9XQzleHRlnyn4mAcs89OPZ?=
 =?us-ascii?Q?tCRHMyybSfy3Wa/zIF7LyrS3XEAhsKy+lHLGJZ9taFB3vZYCxE4Ge27UxFs3?=
 =?us-ascii?Q?LSyQKczhjjaTNKRDrPJlB9tjL020DSDskMsPkWV9+GsBNEbLuavzm53rp+VX?=
 =?us-ascii?Q?Zq9FK04RvX8XngYvmoznRdKA6RFS4yKWwijDHFptZPEBp8J/g1oXUmoE7fA/?=
 =?us-ascii?Q?mQFmRElSlMokS6PDfouyl4Rt4CzMTEgs8AH+ILTvfOFrx172RACk2CVrvwaY?=
 =?us-ascii?Q?ebaP73jlX3sRVmYN+kdQr5/q9gTcD5XCM3/nrpR0fCp5TkQusvQvGcDo3Sa9?=
 =?us-ascii?Q?1v43bw7SCxvMhstZWivHcsV3EaIqCivmIiO5Lpd6oR0qzChrbGJd+SglGZ7/?=
 =?us-ascii?Q?fRXyN6kU6QTHNAMNNrEIcS+0E3okuWrhm/JHvssSy6Us54BmX0oHf+UmFUdd?=
 =?us-ascii?Q?KjIG9ikhme34NXsiSMdC/yIO6oQdh8M3v120Vzk5Hm6+Ap9aJqO6cDVUmDjY?=
 =?us-ascii?Q?2zx5CdTPWIQMBePVOlrLqgAXH3H/QDL84f5l0gr/uue6I6cZ3kMTUPdm8B2f?=
 =?us-ascii?Q?e44NwJNQVr/RoIZMqKJ+zQWgE47A+Y5cDFUX+I487mln3bG6StYm5zlaMQOi?=
 =?us-ascii?Q?BL7sjn6i4DC8EGzGWN7zR5D1Vz64s6UvZZZW1LOxXWoSrPWKBUbK1rf3Im8r?=
 =?us-ascii?Q?fnBVsQbA9KIgM/0lbe6FPagm/MpskKiJalswGJh0c9bGY9j60VQUwLNpp/ke?=
 =?us-ascii?Q?ALclmbkaa5HByDIiy2dHtvAI8UMMiDijICHAUzRCkLaoGPxQfgerU5IH02/P?=
 =?us-ascii?Q?Or97oHOJfvOLVjnArGjnpCpn7LasrZWTi12WN7rMc+76DBhiVftqrvnYyjt4?=
 =?us-ascii?Q?+RvMY/qxVfWB98m2LXKO1Vw5+RI8myx/L9MTRQ/PA0woXdLMfUviSUdFzqke?=
 =?us-ascii?Q?HM4aUU9pXKggLGQzJW+cyHSO/2wjL11vVY1PJxilIhyc/XRs3hvupQPHTI2a?=
 =?us-ascii?Q?Db/fGfOA4z/lAXGuIDpXsQxDRaaeQICrH/w1BiPIQ3XkfjubPXZhKk7746q1?=
 =?us-ascii?Q?/mrxG9ORI5jg6XxRBr79hjuxfXuEvlhEYQRwB84eNTnSsSD1kQ=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?7JJhISabx2tlPrv1PjtbsUOdyiXvWiVc4FO4QT5IEOJlgTlglvujqZhdMi/D?=
 =?us-ascii?Q?NNczUXeQ/ibaEfjmHY4LKG035d028BWFZVsABWMe2eNqxio5soere0UNZLa0?=
 =?us-ascii?Q?3LFUh4W1KnLnJc3jiIgyWX2QO/RK+d7QErPt2zjEjo+SI54+lha/zGuF7LkW?=
 =?us-ascii?Q?fwcgH5Hbgp5syVaZpHPnNg7suP4lHiAIPMwMDC+dx/kAviN4pBkLJxjJLe2e?=
 =?us-ascii?Q?kaDmKeVJJuzAOIBq2zfJcFB3/SpOSWp+/Z5iRijJtq1OZ+MU+MpY/rMkqe6R?=
 =?us-ascii?Q?BaF+ew8IfX4CSLMcEGO57xznS4LVEJI52hcRhlCESHDTS02R5yFV/Um0lkAR?=
 =?us-ascii?Q?3hyxh6WQvEJHsGDq5XnVFZt9SLplsNl3dcy+jj5bFLXpKs6fQtU3UrHlOxFv?=
 =?us-ascii?Q?rX7/+gcqpj+FquxuRzp76337q/XhlBDo9BEVXpwIOKndM1dXfQmIa71hioUd?=
 =?us-ascii?Q?nLWbmoY3uByuBL6NqCNfmAbJXP2uokb+RiI4UQ/GoPAr5/Nd/oR6ImyFwDxL?=
 =?us-ascii?Q?gtIoWL6tBsLD+MG2um273tIfErTlpLqFycOqE6fOVob0hDbkbterRGebRLcl?=
 =?us-ascii?Q?57kaEch1kxor1PUxHBSynrJpIcijyZE1X7UxK2snTSM0gxawXkJuWt4WPOcH?=
 =?us-ascii?Q?4sqQZZjQu+h0zJ26wFtGuFIBFUVrQE2XjhX8I+2TBUjBJRvr6KtHNuHQoDmO?=
 =?us-ascii?Q?y/T+zZy9UUe19MbvPJvLWbZ8hhWghXAYtqNT/Adldbjb5ojypAJMsRgBOfiM?=
 =?us-ascii?Q?VtEc5orVFwjtq8FT9ppRg0xjtH4AB4+goIeOtQt/shRCG6w01OLSjw4g60Re?=
 =?us-ascii?Q?XiQPbpim9q3ri0aWtRbhsEpUiNvMx99Yjxxx6ZdOLe2t+m8pwIh0HAZ423ne?=
 =?us-ascii?Q?92sa9padCXrpEK0plSsyJ5Gd41oeERw1b4+ZIKjfXbfzqAhErn7vF0EMtjjT?=
 =?us-ascii?Q?8gDE+SclnLjI5DPAn2+rozs/b2mOh7I2GarJo8nAjZz5/1+FHBe17IGILObI?=
 =?us-ascii?Q?DhmUPpV5jcdRvtU1UZY7mkYZkvR4XKSfrIOxbuG+4jrZWc8bMQNvbK6M32A5?=
 =?us-ascii?Q?m0XAKLN7xHBVWCpbFsV9VjEgwFtxrAF49GhMgVZI5IilEZ/hiyXzU60a6MmP?=
 =?us-ascii?Q?ezcagFrksv/N2lYciPDOcBT1sWCgDjTZbY4MwMO585G06Y7Ng1McCYi6R+yK?=
 =?us-ascii?Q?CeA0NC12rqnLI/a7iMs4vp3VtfmqCx9EpeCMODVVPRNYth50osLa7KlxOmTB?=
 =?us-ascii?Q?0plVV1gL9MaDsZFr1+hRdVc7XLuEKSvtCysLhzuJL6ekjsUfmZ30NwC9Kp22?=
 =?us-ascii?Q?eZvOl+wU62hg93XTS9TtoWvlr4oUkjZLLAlQSMe0+BBPTeLdartE8oD0fupr?=
 =?us-ascii?Q?1i473XzEk3+l2LYJMyRlnJyw0fWkZttesWOpnEv4BjKtxCWPsboN0iIxVFtM?=
 =?us-ascii?Q?K43IYZ5Z0+Wl1zt8FNR8OLVK+x3JYEI1a/+QtcDbTkVaKo9UkVvpX+12slSk?=
 =?us-ascii?Q?uxkrBbJUcErWhdJ7T+4Bts3ZszNxMQy16xQlEbheY/oIxvaxa6+QeE/+4G11?=
 =?us-ascii?Q?0VTc3a/4caoHQv6L7EpFfL9Qey27dkop/Cts1dwA?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69a4da29-144c-4d25-993f-08dca0ac5c0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2024 06:48:51.8455
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jAlP1mCBPjpyprlnkhkhiaH6FYV2xNKo3oLOijRgF6BsjGsJvHne6q0qxceIo98L/Fgrn87uA3E6swdOgveP9Ngps9R2OutDi7Jua+44U1w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7433
X-Proofpoint-ORIG-GUID: W1624SeTAjKd9naS0o1MCYJ96dax1pEb
X-Proofpoint-GUID: W1624SeTAjKd9naS0o1MCYJ96dax1pEb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-10_03,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0 mlxlogscore=861
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2407100050
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Jul 2024 06:48:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111288

Yan, Haixiao (CN) would like to recall the message, "Subject: [meta-xfce][k=
irkstone][PATCH] xfce4-panel-profiles:fix tar error".=

