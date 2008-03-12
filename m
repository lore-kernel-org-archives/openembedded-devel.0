Received: from [209.85.132.243] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1JZXZ1-0001ec-8h
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Mar 2008 21:28:41 +0100
Received: by an-out-0708.google.com with SMTP id b33so697546ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Mar 2008 13:26:31 -0700 (PDT)
Received: by 10.100.37.20 with SMTP id k20mr17138196ank.36.1205353591024;
	Wed, 12 Mar 2008 13:26:31 -0700 (PDT)
Received: by 10.100.190.7 with HTTP; Wed, 12 Mar 2008 13:26:30 -0700 (PDT)
Message-ID: <c384c5ea0803121326r631bf595v72126de8c7905835@mail.gmail.com>
Date: Wed, 12 Mar 2008 21:26:30 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <fr997r$aat$1@ger.gmane.org>
MIME-Version: 1.0
References: <200803110807.11368.zecke@selfish.org>
	<20080311114938.GM30267@ibawizard.net>
	<f96d234e0803110712t6d88dfc6t521fdf39081e2c76@mail.gmail.com>
	<20080311145739.GN30267@ibawizard.net>
	<1205250588.4521.111.camel@dax.rpnet.com>
	<20080312014945.4783ae6a@widy.localdomain>
	<1205280598.16531.26.camel@dax.rpnet.com>
	<20080312024408.44d9192e@widy.localdomain>
	<c384c5ea0803121138r4bf89729t18c530b67e80c107@mail.gmail.com>
	<fr997r$aat$1@ger.gmane.org>
X-SA-Exim-Connect-IP: 209.85.132.243
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Reconsidering the work flow and how the SCM system fits in
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
X-List-Received-Date: Wed, 12 Mar 2008 20:28:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello Koen, all,

On Wed, Mar 12, 2008 at 8:00 PM, Koen Kooi
<koen@dominion.kabel.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
>  | http://lists.freedesktop.org/archives/cairo/2006-February/006255.html
>  |
>  | His arguments on the (main two) differences strongly favors me to move
>  | to GIT, not HG.
>
>  Actually it shows that hg fits better into the OE way of using a DSCM:
>  central repo (and mirrors) with distributed developers.
>
Quoting Carl: "Namely, it [hg] appears to force a more centralized,
(or at least, a more strictly hierarchical), model on the development
process, while git allows a more fully distributed model making it
easier for users to pull (even speculatively with "fetch") from
multiple sources, track them in the local repository as separate
branches and merge when appropriate."

Carl carefully uses the words "force" and "allows". Git does not
preclude a central model, whilst still allowing more centralized
development.

And the centralized way we work currently is also DUE to us using mtn,
i.e. it forces us more or less to work this way.
Is that the desired way? Yes, for us it might be. For 3rd party
vendors it might not be. They might want to run their own GIT repo,
but keep pulling from OE (or vice versa).

My view at the desired model:
- central repository with mirrors
- lightweight branches for the active developers so that intrusive
changes can be worked on in parallel, but shared fashion.
- easy push/pull/cherrypick from cloned repositories branches, given
that we might see more and more vendors stepping into the OE
bandwagon.

Some thoughts:
- Why wouldn't the kernel model work for us? There is one upstream
tree and distributed developers.
- Suppose we were using GIT today, would we consider going to HG or MTN?
- Suppose we were using HG today, would we consider going to GIT or MTN?

Proposal: Can we work with MTN and GIT, or MTN and HG in parallel?
I.e. each developer has to do everything DOUBLE, has two checkouts
against two SCM systems, and then learn in practise what works best?
:-)


Regards,
-- 
Leon


