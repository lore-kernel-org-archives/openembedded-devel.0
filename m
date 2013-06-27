Return-Path: <Joe.MacDonald@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D786960071
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jun 2013 12:38:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5RCd24I007699
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 27 Jun 2013 05:39:02 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Thu, 27 Jun 2013 05:39:00 -0700
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id 85BDB7FCE;
	Thu, 27 Jun 2013 08:38:55 -0400 (EDT)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id 7DC3C40534; Thu,
	27 Jun 2013 08:38:59 -0400 (EDT)
Date: Thu, 27 Jun 2013 08:38:59 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: Paul Barker <paul@paulbarker.me.uk>, <lei.yang@windriver.com>
Message-ID: <20130627123859.GA3812@windriver.com>
References: <1372326719-11068-1-git-send-email-lei.yang@windriver.com>
	<CANyK_8cc7LLLDJssgeWhRHkBy4AshZsGByvjUdwJUZPeBzprgw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANyK_8cc7LLLDJssgeWhRHkBy4AshZsGByvjUdwJUZPeBzprgw@mail.gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH:V3] vlan: Add vlan recipe
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
X-List-Received-Date: Thu, 27 Jun 2013 12:39:00 -0000
X-Groupsio-MsgNum: 45230
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9jxsPFA5p3P2qPhR"
Content-Disposition: inline

--9jxsPFA5p3P2qPhR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH:V3] vlan: Add vlan recipe] On 13.06.27 (T=
hu 12:00) Paul Barker wrote:

> On 27 June 2013 10:51,  <lei.yang@windriver.com> wrote:
> > From: Lei Yang <lei.yang@windriver.com>
> >
> > A 802.1q vlan support program,which can be used by virt-test
> >
> > Signed-off-by: Lei Yang <lei.yang@windriver.com>
>=20
> Just took a quick look at this out of interest. What's using the
> vconfig program once it's installed on the target?
>=20
> vlan-1.9 was released in 2005 and there hasn't been an update since.
> The ArchWiki suggests that the modern 'ip' command can do what vconfig
> used to do (https://wiki.archlinux.org/index.php/VLAN).
>=20
> If we can avoid a dependency on such legacy code that would probably
> be good. Though I may be missing something as I haven't followed all
> the discussion around this patch and I don't know your use case.

That's a good point.  Seeing something like this hasn't changed since
2005 is a little concerning, but frankly I'm not completely shocked when
I find out some piece of networking infrastructure has stabilized to the
point where it isn't undergoing much development anymore.  Particularly
if it's something not everyone uses (and sometimes even if it is:
http://comments.gmane.org/gmane.linux.network/238858).

That said, I remember vconfig coming up a bit when I was working with
the CGL workgroup and at the time we'd thought that ip was able to do
everything vconfig was doing, but we were looking at it in the more
narrow context of the requirements definition.

So I guess my question is the same, is there even a use-case for vlan
now that cannot be addressed by existing, already integrated tools?
Lei?  Your comment is specifically saying "can be used by virt-test",
does that mean that virt-test (or something else in meta-virtualization)
requires vconfig to do 802.1q testing or simply that it hasn't been
ported to use other tools (like ip)?

--=20
-Joe MacDonald.
:wq

--9jxsPFA5p3P2qPhR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlHMMlwACgkQPN8S4W6ZZndU0wCfWA6L68BPqevH2BKmjgiIG4Vk
cegAnAnjdjfenTR9L7XYd05JOVpugv7K
=5d5v
-----END PGP SIGNATURE-----

--9jxsPFA5p3P2qPhR--
