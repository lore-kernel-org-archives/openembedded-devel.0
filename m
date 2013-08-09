Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f169.google.com (mail-ea0-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 2C7096B4F7
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Aug 2013 11:49:51 +0000 (UTC)
Received: by mail-ea0-f169.google.com with SMTP id z7so1983884eaf.14
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Aug 2013 04:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=rHbiYxgeBbDokCGh04snYt/TC5pDM9v2YCL+gzF/98A=;
	b=Q9geMX+/DKdQ0VQngFV0KMcCM8ZFDtwDxVyFtXTKpz0YiXvsphwWtx+rYipza14e6o
	xwg+9uyw4SLOat4OjVIPL3o7YOXpIxN67i+izP/IbaTSbmef/LNCh7kZdFlH1tPR4oFH
	LcBNe+CiEl42hrAMetHCxzrNgaQpQsyXLLo52du9jaJy6BQMiGNvZX+lijOpKHCnwr/v
	fGfK/9U5Jx13klgmr+Lnavqc2WQV3KPk2uRpmOuYVV3ndd4+PP9lSp+4o6jvLPexMpn6
	Gz+yfq9QxLIXojJOZW7TJ9Cqszm3rPni2681Dr4hxlj4vnTWy9wgYXladkeX4tXV+IIW
	qxOg==
X-Received: by 10.14.204.194 with SMTP id h42mr416943eeo.47.1376048991266;
	Fri, 09 Aug 2013 04:49:51 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	d8sm14821894eeh.8.2013.08.09.04.49.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 09 Aug 2013 04:49:50 -0700 (PDT)
Date: Fri, 9 Aug 2013 13:50:37 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130809115037.GF17945@jama>
References: <1376038471-32202-1-git-send-email-Martin.Jansa@gmail.com>
	<1376038471-32202-5-git-send-email-Martin.Jansa@gmail.com>
	<CAJTo0LZg4jsH2HT2joWUXcK=8Ao3xBSGKifRt0w4CMC78fLofA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZg4jsH2HT2joWUXcK=8Ao3xBSGKifRt0w4CMC78fLofA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 05/12] libwnck(3): add PACKAGECONFIG for startup-notification
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
X-List-Received-Date: Fri, 09 Aug 2013 11:49:51 -0000
X-Groupsio-MsgNum: 45624
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UBnjLfzoMQYIXCvq"
Content-Disposition: inline

--UBnjLfzoMQYIXCvq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 09, 2013 at 10:18:41AM +0100, Burton, Ross wrote:
> On 9 August 2013 09:54, Martin Jansa <martin.jansa@gmail.com> wrote:
> > * it's autodetected from sysroot and couple of packages are failing
> >   when pkg-config is trying to use libwnck*.pc without
> >   startup-notification in sysroot
>=20
> Why not enable this by default?  People who have no need for
> startup-notification can disable it, but this could be surprisingly
> hard to debug if someone tries building e.g. GNOME and wonders why
> they don't have any startup notification hints.

I don't have any preference, I was just interested in making it
explicit. I'll change it to enabled by default in branch.

Thanks

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--UBnjLfzoMQYIXCvq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlIE140ACgkQN1Ujt2V2gBxHuQCfXVVEWfthot85srfOJMmZBD55
cigAn3EUDHrWQEBlyGpRHI/nVMq91ru/
=rhVQ
-----END PGP SIGNATURE-----

--UBnjLfzoMQYIXCvq--
