Received: from [74.125.92.148] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Mt6mz-0007Fh-Od
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Sep 2009 23:32:49 +0200
Received: by qw-out-1920.google.com with SMTP id 4so2458555qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Sep 2009 14:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=qNLomULziXUgaNVQKZi1qd88j5wkSG52xanwk0Y8/eE=;
	b=qqNZXaEObRf7o5Nl/Ge1aKsceOwDMipWjYAtCc9Z+JCPTG6oli80EcVi0Dqe1ubXHv
	sdofGvG7MtM6svgKVj8DFSVEFg4QsqkGlANyXA7tW6/lEFU/i4CmqmVjAANSyGXmKXI9
	4nfoymkTs9rER1oWCI4SvXp1/D/SDGi2rB6bo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=eClSGyZF472t99oOhHpTVZ371S5HlLayVqkknwwYPaixe5s+G7DdykaNbjT+bhwZY1
	rOPFCSl9mFwbl7HCbmRLy2uMkOqQFUByeeWZzI52uNf9axFBXb1Pad+ciw6VW0izTnVM
	X8sMMhO2G6SE8RXRUVg+h3lWyKDG7gqkv3oR0=
MIME-Version: 1.0
Received: by 10.229.1.65 with SMTP id 1mr254320qce.20.1254346323333; Wed, 30 
	Sep 2009 14:32:03 -0700 (PDT)
In-Reply-To: <1254173087.29003.54.camel@orest.ift.cs.uni-potsdam.de>
References: <1254173087.29003.54.camel@orest.ift.cs.uni-potsdam.de>
Date: Wed, 30 Sep 2009 14:32:03 -0700
Message-ID: <19c1b8a90909301432i1569af2ane74faec944c17b27@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.92.148
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: How do I build OE for PPC-405 inside Virtex 4?
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
X-List-Received-Date: Wed, 30 Sep 2009 21:32:49 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Sep 28, 2009 at 2:24 PM, Ali Akbar Zarezadeh
<akzare@cs.uni-potsdam.de> wrote:



> INIT: Id "S" respawning too fast: disabled for 5 minutes
> .

this means something mentioned in /etc/inittab failed. You can comment out
the line starting with 'S' and see if that helps

the inittab entries looks like
1:2345:respawn:/sbin/mingetty tty1

It could be that the device is not used correctly or something like that

Thx

-Khem


