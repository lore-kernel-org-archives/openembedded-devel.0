Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Sy99Z-0007jw-AP
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Aug 2012 00:18:29 +0200
Received: by eekb57 with SMTP id b57so665152eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 Aug 2012 15:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=qbxqjqw0dHscVvZUCU2JPpMOfhsI4XDDF4u6FGlXFEc=;
	b=SlKKDlZJtVUG50pW9v2lfIQXXTVkFzwbFFIsDatSDQZc/IKTQcI+ZRq9lxq/Tnpxl2
	FDCXZPGDahFpgfsnHYmeMRIWRwEZWdMX2x7cuaV4mI0hIsd5DXtsaDpf+OvQxPEW4zAK
	RRIbVMGEsCesOfA5KHcDay/HJLyssEQkNZdypiKIkoQZ9jFAmcO/vHGm0GOO7t1DgCRf
	31MS0K7VWtF66AKZy28q6FdKZRkImSeEPmM81Pv2oShrKOiawsORNZNACB9+Cbu1r4yS
	L191qc6OEs4Fb/bC5tjGHxFzxHwahkRRBxeWzlrAczw5FqYjWq+52euazzTVqxXFswqg
	4Nsg==
Received: by 10.14.219.198 with SMTP id m46mr10387606eep.18.1344204405459;
	Sun, 05 Aug 2012 15:06:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.97.141 with HTTP; Sun, 5 Aug 2012 15:06:15 -0700 (PDT)
In-Reply-To: <CABcZANnEmASgH3wrk7TZOpe3BaK+o6oRPyvAo6SadtybgqDWJg@mail.gmail.com>
References: <1343760977-3290-1-git-send-email-raj.khem@gmail.com>
	<1343760977-3290-6-git-send-email-raj.khem@gmail.com>
	<jvk13l$nh$2@dough.gmane.org>
	<CAMKF1sqBGOR=f-e+D8zrguifFbsRzkVLtLsOCf4rxaGKiwPK2Q@mail.gmail.com>
	<jvlm56$r75$1@dough.gmane.org>
	<CABcZANnEmASgH3wrk7TZOpe3BaK+o6oRPyvAo6SadtybgqDWJg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 5 Aug 2012 15:06:15 -0700
Message-ID: <CAMKF1sr8cKuU79Fc9=uXUo0-u8V0vhOg9PGOqb7m8jeBDR4bNw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH V2 6/7] blacklist.bbclass: Move to meta-angstrom
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
X-List-Received-Date: Sun, 05 Aug 2012 22:18:29 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Aug 5, 2012 at 2:37 PM, Chris Larson <clarson@kergoth.com> wrote:
>
> This doesn't make much sense to me. It's impossible to know what all
> layers use a given piece of functionality, particularly ones that
> aren't published in public places, so expecting every person changing
> something in oe-core will go and submit changes to every layer that
> exists is entirely unreasonable. If you maintain a layer, it's your
> responsibility to make sure your layer retains compatibility with
> upstream. It's not upstream's responsibility to make sure everyone
> using their functionality stays compatible.

I would agree in general. In this given case this feature was taken
from meta-oe to begin with
so my point is if you moved it from meta-oe then make sure that its
removed from meta-oe


