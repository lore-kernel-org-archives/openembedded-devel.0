Return-Path: <sander.visser.2@consultant.volvo.com>
X-Greylist: delayed 428 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 07 Feb 2020 16:22:27 UTC
Received: from mail-gw2.it.volvo.com (mail-gw2.it.volvo.com [192.138.110.15])
	by mail.openembedded.org (Postfix) with ESMTP id 9DB0D60ECA
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Feb 2020 16:22:27 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,414,1574118000"; 
	d="scan'208,217";a="1119587244"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=gsLa0uFp33cbHGQ6EhdXcVvnfWZ6Vcjgzxa6xUli8DPCcMRoDdquHPt4yXH5oQgshFq+f1sbxukxOLa5knJ4vx2cu3Noc9W0JTHTiFQyHLhXSKidqdCsPdReDz+VdYQ8hYZQzH3ROU92g78l/b4AZ2cqngTzmB5uvNQjYNqlqEkI8Uk9RWV9/g+dyRa5VGBeqhn8D2ewG3DeMB3K8v9hpgV5Ihf1gg/tuQncrq3aP8b1OZiKljPM50nO90ddSlmGzrVnicJi5gd+y3ZzcB+sVu9rybbYjTUmGjiObC/ow/zN+1+VfRouvj5uo2IDuBI+lFFNwtB2926x3gbn7sQuLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=/xQEOeTySe0MwbVGRKVFGCOyb6iiZyoSyvye0GzFAJg=;
	b=HrlwCYhSO9xrH4Gz7BU3vs4FTZborTy/aS03me8QF4r8L+VssYAqigtAAS1gFXgsZaJg2X3MZXF8xtCODnxVtKag+bSesSBg5tJSyAu+SiBY/OU3uZli9Qd1344S/9C01QkZ1XkeTs5a5DbN2jF2frL42DlFryGv554trh93j0b5AOHSxTL4qBGXiGUfC0ml5tNwHM84o6uNj7MUlauVKf72HiyZwVA7WXiJbhAlTgKTPoRBntIInns2hLtiy7gCSjhjbeVY+O2o/Gehkw7cFaSScD5TojwjFpik+hStYO2no5k54XkpIPVH+UpT6wNKnZFKQo30Tuex0nF/djzpSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=consultant.volvo.com; dmarc=pass action=none
	header.from=consultant.volvo.com;
	dkim=pass header.d=consultant.volvo.com; arc=none
From: "Visser Sander (2) (Consultant)" <sander.visser.2@consultant.volvo.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: systemd-conf bbappend not working (warrior)
Thread-Index: AdXd0SmjdGHO6GZZQMiy3ZBEJU4iSw==
Date: Fri, 7 Feb 2020 16:15:17 +0000
Message-ID: <HE1PR05MB4635DB8B3F93600E64ADE444C51C0@HE1PR05MB4635.eurprd05.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=sander.visser.2@consultant.volvo.com; 
x-originating-ip: [168.149.129.63]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e32ad943-402e-4d2d-4a33-08d7abe8ebfe
x-ms-traffictypediagnostic: AM6SPR01MB0055:
x-microsoft-antispam-prvs: <AM6SPR01MB0055DC10B83CC2E017AD402EC51C0@AM6SPR01MB0055.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0306EE2ED4
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(376002)(346002)(39860400002)(136003)(396003)(366004)(199004)(189003)(66446008)(52536014)(26005)(316002)(71200400001)(9686003)(81156014)(66476007)(55016002)(186003)(64756008)(66556008)(8676002)(66946007)(81166006)(86362001)(9326002)(478600001)(2906002)(76116006)(4744005)(8936002)(7696005)(5660300002)(33656002)(6506007)(6916009);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM6SPR01MB0055;
	H:HE1PR05MB4635.eurprd05.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:0; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qBL0uuO1cZhhNi0KnmoTPAU7G0mwaCV6jQip5MPwPQUUQ7aVrrxy4sGBpTnkFpvgxtTuWrlZnsujKEX+7xDr2hZFpDtefHiqlJhh8eYdvWZWvqyBQA45K2garlCuWp/5JA6DENkbTKbalPkNW0UiOP/rBWuNOJa/WgGNVwxvCsi+phxJJnpt9xxAdBFeyhnsgAxOxs1yc8Sq2X6qEXbcBJcnHe8WdpghzSwegfoYdd0qxbB+5PGuTkPhBK63Csrd3S85wSBL7IN3mfoKyaUEC9H+xcwidaGHlIcIbpkWt6Ul9j5BgTQ6a3YD4hbc7GL2mb5AuuQC+zDRtnPGkez3bUq/XsEv0mVlHHzB5RP15a0yobB52MLbhcGrVHhpiRxUyX4P4qsUYjlYbISV+ApUZbTYQ6CfJQKpReFvNRcYpQdC1F2IH9C0UI2h3PXref43
x-ms-exchange-antispam-messagedata: TeHGK0EbZtcQYDZdbGnbjMXOpuHuILj1BJDQKfliXlHEuE88lqIAt7t580nB4vuPcu5gRuQdG55iqG5zsKEzHev5qABH2fQwE9N1SodHHtVsBkmusHXMzqp00xJxZbUPNju4Bh6Vq8Szb84861elOw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e32ad943-402e-4d2d-4a33-08d7abe8ebfe
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2020 16:15:17.3379 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f25493ae-1c98-41d7-8a33-0be75f5fe603
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mFWFkgcyt+kteJCC3ZITt7rDBJhgCKbPQuQitzyVwB9aVM3F15y3wyeJEw+KlpPGG7C1rmiFAgqwf45xb5X1ohxNYAYAi58MccgIqOwwKq3ed/jQpn7Y5u+TWTZS2lIz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6SPR01MB0055
X-OriginatorOrg: consultant.volvo.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: systemd-conf bbappend not working (warrior)
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
X-List-Received-Date: Fri, 07 Feb 2020 16:22:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi

In warrior there is systemd-conf_243.bb but in the build folder tmp/work th=
e version is called 1.0-r0

If I create a systemd-conf_%.bbappend its content is not applied. For insta=
nce if I set PR =3D "r1" that has no affect. I am also unable to add tasks =
to modify the default configuration...

Any ideas why this is happening for this recipe alone?

/Regards Sander

This email message and any attachments may contain confidential information=
 and may be privileged. If you are not the intended recipient or otherwise =
not authorized to receive this message, you are prohibited to use, copy, di=
sclose or take any action based on this email or any information contained =
herein. If you are not the intended recipient, please advise the sender imm=
ediately by replying to this email and permanently delete this message and =
any attachments from your system.

