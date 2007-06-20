Received: from [66.249.82.239] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <pmiscml@gmail.com>) id 1I12GU-0008Iq-HJ
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Jun 2007 17:38:44 +0200
Received: by wx-out-0506.google.com with SMTP id h29so213116wxd
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jun 2007 08:34:52 -0700 (PDT)
Received: by 10.90.50.1 with SMTP id x1mr521393agx.1182353692299;
	Wed, 20 Jun 2007 08:34:52 -0700 (PDT)
Received: from cube ( [82.193.98.14])
	by mx.google.com with ESMTP id 37sm875138nzf.2007.06.20.08.34.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Jun 2007 08:34:51 -0700 (PDT)
Date: Wed, 20 Jun 2007 18:34:52 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <17610553906.20070620183452@gmail.com>
To: "Sergey Lapin" <slapinid@gmail.com>
In-Reply-To: <48239d390706200314y300766en9956ec5e56789ce5@mail.gmail.com>
References: <48239d390706200314y300766en9956ec5e56789ce5@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC] locales
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Jun 2007 15:38:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Sergey,

Wednesday, June 20, 2007, 1:14:41 PM, you wrote:

> Hi, all!

> Note: I could be fundamentally wrong here, so, please feel free to
> point me to right direction in this case.

> As it was discussed on #oe, locale infrastructure lacks implementation
> on oe.dev, and, in particular, in Angstrom.

        That's true in the sense that there's no special infra to deal
with l19n issues efficiently. Otherwise, basic support on package
management level is there and works well (on that very package management
level).

        Going for elaboration of this support is opening Pandora's box.
There going to be just too many issues, and they will swamp whoever go
for them. At that's at the time, when we have more pressing issues on
all levels (OE - many packages not up-to-date/broken; Angstrom - lots
of clean up to do, and finally to make release; Specific devices -
lotsa kernel and related stuff to support/improve).

        So, I feel like currently it's bad time to go for l19n
problems.

> With a bit of research I done on this subject made me to come up with
> a few ideas, which I'd like to know your opinion about.

> Present status:
> *-locale* packages are generated, but not put on image. These packages
> contain message translations.
> * Only glibc locale which is put on image (if any) is en_GB.

        Yes, as of now, Angstrom is shipped with the default locale
only. Users who need other locale, can easily install it using package
manager (and yes, this easiness can be improved even more).

> Infrastructure problem:
> * We need a way to set up automatic locale package installation during
> image build according to some subset of languages/locales.

        On OE level, it's possible. On Angstrom level, we'd need to
decide which will be that "subset". And one decision was already made
- as locales (as in glibc locale package) are big in size, and there's
no definitive subset of size=N, N>1 which will allow to cover needs of
greater audience than subset of size=N-1, let there be one default
locale, and let users use standard means of customizing the install -
a package manager.

> * We need a way to install "language" in simple user-friendly way. I
> mean here not only locale packages, but also various
> language-dependent files (docs, keymap settings, various configuration
> files, etc.).

> Various random problems encountered:
> * GPE locale.alias for gpe-dm needs cleanup (get rid of non-UTF8 locales?)
> * libx11 locale.alias needs cleanup (setup for UTF8-only system).

> So, if we go utf8-only, we need to do a great cleanup/testing job here
> to settle things up.

> As for infrastructure, I see several questionable methods of solving this:

> 1. each package RRECOMMENDS its locale packages for locales mentioned
> in local.conf variable, and additional ones, which are related.

> 2. image RRECOMMENDS locale packages blindly for all normal packages
> for languages which are in a var mentioned in 1.

        These games with dependencies will do more harm than good.
l19n is pretty specific thing, and requires adhoc handling on another
level.

> 3. all -locale packages generated during builds are written to some
> special lists, for each language. Then meta-packages are generated
> from these lists.

        And this sounds a bit tangled. What such list will give you?
Why it needs to be written while generating packages? Why
"ls deploy/ipk/" is worse than such list?



        Ok, let me just dump my thoughts on how I'd do that:

1. Use ROOTFS_POSTPROCESS_COMMAND to do this stuff, don't patch the
rest of bitbake/OE.
2. ROOTFS_POSTPROCESS_COMMAND is run after rootfs is fully created, in
particular, when all packages are recursively installed. The list of
them is in /usr/lib/ipkg/status.
3. Read the list, and for each package PKG in it, try to install
package PKG-locale-LL. Skip non-existent packages.
4. Voila


> ...

> So, any ideas?

-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



