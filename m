Return-Path: <martin.jansa@gmail.com>
Received: from mail-pb0-f43.google.com (mail-pb0-f43.google.com
	[209.85.160.43])
	by mail.openembedded.org (Postfix) with ESMTP id 98CC960984
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2013 14:49:30 +0000 (UTC)
Received: by mail-pb0-f43.google.com with SMTP id ma3so1777073pbc.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2013 07:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=DewgfIOCMZvFc4UQyVZOiglcY3ClcxmBb8P3DEe2AGw=;
	b=oolBUDOLiiTcB1Z9RN88+ei7JRzqlXYIMxny017TGSmkNvTrg6QbCKPM4Gl4XRyUlN
	4mzSuB5z3FRm8YsCi+Rd11vjxOj9MMz0nJAu+LKE0VByUG6s2ma2/i35ZVgUhnVMUoDP
	bWJXSxnmcf5OKe4iXRlVXVoGzqigcosRZTfAvEvMHIlSO+1SWMLtIR9SLJDYmnnlkXUV
	yrHJhM4yFGibeb0o6WMiT5+1EC8+oD/TgU1swFfXzkK7kfw26cQs7eXdK8Obq2Qf+81F
	3g45nbhBzYGROHDqmek8lkKIeW6LUjUefMoHtfpX1YlIDPyeBJmOrrWpVBtMqgzw6aKT
	b9sw==
X-Received: by 10.68.180.67 with SMTP id dm3mr8110870pbc.110.1369234171438;
	Wed, 22 May 2013 07:49:31 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	zs12sm8432104pab.0.2013.05.22.07.49.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 22 May 2013 07:49:30 -0700 (PDT)
Date: Wed, 22 May 2013 16:49:25 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130522144925.GJ32431@jama>
References: <CA+YB3rYf0Tt181v+zAqCwjKk74uP88Zoaht_+FMuS7ee2tJRfQ@mail.gmail.com>
	<CALbNGRSV7KK5hPddSiVTRborW6_PZfYstDFfu4M2oRJ5QwtV_Q@mail.gmail.com>
	<519CCFFF.2060506@windriver.com>
MIME-Version: 1.0
In-Reply-To: <519CCFFF.2060506@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [OE-core] OE TSC Minutes 7 May 2013
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
X-List-Received-Date: Wed, 22 May 2013 14:49:30 -0000
X-Groupsio-MsgNum: 44838
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mFHiwr52TKrxpkjc"
Content-Disposition: inline

--mFHiwr52TKrxpkjc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 22, 2013 at 09:02:39AM -0500, Mark Hatle wrote:
> (Background) When the spacing was decided, looking at the existing OE rec=
ipes=20
> and classes, the majority of things were indented such that python used t=
abs,=20
> and recipe (shell scripting) used spaces.  During the cleanup of the scri=
pting=20
> sections it was decided that the least impact to all was desirable.  Thus=
 the=20
> python-tab, shell-spaces convention.

"python used tabs, and recipe (shell scripting) used spaces"
"python-tab, shell-spaces convention"=20

=2E..=20

you have it WRONG

> It's true that shell scripts don't really care about indenting, so the fo=
ur=20
> spaces is just a convention that was decided on based on that.  The conce=
rn is=20
> that if we go in and change the convention now, it's going to cause a lot=
 of=20
> potential disruption.
>=20
> So the answer isn't that it's a technical reason, it's a community reason=
=2E=20
> Don't rock the boat on something that is just going to annoy people and p=
rovide=20
> no actual help.  So far I haven't seen a compelling argument to change th=
e=20
> convention BTW, other then (paraphrase) "I don't like spaces, and want to=
 use=20
> tabs".  (Note, when I write shell scripts, I prefer tabs as well..)

layers in meta-oe repo were using tabs in less shell tasks then some
amount of spaces.

Using combination of tabs and spaces in the same file (and even on the
same lines) is quite bad, because it looks different based on tab length
and can show wrong indentation in case like 8 spaces and 2
4-character-wide tabs on next line (where author was seeing 18 spaces on
2nd line)

It was acked by 2 TSC members:
Koen: http://lists.openembedded.org/pipermail/openembedded-devel/2013-April=
/090162.html
Khem: http://lists.openembedded.org/pipermail/openembedded-devel/2013-April=
/090203.html

3rd member of TSC and maintainer of some meta-oe layers, was aware of this =
change=20
and wasn't complaining:
Paul: http://lists.openembedded.org/pipermail/openembedded-devel/2013-April=
/090184.html

Joe who also maintains layer in meta-oe repo agreed that it's good idea:
http://lists.openembedded.org/pipermail/openembedded-devel/2013-April/09018=
1.html

Otavio also contributes a lot and agreed with that change:
http://lists.openembedded.org/pipermail/openembedded-devel/2013-April/09014=
6.html

Andreas is sending also lot of patches and formally supported that
change now.

You on other hand don't even follow meta-networking/MAINTAINERS file
when sending patches...

When this was discussed about a year ago in TSC, the most important
reason was complicating backports, you can read something about it my RFC:
http://lists.openembedded.org/pipermail/openembedded-devel/2013-April/09013=
5.html
Now close to creating dylan branch for meta-openembedded is imho best
time to do this, not many changes from released dylan will be backported
to danny, because people will start moving to newer release instead of
backporting more and more stuff to old one (also resolving possible
whitespace merge conflict it not hard). Causing conflicts for merge was
IIRC most important reason why my proposal was rejected for oe-core.

Original proposal here
http://lists.linuxtogo.org/pipermail/openembedded-core/2012-July/026176.html
was also supported by
Chris http://lists.linuxtogo.org/pipermail/openembedded-core/2012-July/0262=
01.html

Since the change I had to manually update only 6-10 patches submitted for
meta-oe and backporting patches from dylan to danny or denzil is not
influenced by this change.

And TSC minutes which discussed it say:
Reluctant conclusion: tabs for shell, 4 spaces for python.

So please stop trying to show it as action of one maintainer who
decided to go against TSC decision and to scr3w everybody.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--mFHiwr52TKrxpkjc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlGc2vUACgkQN1Ujt2V2gBxJNQCgpAjhQWhuP42DeqJMJciWXQNL
sJUAoIFWGkfEE5c2YSvT22kB/PdZWSDx
=sGGQ
-----END PGP SIGNATURE-----

--mFHiwr52TKrxpkjc--
