Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id AEA646FC4F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Aug 2014 21:09:29 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id hi2so238136wib.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Aug 2014 14:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=wFRJla9uvgtA4/hGLREQSZHohrVAgYet8FSxXYJDqDM=;
	b=z3BmT+j2bXxj327Gx1VXVvR86LI4XgjQfhK2tuzbFi7TZ2nUG44fQygO5poChS8Yig
	9J+g+ypQGvkk8TManluBVwWgKLI00U7TLovUzRHRALuEYUelKsK4VA9vYfLFwr5k/zKe
	iEWP8LiuEk4xEl0MN5NfmjtpMDytn1z+RS0y6I8Z66lSfLwTrYIvwf5xU+PKk/Ek0AtH
	Hyg4eMIej+RVnQXSoBRqGCL/g3f+aiqPhASpNgka5T3uJ162ujlkXrRGTDQYqijGW4IL
	S+xCOR+dOqGOjUiqSBdCl0F3sj5fQhJnGC9hZLSqQiw6WP4Q+tpn0oVxXzybPOZy7IOD
	XCpA==
X-Received: by 10.180.85.136 with SMTP id h8mr721610wiz.67.1408741770234;
	Fri, 22 Aug 2014 14:09:30 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ft7sm1860862wib.9.2014.08.22.14.09.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Aug 2014 14:09:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 22 Aug 2014 23:09:34 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140822210934.GE20524@jama>
References: <1408448964-11764-1-git-send-email-yasir_khan@mentor.com>
	<20140819120740.GR3660@jama>
	<CABcZANn26XQ2GP7V_=vyT3jH7mLTC8c688uwvpjW9=LCGKRVZw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABcZANn26XQ2GP7V_=vyT3jH7mLTC8c688uwvpjW9=LCGKRVZw@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] lmbench: if a machine config file exists, install it
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
X-List-Received-Date: Fri, 22 Aug 2014 21:09:38 -0000
X-Groupsio-MsgNum: 51824
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="B0nZA57HJSoPbsHY"
Content-Disposition: inline

--B0nZA57HJSoPbsHY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 22, 2014 at 01:16:03PM -0700, Christopher Larson wrote:
> On Tue, Aug 19, 2014 at 5:07 AM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
>=20
> > On Tue, Aug 19, 2014 at 04:49:24PM +0500, Yasir-Khan wrote:
> > > Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> > > Signed-off-by: Yasir-Khan <yasir_khan@mentor.com>
> > > ---
> > >  .../recipes-benchmark/lmbench/lmbench_3.0-a9.bb    |    7 +++++++
> > >  1 file changed, 7 insertions(+)
> > >
> > > diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
> > b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
> > > index 41db150..a3873a6 100644
> > > --- a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
> > > +++ b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
> > > @@ -60,6 +60,13 @@ do_install () {
> > >             ${D}${bindir}/lmbench-run
> > >      install -m 0755 ${S}/scripts/lmbench ${D}${bindir}
> > >      install -m 0755 ${S}/scripts/* ${D}${datadir}/lmbench/scripts
> > > +
> > > +    # If the machine installs a config file, install it to the
> > appropriate place
> > > +    if [ -f ${WORKDIR}/CONFIG.${MACHINE} ]; then
> > > +        install -D 0644 ${WORKDIR}/CONFIG.${MACHINE} \
> > > +                        ${D}/${datadir}/lmbench
> > /bin/${TARGET_PREFIX}/CONFIG.${MACHINE}
> > > +    fi
> >
> > that makes lmbench MACHINE_ARCH and PACKAGE_ARCH isn't set that way.
>=20
>=20
>=20
> Any objection to creating an lmbench-config package, either in lmbench or
> in its own recipe, making that machine specific, and rrecommending it from
> lmbench? IIRC that's how we usually handle such things (e.g. alsa-state
> pulls in alsa-states which is usually empty, but which bsps can append to
> pull in the machine specific configuration).

I'm fine with separate recipe, rdepended from main one and excluded with
SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--B0nZA57HJSoPbsHY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlP3sY4ACgkQN1Ujt2V2gBxDmQCfVhF13HhvlibEsnT3P2eMtvJa
HSAAoIC3xlXFo2pQjG7kgdyZL1phCQmV
=bSK4
-----END PGP SIGNATURE-----

--B0nZA57HJSoPbsHY--
