Return-Path: <sander.visser.2@consultant.volvo.com>
X-Greylist: delayed 661 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 03 May 2019 14:12:37 UTC
Received: from mail-gw4.it.volvo.com (mail-gw4.it.volvo.com [192.138.117.78])
	by mail.openembedded.org (Postfix) with ESMTP id B01696C0ED
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 May 2019 14:12:37 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,425,1549926000"; 
	d="scan'208,217";a="664614443"
From: "Visser Sander (2) (Consultant)" <sander.visser.2@consultant.volvo.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: Unable to customize python packaging in a clean way
Thread-Index: AdUBthm2v2nAUTSyTsm3v3fAbofTsg==
Date: Fri, 3 May 2019 14:01:25 +0000
Message-ID: <HE1PR05MB4635B39CEC6B61094BD46679C5350@HE1PR05MB4635.eurprd05.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=sander.visser.2@consultant.volvo.com; 
x-originating-ip: [199.247.35.116]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cef31a29-463d-4089-6971-08d6cfcfd531
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
	SRVR:HE1PR05MB4793; 
x-ms-traffictypediagnostic: HE1PR05MB4793:
x-microsoft-antispam-prvs: <HE1PR05MB47938C3B6F694D0A35BB99D5C5350@HE1PR05MB4793.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0026334A56
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(39860400002)(376002)(346002)(366004)(136003)(199004)(189003)(2906002)(86362001)(3846002)(6116002)(74316002)(81156014)(81166006)(790700001)(52536014)(8676002)(66446008)(55016002)(2351001)(5640700003)(8936002)(68736007)(66556008)(6436002)(19273905006)(66946007)(73956011)(76116006)(64756008)(66476007)(71190400001)(71200400001)(33656002)(486006)(7736002)(2501003)(5660300002)(6306002)(54896002)(476003)(9686003)(316002)(66066001)(53936002)(256004)(25786009)(478600001)(26005)(6916009)(99286004)(14454004)(7696005)(102836004)(6506007)(186003)(53376002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:HE1PR05MB4793;
	H:HE1PR05MB4635.eurprd05.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: consultant.volvo.com does not
	designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: RWq29AuvwLa7iVUhP6oBfZt33K9cUxUJ6pXCzpTQ3PUuGzYZQUBDdCq+aZFHddsdbULJ14urIq8zROtJ5NXVnZBVVwSMHdStAVCBEF9WgFXYSWpmtnXCBE9TELoz0J4kozEd0IeD+9uvFZQckm7phM9BDP4mLPPFUv3DYNYslC9kgyNayTzgdyclFmrZHCAsO0ilvOWZQrYDjeYuHrqDjfE1qMZmE4LrSvCeTeyVrfd2W2RTcBvn4b3euskQnHzj2YZFotQBBwWHbGTgJHRq1p1ZkyCLzku69qBAAOt1CrVxN4UQGYT+0H3N2IPeZOHAuZoVjD14nt2oVO85b2thtXMnDix5q90CpjjnkPjJZUXMudsB0963tdjJb4v3q36DzcllbuZhSc2KP2RKZ7ahaGvAn1mli34n5jwJi13XGws=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: cef31a29-463d-4089-6971-08d6cfcfd531
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2019 14:01:25.9917 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f25493ae-1c98-41d7-8a33-0be75f5fe603
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR05MB4793
X-OriginatorOrg: consultant.volvo.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Unable to customize python packaging in a clean way
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
X-List-Received-Date: Fri, 03 May 2019 14:12:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

If I want to override the python3-manifest.json part of the python3 recipe;=
 how should I do that from a layer of my own?



I first attempted to add a custom python3-manifest.json in my custom layer =
that has higher BBFILE_PRIORITY than poky. I observe that my json is instal=
led to the $WORKSPACE, but package splitting is still done using the .json =
from poky meta layer...



The way that the manifest is included from python3.bb (rocko-warrior) seems=
 to not allow custom manifest?

filename =3D os.path.join(d.getVar('THISDIR'), 'python3', 'python3-manifest=
.json')



I could not find any documentation on how customization is supposed to work=
 after the introduction of the JSON manifest.



I want to be able to remove rdepends on python3-email when installing pytho=
n3-netclient (in sumo), as my use of netclient actually does not use email =
(and email has many dependancies that make including it add a large footpri=
nt to my image).



I did find a hack to be able to do what I want, but it is not very clean. I=
s there a cleaner solution?



Hack:

In my custom layer create a modified copy of the JSON manifest in

recipes-devtools/python/python3/python3-manifest.json

For sumo in my custom layer with higher prio than poky create a recipes-dev=
tools/python/python3_3.5.5.bb file with the following content:



require ../../../../poky/meta/recipes-devtools/python/python3_3.5.5.bb



#  Adapted JSON manifest is found from THISDIR, so no need to add custom ${=
THISDIR}/python3 to FILESEXTRAPATHS

FILESEXTRAPATHS_prepend :=3D "${THISDIR}/../../../../poky/meta/recipes-devt=
ools/python/python3:"







/Regards Sander


This email message and any attachments may contain confidential information=
 and may be privileged. If you are not the intended recipient or otherwise =
not authorized to receive this message, you are prohibited to use, copy, di=
sclose or take any action based on this email or any information contained =
herein. If you are not the intended recipient, please advise the sender imm=
ediately by replying to this email and permanently delete this message and =
any attachments from your system.

