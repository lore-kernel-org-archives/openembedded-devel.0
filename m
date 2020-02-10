Return-Path: <sander.visser.2@consultant.volvo.com>
Received: from mail-gw2.it.volvo.com (mail-gw2.it.volvo.com [192.138.110.15])
	by mail.openembedded.org (Postfix) with ESMTP id E43EC60F06
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2020 09:18:46 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,424,1574118000"; d="scan'208";a="1120219741"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=Np1pr3ZSzuLg7XlZskiyjL6mDcDO+w4Zgr/ELqd1pRxj/pVoaKKstFHsacVMspRD9m+nWueQnrsdkZ60AnyHXYrLeHA9YHQQqCNBFA+HXKftdoVXaQO76zpUmUUihztcdSIStODBoXPhLfmVuXDFhil+LVhob7VflJSNGvv6oBKtAt9SvK8nO2G/69UbowHucGZPSgrqj6HInyCgdY4XBuSB+HUX3nX9vtSfaj54JJ8NY4WU0/T3mAW3yUR48vpfOlxXm7tDdA4LFQKH4kMo+NkKOnBNkI/JCbv/HtXRqXDfjVNYcX9P8CIMbSMo/aaTfVFHJ6IEOwr8BS7rddT0jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=V5i56YmKzbTU6tkbZAfTHP665jJKdTbIS7U3Zv10yFE=;
	b=oEubaNmuy8HjFj1cSlIsh3dw6Bc/hTjEXJz2xD0lkFiJt5xni049Hu5Ft4c9qLiT8HsG3UzTFJyxggseWz9xJxYrcSvz4m1KkRoEPnvSyaBhQk5v4KPfz0HpORpBjVRmYrDSOCgZO5CjLd4Q3BHaYEA1Xecpq8X25bWzk7BqcSwE/KRolXR9ntQM9FIbFckP5xkY565pCzFmJt7fWDD80alB8nfQciGjRl696SKHWQ2Rx4dkeIjYNIZd6o//VUG1APMKn59/MYR2/Qiy1wKlj+hENFz6ZBQDe2GP9bgh9uRpOdwdT9KHM1VBFTtnKngTtNYDms7ysZn3aVXIjVTKXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=consultant.volvo.com; dmarc=pass action=none
	header.from=consultant.volvo.com;
	dkim=pass header.d=consultant.volvo.com; arc=none
From: "Visser Sander (2) (Consultant)" <sander.visser.2@consultant.volvo.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: systemd-conf bbappend not working (warrior)
Thread-Index: AdXd0SmjdGHO6GZZQMiy3ZBEJU4iSwAA2tPwAIdGoQA=
Date: Mon, 10 Feb 2020 09:18:38 +0000
Message-ID: <HE1PR05MB46354B6F95BEB77C7034B0CDC5190@HE1PR05MB4635.eurprd05.prod.outlook.com>
References: <HE1PR05MB4635DB8B3F93600E64ADE444C51C0@HE1PR05MB4635.eurprd05.prod.outlook.com>
	<fc16d2651b9547f3848da69a6090ec24@XBOX03.axis.com>
In-Reply-To: <fc16d2651b9547f3848da69a6090ec24@XBOX03.axis.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=sander.visser.2@consultant.volvo.com; 
x-originating-ip: [199.247.36.115]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a83a69d4-8d14-47ee-d816-08d7ae0a36e5
x-ms-traffictypediagnostic: AM6SPR01MB14:
x-microsoft-antispam-prvs: <AM6SPR01MB1455F69825F925EF368D2AC5190@AM6SPR01MB14.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 03094A4065
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(136003)(39860400002)(366004)(376002)(346002)(396003)(189003)(199004)(8936002)(7696005)(478600001)(186003)(6506007)(53546011)(2906002)(110136005)(316002)(81166006)(81156014)(8676002)(26005)(86362001)(5660300002)(55016002)(71200400001)(9686003)(66446008)(64756008)(66556008)(66476007)(66946007)(33656002)(52536014)(76116006);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM6SPR01MB14;
	H:HE1PR05MB4635.eurprd05.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:0; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 69ZcnhaS6kxWozpIxj9YEBp0tDg+xEO2C1dOEubmYoLJS+mMVX+yM1E0oyWtmkMnVy+ne91DtdcMuEqyHP+0kfqBJEAfaPdC7TlytJeptD1QEy/ySwuQNDDdAi4FBMSpDijfFSDx208h52lJREs91oRxGOPuUr67tGFKsOtiyS5uAd1tegUMSXjAGhBVDorTyxe6RIgLK6la7h3Ex5ML7cCFhDUdoSQadM9XMKjgbGkNBQkWX0BgMGZzrAZJtAn2cPumB9TiALt3lF1vS8lGQhQKXpYNlX46raOMoOIV2KQyrPQe6SRjnl8EID6ho14Z8+KsmVzYRMnsSCpfYN6Z8hnBJA045HrKEstfdIuDP9Qe4sFX28Mkl08LGRniGMQlzpUq84ueXP/FGhLD+pcCSiuK3XzyeraAIbzJj1T5sYwvTB2YuU+d6yB0O3en2V/0
