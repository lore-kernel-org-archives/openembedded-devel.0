Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RE4Az-0001SP-7X
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Oct 2011 21:09:13 +0200
Received: by qadc1 with SMTP id c1so868745qad.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Oct 2011 12:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=KVOvlzP2AbTY8P//BaDucHLjh3N7ee0lS2QdPZSpJ/8=;
	b=sYwDEQgWjjS4JSvUOZ7N+/7jHGZuTTX5imGEzCDkqX2v32lL3PzpLC0ulFGpN75lPC
	82PhHBE2+cDvbE8laDCqf98nI4N/KO6xRSRvD6iGREIC/bAF/xTrdU1MOzHfDbWI2qKv
	H5nj2EcYBy4cD2k84tonGOV0NkbzIEBEwhC+Y=
Received: by 10.224.31.132 with SMTP id y4mr396492qac.12.1318446209597;
	Wed, 12 Oct 2011 12:03:29 -0700 (PDT)
Received: from [172.23.0.171] (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id eo3sm4043236qab.18.2011.10.12.12.03.26
	(version=SSLv3 cipher=OTHER); Wed, 12 Oct 2011 12:03:27 -0700 (PDT)
Message-ID: <4E95E479.7070802@gmail.com>
Date: Wed, 12 Oct 2011 12:03:21 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4E936282.3030505@telia.com> <20111010213559.GI3125@denix.org>
	<4E938024.2090605@telia.com> <4E953F31.6080002@telia.com>
In-Reply-To: <4E953F31.6080002@telia.com>
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
X-List-Received-Date: Wed, 12 Oct 2011 19:09:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/12/2011 12:18 AM, Ulf Samuelsson wrote:
> On 2011-10-11 01:30, Ulf Samuelsson wrote:
>> On 2011-10-10 23:35, Denys Dmytriyenko wrote:
>>> On Mon, Oct 10, 2011 at 11:24:18PM +0200, Ulf Samuelsson wrote:
>>>> psyco-dist will not run on a 64 bit linux.
>>>> The guys behind psyco-dist recommends the use of PyPy
>>>>
>>>> What is the recommendation for 64 bit linux?
>>>>
>>>> Just run without JIT?
>>>> Don't run on a 64 bit linux?
>>>> Anything else?
>>> Yes, not supporting 64-bit hosts is one of the known limitations of
>>> psyco.
>>> Being stuck with Python 2.6 is another limitation.
>>>
>>> But, latest bitbake appears to be quite fast even w/o using psyco
>>> these days.
>>> Especially with parallel parsing on multiple cores...
>>>
>>
>> OK, I will try without JIT then.
>>
> Now I have some results.
>
> Building a custom x11 image on a 32 bit Ubuntu 10.10/psyco-dist took 91
> minutes.
> Building the same image on a 64 bit Ubuntu 11.04 without psyco-dist took
> 109 minutes
> (The last machine was an i7-920 w 4 GB RAM)
> The first might be the same, alternatively it was a machine with 6 GB RAM.
>
> = It takes 20% more time on a 64 bit O/S.
>

are these on same hardware running once 32bit or and second time 64bit OS ?
>



