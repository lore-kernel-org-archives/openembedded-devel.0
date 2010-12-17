Received: from mail-fx0-f42.google.com ([209.85.161.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PTnYY-0002v9-RS
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Dec 2010 04:34:02 +0100
Received: by fxm11 with SMTP id 11so1259144fxm.29
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Dec 2010 19:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=FhlwdUfyPgdxdkhCf+/8sQ+7ZIX9u2wo2BRJGQXHULw=;
	b=aisLgHOJ9UscWT/F7d9XS912yBOgf4OkHnh7LM+m882mzx3Aq7dEKBDwwQJfYUYEzi
	q3bLlIDnLR1dAU8eVLd+UT1ZRVHkHvZshdxHvpF8gkLdmT4xvy/8pXARmmJTIlggfc7O
	m4mCDVnVIEqeLEoT9ZGrwcoaXAai+6t6FK0yI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=BHtABFofM3i7FarS77MweUFu70MDqPuqeUCv0Us4D7bYvAsrgxkaAhGZOu32Zlwc5y
	kxCQ+T3bdid2UgfYTAtKB94WShRYV/F8JkVliDhxZtQaamG0ll45SPE4SA+wvr9whAB/
	ep2A1n99cDnxgZSeeyG017XyYP42XxGa6IHco=
Received: by 10.223.71.197 with SMTP id i5mr930919faj.127.1292585372851;
	Fri, 17 Dec 2010 03:29:32 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id n26sm53301fam.37.2010.12.17.03.29.31
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 17 Dec 2010 03:29:31 -0800 (PST)
Date: Fri, 17 Dec 2010 12:29:46 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Message-ID: <20101217112945.GC19482@jama>
References: <1292510112-32629-1-git-send-email-otavio@ossystems.com.br>
	<1292515657-15330-1-git-send-email-otavio@ossystems.com.br>
	<20101216215228.GB19482@jama>
	<AANLkTi=F=kgEos0ZZb+7zefOq1G2fn5w+Wf8HqafFYsh@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTi=F=kgEos0ZZb+7zefOq1G2fn5w+Wf8HqafFYsh@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] classes/gitpkgv.bbclass: add GITPKGVTAG that uses 'git describe'
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
X-List-Received-Date: Sat, 18 Dec 2010 03:34:02 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Dec 17, 2010 at 09:00:41AM -0200, Otavio Salvador wrote:
> On Thu, Dec 16, 2010 at 19:52, Martin Jansa <martin.jansa@gmail.com> wrote:
> > On Thu, Dec 16, 2010 at 02:07:37PM -0200, Otavio Salvador wrote:
> >> Using ${GITPKGVTAG} allows for automatic versioning based on the
> >> repository tags. For those that doesn't want to use it, ${GITPKGV} is
> >> still available.
> >
> > Thanks for merging it to one bbclass. IMHO looks much better now.
> > Consider providing examples and warning as suggested bellow.
> 
> You're welcome. Thanks for keep commenting on it and helping with good advices.
> 
> ...
> > # PV = "1.0+gitr${SRCPV}"      # expands to something like 1.0+gitr3+4c1c21d7dbbf93b0df336994524313dfe0d4963b
> > # PKGV = "1.0+gitr${GITPKGV}"  # expands also to something like 1.0+gitr31337+4c1c21d7dbbf93b0df336994524313dfe0d4963b
> 
> added.
> 
> ...
> > As we were discussing with otavio on #oe, I think there should be
> > warning, that GITPKGVTAG is really sortable only if the upstream repo
> > keeps consistent AND sortable tag names.
> >
> > For example tags in OE repo will fail, because only tested_2010-* tags
> > are sortable but this sequence:
> >
> > tested_2010-11-04
> > release-2010.12-branchpoint
> > tested_2010-11-12
> >
> > is not. And only way to fix it when it's shiped with non-standard tag to
> > targets is to bump PE :/.
> 
> Yes. I fully agree that it is something the user of the class need to
> be aware of.
> 
> > Even better solution would be to set something like GITTAGFORMAT in
> > recipe, to expected consistent tag scheme and if returned git describe
> > prefix is different then warn builder about it or even fail or ignore
> > that tag.
> 
> I like the idea but I prefer to have this merged soon so I can started
> using it (for example in freerdp package) and at company.
> 
> > Proposed "warning":
> >
> > # or if upstream repository is always using consistent and sortable tag
> > # name scheme you can get sortable version including tag name with
> > # GITPKGVTAG, but be aware that ie tag sequence "v1.0, v1.2, xtest, v2.0"
> > # will force you to increment PE to get upgradeable path to v2.0 revisions
> 
> I added it as a warning on the comment.
> 
> The final header is:
> 
> # gitpkgv.bbclass provides a GITPKGV and GITPKGVTAG variables to be
> # used in PKGV, as described bellow:
> #
> # - GITPKGV which is a sortable version with the format NN+GITHASH, to
> #   be used in PKGV, where
> #
> #   NN equals the total number of revs up to SRCREV
> #   GITHASH is SRCREV's (full) hash
> #
> # - GITPKGVTAG which is the output of 'git describe' allowing for
> #   automatic versioning
> #
> # gitpkgv.bbclass assumes the git repository has been cloned, and
> # contains SRCREV. So ${GITPKGV} and ${GITPKGVTAG} should never be
> # used in PV, only in PKGV.  It can handle SRCREV = ${AUTOREV}, as
> # well as SRCREV = "<some fixed git hash>".
> #
> # WARNING: if upstream repository is always using consistent and
> # sortable tag name scheme you can get sortable version including tag
> # name with ${GITPKGVTAG}, but be aware that ie tag sequence "v1.0,
> # v1.2, xtest, v2.0" will force you to increment PE to get upgradeable
> # path to v2.0 revisions
> #
> # use example:
> #
> # inherit gitpkgv
> #
> # PV = "1.0+gitr${SRCPV}"      # expands to something like
> 1.0+gitr3+4c1c21d7dbbf93b0df336994524313dfe0d4963b
> # PKGV = "1.0+gitr${GITPKGV}"  # expands also to something like
> 1.0+gitr31337+4c1c21d7d
> #
> # or
> #
> # inherit gitpkgv
> #
> # PV = "1.0+gitr${SRCPV}" # expands to something like
> 1.0+gitr3+4c1c21d7dbbf93b0df336994524313dfe0d4963b
> # PKGV = "${GITPKGVTAG}"  # expands to something like 1.0-31337+g4c1c21d
> #                           if there is tag v1.0 before this revision or
> #                           ver1.0-31337+g4c1c21d if there is tag ver1.0
> 
> Does it seems good enough for pushing it?

Yes

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


