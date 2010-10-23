Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P9i1r-00070n-1I
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Oct 2010 19:37:15 +0200
Received: by gxk22 with SMTP id 22so1400410gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Oct 2010 10:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=FM+pfS2z1lYNKRni9ogCtnxHLslkX+X1MJe5Jo4HUzY=;
	b=ASP6BXc4JJ+NcI4HlwJZih9bYyTyPXI23w0xPJNgiTvVaZU3MJSyFs1lWQeKRRIg/K
	KT2NzAaOx9K7vlmB5xb0lxbvq8sA3eL7FJHP8TprYxTe7QT75Nxr4VRGoi8X7a5zVNSB
	xfXsAfc00eu6YOthi3B4sBaIyyn7uVxAHvoBM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=xukxWKOX9Ng4T1tCqoAQj8wHKTzaHRes/Na031JnN9obq0zQTfsIFFs93ullVamY8D
	Mw//eruJgxWUMCfQfFBjY11JoiMhBPBY1lJJDUkU1TNQxbCzDdWDn/weZbnkpWcQtoqQ
	ri59yd/wltJeAJGUpK1F6qE0t9LINon92uxKU=
MIME-Version: 1.0
Received: by 10.42.41.5 with SMTP id n5mr3522857ice.248.1287855393148; Sat, 23
	Oct 2010 10:36:33 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Sat, 23 Oct 2010 10:36:33 -0700 (PDT)
In-Reply-To: <i9v396$cn4$1@dough.gmane.org>
References: <1287848486-14980-1-git-send-email-fransmeulenbroeks@gmail.com>
	<i9v396$cn4$1@dough.gmane.org>
Date: Sat, 23 Oct 2010 19:36:33 +0200
Message-ID: <AANLkTinENJ300R25P65JHJR5wX0jLvd0+TfvSOYKC7+K@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] u-boot-sakoman_git.bb: updated SRCREV to head to make it building again
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
X-List-Received-Date: Sat, 23 Oct 2010 17:37:15 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/10/23 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 23-10-10 17:41, Frans Meulenbroeks wrote:
>> SRCREV was "ccd0c67858c6e2807c695e2c8f545284cb871866", but that is not in the
>> omap4s-exp branch any more. Guess it was gone after a merge. To make things
>> building I moved the the head of the branch
>> SRCREV = "8b931e51f46acffd61096553ae89dfb3ee30d398"
>
> That branch is rebased frequently, so this won't help much. The tarball
> snapshot for the current revision is available on the angstrom source
> mirror, so if you are using angstrom and a recent bitbake you won't get
> bothered by the rebasing.
> Having said all that, we should find a working repo for panda uboot and
> use that. AIUI denx git should work soon.
>
> regards,
>
> Koen

Guess that is why it was autorev, but on oct 12 you pinned it to the
SRCREV that I could not fetch.
A solution could be to pin on a rev that is a merge with the denx git.
Not sure what the status is of the panda code in the u-boot git.
I see quite some patches from Steve (but no idea how much of them are
accepted/integrated by Wolfgang.

Frans.


