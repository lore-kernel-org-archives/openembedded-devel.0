Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3CA3A799A4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Sep 2018 07:45:38 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id 63-v6so1288957wra.11
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Sep 2018 00:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=yh3wryyHQCG17qu+hChYS9EMN5/lADkusl07i8dJT+0=;
	b=TswtF+LDrOMajx828l9XCQ2lDmylUTNO7oOzYjyNHUkEuK8GhQExU7nUvsFzi1zvVK
	S8AAlYVpxGncoV1rR7CkZSqybDATn2PPNvZoBq/pXZ8BrDMLbpeNGZdM69doMcbuYeDR
	je7SnJqdbk5YJEAY3env5Ybiu614P0yhL6Hnw7pQCsycPKCwnkznZ02fZ+Jw9c2NbMmF
	VRW27RKzq+Tj9YDXKXKRdasKzbrwyMoHKjn/BdEDxTn3pYl7g3pvhKwT3YpWp1qdgriP
	QZEO6DHjuiq3Zdu0ON9QpvQM/OIbpk7wKI3iVl1nEbRt9JOZxlFtv0NnFQGj5qVI/v2m
	4hng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=yh3wryyHQCG17qu+hChYS9EMN5/lADkusl07i8dJT+0=;
	b=jh4Hahb354jcFBI/Vp14a6Hzu2llT/06umEbQdfgoCQg9Hzkom+hNVhFTajWCHGutj
	yY71aHj8AZ16J1ZJmzDEG5/fmbhFabaZ1tOcURPqzISFt8ySUQmtDdtKhiLV7LZO2qSh
	xgStiIzAx8/mwRJ7Ak4FxkOyjznVvUwduZCJfk2uFLRDhqWRvckmcDjw5y2yCUTr2+Xe
	RRPBkL/UBosNSVVYaKEZ7kfwO2RROPBp6N8sTOx1wbSxQOyCND2lZa2JbQZL3TBiiN6d
	9NQB7T3mRnRsWYlL3JquoOyL4HibXG2ei5d2040KhZ9oAYcvuUqYDBhnp545WzoDrQie
	pz1Q==
X-Gm-Message-State: ABuFfoj2FuCEMXWxoY1f7ZYm1J+CglTQg+XWwRhpFFj3SFtrHyZ5GZTA
	8QmodEqZ8Ka894s5aAX4UD/cf+TH5byLN4Nb07WOwbtY
X-Google-Smtp-Source: ACcGV61vTqJ8BZGCFeOa556Q5oXxapVCQybXgLkCe9HCdRw29RHBuUrkVj+Fy0cjFahVH2DtpleypAzWgi8geDIhcjw=
X-Received: by 2002:adf:a925:: with SMTP id
	u34-v6mr1164762wrc.175.1538207138857; 
	Sat, 29 Sep 2018 00:45:38 -0700 (PDT)
MIME-Version: 1.0
References: <20180927140251.4556-1-Martin.Jansa@gmail.com>
	<20180928201454.GW594@vctlabs.com>
	<CAMKF1srXgYGFi6_Qc8sUQaK4sNR0fqpq150oeivxRocN53Rw+A@mail.gmail.com>
	<20180928210816.GX594@vctlabs.com>
In-Reply-To: <20180928210816.GX594@vctlabs.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 29 Sep 2018 09:45:27 +0200
Message-ID: <CA+chaQdG9vsvs11RGrsCEnS07H-X9+DS8wf5fixJasWdZvC+yA@mail.gmail.com>
To: "S. Lockwood-Childs" <sjl@vctlabs.com>, Khem Raj <raj.khem@gmail.com>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-networking][PATCH] libldb: add pam to REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Sat, 29 Sep 2018 07:45:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It depends on pam DISTRO_FEATURES, because it depends on libpam since:
commit a95726df4bb1c898da7e4d4dbf9e2846914061e4
Author: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
Date:   Sat Sep 17 12:04:42 2016 +0200

    samba: replace pam packageconfig by hard dependency

    samba links against libpam even if pam is not in packageconfig and
