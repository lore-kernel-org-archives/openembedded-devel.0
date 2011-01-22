Received: from blath.larsmichelsen.com ([78.46.117.178] helo=larsmichelsen.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lm@larsmichelsen.com>) id 1Pgg21-0002E9-3y
	for openembedded-devel@lists.openembedded.org;
	Sat, 22 Jan 2011 17:09:41 +0100
Received: from localhost (localhost.localdomain [127.0.0.1])
	by larsmichelsen.com (Postfix) with ESMTP id 1219A9544015
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jan 2011 17:09:00 +0100 (CET)
Received: from larsmichelsen.com ([127.0.0.1])
	by localhost (blath.larsmichelsen.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id JZS+OxbvJRkc
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jan 2011 17:08:59 +0100 (CET)
Received: from [192.168.4.106] (g229015111.adsl.alicedsl.de [92.229.15.111])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: lm)
	by larsmichelsen.com (Postfix) with ESMTPSA id 996D69544005
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jan 2011 17:08:59 +0100 (CET)
Message-ID: <4D3AFA2B.3060008@larsmichelsen.com>
Date: Sat, 22 Jan 2011 16:39:23 +0100
From: Lars Michelsen <lm@larsmichelsen.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2.104i Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1295654503-26379-1-git-send-email-lm@larsmichelsen.com>	<ihedau$stf$1@dough.gmane.org>	<4D3AC11C.2040602@larsmichelsen.com>	<4D3AC6F0.4050802@xora.org.uk>	<ihel1v$tnt$1@dough.gmane.org>	<4D3ADC2C.6070506@larsmichelsen.com>
	<ihesdm$v7u$1@dough.gmane.org>
In-Reply-To: <ihesdm$v7u$1@dough.gmane.org>
Subject: Re: [PATCH] mplayer_svn: Package can be built again; Bumped to rev. 31329.
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
X-List-Received-Date: Sat, 22 Jan 2011 16:09:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello Koen,

On 22/01/11 16:17, Koen Kooi wrote:
>
> Looking closer at your patch, it looks like you're working off an old tree:
>
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=9a3e44e3d3d69ab9e1e4e1e3338afaed2b97fb65
>
> Your patch is also missing the hardfp fix that is needed to actually
> make it work.
>
> Could you try the current recipe and see if it works for you? It works
> on my omap3 boards quite well, minus a dlopen() buglet in libdvdcss2.
>
> regards,
>
> Koen

Yes, I built the changes with testing_2010-12-30 tag at beginning of 
January. At this time the last modification of the mplayer_svn reciep 
was on 2010-10-26. So I had no problem with that rev as starting point.

Now I recognized you patched the reciep on 2011-01-16. Well, seems to go 
in the same direction as my changes.

I'll give it a try and report back. Thanks for the hint.

Regards,
Lars


