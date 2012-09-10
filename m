Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TB4xr-00071B-O8
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Sep 2012 16:27:51 +0200
Received: from localhost ([127.0.0.1]:52899 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TB4lm-0004P6-9l
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Sep 2012 14:15:22 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=default;
	bh=rVEzZBufWQDblgy67tXvBUCLNKw=; b=o62bs8+v7CQOMcHR6vDHIDQV09XM
	+/j1Txv7ELjHU2DN/nWqS7np7MCSguN1oXsKSyTY8TvAqvCnuey4DFG8pR+luz60
	5RcJ7EWJg8CSDdbvBFF71rRlx++DXVBXVVQCT8guUmrIB0G9GxTBG4YKLuVTX+/b
	iIByUlG+yZ8OTso=
Received: from [195.171.99.130] (port=9707 helo=[192.168.0.40])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TB4lm-0004Ov-7e
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Sep 2012 14:15:22 +0000
Message-ID: <504DF65B.4080805@communistcode.co.uk>
Date: Mon, 10 Sep 2012 15:16:59 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120828 Thunderbird/15.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <504DE45C.2010202@communistcode.co.uk>
	<1347282537.2673.239.camel@phil-desktop>
In-Reply-To: <1347282537.2673.239.camel@phil-desktop>
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
X-List-Received-Date: Mon, 10 Sep 2012 14:27:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/09/12 14:08, Phil Blundell wrote:
> On Mon, 2012-09-10 at 14:00 +0100, Jack Mitchell wrote:
>> What is a portable version of ':=', maybe '+='? I can't get anything but
>> unrelated hits from Google.
> I don't think there is any portable equivalent.  However, if you know
> you will always be using GNU make then the portability is something of a
> non-issue.
>
> You could work around it by just not passing -Werror -Wall to automake.
>
> p.
>

Ok, re-building now - will let you know how it goes. I removed the -Wall 
flag. It makes no sense at all as the -Wall flag is passed using the := 
operator, is that not a contradiction in itself?!

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



