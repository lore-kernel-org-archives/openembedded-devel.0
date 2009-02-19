Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1LaB6x-00085e-Pp
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Feb 2009 16:46:51 +0100
Received: from andromeda.vanille.de (e180136146.adsl.alicedsl.de
	[85.180.136.146])
	by drlauer-research.com (Postfix) with ESMTP id 75A32584122
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Feb 2009 17:08:09 +0100 (CET)
From: "Michael 'Mickey' Lauer" <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Feb 2009 16:44:28 +0100
User-Agent: KMail/1.9.10
References: <20090219135607.3D71A18935A@amethyst.openembedded.net>
	<200902191515.02208.mickey@vanille-media.de>
	<gnjtr8$2a0$1@ger.gmane.org>
In-Reply-To: <gnjtr8$2a0$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200902191644.28841.mickey@vanille-media.de>
Subject: Re: Carsten Haitzler (Raster) : libgles-omap3: add comments on how to get the gles binary files to help
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
X-List-Received-Date: Thu, 19 Feb 2009 15:46:52 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Am Thursday 19 February 2009 16:28:39 schrieb Koen Kooi:
> On 19-02-09 15:15, Michael 'Mickey' Lauer wrote:
> > Please back this one out as it seems out of bounds!
>
> Out of bounds in what way?

It touches a number of unrelated files and does strange things with 'em:

=A0conf/distro/include/sane-srcrevs.inc =A0 =A0 =A0 | =A0 =A02 +-
=A0packages/efl1/ecore.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A0=
2 +-
=A0packages/mtd/mtd-utils-native_1.2.0+git.bb | =A0 =A02 +-
=A0packages/powervr-drivers/libgles-omap3.inc | =A0 15 ++++++++++++++-
=A0packages/qte/qte-mt-static_2.3.10.bb =A0 =A0 =A0 | =A0 22 --------------=
=2D-------
=A0packages/qte/qte-mt_2.3.10.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A06 ----=
=2D-
=A0packages/qte/qte_2.3.10.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A03 ---

=2D-=20
:M:


