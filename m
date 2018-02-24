Return-Path: <JAEWON@xilinx.com>
X-Greylist: delayed 876 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 24 Feb 2018 02:37:32 UTC
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-bn3nam01on0078.outbound.protection.outlook.com [104.47.33.78])
	by mail.openembedded.org (Postfix) with ESMTP id 4EEA46E672
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Feb 2018 02:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=ImbC9zQsMsankS9+8j1scgQiHG+htB3io257OxFcN34=;
	b=dbDV2kGoWdaPt/SQrynaOFgLupYoERY0KW+0hZZsYRGRvF8Izjbo7MD0UahZ8yyk/OPaOXVnE6A/ioJiAwy7QW4b9D7IBQjPwWhlH5L4dRBN/EIX5oGEmbo7PGOmooLFl1fbdRrrPyPUDHHvB5KOcRbe144bHq60bA93M8kr0C4=
Received: from BY2PR02MB425.namprd02.prod.outlook.com (10.141.143.141) by
	BY2PR02MB329.namprd02.prod.outlook.com (10.141.140.142) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.506.18; Sat, 24 Feb 2018 02:22:54 +0000
Received: from BY2PR02MB425.namprd02.prod.outlook.com ([10.141.143.141]) by
	BY2PR02MB425.namprd02.prod.outlook.com ([10.141.143.141]) with mapi id
	15.20.0506.023; Sat, 24 Feb 2018 02:22:53 +0000
From: Jaewon Lee <JAEWON@xilinx.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: qt moc issue
Thread-Index: AdOtFl9couJcZTeaQ8+lfiZwb1491A==
Date: Sat, 24 Feb 2018 02:22:53 +0000
Message-ID: <BY2PR02MB42550445A4D2199CF004546AFC30@BY2PR02MB425.namprd02.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=JAEWON@xilinx.com; 
x-originating-ip: [149.199.62.254]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BY2PR02MB329;
	7:LWcrElBDq0quAUQU6vTqp5LrhzkD77Bcw0Fmh9WVTNBqG/efTqPRXB2K/yawA961EKReX+ZSWT+z8NprzPwMOWSD9v3xPJzAJ/naOBAcjOcnYHic0tPLG5HHe/syMHdR6C0fjyErQyY4gk4dMk1rWqnVV2DZPt3XikgQMvg/TzaV8uHJRRLaNDTQpDQeTZZEQhqCph5WVRynEA3KP2k3HOszVCNZYUgZUe7NnEbBxb9RY2gRoQgJXNPKQrIMnI0f
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a78befbf-fafe-478b-9c42-08d57b2d82ac
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(48565401081)(4534165)(4627221)(201703031133081)(201702281549075)(5600026)(4604075)(3008032)(2017052603307)(7153060)(7193020);
	SRVR:BY2PR02MB329; 
x-ms-traffictypediagnostic: BY2PR02MB329:
x-microsoft-antispam-prvs: <BY2PR02MB3295B5A89DCBF596A50D0FFAFC30@BY2PR02MB329.namprd02.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(28532068793085)(21748063052155);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040501)(2401047)(5005006)(8121501046)(3002001)(3231207)(944501161)(52105095)(10201501046)(93006095)(93001095)(6055026)(6041288)(20161123560045)(20161123564045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(6072148)(201708071742011);
	SRVR:BY2PR02MB329; BCL:0; PCL:0; RULEID:; SRVR:BY2PR02MB329; 
x-forefront-prvs: 0593E261C4
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(39860400002)(396003)(39380400002)(366004)(376002)(346002)(189003)(199004)(53754006)(6506007)(77096007)(7696005)(2900100001)(26005)(102836004)(2906002)(2351001)(86362001)(106356001)(72206003)(3846002)(790700001)(6116002)(7116003)(68736007)(59450400001)(99286004)(186003)(316002)(3280700002)(478600001)(6436002)(2501003)(3480700004)(81156014)(81166006)(97736004)(25786009)(3660700001)(53936002)(74316002)(6916009)(7736002)(55016002)(5890100001)(5660300001)(14454004)(8676002)(9326002)(66066001)(8936002)(54896002)(6306002)(9686003)(105586002)(33656002)(5640700003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR02MB329;
	H:BY2PR02MB425.namprd02.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: 0N5NxS4lwB7vi3lUgtQej8qnBqJ8dF2JnZzsNSvc8hjlwM06u8XTmL22cQw882nO0uDPLDXsnVZUM9XPSUjXIiOncJMO2yYxn7fZlPdNaMnvy12QqqfLd6iumftPN7OOMbp3+UzeZyKcFLMzV7wZoywH6cKJTNp3iWolUm7OmIk=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a78befbf-fafe-478b-9c42-08d57b2d82ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2018 02:22:53.6700 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR02MB329
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
X-List-Received-Date: Sat, 24 Feb 2018 02:37:33 -0000
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

