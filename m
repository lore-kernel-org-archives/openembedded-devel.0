Received: from smtprelay-b22.telenor.se ([195.54.99.213])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf_samuelsson@telia.com>) id 1RDtae-0005M5-Qa
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Oct 2011 09:51:01 +0200
Received: from iph3.telenor.se (iph3.telenor.se [195.54.127.134])
	by smtprelay-b22.telenor.se (Postfix) with ESMTP id 734B1E9E71
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Oct 2011 09:18:09 +0200 (CEST)
X-SENDER-IP: [83.227.57.13]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AvQvALw+lU5T4zkNPGdsb2JhbAAMN4k8kBGMZoITAQEBATeCBQEBAQEDOEARCxgJFg8JAwIBAgExFBMIAQHAIYdYBJN1kVU
X-IronPort-AV: E=Sophos;i="4.69,333,1315173600"; d="scan'208";a="129684205"
Received: from c-0d39e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.244]) ([83.227.57.13])
	by iph3.telenor.se with ESMTP; 12 Oct 2011 09:18:09 +0200
Message-ID: <4E953F31.6080002@telia.com>
Date: Wed, 12 Oct 2011 09:18:09 +0200
From: Ulf Samuelsson <ulf_samuelsson@telia.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.23) Gecko/20110922 Thunderbird/3.1.15
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4E936282.3030505@telia.com> <20111010213559.GI3125@denix.org>
	<4E938024.2090605@telia.com>
In-Reply-To: <4E938024.2090605@telia.com>
Subject: Re: psyco-dist not supported on 64 bit Linux
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
X-List-Received-Date: Wed, 12 Oct 2011 07:51:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2011-10-11 01:30, Ulf Samuelsson wrote:
> On 2011-10-10 23:35, Denys Dmytriyenko wrote:
>> On Mon, Oct 10, 2011 at 11:24:18PM +0200, Ulf Samuelsson wrote:
>>> psyco-dist will not run on a 64 bit linux.
>>> The guys behind psyco-dist recommends the use of PyPy
>>>
>>> What is the recommendation for 64 bit linux?
>>>
>>> Just run without JIT?
>>> Don't run on a 64 bit linux?
>>> Anything else?
>> Yes, not supporting 64-bit hosts is one of the known limitations of 
>> psyco.
>> Being stuck with Python 2.6 is another limitation.
>>
>> But, latest bitbake appears to be quite fast even w/o using psyco 
>> these days.
>> Especially with parallel parsing on multiple cores...
>>
>
> OK, I will try without JIT then.
>
Now I have some results.

Building a custom x11 image on a 32 bit Ubuntu 10.10/psyco-dist  took 91 
minutes.
Building the same image on a 64 bit Ubuntu 11.04 without psyco-dist took 
109 minutes
(The last machine was an i7-920 w 4 GB RAM)
The first might be the same, alternatively it was a machine with 6 GB RAM.

= It takes 20% more time on a 64 bit O/S.


-- 
Best Regards
Ulf Samuelsson



