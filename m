Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 799A66BE98
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 18:28:00 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id b15so431315eek.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 11:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Wp9iFlh220QZpd5vIVGrr38K7kVvOP3do50tgKikQe8=;
	b=eRFryp79HSn5Cr2/ktKofQ4VMwOlf/WsxL+9U4p0LcSieoVDqJFd9HCFN6uhxRAwGG
	Fl8Owf7nD24ICaskKB70pfWCkgWqBck2bKBp/Gv3mcAPR6at5azkD+XzVQjqkUFU6Z+2
	TAA5qNfWBi1vOWl772VfQ/n3sXeDwrtfWM5W3qC2YZDEfpAzrxSt+ByFUEgTE2hP77Ym
	9f00cnCV0qPStkMe+Jj2tvjcYLURMOepH1RP8cflpaTIg3nl9FEIcRk9+offK88doUGJ
	Lub7AnxjfO+BuwGUSK/6yNdr479wLbQFFebu2ZFs5hEL6pLRpSmPcPbcl2VmN01eDS9W
	C5+A==
X-Received: by 10.15.63.14 with SMTP id l14mr6212244eex.13.1377800880526;
	Thu, 29 Aug 2013 11:28:00 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	bn13sm48255691eeb.11.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 11:28:00 -0700 (PDT)
Date: Thu, 29 Aug 2013 20:29:13 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130829182913.GQ3544@jama>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
	<ce667a200941cb8764ff7ce563650571fc3b3378.1377791377.git.Martin.Jansa@gmail.com>
	<CAF6bG8e1DwCb-59==JnD5jgwWbND2SRiSo=WPXC-673jvLQ00Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAF6bG8e1DwCb-59==JnD5jgwWbND2SRiSo=WPXC-673jvLQ00Q@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [WIP][PATCH 02/66] libmikmod: upgrade to 3.2.0
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
X-List-Received-Date: Thu, 29 Aug 2013 18:28:01 -0000
X-Groupsio-MsgNum: 45967
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BEpf3/qOw8tl8wP0"
Content-Disposition: inline

--BEpf3/qOw8tl8wP0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 29, 2013 at 07:27:54PM +0300, Marko Lindqvist wrote:
> On 29 August 2013 18:50, Martin Jansa <martin.jansa@gmail.com> wrote:
> > * 3.3 is only beta
> > * 3.1.12 was failing to build with texinfo-5, see
> >   http://sourceforge.net/p/mikmod/mercurial/ci/1fd17189f82561a3a0e343ae=
f05e5cf0b39b8f26/
>=20
>  As libSDL-mixer dependency, and thus recursive dependency for many
> recipes in meta-games, this is important for me. In my local tree I've
> solved the build issue by simply patching doc building part away. Let
> me know if you want that patch (say, to go in to stable branch instead
> of full version upgrade)

I was thinking about it, but if you confirm that 3.2.0 doesn't break any
of your games I'm fine with it.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--BEpf3/qOw8tl8wP0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlIfkvkACgkQN1Ujt2V2gBzD8ACfW9uJp6FGxdt3yWGNP7wb5N0l
LNYAoJ7G2cp8gXjPKSBtOthP1awCoDpJ
=DPxq
-----END PGP SIGNATURE-----

--BEpf3/qOw8tl8wP0--
