Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 737E470E51
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Aug 2014 13:47:53 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id ho1so5312043wib.16
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Aug 2014 06:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=pPLn8jdXqvnVSE5h2FwzheCfVMHtASBOJBqFVteH9xQ=;
	b=KN2b8mV78N6qFc/Z8kK3dprXDEEvWM0OOnqH2sKkymN1hiiM0HEIGl/iDBb5av+5DZ
	qlfX6zBb/nUXYMllQkpyWLs4ThX17k5wTokbfOFqopfLwLriiAFPFGmX83pxJiCbB8nn
	HWmk4Gpu5p44vnOqnlI2nFOyLS8iNo+J3MgEasLQQyqbnaqBy4dAh8jtdUhDV6Csqdjr
	CXcGxOwKW0qwCOLYQ0ixV8tGUdqQyo3HLCqv21mBgdWCy42TvLM90G4tucJbWhD3rRLr
	/fSToO+ry3WPU4dJI1Cc+oRtRIb3yt1ZSOtDgl93k+qI6bjViMCThiZEOytEbpjORzL3
	LOJw==
X-Received: by 10.194.203.73 with SMTP id ko9mr17407074wjc.101.1408456073113; 
	Tue, 19 Aug 2014 06:47:53 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ex2sm50590267wjd.30.2014.08.19.06.47.52 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Aug 2014 06:47:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 19 Aug 2014 15:47:52 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140819134752.GU3660@jama>
References: <1408431709-5955-1-git-send-email-b40869@freescale.com>
	<1488715.AFk0jdnqDO@peggleto-mobl5.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <1488715.AFk0jdnqDO@peggleto-mobl5.ger.corp.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: YangHaibo <b40869@freescale.com>
Subject: Re: [meta-oe][meta-webserver][PATCH] move fcgi-2.4.0 recipe and patch to correct folder
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
X-List-Received-Date: Tue, 19 Aug 2014 13:47:53 -0000
X-Groupsio-MsgNum: 51779
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zvmqw4jX2vbPsMQB"
Content-Disposition: inline

--zvmqw4jX2vbPsMQB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 19, 2014 at 01:53:28PM +0100, Paul Eggleton wrote:
> On Tuesday 19 August 2014 15:01:49 YangHaibo wrote:
> > ---
> >  meta-webserver/recipes-support/{ =3D> fcgi}/fcgi_2.4.0.bb             =
      |
>=20
> FYI, I moved this recipe to recipes-support deliberately. We shouldn't ne=
ed to=20
> put it in a recipes-fcgi directory unless you expect to be adding a numbe=
r of=20
> other recipes that would fall into the same category - is that the case?

It seems that you've removed one directory level, when moving it, so it was=
n't included
in BBFILES mask

BBFILES +=3D "${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/recipes-*/*/*.bbappe=
nd"

So this patch is needed and queued in master-next.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--zvmqw4jX2vbPsMQB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPzVYgACgkQN1Ujt2V2gByyXACfY58VItML932d9sOqK6Jw7YuA
Ea0An2II9JUbh1DCHja1jdRh0TKQdLGB
=FFvh
-----END PGP SIGNATURE-----

--zvmqw4jX2vbPsMQB--
