Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1TvqJv-0005hn-UN
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Jan 2013 15:19:58 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0HE4W3r007328
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 17 Jan 2013 06:04:32 -0800 (PST)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Thu, 17 Jan 2013 06:04:31 -0800
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id 1315B7FD0;
	Thu, 17 Jan 2013 09:02:45 -0500 (EST)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id 8339C222A6; Thu,
	17 Jan 2013 09:04:30 -0500 (EST)
Date: Thu, 17 Jan 2013 09:04:30 -0500
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: yzhu1 <Yanjun.Zhu@windriver.com>
Message-ID: <20130117140430.GF3921@windriver.com>
References: <50F76342.80505@windriver.com>
MIME-Version: 1.0
In-Reply-To: <50F76342.80505@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org, lpd-eng-pull@windriver.com
Subject: Re: Check in Request for WIND00398740 : autofs_5.0.7 do_compile failed with the msg "#error Failed to locate modprobe
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
X-List-Received-Date: Thu, 17 Jan 2013 14:19:58 -0000
X-Groupsio-MsgNum: 42729
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gdTfX7fkYsEEjebm"
Content-Disposition: inline

--gdTfX7fkYsEEjebm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


[Check in Request for WIND00398740 : autofs_5.0.7 do_compile failed with th=
e msg "#error Failed to locate modprobe] On 13.01.17 (Thu 10:34) yzhu1 wrot=
e:

> Hi, JoeM
>=20
> GK && TK is OK.
>=20
> Please check it this patch. The patch is in the attachment. Please check =
it.
>=20
> Thanks a lot.
> Zhu Yanjun

Hi Yanjun,

There's a few hiccups with this one.

   - the patch appears to be against meta-networking, not
     meta-openembedded.  I can work with that, but nothing should be
     committed to meta-networking, that's purely my own side-project and
     everything going to it needs to come through commits in
     meta-openembedded.


   - the commit log includes a reference to an internal bug tracking
     ID, that won't mean anything to anyone outside of Wind River (or to
     most inside :-)).

   - you copied an internal WR mailing list on this, which I think ends
     up with bounces to anyone who replies and isn't inside WR.

   - you should try to ensure your patches follow the OE guidelines, in
     particular with an upstream-status line, not all patches in the
     tree have them, but it's nice if we can stay on top of them.

   - the submission didn't follow the standard guidelines for patches.

There's a recipe in the meta-networking layer (it's basically the same
as all the other meta-openembedded layers) that describes how to easily
send patches to the list in a way that ensures the machinery recognizes
it and that anyone can work with it.  It's here:

   meta-openembedded/
      meta-networking/
         MAINTAINERS

Something like this will help next time around:

   git send-email -1 \
        --to openembedded-devel@lists.openembedded.org \
        --subject-prefix=3Dmeta-networking][PATCH

Since this is a straight back-port of an upstream patch, I don't expect
it to be a big deal, so I've updated your commit log and the patch
header with the information from the link you quoted above.  Mainly just
FYI for the next time.

Thanks.

--=20
-Joe MacDonald.
:wq

--gdTfX7fkYsEEjebm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlD4BO4ACgkQPN8S4W6ZZncENQCeIRlJiL8/OOD2cG1cITqfo4NL
B/IAmgPbA2wVyg1Oo9GcaUS9Wt87Wuvy
=ONRv
-----END PGP SIGNATURE-----

--gdTfX7fkYsEEjebm--
