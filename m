Return-Path: <Jose.DiazdeGrenu@digi.com>
Received: from mail1.bemta8.messagelabs.com (mail1.bemta8.messagelabs.com
	[216.82.243.195])
	by mail.openembedded.org (Postfix) with ESMTP id D1EEF78942
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jan 2018 12:22:14 +0000 (UTC)
Received: from [216.82.241.196] (using TLSv1.2 with cipher
	DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta-8.messagelabs.com id D0/26-20095-772635A5;
	Mon, 08 Jan 2018 12:22:15 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprDKsWRWlGSWpSXmKPExsXi5LtOQLc8KTj
	KYMtlGYvp5/6yW1w8vJTZ4udbGwdmj8V7XjJ5nNu4gtFj+9qrTAHMUayZeUn5FQmsGXt//2At
	2MZY8aFvImMD4xzGLkYuDiGBlYwSmw98Y+li5ARyFjNKPP+eDmKzCZhLTDt8kAWkSERgC6PE5
	Os7GUESwgLJEjNeL2UFsUUEUiSu/lwBFOcAsp0kXm6LBQmzCKhIPJz3kwnE5hXwlfjQ8pIRYn
	47k8T5v1ogNqdAkMStX4eZQWxGAVmJledPg9UwC4hL3HoyH6xXQkBAYsme88wQtqjEy8f/WCF
	sRYm7T84yQ9TrSCzY/YkNwtaWWLbwNTPEXkGJkzOfQP2lJtE2ZwLzBEaRWUhWzELSPgtJ+ywk
	7QsYWVYxqhenFpWlFuma6CUVZaZnlOQmZuboGhpY6OWmFhcnpqfmJCYV6yXn525iBMYOAxDsY
	LzT53yIUZKDSUmUV9Q5IEqILyk/pTIjsTgjvqg0J7X4EKMMB4eSBG9NYnCUkGBRanpqRVpmDj
	CKYdISHDxKIryzQNK8xQWJucWZ6RCpU4yWHD0rLv5h4rjx8DqQfDbzdQOzEEtefl6qlDhvL0i
	DAEhDRmke3DhYornEKCslzMsIdKAQT0FqUW5mCar8K0ZxDkYlYV4mkCk8mXklcFtfAR3EBHTQ
	u32BIAeVJCKkpBoYZd1e5Vw7mV/JzJwdUrBGedchhZUbYm51GTVINJ7aXPhw+qbZqp8YlFa7L
	j5tLNt2KUdg+vxHnY63v2bnbY1O2imudbnkuUTyUf/VGy8zxNtPquDyWTC55bvY1GA2i4KvQU
	K3HKtr11o/+R2y77Rs9iqndyoHnrfVbsswlLHbouvjuT2za7akEktxRqKhFnNRcSIApTrxly8
	DAAA=
X-Env-Sender: Jose.DiazdeGrenu@digi.com
X-Msg-Ref: server-4.tower-46.messagelabs.com!1515414134!84700368!3
X-Originating-IP: [66.77.174.16]
X-StarScan-Received: 
X-StarScan-Version: 9.4.45; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 601 invoked from network); 8 Jan 2018 12:22:15 -0000
Received: from owa.digi.com (HELO MCL-VMS-XCH01.digi.com) (66.77.174.16)
	by server-4.tower-46.messagelabs.com with SMTP;
	8 Jan 2018 12:22:15 -0000
Received: from DOR-VMS-XCH01.digi.com (10.49.8.98) by MCL-VMS-XCH01.digi.com
	(10.5.8.49) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Mon, 8 Jan 2018 06:22:12 -0600
Received: from DOR-SMS-XCH01.digi.com ([fe80::894b:3bdc:74ae:6efc]) by
	DOR-VMS-XCH01.digi.com ([::1]) with mapi id 14.03.0361.001;
	Mon, 8 Jan 2018 13:22:11 +0100
From: "Diaz de Grenu, Jose" <Jose.DiazdeGrenu@digi.com>
To: "Mittal, Anuj" <anuj.mittal@intel.com>, Richard Leitner
	<richard.leitner@skidata.com>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-java][PATCH] openjdk-7: fix compile errors with
	current poky master (gcc6)
Thread-Index: AQHTiHfmC7rQ8quTT02S07Ax9CtdnaNp4L9A///ymICAABIkYA==
Date: Mon, 8 Jan 2018 12:22:11 +0000
Message-ID: <0B2EBCD48D33654381E736352034C70C01B5E52C@dor-sms-xch01.digi.com>
References: <1515412157-30726-1-git-send-email-Jose.DiazdeGrenu@digi.com>
	<fca0add8-d2b2-2ab1-02d1-d6232e668105@skidata.com>
	<0B2EBCD48D33654381E736352034C70C01B5E467@dor-sms-xch01.digi.com>
	<C0207330DF60C5409302EC78C3FE68F34A3961@PGSMSX105.gar.corp.intel.com>
In-Reply-To: <C0207330DF60C5409302EC78C3FE68F34A3961@PGSMSX105.gar.corp.intel.com>
Accept-Language: es-ES, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.101.11.101]
MIME-Version: 1.0
Subject: Re: [meta-java][PATCH] openjdk-7: fix compile errors with current poky master (gcc6)
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
X-List-Received-Date: Mon, 08 Jan 2018 12:22:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

-----Original Message-----
From: Mittal, Anuj [mailto:anuj.mittal@intel.com]=20

> You can prefix your subject with branch name like [morty][PATCH] ...

Thanks!

Should I resend it?

