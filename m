Received: from tx2ehsobe002.messaging.microsoft.com ([65.55.88.12]
	helo=TX2EHSOBE003.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RXkFF-0004HF-VH
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Dec 2011 02:54:58 +0100
Received: from mail153-tx2-R.bigfish.com (10.9.14.249) by
	TX2EHSOBE003.bigfish.com (10.9.40.23) with Microsoft SMTP Server id
	14.1.225.23; Tue, 6 Dec 2011 01:33:07 +0000
Received: from mail153-tx2 (localhost [127.0.0.1])	by
	mail153-tx2-R.bigfish.com (Postfix) with ESMTP id 12CD548024D	for
	<openembedded-devel@lists.openembedded.org>;
	Tue,  6 Dec 2011 01:33:07 +0000 (UTC)
X-SpamScore: -12
X-BigFish: VS-12(zz9371K1432N98dKzz1202hzz8275dhz2dh2a8h668h839h8e2h8e3h61h)
X-Spam-TCS-SCL: 0:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail153-tx2 (localhost.localdomain [127.0.0.1]) by mail153-tx2
	(MessageSwitch) id 1323135186931408_11346;
	Tue,  6 Dec 2011 01:33:06 +0000 (UTC)
Received: from TX2EHSMHS038.bigfish.com (unknown [10.9.14.237])	by
	mail153-tx2.bigfish.com (Postfix) with ESMTP id DD4BD340045	for
	<openembedded-devel@lists.openembedded.org>;
	Tue,  6 Dec 2011 01:33:06 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS038.bigfish.com
	(10.9.99.138) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 6 Dec 2011 01:33:05 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.83]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0339.002; Mon, 5 Dec 2011 19:33:05 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [Beagleboard] Can't fetch Linux kernel source
Thread-Index: AQHMs7b/oKXflZBIM0mWAEahGn7/vA==
Date: Tue, 6 Dec 2011 01:33:04 +0000
Message-ID: <CAEsOVNc01R2rsw9zv1vNtVed5VhB+Ext0b7CfVCzToksac6g_Q@mail.gmail.com>
References: <w4liqqva4t.wl%peter@chubb.wattle.id.au>
In-Reply-To: <w4liqqva4t.wl%peter@chubb.wattle.id.au>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [Beagleboard] Can't fetch Linux kernel source
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Dec 2011 01:54:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <5CE91C0C81D957408307863B47B6B98C@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 5, 2011 at 6:04 PM, Peter Chubb <peter.chubb@nicta.com.au> wrot=
e:
> With a fresh checkout of =A0openembedded and all its layers, using
> oebb.sh, I see:
> =A0NOTE: package linux-3.0.12-r113b: task do_fetch: Started
> =A0...
> =A0...git fetch -f --prune
> =A0git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git =
refs/*:refs/*
> =A0error: refs/tags/v2.6.38-rc7 does not point to a valid object!
> =A0error: refs/tags/v2.6.38-rc8 does not point to a valid object!
> =A0error: refs/tags/v2.6.38.1 does not point to a valid object!
>
> =A0NOTE: package linux-3.0.12-r113b: task do_fetch: Failed
> ERROR: Task 4 (/usr/src/Angstrom/sources/meta-ti/recipes-kernel/linux/lin=
ux_3.0.bb, do_fetch) failed with exit code '1'
>
> It sems to me that either the recipe for fetching from GIT is broken,
> or the upstream repos is broken, or git is broken. (I have git version
> 1.7.7.3 installed, from Debian).
>
> I can do:
> =A0git clone \
> =A0git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
>
> and everything succeeds; git fsck on the resulting repository reports
> no errors. =A0What's more, the revision the recipe is looking for is
> present in the resulting repository.
>
> Therefore I suspect a bug in the git do_fetch() method.

Do those tags still exists upstream?

-M=



