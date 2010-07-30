Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OerkG-0003fT-Q9
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Jul 2010 17:43:38 +0200
Received: by gyd8 with SMTP id 8so716637gyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jul 2010 08:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=kmQGzS6j5bI2D8U43ipgwLFv0/XTdubLRJUAGemXcrA=;
	b=sF5NgsG0/Qq574eSLleel7W2E43EtYMeSOk67msDiKXFXb4MK4UG3Bg5d9NCEh1s+t
	RClEIwqYDaAjqVFy9oxSoGCpPhr0qJ1f4VB8h0WHIdw/ctAxXW1iSTwC9/oCanaSGU3M
	YiAwjM0xxUszKXgf27z2taUWdJzcsuI8iCsj8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=lcAvH+gpl1VXvbjfuQHnzqloZ86RfU5BxFzpgRAOlAmdB5UJugqlWG0RBTk7L/H5c2
	cTzm6dksoEU3fHHdryAN2Q+oWqk+dtDIiBhD5Py6plZzf6B6v4o89GL4jrl1vYVcomxl
	XsQHiu8XowJHNayB3/PhQlMCYyjHI0IixZaDE=
Received: by 10.151.134.2 with SMTP id l2mr3498151ybn.195.1280504595420; Fri, 
	30 Jul 2010 08:43:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.186.88 with HTTP; Fri, 30 Jul 2010 08:42:55 -0700 (PDT)
In-Reply-To: <i2u4cr$gkg$1@dough.gmane.org>
References: <1280475746-15699-1-git-send-email-raj.khem@gmail.com> 
	<i2u4cr$gkg$1@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 30 Jul 2010 08:42:55 -0700
Message-ID: <AANLkTinaX2p1LD6SbY31Fgn0kZCEK3ALKKdg5P-GF=4y@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] bitbake.conf, cross.bbclass: Make multi-machine 	toolchains to co-exist
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
X-List-Received-Date: Fri, 30 Jul 2010 15:43:38 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jul 30, 2010 at 2:01 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 30-07-10 09:42, Khem Raj wrote:
>> From: Tom Rini <tom_rini@mentor.com>
>>
>> the patch Tom sent has line breaks etc. this is same patch formatted for anybody to test
>
> MACHINE=beagleboard bitbake ffmpeg:
>
> | running configure fragment for nptl/sysdeps/pthread
> | configure: error: compiler support for __thread is required
> | ERROR: Function do_configure failed
> NOTE: package glibc-initial-2.9-r36.3: task do_configure: Failed

This is because its not finding the binutils in right place I think.

>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFMUpTbMkyGM64RGpERAt9YAJ9baoI1zJvmEuGPj9gvrR2eSkJ5CQCeKx++
> fLr6Le14u/zC3AU41Jj0obk=
> =itZg
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


