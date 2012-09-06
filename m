Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T9ed2-0005Rc-Pw
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Sep 2012 18:08:28 +0200
Received: from localhost ([127.0.0.1]:41758 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T9eR2-0004P7-AR
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Sep 2012 15:56:04 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=default;
	bh=nrw+BwzzHW9BzWDKWgLTMnk7OT8=; b=hSIsz7FGNslBW4fbbdSmAY8I5OhJ
	TZrcg5UWbbGGhpSnucYnVxLa53nGfGMV2W8lBPz5MCvQQFwICEpaSRUkgXqE0YpG
	aExkKLBs0Q3Twkltz2zgS6OtK66vTtJ+QaBJyVPbkBfUhh1904JRyNNMCwUrW3iY
	PjnzoXi8jVRT5yU=
Received: from [195.171.99.130] (port=33273 helo=[192.168.0.33])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T9eR2-0004P4-8O
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Sep 2012 15:56:04 +0000
Message-ID: <5048C7D5.70301@communistcode.co.uk>
Date: Thu, 06 Sep 2012 16:57:09 +0100
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
	<5048BF04.2000904@communistcode.co.uk>
In-Reply-To: <5048BF04.2000904@communistcode.co.uk>
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
X-List-Received-Date: Thu, 06 Sep 2012 16:08:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/09/12 16:19, Jack Mitchell wrote:
> On 06/09/12 16:16, Phil Blundell wrote:
>> On Thu, 2012-09-06 at 16:15 +0100, Jack Mitchell wrote:
>>> On 06/09/12 16:09, Phil Blundell wrote:
>>>> On Thu, 2012-09-06 at 16:08 +0100, Jack Mitchell wrote:
>>>>> So, would the best way to fix it be something like:
>>>>>
>>>>> do_compile() {
>>>>>        run_oemake LD="${CCLD}"
>>>>> }
>>>> Yes, probably.  Or I guess you can just do:
>>>>
>>>> LD = "${CCLD}"
>>>>
>>>> somewhere else in your .bb file.
>> Oh, right.  It's a C++ program so what you actually need is LD="${CXX}".
>>
>> p.
>>
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> Perfect, I had CC=${CXX} so I was almost there!! : P
>
> Thanks for the help!
>

I take this back, It built correctly but it seems the makefile doesn't 
build the shared library to link against?!

The Archlinux package has something similar to:

   ${CXX} -shared -o lib${PN}.so.0.${PV} \
     -Wl,-soname,lib${PN}.so.0 $(ls *.o | grep -v xmltest)

Which seems to collect all the objects and link them together into a 
shared object? Is there anywhere else in OE we do this so I could see 
how it is formally done?

Regards,


-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



