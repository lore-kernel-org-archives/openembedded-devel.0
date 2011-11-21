Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RSSXG-0007tG-C5
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Nov 2011 12:59:42 +0100
Received: by ywt2 with SMTP id 2so4575274ywt.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Nov 2011 03:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=N7TYSGcY1JEnSJIJg8nAw8VyBisvUZPqCP8Xw+d56f8=;
	b=gtMR2hwPW99iTs3bw4X/tbbfhiVoFZfSN+byw2gS64T1u7PXbXJzwAhu0e58nnlBAq
	ud+fIXeEvE5S5AOSefohSsibaszhRKxKyd/gjHWsQm+cetb9giUtvx4gRh6Loxs/9o+K
	94zF1giAmU+wJGrYf2eAAypbtnYTWW7ey1mVE=
Received: by 10.152.146.100 with SMTP id tb4mr7943616lab.0.1321876346500;
	Mon, 21 Nov 2011 03:52:26 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id mo6sm9304862lab.11.2011.11.21.03.52.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 21 Nov 2011 03:52:25 -0800 (PST)
Date: Mon, 21 Nov 2011 12:52:13 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111121115213.GF3565@jama.jama.net>
References: <1321783600-23772-1-git-send-email-Martin.Jansa@gmail.com>
	<1321788386-31278-1-git-send-email-Martin.Jansa@gmail.com>
	<CAAQYJAvg6mLaVxNf2O6VV1Dw+5vCH+SsJ3HKJVmgmU4KkYvk5Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAQYJAvg6mLaVxNf2O6VV1Dw+5vCH+SsJ3HKJVmgmU4KkYvk5Q@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-handheld v2] linux-kexecboot: use kernel_conf_variable like linux.inc does and respect CMDLINE_DEBUG
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
X-List-Received-Date: Mon, 21 Nov 2011 11:59:43 -0000
X-Groupsio-MsgNum: 35483
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eNMatiwYGLtwo1cJ"
Content-Disposition: inline

--eNMatiwYGLtwo1cJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 21, 2011 at 11:43:46AM +0100, Andrea Adami wrote:
> On Sun, Nov 20, 2011 at 12:26 PM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
> Martin,
>=20
> I agree for the use kernel_conf_variable but I'm unsure about CMDLINE_DEB=
UG.
> In fact, I hardcoded it purposedly with commit 8929166 with the
> following reasons:
>=20
> * Being a second-stage bootloader we don't expect any output on screen.
> * Adding 'debug' as commandline arg is pointless because
> * linux-kexecboot is compiled without debug and printk in order
> * to minimize the size.
> * Full debug implies not only editing the commandline (e.g. earlyprintk)
> * but re-enabling full debug options in the defconfigs

I had some issues with 3.2.0-rc2 when used as linux-kexecboot, that's
why I've added this, but later found out that it's really a bit
incomplete, that's why I have followup patch for this:
https://gitorious.org/shr/meta-handheld/commit/6bc710615b587fc0bfd8fc4372ca=
d0de5599dd82?format=3Dpatch

But with latest SRCREV it works again, so in theory I don't need it, but
still it would be usefull to have easy way to debug even this stage
(maybe you still remember older kernel version where it worked fine=20
as 3rd stage and failed to boot as 2nd stage..).

BTW: here is upgrade to 3.2.0-rc2 with those changes to
linux-kexecboot.inc applied
https://gitorious.org/shr/meta-handheld/commit/27ca3d24353a5473f4f1aade00ba=
7a52b667e28c?format=3Dpatch

(be aware that I do rebase that branch sometimes so if those commits are
not valid anymore just look at last few commits in that branch).

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--eNMatiwYGLtwo1cJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7KO20ACgkQN1Ujt2V2gBxFbwCgkYYWuBYfVjn6bjmyBp8EjkkC
e+MAoJ+1l0EiKm7vAsVCvQWeeKW9o7lR
=Eoq9
-----END PGP SIGNATURE-----

--eNMatiwYGLtwo1cJ--
