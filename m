Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1P7BDM-000171-R1
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Oct 2010 20:10:41 +0200
Received: by wyb40 with SMTP id 40so1902743wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Oct 2010 11:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=g6+SiNgBfM8YYfi2DwEr/Ax048fJILfkI3ge+MNbzyw=;
	b=TL3baUXxFQBv/UuN0rJnUkhtUrPPApx0eS1HaWD9O5TQ8/K8Iq4zqwwoohaNdIKYWy
	rNopZkFTXCafOXmhCnu5HgYo3JfevC6QAx+G3cFbRKq5zXdw74dl33Qqwm6bLiCi37TR
	cEnH6MjNxcNf0bNyDzrx8ibE0jaJzF8jxpshE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=Vo3YSbGcmDaECorbMEgmgIS4vRItdPxGrqiz9Gomfu/f18/2mns1p9EsD0i2iDUsYo
	Lrobn8DBdrE76WWa/Z2vlPF/uz0Tv0Nn85sFb5Qp5t2+2mDFEX5uCAU3QD+1RHRRCpfo
	SnKYf2DjxZzODJ+yHrkVz9Li+h5kbaqBFAhVw=
MIME-Version: 1.0
Received: by 10.227.157.205 with SMTP id c13mr415178wbx.97.1287252249323; Sat,
	16 Oct 2010 11:04:09 -0700 (PDT)
Received: by 10.227.141.70 with HTTP; Sat, 16 Oct 2010 11:04:08 -0700 (PDT)
In-Reply-To: <1287113787-21268-1-git-send-email-kergoth@gmail.com>
References: <1287113787-21268-1-git-send-email-kergoth@gmail.com>
Date: Sat, 16 Oct 2010 20:04:08 +0200
Message-ID: <AANLkTinse8QO1RjTSFqQ10_SOR68C7wbhRq=qPGhDhzh@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL, BAYES_00, SPF_PASS,
	URI_HEX autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chris Larson <chris_larson@mentor.com>
Subject: Re: [PATCH] Reverse the order of OVERRIDES
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
X-List-Received-Date: Sat, 16 Oct 2010 18:10:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 15, 2010 at 5:36 AM, Chris Larson <kergoth@gmail.com> wrote:
> From: Chris Larson <chris_larson@mentor.com>
>
> Given the current implementation of OVERRIDES in bitbake, the variable is
> expected to contain elements in the order least specific to most specific=
,
> however, our current usage of it does not match that. =A0As one example, =
"local"
> is supposed to always be the most specific override, yet currently it's t=
he
> least specific. =A0As another example, currently the target architecture =
is seen
> as more specific than the machine, which is also clearly wrong.
>
> It becomes clear that a reversal of the current value will bring us to a =
more
> sane behavior, and avoids the need for the dual overrides hack mentioned =
in
> the comments, so clean those up as well.
>
> This also introduces a MACHINE_OVERRIDES variable as a generic mechanism =
to
> inject overrides elements which are more specific than the distro but les=
s
> specific than the machine, which is where things like MACHINE_CLASS or
> SOC_FAMILY or the like would go. =A0This variable is *space* separated, t=
o make
> it easier and more convenient to assemble the variable incrementally, and=
 it's
> then translated to : separated when used in OVERRIDES.
>
> Signed-off-by: Chris Larson <chris_larson@mentor.com>
> ---
> =A0conf/bitbake.conf =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | =A0 17 +++--------------
> =A0conf/distro/include/arm-thumb.inc =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A06 +=
++---
> =A0conf/distro/micro.conf =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
| =A0 =A06 +++---
> =A0conf/distro/minimal.conf =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 =A05 +++--
> =A0conf/distro/shr.conf =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 =A05 +++--
> =A0conf/machine/fsg3be.conf =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 =A02 +-
> =A0conf/machine/kixrp435.conf =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 =A02 +-
> =A0conf/machine/nslu2be.conf =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 =A02 +-
> =A0conf/machine/nslu2le.conf =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 =A02 +-
> =A0recipes/binutils/binutils_csl-arm-20050416.bb | =A0 =A02 +-
> =A0recipes/binutils/binutils_csl-arm-20050603.bb | =A0 =A02 +-
> =A0recipes/eglibc/eglibc-package.bbclass =A0 =A0 =A0 =A0 | =A0 =A02 +-
> =A0recipes/glibc/glibc-package.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A02=
 +-
> =A0recipes/prelink/prelink_20061027.bb =A0 =A0 =A0 =A0 =A0 | =A0 =A02 +-
> =A0recipes/prelink/prelink_20071009.bb =A0 =A0 =A0 =A0 =A0 | =A0 =A02 +-
> =A0recipes/prelink/prelink_20090925.bb =A0 =A0 =A0 =A0 =A0 | =A0 =A02 +-
> =A016 files changed, 26 insertions(+), 35 deletions(-)

I'm sorry to notice too late, but this changes breaks do_unpack
behavior, machine dir in FILESPATHPKG are no longer preferred ie for
xorg-conf unpack:

now I get:

NOTE: package xserver-xorg-conf-0.1-r36: task do_unpack: Started
NOTE: Unpacking xserver-xorg-conf/xorg.conf to
/OE/tmpdir-shr/work/om-gta02-oe-linux-gnueabi/xserver-xorg-conf-0.1-r36/
NOTE: package xserver-xorg-conf-0.1-r36: task do_unpack: Succeeded

if I revert this commit:

NOTE: package xserver-xorg-conf-0.1-r36: task do_unpack: Started
NOTE: Unpacking xserver-xorg-conf/om-gta02/xorg.conf to
/OE/tmpdir-shr/work/om-gta02-oe-linux-gnueabi/xserver-xorg-conf-0.1-r36/
NOTE: package xserver-xorg-conf-0.1-r36: task do_unpack: Succeeded

Works OK if there is no "default" file (ie after rm
xserver-xorg-conf/xorg.conf).

Probably needs reversed OVERRIDES order also in bitbake.conf FILESPATH

FILESPATH =3D "${@':'.join([os.path.normpath(os.path.join(fp, p, o)) for
fp in d.getVar('FILESPATHBASE', 1).split(':') for p in
d.getVar('FILESPATHPKG', 1).split(':') for o in (d.getVar('OVERRIDES',
1) + ':').split(':')])}"

I'll try it and send patch.

Regards,


