Received: from [216.145.245.199] (helo=mx03.dls.net)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <mwester@dls.net>) id 1JOH8x-0007rb-PP
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Feb 2008 19:43:12 +0100
Received: from gw.mwester.net ([209.242.5.110] helo=[192.168.1.111])
	by mx03.dls.net with esmtpa (Exim 4.63)
	(envelope-from <mwester@dls.net>) id 1JOH9B-0004cj-Ao
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Feb 2008 12:43:25 -0600
Message-ID: <47AF45CC.3060906@dls.net>
Date: Sun, 10 Feb 2008 12:43:24 -0600
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Thunderbird 2.0.0.9 (Windows/20071031)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20080129014117.60ed9f77@widy.localdomain>	<1201565225.4687.98.camel@localhost.localdomain>	<20080209134850.13fe8d93@widy.localdomain>	<1202583333.7981.17.camel@dax.rpnet.com>
	<20080210202952.2b510465@widy.localdomain>
In-Reply-To: <20080210202952.2b510465@widy.localdomain>
Subject: Re: [RFC] Setting default IMAGE_FSTYPES to tar.gz in bitbake.conf
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
X-List-Received-Date: Sun, 10 Feb 2008 18:43:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Paul Sokolovsky wrote:
> Hello,
>
> On Sat, 09 Feb 2008 18:55:33 +0000
> Richard Purdie <rpurdie@rpsys.net> wrote:
>
> []
>
>   
>> The DISTRO can override the machine if it wishes now with no change to
>> OE, that is up to the distros concerned. That doesn't stop machines
>> from having sane defaults.
>>
>>     
>>> Well, as usual, thoughts aloud. I'm going to add 
>>> IMAGE_FSTYPES ?= "jffs2" to the machines from your 1st list to get
>>> matter going.
>>>       
>> ok.
>>
>>     
>
> Done, so are we ready for this patch now?
>
>
> @@ -541,7 +545,7 @@ DL_DIR ?= "${TMPDIR}/downloads" 
>  ################################################################## 
>   
>  DL_DIR ?= "${TMPDIR}/downloads" 
> -IMAGE_FSTYPES ?= "jffs2" 
> +IMAGE_FSTYPES ?= "tar.gz" 
>   
Why exactly are we simply replacing a jffs2 default with a new default?  
Just to make some other parties happier?  Wouldn't it be simply better, 
if this is such a big deal, to do:

+IMAGE_FSTYPES ?= "you-must-define-an-image-fstype-that-is-suitable-for-you"

That way we ensure that *nobody* relies on defaults, and everything is 
correctly defined in every case, and if someone fails to define it, it 
should be pretty obvious what they did wrong.

>  PCMCIA_MANAGER ?= "pcmcia-cs" 
>  DEFAULT_TASK_PROVIDER ?= "task-base" 
>  MACHINE_TASK_PROVIDER ?= "${DEFAULT_TASK_PROVIDER}" 
>
>
>   
>> Cheers,
>>
>> Richard
>>     
> Mike (mwester)
>
>
>   


