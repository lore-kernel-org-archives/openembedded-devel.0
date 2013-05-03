Received: from mail-ee0-f44.google.com ([74.125.83.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UYEXj-0002kA-8V
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 May 2013 13:52:54 +0200
Received: by mail-ee0-f44.google.com with SMTP id t10so709736eei.17
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 May 2013 04:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=9GgPtUZ2CCpEqW0WT8Lp0nMQ1UREkLtPdhwEeEo0cfc=;
	b=rk8n84M9yOxtI8nPDdX39/2NHv5VFemiN/EAkp6vorygL3fdzxPVzp/6HOmfskwfUz
	hA+HJzTaazeLfIC26qA/zZKKqxF8QEahEssaHtQLY/kwlcTgWr2HI+hH3bx70uN3uixK
	V8NPKrj4HgRMceNErr5o8Kvr4B582oMP4EuqlBMfbiyv8PVMCt1yrkYzCpERkYKYlQBx
	voAzCRg0jbFGR4Y4B9FvLKGN9mCPf7y763gG4xG1jKpxRSWpQcNbVluy6vSFVMZ37Yze
	7PMsgHvP+vlKnfUBHyso6F/Rqo3AtCkeZATSK0r1l/4RfXFnLBjVZlNQdotQwSyp6uCD
	F3EA==
X-Received: by 10.14.115.131 with SMTP id e3mr30113637eeh.43.1367580896477;
	Fri, 03 May 2013 04:34:56 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	k43sm15374413een.2.2013.05.03.04.34.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 03 May 2013 04:34:55 -0700 (PDT)
Date: Fri, 3 May 2013 13:35:22 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130503113522.GA3187@jama>
References: <1367087640-4264-1-git-send-email-schnitzeltony@googlemail.com>
	<1367087640-4264-2-git-send-email-schnitzeltony@googlemail.com>
	<20130427193111.GF3199@jama>
	<CALbNGRSZ-H-+0yZuf4uvYbLEqXdUzTuMLXMhc63BtrZPieYyLA@mail.gmail.com>
	<CALbNGRQ63OrcZY9i-qvc0ERzGTsnTMiY101dAgr7keNBVDrpWQ@mail.gmail.com>
	<CALbNGRSXsNgFksmktPkCq85O6dN+2R-RbZDk_R0CcqgxF8ytbw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRSXsNgFksmktPkCq85O6dN+2R-RbZDk_R0CcqgxF8ytbw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-gnome/meta-xfce 1/4] gdm: fix postinst-code to unbreak first boot issues
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
X-List-Received-Date: Fri, 03 May 2013 11:52:54 -0000
X-Groupsio-MsgNum: 44567
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bp/iNruPH9dso1Pn"
Content-Disposition: inline

--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 02, 2013 at 04:58:13PM +0200, Andreas M=FCller wrote:
> On Thu, May 2, 2013 at 4:48 PM, Andreas M=FCller
> <schnitzeltony@googlemail.com> wrote:
> > On Mon, Apr 29, 2013 at 9:33 AM, Andreas M=FCller
> > <schnitzeltony@googlemail.com> wrote:
> >> On Sat, Apr 27, 2013 at 9:31 PM, Martin Jansa <martin.jansa@gmail.com>=
 wrote:
> >>> On Sat, Apr 27, 2013 at 08:33:57PM +0200, Andreas M=FCller wrote:
> >>>> Exiting postinst code leaves systemd.bbclass offline postinst code u=
nexecuted,
> >>>> causes postinst not to finish at first boot (gdm.service is not alia=
sed to
> >>>> display-manager.service -> started much too early) and is not necces=
ary:
> >>>> language preparation can be done offline.
> > Just learned that the chown code does not belong to do_install. Shall
> > I send a V2 or a follow up?
> I was too fast - it still discussed [1]

Do you want me to apply these 4 and then add better fix in follow-up if
needed? From that discussion it looks like you did all what you could in=20
gdm :).

> [1] http://lists.linuxtogo.org/pipermail/openembedded-core/2013-May/03911=
1.html
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--bp/iNruPH9dso1Pn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlGDoPoACgkQN1Ujt2V2gByJsgCgth0bWnX58i83LID18cyxinsC
9ngAoILXsC+UoCv+ObjqVf9u02jp/3iL
=xaNU
-----END PGP SIGNATURE-----

--bp/iNruPH9dso1Pn--