libpam was
    built before. This patch avoid this floating dependency - other
solution could
    not be found. For those who want packageconfig back, see discussion iat
[1] for
    further inspiration.

    [1]
http://lists.openembedded.org/pipermail/openembedded-devel/2016-September/1=
09143.html

    Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
    Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
    Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>


On Fri, Sep 28, 2018 at 11:04 PM S. Lockwood-Childs <sjl@vctlabs.com> wrote=
:

> On Fri, Sep 28, 2018 at 01:23:25PM -0700, Khem Raj wrote:
> > On Fri, Sep 28, 2018 at 1:19 PM S. Lockwood-Childs <sjl@vctlabs.com>
> wrote:
> > >
> > > Could you explain commit 0db9697dc6b8c a little bit, where libpam
> became a
> > > distro requirement for samba itself? I'm not sure why pam is a hard
> > > requirement, rather than being PACKAGECONFIG option. I haven't tried
> the server
> > > ipk built with --without-pam but the client-side pieces are certainly
> useful.
> > > I've got a bbappend to override the pam forcing, and was just
> wondering if
> > > this change might be upstreamable.
> >
> > its lack of fine grained packaging that this was needed. If you can
> > sort this out then I am all ears
>
> What are the packaging problems to be solved when pam support is disabled=
?
>
> Like I said we're only running the client-side stuff so far, so I'm
> guessing
> the problems came up in server-side packages. There were no build errors
> from
> --without-pam at least.
>
> >
> > >
> > > On Thu, Sep 27, 2018 at 02:02:51PM +0000, Martin Jansa wrote:
> > > > * dependency on samba was added recently in:
> > > >   libldb: Add samba to rdeps for pyldb
> > > >   so now we need to match samba restriction to prevent:
> > > >
> > > > ERROR: Nothing RPROVIDES 'samba' (but
> meta-oe/meta-networking/recipes-support/libldb/libldb_1.4.1.bb RDEPENDS
> on or otherwise requires it)
> > > > samba was skipped: missing required distro feature 'pam' (not in
> DISTRO_FEATURES)
> > > > NOTE: Runtime target 'samba' is unbuildable, removing...
> > > > Missing or unbuildable dependency chain was: ['samba']
> > > > ERROR: Required build target 'meta-world-pkgdata' has no buildable
> providers.
> > > > Missing or unbuildable dependency chain was: ['meta-world-pkgdata',
> 'libldb', 'samba']
> > > >
> > > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > > ---
> > > >  meta-networking/recipes-support/libldb/libldb_1.4.1.bb | 3 ++-
> > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/meta-networking/recipes-support/libldb/libldb_1.4.1.bb
> b/meta-networking/recipes-support/libldb/libldb_1.4.1.bb
> > > > index 99e62f66bb..3c7e5455e9 100644
> > > > --- a/meta-networking/recipes-support/libldb/libldb_1.4.1.bb
> > > > +++ b/meta-networking/recipes-support/libldb/libldb_1.4.1.bb
> > > > @@ -35,7 +35,8 @@ LIC_FILES_CHKSUM =3D
> "file://pyldb.h;endline=3D24;md5=3Ddfbd238cecad76957f7f860fbe9ada
> > > >  SRC_URI[md5sum] =3D "159a1b1a56dcccf410d1bba911be6076"
> > > >  SRC_URI[sha256sum] =3D
> "2df13aa25b376b314ce24182c37691959019523de3cc5356c40c1a333b0890a2"
> > > >
> > > > -inherit waf-samba
> > > > +inherit waf-samba distro_features_check
> > > > +REQUIRED_DISTRO_FEATURES =3D "pam"
> > > >
> > > >  S =3D "${WORKDIR}/ldb-${PV}"
> > > >
> > > > --
> > > > 2.17.1
> > > >
> > > > --
> > > > _______________________________________________
> > > > Openembedded-devel mailing list
> > > > Openembedded-devel@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

