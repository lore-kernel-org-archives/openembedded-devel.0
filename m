Received: from [209.85.200.173] (helo=wf-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1LnPHN-0007tt-Mh
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 Mar 2009 04:32:18 +0100
Received: by wf-out-1314.google.com with SMTP id 25so1730718wfa.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Mar 2009 20:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:user-agent:cc:references:in-reply-to:mime-version:content-type
	:content-transfer-encoding:message-id;
	bh=x/a/eU0dUHgf30+1FzRYtz8rzb8id3pEr0dXigSaYfI=;
	b=ts5aJU7HRoRm8Lwis+cRfskt9wKc51NDdAf4UAfTW0ZY/bXuWdVd4iSGJp8pBV+wQ+
	jVYfyF1hgZcwo40hvorRELmhTBO6UODG+x4WNZ2Rm/69mMi4EljV/DSwAZscYUaYr1z1
	kdj/TSTJSw1PuU17Ai34bwoiWPFHXEaxTtvNs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:user-agent:cc:references:in-reply-to
	:mime-version:content-type:content-transfer-encoding:message-id;
	b=c6fom+BHKekZVzvnd78Rhk53/V1kUMwKnTBMFB6DM4CLQHbMWqYdyPTJiW3lWbBtDu
	PHbSm6iu1fRGKuNDoNKUuHnZrIprUEKtVQ9AJm1MeTBdnXGOJAe28eOdPBfiLova4ffP
	Pa/kmzosQOOViF8T5Xhagx3yMnelN+15hsMBA=
Received: by 10.142.157.6 with SMTP id f6mr1158830wfe.317.1238211026266;
	Fri, 27 Mar 2009 20:30:26 -0700 (PDT)
Received: from morpheus.localnet (adsl-71-146-12-154.dsl.pltn13.sbcglobal.net
	[71.146.12.154])
	by mx.google.com with ESMTPS id 22sm4325620wfd.46.2009.03.27.20.30.24
	(version=SSLv3 cipher=RC4-MD5); Fri, 27 Mar 2009 20:30:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Mar 2009 20:30:19 -0700
User-Agent: KMail/1.11.1 (Linux/2.6.28-11-generic; KDE/4.2.1; x86_64; ; )
References: <20090327095751.GA8994@fh-wedel.de>
In-Reply-To: <20090327095751.GA8994@fh-wedel.de>
MIME-Version: 1.0
Message-Id: <200903272030.23571.raj.khem@gmail.com>
Subject: Re: Link error: host instead of target libc
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
X-List-Received-Date: Sat, 28 Mar 2009 03:32:18 -0000
X-Groupsio-MsgNum: 8778
Content-Type: multipart/signed; boundary="nextPart1286074.Rc0UJAClb6";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1286074.Rc0UJAClb6
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Friday 27 March 2009 02:57:51 Martin Dietze wrote:
> Hi,
>=20
>  still trying to get nylon/mtx-1 built with the current OE code,
> I am getting this error at install of glibc-2.3.3:
>=20
> | /var/src/OE/tmp/cross/mipsel/lib/gcc-lib/mipsel-oe-linux/3.3.4/../../..=
/../mipsel-oe-linux/bin/ld: skipping incompatible /lib/libc.so.6 when searc=
hing for /lib/libc.so.6
> | /var/src/OE/tmp/cross/mipsel/lib/gcc-lib/mipsel-oe-linux/3.3.4/../../..=
/../mipsel-oe-linux/bin/ld: cannot find /lib/libc.so.6
> | collect2: ld returned 1 exit status
> | make[2]: *** [/var/src/OE/tmp/work/mipsel-oe-linux/glibc-2.3.3-r16/buil=
d-mipsel-oe-linux/math/libm.so] Error 1

One reason could be that you linker is not aware of sysroot properly. As a =
result it does not append correct sysroot path and ends up looking at /lib =
which ofcourse it your host libc (x86) and hence the error. you might need =
to backport sysroot related patches to binutils 2.14

We have been able to build mipsel with angstrom-2008 I would suggest that y=
ou use those versions of toolchain and kernel headers for nylon to start wi=
th. Its gcc 4.2.4 binutils 2.18.x.x.x eglibc-2.9 linux-libc-headers 2.6.23

>=20
> Having asked google I found that people had this kind of problem
> before, but I could not extract any hint on how to solve this
> there. My checkout of OE dates back to this commit:
>=20
> | commit 8ff9eac82736ab3adc5ffd223a39d9eafd2409be
> | Author: Dmitry 'MAD' Artamonow <mad_soft@inbox.ru>
> | Date:   Tue Feb 24 21:38:10 2009 -0800
>=20
> I followed Mickey's proposal and derived my conf/distro/nylon.conf
> from minimal.conf adding my preferred versions etc.
>=20
> Having had a longer break from nylon maintainership I seem to have
> missed a lot of changes in OE; and I am quite clueless now where to
> start searching for what causes the above error. Any hint?
>=20
> Cheers,
>=20
> Martin
>=20

=2D-=20
Khem Raj

--nextPart1286074.Rc0UJAClb6
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAknNmcsACgkQHnJKy6V6em7kjgCgj1m3896lZvARSLco7gQxAdLN
vW0AoIeA61Ysm3qDGPoyCxMcvoVaRx+q
=kca5
-----END PGP SIGNATURE-----

--nextPart1286074.Rc0UJAClb6--
