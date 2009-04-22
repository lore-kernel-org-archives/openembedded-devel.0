Received: from [87.193.137.78] (helo=mail.extern.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1LwXE4-0008Bl-GW
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Apr 2009 09:50:36 +0200
Received: from consult.extern.dresearch.de (consult.extern.DResearch.DE
	[87.193.137.68])
	by mail.extern.dresearch.de (Postfix) with ESMTP id 7712716DFDD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Apr 2009 09:46:25 +0200 (CEST)
Received: from hiob.intern.dresearch.de (unknown [87.193.137.50])
	by consult.extern.dresearch.de (Postfix) with ESMTP id CBEED2A4233
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Apr 2009 09:46:06 +0200 (CEST)
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Wed, 22 Apr 2009 09:45:38 +0200
Message-ID: <69E6C70090A0A14498CC98FAE5E06B6E3CF76B@hiob.intern.dresearch.de>
In-Reply-To: <d1b08f940904200836k6374f731h83342aea89c1f14@mail.gmail.com>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] initramfs howto?
Thread-Index: AcnBz1YVnlirp5bITYaxZfa8FeZ19gBS0kYg
References: <69E6C70090A0A14498CC98FAE5E06B6E3CF763@hiob.intern.dresearch.de><20090417183927.GU17629@smtp.west.cox.net><69E6C70090A0A14498CC98FAE5E06B6E3CF767@hiob.intern.dresearch.de>
	<d1b08f940904200836k6374f731h83342aea89c1f14@mail.gmail.com>
From: "Sledz, Steffen" <sledz@DResearch.DE>
To: <openembedded-devel@lists.openembedded.org>
Subject: Re: initramfs howto?
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
X-List-Received-Date: Wed, 22 Apr 2009 07:50:37 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I'll try to sort my thoughts a little bit. Our final target is this =
constellation:

* Kernel-A with Rootfs-A on an UBIFS (without initramfs) shall be able =
to start Kernel-B using kexec.

* Kernel-B with Rootfs-B on initramfs shall be able to start Kernel-A =
using kexec.

Both kernels do have associated modules.

As i understand OE i have to build two images (for Rootfs-A and =
Rootfs-B). But ...

(a) How do i tell those images which kernels (and as a consequence which =
modules) are associated with it?

(b) How do i build Kernel-B with it's initramfs?

The mentioned initramfs-kexecboot-image looks to me like a target to =
build an initramfs. But this does not contain any modules. So it does =
not involve one of the main questions.

The sample recipe code from Tom looks like a solution for (b) which =
expects another recipy myinitramfs-image for building myinitramfs.tar. =
But the answer to (a) is still unclear to me.

Steffen

PS: The kexec stuff is no problem.


