Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 87E4A76FDE
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Sep 2015 00:00:10 +0000 (UTC)
Received: by padhy1 with SMTP id hy1so11504276pad.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Sep 2015 17:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=agdSkWJZp9JJfVpIonFZklLiOdWpLa+WCVTG7L+b6tM=;
	b=adXtJ0aiLueLXWTgsstodz4LrvtAwI7xkGDp3cg6muFNLrYMQOZ2vOCu9d/DfZn3O/
	5t5IIgRNsgrsHlJneQJcjYnzVmauOPjMYZdv31Y3sBbCWfW7zGopk5RFTjLWL5WYQ/+s
	DoUn+9908MSDbWSgh9hiMdfp1dCJF0ku19FaZO+doAbq0RsRf6ebYZTFeF/hS1jPjeFy
	F8FXojJF5kJx7X+sxq4roolUb+gSVdd1MmhhkN0t3L6XBujyfj3WTOWc9SCErZbFOuWE
	u7yhR+PEF5TY7IzvmSTdCcNtzNzcvzHcnuAc+b4Lu8UzBKpd078hcqGyhWiyg7Fp5j1v
	i9Wg==
X-Received: by 10.68.190.227 with SMTP id gt3mr47220944pbc.102.1441152011477; 
	Tue, 01 Sep 2015 17:00:11 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:49fd:b69d:583d:d543?
	([2601:646:8601:4580:49fd:b69d:583d:d543])
	by smtp.gmail.com with ESMTPSA id
	bh5sm11753184pbc.5.2015.09.01.17.00.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 01 Sep 2015 17:00:10 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20150901220720.GG2458@jama>
Date: Tue, 1 Sep 2015 17:00:08 -0700
Message-Id: <95980240-0D69-4BF7-93B5-3E4BA34D2D1F@gmail.com>
References: <1436147494-44348-1-git-send-email-leimaohui@cn.fujitsu.com>
	<20150831175844.GD2465@jama>
	<CAJ86T=VFZXxLnoMQ7_xv3SZiqYrwwmKmTwss+0o+T=wk3ywi_Q@mail.gmail.com>
	<CALbNGRQ_gWV_j01cwQCnCem7MNY_=tD55MJ8hsW_dLwfcFVByA@mail.gmail.com>
	<CAJ86T=Wxf6PN+csum6CeyiC_keZtzG69VSQ8YFsA_x2kQh5zcw@mail.gmail.com>
	<20150901063653.GA29931@ad.chargestorm.se>
	<CAJ86T=XmrpVAhz5nr-+KJbc+Fcn3=sS6Y5xVTAi1Dbd+NTvK4Q@mail.gmail.com>
	<20150901220720.GG2458@jama>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.2104)
Subject: Re: [meta-oe][PATCH] parted_1.8.6.bb: add parted that not GPLv3
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
X-List-Received-Date: Wed, 02 Sep 2015 00:00:14 -0000
X-Groupsio-MsgNum: 57167
Content-Type: multipart/signed;
	boundary="Apple-Mail=_34BF78A8-97A5-4488-866E-936A70AB8E47";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_34BF78A8-97A5-4488-866E-936A70AB8E47
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=windows-1252



> On Sep 1, 2015, at 3:07 PM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
>=20
>>=20
>> According to bitbake-layers, the current list of oe-core recipes =
which
>> are over-ridden by meta-oe is quite short though:
>>=20
>> iso-codes:
>>  meta-oe              1.4
>>  meta                 3.58
>> libcap-ng:
>>  meta-oe              0.7.7
>>  meta                 0.7.7
>> nativesdk-swig:
>>  meta-oe              3.0.6
>>  meta                 3.0.6
>> xserver-nodm-init:
>>  meta-oe              2.0
>>  meta                 1.0
>>=20
>> The first 3 are transient (the oe-core versions were recently added
>> and the meta-oe versions can be removed). Having meta-oe over-ride
>> oe-core isn't necessary or helpful for these recipes.
>=20
> Yes, that's why I'm asking people migrating recipes to oe-core to send
> removal patch to meta-oe (while verifying that what they migrated =
wasn't
> modified in meta-oe after they created their copy) - some people do it
> some don=92t.

I think such migration to other layer patches should be held from new =
target layer until the removal patches are
also available on the mailing list. So this activity can be done =
synchronously. Layer maintainers should take note
of such changes and advise the developers to do the needed. Please reply =
with comments to such patches on mailing lists
to raise the awareness.

>=20
>> I'm not sure what's going on with xserver-nodm-init. Both versions =
are
>> being updated independently but it looks like they could be unified
>> with minor changes.
>=20
> Not minor changes, there is long ticket in bugzilla mostly related to
> x11-common xserver-common, which result in this xserver-nodm-init
> difference.
>=20
> Regards,


--Apple-Mail=_34BF78A8-97A5-4488-866E-936A70AB8E47
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXmPAgACgkQuwUzVZGdMxQHGgCeLs+NpqDFYMGsWJVj3SMWjoaH
tcAAn2AHul4QtUz7l8Z1PRzSBhhiNWsk
=YU3x
-----END PGP SIGNATURE-----

--Apple-Mail=_34BF78A8-97A5-4488-866E-936A70AB8E47--
