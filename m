Received: from [209.85.198.244] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>) id 1KOJbu-0004xg-6j
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jul 2008 23:53:30 +0200
Received: by rv-out-0708.google.com with SMTP id f25so248350rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jul 2008 14:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=pMHGl1aFGpXN/GmYScfcHtgdB3SoSstLMsx+5jSNmP8=;
	b=wZpzihuX5JDbWF6J1hq+vRQkqHYLTuNk5P4AdqodvrXxeAFmA+oBynHhGSzGhwToEU
	NI/Eqr+/QnQsLaZAb8rS0NAbGAVTcj/w7ak3w9vVz3bOiIPjw9t3z9VhAhoXdmjnqqL2
	t01uoj+dzEd8MqDbjQWjORBALv7bufHNwzXps=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=hPY8bEp6D5eFyqnLUVvi+jJ+VLx41U2RYR1DTAZeIJL3/OmYVPGg9iG5VxqFPY8ZbV
	IkxONssyjzno9dPzIltoSYgR0SH9ytvWwJkMf/s272HCn9Kfrq++chw4bBhHfWX0qq9H
	ldg7wN4kO/Z1lWQhpuEfEls8b5ldQ5xqHypwQ=
Received: by 10.140.126.14 with SMTP id y14mr4878113rvc.96.1217454705695;
	Wed, 30 Jul 2008 14:51:45 -0700 (PDT)
Received: by 10.141.116.18 with HTTP; Wed, 30 Jul 2008 14:51:45 -0700 (PDT)
Message-ID: <d2b9ea600807301451j1a303fadoe173657f6abc4f71@mail.gmail.com>
Date: Wed, 30 Jul 2008 23:51:45 +0200
From: "Esben Haabendal" <esbenhaabendal@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <c384c5ea0807300829s775020aej348bc06d62a47264@mail.gmail.com>
MIME-Version: 1.0
References: <c384c5ea0807300829s775020aej348bc06d62a47264@mail.gmail.com>
Subject: Re: Tool for gathering/validating OE source package locations
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Wed, 30 Jul 2008 21:53:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Jul 30, 2008 at 5:29 PM, Leon Woestenberg
<leon.woestenberg@gmail.com> wrote:
> Hi Esben and all,
>
>
> This is a C application I wrote to keep a database (it uses sqlite) of
> valid (source package) locations.
>
> http://www.sidebranch.com/leon/witpa_20080730.tar.bz2
>
>
> Once you manually add a known-good package, it can use Google powers
> to add new locations, after validating MD5 and SHA.
>
> http://www.sidebranch.com/leon/witpa_20080730.tar.bz2
>
> It could act as a OE fetcher back-end if we extend it a bit.
>
> The tool is called 'witpa' for "Where Is That Package At?".

Nice!  It would definitely be nice to have integrated as OE fetcher.

Depending on the situation, I would like to:

1. Go through _ALL_ recipes, and check all sources.
2. Go through all recipes needed for a specific configuration.
3. Go through all sources already known by witpa.

And as a result,

a. Raise a warning for sources that could not be downloaded.
   and which is not known by witpa
b. Raise a warning for sources that could not be downloaded,
   and which is known by witpa, but a usable alternative location
   could not be found.
c. For sources that could not be downloaded, and where witpa
   is able to find an alternative usable location, send an email with
   a patch which if applied, fixes the recipe.  These patches should
   then be hand-carried to a commit.

Without something like this, I fear that stable will not really be
very stable.

If only I had a bit more time or bitbake hacking experience...

/Esben


