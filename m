Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1NXZgE-0000f9-2l
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Jan 2010 13:29:05 +0100
Received: (qmail 31699 invoked by uid 1003); 20 Jan 2010 12:26:45 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 20 Jan 2010 12:26:45 -0000
Message-ID: <4B56F684.7050108@balister.org>
Date: Wed, 20 Jan 2010 07:26:44 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.5) Gecko/20091209 Fedora/3.0-3.fc11 Thunderbird/3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4B5676D4.1080106@balister.org>
	<alpine.LFD.2.00.1001200229430.10329@localhost>
In-Reply-To: <alpine.LFD.2.00.1001200229430.10329@localhost>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: gnome-games builds again
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
X-List-Received-Date: Wed, 20 Jan 2010 12:29:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/20/2010 02:30 AM, Robert P. J. Day wrote:
> On Tue, 19 Jan 2010, Philip Balister wrote:
>
>> Henning tracked down a problem in the libsdl sdl.m4 macro and pushed a fix.
>> gnome-games builds on my F11 box now. Still having issues with mkubifs though
>> :)
>
>    whoo hoo!  i can confirm that gnome-games finally builds on my f12
> system.  i'll check the git log to see what fixed it, i'm definitely
> curious as to what it was that allowed it to build on any other distro
> but fedora.

It looked like (from what Henning said) that the sdl.m4 macron ran 
sdl-config from the build machine, so if you installed sdl on the build 
machine you were in trouble.

Philip



>
>    all that's left now is mplayer.
>
> rday
> --
>
> ========================================================================
> Robert P. J. Day                               Waterloo, Ontario, CANADA
>
>              Linux Consulting, Training and Kernel Pedantry.
>
> Web page:                                          http://crashcourse.ca
> Twitter:                                       http://twitter.com/rpjday
> ========================================================================
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


