Received: from [207.172.157.102] (helo=smtp02.lnh.mail.rcn.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tmtalpey@rcn.com>) id 1KlOI4-0004nf-Jb
	for openembedded-devel@openembedded.org; Thu, 02 Oct 2008 15:32:24 +0200
Received: from mr02.lnh.mail.rcn.net ([207.172.157.22])
	by smtp02.lnh.mail.rcn.net with ESMTP; 02 Oct 2008 09:28:12 -0400
Received: from smtp01.lnh.mail.rcn.net (smtp01.lnh.mail.rcn.net [207.172.4.11])
	by mr02.lnh.mail.rcn.net (MOS 3.8.6-GA) with ESMTP id PCO87170;
	Thu, 2 Oct 2008 09:28:12 -0400 (EDT)
Message-Id: <77ts5u$jhr010@smtp01.lnh.mail.rcn.net>
Received: from unknown (HELO tmt.rcn.com) ([216.240.30.23])
	by smtp01.lnh.mail.rcn.net with ESMTP; 02 Oct 2008 09:28:12 -0400
X-Mailer: QUALCOMM Windows Eudora Version 7.1.0.9
Date: Thu, 02 Oct 2008 09:27:51 -0400
To: openembedded-devel@lists.openembedded.org
From: Tom Talpey <tmtalpey@rcn.com>
In-Reply-To: <48E42F7E.3040802@balister.org>
References: <48DCF3ED.1060809@gmx.net> <gbjhln$8nr$1@ger.gmane.org>
	<gc0eck$64q$1@ger.gmane.org>
	<77ts5u$jhlo1v@smtp01.lnh.mail.rcn.net>
	<48E42F7E.3040802@balister.org>
Mime-Version: 1.0
X-Junkmail-Whitelist: YES (by domain whitelist at mr02.lnh.mail.rcn.net)
Subject: Re: Another low-hanging fruit: aisleriot
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
X-List-Received-Date: Thu, 02 Oct 2008 13:32:24 -0000
Content-Type: text/plain; charset="us-ascii"

At 10:18 PM 10/1/2008, Philip Balister wrote:
>Tom Talpey wrote:
>> I broke out the individual games as packages, and (I think) have most of
>> the rdepends down too. How would I send my recipe for comments, just
>> post it on this list?
>
>Please add the recipe to bugs.openembedded.org (typed from memory) and I 
>will try and commit it, provided it worlks for me :)

Ok, will do, soon. You probably want to check my work. :-)

I did have to patch the m4's in both gnome-games and ggz, because they
insisted on adding "/usr" and "/usr/local" (no $prefix/$eprefix) to various
include and library paths. These in turn silently broke the builds, as they
cause cross-compile warnings from gcc. There didn't appear to be a way
to override them, so I added a patch.

Also, the apps create multiple desktop icon families, and install them in
various places that matchbox doesn't look. I arbitrarily chose the 48x48
one to install for matchbox. If there are other ways to do this, I'm all
ears.

There are still a couple of icons missing, the "scores" menu item gets a
red X for instance. I haven't found where those might be installed from.
They appear to be harmless.

I'll put some text in the submit comments.

Tom.



