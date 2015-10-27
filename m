Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 7D9CD757AB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 11:05:25 +0000 (UTC)
Received: by wicfv8 with SMTP id fv8so156616429wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 04:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=9ITg1SSOSFMu+6FCgID9i0/JUenYIwu5pvsh9LpoppM=;
	b=UJdJpXSGXI5Pi9jx7baIb9JR/PSYNSylTxJde/qyoFco3d8CnohKpJbyrF+OfbtN28
	B8kKOn1iPyT5gdIcQFiFwU2qCQrfa4S7NmhQCLpMLEnrk2x7al9XYgZ1XMk9mK5yhvh6
	k8eExCqLYxHNg9WBZIDyMAyUqpDrXq43yia2lJDgafbu9D5vtBu+6gUaP4jjRgtDh5gC
	LjeqqELpIA2BsoSWw5AY+p5wIrNnW2k9DgqsRo/JczueZ4FndW0xor5589w+STZ1DhHC
	dM/qNreP3yjoGDzYuWL9AJ675UBlqPMWdPIMI/Jb9lcFH6jemWj3jvPV5n7K6CRZO/G0
	HhJQ==
X-Received: by 10.194.185.52 with SMTP id ez20mr26356034wjc.78.1445943925512; 
	Tue, 27 Oct 2015 04:05:25 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	om1sm40950414wjc.2.2015.10.27.04.05.23
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Oct 2015 04:05:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 27 Oct 2015 12:05:41 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151027110541.GA2577@jama>
References: <562EB36A.1010109@webthatworks.it>
	<CAP71WjyyrqEGtdfN1mzrwaH=YGAC4zdz5QwFH-aSxNzgXr=4JA@mail.gmail.com>
	<562F54BA.2070905@webthatworks.it>
MIME-Version: 1.0
In-Reply-To: <562F54BA.2070905@webthatworks.it>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: checking if a patch was approved
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
X-List-Received-Date: Tue, 27 Oct 2015 11:05:28 -0000
X-Groupsio-MsgNum: 58062
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Dxnq1zWXvFF0Q93v"
Content-Disposition: inline

--Dxnq1zWXvFF0Q93v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2015 at 11:40:58AM +0100, Ivan Sergio Borgonovo wrote:
> On 10/27/2015 08:12 AM, Nicolas Dechesne wrote:
> > On Tue, Oct 27, 2015 at 12:12 AM, Ivan Sergio Borgonovo
> > <mail@webthatworks.it> wrote:
> >> I saw many patch passing by and I submitted a couple about
> >> meta-toolchain-qt5.
> >> I didn't see any message from Otavio or Martin "approving" a patches.
> >>
> >> How can I check if it was approved other than pulling from the repo/ch=
ecking
> >> github?
> >>
> >> Or if there is no place to check... consider this a ping ;)
>=20
> > all commits are published on
> > openembedded-commits@lists.openembedded.org mailing list, and in
>=20
> thanks, actually my commit was for meta-qt5.
> But still I haven't seen any feedback on this mailing list to guess if=20
> the commit was actually approved or not.
>=20
> I haven't seen any "approval" feedback even for other commits. Maybe=20
> because the patches submitted were coming from known developers and the=
=20
> assumption is that if there is no request to fix something the patches=20
> are going to be queued to be committed by default.
>=20
> I'm really not asking for any special attention, I just would like to=20
> know what I've to expect and check if I did the right thing and if I've=
=20
> to do anything else to see my patch committed.

meta-oe and meta-qt5 patches are managed in Patchwork as described here:
http://www.openembedded.org/wiki/Patchwork

You can see the status here.

> Martin Jansa actually noticed a first revision of my patch and gave some=
=20
> feedback to fix stuff and things have been fixed (hopefully) and I=20
> submitted a second release.

I've noticed second revision as well, it's in master-next, but it
haven't finished even the automated jenkins build yet and because I
don't use qt5 SDK I was hoping that someone else will review them as
well. There are 2 formal issues, I've fixed commit message summary to
match our guidelines:
http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

But both are also missing SOB line, please confirm that I can add your
SOB or resend both patches with SOB (and commit message from
master-next).

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Dxnq1zWXvFF0Q93v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYvWoQACgkQN1Ujt2V2gBw3tACaAtWHT0H0DSR9m7p2eDEB55P4
LicAnRmQ8dhFu8EQytHBPvrzVqYqb/JJ
=0FFU
-----END PGP SIGNATURE-----

--Dxnq1zWXvFF0Q93v--
