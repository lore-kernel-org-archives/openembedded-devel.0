Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PDuSI-0002of-TR
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Nov 2010 08:41:56 +0100
Received: by bwz10 with SMTP id 10so1512677bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Nov 2010 00:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=DaARgeXkVFC50FVpJgJ+hOxAI17nFNmlNP11uwwII6U=;
	b=vE1rVX/UT/h4hPdY6ORawHbjzWmFauybYZtBYafw6kRKsZf/4OYyBqkqYk4kBQmPSE
	zSbNQLNKpkJCrcadYPeiZEfj58C4sEa+t7tUZCeN6VKlcw6ETVh0Wj63G7Cb7cRlqu9N
	E8TObaQPLWYaokNwq4VGsESOPMxpiIPQpc8ow=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=J6TmXEks9/Lv//pOQv36pz+eg9zwR8oTr45kQ/Pfegx/rlfznblPpKKKVBEJde1x1r
	b/ZaKcX9aJOg7nia9okBnF5XKiKFGEK1o9pyocrwxY7hvgOawTCqBGIGupDVdLK3E712
	GQ1BsUNtZPTkjcKFdu9vBPLwVL2Wc5OFgdlKE=
Received: by 10.204.56.194 with SMTP id z2mr310044bkg.129.1288856462537;
	Thu, 04 Nov 2010 00:41:02 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id f21sm6403098bkf.12.2010.11.04.00.41.00
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 04 Nov 2010 00:41:00 -0700 (PDT)
Date: Thu, 4 Nov 2010 08:40:45 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101104074045.GH3440@jama>
References: <AANLkTim-_z6a6jX3X9Zh_s-ihE-19SFFmus3U7MXVPfY@mail.gmail.com>
	<20101026093926.GC3514@jama> <20101026112551.GD3514@jama>
MIME-Version: 1.0
In-Reply-To: <20101026112551.GD3514@jama>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: DEPENDS broken for native(sdk).bbclass Was: libgee introspection problem
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
X-List-Received-Date: Thu, 04 Nov 2010 07:41:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 26, 2010 at 01:25:51PM +0200, Martin Jansa wrote:
> On Tue, Oct 26, 2010 at 11:39:26AM +0200, Martin Jansa wrote:
> > On Tue, Oct 26, 2010 at 11:16:46AM +0200, Frans Meulenbroeks wrote:
> > > Hi,
> > > 
> > > With the testing branch I get a problem with libgee native in
> > > combination with introspection.
> > > I'm building distro minimal, target neek (but I doubt that the latter matters)
> > > 
> > > Anyone an idea?
> > 
> > that should be fixed with
> > http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=df932a2769c2f6f7195363e8eb83994846805398
> > 
> > but that didn't make it to DEPENDS_virtclass-native (as well as
> > glib-2.0), I'm checking why (reading native.bbclass looks like it 
> > should be there automatically).
> > 
> > if I don't find bug in native.bbclass I'll append it to
> > DEPENDS_virtclass-native too
> 
> native.bbclass and nativesdk.bbclass use
> ORIG_DEPENDS := "${DEPENDS}"
> DEPENDS_virtclass-native ?= "${ORIG_DEPENDS}"
> 
> and then for every dependency in DEPENDS_virtclass-native it does:
> 
> 1) if it ends with -cross appends dependency ending -native instead
> 2) if it ends with -native it just appends
> 3) else appends dependency ending with native instead
> 
> That's all nice and right and works in theory, BUT:
> 
> base.bbclass:
> DEPENDS_prepend="${@base_deps(d)} "
> DEPENDS_virtclass-native_prepend="${@base_deps(d)} "
> DEPENDS_virtclass-nativesdk_prepend="${@base_deps(d)} "
> 
> autotools.bbclass:
> DEPENDS_prepend = "${@autotools_deps(d)}"
> DEPENDS_virtclass-native_prepend = "${@autotools_deps(d)}"
> DEPENDS_virtclass-nativesdk_prepend = "${@autotools_deps(d)}"
> 
> vala.bbclass:
> DEPENDS += "vala-native"
> DEPENDS_virtclass-native += "vala-native"
> 
> so DEPENDS_virtclass-native is not empty when native.bbclass calls:
> DEPENDS_virtclass-native ?= "${ORIG_DEPENDS}"
> and ORIG_DEPENDS are just ignored
> 
> we cannot fix it with
> DEPENDS_virtclass-native += "${ORIG_DEPENDS}"
> 
> because sometimes we want to override DEPENDS_virtclass-native from
> recipe (ie when target recipe depends on its own ${PN}-native).
> 
> Maybe it's because the order of bbclass processing was changed? It would
> work OK if we process native and nativesdk first.
> 
> I've added small debug output to see order now
> DEBUG: Removing /OE/dev/recipes/libgee/libgee_0.6.0.bb from cache
> DEBUG: Parsing /OE/dev/recipes/libgee/libgee_0.6.0.bb
> DEBUG: inherited base
> DEBUG: inherited autotools
> DEBUG: inherited vala
> DEBUG: inherited base
> DEBUG: inherited autotools
> DEBUG: inherited vala
> DEBUG: inherited native
> 
> No idea why I see it twice..
> 
> Current broken state:
> DEBUG: OrigDepends: autoconf-native automake-native libtool-native gnu-config-native coreutils-native linux-libc-headers-native glib-2.0 vala-native gobject-introspection-native
> DEBUG: Depends: autoconf-native automake-native libtool-native gnu-config-native coreutils-native linux-libc-headers-native vala-native
> glib-2.0 is from libgee.inc, gobject-introspection-native from libgee_0.6.0.bb, but both lost
> 
> If I remove those append/preppend from bbclasses:
> DEBUG: OrigDepends: autoconf-native automake-native libtool-native gnu-config-native coreutils-native linux-libc-headers-native glib-2.0 vala-native gobject-introspection-native
> DEBUG: Depends: autoconf-native automake-native libtool-native gnu-config-native coreutils-native linux-libc-headers-native glib-2.0 vala-native gobject-introspection-native
> 
> 
> I'll send patch for removing those DEPENDS_virtclass-native(sdk) from bbclasses. 
> But that will break those recipes where DEPENDS_virtclass-native is used to override
> common DEPENDS but without still needed dependencies from classes, so enforced 
> bbclass order would be probably better fix.
> 
> We really need some sort of unit tests :/.
> 
> Regards,

ping?

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


