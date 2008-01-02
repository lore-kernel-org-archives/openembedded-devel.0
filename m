Received: from [209.85.128.188] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <philipp.zabel@gmail.com>) id 1JA5zF-0005U2-0Y
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jan 2008 16:58:33 +0100
Received: by fk-out-0910.google.com with SMTP id 18so7443992fks.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Jan 2008 07:52:06 -0800 (PST)
Received: by 10.82.174.20 with SMTP id w20mr25815519bue.28.1199289126118;
	Wed, 02 Jan 2008 07:52:06 -0800 (PST)
Received: by 10.82.120.17 with HTTP; Wed, 2 Jan 2008 07:52:06 -0800 (PST)
Message-ID: <74d0deb30801020752p51c90f7fuff6d080fcf397e2f@mail.gmail.com>
Date: Wed, 2 Jan 2008 16:52:06 +0100
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <0cdd01c84d52$b60de4c0$6e01a8c0@twilight>
MIME-Version: 1.0
References: <0cdd01c84d52$b60de4c0$6e01a8c0@twilight>
Subject: Re: "as" has gone missing.
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
X-List-Received-Date: Wed, 02 Jan 2008 15:58:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Jan 2, 2008 4:18 PM, Mike (mwester) <mwester@dls.net> wrote:
> Alas!  Sometime in the past - nobody here knows exactly when - "as" (the
> assembler) has gone missing from the packages.  The "gcc" bitbake recipe
> provides all manner of other packages, all of which can be installed, and
> seem to provide the necessary compilation tools to build stuff on the target
> device.  Except that the toolchain can't find "as" -- and as I peruse the
> recipes, neither can I!
>
> The assembler is built and placed on the buildhost (in the cross directory,
> as one would expect), so clearly it's handled by something - just not the
> "gcc" bb recipe.  The "gcc" recipe does not seem to build "as", and
> certainly doesn't have any support for packaging it.
>
> I am need of a clue, if anyone can offer some direction.  Might this be as
> simple as a configuration option missing when gcc is built (and "as" should
> be part of the "gcc" package), or is this a case where I'll have to add
> support for a separate "as" package to the recipe?
>
> Thanks,
> Mike (~mwester)

binutils, binutils-symlinks

cheers
Philipp


