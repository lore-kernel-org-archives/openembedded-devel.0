Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <rpurdie@rpsys.net>) id 1GKXPd-00030E-8m
	for openembedded-devel@openembedded.org; Tue, 05 Sep 2006 11:40:09 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.6) with ESMTP id k859bPhx002130
	for <openembedded-devel@openembedded.org>;
	Tue, 5 Sep 2006 10:37:25 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02054-02 for <openembedded-devel@openembedded.org>;
	Tue,  5 Sep 2006 10:37:23 +0100 (BST)
Received: from dynamic2.rpnet.com (dynamic2.rpnet.com [192.168.1.32])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.6) with ESMTP id k859bKkP002123
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Tue, 5 Sep 2006 10:37:20 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@openembedded.org>
In-Reply-To: <44FD3519.7000000@dominion.kabel.utwente.nl>
References: <44FD3519.7000000@dominion.kabel.utwente.nl>
Date: Tue, 05 Sep 2006 10:37:19 +0100
Message-Id: <1157449040.26547.6.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: gtk 2.6/2.8 vs 2.10
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
X-List-Received-Date: Tue, 05 Sep 2006 09:40:09 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2006-09-05 at 10:28 +0200, Koen Kooi wrote:
> A while ago gtk 2.10 was added to OE with a negative default preference since not all the
> patches have been forward ported yet. Gtk 2.10 also bumped their ABI version to 2.10,
> which leads to some interesting problems:
> 
> * do_install for packages dependant on gtk+ breaks since ${libdir}/gtk-2.0/2.4.0/ is now
> ${libdir}/gtk-2.0/2.10.0/

I think Graeme's solution should solve this.

> * some package build against 2.8 but not against 2.10 and vice versa

These need versioned DEPENDS eg. DEPENDS = "gtk+ (>= 2.10.0)". Could
someone try and see if it breaks anything with the current bitbake? I'd
like to see the metadata starting to contain this data, even if bitbake
itself doesn't use it yet so when we do implement it, it should all just
work...

Cheers,

Richard



