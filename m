Received: from va3ehsobe003.messaging.microsoft.com ([216.32.180.13]
	helo=VA3EHSOBE008.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1S0mt7-0003zM-9R
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Feb 2012 05:36:09 +0100
Received: from mail99-va3-R.bigfish.com (10.7.14.253) by
	VA3EHSOBE008.bigfish.com (10.7.40.28) with Microsoft SMTP Server id
	14.1.225.23; Fri, 24 Feb 2012 04:27:46 +0000
Received: from mail99-va3 (localhost [127.0.0.1])	by mail99-va3-R.bigfish.com
	(Postfix) with ESMTP id 5DFF56049A	for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2012 04:27:46 +0000 (UTC)
X-SpamScore: -7
X-BigFish: VS-7(zz9371I1432N98dKzz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3hbe9k)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail99-va3 (localhost.localdomain [127.0.0.1]) by mail99-va3
	(MessageSwitch) id 1330057664143434_28574;
	Fri, 24 Feb 2012 04:27:44 +0000 (UTC)
Received: from VA3EHSMHS020.bigfish.com (unknown [10.7.14.238])	by
	mail99-va3.bigfish.com (Postfix) with ESMTP id 1DB8F20048	for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2012 04:27:44 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS020.bigfish.com
	(10.7.99.30) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 24 Feb 2012 04:27:43 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.244]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.01.0355.003; Thu, 23 Feb 2012 22:27:43 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH] udev-173: use tar.gz instead of git
	checkout
Thread-Index: AQHM8qymM+LzgvaCJ06ZIv86vrjxRg==
Date: Fri, 24 Feb 2012 04:27:42 +0000
Message-ID: <CAEsOVNc5A2dwjKpnu2X0cbXu+_+UXfhNFHBAQE4+QWbZ_wiCVA@mail.gmail.com>
References: <1315576997-18349-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1315576997-18349-1-git-send-email-Martin.Jansa@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [meta-oe][PATCH] udev-173: use tar.gz instead of git checkout
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
X-List-Received-Date: Fri, 24 Feb 2012 04:36:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <4067C9E700C6874790A4C20796518ED1@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 9, 2011 at 9:03 AM, Martin Jansa <martin.jansa@gmail.com> wrote=
:
> * today it's easier to find right tar.gz stored somewhere then working gi=
t.kernel.org
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
> =A0meta-oe/recipes-core/udev/udev_173.bb | =A0 =A09 ++++-----
> =A01 files changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/meta-oe/recipes-core/udev/udev_173.bb b/meta-oe/recipes-core=
/udev/udev_173.bb
> index e1383d3..df39d42 100644
> --- a/meta-oe/recipes-core/udev/udev_173.bb
> +++ b/meta-oe/recipes-core/udev/udev_173.bb
> @@ -16,11 +16,10 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260a=
a954499f7abaabaa882bbe \
> =A0# Needed for udev-extras
> =A0DEPENDS =3D "gperf-native usbutils acl glib-2.0"
>
> -SRCREV =3D "${PV}"
> =A0PR =3D "r0"
>
> =A0# version specific SRC_URI
> -SRC_URI =3D "git://git.kernel.org/pub/scm/linux/hotplug/udev.git;protoco=
l=3Dgit \
> +SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/kernel/hotplug/udev-${PV}.t=
ar.gz \

This tarball is no longer availabe... did they pull
'http://kernel.org/pub/linux/utils/kernel/hotplug/udev-173.tar.gz' for
some reason?

-M=



