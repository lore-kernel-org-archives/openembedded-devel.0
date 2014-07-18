Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 9DD7662252
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jul 2014 18:27:29 +0000 (UTC)
Received: by mail-wg0-f41.google.com with SMTP id z12so3891284wgg.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jul 2014 11:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=QvCUR56ggqWJsTKSVGbeyCTTLx5/bGRntRFd5/oIl4M=;
	b=nrbYJS9sNN2/jCIlsUueEpYoJMog6zrq4UkvbyhiW++8MdVDR8n0DB00qJuP12boqQ
	AzvBl95E+Fu2TJfrPPHn302PE40bN5xfzvWb5aJCQxCOfwBXk3KQ1gLHvqLOHALt3VKN
	klxb160WNHldkAHoCWkVNdTr3VfqWoPL+ZZ6WDY1mg/0F2ZP54QY3/Xk591Xd0Xqasfe
	fCcPHpI9eNpVt/HAs+Zq0LoMYRb7HOHzGZF+zAx0lgpqsAihqrQ061PntBJwhYbT3Khp
	3VGCvfBmnsVM2GRrJa5EQoz9x94qDBNseZ4HoSXqDsn0cs8N+vQXXFcHdKspwUAE9vhA
	g6LQ==
X-Received: by 10.194.75.164 with SMTP id d4mr9432134wjw.35.1405708050864;
	Fri, 18 Jul 2014 11:27:30 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	h3sm15969410wjz.48.2014.07.18.11.27.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Jul 2014 11:27:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 18 Jul 2014 20:27:42 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140718182742.GR2433@jama>
References: <1405147077-22498-1-git-send-email-eduardo@monkey.io>
	<20140718181535.GQ2433@jama>
	<CAEaCVQj60r8pmT4RwLWZ3RO5NvkKzbQPHbkdhOqhoX3zbO2mRw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEaCVQj60r8pmT4RwLWZ3RO5NvkKzbQPHbkdhOqhoX3zbO2mRw@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-webserver][PATCHv4] monkey: new v1.5.1 release.
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
X-List-Received-Date: Fri, 18 Jul 2014 18:27:32 -0000
X-Groupsio-MsgNum: 51094
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="O8eriMP7xBFo56UV"
Content-Disposition: inline

--O8eriMP7xBFo56UV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 18, 2014 at 12:19:29PM -0600, Eduardo Silva wrote:
> >
> > Now it failed with:
> >
> > | NOTE: Not creating empty archive for monkey-locale-1.5.1-r0.2
> > | *** Error: CONTROL/conffiles mentions conffile /etc/monkey/ which does
> > not exist
> > |
> > | opkg-build: Please fix the above errors and try again.
> >
> > I guess it's because sysvinit script was removed by update-rc.d.bbclass=
 and
> > then nothing was left in /etc/monkey
> >
> >
> thanks for the report. Which specific build options did you use (and imag=
e)
> ?, i would like to be able to reproduce that problem locally, not sure why
> my tests passed.

world builds as described on
http://www.openembedded.org/wiki/Bitbake_World_Status

probably the most important difference is:
# use systemd
DISTRO_FEATURES_append =3D " systemd"
DISTRO_FEATURES_BACKFILL_CONSIDERED =3D "sysvinit"
VIRTUAL-RUNTIME_init_manager =3D "systemd"
VIRTUAL-RUNTIME_initscripts =3D ""

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--O8eriMP7xBFo56UV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPJZx4ACgkQN1Ujt2V2gBxgfACfcp1zAofar17Z3KllwZtEt5w7
5jgAoIYTHQUNVJxXfUV1FK4z8MNsLw/l
=SIqf
-----END PGP SIGNATURE-----

--O8eriMP7xBFo56UV--
