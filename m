Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id 5B9B7615B0
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Jan 2014 21:59:25 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id e51so5930823eek.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Jan 2014 13:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=XxafobvnVH3GNpqxUTkpVE4slFXesR+5Hy//u2KlBT8=;
	b=AoVwLZyvu7HLi4eiK3VIYdz4uA/l8jPn4DM1HjuRzUF3VALHjLpFuSniA2IYL7KkOA
	hBXr7q8LB3NKUjl+fj12maX4TBmHpS8N0OOyUSetl8AOADNXJoNqCSeLBiwLXVVlWse1
	O61pJpz93uVEOukRkZw5SowNbmjFX2nC3flArtSa76okU48kT7DU0IELk/hx1m9GKygp
	9TVUjAqCN4T+Fw1IwspaogxCJRO0CsJa1cfA57v5+XOu3/VtN0ui76qD2RIoBliLmWSX
	btJEERivKZk9uImz0C4t0x3iVMmqyUim522vG1rv20jPSOlVxTlN1yANITJuiAySe+r9
	A+VA==
X-Received: by 10.14.173.7 with SMTP id u7mr75493816eel.24.1388786365937;
	Fri, 03 Jan 2014 13:59:25 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	h48sm148412416eev.3.2014.01.03.13.59.24 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 Jan 2014 13:59:25 -0800 (PST)
Date: Fri, 3 Jan 2014 22:59:30 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Message-ID: <20140103215930.GI3707@jama>
References: <1387240261-7045-1-git-send-email-otavio@ossystems.com.br>
	<1387240261-7045-4-git-send-email-otavio@ossystems.com.br>
	<20140101123625.GC11840@jama>
	<CAP9ODKoxN6pb3JvjzY7x8NPmDj2U0jVtsUgYxrgdx7ney5J2cw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKoxN6pb3JvjzY7x8NPmDj2U0jVtsUgYxrgdx7ney5J2cw@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe PATCH v2 4/6] gdal: Add recipe for 1.10.1 version
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
X-List-Received-Date: Fri, 03 Jan 2014 21:59:26 -0000
X-Groupsio-MsgNum: 47584
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UthUFkbMtH2ceUK2"
Content-Disposition: inline

--UthUFkbMtH2ceUK2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 03, 2014 at 04:01:36PM -0200, Otavio Salvador wrote:
> Hello Martin,
>=20
> On Wed, Jan 1, 2014 at 10:36 AM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > On Mon, Dec 16, 2013 at 10:30:59PM -0200, Otavio Salvador wrote:
> >> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> >> ---
> >> Changes in v2: None
> >
> > Please fix following error detected in:
> > http://jenkins.nas-admin.org/job/oe_shr-image-all_tmpfs_qemuarm/173/con=
soleFull
> >
> > ERROR: This autoconf log indicates errors, it looked at host include
> > and/or library paths while determining system capabilities.
> > Rerun configure task after fixing this. The path was
> > '/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe=
-linux-gnueabi/gdal/1.10.1-r0/gdal-1.10.1'
> > ERROR: Function failed: do_qa_configure
> > ERROR: Logfile of failure stored in:
> > /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-=
linux-gnueabi/gdal/1.10.1-r0/temp/log.do_configure.883
> > NOTE: recipe gdal-1.10.1-r0: task do_configure: Failed
> > ERROR: Task 14201
> > (/home/jenkins/oe/shr-core-branches/shr-core/meta-openembedded/meta-oe/=
recipes-navigation/gdal/gdal_1.10.1.bb,
> > do_configure) failed with exit code '1'
>=20
> Can you send me the full log? I failed to identify  what causes it.

It's already gone running another build but next time I see it I'll try
to keep the log.

>=20
> --=20
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--UthUFkbMtH2ceUK2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLHMsIACgkQN1Ujt2V2gBxN4wCfXw9yAvRKTP2+BXVSEJS6QCPe
cx0An3ed3YtR8DnktCiZ+7tJg8TKM/wd
=jOop
-----END PGP SIGNATURE-----

--UthUFkbMtH2ceUK2--
