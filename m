Received: from [64.233.184.229] (helo=wr-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <kergoth@gmail.com>) id 1IdVyE-0005en-V7
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Oct 2007 21:02:51 +0200
Received: by wr-out-0506.google.com with SMTP id c46so226189wra
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Oct 2007 11:57:31 -0700 (PDT)
Received: by 10.142.98.18 with SMTP id v18mr2065399wfb.1191524248487;
	Thu, 04 Oct 2007 11:57:28 -0700 (PDT)
Received: by 10.142.81.6 with HTTP; Thu, 4 Oct 2007 11:57:28 -0700 (PDT)
Message-ID: <b6ebd0a50710041157y3bdafafbha82ce0a3b1fbdac6@mail.gmail.com>
Date: Thu, 4 Oct 2007 11:57:28 -0700
From: "Chris Larson" <clarson@kergoth.com>
Sender: kergoth@gmail.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <470535D5.8070307@am.sony.com>
MIME-Version: 1.0
References: <1191494488.2516.34.camel@toontown> <4704CC05.40206@klever.net>
	<B9AD73C2-790F-43EE-9FC4-96F1B1FA9415@selfish.org>
	<1191502502.2516.39.camel@toontown> <4704EAE3.8050702@klever.net>
	<b6ebd0a50710041136o48edfecbm6afd05d9b921d41f@mail.gmail.com>
	<470535D5.8070307@am.sony.com>
X-Google-Sender-Auth: 4f6f5c16d235c26a
Subject: Re: monotone/git (was hello...)
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
X-List-Received-Date: Thu, 04 Oct 2007 19:02:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 10/4/07, Tim Bird <tim.bird@am.sony.com> wrote:
> Chris Larson wrote:
> > On 10/4/07, Michael Krelin <hacker@klever.net> wrote:
> >>> Well luckily I am not an ignorant git-fanboy :) Could you shortly point
> >>> out to me the reasons why you think monotone is favorable over git for
> >>> use with openembedded ? I will admit right away that my limitation with
> >>> SCMs in large projects is more than limited. So i can only speak of
> >>> my user experience with git vs my experience with monotone and i prefer
> >>> the first.
> >> Well, 1st - OE folks are used to monotone now. That's primary reason.
> >> The second primary reason is that I know of some developers who seem to
> >> dislike git. And if we're talking about technical reason, one I can
> >> think of is that there's no non-ssh transport allowing push, which
> >> complicates administration of our "central" repository.
> >
> > That's not correct.  You can push to a git repository over http/webdav
> > to an apache2 server.
>
> Theoretically.  My experience is that it often fails, at least with
> the kernel.  But maybe this is just a git-tree maintenance issue for
> the kernel devs.  Chris is correct, however, that the feature is
> present in git.

The only difficulty I've seen with it, in hosting my own projects, is
interrupted pushes.  An interrupted push seems able to leave behind a
stale webdav lock, which has to be manually fixed.. but that's more of
a webdav with apache issue than anything else.  Beyond that, you just
need to ensure your permissions are correct, and set the config
parameter on the repositories to indicate that they're shared, and set
a hook script to executable so it can add metadata to the repo on
pushes.

Course, that said, I'd much rather see a git-daemon with push capability :)
-- 
Chris Larson - clarson at kergoth dot com
Dedicated Engineer - MontaVista - clarson at mvista dot com
Core Developer/Architect - TSLib, BitBake, OpenEmbedded, OpenZaurus


