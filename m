Received: from [212.60.202.196] (helo=mail.kernelconcepts.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1MqoSN-0007ks-Hf
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Sep 2009 15:34:02 +0200
Received: from [192.168.2.131] by mail.kernelconcepts.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1MqoSb-0007mf-V9
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Sep 2009 15:34:13 +0200
Message-ID: <4ABB7523.3050409@kernelconcepts.de>
Date: Thu, 24 Sep 2009 15:33:23 +0200
From: Florian Boor <florian.boor@kernelconcepts.de>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1253741018.5229.23.camel@utx.utx.cz>
In-Reply-To: <1253741018.5229.23.camel@utx.utx.cz>
X-Enigmail-Version: 0.95.7
X-SA-Exim-Connect-IP: 212.60.202.196
X-SA-Exim-Mail-From: florian.boor@kernelconcepts.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: functional Matchbox2 in oe.dev
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
X-List-Received-Date: Thu, 24 Sep 2009 13:34:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi!

Stanislav Brabec schrieb:
> I just spent some time to make Matchbox2 working, as I considered is as
> possible optimal solution for minimalistic GTK+/GPE based environment.

This is a very good idea.

> Resipes are now available in oe.dev. Just call bitbake matchbox2,
> install and and enjoy. Read /etc/matchbox2/defaults and customize the
> session script. And feel free to improve recipes.

Very good - we should update all related recipes to make use of it. If we need
to do any changes in GPE in order to make it compatible with the Matchbox2 stuff
 please let me know.

> There were several crashes, that made it unusable, and problems with the
> icon theme. There is still a lot of things to do, but the code base is
> now usable for the daily work.
> 
> The Matchbox2 code is almost minimalistic and easy to understand. But it
> seems that upstream is recently almost dead (no response for submitted
> patches, no activity in SVN for several months), so all fixes are now
> added to OE as patches.

I am not sure if I would like to maintain it for a longer time, but if it turns
out that upstream is really dead I would suggest to create a project (at
linuxtogo.org I would suggest, but any other would be fine too). This could help
to keep it up to date and maybe involve interested community members.

> Benefits over Matchbox1:
> - The whole panel is just one process.
> - Application launcher should not generate 10 wake-ups per second.
> - Based on standard GTK+ widgets, shares look and feel with GPE.
> - Capable to share the same area for window title and panel (however the
>   way, where window is border-less and the panel contains window
>   operations applet {as some eee distros have} looks more smart).
> - Panel and window manager handles XRandR well (not yet the desktop).
> - Better handles new .desktop icon specification.

I agree on all of these points.

Greetings

Florian

-- 
The dream of yesterday                  Florian Boor
is the hope of today                    Tel: +49 271-771091-15
and the reality of tomorrow.            Fax: +49 271-771091-19
[Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de
                                        http://www.kernelconcepts.de/en


