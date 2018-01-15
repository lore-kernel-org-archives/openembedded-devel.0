Return-Path: <BSREEKAN@xilinx.com>
X-Greylist: delayed 11902 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 16 Jan 2018 01:47:36 UTC
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam02on0076.outbound.protection.outlook.com [104.47.36.76])
	by mail.openembedded.org (Postfix) with ESMTP id 80F8C7869A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Jan 2018 01:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=+Ht7UTvxQnVo/x8KZyQ5j46vKFW9bb6WhwS9UEZ5rWQ=;
	b=H7/+NI+pVAHFX5dzM+95BnnZgu6FptQpOLjRkK7vxRAtFRViv6h7N7rzQyM/Ih5LvdDPrql36JaF1CVEuRcq7DDg/uCQvzqocNAZdbPSrHCp9pJKqNMqhhNFimuisX7hW5Khn/loGlxc74SCvvbbFIxvHuSz8e48euWmSAr9yCE=
Received: from CY1PR02MB1287.namprd02.prod.outlook.com (10.161.170.155) by
	CY1PR02MB2153.namprd02.prod.outlook.com (10.166.190.147) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.407.7; Mon, 15 Jan 2018 22:14:07 +0000
Received: from CY1PR02MB1287.namprd02.prod.outlook.com ([10.161.170.155]) by
	CY1PR02MB1287.namprd02.prod.outlook.com ([10.161.170.155]) with mapi id
	15.20.0407.009; Mon, 15 Jan 2018 22:14:07 +0000
From: Bhargava Sreekantappa Gayathri <BSREEKAN@xilinx.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-browser] Running chromium as root
Thread-Index: AdOOTKVSPgXrQD6fTo+JFcxujF1IQQ==
Date: Mon, 15 Jan 2018 22:14:07 +0000
Message-ID: <CY1PR02MB1287081D0CCB26032B3B05F3B0EB0@CY1PR02MB1287.namprd02.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=BSREEKAN@xilinx.com; 
x-originating-ip: [149.199.62.254]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY1PR02MB2153;
	6:tWikCm5y51R+TPDz+L5g3LG8iPiC2b5WT/BlP3fUjAiG4iG2j8yKfmPXppKa05igC/wGPLQfYvz+nH5q3I9RkdjqSaq33l/8Z6PV+BJw98OokKYqtszljDJNl7i9sFVP+TDmhFKY8D5sNW8hjZOTenMuXRnw1V7b9HhMLfqV/RzH5VcNYQFOA5Bll7pC8v9YwPOwqHgOLJDCC2fD2tS8NRdZ+DNYN3SwAMBDnF/kybrqsLA2Ave8eKw6THoAHog2iG6FVxebGcLjaivjlYVcCb5XoSzUdUt1eKGfel/F1pRgNzkMQO3HbtnhE1rwrgC3keTlHQhVHoFkysgZKZCmua0MC0OhJiEv+2fl4ZCRljHqs471Az1Tn2l+OcnI6Vg1;
	5:ggEuPa2ZWctxDlmC2o41qKUOSc3yZbVHm4u9M6JCZ/4Mb7+9xbPn7zcqE0oNRYM123IdEv/ZI6faJT/mkSt55XoxecAhYo/mFF8IIjCfoSot0UYzytg9V55P/RFXrfOTWuIamdujK6TT9wZhahoo9qK62DVkEZigNrdagEEuXz8=;
	24:We9CUWbTDTkiPN67A5AqDD3+GEwt7PyO6YyOABhva7DH+V73i95dG9BzTvtYq3b+pnpYsu0l1pu5s8d9m95XAet6omKyaJwyOIweu9IE+jE=;
	7:8LFVTaRoIe27xKSfPCkQbu7kgauC+S5h1U/xJ+bNXRjJFIv1dl6JhDWcncn0+S7NS3AyHnh+walEFoMkfbVCgHCWivwy4TTcTaIEYPUzByXdkL7OEe6yUw/CrZPX+A6VfOGHMZEcbeIjfNLdUsUgOGOepXbx3ER3B2OySTdEOBl/ZjfUSJmOCJ7mhB0gUFzmxzlaWqgizNkG5BjEUHX974jCg1/mAniJ2UYtwWsiwAXB0jNJeJSDqzU3bJ74jicw
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 13ef3eff-828f-4d56-720b-08d55c654be0
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(48565401081)(5600026)(4604075)(3008032)(2017052603307)(7153060)(7193020);
	SRVR:CY1PR02MB2153; 
x-ms-traffictypediagnostic: CY1PR02MB2153:
x-microsoft-antispam-prvs: <CY1PR02MB2153AFAA172711089CE1FC17B0EB0@CY1PR02MB2153.namprd02.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(8121501046)(5005006)(10201501046)(3231023)(944501161)(3002001)(93006095)(93001095)(6055026)(6041268)(20161123564045)(20161123558120)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(6072148)(201708071742011);
	SRVR:CY1PR02MB2153; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:CY1PR02MB2153; 
x-forefront-prvs: 0553CBB77A
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(39380400002)(396003)(366004)(376002)(39860400002)(346002)(199004)(189003)(3846002)(316002)(6916009)(33656002)(3660700001)(25786009)(8936002)(81156014)(7736002)(8676002)(14454004)(6436002)(99286004)(77096006)(97736004)(6506007)(81166006)(2351001)(305945005)(102836004)(587384001)(59450400001)(6116002)(7696005)(26005)(86362001)(105586002)(3280700002)(53936002)(74316002)(68736007)(106356001)(72206003)(2906002)(5660300001)(478600001)(2501003)(5890100001)(2900100001)(66066001)(9686003)(55016002)(5640700003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR02MB2153;
	H:CY1PR02MB1287.namprd02.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: 4ZMFes5WjQR6tPSNp8YgGmjhL3jhoKOv/CgaKmVp2hVYGD6myFkRFm0j/roeLBJLg2gzzZYVt12KRQUZQB3vCA==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13ef3eff-828f-4d56-720b-08d55c654be0
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2018 22:14:07.5683 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR02MB2153
Subject: [meta-browser] Running chromium as root
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Jan 2018 01:47:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

Has anyone has been able to run chromium-x11 as root user? Is there a flag =
or config I can tweak before building chromium?

Thanks,
Bhargav


This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.

