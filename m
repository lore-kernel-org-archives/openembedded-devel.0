Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TB5Co-0007Qe-VZ
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Sep 2012 16:43:19 +0200
Received: from localhost ([127.0.0.1]:33653 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TB50j-0004r6-G3
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Sep 2012 14:30:49 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=default;
	bh=dswnh2Xh/TtUU1UPJnSCNplh9PM=; b=uZpXlp9Yx/pKuTwuLZ6xxuC0esA+
	uPvm0WC6Zx88zxqo6uXrDn2DcGo8N1MOZ6i2eIxAeem+LmZiqCrP5CEBUAcefYIo
	1iJb4IJHQQAgW6kb4CIejd8QgAlgjrqC8l4uKDPdnfs8T9qPESgetGVSyfzQxtY1
	MYTkvavPEMqXsgk=
Received: from [195.171.99.130] (port=15071 helo=[192.168.0.40])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TB50j-0004r3-Dy
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Sep 2012 14:30:49 +0000
Message-ID: <504DF9FA.8020204@communistcode.co.uk>
Date: Mon, 10 Sep 2012 15:32:26 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120828 Thunderbird/15.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <504DE45C.2010202@communistcode.co.uk>
	<1347282537.2673.239.camel@phil-desktop>
	<504DF65B.4080805@communistcode.co.uk>
	<1347286924.2673.250.camel@phil-desktop>
In-Reply-To: <1347286924.2673.250.camel@phil-desktop>
Subject: Re: Couple of autotools configure problems
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
X-List-Received-Date: Mon, 10 Sep 2012 14:43:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/09/12 15:22, Phil Blundell wrote:
> On Mon, 2012-09-10 at 15:16 +0100, Jack Mitchell wrote:
>> Ok, re-building now - will let you know how it goes. I removed the -Wall
>> flag. It makes no sense at all as the -Wall flag is passed using the :=
>> operator, is that not a contradiction in itself?!
> Sounds like you might be looking at the wrong -Wall.  The one that
> matters here is the one in AM_INIT_AUTOMAKE(), not to be confused with
> the compiler option of the same name which gets set in CFLAGS.
>
> p.
>
>

Ok, that makes more sense!

Thanks,

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



