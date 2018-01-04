Return-Path: <Jose.DiazdeGrenu@digi.com>
X-Greylist: delayed 424 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 04 Jan 2018 16:52:09 UTC
Received: from mail1.bemta12.messagelabs.com (mail1.bemta12.messagelabs.com
	[216.82.251.15])
	by mail.openembedded.org (Postfix) with ESMTP id 617E678787
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jan 2018 16:52:09 +0000 (UTC)
Received: from [216.82.251.44] (using TLSv1.2 with cipher
	DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-15.bemta-12.messagelabs.com id CA/99-07966-21A5E4A5;
	Thu, 04 Jan 2018 16:45:06 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpkleJIrShJLcpLzFFi42Jx8l0noCsU5Rd
	lsGm5gsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnH+o2bBeaaKR4/cGxgnMnUxcnEICaxilDjQ
	s4IdwlnNKNFyYgMjhLOYUeLq3Z8sXYycHGwC5hLTDh8Es0UEYiSWnj/P1sXIwSEsYCkxpzMDx
	BQRsJPomBIBYepJ/P6rBFLMIqAi8WH6P0YQm1fAV+LjhpPsIDajgKzEyvOnweLMAuISt57MZw
	KxJQQEJJbsOc8MYYtKvHz8jxXCVpBo+3SPFaJeR2LB7k9sELa2xLKFr5kh5gtKnJz5BOxIIQE
	1ibY5E5gnMArPQrJiFpL2WUjaZyFpX8DIsopRozi1qCy1SNfIVC+pKDM9oyQ3MTNH19DQSC83
	tbg4MT01JzGpWC85P3cTIzDw6xkYGHcwbmn0OsQoycGkJMobru4XJcSXlJ9SmZFYnBFfVJqTW
	nyIUYODQ6Dl4smDTFIsefl5qUoSvN8igOoEi1LTUyvSMnOAsQlTKsHBoyTC2w+S5i0uSMwtzk
	yHSJ1iNOa48fD6HyaOZzNfNzALgU2SEueVjgQqFQApzSjNgxsESxmXGGWlhHkZGRgYhHgKUot
	yM0tQ5V8xinMwKgnzBoJM4cnMK4Hb9wroFCagU1Yd8QU5pSQRISXVwGjTx7vNqGzCV5UZ9Zc0
	9/D8Y29pXLHaZcmpvb+PypvocTd1TWVwfBx6de7ihYtFZy1wFfqXs2nLquqNB2U3rqkXTl218
	6JsoNnMi3FMx1bNN/R8fN/f56K5nHFM49Oq4+Gq0aqTDm06NX2/yDkbqU8WDP2MF4/GZumdU/
	zeHB/86q/4xqm32hcrsRRnJBpqMRcVJwIA81BpdhQDAAA=
X-Env-Sender: Jose.DiazdeGrenu@digi.com
X-Msg-Ref: server-16.tower-200.messagelabs.com!1515084306!45469275!1
X-Originating-IP: [66.77.174.16]
X-StarScan-Received: 
X-StarScan-Version: 9.4.45; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10982 invoked from network); 4 Jan 2018 16:45:06 -0000
Received: from owa.digi.com (HELO MCL-VMS-XCH01.digi.com) (66.77.174.16)
	by server-16.tower-200.messagelabs.com with SMTP;
	4 Jan 2018 16:45:06 -0000
Received: from MTK-SMS-XCH04.digi.com (10.10.8.198) by MCL-VMS-XCH01.digi.com
	(10.5.8.49) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Thu, 4 Jan 2018 10:45:03 -0600
Received: from DOR-VMS-XCH01.digi.com (10.49.8.98) by MTK-SMS-XCH04.digi.com
	(10.10.8.198) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Thu, 4 Jan 2018 10:45:02 -0600
Received: from DOR-SMS-XCH01.digi.com ([fe80::894b:3bdc:74ae:6efc]) by
	DOR-VMS-XCH01.digi.com ([::1]) with mapi id 14.03.0361.001;
	Thu, 4 Jan 2018 17:45:01 +0100
From: "Diaz de Grenu, Jose" <Jose.DiazdeGrenu@digi.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-java] morty branch not compiling with GCC6
Thread-Index: AdOFexvjjqZfujXARu+anxgG/Lzn/g==
Date: Thu, 4 Jan 2018 16:44:59 +0000
Message-ID: <0B2EBCD48D33654381E736352034C70C01B450F4@dor-sms-xch01.digi.com>
Accept-Language: es-ES, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.101.2.179]
MIME-Version: 1.0
Subject: [meta-java] morty branch not compiling with GCC6
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
X-List-Received-Date: Thu, 04 Jan 2018 16:52:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

Currently the compilation of openjdk7 in the morty branch with GCC 6 is fai=
ling. I noticed that the following commit in master fixes the problem:

Commit 65041a6c:  "openjdk-7: fix compile errors with current poky master (=
gcc6)"

Is there a reason why this has not be cherry-picked to the morty branch? Co=
uld we do that?=20

