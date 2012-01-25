Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ebutera@gmail.com>) id 1Rq6RT-0002r8-V6
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Jan 2012 18:15:28 +0100
Received: by ghrr1 with SMTP id r1so2311104ghr.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2012 09:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=rNAveESceIs6s7FBpswN13y/azjvCRDk8fCrn3YHanU=;
	b=AmWDZxRhhuCztLBpyTHBiV2o5OBaU8Q8zYjx3V//rLB0WHR1ZXskf2Y4ytCnnpq9yd
	D61K6UWrSb/Q08N2BMU51sojfxIEEGHXqZHs6j5/w5vj4nHa0MTokX4CZT0swo1ylm1J
	PbMZM9x6NLF+SjSF3aZJHutLycciP/68v6QX4=
MIME-Version: 1.0
Received: by 10.236.136.6 with SMTP id v6mr11329008yhi.89.1327510915291; Wed,
	25 Jan 2012 09:01:55 -0800 (PST)
Sender: ebutera@gmail.com
Received: by 10.236.170.163 with HTTP; Wed, 25 Jan 2012 09:01:55 -0800 (PST)
In-Reply-To: <1986227.xc2nDXUkFr@helios>
References: <1592899.mTy93uB97i@helios> <20120125141018.GE3843@jama.jama.net>
	<1986227.xc2nDXUkFr@helios>
Date: Wed, 25 Jan 2012 18:01:55 +0100
X-Google-Sender-Auth: 7EzCqKCT19cit7qwqIgRNfjQ04g
Message-ID: <CA+2YH7v4NYp0DXtO9nwsypL3vsBZNiwR9F5oz-JutRPG=J=1=g@mail.gmail.com>
From: Enrico <ebutera@users.berlios.de>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Splitting meta-oe
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
X-List-Received-Date: Wed, 25 Jan 2012 17:15:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jan 25, 2012 at 4:09 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Wednesday 25 January 2012 15:10:18 Martin Jansa wrote:
>> And that DEFAULT_PREFERRENCE should be respected across layers, IIRC if
>> you add newer less-well tested version of some recipe (like I did with
>> libsoup-2.4 in meta-efl) then it's preferred over "stable" version in
>> oe-core even when it has lower D_P -1.
>
> I agree that in its most common usage DEFAULT_PREFERENCE is likely to be more
> valuable independent of the layer priority - we should consider this. The
> usefulness in this context is of course dependent on people actually setting
> DEFAULT_PREFERENCE = "-1" when they add the new recipe however.

This would be very very useful.

Enrico


