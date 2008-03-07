Received: from [85.83.33.36] (helo=ulstruplund.dk)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <EsbenHaabendal@gmail.com>) id 1JXl7u-0004x4-HN
	for openembedded-devel@openembedded.org; Fri, 07 Mar 2008 23:33:28 +0100
Received: (qmail 22276 invoked from network); 7 Mar 2008 22:31:40 -0000
Received: from unknown (HELO ?192.168.2.93?) (192.168.2.93)
	by marvin.ulstruplund.dk with SMTP; 7 Mar 2008 22:31:40 -0000
Message-ID: <47D1C285.2000703@gmail.com>
Date: Fri, 07 Mar 2008 23:32:37 +0100
From: Esben Haabendal <EsbenHaabendal@gmail.com>
User-Agent: Thunderbird 2.0.0.12 (Windows/20080213)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1204740661.8110.135.camel@dax.rpnet.com>	<c384c5ea0803051106he199460k7c9eaf232977e564@mail.gmail.com>
	<1204748655.8110.174.camel@dax.rpnet.com>
In-Reply-To: <1204748655.8110.174.camel@dax.rpnet.com>
X-SA-Exim-Connect-IP: 85.83.33.36
X-SA-Exim-Mail-From: EsbenHaabendal@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: sdk.bbclass and gcc-cross-sdk
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
X-List-Received-Date: Fri, 07 Mar 2008 22:33:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Richard Purdie skrev:
> On Wed, 2008-03-05 at 20:06 +0100, Leon Woestenberg wrote:
>   
>> On Wed, Mar 5, 2008 at 7:11 PM, Richard Purdie <rpurdie@rpsys.net> wrote:
>>     
>>>  What do I propose as a solution? I think the simplest thing is to would
>>>  be to do some/all of:
>>>
>>>  a) revert my sdk.bbclass changes
>>>  b) continue with our build == host assumption for gcc-cross-sdk for now
>>>  c) rename sdk.bbclass cross-sdk.bbclass
>>>  d) add a "real" sdk.bbclass
>>>
>>>       
>> Before a), I would like to see a description of what we expect the
>> different classes to do, simply because I have lost track. I
>> understood we never  supported building Canadian cross-compilers, BTW.
>>     
>
> The 'normal' situation for OE is:
>
>   build = "build system"
>   host = target = "set by machine config"
>
> cross.bbclass: 
>
>   build = host = "build system"
>   target = "set by machine config"
>
> native.bbclass:
>
>   build = host = target = "build system"
>
> sdk.bbclass (previously)
>
>   build = host = "build system"
>   target = "set by machine config"
>
> sdk.bbclass (previously)
>
>   build = "build system"
>   host = "build system with modified vendor"
>   target = "set by machine config"
>
>   
>> There are other projects that focus on the correctness of building
>> cross toolchains*, canadian or non-canadian, and if we have clear
>> requirements for each of our classes, I would like to see if I can
>> understand what we do (correctly or not).
>>     
>
> So sdk.bbclass did become a kind of Canadian cross but only with a
> different vendor part of the triplet. I'd not realised this had changed
> what gcc-cross-sdk was doing so drastically since it still worked!
>
> "gcc" is a normal package, "gcc-initial" and "gcc-cross" are cross
> packages, gcc-cross-sdk is an sdk package.
>
> We could support building canadian cross if we wanted, Id propose a new
> class for it though (sdk-canadian?). Does that cover what you wanted?
>   
I would love to see canadian cross support in OE. It would save me the 
effort maintaining an OE hacked up to build a standard meta-toolchain 
target.

If there is interest in it, I wouldn't mind working on this issue.  And 
if I am the only one interested in it, I might want to do it anyway. 
Just for fun :-)

/Esben


