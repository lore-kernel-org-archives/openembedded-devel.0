Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T9e2d-0004QJ-QY
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Sep 2012 17:30:51 +0200
Received: from localhost ([127.0.0.1]:54794 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T9dqd-0002tI-87
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Sep 2012 15:18:27 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=default;
	bh=h3vH2gw2qcw8ZZgPNWP/4nAxVQA=; b=AVAk/8C7qK8zmyAE/haMewMMs1jq
	pZPDAy50YA1xuTqZ4PXTezrY5I1FFGXXClA6qkxmFF2Xe4jwKb26KKeMb5v+ZqYl
	0g5QvAqkZDkAoJ6tEAxn+nb3qE5V1wVPRKmMKZBiixWG3n2t6qdsBCjgP7AsUKMJ
	zxiPo+gROFiYick=
Received: from [195.171.99.130] (port=57263 helo=[192.168.0.33])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T9dqd-0002tF-37
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Sep 2012 15:18:27 +0000
Message-ID: <5048BF04.2000904@communistcode.co.uk>
Date: Thu, 06 Sep 2012 16:19:32 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120828 Thunderbird/15.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <5048B901.3060103@communistcode.co.uk>
	<1346943545.2673.198.camel@phil-desktop>
	<5048BC6D.8080904@communistcode.co.uk>
	<1346944157.2673.199.camel@phil-desktop>
	<5048BE25.2070004@communistcode.co.uk>
	<1346944624.2673.200.camel@phil-desktop>
In-Reply-To: <1346944624.2673.200.camel@phil-desktop>
Subject: Re: Issues building tinyXML
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
X-List-Received-Date: Thu, 06 Sep 2012 15:30:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/09/12 16:16, Phil Blundell wrote:
> On Thu, 2012-09-06 at 16:15 +0100, Jack Mitchell wrote:
>> On 06/09/12 16:09, Phil Blundell wrote:
>>> On Thu, 2012-09-06 at 16:08 +0100, Jack Mitchell wrote:
>>>> So, would the best way to fix it be something like:
>>>>
>>>> do_compile() {
>>>>        run_oemake LD="${CCLD}"
>>>> }
>>> Yes, probably.  Or I guess you can just do:
>>>
>>> LD = "${CCLD}"
>>>
>>> somewhere else in your .bb file.
> Oh, right.  It's a C++ program so what you actually need is LD="${CXX}".
>
> p.
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

Perfect, I had CC=${CXX} so I was almost there!! : P

Thanks for the help!

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



