Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1L6Wqy-0000bC-S5
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Nov 2008 21:55:49 +0100
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 454C31405337;
	Sat, 29 Nov 2008 21:49:22 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hIlJ-UzYkJxU; Sat, 29 Nov 2008 21:49:22 +0100 (CET)
Received: from zaurus (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7])
	by ns.penguin.cz (Postfix) with ESMTP id E470F1405326;
	Sat, 29 Nov 2008 21:49:20 +0100 (CET)
Date: Sat, 29 Nov 2008 21:52:47 +0100
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20081129215247.52c40a2b@zaurus>
In-Reply-To: <20081129010422.ecd2adb6.raster@rasterman.com>
References: <ggonls$p8a$1@ger.gmane.org>
	<20081129010422.ecd2adb6.raster@rasterman.com>
X-Mailer: Claws Mail 3.6.1 (GTK+ 2.14.2; arm-angstrom-linux-gnueabi)
Mime-Version: 1.0
Cc: Koen Kooi <k.kooi@student.utwente.nl>
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
X-List-Received-Date: Sat, 29 Nov 2008 20:55:50 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Sat, 29 Nov 2008 01:04:22 +1100
Carsten Haitzler (The Rasterman) wrote:

> On Fri, 28 Nov 2008 13:20:12 +0100 Koen Kooi
> <k.kooi@student.utwente.nl> babbled:

> > What's the consensus on requiring root access for running an OE
> > built windowmanager?
> > 
> > Case in point: e-wm does 'renice -10', which only root is allow to
> > do.
> > 
> > Proposal: remove the 'renice' so regular users can start a window 
> > manager as well.
> 
> i did this specifically for performance. basically it makes things
> MUCH smoother.

I understand your trick - I do the same with video player if I want to
compile in parallel with DVD playback.

Running WM as root would increase any security hole to root access flaw.
I can see cleaner solutions:

1. Write a small SUID wrapper. Change priority, drop permissions, run
window manager.

2. Run WM as root and drop privileges after setting priority.

3. Use capabilities and enable CAP_SYS_NICE.

4. And finally, the best solution may be a different kernel scheduler.
But I don't follow the development there, so I don't know, whether
there is possible to find a good solution: "This process does not eat a
much CPU time, but it wants fast processing".

-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus


