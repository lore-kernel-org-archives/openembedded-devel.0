Received: from [72.29.79.205] (helo=rhodos.klever.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <hacker@klever.net>) id 1IdXmn-0007Sj-Hf
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Oct 2007 22:59:09 +0200
Received: from pd953ad30.dip0.t-ipconnect.de ([217.83.173.48]
	helo=olympus.klever.net)
	by rhodos.klever.net with esmtpsa (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.67) (envelope-from <hacker@klever.net>) id 1IdXhc-0000NP-Mo
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Oct 2007 22:53:49 +0200
Message-ID: <470552D8.30003@klever.net>
Date: Thu, 04 Oct 2007 22:53:44 +0200
From: Michael Krelin <hacker@klever.net>
User-Agent: Thunderbird 2.0.0.6 (X11/20070815)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1191494488.2516.34.camel@toontown>	<B9AD73C2-790F-43EE-9FC4-96F1B1FA9415@selfish.org>	<1191502502.2516.39.camel@toontown>
	<4704EAE3.8050702@klever.net>	<b6ebd0a50710041136o48edfecbm6afd05d9b921d41f@mail.gmail.com>	<470535D5.8070307@am.sony.com>	<b6ebd0a50710041157y3bdafafbha82ce0a3b1fbdac6@mail.gmail.com>	<47053AC4.5080506@klever.net>	<b6ebd0a50710041227q4845a880h377fdd206a796193@mail.gmail.com>	<4705418A.8030907@klever.net>
	<b6ebd0a50710041318q74838eeesdb7dcf055548e52a@mail.gmail.com>
In-Reply-To: <b6ebd0a50710041318q74838eeesdb7dcf055548e52a@mail.gmail.com>
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
X-List-Received-Date: Thu, 04 Oct 2007 20:59:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

>> \>> Wait, how do you execute a hook when pushing via webdav?
>>> post-update is executed in the remote repository when pushing to it.
>>> In fact, the default post-update script in a new git init'd repository
>>> is just a script that calls git-update-server-info, so all you have to
>>> do is chmod +x foo.git/hooks/post-update and call it a day.  It works
>>> just fine.
>> *Who* executes post-update script when you push to remote repository via
>> webdav?
> 
> Sorry, my mistake on the mechanisms.  The hook is only used,
> obviously, when pushing over ssh, since you can't run a script
> remotely over http.  It's just that git-http-push is smart enough to
> update the remote info/* if the files already exist (run
> git-update-server-info on the remote side once).

Good for the record, after we sorted it out on IRC. So, yes, it's 
theoretically possible, we'd all want to avoid it and I have no idea 
about its performance, which would probably need more elaborate 
research. I doubt, though, that onyone wants to conduct such a research 
at the moment ;-)

Love,
H


