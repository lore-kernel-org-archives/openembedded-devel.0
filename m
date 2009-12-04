Received: from libra.cs.put.poznan.pl ([150.254.30.30])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <przemyslaw.wesolek@cs.put.poznan.pl>)
	id 1NGYng-0003Wa-9h for openembedded-devel@lists.openembedded.org;
	Fri, 04 Dec 2009 15:06:27 +0100
Received: from kas30pipe.localhost (unknown [127.0.0.1])
	by libra.cs.put.poznan.pl (Postfix on VMS) with ESMTP id 0BDF987
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Dec 2009 14:04:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cs.put.poznan.pl
Received: from libra.cs.put.poznan.pl ([127.0.0.1])
	by localhost (libra.cs.put.poznan.pl [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id FxpYYpbcBxFb
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Dec 2009 15:04:34 +0100 (CET)
Received: from [150.254.31.31] (idss-pw.cs.put.poznan.pl [150.254.31.31])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by libra.cs.put.poznan.pl (Postfix on VMS) with ESMTP id 7EAAA82
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Dec 2009 15:04:34 +0100 (CET)
Message-ID: <4B1916FD.7080905@cs.put.poznan.pl>
Date: Fri, 04 Dec 2009 15:04:45 +0100
From: Przemyslaw Wesolek <przemyslaw.wesolek@cs.put.poznan.pl>
Organization: Poznan University of Technology
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1986479129.867281259879607562.JavaMail.root@sz0029a.westchester.pa.mail.comcast.net>
In-Reply-To: <1986479129.867281259879607562.JavaMail.root@sz0029a.westchester.pa.mail.comcast.net>
X-Enigmail-Version: 0.96.0
X-SpamTest-Version: SMTP-Filter Version 3.0.0 [0278], KAS30/Release
X-SpamTest-Info: Not protected
X-SA-Exim-Connect-IP: 150.254.30.30
X-SA-Exim-Mail-From: przemyslaw.wesolek@cs.put.poznan.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: minimal xwindows
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
X-List-Received-Date: Fri, 04 Dec 2009 14:06:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

John Buckley wrote:
> I would like to keep the build intact since it contains all the
> components and libraries I need.  However, I would like to strip the
> XWindows boot-up so that only my Xwindow application runs for now so
> I can see if there are any significant performance improvements in my
> video streaming.
> 
> Does anyone know how I can prevent the GPE from starting?  And, how I
> can launch my GTK+/Xwindows application on bootup.

Startup of application happens as a result of running scripts in
/etc/rcX.d dirs which are links to /etc/init.d. To stop program loading,
simply remove the appropriate links, preferably with update-rc.d.

GPE login screen is loaded from gpe-dm script.

Similarly, to run a program on boot time, just add a script for it in
/etc/init.d and link to it in /etc/rcX.d. Take a look on existing
scripts on how to implement "start", "stop", etc. modes.

Przemek



