Received: from [64.235.106.9] (helo=astoria.ccjclearline.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1N8z3M-00052V-EG
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Nov 2009 17:31:19 +0100
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1N8z24-00016W-5F for openembedded-devel@lists.openembedded.org;
	Fri, 13 Nov 2009 11:29:56 -0500
Date: Fri, 13 Nov 2009 11:29:46 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1258129007.5799.73.camel@dax.rpnet.com>
Message-ID: <alpine.LFD.2.00.0911131129020.5980@localhost>
References: <alpine.LFD.2.00.0911130443520.1157@localhost>
	<4AFD4DD6.70509@balister.org>
	<alpine.LFD.2.00.0911130732220.17745@localhost>
	<4AFD5440.6080202@balister.org>
	<1258129007.5799.73.camel@dax.rpnet.com>
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
Subject: Re: build breakage: python-native-2.6.1
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
X-List-Received-Date: Fri, 13 Nov 2009 16:31:19 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Fri, 13 Nov 2009, Richard Purdie wrote:

> Can someone with this problem please run a python-native build with
> http://tim.rpsys.net/python-debug.patch applied?
>
> There should be some debug at the end of the do_compile log afterwards.
> I see:
>
> Looking in ncursesw for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '/usr/local/lib', '.', '/lib64', '/usr/lib64', '/lib', '/usr/lib']
> Looking in ncurses for ['/media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib', '/usr/local/lib', '.', '/lib64', '/usr/lib64', '/lib', '/usr/lib']
> Found /media/build1/builds/oe/angstrom/tmp/staging/x86_64-linux/usr/lib/libncurses.so
>
> and I'm guessing it finds ncursesw in /lib/lib64 for some people.
>
> I also see some other worrying entries on my system :(

  do you still want this tested given the earlier posting about how
this was fixed with that readline tweak?

rday
--

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


