Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1NUSeS-0005I0-F5
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jan 2010 23:22:23 +0100
Received: from cpe00142a336e11-cm001ac318e826.cpe.net.cable.rogers.com
	([174.113.191.234] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1NUScL-0002qK-Vg for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jan 2010 17:20:10 -0500
Date: Mon, 11 Jan 2010 17:19:23 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <6ec4247d1001111337x5a5572a2l74d23bf1bfa03a68@mail.gmail.com>
Message-ID: <alpine.LFD.2.00.1001111718250.2601@localhost>
References: <alpine.LFD.2.00.1001110722550.22930@localhost>
	<4B4B2B0E.8030501@balister.org>
	<alpine.LFD.2.00.1001110856460.28813@localhost>
	<4B4B3301.2090808@balister.org>
	<6ec4247d1001111337x5a5572a2l74d23bf1bfa03a68@mail.gmail.com>
User-Agent: Alpine 2.00 (LFD 1167 2008-08-23)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SA-Exim-Connect-IP: 64.235.106.9
X-SA-Exim-Mail-From: rpjday@crashcourse.ca
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: bitbake and e2fsprogs-1.41.9?
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
X-List-Received-Date: Mon, 11 Jan 2010 22:22:24 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Tue, 12 Jan 2010, Graham Gower wrote:

> Yes, there is a build issue with e2fsprogs 1.41.5. I experienced it
> on a slackware64-13.0 host. It is not a Fedora issue, it is a bug in
> the Makefile. If you look in the Makefile you will see that the
> e2fsck dependency resolves to something containing "-lpthread".
>
> Why this doesn't cause issues for anyone else is beyond me. I can't
> even do a native, out of oe, build of e2fsprogs 1.41.5.

  thank you immensely for clarifying that, now i can stop fighting
with it.  is someone already working on upgrading e2fsprogs to 1.41.9?

rday
--

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


