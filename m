Received: from mail-da0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1USmjk-0000fS-Ji
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Apr 2013 13:10:49 +0200
Received: by mail-da0-f43.google.com with SMTP id u36so1311498dak.30
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Apr 2013 03:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=9blq2bJdbWNOSMPcRzekiykoprX41t2ggZzj43gRf8E=;
	b=zx5KsxTUWCpjC10S8wLQBf0nm3ZDcbknIsZ2J+HrXA4KzHvrvLiZtWDCgxYaAsuOsU
	Re9KsON6jYnVQNqo63xqbUWZ+5P7nJHozXGgULvFoLKXesSsvWqP/eQLLVkX65hm8cmX
	/SrkxsJ60g8TaEBj1BUfvWyLOpDvjr0NEBjuYJTcK9+bSQik9sATLH3vET2oTMXmW30d
	o1IWL4oMDqlVOlHoIKZfgjinryaxAWcSGm7ZPFwnvgwxLUId5fbcYAAgP42oxUYXFU6J
	AEdu6FX7mPCrkA10m5Xi/Y3OIzUQy7OkPvHGuLjU3KaFQYxJdwK2U1A0FukGI+pLsjYW
	yhwg==
X-Received: by 10.68.58.228 with SMTP id u4mr1558904pbq.30.1366282390684;
	Thu, 18 Apr 2013 03:53:10 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id w8sm9511013pbt.17.2013.04.18.03.53.08
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 18 Apr 2013 03:53:09 -0700 (PDT)
Date: Thu, 18 Apr 2013 12:53:10 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130418105310.GN26007@jama>
References: <CANyK_8frhEkQ3-ktHygKdQOWZB3cDVEsqLj_VK7ZeLLL-XEj5A@mail.gmail.com>
	<20130416111424.GJ10628@jama.dyndns-home.com>
	<CANyK_8cWf21+4CgXwJLE4-nxYGZwhXdpkQEW4MtfaQ5t=QdXMA@mail.gmail.com>
	<CANyK_8ft6aY8KFArMc35eKAZGYET5O++VpErsgWOrOZ9=r8vbA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANyK_8ft6aY8KFArMc35eKAZGYET5O++VpErsgWOrOZ9=r8vbA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe] vim 7.3
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
X-List-Received-Date: Thu, 18 Apr 2013 11:11:00 -0000
X-Groupsio-MsgNum: 44313
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yAzUYvkKIfeS0jQX"
Content-Disposition: inline

--yAzUYvkKIfeS0jQX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 18, 2013 at 10:51:21AM +0100, Paul Barker wrote:
> I've now got a recipe for vim-7.3.905 that's been tested on my
> Raspberry Pi but I have a few questions before I submit a patch:
>=20
> 1) vim has new patch releases very often so if I stick with a fixed
> version we'll fall behind quickly. However the default branch might
> become vim-7.4 at some point in the future but I'm not sure we want to
> move to that automatically. There isn't even a vim-7.4 development
> branch in the upstream repository so that may be a long while away. Do
> you have any advice on whether I should specify a fixed version or use
> AUTOREV? It could also be possible to include both a vim_7.3.905.bb
> file and a vim_hg.bb file.

No AUTOREV in meta-oe, but it's fine to add both
vim_7.3.905.bb and vim_hg.bb if hg versions have negative
DEFAULT_PREFERENCE and SRCREV that you can confirm is working (you can chan=
ge
it to AUTOREV later in your local.conf if you want).

> 2) Am I right changing SRC_URI in vim.inc to the mercurial URL and
> just keep SRCREV in the .bb file?

sounds correct

> 3) There's a vimrc file kept along with the recipe for vim, I can't
> see much useful in the git history of this file. There's also a
> vimrc_example.vim file in the runtime files distributed with vim that
> will keep up-to-date with any changes to syntax or features, should we
> move to using this?

You mean to use vimrc_example.vim from vim archive instead of our local
vimrc copy? Sounds good too.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--yAzUYvkKIfeS0jQX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFv0JYACgkQN1Ujt2V2gBwwJACcDx9ksgUooy/AMC+dAd/BX6/v
+KYAn0rlRZOeD3TnZpq90tZszDoa18un
=eVQW
-----END PGP SIGNATURE-----

--yAzUYvkKIfeS0jQX--
