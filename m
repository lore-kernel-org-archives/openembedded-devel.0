Received: from mail-qy0-f172.google.com ([209.85.221.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1OEB2K-0006sw-Ja
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 May 2010 02:51:59 +0200
Received: by qyk2 with SMTP id 2so7647307qyk.20
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 May 2010 17:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=7myXejC6mpK+z3s7DKEhXfth7QYZmP2jvRqB8DSB9G0=;
	b=Df3vvSCblIKdxL6ECqpocJ3qZEZ65uo2dLCgPzy7mKNzO3Ii66H0BMteMy/04tWg4v
	laJQMRtEfpZWMaQXw7OOMXPpTVUYAT7EMrn9CerndBn7uuThiEEGeRhjQmoZSqv/0W6K
	MliJEvrS5HJm3RiEjLDB06XmdBn/wl419UeRs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=vOYqtNpI6IUk1r8iYPQApzmhfIXVyDFUpYs6fjID3GY7qfSUPst1tuGP4JJADIPh1A
	EeQHAv2sVNA8FgOk11q9Ct+N4KqAqbBbsLz6IjI8TzWZnc/0YL1QKVTvOuwelpdac8m3
	iRqXSeBGmiCnlZu6OechrZRGXLd/FahTgOxr4=
MIME-Version: 1.0
Received: by 10.224.79.102 with SMTP id o38mr3282200qak.358.1274143671732; 
	Mon, 17 May 2010 17:47:51 -0700 (PDT)
Received: by 10.229.230.77 with HTTP; Mon, 17 May 2010 17:47:51 -0700 (PDT)
In-Reply-To: <20100517204934.GE7932@gmail.com>
References: <AANLkTinM-N-vAT4yP0ptz0UcMBNsLHpQZ1er2VwnsDDv@mail.gmail.com>
	<20100517190152.GB7868@gmail.com>
	<AANLkTinsmKk2J576bTB0-Wkk48G5He9koqeQiU4MHhL_@mail.gmail.com>
	<20100517191837.GB7932@gmail.com>
	<AANLkTikLN9HgYy5Q6ICrDYuOBB47JdPy8vZiaf-Hv5uu@mail.gmail.com>
	<20100517194116.GD7932@gmail.com>
	<AANLkTimIyO_fMaHX_tsssDwFNTLBBl3aFSaMmeBQHk_C@mail.gmail.com>
	<20100517204934.GE7932@gmail.com>
Date: Mon, 17 May 2010 19:47:51 -0500
Message-ID: <AANLkTilkYQk773mFO9JsPmRQzEMSN3NRsGvUsYerwqU4@mail.gmail.com>
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.221.172
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Microblaze gcc 4.5.0 support
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
X-List-Received-Date: Tue, 18 May 2010 00:52:01 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, May 17, 2010 at 3:49 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On (17/05/10 14:57), Adrian Alonso wrote:
> > libgcc config.log http://pastebin.com/3mLhBMNP
> >
> > <http://pastebin.com/3mLhBMNP>I see the error
> > conftest.c:1:0: error: 'microblaze' is an invalid argument to -mcpu=
>
> yeah :). So you know what to do next time you have a gcc configure error.
>
Yep thanks for your help :)

> I think microblaze support is still on a branch in gcc. You
> will be better off using the branch or get the diff of the
> branch over gcc 4.5.0
>
Yes that's what I'm doing I include in gcc-svn.inc the src_uri for
gcc-microblaze branch,
and have a set patchs for gcc-4.5.0. Changes are in my oe repo [1]

Adding the correct option for mcpu fix the previous error but I'm getting a
new diefferent
error, I going to search on petalogix mailing list for answers since they
are the ones working
actively in microblaze linux support..

[1] http://gitorious.org/oe-microblaze

Regards


> -Khem
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Saludos
Adrian Alonso
http://aalonso.wordpress.com

