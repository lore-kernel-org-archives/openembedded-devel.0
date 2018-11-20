Return-Path: <craig.mcqueen@innerrange.com>
Received: from mail.innerrange.com.au (mail.innerrange.com.au [203.222.77.226])
	by mail.openembedded.org (Postfix) with ESMTP id 530286B8D5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2018 06:34:36 +0000 (UTC)
Received: from ir-mail.corp.innerrange.com.au (192.168.4.15) by
	ir-mail.corp.innerrange.com.au (192.168.4.15) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
	15.1.1531.3; Tue, 20 Nov 2018 17:34:35 +1100
Received: from ir-mail.corp.innerrange.com.au ([fe80::b00d:e485:459b:788f]) by
	ir-mail.corp.innerrange.com.au ([fe80::b00d:e485:459b:788f%2]) with
	mapi id 15.01.1531.007; Tue, 20 Nov 2018 17:34:35 +1100
From: Craig McQueen <craig.mcqueen@innerrange.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-python] python3-multidict build failure
Thread-Index: AdSAmsD4DydmzYbtTlCkyUcT35PCcA==
Date: Tue, 20 Nov 2018 06:34:34 +0000
Message-ID: <edd38f927abe4edda8a26827a2bbba05@innerrange.com>
Accept-Language: en-AU, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.105.91]
MIME-Version: 1.0
Subject: [meta-python] python3-multidict build failure
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
X-List-Received-Date: Tue, 20 Nov 2018 06:34:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

With python3-multidict v3.3.2, I sometimes get a build error when the build=
 does a make clean:

rm .install-deps
rm: cannot remove '.install-deps': No such file or directory

I reported an issue to the multidict project:
https://github.com/aio-libs/multidict/issues/194

As a work-around, I found a need to define in the recipe (or bbappend):

CLEANBROKEN =3D "1"

--=20
Craig McQueen


