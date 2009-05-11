Received: from [72.14.220.158] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1M3Qxx-0006is-K5
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 May 2009 10:34:30 +0200
Received: by fg-out-1718.google.com with SMTP id e12so503629fga.20
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 May 2009 01:27:59 -0700 (PDT)
Received: by 10.86.59.18 with SMTP id h18mr6183040fga.14.1242030479829;
	Mon, 11 May 2009 01:27:59 -0700 (PDT)
Received: from xora-eee.xora-domain (93-97-174-2.zone5.bethere.co.uk
	[93.97.174.2])
	by mx.google.com with ESMTPS id 3sm2621953fge.26.2009.05.11.01.27.59
	(version=SSLv3 cipher=RC4-MD5); Mon, 11 May 2009 01:27:59 -0700 (PDT)
Message-ID: <4A07E184.1040202@xora.org.uk>
Date: Mon, 11 May 2009 09:27:48 +0100
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1b3pre) Gecko/20090324 Fedora/3.0-2.1.beta2.fc11
	Thunderbird/3.0b2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20090427141943.GG18788@smtp.west.cox.net>	<20090429161224.GB18788@smtp.west.cox.net>
	<49FCA524.10102@dls.net>	<c384c5ea0905030529n585de20awfcc6bb835a282483@mail.gmail.com>	<20090503165318.GA7973@smtp.west.cox.net>	<20090510194704.GZ7973@smtp.west.cox.net>	<gu7ff8$cmr$1@ger.gmane.org>	<20090510215154.GA7973@smtp.west.cox.net>	<be7a9f3d0905101527i3123f921sc86f01f43d5eacfe@mail.gmail.com>	<20090510223606.GB7973@smtp.west.cox.net>
	<gu8ikj$gvo$1@ger.gmane.org> <1242029225.5824.22.camel@ted>
In-Reply-To: <1242029225.5824.22.camel@ted>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [RFC] Bring PREFERRED_LIBC to all distros
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
X-List-Received-Date: Mon, 11 May 2009 08:34:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/11/2009 09:07 AM, Richard Purdie wrote:
> On Mon, 2009-05-11 at 09:03 +0200, Koen Kooi wrote:
>    
>> On 11-05-09 00:36, Tom Rini wrote:
>>      
>>> On Sun, May 10, 2009 at 07:27:42PM -0300, Otavio Salvador wrote:
>>>        
>>>> Hello Tom,
>>>>
>>>> On Sun, May 10, 2009 at 6:51 PM, Tom Rini<trini@embeddedalley.com>   wrote:
>>>>          
>>>>> Not too wierd looking?  Otherwise, is there somewhere we can do,
>>>>> roughly, sort -u, on ${OVERRIDES} ?  And not require a new bitbake for
>>>>> everyone?
>>>>>            
>> How do you decide which one to drop? The one with a lower or higher
>> priority? You can see how that gets real ugly real fast.
>>
>>      
>>>> I belive that we shouldn't add hacks into OE recipes to avoid the
>>>> requirement of new bitbake. If someone is using dev tree we can assume
>>>> that this person can also use a development version from bitbake
>>>> stable branch.
>>>>          
>>> I don't mean a hack to glibc*.bb, but rather changing base.bbclass (and
>>> anything else) to not blow up if OVERRIDES contains duplicates.  I think
>>> it's possible to add a python function that does it, but it would have
>>> to be 'slow' since the fast method is to throw everything into a dict
>>> and then return the list of keys.  So perhaps it's best to just say
>>> libc-<foo>   for an additional per-libc override.
>>>        
>> libc-<foo>  is also a lot clearer in the case of newlib :)
>>      
>
> Playing with OVERRIDES can get messy quickly. The key to success is
> having patterns which are unique. "glibc" is therefore not as good as
> "libc-glibc". This is why there are the "task-" and "pn-" namespaces and
> IMO, namespaces are essential there.
>
> Yes, there are several things we add there without namespacing but we've
> mostly been lucky...
>
>    
I agree with this reasoning and I also far prefer libc-blah to read as 
well. I think we should go for this form.

G


