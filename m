Received: from va3ehsobe003.messaging.microsoft.com ([216.32.180.13]
	helo=va3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SKYcR-000828-M5
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Apr 2012 19:24:39 +0200
Received: from mail102-va3-R.bigfish.com (10.7.14.244) by
	VA3EHSOBE001.bigfish.com (10.7.40.21) with Microsoft SMTP Server id
	14.1.225.23; Wed, 18 Apr 2012 16:45:02 +0000
Received: from mail102-va3 (localhost [127.0.0.1])	by
	mail102-va3-R.bigfish.com (Postfix) with ESMTP id 01C42340321	for
	<openembedded-devel@lists.openembedded.org>;
	Wed, 18 Apr 2012 16:45:00 +0000 (UTC)
X-SpamScore: -10
X-BigFish: VS-10(zz9371I1432N98dK14ffIzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3hbe9i)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail102-va3 (localhost.localdomain [127.0.0.1]) by mail102-va3
	(MessageSwitch) id 1334767498778201_17983;
	Wed, 18 Apr 2012 16:44:58 +0000 (UTC)
Received: from VA3EHSMHS020.bigfish.com (unknown [10.7.14.239])	by
	mail102-va3.bigfish.com (Postfix) with ESMTP id ADAEE2C0263	for
	<openembedded-devel@lists.openembedded.org>;
	Wed, 18 Apr 2012 16:44:58 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS020.bigfish.com
	(10.7.99.30) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 18 Apr 2012 16:44:56 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.132]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0355.003; Wed, 18 Apr 2012 11:44:55 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [oe-core] build for 32bit architecture
Thread-Index: AQHNHYKUVoHyvXueokaaO3f0Jc5Pqw==
Date: Wed, 18 Apr 2012 16:44:53 +0000
Message-ID: <CAEsOVNewkNgOCYiBoB0Z=2dCWQjkuTm2ohEoDnKf8QcYcQbD7g@mail.gmail.com>
References: <CAOHjBZu=T6TrSomYSOW+Sp5afFwHTu5f4zGKx-3T361gdrJdmg@mail.gmail.com>
In-Reply-To: <CAOHjBZu=T6TrSomYSOW+Sp5afFwHTu5f4zGKx-3T361gdrJdmg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [oe-core] build for 32bit architecture
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
X-List-Received-Date: Wed, 18 Apr 2012 17:24:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <1BF951193C1B784193C53BD001E862F3@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 18, 2012 at 8:48 AM, Giuseppe Condorelli
<giuseppe.condorelli@gmail.com> wrote:
> Hi All,
>
> I need to build the native packages for a 32bit architecture, although I'=
m
> working on a 64bit machine.
> So I need to pass the -m32 option to the compiler and my question is abou=
t
> the right place where to put it
> to be inherited by all native packages.

We use setarch with chroot and it works well.

-M=



