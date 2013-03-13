Received: from mail-gg0-f176.google.com ([209.85.161.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UFoxB-0007vd-2F
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Mar 2013 17:55:02 +0100
Received: by mail-gg0-f176.google.com with SMTP id q6so201123ggc.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Mar 2013 09:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=LqV9+yY8Bp8hwi43ml5yx5u5xAAOV7wr0YurLufZ2oo=;
	b=uoDGKHauMalWvvn5OpRsab8km3dW3ABdWquGLNVxFTOEj49JBItItmuUdy/+Bkhk3K
	pJtLe4rbZ+I7CDtU0kDMqZ0n0by9O35PWhrRTyzgzWBPP/Zxxm05R5bRY5VGIM6e1jWh
	9o0yWY74lkvjToSYfUeZxgo+L2de4umSPk7VT5QOn0wi5gxfbjDj798CQ8QjgseAU9Ek
	cbxXJmlrYSrGdjhOqLL/I6L0RxI2Ez6trnI9hXCKqGHOz+TZlIcpB1jPh7TK6X7T33AS
	MFOdHHdgPZrBuLrObSMa2alP8bTxTolG57GGhW4X6Yhu0F9NeKxX21hIC+5byTRQQnIU
	jexw==
X-Received: by 10.236.152.5 with SMTP id c5mr12411776yhk.22.1363192699825;
	Wed, 13 Mar 2013 09:38:19 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id w2sm36313201yhh.7.2013.03.13.09.38.17
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 13 Mar 2013 09:38:18 -0700 (PDT)
Date: Wed, 13 Mar 2013 17:38:11 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130313163811.GV3260@jama>
References: <1362521704-25965-1-git-send-email-Martin.Jansa@gmail.com>
	<CALbNGRT+RDine-AZQx+K8oaf25mncrHvvbYq5FMNS7TnXQU0Pw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRT+RDine-AZQx+K8oaf25mncrHvvbYq5FMNS7TnXQU0Pw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCHv2] poppler: upgrade to 0.18.4
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
X-List-Received-Date: Wed, 13 Mar 2013 16:55:06 -0000
X-Groupsio-MsgNum: 43535
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TPGKQYD3WP7vMswh"
Content-Disposition: inline

--TPGKQYD3WP7vMswh
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 08, 2013 at 12:25:04PM +0100, Andreas M=FCller wrote:
> On Tue, Mar 5, 2013 at 11:15 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > * 0.18.0 was failing to build after libpng was upgraded to 1.6 in oe-co=
re
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta-oe/recipes-support/poppler/poppler_0.18.0.bb | 12 ------------
> >  meta-oe/recipes-support/poppler/poppler_0.18.4.bb | 10 ++++++++++
> >  2 files changed, 10 insertions(+), 12 deletions(-)
> >  delete mode 100644 meta-oe/recipes-support/poppler/poppler_0.18.0.bb
> >  create mode 100644 meta-oe/recipes-support/poppler/poppler_0.18.4.bb
> >
> Maybe it is a temporary problem but I get
>=20
> ERROR: Fetcher failure: Fetch command failed with exit code 4, no output
> ERROR: Function failed: Fetcher failure for URL:
> 'http://poppler.freedesktop.org/poppler-0.18.4.tar.gz'. Unable to
> fetch URL from any source.
> ERROR: Logfile of failure stored in:
> /home/Superandy/tmp/oe-core-eglibc/work/armv7a-vfp-neon-angstrom-linux-gn=
ueabi/poppler/0.18.4-r0/temp/log.do_fetch.20883
> ERROR: Task 4 (/home/Superandy/data/oe-core/sources/meta-openembedded/met=
a-oe/recipes-support/poppler/poppler_0.18.4.bb,
> do_fetch) failed with exit code '1'

It still downloads here, so I assume it was really temporary, applied
now (because old was failing anyway).

>=20
> Andreas
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--TPGKQYD3WP7vMswh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFAq3MACgkQN1Ujt2V2gBzLsACeKfdhzk9flswQ0OmG0q49mhu+
FJQAn3xHHENW5A7qv1fNdpgrQNxtwM89
=272f
-----END PGP SIGNATURE-----

--TPGKQYD3WP7vMswh--
