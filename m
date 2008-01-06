Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1JBZBt-00035C-NR
	for openembedded-devel@openembedded.org; Sun, 06 Jan 2008 18:21:44 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m06HEpv8005714;
	Sun, 6 Jan 2008 17:14:51 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05650-01; Sun,  6 Jan 2008 17:14:47 +0000 (GMT)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m06HEia3005707
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Sun, 6 Jan 2008 17:14:44 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <751916312.20080103125213@gmail.com>
References: <477B8BCC.5080300@gmx.net>  <751916312.20080103125213@gmail.com>
Date: Sun, 06 Jan 2008 17:14:44 +0000
Message-Id: <1199639684.4658.22.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Robert Schuster <theBohemian@gmx.net>
Subject: Re: custom debian package names and fully customized package	names
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
X-List-Received-Date: Sun, 06 Jan 2008 17:21:51 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2008-01-03 at 12:52 +0200, Paul Sokolovsky wrote:
> Wednesday, January 2, 2008, 3:04:12 PM, you wrote:
> > I have found a simple solution for allowing one to customize the Debian
> > package names:
> 
> > http://bugs.openembedded.org/show_bug.cgi?id=3383
> 
> > Please have a look at it and tell me whether you want it like this.
> 
> > This patch is primarily meant to make custom python code to fix wrong
> > guessing of the Debian renamer unnecessary.

Something like the above is ok with me.

> > I have another patch that allows fully customized package names. This
> > efforts may be useless from a distro building POV but is IMHO vital for
> > all those who want to use OE to build packages for a non-OE distro.
> 
> > http://bugs.openembedded.org/show_bug.cgi?id=3590
> 
> > Comments on both enhancements are welcomed!
> 
>   Ideas look good for me. Wouldn't solution from #3590 supercede one
> from #3383? (If the tasks were given appropriate order.)

I don't think this is needed, you can do this with overrides already.
I've commented on the bug accordingly.

Cheers,

Richard



