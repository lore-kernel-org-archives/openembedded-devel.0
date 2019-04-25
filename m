Return-Path: <sander.visser.2@consultant.volvo.com>
X-Greylist: delayed 663 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 25 Apr 2019 12:43:02 UTC
Received: from mail-gw1.it.volvo.com (mail-gw1.it.volvo.com [192.138.110.14])
	by mail.openembedded.org (Postfix) with ESMTP id 577BB7D8F0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Apr 2019 12:43:01 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,393,1549926000"; 
	d="scan'208,217";a="1007279411"
From: "Visser Sander (2) (Consultant)" <sander.visser.2@consultant.volvo.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: Python3 in sumo+thud does not package sha1 support in crypt
Thread-Index: AdT7YpXlzjKvlA/qT9aMXSkfHSkIwg==
Date: Thu, 25 Apr 2019 12:31:43 +0000
Message-ID: <HE1PR05MB46350C84FDF6E1F7F6C448D8C53D0@HE1PR05MB4635.eurprd05.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=sander.visser.2@consultant.volvo.com; 
x-originating-ip: [199.247.35.116]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1ad19b59-e281-4f0a-0b98-08d6c979f998
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
	SRVR:HE1PR05MB4747; 
x-ms-traffictypediagnostic: HE1PR05MB4747:
x-microsoft-antispam-prvs: <HE1PR05MB47473C3D6413C4FA3F2EB261C53D0@HE1PR05MB4747.eurprd05.prod.outlook.com>
x-forefront-prvs: 0018A2705B
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(376002)(136003)(366004)(396003)(346002)(39860400002)(199004)(189003)(486006)(97736004)(2906002)(2351001)(55016002)(25786009)(6306002)(54896002)(52536014)(6116002)(558084003)(790700001)(5640700003)(478600001)(68736007)(9686003)(5660300002)(6436002)(14454004)(33656002)(66066001)(53936002)(7696005)(86362001)(71190400001)(9326002)(81156014)(7736002)(8936002)(71200400001)(99286004)(74316002)(6916009)(3846002)(8676002)(2501003)(186003)(66946007)(26005)(73956011)(66476007)(76116006)(476003)(102836004)(66556008)(66446008)(6506007)(256004)(316002)(81166006)(64756008);
	DIR:OUT; SFP:1102; SCL:1; SRVR:HE1PR05MB4747;
	H:HE1PR05MB4635.eurprd05.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: consultant.volvo.com does not
	designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Fb9uvNcb9x1RKHUMEKGiBiWPbGrOaxl4/VmB8XAdXbWOAuX0jJ70WkV93dAjditrbPM4Nf2He84ERagPVBPTnnYmxpcIAEQMABBw6RYUhYEHnygXjYZXkLMfpA3Sv3K2R7S/b8oK+vSsljJNwTE4y5c1sJaZi9Aewp7r9AQTIpJ8aW2eL8zQfkGI5VCmIaZE7y8fmx5NCBpO220H6y56QBU4uwQMoi7GPNwh4Sl1BwlxpQJsWITdczUqsbDFvbQWYa5G4bzHu/YQyVtgGeBqtYM1Q+yqRxIXTYDy5H99QXsLOQMZ31Pfsuc4ft6Xb30iGHiE+UQO9EmvI26OrC/wVSSvRg1U2y4nGl0e03tg0nn7G0pRcjS4PHV1dryoChdcuF7SdQ5puuqi7GKstP8zOjIE02704hJp17/vYm+tG8k=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ad19b59-e281-4f0a-0b98-08d6c979f998
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2019 12:31:43.4310 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f25493ae-1c98-41d7-8a33-0be75f5fe603
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR05MB4747
X-OriginatorOrg: consultant.volvo.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Python3 in sumo+thud does not package sha1 support in crypt
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
X-List-Received-Date: Thu, 25 Apr 2019 12:43:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi

It seems "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_sha1.*.so" is missi=
ng in sumo and thud. It is listed in rocko (via sha*) and in warrior via _s=
ha1.*.so

Would a patch towards thud/sumo be accepted where _sha1.*.so is added to th=
e crypt files?

/Regards Sander

This email message and any attachments may contain confidential information=
 and may be privileged. If you are not the intended recipient or otherwise =
not authorized to receive this message, you are prohibited to use, copy, di=
sclose or take any action based on this email or any information contained =
herein. If you are not the intended recipient, please advise the sender imm=
ediately by replying to this email and permanently delete this message and =
any attachments from your system.

