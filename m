Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 61D39605FE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2016 17:05:42 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id l68so5024649wml.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2016 09:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=RiI1L3lSdVC4YKzdZ1KILYl6LSLLtWN26A/GibLnsUw=;
	b=MtPFRZ9to9eIY+NptCPC4jcnzm6TW9UqnG3u/h9IuLq55CdM15XysTcWI/jojNfR4l
	FZv5vaxJh9/F/+tdg7P7J/YIWIPbsCcIrQ27bJuyBNDMiOVnWwOL7lqKl1U2sKJr6jxV
	zcd2tf8oeZpnxh4WVcQz8aCQCibIKjbZi+8piUbr7mec/4drvKQvaLnjejhF6f8zuUqd
	sMBOmea8wI5o+Z7APwAy5t/ngsfHXgAYkuDd5p2ONcKX+7PPLUsiWIHozLUCEemJtqHk
	kUge42RVUaKnESgUyrBhdOl5H18nTabLS1Uyd3ZCujLcFWUPdNP5UXQIG3oH9yC2HMXO
	ZvdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=RiI1L3lSdVC4YKzdZ1KILYl6LSLLtWN26A/GibLnsUw=;
	b=JNE02M82VnrJ1cPRzdXjXRUz1EudJC93hShBOypzl57JpSYTjp7+HQ/Y8X2mvN1P3y
	Mw/j2W2kP3Z2gzJ0YdYIWZpYR1/cRmGSpBysMHvlnZDqPDCMtLAFx5mIQVO2RScFAwYI
	RKMXZcrCeG1zIGrh9iNaRMwDurhQB0NFAHSoRl34q3HaYYt/MJ8BDdWZEGM1hSZDOKPB
	d/v7eEOQVF6Pe2TVCJZGDFEujsNID6r0acX8++BAAXMprMsqZ8awHYO/PC0OjDhlm9UP
	4hAXplLvG6+9TX4gUu28+cPorEUdqMKpnLTsUfShqx/tLYa+griTbtffFZiige0y96pG
	M64g==
X-Gm-Message-State: AD7BkJJ11GfQzttSXctUWUqd6qno5FFapeh1Z9W7igWSLKXr8qfQM3R+ViZCkLoi5Y/emQ==
X-Received: by 10.194.63.75 with SMTP id e11mr5027151wjs.79.1457629542599;
	Thu, 10 Mar 2016 09:05:42 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	hu1sm4407842wjb.36.2016.03.10.09.05.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Mar 2016 09:05:41 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 10 Mar 2016 18:08:41 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160310170841.GN2573@jama>
References: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
	<41b4e4a82cb652470eebe853bd1b6076cee59301.1457535831.git.alexander.kanavin@linux.intel.com>
	<20160310142507.GI2573@jama>
	<CAJTo0LbHXD_C+Nm6bjV=xc6MRtMJ=Ry=_Q4YG-ihyWiWHaQ5UA@mail.gmail.com>
	<20160310161330.GJ2573@jama>
	<CAJTo0LZnsegS80eeExf27=DDytCotMRuYe8ryU7EWfEfWUOr-g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZnsegS80eeExf27=DDytCotMRuYe8ryU7EWfEfWUOr-g@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH 14/38] python-gst: remove the 0.10 recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Mar 2016 17:05:43 -0000
X-Groupsio-MsgNum: 60477
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2+jOUFLb7N+7fooZ"
Content-Disposition: inline

--2+jOUFLb7N+7fooZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 10, 2016 at 04:51:45PM +0000, Burton, Ross wrote:
> On 10 March 2016 at 16:13, Martin Jansa <martin.jansa@gmail.com> wrote:
>=20
> > I still build images for om-gta04
> > http://projects.goldelico.com/p/gta04-main/
> > from time to time, but don't use them in real life anymore (not sure how
> > many other people do) - the same with om-gta02, nokia900. Other
> > meta-smartphone BSPs are used more actively in LuneOS, so no nukes on
> > my meta-smartphone please.
> >
>=20
> Presumably Lune uses the BSP but not the software?

LuneOS doesn't use frameworkd (which lives in meta-fso), but you wanted
to nuke meta-smartphone which contains 16 different layers.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--2+jOUFLb7N+7fooZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbhqhgACgkQN1Ujt2V2gBygtACfWeOULaJhf6rSZnkRh3O4UiHc
RsQAmwZoxa1hQwVrf2ppWoWphV+8Uqk0
=U4mM
-----END PGP SIGNATURE-----

--2+jOUFLb7N+7fooZ--
