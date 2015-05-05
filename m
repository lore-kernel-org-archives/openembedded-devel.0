Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 739AF6AC3E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 May 2015 15:52:52 +0000 (UTC)
Received: by wizk4 with SMTP id k4so167051842wiz.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 May 2015 08:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=xr3vo5YME6YCV0yzp2bOxNKG33NxhlMsB+GXzhkmWuY=;
	b=Uxn55NdjevNsWuoG4KRg8VSVkm/LOPPaOiXj1mb4+i+A7McqOMhyfXvZ8ocjII9OzR
	tNX9EVB1rJmzfXdpkr9NybfAqsl0fFRKrqq1E0GKqNl4oTQ/Xz5LCM4N7CowTWStgxXa
	zgP6A2OZ7uB+0pnLDI1PX2KhCe/CQaRasap29LSa4PUVQ0HsUwvPMcsMsK7A+eJQh8q6
	RlLxqMpGuTXHsItNuh6mzuNjLv/SM66P7q82151yWCYXrvQDMQtM1jH2NFCAAfSJbfVS
	Z00DkO1yvLaxPXzQt0xmir+TfWOC0zmDLeDfWFKk+8wkr93N5eZ1QAgZUW5tNylE9EC5
	6c/g==
X-Received: by 10.180.106.73 with SMTP id gs9mr5501449wib.52.1430841173424;
	Tue, 05 May 2015 08:52:53 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	ew10sm16767966wic.22.2015.05.05.08.52.52
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 May 2015 08:52:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 5 May 2015 17:52:57 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150505155257.GD2378@jama>
References: <1430824709-22286-1-git-send-email-thomas.perrot@tupi.fr>
	<20150505120132.GB2378@jama>
	<969F26A8BAB325438E7EB80D3C3134FB2F4BBCDC@irsmsx105.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB2F4BBCDC@irsmsx105.ger.corp.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: tprrt <tprrt@tupi.fr>
Subject: Re: [meta-systemd][PATCH] Rename bluez4_4.101.bbappend to bluez5_5.29.bbappend, to fix build issue below: ERROR: No recipes available for: /home/tprrt/dev/oe-build-easy/combination/meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.bbappend
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 May 2015 15:52:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 05, 2015 at 03:13:53PM +0000, Iorga, Cristian wrote:
> Martin, can I help with the aforementioned build failures?

Most of them aren't related to bluez4.

The only exception is this patch:
http://lists.openembedded.org/pipermail/openembedded-devel/2015-May/101302.=
html
I had to extend it a bit (navit, libsyncml, obexftp depend on
blacklisted components), but you can help by reviewing it (or even
checking if some of these components can actually use bluez5 (and
${BLUEZ}).

Most of issues are caused by thumb, tracked in:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D7717

and linux-yocto failing in various places for various MACHINEs.

Regards,

> Also, NACK for the original patch.
> /Cristian
>=20
> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-bounces@lists.openembedded.org] On Behalf Of Martin Jansa
> Sent: Tuesday, May 5, 2015 3:02 PM
> To: openembedded-devel@lists.openembedded.org
> Cc: tprrt
> Subject: Re: [oe] [meta-systemd][PATCH] Rename bluez4_4.101.bbappend to b=
luez5_5.29.bbappend, to fix build issue below: ERROR: No recipes available =
for: /home/tprrt/dev/oe-build-easy/combination/meta-systemd/oe-core/recipes=
-connectivity/bluez/bluez4_4.101.bbappend
>=20
> On Tue, May 05, 2015 at 01:18:29PM +0200, Thomas Perrot wrote:
> > From: tprrt <tprrt@tupi.fr>
>=20
> NAK, see pending patches for bluez4 (I plan to merge them as soon as buil=
ds stop failing completely).
>=20
> > Signed-off-by: tprrt <tprrt@tupi.fr>
> > ---
> >  .../bluez/{bluez4_4.101.bbappend =3D> bluez5_5.29.bbappend}           =
   |    0
> >  1 file changed, 0 insertions(+), 0 deletions(-)  rename=20
> > meta-systemd/oe-core/recipes-connectivity/bluez/{bluez4_4.101.bbappend=
=20
> > =3D> bluez5_5.29.bbappend} (100%)
> >=20
> > diff --git=20
> > a/meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.bbappen
> > d=20
> > b/meta-systemd/oe-core/recipes-connectivity/bluez/bluez5_5.29.bbappend
> > similarity index 100%
> > rename from=20
> > meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.bbappend
> > rename to=20
> > meta-systemd/oe-core/recipes-connectivity/bluez/bluez5_5.29.bbappend
> > --
> > 1.7.10.4
> >=20
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

