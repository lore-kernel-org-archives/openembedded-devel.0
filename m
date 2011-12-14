Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1RatI6-0007Fy-5z
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Dec 2011 19:10:54 +0100
Received: by qadb17 with SMTP id b17so5675224qad.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Dec 2011 10:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=RKz2vEYR9e2SW05xIMZAu43BIoG81Z7DYoQBzqbs/Es=;
	b=syz9DKIaLLDxmDxp1HU2+qheVrG2B39XsWvzo241AUG7uq/2I8wDdj/sQwcvuljpjB
	e4umsjoOq3DBruTYpt1l3nwIl71p7N4f5HW4dPkjMHks1D7BMIs4PuW4FHtb4z9cduEg
	LPZUtY2KLFR/XAiaYJFKM9eTPOq4ENNbtm36I=
MIME-Version: 1.0
Received: by 10.224.33.69 with SMTP id g5mr11325828qad.70.1323885836774; Wed,
	14 Dec 2011 10:03:56 -0800 (PST)
Received: by 10.229.94.72 with HTTP; Wed, 14 Dec 2011 10:03:56 -0800 (PST)
In-Reply-To: <4EE27BB8.3020903@opendreambox.org>
References: <4EE27BB8.3020903@opendreambox.org>
Date: Wed, 14 Dec 2011 11:03:56 -0700
Message-ID: <CA+M6bXmvd8H=jYrd0QNxmzNy+RKNm3rV+iCy8aZNxNzMd=KUFw@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: fakeroot 1.15.1 in 2011.03-maintenance
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
X-List-Received-Date: Wed, 14 Dec 2011 18:10:54 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Dec 9, 2011 at 2:20 PM, Andreas Oberritter <obi@opendreambox.org> wrote:
> Hi Tom, all,
>
> one week ago, the fakeroot recipe was moved to 1.15.1 [1] in order to fix
> a download problem, even though previous attempts were rejected [2,3].
> Well, now I get the following error:
[snip]
> That's because Debian redirects to a HTML page instead of returning an
> error, which makes it impossible to use a mirror. I'd submit a patch,
> but I'd like to ask first, what's the preferred solution (e.g. go back
> to previous version, update to new version, fix SRC_URI). The SRC_URI
> could have been fixed for 1.14.5, too. I wonder why this didn't happen
> instead.

Arrg, you're right and I made a mistake.  The reason we didn't use the
snapshot mirror like you suggest is that I at least was unaware that
you could.  To fix this problem I've reverted the change that
introduced 1.15.1, added PE = 1 to the recipe (so that anyone that did
somehow get 1.15.1 built will go and be back to 1.14.5) and changed
the URI based on what you provided in a follow-up so that it fetches
again, for all.  Sorry for the inconvenience.

-- 
Tom


