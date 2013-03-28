Received: from mail-oa0-f47.google.com ([209.85.219.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.betafive@gmail.com>) id 1ULDa9-0006KU-Nv
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Mar 2013 15:13:38 +0100
Received: by mail-oa0-f47.google.com with SMTP id o17so10129254oag.34
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Mar 2013 06:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=htaOh/Ls7vf4LkSKxWDxQczL6rAx3Odc3R7CofEk4y4=;
	b=AGySXGihIHz1YhMWRoEQEqxOxFWVfNo/xS5jQDrMIWtYjaX49/z/Eo1w6arT+VBcF2
	xWV1GaQlLrqinu3NJUgfxsgG+XaQ4rfT59QH07BLs3L5o9k1QPRFwkOlgv7Vp+F8H+T5
	ltpYp6jQ7ycyUpiP/7PuDqoq3LHXVf9qzcchmOu8QsTFjOIl+R7B4CTXndNbnnn0sQc8
	pVpmKmnCy3ze+l7OUv3bLZT8wIdBM4H/OwnaE5RhL4r5eI+TVHclW8IcRf/Q+xAKPjDa
	RcpdiCmz+Tck2b7M1eSCOdTb08QUgTdHDbXQrkfvrp/msN1qHXEhkR4R5rK8cq9e5jey
	zAAQ==
MIME-Version: 1.0
X-Received: by 10.60.11.8 with SMTP id m8mr17318001oeb.22.1364478973732; Thu,
	28 Mar 2013 06:56:13 -0700 (PDT)
Sender: paul.betafive@gmail.com
Received: by 10.76.154.4 with HTTP; Thu, 28 Mar 2013 06:56:13 -0700 (PDT)
In-Reply-To: <11972732.k3n4Vx4bzS@helios>
References: <1364469370-12082-1-git-send-email-paul@paulbarker.me.uk>
	<11972732.k3n4Vx4bzS@helios>
Date: Thu, 28 Mar 2013 13:56:13 +0000
X-Google-Sender-Auth: wEfpo9nSZnfa56Stw0oeHKkoV9o
Message-ID: <CANyK_8eJ6Y5V_=rD-n9CBBwckmkVwJJao8WUQrVetcmPzDw_fg@mail.gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][TEMP PATCH] gd: Temporary patch while libgd.org is down, do not commit to main repository!
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
X-List-Received-Date: Thu, 28 Mar 2013 14:13:53 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 28 March 2013 13:34, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
>
> On Thursday 28 March 2013 11:16:10 Paul Barker wrote:
> > This is just a temporary patch to change the SRC_URI for gd as the upstream
> > source libgd.org has been down for a week or so now. The MD5 and SHA256 sums
> > match so this should be the exact same archive. It is not intended to go in
> > the main repository but may be useful to some of you until libgd.org is
> > back up.
>
> This is what we have MIRRORS for - perhaps we could add an entry to MIRRORS to
> handle this?

I just went for a quick and dirty fix as I'm not very experienced with
bitbake recipes yet. Would this be added to mirrors.bbclass directly
or should I add a MIRRORS += line to the gd recipe?

(Apologies, missed reply-all the first time)

Thanks,

--
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk


