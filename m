Received: from [141.2.4.18] (helo=mail.tm.informatik.uni-frankfurt.de)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <mickey@tm.informatik.uni-frankfurt.de>)
	id 1GKEhh-00045d-1Z for openembedded-devel@lists.openembedded.org;
	Mon, 04 Sep 2006 15:41:33 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.tm.informatik.uni-frankfurt.de (Postfix) with ESMTP id 2D4EC8EF
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Sep 2006 15:38:54 +0200 (CEST)
Received: from mail.tm.informatik.uni-frankfurt.de ([127.0.0.1])
	by localhost (mail [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 24093-07 for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Sep 2006 15:38:49 +0200 (CEST)
Received: from [141.2.14.64] (gandalf.tm.informatik.uni-frankfurt.de
	[141.2.14.64])
	by mail.tm.informatik.uni-frankfurt.de (Postfix) with ESMTP id DFBA98ED
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Sep 2006 15:38:49 +0200 (CEST)
From: Michael 'Mickey' Lauer <mickey@tm.informatik.uni-frankfurt.de>
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <44FC28C6.5040800@dominion.kabel.utwente.nl>
References: <E1GKCrb-0005hO-P4@linuxtogo.org>
	<1157373682.16945.61.camel@gandalf.tm.informatik.uni-frankfurt.de>
	<44FC28C6.5040800@dominion.kabel.utwente.nl>
Organization: VanilleMedia
Date: Mon, 04 Sep 2006 15:38:49 +0200
Message-Id: <1157377129.16945.80.camel@gandalf.tm.informatik.uni-frankfurt.de>
Mime-Version: 1.0
X-Mailer: Evolution 2.7.2.1-3mdv2007.0 
X-Virus-Scanned: by amavisd-new at tm.informatik.uni-frankfurt.de
Subject: Re: Improving consistency
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Sep 2006 13:41:33 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Am Montag, den 04.09.2006, 15:23 +0200 schrieb Koen Kooi:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Michael 'Mickey' Lauer schreef:
> > Hi developers,
> > 
> > when you are adding new versions of a bitbake recipe, please
> > take a chance to reorder the metadata according to the
> > "standard" layout found in http://openembedded.org/wiki/StyleGuide
> 
> Is it possible to have a 'bitbake sanitize <provider>' command that will output a
> sanitized .bb? It doesn't have to be perfect, but some aid in this tedious task would be
> helpfull.

That depends. I have been thinking about this for quite some time,
because
I really would like to have such a thing. We already have a bit of the
infrastructure
in place, but the one thing missing is that once the metadata is parsed,
we lose
a) order and b) source statements (pointers to a .bb or even better the
textual entity
that was the source for a certain statement).

This would not only give us a sanitize command, but also a high-level
editor for
BitBake recipes -- which has been in my mind as well -- as part of an
"OE GUI developer studio" application.

-- 
Regards,

Michael 'Mickey' Lauer | FreeLancer | http://www.Vanille-Media.de




