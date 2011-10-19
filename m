Received: from smtprelay-h22.telenor.se ([195.54.99.197])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf_samuelsson@telia.com>) id 1RGRR8-0000NJ-Pp
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Oct 2011 10:23:42 +0200
Received: from iph1.telenor.se (iph1.telenor.se [195.54.127.132])
	by smtprelay-h22.telenor.se (Postfix) with ESMTP id 3902AEAB12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Oct 2011 10:17:51 +0200 (CEST)
X-SENDER-IP: [83.227.57.13]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AoYgAGmGnk5T4zkNPGdsb2JhbAAMOJoBjwoBAQEBN4IgAQEBAQIBAQEBNTYbCxgJJQ8CFgEbFBMGAgEBh3wItGqIGwSRZIIakVk
X-IronPort-AV: E=Sophos;i="4.69,370,1315173600"; d="scan'208";a="498416194"
Received: from c-0d39e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.249]) ([83.227.57.13])
	by iph1.telenor.se with ESMTP; 19 Oct 2011 10:17:51 +0200
Message-ID: <4E9E87AF.70900@telia.com>
Date: Wed, 19 Oct 2011 10:17:51 +0200
From: Ulf Samuelsson <ulf_samuelsson@telia.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4E9D3640.9070608@telia.com> <4E9D8EC0.4030409@gmail.com>
In-Reply-To: <4E9D8EC0.4030409@gmail.com>
Subject: Re: Use of stamps in the source directory of openembedded-core
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
X-List-Received-Date: Wed, 19 Oct 2011 08:23:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

2011-10-18 16:35, Khem Raj skrev:
> On 10/18/2011 1:18 AM, Ulf Samuelsson wrote:
>> After I have built openembedded-core, I notice that the source directory
>> is loaded with files: *.done.
>>
>
> they indicate successful download of a source tar.
>
Are you sure?
It does not look like the whole story to me.

I can see that for each source file, there is a *.done file,
but there are also a lot of *.done which seems to be related
to patches, and the patches are not present in the source directory.

Why are those files created?

What happens if two different packages have a patch with the same name?

>> Is this really a good idea?
>>
>> I tend to use a common source directory for multiple projects.
>>
>> Having stamps in the source directory, means that you let one
>> project affect the others.
>>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


-- 
Best Regards
Ulf Samuelsson



