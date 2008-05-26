Received: from [209.85.198.247] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1K0k2p-0000cu-6A
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 May 2008 23:15:51 +0200
Received: by rv-out-0708.google.com with SMTP id f25so2554215rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 May 2008 14:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:subject:from:to:in-reply-to:references:content-type:date:message-id:mime-version:x-mailer;
	bh=llm7fH23wpeR6lMEf71Q6jIKFoTiu/Vvt4qO+3ihSII=;
	b=nqrUt+f65Z73YbiGvA7gmJN7N1EOJsAn0GBfztV+phWa4hAjCVb9wmZq8o8snn/SgxTgvAzM3GRxphC0nzSprrKgSrGHtT+NIe+8O1tlHfsAXW5oYHpIaO9pn9UUQsk5yR0DUWg4JTr86FtyeRad91UlGmFZj98lxYlS7CV1GvE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=subject:from:to:in-reply-to:references:content-type:date:message-id:mime-version:x-mailer;
	b=NeGGpLAWFgIhhYG5nOyKQp1FJgw5gpTV+7mhQsUvOANdqm8gGDfNg3VOynEY1W97aBiprir6+o/qY8OvU8cBbRChn77DaHl6LAWbW3m8SMibwoRzLt0CdiAzl+sEwYRhK9VF0zDS/O6tUlpsUKVyADWWtu1dW7ZDUdNzQmrhGT0=
Received: by 10.141.63.20 with SMTP id q20mr181859rvk.258.1211836352390;
	Mon, 26 May 2008 14:12:32 -0700 (PDT)
Received: from ?192.168.1.71? ( [71.146.2.3])
	by mx.google.com with ESMTPS id g22sm10821625rvb.7.2008.05.26.14.12.31
	(version=SSLv3 cipher=RC4-MD5); Mon, 26 May 2008 14:12:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <c384c5ea0805261354i1e72a973i3efbb20681e00f03@mail.gmail.com>
References: <1211780824.10806.52.camel@isis>
	<c384c5ea0805261354i1e72a973i3efbb20681e00f03@mail.gmail.com>
Date: Mon, 26 May 2008 14:12:30 -0700
Message-Id: <1211836350.10806.54.camel@isis>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.1 
Subject: Re: [PATCH] glibc staging puts .a files in /lib
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Mon, 26 May 2008 21:15:51 -0000
X-Groupsio-MsgNum: 5253
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-YbKdZadKOidrJsVmrlI8"

--=-YbKdZadKOidrJsVmrlI8
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Mon, 2008-05-26 at 22:54 +0200, Leon Woestenberg wrote:
> Hello Khem,
>=20
> On Mon, May 26, 2008 at 7:47 AM, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > I have been seeing this problem where link would fail for libgcc when
> > building libgcc with some weird messages like
> >
> > also Leon was seeing same issue on eglibc. I tracked this problem to
> >
> Kudos Khem! Thank you very much for investigating this; I would not
> have been able to track it down so quickly.
>=20
> It's good to have your toolchain expertise around, very much appreciated.
>=20
> > The attached patch fixes it for glibc. Eglibc also needs similar fix bu=
t
> > I decided to use make install in eglibc which makes it much easier.
> >
> > OK ?
> >
> I just wonder why we didn't see this issue on glibc yet? Even with my
> machine (mpc8313e-rdb) this didn't show up earlier.
> Could it be the (older) version of glibc I used?

yes. The 2.6.1 glibc's libc.a does link silently. Thats why it was still
working there.

>=20
> Regards,

--=-YbKdZadKOidrJsVmrlI8
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBIOye+HnJKy6V6em4RAl5eAJ0dKmmIFSJiyVxnjp7cyZjQy2CXLwCgmDyu
yT23KjXHP416d7CYs/9X4Po=
=QgYD
-----END PGP SIGNATURE-----

--=-YbKdZadKOidrJsVmrlI8--
