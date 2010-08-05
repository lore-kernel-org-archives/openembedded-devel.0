Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1Oh1Bk-0003LJ-Lz
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Aug 2010 16:13:05 +0200
Received: by eyf5 with SMTP id 5so2415628eyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Aug 2010 07:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:cc:content-type;
	bh=XpQVmI8uadjVghUHal7l8CbIJg/2Mj168ket01WgMKw=;
	b=UHBJVAWQVPKcYs79BL/opW7JNNU0nGZdqvUYg/xh1z9gq+FoHWNY50UDGfnGn93nfS
	W4trcNrEHRs6rBk/4gTilriCDZSh/llUHW5Y2ejWMJYOEtQ3N+vmrXnE7/N3Cjg7OhuR
	KRM1lm++aCaOGejMMWhKRICP2wwutUaODdiLU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	b=BjvNri4bDvUUAUV4Rp3qjBEv3gJcxVwTppBxHZpfFiigxceW8FO8f8wWfKj4LY3Hsa
	/iz/EsmTN4gPB2FCPcriXMEFFFtZ+aFT1rkdhNZA6Wrox+5s3/3I6bvRwIAPk6/UGO97
	/fpN2rLySEfjTfb76U6xftKGAGihHw9rXB54E=
Received: by 10.216.188.1 with SMTP id z1mr9346539wem.57.1281017568246; Thu, 
	05 Aug 2010 07:12:48 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.16.204 with HTTP; Thu, 5 Aug 2010 07:12:28 -0700 (PDT)
In-Reply-To: <1281006623.16235.277.camel@rex>
References: <1281006623.16235.277.camel@rex>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 5 Aug 2010 07:12:28 -0700
X-Google-Sender-Auth: 4NYAnPZWszMD7G6Wf3Chf6c_oT0
Message-ID: <AANLkTi=g3yCfu0=q3g=nph7vfr+-AKzB8NcWdVKX7Gf5@mail.gmail.com>
To: Richard Purdie <rpurdie@rpsys.net>
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: bitbake-dev <bitbake-dev@lists.berlios.de>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [Bitbake-dev] Add bb.data.flagAppend
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
X-List-Received-Date: Thu, 05 Aug 2010 14:13:06 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 5, 2010 at 4:10 AM, Richard Purdie <rpurdie@rpsys.net> wrote:

> I've been wondering what we could do to get rid of clutter in some of
> our class files. One thing we see a lot of is getting a flag, appending
> to it and saving it again. In normal syntax, =+ works great for this but
> that doesn't help in anonymous python. We see lots of things like:
>
> deps = (bb.data.getVarFlag('do_package_write_ipk', 'depends', d) or
> "").split()
> deps.append('opkg-utils-native:do_populate_sysroot')
> deps.append('virtual/fakeroot-native:do_populate_sysroot')
> bb.data.setVarFlag('do_package_write_ipk', 'depends', " ".join(deps), d)
>
> where as it would be nice just to be able to write:
>
> bb.data.varFlagAppend('do_package_write_ipk', 'depends',
> "opkg-utils-native:do_populate_sysroot
> virtual/fakeroot-native:do_populate_sysroot", d)
>
> or
>
> deps = "opkg-utils-native:do_populate_sysroot
> virtual/fakeroot-native:do_populate_sysroot"
> bb.data.varFlagAppend('do_package_write_ipk', 'depends', deps, d)
>
> if long lines make you uneasy.
>
> Does anyone else feel such a function would be of use? It would assume
> space delimitation as the "=+" and "+=" operators work.
>

This doesn't seem unreasonable to me.  Of course, this sort of thing is
quite common among variables, not just variable flags -- the fetch or "",
split, modify, reset.  Ideally, anything we can do from the metadata (.=,
=., +=, =+, addtask, addhandler, etc) would also be just as easily done via
the python API, to better facilitate testing, and to make things like this a
bit easier.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

