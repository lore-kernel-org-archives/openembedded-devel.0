Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id 4DAAF61FEC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2013 15:11:55 +0000 (UTC)
Received: by mail-ea0-f176.google.com with SMTP id z15so3360635ead.35
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2013 08:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=2fMdfqq+DH2natHc1pDQlrs/l/vy7kpZTz2ZKXBgIa0=;
	b=WKWRGmptALc6WMKenkBkU2BuPYjP/WWbL4L2AGqW2VZkpTu8JsFbiS3bKJg4Un/SvB
	sd5R7xn6ZQo2zKr/7jDNqB3uPUYVK7EvzHTGcwJvjwXow6OKZ1OVaP79K9oLe6iDgksM
	7UGs55pmR7Bfu1PA7Sz0K7DhRwFjqgMlLxeC16Qkh/Q++tdRSYayFHCppPP2G3cgWtMm
	ex9HcjLIIqs6AlYWSUXK3JCTUG4/R/joEeQeCDfl+MGUSjfWBBxpH8sPoSB29jiLfnMx
	9ErLn/lcVenyqhM9Yz4o1l1NoWzvgkjOwtBEGZQqLj3WNcUTzG78hQIg69LaKNwIRgXE
	f9WA==
X-Received: by 10.15.23.73 with SMTP id g49mr17255990eeu.8.1370963515299;
	Tue, 11 Jun 2013 08:11:55 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	c5sm30934355eeu.8.2013.06.11.08.11.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 11 Jun 2013 08:11:54 -0700 (PDT)
Date: Tue, 11 Jun 2013 17:12:18 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130611151218.GE3233@jama>
References: <2472586.UfWZc5OvGZ@koontz> <7063136.DAg8vKBVKy@koontz>
	<CAMKF1sohYz4g8zf8fJie6k=Q5ngSuVwhFEOGPoViOfJm+UhT4g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sohYz4g8zf8fJie6k=Q5ngSuVwhFEOGPoViOfJm+UhT4g@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: xf86-video-intel compilation failure
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
X-List-Received-Date: Tue, 11 Jun 2013 15:11:56 -0000
X-Groupsio-MsgNum: 45034
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="T6xhMxlHU34Bk0ad"
Content-Disposition: inline

--T6xhMxlHU34Bk0ad
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2013 at 08:09:40AM -0700, Khem Raj wrote:
> On Tue, Jun 11, 2013 at 6:49 AM, S=F8ren Holm <sgh@sgh.dk> wrote:
> >
> > Copying my local dri2.h into the sysroot like this makes the driver com=
pile.
> >
> >  cp /usr/include/xorg/dri2.h  tmp-eglibc/sysroots/vmc16/usr/include/xor=
g/
> >
> > Any hint on where that files is.
> >
> > S=F8ren HolmTirsdag den 11. juni 2013 00:10:34 skrev :
> >> Hi
> >>
> >> When compiling xf86-video-intel I get the following compilation error.=
 Do
> >> you have any ideas - I have looked everywhere for xorg/dri2.h
> >>
> >> | /home/sgh/git/openembedded/build/tmp-
> >>
> >> eglibc/sysroots/vmc16/usr/include/xorg/xf86.h:202:33: note: previous
> >> declaration of 'xf86CVTMode' was here
> >>
> >> | In file included from i830_3d.c:33:0:
> >> | intel.h:66:18: fatal error: dri2.h: No such file or directory
> >> | compilation terminated.
>=20
>=20
> do you have xserver-xorg staged in sysroot

And you need to build xserver-xorg with right PACKAGECONFIG options.

> >> | make[3]: *** [i830_3d.lo] Error 1
> >> | make[3]: Leaving directory `/home/sgh/git/openembedded/build/tmp-
> >>
> >> eglibc/work/prescott-oe-linux/xf86-video-intel/2_2.21.6-r0/xf86-video-
> >> intel-2.21.6/src'
> >>
> >> | make[2]: *** [all-recursive] Error 1
> >> | make[2]: Leaving directory `/home/sgh/git/openembedded/build/tmp-
> >>
> >> eglibc/work/prescott-oe-linux/xf86-video-intel/2_2.21.6-r0/xf86-video-
> >> intel-2.21.6/src'
> >>
> >> | make[1]: *** [all-recursive] Error 1
> >> | make[1]: Leaving directory `/home/sgh/git/openembedded/build/tmp-
> >>
> >> eglibc/work/prescott-oe-linux/xf86-video-intel/2_2.21.6-r0/xf86-video-
> >> intel-2.21.6'
> >>
> >> | make: *** [all] Error 2
> >> | ERROR: oe_runmake failed
> > --
> > S=F8ren Holm
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--T6xhMxlHU34Bk0ad
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlG3PlIACgkQN1Ujt2V2gBz7+ACfTebk+hmHD40T5KbYHEySNFa3
XVwAn3a9734K8eU0Cas9oIgAD/V0CVBr
=BfHN
-----END PGP SIGNATURE-----

--T6xhMxlHU34Bk0ad--
