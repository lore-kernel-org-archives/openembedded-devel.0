Received: from [202.4.237.240] (helo=kirsty.vergenet.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raster@vergenet.net>) id 1L640M-0001IX-1A
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Nov 2008 15:07:34 +0100
Received: by kirsty.vergenet.net (Postfix, from userid 1001)
	id 6ED0724067; Sat, 29 Nov 2008 01:04:24 +1100 (EST)
Date: Sat, 29 Nov 2008 01:04:22 +1100
From: Carsten Haitzler (The Rasterman) <raster@rasterman.com>
To: openembedded-devel@lists.openembedded.org
Message-Id: <20081129010422.ecd2adb6.raster@rasterman.com>
In-Reply-To: <ggonls$p8a$1@ger.gmane.org>
References: <ggonls$p8a$1@ger.gmane.org>
Organization: You expect me to be organized?
X-Mailer: Sylpheed 2.4.8 (GTK+ 2.12.9; i486-pc-linux-gnu)
X-Pants: on
X-Cluestick: Get jiggy with it!
Mime-Version: 1.0
Cc: openembedded-devel@openembedded.org, Koen Kooi <k.kooi@student.utwente.nl>
Subject: Re: Requiring root access for windowmanagers?
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
X-List-Received-Date: Fri, 28 Nov 2008 14:07:36 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 28 Nov 2008 13:20:12 +0100 Koen Kooi <k.kooi@student.utwente.nl>
babbled:

> Hi,
> 
> What's the consensus on requiring root access for running an OE built 
> windowmanager?
> 
> Case in point: e-wm does 'renice -10', which only root is allow to do.
> 
> Proposal: remove the 'renice' so regular users can start a window 
> manager as well.

i did this specifically for performance. basically it makes things MUCH
smoother. the problem is thngs like frameworkd (python blob) in the background
eats a mountainload of cpu slowing startup down, making the system pretty bad
responsiveness-wise etc. i thought about it a bit and went "hey. on devices
the USER is king. the USER should always be obeyed ASAP and as smoothly as
possible". if some system daemon wants to eat cpu - it can take a back seat to
the user being obeyed. so upping e's priority helped immensely. suddenly
animations didn't stutter when launching apps or when background daemons decided
to chug along and eat lots of cpu etc.

as such you either lower the priority of all daemon procs - or raise (reduce
niceness) of the procs you want obeying the user asap.

so unless you have a better way to do this... (a normal user can still run -
the command just fails but the script marches on and you dont get a "less
nice" (higher priority) wm). so as such it wont stop a normal user. they just
lose smoothness.

of course i'm open to suggestions (note i do think you could have a much more
complex system but what i did was really simple and got the task done with no
breakage) :)

-- 
------------- Codito, ergo sum - "I code, therefore I am" --------------
The Rasterman (Carsten Haitzler)    raster@rasterman.com



