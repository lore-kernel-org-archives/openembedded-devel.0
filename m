Received: from [64.233.184.227] (helo=wr-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <papercrane@gmail.com>) id 1Hslfw-0005W2-54
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 May 2007 22:18:44 +0200
Received: by wr-out-0506.google.com with SMTP id q50so519926wrq
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 May 2007 13:17:14 -0700 (PDT)
Received: by 10.115.110.6 with SMTP id n6mr3071770wam.1180383433573;
	Mon, 28 May 2007 13:17:13 -0700 (PDT)
Received: by 10.114.144.2 with HTTP; Mon, 28 May 2007 13:17:13 -0700 (PDT)
Message-ID: <432beae0705281317t3464bacfr833d7ed6b28f374@mail.gmail.com>
Date: Mon, 28 May 2007 13:17:13 -0700
From: "Justin Patrin" <papercrane@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <038201c79f6a$f9859720$6e01a8c0@twilight>
MIME-Version: 1.0
References: <038201c79f6a$f9859720$6e01a8c0@twilight>
Subject: Re: PREFERRED_PROVIDER syntax is eluding me...
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
X-List-Received-Date: Mon, 28 May 2007 20:18:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 5/26/07, Mike (mwester) <mwester@dls.net> wrote:
> I'm missing something simple, I expect.  But try as I might, I cannot figure
> this out.
>
> Bitbake 1.8.3, building unslung-image (worked fine on 1.6): Bitbake says:
> [snip]
> NOTE: multiple providers are available for runtime libc6-unslung (glibc,
> glibc-initial);
> NOTE: consider defining a PREFERRED_PROVIDER entry to match runtime
> libc6-unslung
> [snip]
>
> This is a problem, because with bitbake 1.8, without a preferred provider
> specified, it seems to try to build both.  But only glibc builds;
> glibc-initial fails (and the build loops forever).   This is easily fixed by
> adding the following line to the local.conf file:
>
> PREFERRED_PROVIDER_libc6-unslung = "glibc"
>
> Except that it doesn't do a blasted thing.  Neither does this line:
>
> PREFERRED_PROVIDERS += " libc6-unslung:glibc"
>
> Thinking that perhaps the "-unslung" was implied since the machine is
> "unslung", I tried:
>
> PREFERRED_PROVIDERS += " libc6:glibc"
>
> Still no change.  Being persistent, I tried every variant of the above that
> I could think of, to no avail.  It seems that bitbake is not understanding
> or processing the info provided.  The -D flag offers no further hints,
> either.
>
> For background, back in the glibc bitbake recipes, glibc-initial.bb does a
> "require" of glibc.bb (hence the multiple providers).  Near the tail-end of
> glibc.bb we find:
>
> PACKAGES_unslung = "libc6-unslung"
> RDEPENDS_libc6-unslung = "nslu2-linksys-libs"
> RPROVIDES_libc6-unslung = "libc6"
> FILES_libc6-unslung = "/lib/librt*"
>
> Figuring that perhaps the problem is that nothing actually "PROVIDES" libc6,
> and that maybe bitbake needs to see the build-time dependency in order to
> handle the run-time dependency PREFERRED_PROVIDER stuff, I even added
> PROVIDES_libc6-unslung = "libc6"
> to the glibc.bb recipe, and went back through the list of
> PREFERRED_PROVIDERS in the local.conf file.  No luck.  No difference.
>
> I finally hacked the glibc bitbake recipes so that glibc-initial doesn't
> "RPROVIDE" libc6 anymore.  Success - bitbake is happy.  But I'm not.  That
> doesn't seem like the correct way to resolve the multiple providers issue,
> and I expect that commiting such a change would (rightfully) anger many
> folks.
>
> If some kind soul could point me to the document or another recipe that
> provides the correct syntax for handling this, or provide a pointer to
> whatever it is that I'm missing, I'd be most grateful.
>

So it's RPROVIDES and not PROVIDES? Sounds like the problem may be
that PREFERRED_PROVIDERS is for non-R.... Is there an
RPREFERRED_PROVIDERS perhaps?

It's been a while since you posted, sid you get this resolved in the
meantime? Richard Purdie should have more insight into this.

-- 
Justin Patrin


