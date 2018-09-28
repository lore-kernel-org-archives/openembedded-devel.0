Return-Path: <sjl@vctlabs.com>
Received: from dent.vctlabs.com (net-cf9a4187.iis.impulse.net [207.154.65.135])
	by mail.openembedded.org (Postfix) with ESMTP id 3742F71AB3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Sep 2018 21:04:27 +0000 (UTC)
Received: by dent.vctlabs.com (Postfix, from userid 1000)
	id ED705280599; Fri, 28 Sep 2018 14:08:16 -0700 (PDT)
Date: Fri, 28 Sep 2018 14:08:16 -0700
From: "S. Lockwood-Childs" <sjl@vctlabs.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20180928210816.GX594@vctlabs.com>
Mail-Followup-To: "S. Lockwood-Childs" <sjl@vctlabs.com>,
	Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20180927140251.4556-1-Martin.Jansa@gmail.com>
	<20180928201454.GW594@vctlabs.com>
	<CAMKF1srXgYGFi6_Qc8sUQaK4sNR0fqpq150oeivxRocN53Rw+A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1srXgYGFi6_Qc8sUQaK4sNR0fqpq150oeivxRocN53Rw+A@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Fri, 28 Sep 2018 21:04:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 28, 2018 at 01:23:25PM -0700, Khem Raj wrote:
> On Fri, Sep 28, 2018 at 1:19 PM S. Lockwood-Childs <sjl@vctlabs.com> wrote:
> >
> > Could you explain commit 0db9697dc6b8c a little bit, where libpam became a
> > distro requirement for samba itself? I'm not sure why pam is a hard
> > requirement, rather than being PACKAGECONFIG option. I haven't tried the server
> > ipk built with --without-pam but the client-side pieces are certainly useful.
> > I've got a bbappend to override the pam forcing, and was just wondering if
> > this change might be upstreamable.
> 
> its lack of fine grained packaging that this was needed. If you can
> sort this out then I am all ears

What are the packaging problems to be solved when pam support is disabled?

Like I said we're only running the client-side stuff so far, so I'm guessing
the problems came up in server-side packages. There were no build errors from
--without-pam at least.

> 
> >
> > On Thu, Sep 27, 2018 at 02:02:51PM +0000, Martin Jansa wrote:
> > > * dependency on samba was added recently in:
> > >   libldb: Add samba to rdeps for pyldb
> > >   so now we need to match samba restriction to prevent:
> > >
> > > ERROR: Nothing RPROVIDES 'samba' (but meta-oe/meta-networking/recipes-support/libldb/libldb_1.4.1.bb RDEPENDS on or otherwise requires it)
> > > samba was skipped: missing required distro feature 'pam' (not in DISTRO_FEATURES)
> > > NOTE: Runtime target 'samba' is unbuildable, removing...
> > > Missing or unbuildable dependency chain was: ['samba']
> > > ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
> > > Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'libldb', 'samba']
> > >
> > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > ---
> > >  meta-networking/recipes-support/libldb/libldb_1.4.1.bb | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/meta-networking/recipes-support/libldb/libldb_1.4.1.bb b/meta-networking/recipes-support/libldb/libldb_1.4.1.bb
> > > index 99e62f66bb..3c7e5455e9 100644
> > > --- a/meta-networking/recipes-support/libldb/libldb_1.4.1.bb
> > > +++ b/meta-networking/recipes-support/libldb/libldb_1.4.1.bb
> > > @@ -35,7 +35,8 @@ LIC_FILES_CHKSUM = "file://pyldb.h;endline=24;md5=dfbd238cecad76957f7f860fbe9ada
> > >  SRC_URI[md5sum] = "159a1b1a56dcccf410d1bba911be6076"
> > >  SRC_URI[sha256sum] = "2df13aa25b376b314ce24182c37691959019523de3cc5356c40c1a333b0890a2"
> > >
> > > -inherit waf-samba
> > > +inherit waf-samba distro_features_check
> > > +REQUIRED_DISTRO_FEATURES = "pam"
> > >
> > >  S = "${WORKDIR}/ldb-${PV}"
> > >
> > > --
> > > 2.17.1
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

