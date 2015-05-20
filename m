Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id C8CE3601E0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 May 2015 13:24:13 +0000 (UTC)
Received: by wizk4 with SMTP id k4so155104516wiz.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 May 2015 06:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=I10Cs+zJ65mNwXiYJlJrhk9lSrHvC1bbV6arfOHqYFM=;
	b=Nok6brlUDakgJKhvPtvvkq6a5CqOcBTJ8FqH+fl8UvZceiUs+5o+4FfL4n4K/1EN6l
	3SZCDhR7OMKsv/bMfUnhhyvTK5fwLmw+CrQWMyA9p6JNBH6SxjhopVV8+wUB3WGSqeWU
	pHo3Baqa7QRWfSY1i/nkWFRHxU3vultx6SWcqbssh3d/isTdOAvDPiijMB3uOqQnm34x
	JvX7vRu6hsBOB8NQj60UamRkcfBDMtWoaBLK44LfRwMkhpt83NhW99kTjdthUhUgruTS
	TNU3hyeORksJwFTiobaR8TrC3D2uLFxZNqh0O/ZI70S0K0rASvazx7mCk0WxkMKNL2gy
	5f4Q==
X-Received: by 10.194.133.73 with SMTP id pa9mr44088067wjb.148.1432128254555; 
	Wed, 20 May 2015 06:24:14 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id f8sm3488595wiy.7.2015.05.20.06.24.13
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 May 2015 06:24:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 20 May 2015 15:24:24 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150520132424.GB2386@jama>
References: <1429646102-11227-1-git-send-email-josep.puigdemont@enea.com>
	<20150520130041.GA9161@iapetus.enea.se>
MIME-Version: 1.0
In-Reply-To: <20150520130041.GA9161@iapetus.enea.se>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-python][PATCH] psutil: update to newer version (2.2.1)
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
X-List-Received-Date: Wed, 20 May 2015 13:24:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2015 at 03:00:41PM +0200, Josep Puigdemont wrote:
> kind reminder

Can you please resend, this wasn't picked by patchwork.

>=20
> On Tue, Apr 21, 2015 at 09:55:02PM +0200, Josep Puigdemont wrote:
> > Convert to pypi recipe.
> > Account for dependency on python-subprocess.
> >=20
> > Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
> > ---
> >  meta-python/recipes-devtools/python/python-psutil_0.6.1.bb | 14 ------=
--------
> >  meta-python/recipes-devtools/python/python-psutil_2.2.1.bb | 12 ++++++=
++++++
> >  2 files changed, 12 insertions(+), 14 deletions(-)
> >  delete mode 100644 meta-python/recipes-devtools/python/python-psutil_0=
=2E6.1.bb
> >  create mode 100644 meta-python/recipes-devtools/python/python-psutil_2=
=2E2.1.bb
> >=20
> > diff --git a/meta-python/recipes-devtools/python/python-psutil_0.6.1.bb=
 b/meta-python/recipes-devtools/python/python-psutil_0.6.1.bb
> > deleted file mode 100644
> > index ff113d0..0000000
> > --- a/meta-python/recipes-devtools/python/python-psutil_0.6.1.bb
> > +++ /dev/null
> > @@ -1,14 +0,0 @@
> > -SUMMARY =3D "A cross-platform process and system utilities module for =
Python"
> > -SECTION =3D "devel/python"
> > -HOMEPAGE =3D "http://code.google.com/p/psutil"
> > -LICENSE =3D "BSD"
> > -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0f02e99f7f3c9a7fe8ecfc5d44c=
2be62"
> > -
> > -SRC_URI =3D "http://psutil.googlecode.com/files/psutil-${PV}.tar.gz"
> > -SRC_URI[md5sum] =3D "3cfcbfb8525f6e4c70110e44a85e907e"
> > -SRC_URI[sha256sum] =3D "d665a4cc58c9a5d207fb0dc9869fc0ee10f4f66ad885e8=
4886ef6339ccce0a6f"
> > -
> > -S =3D "${WORKDIR}/psutil-${PV}"
> > -
> > -inherit setuptools
> > -
> > diff --git a/meta-python/recipes-devtools/python/python-psutil_2.2.1.bb=
 b/meta-python/recipes-devtools/python/python-psutil_2.2.1.bb
> > new file mode 100644
> > index 0000000..326d668
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python-psutil_2.2.1.bb
> > @@ -0,0 +1,12 @@
> > +SUMMARY =3D "A cross-platform process and system utilities module for =
Python"
> > +LICENSE =3D "BSD"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0f02e99f7f3c9a7fe8ecfc5d44c=
2be62"
> > +
> > +SRC_URI[md5sum] =3D "1a2b58cd9e3a53528bb6148f0c4d5244"
> > +SRC_URI[sha256sum] =3D "a0e9b96f1946975064724e242ac159f3260db24ffa591c=
3da0a355361a3a337f"
> > +
> > +RDEPENDS_${PN} +=3D " \
> > +    python-subprocess \
> > +    "
> > +
> > +inherit pypi
> > --=20
> > 2.1.0
> >=20
> > --=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

