Received: from [209.85.132.240] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <kergoth@gmail.com>) id 1IdWRj-0001wW-T0
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Oct 2007 21:33:20 +0200
Received: by an-out-0708.google.com with SMTP id b33so43787ana
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Oct 2007 12:28:00 -0700 (PDT)
Received: by 10.142.246.8 with SMTP id t8mr1050588wfh.1191526078405;
	Thu, 04 Oct 2007 12:27:58 -0700 (PDT)
Received: by 10.142.81.6 with HTTP; Thu, 4 Oct 2007 12:27:58 -0700 (PDT)
Message-ID: <b6ebd0a50710041227q4845a880h377fdd206a796193@mail.gmail.com>
Date: Thu, 4 Oct 2007 12:27:58 -0700
From: "Chris Larson" <clarson@kergoth.com>
Sender: kergoth@gmail.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <47053AC4.5080506@klever.net>
MIME-Version: 1.0
References: <1191494488.2516.34.camel@toontown> <4704CC05.40206@klever.net>
	<B9AD73C2-790F-43EE-9FC4-96F1B1FA9415@selfish.org>
	<1191502502.2516.39.camel@toontown> <4704EAE3.8050702@klever.net>
	<b6ebd0a50710041136o48edfecbm6afd05d9b921d41f@mail.gmail.com>
	<470535D5.8070307@am.sony.com>
	<b6ebd0a50710041157y3bdafafbha82ce0a3b1fbdac6@mail.gmail.com>
	<47053AC4.5080506@klever.net>
X-Google-Sender-Auth: bfc87272a594287b
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
X-List-Received-Date: Thu, 04 Oct 2007 19:33:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 10/4/07, Michael Krelin <hacker@klever.net> wrote:
> > The only difficulty I've seen with it, in hosting my own projects, is
> > interrupted pushes.  An interrupted push seems able to leave behind a
> > stale webdav lock, which has to be manually fixed.. but that's more of
> > a webdav with apache issue than anything else.  Beyond that, you just
> > need to ensure your permissions are correct, and set the config
> > parameter on the repositories to indicate that they're shared, and set
> > a hook script to executable so it can add metadata to the repo on
> > pushes.
>
> Wait, how do you execute a hook when pushing via webdav?

post-update is executed in the remote repository when pushing to it.
In fact, the default post-update script in a new git init'd repository
is just a script that calls git-update-server-info, so all you have to
do is chmod +x foo.git/hooks/post-update and call it a day.  It works
just fine.
-- 
Chris Larson - clarson at kergoth dot com
Dedicated Engineer - MontaVista - clarson at mvista dot com
Core Developer/Architect - TSLib, BitBake, OpenEmbedded, OpenZaurus


