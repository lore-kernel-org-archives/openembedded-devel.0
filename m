Received: from [63.81.120.158] (helo=gateway-1237.mvista.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <clarson@mvista.com>) id 1MI2YO-0001Ai-9w
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Jun 2009 17:32:28 +0200
Received: from [0.0.0.0] (asshur.mvista.com [10.0.0.11])
	by hermes.mvista.com (Postfix) with ESMTP id D3FB61AC11
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Jun 2009 08:21:39 -0700 (PDT)
Message-ID: <4A3CFE82.2050106@mvista.com>
Date: Sat, 20 Jun 2009 08:21:38 -0700
From: Christopher Larson <clarson@mvista.com>
User-Agent: Thunderbird 2.0.0.21 (Windows/20090302)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20090617042909.GA21132@denix.org>	<1245224450.29153.99.camel@lenovo.internal.reciva.com>	<20090617214104.GC21132@denix.org>	<1245396977.29153.192.camel@lenovo.internal.reciva.com>
	<1245492507.29153.244.camel@lenovo.internal.reciva.com>
In-Reply-To: <1245492507.29153.244.camel@lenovo.internal.reciva.com>
Subject: Re: update-rc.d: don't add runtime dependency if	not	doing	online package management; only add it to ${PN} in any case.
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
X-List-Received-Date: Sat, 20 Jun 2009 15:32:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Phil Blundell wrote:
> On Fri, 2009-06-19 at 08:36 +0100, Phil Blundell wrote:
>   
>> On Wed, 2009-06-17 at 17:41 -0400, Denys Dmytriyenko wrote:
>>     
>>> Any ideas why RDEPENDS_{PN} in "udev" recipe works, but RDEPENDS_udev doesn't? 
>>> It only happens with inherit update-rc.d.bbclass, which also changes 
>>> RDEPENDS_{PN}... I have the same issue with my own recipes, which I need to 
>>> fix similarly.
>>>       
>> It's a side effect of the way that overrides work in bitbake. 
>>     
>
> ... and Chris Larson, being the great guy that he is, has now added a
> check for this issue to recipe_sanity.bbclass.  If you have sanity
> checking enabled, this situation will now elicit a diagnostic along the
> lines of:
>
> NOTE: glibc-2.9: recipe_sanity: rename of variable 'RPROVIDES_${PN}-dev'
> to 'RPROVIDES_glibc-dev' overwrote existing value ' libc-dev' with
> 'libc6-dev virtual-libc-dev'. 
>
> which should make it easy to identify such issues in the future.  Thanks
> Chris!

Not a problem, happy to help.  It's worth noting, for anyone that hasn't 
tried recipe_sanity yet, that because it outputs so many messages, by 
default it's a standalone task, rather than being hooked into the normal 
build process the way sanity (config checks) and insane (packages / 
output checks) are.  Using it is explicit, INHERIT += "recipe_sanity", 
then bitbake -c recipe_sanity foo or bitbake -c recipe_sanity_all foo 
(to run against foo and its deps).

-Chris


