Received: from [87.193.137.78] (helo=mail.extern.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1KsB3w-0004fa-E1
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Oct 2008 08:49:52 +0200
Received: from consult.extern.dresearch.de (consult.extern.DResearch.DE
	[87.193.137.68])
	by mail.extern.dresearch.de (Postfix) with ESMTP id 681B316DF7B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Oct 2008 08:57:01 +0200 (CEST)
Received: from hiob.intern.dresearch.de (unknown [87.193.137.50])
	by consult.extern.dresearch.de (Postfix) with ESMTP id 5854E2A420E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Oct 2008 08:58:06 +0200 (CEST)
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Tue, 21 Oct 2008 08:49:15 +0200
Message-ID: <69E6C70090A0A14498CC98FAE5E06B6E3CF47B@hiob.intern.dresearch.de>
In-Reply-To: <f96d234e0810200859p70d3e127qa41e01266e2efd47@mail.gmail.com>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] support another hardware
Thread-Index: AckyzvElndXXDyneRA6VNAGpblPjwgAeXZkA
References: <69E6C70090A0A14498CC98FAE5E06B6E3CF479@hiob.intern.dresearch.de>
	<f96d234e0810200859p70d3e127qa41e01266e2efd47@mail.gmail.com>
From: "Sledz, Steffen" <sledz@DResearch.DE>
To: <openembedded-devel@lists.openembedded.org>
Subject: Re: support another hardware
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
X-List-Received-Date: Tue, 21 Oct 2008 06:49:52 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> There is really not much more to it than create a machine conf, and a
> kernel configuration.  For the kernel, the preferred approach seems to
> be to use a generic linux-2.6.xx.bb recipe, and add your machine to
> the version you support.  Occasionally, other packages will have
> machine specific tweaks, but that is not required.

Are there conventions in naming of the kernel recipes? If i look into =
the relevant directories i can see various methods:

1. "${MACHINE}-kernel" (e.g. mx21ads.conf)
2. "linux-${MACHINE}" (e.g. magicbox.conf)
3. fix names like "linux-wrap-geode" for wrap.conf

Is one of them preferred?

Steffen


