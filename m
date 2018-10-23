Return-Path: <craig.mcqueen@innerrange.com>
X-Greylist: delayed 902 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 23 Oct 2018 06:59:39 UTC
Received: from mail.innerrange.com.au (mail.innerrange.com.au [203.222.77.226])
	by mail.openembedded.org (Postfix) with ESMTP id 97DCB79C23
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Oct 2018 06:59:39 +0000 (UTC)
Received: from ir-mail.corp.innerrange.com.au (192.168.4.15) by
	ir-mail.corp.innerrange.com.au (192.168.4.15) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
	15.1.1531.3; Tue, 23 Oct 2018 17:44:37 +1100
Received: from ir-mail.corp.innerrange.com.au ([fe80::b00d:e485:459b:788f]) by
	ir-mail.corp.innerrange.com.au ([fe80::b00d:e485:459b:788f%2]) with
	mapi id 15.01.1531.007; Tue, 23 Oct 2018 17:44:37 +1100
From: Craig McQueen <craig.mcqueen@innerrange.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: samba minimal smbclient
Thread-Index: AdRqm1DQXzogjfO9R6e9lF/nFws3ZQ==
Date: Tue, 23 Oct 2018 06:44:37 +0000
Message-ID: <ba059985c4c24fd2b748631eea646ecd@innerrange.com>
Accept-Language: en-AU, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.105.91]
MIME-Version: 1.0
Subject: samba minimal smbclient
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
X-List-Received-Date: Tue, 23 Oct 2018 06:59:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I'd like to use smbclient in a project, with minimal functionality (just to=
 copy files onto a Windows machine). But the samba package adds something l=
ike 10 MB to the project. Is it possible to get a cut-down smbclient-only p=
ackage?

Previously I was using Yocto morty, and I managed to cut the samba package =
down quite a bit with a suitable bbappend. Now I'm trying to move to Yocto =
rocko or sumo, and finding my previous methods don't work so well, so it's =
increasing my project image size by 8 or 9 MB.

--=20
Craig McQueen


