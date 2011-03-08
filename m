Received: from hapkido.dreamhost.com ([66.33.216.122] ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <neil@gumstix.com>) id 1Px1f6-0007oK-3t
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Mar 2011 19:29:37 +0100
Received: from homiemail-a19.g.dreamhost.com (caiajhbdcbhh.dreamhost.com
	[208.97.132.177])
	by hapkido.dreamhost.com (Postfix) with ESMTP id 37CA417A27E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Mar 2011 10:27:50 -0800 (PST)
Received: from homiemail-a19.g.dreamhost.com (localhost [127.0.0.1])
	by homiemail-a19.g.dreamhost.com (Postfix) with ESMTP id 88D2E604069
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Mar 2011 10:27:49 -0800 (PST)
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gumstix.com; h=message-id:date
	:from:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding; q=dns; s=gumstix.com;
	b=MXTl0yg7NQaDLjxpM00LtEGbuoOS5TrAGlnpNoZV8rPOPKjTsJSLDT9q8xvzK
	f2RZrJ3gra/US/3R/977MTK6at6+38Q27KjXVdJMloVh6DNYoNlGZBM7UhJoNwL1
	/4fFDSLv/2nr040QBtaPxdOMjEXQXcHTHKPAByi8h9GoG4=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=gumstix.com; h=message-id
	:date:from:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding; s=gumstix.com; bh=D143a
	5COWFP1trJ1emLbjZlsYzA=; b=da/s8dUDdLexMKtanPnC23IPpBYOeByp6Lw+z
	m5o8gq4E3+f9S4Jh1Db9VvK+LJlrUaQqDO23X9jHghveM1dfDcUNyODJzIJ5vRXu
	L4llFGEO1LYYdXd2dngNcM+9mh+xUu8lOg1+CL7aItxujNoRxUxVPnZa6l9g2vUl
	DelHsA=
Received: from [10.0.1.35] (s64-180-61-141.bc.hsia.telus.net [64.180.61.141])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: neil@gumstix.com)
	by homiemail-a19.g.dreamhost.com (Postfix) with ESMTPSA id 62156604061
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Mar 2011 10:27:49 -0800 (PST)
Message-ID: <4D76751A.8010301@gumstix.com>
Date: Tue, 08 Mar 2011 10:27:38 -0800
From: Neil MacMunn <neil@gumstix.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Thunderbird/3.1.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D714447.1000104@gumstix.com>
	<1299270390.3930.1.camel@lenovo.internal.reciva.com>
In-Reply-To: <1299270390.3930.1.camel@lenovo.internal.reciva.com>
Subject: Re: Floating point exception in Xorg
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
X-List-Received-Date: Tue, 08 Mar 2011 18:29:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11-03-04 12:26 PM, Phil Blundell wrote:
> On Fri, 2011-03-04 at 11:57 -0800, Neil MacMunn wrote:
>>> #1  0x40661fbc in __div0 ()
>>>      at /home/neil/overo-oe/tmp-unstable/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r23.2/gcc-4.3.3/libgcc/../gcc/config/arm/lib1funcs.asm:1079
>>> #2  0x40661f90 in __udivsi3 ()
>>>      at /home/neil/overo-oe/tmp-unstable/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r23.2/gcc-4.3.3/libgcc/../gcc/config/arm/lib1funcs.asm:834
>>> #3  0x4065edc4 in OMAPFBOutputGetModes (output=<value optimized out>)
>>>      at omapfb-output.c:128
>>> #4  0x000f8c60 in xf86ProbeOutputModes (scrn=0x90a990, maxX=2048, maxY=2048)
>>>      at xf86Crtc.c:1575
>
> That's a division by zero in what looks like the mode selection code.
> At a guess, some parameter which the server is relying on to calculate
> the video timings is not being set correctly by the kernel.  You'd need
> to inspect the source for OMAPFBOutputGetModes() to figure out what's
> up, though.
>
> p.
>


Right. This line is the problem.

>  mode->Clock = PICOS2KHZ(ofb->state_info.pixclock);

because

>  #define PICOS2KHZ(a) (1000000000UL/(a))

I didn't have any luck figuring out where pixclock was supposed to be 
set so I just reverted xf86-video-omapfb_git.bb and my LCDs work again.

> git checkout 3b039e5c54265c5e1e254736687ad1cefed8f534 -- xf86-video-omapfb_git.bb

Thanks for the help.

--
Neil


