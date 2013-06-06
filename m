Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f173.google.com (mail-ea0-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id ABCE36A456
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Jun 2013 13:24:08 +0000 (UTC)
Received: by mail-ea0-f173.google.com with SMTP id g15so2522910eak.32
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Jun 2013 06:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ygvJsTBP4rwUbj0ilCqEa7+a9QrGfaId/uyhIGbZsDg=;
	b=uQZLptjifbBl/4oewhvbjy+mZ4NoF0AKALQ6SW5Vn+0FJTn4VK3Tl2/d4Eg24pHDUU
	e75VcsAz22Iz6bbm/Ego3R0ChSdZHIWCExqtVTffeIDUgtU22qWTMTGH9SEO+B2FH1Kr
	aqS3Og0n7lvM/T4/569/9blziF1sURJU2cm3Os9bP9vbvPXdPowgWbj3b8nGP2mGXi21
	QtwHeCQL68UcF5brzYsyNj0ECa+/+bj4nGDuIvp8Y86NqF1GL2Eay2VLRjQrGN9Cpr+Y
	vFP2TTeUVdzKWWrvf89vWQZUKKH/rlz5cZYkZbvbIRNZCAJ4nuRknZai2EE7RAU8HfQX
	Ca+g==
X-Received: by 10.15.36.133 with SMTP id i5mr12983232eev.52.1370525048833;
	Thu, 06 Jun 2013 06:24:08 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	bo9sm92308238eeb.9.2013.06.06.06.24.07 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 06 Jun 2013 06:24:08 -0700 (PDT)
Date: Thu, 6 Jun 2013 15:24:26 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Pasquale Bongiovanni <palebongiovanni@gmail.com>
Message-ID: <20130606132426.GD22710@jama>
References: <CALbb29ugW_zahrp72enLdr-Opk=a7wfJq_TLH7RZB3HQxiRSTg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbb29ugW_zahrp72enLdr-Opk=a7wfJq_TLH7RZB3HQxiRSTg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: koen@dominion.thruhere.net, openembedded-devel@lists.openembedded.org
Subject: Re: [meta-multimedia] Problem with xbmc
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
X-List-Received-Date: Thu, 06 Jun 2013 13:24:09 -0000
X-Groupsio-MsgNum: 44979
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UnaWdueM1EBWVRzC"
Content-Disposition: inline

--UnaWdueM1EBWVRzC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 06, 2013 at 03:13:46PM +0200, Pasquale Bongiovanni wrote:
> Hi all,
> I'm new on yocto, I would like to create a core-image-sato including the
> package xbmc.
> But when I launch the command bitbake core-image-sato or bitbake xbmc, it
> fails at task co_compile with the following file log:
>=20
> ...
> In file included from DVDClock.cpp:25:0:
> /home/pasquale/Scrivania/alibi/projects/prova/image-xbmc/tmp/work/armv7a-=
vfp-poky-linux-gnueabi/xbmc/11.0+gitrAUTOINC+82388d55dae79cbb2e486e307e2320=
2e76a43efa-r15/git/xbmc/utils/MathUtils.h:
> In member function 'int CDVDClock::UpdateFramerate(double, double*)':
> /home/pasquale/Scrivania/alibi/projects/prova/image-xbmc/tmp/work/armv7a-=
vfp-poky-linux-gnueabi/xbmc/11.0+gitrAUTOINC+82388d55dae79cbb2e486e307e2320=
2e76a43efa-r15/git/xbmc/utils/MathUtils.h:101:28:
> error: impossible constraint in 'asm'
> /home/pasquale/Scrivania/alibi/projects/prova/image-xbmc/tmp/work/armv7a-=
vfp-poky-linux-gnueabi/xbmc/11.0+gitrAUTOINC+82388d55dae79cbb2e486e307e2320=
2e76a43efa-r15/git/xbmc/utils/MathUtils.h:101:28:
> error: impossible constraint in 'asm'
> /home/pasquale/Scrivania/alibi/projects/prova/image-xbmc/tmp/work/armv7a-=
vfp-poky-linux-gnueabi/xbmc/11.0+gitrAUTOINC+82388d55dae79cbb2e486e307e2320=
2e76a43efa-r15/git/xbmc/utils/MathUtils.h:101:28:
> error: impossible constraint in 'asm'
> /home/pasquale/Scrivania/alibi/projects/prova/image-xbmc/tmp/work/armv7a-=
vfp-poky-linux-gnueabi/xbmc/11.0+gitrAUTOINC+82388d55dae79cbb2e486e307e2320=
2e76a43efa-r15/git/xbmc/utils/MathUtils.h:101:28:
> error: impossible constraint in 'asm'
> make[1]: *** [DVDClock.o] Error 1
> make: *** [xbmc/cores/dvdplayer/DVDPlayer.a] Error 2
> ERROR: oe_runmake failed
> ERROR: Function failed: do_compile
> How can I solve this problem?

It's known problem, fails for all my architectures, koen probably has it
working, so maybe he will give you better advise..

http://lists.openembedded.org/pipermail/openembedded-devel/2013-June/090945=
=2Ehtml

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--UnaWdueM1EBWVRzC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlGwjYoACgkQN1Ujt2V2gBxlsQCcC3Um4CzLX2twDCd3Hvye1kpr
1OgAnj8sPKKVKJpRq9nxT75UI3D9Fo/5
=8ZVw
-----END PGP SIGNATURE-----

--UnaWdueM1EBWVRzC--
