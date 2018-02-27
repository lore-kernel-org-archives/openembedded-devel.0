Return-Path: <JAEWON@xilinx.com>
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam03on0058.outbound.protection.outlook.com [104.47.42.58])
	by mail.openembedded.org (Postfix) with ESMTP id 8E98F78803
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Feb 2018 21:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=hBOb0sZSfo6i+iABudtXv6AeBqMRGBts7YjEig2ETso=;
	b=4dMBez6PCGwZdtSLKGz6Jw1+eI8UvFliP5xPJKLC38VkC48w9326bjOJ5K3NTWl2Oex61ar/LhcjB6XE8wlyY+j1TuNdBtReglW+4FkDD4TNsilxS56MULdhSJdfXf+iUd1x1E3/QILq0uA3pwUcj8ayHtACf6z9cMm4lS8WW4M=
Received: from BY2PR02MB425.namprd02.prod.outlook.com (10.141.143.141) by
	BY2PR02MB2120.namprd02.prod.outlook.com (10.166.110.142) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.527.15; Tue, 27 Feb 2018 17:59:01 +0000
Received: from BY2PR02MB425.namprd02.prod.outlook.com ([10.141.143.141]) by
	BY2PR02MB425.namprd02.prod.outlook.com ([10.141.143.141]) with mapi id
	15.20.0527.021; Tue, 27 Feb 2018 17:59:02 +0000
From: Jaewon Lee <JAEWON@xilinx.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: qt moc issue
Thread-Index: AdOtFl9couJcZTeaQ8+lfiZwb1491AC3j+CQ
Date: Tue, 27 Feb 2018 17:59:02 +0000
Message-ID: <BY2PR02MB4253E02A1E05FE35944B351AFC00@BY2PR02MB425.namprd02.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=JAEWON@xilinx.com; 
x-originating-ip: [149.199.62.254]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BY2PR02MB2120;
	7:5WsZeOHKxy6KnS87bPHItyuzlCqp6TzqpLjV863UcwYJS32UCsxLYwFZR4zjjHFQ0sWvieXW0PtVvkhBENAdPtpr4wkFBEC7lMBrpOmhhS4g3Q0z72YTerEHNE3vurm9PapyH0/Yxoh9t5Z3meGpOA4CGE+V1zr7WpE3JexWXvAXvCOMqM6NtlZXpscKh2ioG2MMt0zWD15/WFkIrpj7TTzpIISFKuzk8YJwZ9bbAod6xJv+nfjJVAE3JNYrYc+Y
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1a0409ec-8e27-449e-2f31-08d57e0bc8de
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(48565401081)(4534165)(4627221)(201703031133081)(201702281549075)(5600026)(4604075)(3008032)(2017052603307)(7153060)(7193020);
	SRVR:BY2PR02MB2120; 
x-ms-traffictypediagnostic: BY2PR02MB2120:
x-microsoft-antispam-prvs: <BY2PR02MB2120573565C2EA37DF1142D2AFC00@BY2PR02MB2120.namprd02.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(28532068793085)(21748063052155);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040501)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(3231220)(944501198)(3002001)(6055026)(6041288)(20161123562045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(6072148)(201708071742011);
	SRVR:BY2PR02MB2120; BCL:0; PCL:0; RULEID:; SRVR:BY2PR02MB2120; 
x-forefront-prvs: 05961EBAFC
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(346002)(366004)(396003)(376002)(39380400002)(39860400002)(199004)(189003)(53754006)(6436002)(6916009)(99286004)(316002)(86362001)(77096007)(97736004)(2501003)(7696005)(6506007)(2351001)(106356001)(59450400001)(7736002)(7116003)(6116002)(68736007)(66066001)(5660300001)(3480700004)(790700001)(2906002)(2900100001)(72206003)(105586002)(9326002)(8936002)(81156014)(3280700002)(25786009)(74316002)(53936002)(6306002)(55016002)(5640700003)(3660700001)(186003)(33656002)(5890100001)(102836004)(26005)(8676002)(81166006)(54896002)(14454004)(9686003)(3846002)(478600001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR02MB2120;
	H:BY2PR02MB425.namprd02.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: KbVFLD0x2++d/n1Fnmu0Sql6O5oA5JIFv728Z7E48YFSZY9ArvzrJyDxL+4ZkzyxEJL0iQM62ddiCIxGFb9uOFq0yW4agzi5zJt9sBpBi5DUHrkwECCG8Ai8UvBV3aHUqt4Cq2q7OqizUnS/sYBhwmW8nbEAx8lxLIIqJ9VCkWk=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a0409ec-8e27-449e-2f31-08d57e0bc8de
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2018 17:59:02.0662 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR02MB2120
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: qt moc issue
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
X-List-Received-Date: Tue, 27 Feb 2018 21:32:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,

I'm seeing the following build error:

| /scratch/DAILYBUILD/build/tmp/work/aarch64-xilinx-linux/qtdeclarative/5.9=
.4+gitAUTOINC+317908e72a-r0/git/tests/benchmarks/qml/binding/tst_binding.cp=
p:175:10: fatal error: tst_binding.moc: No such file or directory
|  #include "tst_binding.moc"
|           ^~~~~~~~~~~~~~~~~
| compilation terminated.
| make[4]: *** [.obj/tst_binding.o] Error 1
| make[4]: *** Waiting for unfinished jobs....

There are a the same errors for a bunch of other moc files,
#include "tst_qxmlquery.moc"
#include "tst_qxmlresultitems.moc"
#include "tst_qxmlname.moc"
#include "tst_qxmlformatter.moc"

If I check for the file after the error, the files are there.
Im also seeing the same for other qt recipes, like  qtxmlpatterns

Has anybody seen the same error/is there a fix for this out there?


Thanks,
Jaewon

This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.

