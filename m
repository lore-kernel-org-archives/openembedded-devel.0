Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cwabbott0@gmail.com>) id 1RXNJi-00033M-Hp
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Dec 2011 02:26:02 +0100
Received: by vbbfc21 with SMTP id fc21so3513752vbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Dec 2011 17:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=YAmTEZWBslZlG1K5964LW/Oi5wJ8/uwVv35UNR2e2SQ=;
	b=UwFUaMRpFZBJhAkBIUcbjMhN5EgDhqkPrW1WNXYUnwWouhEmyppW4g9t6jDA44lAsu
	UExKfKiMZls/gzwIK22WGfZ9nD5t9JGqS5HWA3+4tH//6XwDZ/wnFwiIsVFantvwmUEv
	lMeJz3S/JwU9qMxipeath3ySlezq84LQGrWBA=
MIME-Version: 1.0
Received: by 10.52.35.75 with SMTP id f11mr3602090vdj.18.1323047955606; Sun,
	04 Dec 2011 17:19:15 -0800 (PST)
Received: by 10.220.154.70 with HTTP; Sun, 4 Dec 2011 17:19:15 -0800 (PST)
In-Reply-To: <CAMKF1sqNpuzg8xL0vQp981KCe4ryHMRn+qOYz245EbY8nXKR_g@mail.gmail.com>
References: <1321811782-7133-1-git-send-email-cwabbott0@gmail.com>
	<jad09l$c0g$1@dough.gmane.org>
	<CACu1E7EigJom5yDg+VYZ15o6HF2cJO3BThtCLgEO1Fo1=s-URg@mail.gmail.com>
	<CAMKF1sqNpuzg8xL0vQp981KCe4ryHMRn+qOYz245EbY8nXKR_g@mail.gmail.com>
Date: Sun, 4 Dec 2011 20:19:15 -0500
Message-ID: <CACu1E7G05hqsfPx5vCxRiXgA6xTs76Kqpi6SnQ-_JcvazBHSbQ@mail.gmail.com>
From: Connor Abbott <cwabbott0@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-gnome][PATCH] libnotify: add 0.5.2 and make it the default
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
X-List-Received-Date: Mon, 05 Dec 2011 01:26:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

Well, in this case they don't, everything just intalls to
/usr/include/notify. The reason is that usually, programs using libnotify
hardcode that directory like this:
#include <notify/notify.h>

So it's impossible to install multiple versions at once without breakage at
least without changing the library itself or all its dependencies, as I
discovered.

On Wed, Nov 30, 2011 at 5:53 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Tue, Nov 29, 2011 at 3:13 PM, Connor Abbott <cwabbott0@gmail.com>
> wrote:
> > Sorry, I must have had the 0.7.0 headers installed and didn't realize it.
> > Actually, that's a problem; if you build two different packages, one
> which
> > requires libnotify and one which requires libnotify3, then the wrong
> > headers can get installed in the sysroot because the packages have
> > different names. Anyways, it appears that 0.5.2 is actually newer than
> > 0.6.0 anyways; I'll update the commit message then.
>
> if they are incompatible and needs to live together then they should
> have different install locations
> in sysroot for headers and libs e.g. /usr/include/libnotify2 and
> /usr/include/libnotify3
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

