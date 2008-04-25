Received: from [209.85.134.191] (helo=mu-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1JpCPc-0000A2-Ox
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Apr 2008 03:07:40 +0200
Received: by mu-out-0910.google.com with SMTP id i2so4299173mue.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Apr 2008 18:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	bh=1NKD09LF28yOOqLno2j5l1Zi3P4DDK7kZeC3970ymLo=;
	b=X7BP2NUEdZzTRqK+ckGioxIYHC6pu585SbJ9XNiP3xo/J2d6odKHnIX828o4J9UNYas0Kfldb/p4X1vOkVc320k1VAJuxccLrvNDr9dZWTn0Q2cWd34r4rWfccWXCJyU0RtSkt4OQ5FtqfkGWT5PHX/LNT0bJTA2q1J5snBf7Zc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=yHQZ4ux+MemDKOJJ691Fsi+f4EDlhCKlqqpInB6ROgoDinEPONZIBh5EuhrgT9yQRGeXs3kqkEkJVppGa8cb06daw0Ii3Danedyj8V8HZVSZe73SJ5v7XCnUNMfQgSTSLiOgR28fK5oQVrBI8BUUhnm73Rac/CEvTyqJ13zjF/8=
Received: by 10.114.169.2 with SMTP id r2mr2594938wae.30.1209085647598;
	Thu, 24 Apr 2008 18:07:27 -0700 (PDT)
Received: by 10.114.190.2 with HTTP; Thu, 24 Apr 2008 18:07:27 -0700 (PDT)
Message-ID: <f96d234e0804241807p41a127f7j418ae7f80d7408d3@mail.gmail.com>
Date: Thu, 24 Apr 2008 21:07:27 -0400
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1209079836.28694.1.camel@dax.rpnet.com>
MIME-Version: 1.0
References: <f96d234e0804241613j604a4283ofe32c1a8b64ad940@mail.gmail.com>
	<1209079836.28694.1.camel@dax.rpnet.com>
Subject: Re: xfonts, mapfile dir, and pkg-config issue
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Fri, 25 Apr 2008 01:07:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Apr 24, 2008 at 7:30 PM, Richard Purdie <rpurdie@rpsys.net> wrote:
>
>  On Thu, 2008-04-24 at 19:13 -0400, Cliff Brake wrote:
>  > This issue is that "pkg-config --variable=mapdir fontutil" returns:
>  >
>  > /usr/lib/X11/fonts/util
>  >
>  > which is correct if mapdir is used on the target system, but in this
>  > case mapdir is used on the host system during the build, so it really
>  > needs the path to staging.
>  >
>  > We can't modify font-util to put the staging path in fontutil.pc or
>  > insane.class complains about tmdir's in a *.pc file.
>  >
>  > What is the correct solution in this case?
>  >
>  > 1) hardcode EXTRA_OECONF with the MAPFILES_PATH (would require
>  > patching font packages -- bad)
>
>  If you can override from the commandline this may be an option,
>  particularly if all font packages accept the same option and we can use
>  a .inc file.
>
>  The alternative is to patch the configure.ac files so it uses something
>  like:
>
>  $PKG_CONFIG_SYSROOT_DIR`pkg-config --variable=mapdir fontutil`
>
>  which in theory should be accepted upstream too...

This seems like the best option.

>  > 2) convince insane.class that this tmpdir is really OK in fontutil.pc
>
>  >From what you said above, this wouldn't help.

We would also have to modify the font-util recipe, then it appears to work:

--- packages/xorg-font/font-util_1.0.1.bb
29499d32e8b5b2e57bdda74b6b9a0c8c67b14225
+++ packages/xorg-font/font-util_1.0.1.bb
3a7987e8d665539167ca9d2034222ca9b21346b7
@@ -5,5 +5,7 @@ RDEPENDS = "mkfontdir mkfontscale encodi
 DEPENDS = "encodings"
 RDEPENDS = "mkfontdir mkfontscale encodings"

-PR = "r1"
+EXTRA_OECONF = "--with-mapdir=${STAGING_DIR_TARGET}${libdir}/X11/fonts/util"
+
+PR = "r3"
 PE = "1"

But, I agree this should really be fixed in the package source, so
I'll go that route and try to get it pushed upstream.

Thanks for the ideas.

Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


