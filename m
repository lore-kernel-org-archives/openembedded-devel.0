Received: from [64.233.162.232] (helo=nz-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <kergoth@gmail.com>) id 1IdXEH-00071M-0l
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Oct 2007 22:23:29 +0200
Received: by nz-out-0506.google.com with SMTP id i11so252882nzh
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Oct 2007 13:18:08 -0700 (PDT)
Received: by 10.142.141.5 with SMTP id o5mr2634856wfd.1191529088128;
	Thu, 04 Oct 2007 13:18:08 -0700 (PDT)
Received: by 10.142.81.6 with HTTP; Thu, 4 Oct 2007 13:18:08 -0700 (PDT)
Message-ID: <b6ebd0a50710041318q74838eeesdb7dcf055548e52a@mail.gmail.com>
Date: Thu, 4 Oct 2007 13:18:08 -0700
From: "Chris Larson" <clarson@kergoth.com>
Sender: kergoth@gmail.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4705418A.8030907@klever.net>
MIME-Version: 1.0
References: <1191494488.2516.34.camel@toontown>
	<B9AD73C2-790F-43EE-9FC4-96F1B1FA9415@selfish.org>
	<1191502502.2516.39.camel@toontown> <4704EAE3.8050702@klever.net>
	<b6ebd0a50710041136o48edfecbm6afd05d9b921d41f@mail.gmail.com>
	<470535D5.8070307@am.sony.com>
	<b6ebd0a50710041157y3bdafafbha82ce0a3b1fbdac6@mail.gmail.com>
	<47053AC4.5080506@klever.net>
	<b6ebd0a50710041227q4845a880h377fdd206a796193@mail.gmail.com>
	<4705418A.8030907@klever.net>
X-Google-Sender-Auth: ff597b3c0c0b409c
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
X-List-Received-Date: Thu, 04 Oct 2007 20:23:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 10/4/07, Michael Krelin <hacker@klever.net> wrote:
> \>> Wait, how do you execute a hook when pushing via webdav?
> >
> > post-update is executed in the remote repository when pushing to it.
> > In fact, the default post-update script in a new git init'd repository
> > is just a script that calls git-update-server-info, so all you have to
> > do is chmod +x foo.git/hooks/post-update and call it a day.  It works
> > just fine.
>
> *Who* executes post-update script when you push to remote repository via
> webdav?

Sorry, my mistake on the mechanisms.  The hook is only used,
obviously, when pushing over ssh, since you can't run a script
remotely over http.  It's just that git-http-push is smart enough to
update the remote info/* if the files already exist (run
git-update-server-info on the remote side once).
-- 
Chris Larson - clarson at kergoth dot com
Dedicated Engineer - MontaVista - clarson at mvista dot com
Core Developer/Architect - TSLib, BitBake, OpenEmbedded, OpenZaurus


