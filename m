Received: from [141.2.4.18] (helo=mail.tm.informatik.uni-frankfurt.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <mickey@tm.informatik.uni-frankfurt.de>)
	id 1GbiEl-0004Tn-Mv for openembedded-devel@lists.openembedded.org;
	Sun, 22 Oct 2006 20:39:55 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.tm.informatik.uni-frankfurt.de (Postfix) with ESMTP id F3DA3E37;
	Sun, 22 Oct 2006 20:32:33 +0200 (CEST)
Received: from mail.tm.informatik.uni-frankfurt.de ([127.0.0.1])
	by localhost (mail [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 04691-07; Sun, 22 Oct 2006 20:32:30 +0200 (CEST)
Received: from [141.2.14.64] (gandalf.tm.informatik.uni-frankfurt.de
	[141.2.14.64])
	by mail.tm.informatik.uni-frankfurt.de (Postfix) with ESMTP id 3E10BE35;
	Sun, 22 Oct 2006 20:32:30 +0200 (CEST)
From: Michael 'Mickey' Lauer <mickey@tm.informatik.uni-frankfurt.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1161538860.5545.7.camel@localhost.localdomain>
References: <eh4jbk$29v$1@sea.gmane.org> <eh4kc9$63q$1@sea.gmane.org>
	<1161432655.6643.2.camel@localhost.localdomain>
	<ehemhq$f0s$1@sea.gmane.org>
	<1161538860.5545.7.camel@localhost.localdomain>
Organization: VanilleMedia
Date: Sun, 22 Oct 2006 20:32:29 +0200
Message-Id: <1161541950.1649.248.camel@gandalf.tm.informatik.uni-frankfurt.de>
Mime-Version: 1.0
X-Mailer: Evolution 2.7.2.1-3mdv2007.0 
X-Virus-Scanned: by amavisd-new at tm.informatik.uni-frankfurt.de
Cc: openembedded-devel@openembedded.org
Subject: Re: Bitbake-1.6 crashes on 'which'.
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
X-List-Received-Date: Sun, 22 Oct 2006 18:39:55 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Am Sonntag, den 22.10.2006, 18:41 +0100 schrieb Richard Purdie:
> On Sun, 2006-10-22 at 10:57 +0800, Rob Kramer wrote:
> > Richard Purdie wrote:
> > > The patch in 1.7 is for a different problem. I've just updated the 1.6
> > > branch with the correct fix (add import bb to the top of shell.py).
> > 
> > Thanks for that, it works again now. I still got the crash below, but that
> > was after a bunch of reparse commands, which might have upset bitbake a bit
> > perhaps.
> 
> I can't seem to reproduce that. Can you give a sequence of commands
> which result in the failure?
> 
> Mickey: I suspect this is some problem with the shell's internal state?

I'm afraid so, yes. This will get better in the future with our
frontend/backend separation strategy...

-- 
Regards,

Michael 'Mickey' Lauer | FreeLancer | http://www.Vanille-Media.de




