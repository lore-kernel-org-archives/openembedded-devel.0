Return-Path: <Aditya.Tayade@kpit.com>
Received: from IND01-MA1-obe.outbound.protection.outlook.com
	(mail-ma1ind01on0072.outbound.protection.outlook.com [104.47.100.72])
	by mail.openembedded.org (Postfix) with ESMTP id BF85C78DEA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 10:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=3t/2i0sGZF6orQwf1sfeiT8yVW/2Y32Wnlbvm1UixEw=;
	b=MQ+6/shjrM/FzJYeef+cgf3+7rXxdk93rYtZmULXjUJFNdHo1Ze68/YuqQ5qsAzYRWRIFqKod6gumDNZyjLGn/e6yx5rskqHT1SeDI6BAAL/EWoS/WG4xtmY9ElhyA6bh7pzkHD8J20xUhIOfhh/y/dnlzlIIlhQ0c/xO/TbOSc=
Received: from MAXPR01MB0348.INDPRD01.PROD.OUTLOOK.COM (10.164.150.144) by
	MAXPR01MB0363.INDPRD01.PROD.OUTLOOK.COM (10.164.150.147) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1038.19; Mon, 13 Aug 2018 10:55:23 +0000
Received: from MAXPR01MB0348.INDPRD01.PROD.OUTLOOK.COM
	([fe80::6dde:1fb8:4a3f:52a0]) by
	MAXPR01MB0348.INDPRD01.PROD.OUTLOOK.COM
	([fe80::6dde:1fb8:4a3f:52a0%4]) with mapi id 15.20.1038.023;
	Mon, 13 Aug 2018 10:55:23 +0000
From: Aditya Tayade <Aditya.Tayade@kpit.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [oe] [meta-oe][PATCH] libbytesize: fix gettext not found issue
Thread-Index: AQHUI2SzJ6XwGv2Of0eBTSA0n9ONaKSeh7vMgACeUq2AACyWAIAeTPDe
Date: Mon, 13 Aug 2018 10:55:23 +0000
Message-ID: <MAXPR01MB03481F6A061993B140AAE82991390@MAXPR01MB0348.INDPRD01.PROD.OUTLOOK.COM>
References: <MAXPR01MB03485F715FB80DCF083B704191550@MAXPR01MB0348.INDPRD01.PROD.OUTLOOK.COM>
	<MAXPR01MB0348E0FB92BCD5785A4E22E391550@MAXPR01MB0348.INDPRD01.PROD.OUTLOOK.COM>
	<MAXPR01MB034871D225312CE9BAE6A46D91540@MAXPR01MB0348.INDPRD01.PROD.OUTLOOK.COM>,
	<CAMKF1soBLh_MHbLS11MqcxFg4LjnV8y0QRMYad3m7oqYQuVGTg@mail.gmail.com>
In-Reply-To: <CAMKF1soBLh_MHbLS11MqcxFg4LjnV8y0QRMYad3m7oqYQuVGTg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [115.112.39.238]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MAXPR01MB0363;
	6:JjCfzMRvP6PzXBTcgPPdnUhjTLk70BJvJ1PaRc+o6xNovegWnCKunlIewUJX+36LngyIuRMSOpk2p2zAPQWFU9MHqulLXTK20F0wwHFACQAOVPdkghSCtj96xt8LqQ5VVyQFDB86HbX+uyIVUlmG53eCJGckXlxLmBe1uVnyVEASlGiBgkBfZL0GbHsQOFdOZiHsK9ePh6Wl8fCxaE49p/kO1vmzX0OSx328TJntmQxTtCtL72mWSqJwiLQ0xdI19Pv5ZhPAfrqIkmn5T5VNp5Pb0muSgVNPtP9VfVMauWudF1sKEDYryDEgHHP/mNnKQP18v13gcbhqxSGEUGp9W2eSChkSuA3CtZIYAJuRjc5GuHXLVjH+Yw8R8n4Y/sRxKwzkQzmFesMp8M/sx0JM5pXEHRm+qpdr0n7L6x6KoK3yhi792Qs/z88eSAGTrNgmbegCE9IMNwbhIaie/p1bfg==;
	5:MpjWajESaWz1Yu24WedTZxVacbzKeZmV3iKT9E4aR0Vy8BYOcryNo77kASdMrlBBacXuMutUk/ahf3oceknLXbBFfvnXdk28dgEan9gqEzy7qCwKDWYtOsEEM8KfIvLPGqhMnZgGZMDmexKhL6aaAVhiPGaZDzhi9tv3oCvkyP8=;
	7:eWm3Gro2zHQqD3kseBrJ5D5Hu9Tv4fNfiNrgGf7/vEF61EN0RtlMnjj/xW3oluI1qneeJN4Ki/gRK/uHBsUz/O9kKlJV3vuUers3ijaDdh3a3GwCjiYK1uTVoT/mHPmLWJZa3c0+lZv2SBFBpNIHYoB12dHcyCQAi29aWVljlRWwmiUlBf1BcbOLFt8Lu2LpQvyad/zyVBFS9w+RR/rtYD6f9GqtnsfIbf1AwhQzLxvQRzvHiEy4Um1zhMW0i4Mm
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 292d7116-02b8-4c02-9e45-08d6010b4544
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(4534165)(7168020)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MAXPR01MB0363; 
x-ms-traffictypediagnostic: MAXPR01MB0363:
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Aditya.Tayade@kpit.com; 
x-microsoft-antispam-prvs: <MAXPR01MB03632D0A4E9BF3BE4F84B03E91390@MAXPR01MB0363.INDPRD01.PROD.OUTLOOK.COM>
x-exchange-antispam-report-test: UriScan:(189930954265078)(146161314209440)(223705240517415)(85827821059158)(264703809997249)(193864172574918);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(93006095)(93001095)(10201501046)(3002001)(3231311)(944501410)(52105095)(6055026)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123558120)(20161123562045)(20161123560045)(6072148)(201708071742011)(7699016);
	SRVR:MAXPR01MB0363; BCL:0; PCL:0; RULEID:; SRVR:MAXPR01MB0363; 
x-forefront-prvs: 07630F72AD
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(376002)(346002)(136003)(396003)(39860400002)(366004)(199004)(189003)(6116002)(72206003)(68736007)(478600001)(3846002)(45080400002)(99286004)(26005)(2906002)(6246003)(76176011)(97736004)(186003)(7736002)(7696005)(8936002)(569054002)(93886005)(6436002)(14444005)(9686003)(606006)(236005)(54896002)(6306002)(25786009)(55016002)(53936002)(256004)(5024004)(5250100002)(966005)(14454004)(229853002)(5660300001)(53546011)(6506007)(4326008)(81156014)(446003)(81166006)(2900100001)(55236004)(33656002)(6606003)(11346002)(74316002)(86362001)(575784001)(6916009)(316002)(102836004)(39060400002)(486006)(106356001)(8676002)(19627405001)(66066001)(476003)(105586002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MAXPR01MB0363;
	H:MAXPR01MB0348.INDPRD01.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: kpit.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: VXyFPCVUMvG6Ud3NarqOgCdQ8+8n+MLm+IAHG9lPC7L/jLLG04rvvdhiZP2+kZv5UqkPLdZkXgeqQQrTCenmqmyM5Tlz2+GfGIgPP7NloKU9XJn/VpCMxNuqxzsQ8MkFppaPouFzr2fM0DlRrgxF6iflnZyblAQxOlBuqrY6xh6UDfczsCfmAlfh6r5nYgSeDiLt+yrm1JJYOa/XM5mzgO781ASXwW/YmDOEg8lq/ST32VGvLie2KsTvFTkcOlw+/dub0iMCi7aZ9zf1SjZTtAg1inaRlhd3DJJfq9o5flUI747HuaEd7GeQ+4R2+pVhbkItzJINj7ZWdfUf76T6UVjE58T6xBVwEviT3SryS9c=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 292d7116-02b8-4c02-9e45-08d6010b4544
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2018 10:55:23.6185 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR01MB0363
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libbytesize: fix gettext not found issue
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
X-List-Received-Date: Mon, 13 Aug 2018 10:55:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Raj,


Tried using said USE_NLS =3D "yes" option and it compiled successfully.


As per my understanding this option also enables recipe to use gettext for =
host, hence which one should we opt?


Sorry for delayed response.


Regards,

Aditya Tayade


________________________________
From: Khem Raj <raj.khem@gmail.com>
Sent: Wednesday, July 25, 2018 9:35 AM
To: Aditya Tayade
Cc: openembeded-devel
Subject: Re: [oe] [meta-oe][PATCH] libbytesize: fix gettext not found issue

Can you try setting

USE_NLS =3D "yes" in the affected recipe ?
On Tue, Jul 24, 2018 at 6:29 PM Aditya Tayade <Aditya.Tayade@kpit.com> wrot=
e:
>
> Hi,
>
> In Sumo branch, libbytesize_0.10.bb<https://apac01.safelinks.protection.o=
utlook.com/?url=3Dhttp%3A%2F%2F10.bb&amp;data=3D02%7C01%7CAditya.Tayade%40k=
pit.com%7C8381da62714f4666051908d5f1e3eb02%7C3539451eb46e4a26a242ff61502855=
c7%7C0%7C0%7C636680883564574908&amp;sdata=3DKLfQdOn3xMvUq0YI1MoYm9isivid5AV=
y%2B4rgUzd8G10%3D&amp;reserved=3D0> do_configure fails with error "configur=
e: error: gettext not found", hence added a dependency to gettext -native f=
or the same.
>
>
> Kindly review the attached patch and integrate it with upstream if change=
s looks fine.
>
>
> Regards,
> Aditya Tayade
> This message contains information that may be privileged or confidential =
and is the property of the KPIT Technologies Ltd. It is intended only for t=
he person to whom it is addressed. If you are not the intended recipient, y=
ou are not authorized to read, print, retain copy, disseminate, distribute,=
 or use this message or any part thereof. If you receive this message in er=
ror, please notify the sender immediately and delete all copies of this mes=
sage. KPIT Technologies Ltd. does not accept any liability for virus infect=
ed mails.
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> https://apac01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Flists=
.openembedded.org%2Fmailman%2Flistinfo%2Fopenembedded-devel&amp;data=3D02%7=
C01%7CAditya.Tayade%40kpit.com%7C8381da62714f4666051908d5f1e3eb02%7C3539451=
eb46e4a26a242ff61502855c7%7C0%7C0%7C636680883564574908&amp;sdata=3DM1BN9Z8D=
E1223Vm2uvuNghHfaKF7jTgZWCyqojzGxL4%3D&amp;reserved=3D0
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

