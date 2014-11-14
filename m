Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 595A665C7B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Nov 2014 11:56:08 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id l15so2396515wiw.16
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Nov 2014 03:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=TfnHgwv8I+ponwBBQVypQ1F8QL7lFf1yxixRbtvfEEI=;
	b=T5U5efJHMfYNkbBWGxeDvy/TBr+DeMZVNBTO13B7JqmRFMOGNTBK5LzBcK3OuWPRDG
	eBp7K8m92BkjcHrfsHF4x+7AA+WNJYUWhfEzbO9dflwBsE+qgN5rEzz2pWA/j58xdXxB
	41XeskV4Q0xdhEjP1jvfG3gTpOeSzoKYiCSDHBva5dvsbJnHBqhOQ8/V5hi/txp3rSWs
	+BOmjb5LOa1FBAzdwmesvwlGl6/cU2jz/LXQL5QkC2hXGfL8nyU2xh50FXWTM6yhKnpj
	m7XARP1BfopC6c0mhbLuOP+YyNVFhwKmoEjIUiVSmOnUnbcJzYwqNPOi1msBYXDlwN+z
	Y3Zw==
X-Received: by 10.180.92.169 with SMTP id cn9mr7060122wib.26.1415966168589;
	Fri, 14 Nov 2014 03:56:08 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	gs9sm39348778wjc.47.2014.11.14.03.56.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Nov 2014 03:56:07 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 14 Nov 2014 12:56:13 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141114115613.GA2458@jama>
References: <3B9CABF3-66A1-4B2A-A01B-87ABFDCB797F@stunpix.com>
MIME-Version: 1.0
In-Reply-To: <3B9CABF3-66A1-4B2A-A01B-87ABFDCB797F@stunpix.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: How to organize OE environment for intermediate builds
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
X-List-Received-Date: Fri, 14 Nov 2014 11:56:11 -0000
X-Groupsio-MsgNum: 52877
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5mCyUwZo2JvN/JJP"
Content-Disposition: inline

--5mCyUwZo2JvN/JJP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 14, 2014 at 12:27:03AM +0200, Alexander Shashkevych wrote:
> Hello,

Hi,

>=20
> I would like to ask you how do you organize your development environments=
 for OE?
>=20
> Let me explain. From my point of view OE build system is well suited for =
builds of released code, but not for code that is still under development w=
ith many intermediate builds. My case: I started a project for Freescale pl=
atform and due to bsp headers/libs/cross-compiling it can be built only wit=
hin OE environment. I have already committed initial code to my project's r=
epo and have already written layers&recipes to build project from git. That=
 was not a problem and it works. Then I added new changes to my project and=
 stuck. Before I'll commit them into git I need to build&test to be sure th=
at everything is OK, but to build changes with bitbake they should be commi=
tted first. Mutual exclusive situation: can't commit without build and can'=
t build without commit.
>=20
> How do you escape this? How to best organize OE environment for intermedi=
ate builds without commits?
>=20
> PS: I hope you understand that endless commit'n'push of each little chang=
e for just-to-test is extremely superfluous.

Check externalsrc.bbclass

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--5mCyUwZo2JvN/JJP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlRl7d0ACgkQN1Ujt2V2gByuSQCdG+Wiyuh3OhSfFRKBtm5gQn8v
z6IAn025ilTPTrqI4SzlSgG2mtY0xL1e
=zRX8
-----END PGP SIGNATURE-----

--5mCyUwZo2JvN/JJP--
