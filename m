Received: from [209.85.198.184] (helo=rv-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <raj.khem@gmail.com>) id 1II7ct-0005q7-I7
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Aug 2007 20:48:23 +0200
Received: by rv-out-0910.google.com with SMTP id c24so1094402rvf
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Aug 2007 11:45:56 -0700 (PDT)
Received: by 10.115.18.1 with SMTP id v1mr5937773wai.1186425956276;
	Mon, 06 Aug 2007 11:45:56 -0700 (PDT)
Received: by 10.114.208.14 with HTTP; Mon, 6 Aug 2007 11:45:56 -0700 (PDT)
Message-ID: <19c1b8a90708061145k3d0edfbdm8eff09ed3452baf0@mail.gmail.com>
Date: Mon, 6 Aug 2007 11:45:56 -0700
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1632090386.20070806172009@vanille-media.de>
MIME-Version: 1.0
References: <46A8B354.1010204@dominion.kabel.utwente.nl>
	<46B6CD51.7030405@dominion.kabel.utwente.nl>
	<1632090386.20070806172009@vanille-media.de>
Subject: Re: [RFC] use packages/linux/linux-ezx-2.6.21/update_patches.sh for openmoko kernels
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Aug 2007 18:48:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 8/6/07, Dr. Michael Lauer <mickey@vanille-media.de> wrote:
> Koen Kooi wrote:
> > Koen Kooi schreef:
> >> Hi,
> >>
> >> Currently openmoko kernel pull patches from svn and manually apply them with quilt. We've
> >> seen numerous breakages in the past with this method, so I would like to suggest using
> >> something like update_patches.sh to pull a patchset from svn, add them to OE and
> >> automagically write out a SRC_URI.
> >>
> >> This would have the following benefits:
> >>
> >> 1) patches don't suddenly change
> >> 2) less breakage due to typos in commits upstream
> >> 3) less work than continuously checking if recipe and svn patchset match
> >> 4) less surprises when using a global SRCDATE
> >>
> >> And since it's a script, it's not more work than the status quo.
> >>
> >> what do you think?

I think the idea is ok for stability reasons however  in my past
experience such approach added this extra step of syncing the patches
and it easily got stale and did not work very well.

So I would still suggest to have the existing approach if its not too
much a blocker in development.

My 2 cents

-Khem


