Return-Path: <mns@gomspace.com>
X-Greylist: delayed 10816 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 31 May 2017 14:44:13 UTC
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
	(mail-ve1eur01on0125.outbound.protection.outlook.com [104.47.1.125])
	by mail.openembedded.org (Postfix) with ESMTP id CA7DB700F0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 May 2017 14:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gomspace01.onmicrosoft.com; s=selector1-gomspace-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=lAqqxDx5H4sD/W/s0E0lSyUr9VuBpindwhc/rUaTS/g=;
	b=TKKhEf8Xo1WR1h7qX7sFcjlKJNuT++zXaC48+gMkP0tVUARmo5sZMkkRdVa5TIflJeh7NBqx4Fgi0aYpPXysArPwEQR6iHd13Pi4WL/RaWaE/gARJQ/F8P3DmEK22jHiYwMZJOPmhyq7tMTNxBUpFv8g4ahO1SWicBXl6BnSshg=
Received: from AM5PR0402MB2769.eurprd04.prod.outlook.com (10.175.41.11) by
	AM5PR0402MB2772.eurprd04.prod.outlook.com (10.175.41.14) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1124.9; Tue, 30 May 2017 20:10:51 +0000
Received: from AM5PR0402MB2769.eurprd04.prod.outlook.com
	([fe80::5052:b387:3cc7:998]) by
	AM5PR0402MB2769.eurprd04.prod.outlook.com
	([fe80::5052:b387:3cc7:998%18]) with mapi id 15.01.1124.020;
	Tue, 30 May 2017 20:10:51 +0000
From: Martin Siegumfeldt <mns@gomspace.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: URL of devmem2
Thread-Index: AQHS2X4ttMq8BE90gUOOHHpqWZndxg==
Date: Tue, 30 May 2017 20:10:51 +0000
Message-ID: <AM5PR0402MB2769D2B8C27E4DDADE64D7CEC4F00@AM5PR0402MB2769.eurprd04.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=gomspace.com;
x-originating-ip: [2603:10a6:203:2:cafe::c7]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM5PR0402MB2772;
	7:mGRzaT+PC/cCiti3t4gmvsN3fxdRnPd6Gnkf+cNIyveh40FAf4OY39wHR8iKJjytBpo+KkMQ+UHvRe9g3eD8biBD8SaOHvN1QNLuAj9M6sLOCW8v4DIbjxI0rXJ7GxeEU2MMywjPdJOa5S4X95O16PTdhO8h3ySMRHhHfdcT6VUqzGbvfdbvWmbrj4QMN86LdTU9HJS6snQAtDqa6vVgXXYpH5LTidlF9y75ZdPfKT1aXpOfdPgKgp4s50kda7MkrFePaH8ox1GFtUtXQ5E2+PZWHb1xZDS23XYXR7LtVHR4S6cv5a2ZRjNDFG9DIsDZeQ0YKryLoAoVoF79uj7FyA==
x-ms-traffictypediagnostic: AM5PR0402MB2772:
x-ms-office365-filtering-correlation-id: 750063e0-cccd-4c42-d156-08d4a797f844
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254075)(201703131423075)(201702281549075);
	SRVR:AM5PR0402MB2772; 
x-microsoft-antispam-prvs: <AM5PR0402MB2772131A6E762B8F9C2571F5C4F00@AM5PR0402MB2772.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040450)(601004)(2401047)(8121501046)(5005006)(3002001)(93006095)(93001095)(10201501046)(6041248)(2016111802025)(20161123564025)(20161123562025)(20161123560025)(20161123558100)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(6043046)(6072148);
	SRVR:AM5PR0402MB2772; BCL:0; PCL:0; RULEID:;
	SRVR:AM5PR0402MB2772; 
x-forefront-prvs: 032334F434
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39410400002)(39840400002)(39400400002)(39450400003)(86362001)(54356999)(606005)(5640700003)(50986999)(2900100001)(6506006)(5250100002)(6436002)(2501003)(102836003)(189998001)(33656002)(6916009)(25786009)(38730400002)(19627405001)(6606003)(7696004)(2351001)(110136004)(7906003)(6306002)(9686003)(54896002)(236005)(55016002)(99286003)(53936002)(6116002)(2906002)(81166006)(8936002)(5660300001)(7116003)(74316002)(8676002)(3660700001)(478600001)(14454004)(3280700002)(7736002)(568214009)(42262002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM5PR0402MB2772;
	H:AM5PR0402MB2769.eurprd04.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: gomspace.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2017 20:10:51.2304 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 91ed1e54-6d8b-4599-84d8-65fe75fda3d1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0402MB2772
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: URL of devmem2
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
X-List-Received-Date: Wed, 31 May 2017 14:44:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,


Is there any chance that http://git.openembedded.org/meta-openembedded/comm=
it/?id=3Dfc801961457fe2fbb24973bb43b302ad46044cb8 and http://git.openembedd=
ed.org/meta-openembedded/commit/?id=3D6c584374a599f6f8d3607f20ecfc13a67ccf1=
da1 will be backported to release branches? lartmaker domain seems no longe=
r available - AFAICS all branches older than pyro is affected.


Thanks,

Martin

