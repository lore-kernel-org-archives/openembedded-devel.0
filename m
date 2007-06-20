Received: from [66.249.92.170] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <slapinid@gmail.com>) id 1I18Tj-0005cL-5Z
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jun 2007 00:16:43 +0200
Received: by ug-out-1314.google.com with SMTP id i24so453271ugd
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jun 2007 15:12:57 -0700 (PDT)
Received: by 10.82.134.12 with SMTP id h12mr2430636bud.1182377141327;
	Wed, 20 Jun 2007 15:05:41 -0700 (PDT)
Received: from ?10.0.0.102? ( [85.249.166.143])
	by mx.google.com with ESMTP id g17sm380445nfd.2007.06.20.15.05.35
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 20 Jun 2007 15:05:40 -0700 (PDT)
Message-ID: <4679A49F.3090201@gmail.com>
Date: Thu, 21 Jun 2007 02:05:19 +0400
From: Sergey Lapin <slapinid@gmail.com>
User-Agent: Icedove 1.5.0.10 (X11/20070329)
MIME-Version: 1.0
To: Paul Sokolovsky <pmiscml@gmail.com>
References: <48239d390706200314y300766en9956ec5e56789ce5@mail.gmail.com>
	<17610553906.20070620183452@gmail.com>
In-Reply-To: <17610553906.20070620183452@gmail.com>
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
X-List-Received-Date: Wed, 20 Jun 2007 22:16:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Paul Sokolovsky wrote:
> 
>         That's true in the sense that there's no special infra to deal
> with l19n issues efficiently. Otherwise, basic support on package
> management level is there and works well (on that very package management
> level).
> 
>         Going for elaboration of this support is opening Pandora's box.
> There going to be just too many issues, and they will swamp whoever go
> for them. At that's at the time, when we have more pressing issues on
> all levels (OE - many packages not up-to-date/broken; Angstrom - lots
> of clean up to do, and finally to make release; Specific devices -
> lotsa kernel and related stuff to support/improve).
I have a feeling that that will go on forever - there are always
broken packages, not to mention improvements, especially on kernel side.
There's no stopping point, and that's not bad.


> 
>         So, I feel like currently it's bad time to go for l19n
> problems.
It seems that good time will never come, since there are always
other things to be done.

>         Yes, as of now, Angstrom is shipped with the default locale
> only. Users who need other locale, can easily install it using package
> manager (and yes, this easiness can be improved even more).

Any interesting details here, please?

> 
>> Infrastructure problem:
>> * We need a way to set up automatic locale package installation during
>> image build according to some subset of languages/locales.
> 
>         On OE level, it's possible. On Angstrom level, we'd need to
> decide which will be that "subset". And one decision was already made
> - as locales (as in glibc locale package) are big in size, and there's
> no definitive subset of size=N, N>1 which will allow to cover needs of
> greater audience than subset of size=N-1, let there be one default
> locale, and let users use standard means of customizing the install -
> a package manager.
It is not possible for some devices, and too hard on others
(due to lack of device support, for example, and need to provide
powerful showcase).

>         Ok, let me just dump my thoughts on how I'd do that:
> 
> 1. Use ROOTFS_POSTPROCESS_COMMAND to do this stuff, don't patch the
> rest of bitbake/OE.
> 2. ROOTFS_POSTPROCESS_COMMAND is run after rootfs is fully created, in
> particular, when all packages are recursively installed. The list of
> them is in /usr/lib/ipkg/status.
> 3. Read the list, and for each package PKG in it, try to install
> package PKG-locale-LL. Skip non-existent packages.
> 4. Voila

And here you provide solution to build image, not solving
issues for user (he installs application and expects
for package manager to install his locales for him
automatically. So, a bit of patching of ipkg is needed.
Any cons?



