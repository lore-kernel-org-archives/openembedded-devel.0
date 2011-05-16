Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1QLxK8-00064i-O2
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 May 2011 14:55:01 +0200
Received: by yxn22 with SMTP id 22so1608754yxn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 May 2011 05:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=4H2F/cHt/3LNStN07K7quNhud8LPv2K6u9Spr7MwBJ4=;
	b=tbLy54KBzxCUvCFMDxWQ5IcoPM1yNJPpLaLcZ/hnOJbdrL+4yhwKKvakRHjetXI665
	srGD+27cF3aMFyc9RDN1+mZphSQZMhaAqjXy2f99zZ5zs/U0/f/qC0TentdZN6UDh9sz
	WQFfYBvlJvEiHAOjG6wflD9Wl4pDal++J2t14=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=tH1qHbNebdj8ZHv3veJJJ0pEfw31zfPUpnXXm5b0n8hRF2BzzcX0UY8NqCzr3YCqed
	EtVi0fh3jJEgwnhGWrmux/WJk9ycZvNx07VtWRhaMLzQMqBkzngkd1k86SSB4b6fH5tc
	jl6QMDdACM3MHd9jTBBSzwpbBN8aQLcWh3Lg8=
MIME-Version: 1.0
Received: by 10.91.33.1 with SMTP id l1mr3417866agj.207.1305550327703; Mon, 16
	May 2011 05:52:07 -0700 (PDT)
Received: by 10.91.176.3 with HTTP; Mon, 16 May 2011 05:52:07 -0700 (PDT)
In-Reply-To: <1305545218.3424.29.camel@rex>
References: <1305545218.3424.29.camel@rex>
Date: Mon, 16 May 2011 14:52:07 +0200
Message-ID: <BANLkTimSNvdsc1BoCk4ofNh4-nFuO5bg2A@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: OpenEmbedded Core - Ready for extended users
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
X-List-Received-Date: Mon, 16 May 2011 12:55:01 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/5/16 Richard Purdie <richard.purdie@linuxfoundation.org>

> Hi,
>
> The TSC has been tasked with working out how OE and Yocto could work
> together and people have no doubt seen the discussions about OE-Core.
>
> We're now pleased to formally announce that we feel OE-Core is ready for
> exposure to more users and we'd like to encourage people to have a look
> at it and experiment and develop with it.
>
> Just to recap on the background for this, splitting up OE into
> components has been a topic of discussion for a long time, certainly at
> every OEDEM. Until now this hasn't happened partly due to resource
> issues but also lack of tooling and the lack of a well thought out plan.
> We now feel these issues have been addressed and that we have a good
> plan in place. The promotion and use of layers is the only real way OE
> can scale as a project yet stay maintainable and testable.
>
> Things that aren't part of oe-core fall to the meta-oe layer which is
> where we intend the current wider support contained in oe-devel to be
> maintained. The people working on meta-oe so far would love to see more
> contributions. Both repositories are currently working on a "pull" model
> and people using them so far have felt a benefit to this for code
> quality.
>
> Discussion and development on oe-core is happening on the
> openembedded-core mailing list since otherwise it would be hard to
> filter out which patches and discussion were for which repository. We
> look forward to seeing more people getting involved there!
>
> (http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core)
>
> Cheers,
>
> Richard
> (Communicating on behalf of the TSC)
>
>
> Richard, thanks for the announcement.

I think the community could benefit if you add info (a pointer) in this
thread
- how to set up a build environment
- policies on what goes into oe-core and meta-oe and what not (and how to
deal with things that do not go into it)
- a migration scenario from the current repo to the new structure (what are
we doing with the existing recipes)
- how to add new distro's and bsp's

I know some (if not all) info has been sent around over time, but I feel it
would help if this announcement would carry the info to get people started
(and/or point to a web page that has the above info).

Best regards, Frans

