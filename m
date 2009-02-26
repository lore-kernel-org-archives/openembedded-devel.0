Received: from [85.13.140.93] (helo=dd20204.kasserver.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Bernhard.Guillon@opensimpad.org>) id 1Lcfsb-0003Bh-SA
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Feb 2009 14:03:26 +0100
Received: from [192.168.1.102] (77-21-130-108-dynip.superkabel.de
	[77.21.130.108])
	by dd20204.kasserver.com (Postfix) with ESMTP id 3A35C180F7FCA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Feb 2009 13:59:06 +0100 (CET)
Message-ID: <49A69217.3070705@opensimpad.org>
Date: Thu, 26 Feb 2009 13:59:03 +0100
From: Bernhard Guillon <Bernhard.Guillon@opensimpad.org>
User-Agent: Thunderbird 2.0.0.19 (X11/20090105)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <go498c$bqq$1@ger.gmane.org>
	<200902261144.46548.openembedded@haerwu.biz>
In-Reply-To: <200902261144.46548.openembedded@haerwu.biz>
Subject: Re: [RFC] renaming packages/ to recipes/
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
X-List-Received-Date: Thu, 26 Feb 2009 13:04:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Marcin Juszkiewicz wrote:
> On Wednesday 25 of February 2009 21:21:32 Koen Kooi wrote:
>   
>> Proposal:
>>
>> mv packages recipes ; git commit .
>>     
>
> +1 from me
>
> My addition to this:
>
> mkdir recipes-broken
> git add  recipes-broken
> git mv recipes/obsolete recipes-broken/obsolete
> git mv recipes/nonworking recipes-broken/nonworking
>
>   
I like this idea. But we should add a description file to the recipe on 
which arch it is broken or why it is obsolete.
A package tested and working for arch x can break on arch y easily. E.g. 
if it uses netlib floating points.

Best regards
Bernhard Guillon



