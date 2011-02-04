Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PlTFF-0001b3-GW
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Feb 2011 22:31:09 +0100
Received: by gxk20 with SMTP id 20so1117160gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Feb 2011 13:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=A94LcbDPYbNseFZOGzgKpdl5RuoDl2ZxaWcGXNbLn8U=;
	b=RDnpFz2fkLRg9SHVX2E97lQ2wj4x0fRH3HcIeFXOu9papInlRGgIoYBb7ArMZKpMwY
	WVeHnfPuOUu7gsp8JHya44TxAYJEyIzEg/0ZlPfuYcYyR1kPQ0TrIWd0rG03yyCIWMU1
	1IdIZDtG9+3pBuWCk+6HlFyIManAicTKiEOqk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=DbTBUo8GHfnzRShAJw+zOBQv4N3B3Bk+h0FzC7IoT4mr2cKppICYkxnWwGB6I2pI9r
	DdaEBwqHu7uCqIeyLVrjmJnrjZRDEySpMMxVgYTjZVDpmFw/rAAIwoBJoby9E25muAJr
	ckOXICcrj+EGgeYNYTGBPmM8iTWRvT36t3gOc=
Received: by 10.90.51.20 with SMTP id y20mr16082712agy.115.1296855010308; Fri,
	04 Feb 2011 13:30:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.32.12 with HTTP; Fri, 4 Feb 2011 13:29:50 -0800 (PST)
In-Reply-To: <AANLkTinrmZzz8L=1CY9=F9Rdcc4A9+-tK07VD2fA0bRG@mail.gmail.com>
References: <AANLkTinrmZzz8L=1CY9=F9Rdcc4A9+-tK07VD2fA0bRG@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 4 Feb 2011 13:29:50 -0800
Message-ID: <AANLkTinTsExpckdjTm2=at-mmoUFTyfn7CjvSrNL6NG5@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Build problem when generating a squashfs image for a uclibc target
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
X-List-Received-Date: Fri, 04 Feb 2011 21:31:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 4, 2011 at 11:27 AM, Michael Poole <mdpoole@troilus.org> wrote:
> org.openembedded.dev/recipes/udev/attr_2.4.44.bb contains this line:
> =C2=A0LDFLAGS_append_libc-uclibc +=3D " -lintl"
>
> When generating a squashfs image, the build process apparently needs
> attr-native (-2.4.44-r4 on my machine).
>
> My (Ubuntu x86_64) host machine doesn't have a libintl.so anywhere, or
> any obvious package to install it, and the line suggests that it is
> only meant to be added for uclibc builds.
>
> What is the best way to fix or work around this?

Its already fixed

commit 45fcdc2aeda16be66cf3fd5b68cd544f40a98679
Author: Khem Raj <raj.khem@gmail.com>
Date:   Sun Jan 23 19:24:14 2011 -0800

    attr_2.4.44.bb: Dont add -lintl if doing native build and target is ucl=
ibc

    Signed-off-by: Khem Raj <raj.khem@gmail.com>


How old is your snapshot ?


>
> Michael Poole
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