x-ms-exchange-antispam-messagedata: bTUmNf8pSc6GOweXROxjB5ZdqQYCnJ5QYmKYoHsgWDymnJjDS5xQpltXNzUbU83T56U4CmsjNt/Xk1cDyfAgZ1YydFwIzvzUZaMaMmUgrLxNHZ3wJGRcI8v+usPUXzTcDvP+l0iaupAFnK837tkBbw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a83a69d4-8d14-47ee-d816-08d7ae0a36e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2020 09:18:38.8064 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f25493ae-1c98-41d7-8a33-0be75f5fe603
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nTld0k0FeJXPFdXxwvXzfyNyHpVOhFJOurVX2Gy9EtBEwkhLL/yWdN63rKKqCsZut2ZlKJ+eZpe8WR559tLb1lq218hZVjPSC7bmYg41vnPs8o7dSnoRdZkBhJaXqfNm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6SPR01MB14
X-OriginatorOrg: consultant.volvo.com
Subject: Re: systemd-conf bbappend not working (warrior)
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
X-List-Received-Date: Mon, 10 Feb 2020 09:18:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Im on latest warrior. You are right - the systemd version is 241 and not 24=
3 in warrior, but the systemd-conf package is built as 1.0-r0 despite recip=
e being systemd-conf_241.bb in warrior:4edf4eb9cc86fbd4b51240fae527c1b97a7a=
ce74 poky.

Any ideas why tmp/work decides to build the recipe as 1.0-r0. That seems to=
 be the reason for my systemd-conf_241.bbappend task/changes not being appl=
ied...

I have tried both a do_install_append() and inserting a task of my own befo=
re install to change the default configuration files. None of these changes=
 are applied (it worked fine in sumo where config files are part of systemd=
 recipe). If I name my bbappend  "_1.0" then bitbake complains it can not b=
e applied, so bitbake at some level seems to know the version is supposed t=
o be 241.

/Regards Sander

-----Original Message-----
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Sent: Friday, February 7, 2020 5:45 PM
To: Visser Sander (2) (Consultant) <sander.visser.2@consultant.volvo.com>; =
openembedded-devel@lists.openembedded.org
Subject: RE: systemd-conf bbappend not working (warrior)

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org <openembedded-
> devel-bounces@lists.openembedded.org> On Behalf Of Visser Sander (2)
> (Consultant)
> Sent: den 7 februari 2020 17:15
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] systemd-conf bbappend not working (warrior)
>
> Hi
>
> In warrior there is systemd-conf_243.bb but in the build folder
> tmp/work

In Warrior, the version of systemd-conf is 241, not 243.

* What versions of what layers do your really have?
* Do you have any other layers than the layers in Poky?
* Are there any other bb or bbappends for systemd-conf in any of the
  other layers?

> the version is called 1.0-r0

"1.0" is the default version if no version is set in the recipe name or usi=
ng PV. Before Warrior, systemd-conf did not have an explicit version set an=
d would then use "1.0" as version.

> If I create a systemd-conf_%.bbappend its content is not applied. For
> instance if I set PR =3D "r1" that has no affect. I am also unable to
> add tasks to modify the default configuration...
>
> Any ideas why this is happening for this recipe alone?
>
> /Regards Sander

//Peter


This email message and any attachments may contain confidential information=
 and may be privileged. If you are not the intended recipient or otherwise =
not authorized to receive this message, you are prohibited to use, copy, di=
sclose or take any action based on this email or any information contained =
herein. If you are not the intended recipient, please advise the sender imm=
ediately by replying to this email and permanently delete this message and =
any attachments from your system.

