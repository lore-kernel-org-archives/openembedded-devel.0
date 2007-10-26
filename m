Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IlXaX-000541-7C
	for openembedded-devel@openembedded.org; Sat, 27 Oct 2007 00:23:33 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l9QMG3xv011325
	for <openembedded-devel@openembedded.org>;
	Fri, 26 Oct 2007 23:16:03 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11016-08 for <openembedded-devel@openembedded.org>;
	Fri, 26 Oct 2007 23:15:52 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l9QMFoon011302
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Fri, 26 Oct 2007 23:15:50 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <d543f5920710260628m752ebe95qb0e874df43f46cf8@mail.gmail.com>
References: <d543f5920710260628m752ebe95qb0e874df43f46cf8@mail.gmail.com>
Date: Fri, 26 Oct 2007 23:15:52 +0100
Message-Id: <1193436953.6177.117.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: GLIBC_BROKEN_LOCALES
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
X-List-Received-Date: Fri, 26 Oct 2007 22:23:33 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2007-10-26 at 08:28 -0500, Matt Hoosier wrote:
> I happened to run afoul of this when trying to build an image for a
> product that contains tr_TR as one of its localizations.
> 
> What sort of misbehavior does a locale have to engage in before being
> banished to this list? I looked at the patches for whichever Ubuntu
> release also uses glibc-2.5, and can't find any evidence that they do
> anything to fix the tr_TR localedata in glibc before compiling. Nor do
> they, as best I can tell, blacklist it the way that OE does.

Usually its failed to build a binary locale under qemu for one or more
OE devs. I doubt its been investigated more than that. If it does build,
let us know and we'll probably remove it from the blacklist.

Cheers,

Richard



