Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <thommycheck@gmx.de>) id 1Krsqh-000739-Hz
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Oct 2008 13:22:59 +0200
Received: (qmail invoked by alias); 20 Oct 2008 11:22:40 -0000
Received: from BAA39f8.baa.pppool.de (EHLO [192.168.178.38]) [77.128.57.248]
	by mail.gmx.net (mp038) with SMTP; 20 Oct 2008 13:22:40 +0200
X-Authenticated: #2218979
X-Provags-ID: V01U2FsdGVkX19TnVx83xlTYRbshU1HJZUELaNQZlOuse4XK6bYKV
	cEz5HdomJarOXF
Message-ID: <48FC69FE.2020300@gmx.de>
Date: Mon, 20 Oct 2008 13:22:38 +0200
From: Thomas Kunze <thommycheck@gmx.de>
User-Agent: Mozilla-Thunderbird 2.0.0.16 (X11/20080724)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <gdfm8d$apg$1@ger.gmane.org>	<200810191847.04533.mickey@vanille-media.de>	<1224438415.4235.266.camel@lenovo.internal.reciva.com>	<200810200002.25673.mickey@vanille-media.de>
	<1224488828.4235.278.camel@lenovo.internal.reciva.com>
In-Reply-To: <1224488828.4235.278.camel@lenovo.internal.reciva.com>
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.57
Subject: Re: busybox recipe isappearances
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
X-List-Received-Date: Mon, 20 Oct 2008 11:22:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Phil Blundell wrote:
> On Mon, 2008-10-20 at 00:02 +0200, Michael 'Mickey' Lauer wrote:
>   
>> Am Sunday 19 October 2008 19:46:55 schrieb Phil Blundell:
>>     
>>> It's long been my view that we should just add newer ones and leave the
>>> old ones alone.  There's really no reason to delete old recipes and,
>>> even if you check for PREFERRED_VERSIONs in the git tree, there is no
>>> real way to know who else might be relying on the version you are about
>>> to delete.
>>>       
>> That's true, however I always feel the urge of cleaning up when I see dozens 
>> or recipes for the same software [besides the amount of increased parsing 
>> efforts if we really were to keep everything). I'd rather have the rough 
>> guideline of keeping major (trusted) releases. At the end of the day, 
>> everything is in the archives.
>>     
>
> If parsing time were to become a big issue then one could imagine ways
> to solve that in bitbake.  For example, one could arrange for a command
> like "bitbake --disregard-old-versions" to parse all the files once,
> identify those versions which are older than the PREFERRED ones (whether
> set explicitly or automatically), and blacklist these old versions so
> that they are never parsed again.  The effect would be a bit like having
> an automatically-maintained BBMASK though of course the implementation
> would probably be slightly different.
>
> As for old versions being in the archives, that's true, but it seems
> like one could easily get into a kind of ping-pong thing where you
> delete an old version, I pull it out of the archives again, someone else
> now notices this "old cruft" and deletes it again, and so on.  I can
> imagine that being frustrating for all parties.
>   
This could be avoided if both parties would read the commit messages ;)
> p.
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>   



