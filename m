Received: from [209.85.132.244] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1JwiZl-0006DG-GX
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 May 2008 20:53:14 +0200
Received: by an-out-0708.google.com with SMTP id b38so119120ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 May 2008 11:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	bh=0tBN99aZdgQY+ncPg8JbJg5SzatjPWM4XQx5MIn7a34=;
	b=uxvlR66RjG+MdUMnpirsJwvysSnV/jp3E0XsNnCXaV1Y+B02ORxTLHtSE7DIKJZkHIBfWdA234e+4fY1tNeTukZrc36HsspTSCH4U7MaMnUHOhblQudMOGRZL2v4Ibn1azgdnj1gw+L9dDOs9j77a4oZ9XT3HtBLCiCAxdHuxt4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=AfnORaCTdDIdycnaQOixXDUJEyX9SSUgBc34ewi0WaOeghgovW6ss+gC6B2TeGc/kz7p2fpBycLYQ7Z7unSQMtG2H1HTQNxwcePNVwnlgG1V2YTEICEq0aoq5GdvAb43j2FnT+4raQ+vgiWSHkczDPfTXdWEfLQ+dQ7rAsQcwu4=
Received: by 10.100.37.20 with SMTP id k20mr3607398ank.5.1210877489992;
	Thu, 15 May 2008 11:51:29 -0700 (PDT)
Received: by 10.100.190.7 with HTTP; Thu, 15 May 2008 11:51:29 -0700 (PDT)
Message-ID: <c384c5ea0805151151v35e28a99i2ccb39157d5d47f6@mail.gmail.com>
Date: Thu, 15 May 2008 20:51:29 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1210869726.7097.93.camel@localhost.localdomain>
MIME-Version: 1.0
References: <c384c5ea0805141436m9f5151dje832c2da95379127@mail.gmail.com>
	<1210869726.7097.93.camel@localhost.localdomain>
Subject: Re: [RFC] Stop on multiple providers but none explicitly specified
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
X-List-Received-Date: Thu, 15 May 2008 18:53:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello Richard,

thanks for your reply.

On Thu, May 15, 2008 at 6:42 PM, Richard Purdie <rpurdie@rpsys.net> wrote:
> Bitbake will pick one, the options in brackets are in the order bitbake
> will choose them. We sort them alphabetically iirc since that is more
> deterministic than depending on parsing order which was the previous
> approach.
>
I agree it's more deterministic seen from the BitBake point-of-view
and that's an improvement.

However, is it intuitive from the *user's* point-of-view to have
BitBake make this decision?
I think not; at least in the case of OpenEmbedded, there is at least a
50% chance this is not what the user intended.

1) Besides fixing this in BitBake (by bailing out, my first proposal),
2) an alternative solution is to set the preferred provider for the
toolchain/libc elements to a built..
a) ..in each distro file
b) ..globally where we can build the toolchain/libc elements in
OpenEmbedded for the target.

I think 2a)  is not the way OpenEmbedded should work. The distro is
not the authorative component that decides whether we can build a
toolchain/libc for each target (like Angstrom does now).

Shouldn't we do (2b), where the distribution can *optionally* override
the preferred provider if it knows better?

Greetings,
-- 
Leon


