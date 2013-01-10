Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1TtHVa-0004TP-Dy
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jan 2013 13:45:23 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0ACU7A7015028
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jan 2013 04:30:08 -0800 (PST)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Thu, 10 Jan 2013 04:30:07 -0800
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id 87A5A7FCE	for
	<openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jan 2013 07:28:29 -0500 (EST)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id CB4792414E; Thu,
	10 Jan 2013 07:30:06 -0500 (EST)
Date: Thu, 10 Jan 2013 07:30:06 -0500
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20130110123006.GC3594@windriver.com>
References: <1357814691-1724-1-git-send-email-noor_ahsan@mentor.com>
	<CALbNGRTY2_cAeE8GPKsLxiQE8iJaAVsOfe_9rpBRP0NcQ7LpXA@mail.gmail.com>
	<CALbNGRQYhMrEFDhbBPAcPyEejp9GkhuLwo4uStJCLP64Ap_Bpg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRQYhMrEFDhbBPAcPyEejp9GkhuLwo4uStJCLP64Ap_Bpg@mail.gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking][PATCH] autofs: Remove systemd related things.
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
X-List-Received-Date: Thu, 10 Jan 2013 12:45:23 -0000
X-Groupsio-MsgNum: 42637
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="B4IIlcmfBL/1gGOG"
Content-Disposition: inline

--B4IIlcmfBL/1gGOG
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH] autofs: Remove systemd related things.] =
On 13.01.10 (Thu 12:58) Andreas M=FCller wrote:

> On Thu, Jan 10, 2013 at 12:53 PM, Andreas M=FCller
> <schnitzeltony@googlemail.com> wrote:
> > On Thu, Jan 10, 2013 at 11:44 AM, Noor, Ahsan <noor_ahsan@mentor.com> w=
rote:
> >> From: Noor Ahsan <noor_ahsan@mentor.com>
> >>
> >> * Autofs was being inherited from systemd. This class is only
> >> present in meta-systemd. So bitbake was giving parse error
> >> about systemd class. So removed systemd from inherit and
> >> removed SYSTEMD_PACKAGES and SYSTEMD_SERVICE.
> > Is this still true after auto BBMASKing?
> I misread the patch so please forget previous mail. But it would be
> nice to have an systemd append.

Yeah, I agree.  I'll merge this patch, but please also consider sending
a patch for meta-systemd that has the appropriate bbappends.

--=20
-Joe MacDonald.
:wq

--B4IIlcmfBL/1gGOG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlDutE4ACgkQPN8S4W6ZZndEawCeLbCwwQrq+zGMjYEaATXO+6Gu
nukAnjF030z2XjEI//waO+jnG+YtQkbX
=ioKA
-----END PGP SIGNATURE-----

--B4IIlcmfBL/1gGOG--
