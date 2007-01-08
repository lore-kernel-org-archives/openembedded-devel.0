Received: from [66.249.92.173] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <mattjreimer@gmail.com>) id 1H3ibh-0003xn-4Z
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Jan 2007 01:43:21 +0100
Received: by ug-out-1314.google.com with SMTP id e2so5684329ugf
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Jan 2007 16:41:45 -0800 (PST)
Received: by 10.78.178.5 with SMTP id a5mr7368536huf.1168216905760;
	Sun, 07 Jan 2007 16:41:45 -0800 (PST)
Received: by 10.78.178.8 with HTTP; Sun, 7 Jan 2007 16:41:45 -0800 (PST)
Message-ID: <f383264b0701071641y4b386b91nc020e2abcadc5813@mail.gmail.com>
Date: Sun, 7 Jan 2007 16:41:45 -0800
From: "Matt Reimer" <mattjreimer@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <45A141DF.40409@dominion.kabel.utwente.nl>
MIME-Version: 1.0
References: <1168195833.5610.46.camel@localhost.localdomain>
	<45A141DF.40409@dominion.kabel.utwente.nl>
Cc: openembedded-devel@openembedded.org
Subject: Re: Bitbake task dependency stamp handling
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
X-List-Received-Date: Mon, 08 Jan 2007 00:43:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 1/7/07, Koen Kooi <koen@dominion.kabel.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Richard Purdie schreef:
> > I had some interesting thoughts regarding tasks and their timestamps.
> > Bitbake's current method of dealing with timestamps walks the task
> > digraph structure which only knows about a single .bb file. The result
> > is if you change an earlier task, say do_patch, later tasks like
> > do_compile would rerun. If you rebuild gtk, the rest of your system
> > linking to gtk doesn't rebuild though.
> >
> > If we move away from the digraph which isn't really needed anymore,
> > taskData has the complete dependency tree available to it and the option
> > of rebuilding the whole system if you recompile gtk becomes possible.
> >
> > At face value this sounds really useful. I'd guess that almost every OE
> > developer would find it insanely annoying in practise though?
>
> Annoying, maybe, correct behaviour, yes. Option for local.conf?

Yes please! FreeBSD's portupgrade has a similar feature where you can
upgrade dependencies or packages that depend on the specified one by
passing -r or -R; also, you can have it prompt you to upgrade a
dependency (rather than just doing it) if you run it in interactive
mode. Perhaps if running "bitbake -i" it could prompt? Of course also
check a local.conf knob as Koen suggests.

Matt


