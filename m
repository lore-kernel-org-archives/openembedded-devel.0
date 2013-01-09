Received: from mail-pb0-f42.google.com ([209.85.160.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tswiz-0002Gk-QQ
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Jan 2013 15:33:55 +0100
Received: by mail-pb0-f42.google.com with SMTP id rp2so983812pbb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Jan 2013 06:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=t2yr9On2rpdyWLCdcWx3gJyfzxD9j+X3ri6XS3IVzK8=;
	b=dMd0hrEHjomWDSKuES1XERhgikeScQbQ8O+zy95L2s4AGBA5pikOCmL5mp8+Jv4SbF
	PBpt52Z0qC8AkFZLmVWF4IiE6vWaMZo3HedpNMlGO5N4eApFzJOm/tkGhSWi/VAF/gEU
	UyaczCNwmSKdp6juryU1HFqGhpo4O257uMSc9SRyn5KWCqzo0LRn3H2Hndnb2A+4qwa1
	INJbIc/hljDnN9WsuoKWtJmwOKm7ADcfDEw2ozIe38iZtxGS8Et2izClCYpIEACZH7Ra
	kmth282I4QkP/bptGduANRrex8lp1Be4xctKNHwFf90Qc+ID9yWroeUb7QY6+uas4U5I
	Y7Pg==
X-Received: by 10.66.85.101 with SMTP id g5mr189942809paz.17.1357741117042;
	Wed, 09 Jan 2013 06:18:37 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id k4sm42893117paz.26.2013.01.09.06.18.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 Jan 2013 06:18:36 -0800 (PST)
Date: Wed, 9 Jan 2013 15:18:40 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Andreas =?iso-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Message-ID: <20130109141840.GL3722@jama.palm1.palmone.com>
References: <CALbNGRR9-R-fzEozx+380_rtG-D7OAv45+CM70hb_eRnTa_5wA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRR9-R-fzEozx+380_rtG-D7OAv45+CM70hb_eRnTa_5wA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Patchwork issues
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
X-List-Received-Date: Wed, 09 Jan 2013 14:33:56 -0000
X-Groupsio-MsgNum: 42595
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lHuqAdgBYNjQz/wy"
Content-Disposition: inline

--lHuqAdgBYNjQz/wy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 09, 2013 at 02:32:05AM +0100, Andreas M=FCller wrote:
> Hi
>=20
> * seems that [1-2] did not make it into patchwork. Is patchwork down?
> * 40743 & 40741 can be marked as superseded/rejected/whatever. The fix
> was committed in [3].
>=20
> [1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2013-January/=
043418.html
> [2] http://lists.linuxtogo.org/pipermail/openembedded-devel/2013-January/=
043419.html
> [3] http://cgit.openembedded.org/meta-openembedded/commit/?id=3D7478b9059=
39713f264b6ffa7962f0723d4d730d3
>=20
> Andreas

Yes PW definitely has some issues.

http://patches.openembedded.org/bundle/jama/in-test/ now fails too with:
TemplateSyntaxError at /bundle/jama/in-test/
Caught NoReverseMatch while rendering: Reverse for 'patchwork.views.bundle.=
public_mbox' with arguments '()' and keyword arguments '{'username': u'jama=
', 'bundlename': u'in-test'}' not found.

I'll try to apply patches missed by PW manually, but it would help a lot if
everybody sends their pull request together with URL and branch where it is
(like create-pull-request script does).

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--lHuqAdgBYNjQz/wy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDtfEAACgkQN1Ujt2V2gBx3rQCeP5ytSUzuNhBD1L3tuxpchTdU
bikAn0/g1PVw3JaLsjhbA27vcXd7N75Q
=ToDo
-----END PGP SIGNATURE-----

--lHuqAdgBYNjQz/wy--
