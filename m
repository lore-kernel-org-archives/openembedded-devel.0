Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <graham.gower@gmail.com>) id 1PVzSY-0008Sw-MH
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Dec 2010 05:40:54 +0100
Received: by wwi17 with SMTP id 17so6748465wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Dec 2010 20:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=MhRuv/zIrjEp7xPTuiehrT8B40q3GZPJfkxCWZhjirk=;
	b=xEdhyA3R1Cfg9A8Q+hvp0ZUY3f9U8/FHvgEwjjxHBsogn0Te1iFMOmuWVK/YoCdX1p
	PAZSpNEe0HtxJkROGNSBqZL7ph1YGTadXoRssLzeGKn442KiBf0hoIZHPY+1tN/e9D8L
	QiUsTphwE5NMzvTB+MFe7Uj06ZmBeYu/saYWY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=k13W9wMwzDbJVQOgfraGXJYET2V0lvxcYyMXWkl9IYSsuu+r3dOGJ/8xpBHi9Rhyrq
	fW0mCJcRUXCoKrobKmSWrseSCQpfWLSbOxUUK0qcwa0BsSX3McUPYNc7BJvq0e2VQswf
	++ZGCi/65Y7gP3zbvdYj9em5iawSyNC4azsJk=
MIME-Version: 1.0
Received: by 10.227.155.82 with SMTP id r18mr5445174wbw.107.1293165640573;
	Thu, 23 Dec 2010 20:40:40 -0800 (PST)
Received: by 10.227.155.208 with HTTP; Thu, 23 Dec 2010 20:40:40 -0800 (PST)
In-Reply-To: <Pine.LNX.4.64.1012232251340.7526@juice.ott.cti.com>
References: <4D13F894.4010100@gmail.com>
	<Pine.LNX.4.64.1012232251340.7526@juice.ott.cti.com>
Date: Fri, 24 Dec 2010 15:10:40 +1030
Message-ID: <AANLkTin+LDH+6kXJjgWSGzyAc0q8Qie=h337xLH9QDen@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] micro.conf: Pin an older udev to avoid space consuming dependencies.
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
X-List-Received-Date: Fri, 24 Dec 2010 04:40:54 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 24 December 2010 14:24, Michael Smith <msmith@cbnco.com> wrote:
> On Fri, 24 Dec 2010, Graham Gower wrote:
>
>> micro-uclibc/micro-image with udev 124 = 957207 bytes.
>> micro-uclibc/micro-image with udev 162 = 2303604 bytes.
>
> Could you be convinced to try udev 141? When I build it, its only
> runtime dependencies are glibc and libvolume-id.

I'll do some testing with 124. Until recently, udev 124 was the
highest version without D_P = -1, so it has had more testing with
distros that don't pin anything (in particular, with minimal).

>
>> +PREFERRED_VERSION_udev ?= "124"
>
> I'd suggest adding a comment above this setting, something like:
>
> # Pin an older udev to avoid space consuming dependencies.
>
> Otherwise the rationale doesn't show unless you do a git blame.

Sure.

>
> Mike
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


