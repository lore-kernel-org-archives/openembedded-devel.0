Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S0UZu-0003MR-9o
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Feb 2012 10:03:06 +0100
Received: by eekd41 with SMTP id d41so422039eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2012 00:54:45 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.213.3.201 as permitted sender) client-ip=10.213.3.201; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.213.3.201 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.213.3.201])
	by 10.213.3.201 with SMTP id 9mr137504ebo.93.1329987285445 (num_hops =
	1); Thu, 23 Feb 2012 00:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=zxMmfDZP9B95MOAnJtEPQJvioSFfVpVzKLJnb/vJP54=;
	b=g/DP+DDSH8shYeogKcjApYEOx9MdDqi6NkYcan+GrXM2MPb/DOMEgl45qbFe1WeLJt
	mNWjY2ZJ5jyiBfi0uTarBA4s/Q8ezwJq17lGlCPX/g2bwlPH6x1427CO3imWaU/7ncJY
	Mp7Tn1O7fRiC4+bTc+aO4XkgwAAFW1pGyMUZo=
Received: by 10.213.3.201 with SMTP id 9mr110634ebo.93.1329987285316;
	Thu, 23 Feb 2012 00:54:45 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id s48sm3100931eem.0.2012.02.23.00.54.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 00:54:44 -0800 (PST)
Date: Thu, 23 Feb 2012 09:54:43 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120223085443.GO3769@jama.jama.net>
References: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
	<20120220124013.GG3953@jama.jama.net>
	<CALbNGRQ-drXQR9AfSQxOp7EfeL184-RstqOezfPfAdWJiY3zpw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRQ-drXQR9AfSQxOp7EfeL184-RstqOezfPfAdWJiY3zpw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][v2] 00/22] systemd rework
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
X-List-Received-Date: Thu, 23 Feb 2012 09:03:06 -0000
X-Groupsio-MsgNum: 37366
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="keoAwTxaagou87Dg"
Content-Disposition: inline

--keoAwTxaagou87Dg
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 23, 2012 at 09:26:50AM +0100, Andreas M=FCller wrote:
> On Mon, Feb 20, 2012 at 1:40 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > On Thu, Feb 16, 2012 at 03:02:54AM +0100, Andreas M=FCller wrote:
> >> V1 -> V2:
> >> [2] =A0do not check configuration variables for cross and nativesdk
> >> [3] =A0rename systemd_package to systemd_generate_package_scripts
> >> [6] =A0parse unit files to determine the files to pack
> >> [7] =A0create warning if *-systemd package already rdepends
> >> =A0 =A0 =A0it's base package
> >> added in V2:
> >> [8]-[20] remove obsolet systemd code from recipes (these were used as
> >> =A0 =A0 =A0test cases)
> >> [21] dhcp-(relay) test case for multiple systemd packages
> >> [22] modified to start service
> >>
> >> The following tests were performed:
> >> * build from scratch with [1]-[7] / run test
> >> * build from scratch / apply patches / build -> check buildhistory diff
> >> * build from scratch w/o patches / build from scratch with patches -> =
check
> >> =A0 buildhistory diff
> >>
> >> Additional patches were prepared for other recipes inheriting systemd.=
 These are
> >> not yet send because they move systemd support from ${PN} to ${PN}-sys=
temd which
> >> currently needs modifications on tasks/images. I'd be happy if a commo=
n accepted
> >> solution would be suggested/implemented (image-feature?).
> >
> > Today I've noticed one more issue (not sure if it's caused by this
> > patchset or not).
> >
> > Some images are failing for me with:
> > For package xserver-nodm-init-systemd SYSTEMD_SERVICE-entry xserver-nod=
m.service does not exist
> > from systemd.bbclass:populate_packages_prepend
> >
> > I guess it's because sstate package:
> > sstate-xserver-nodm-init-all-oe-linux-2.0-r13-all-2-2ac030a94ddbd202f54=
b99c2e32c6312_package.tgz
> >
> > has only
> > package/lib/systemd/system/xserver-nodm.service
> >
> > but systemd.bbclass:populate_packages_prepend is looking only in ${D}
> > (image directory).
> >
> I prepared V3 and up to now all tests look good. Regarding this issue:

Great!

> What is a test case to reproduce if the modification are OK?

With clean tmpdir (and without rmwork) build xserver-nodm to populate
sstate-cache, then delete tmpdir and build it again. If it reuses .ipk
directly from sstate deploy-ipk.tgz, then it's a bit harder and you have
to change checksum of some runtime dependency (so that do_package_write is
reexecuted after unpacking package.tgz from sstate) this is usually
triggered by change of MACHINE.

But if you don't manage to reproduce it then we can fix this in
followup..

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--keoAwTxaagou87Dg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9F/tMACgkQN1Ujt2V2gBxDJQCfdjssPnuOj8LFoQJFQLWVZ/PZ
ek0AnjLWQz/pWZGQ9p/546g31w0QDF7H
=ZGGB
-----END PGP SIGNATURE-----

--keoAwTxaagou87Dg--
