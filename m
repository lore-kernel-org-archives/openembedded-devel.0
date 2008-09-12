Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <thommycheck@gmx.de>) id 1Ke6qH-0004zE-EO
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Sep 2008 13:29:37 +0200
Received: (qmail invoked by alias); 12 Sep 2008 11:26:51 -0000
Received: from BAA3c82.baa.pppool.de (EHLO [192.168.178.38]) [77.128.60.130]
	by mail.gmx.net (mp017) with SMTP; 12 Sep 2008 13:26:51 +0200
X-Authenticated: #2218979
X-Provags-ID: V01U2FsdGVkX1/T+RtkVnLTOUTAwporTQ3/Da2L/vdMiLzTiDsv/g
	hzu6bHdEv6iUUN
Message-ID: <48CA51F5.2010704@gmx.de>
Date: Fri, 12 Sep 2008 13:26:45 +0200
From: Thomas Kunze <thommycheck@gmx.de>
User-Agent: Mozilla-Thunderbird 2.0.0.16 (X11/20080724)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <69E6C70090A0A14498CC98FAE5E06B6E2B3B01@hiob.intern.dresearch.de>	<48CA48B8.4060708@gmx.de>
	<69E6C70090A0A14498CC98FAE5E06B6E2B3B04@hiob.intern.dresearch.de>
In-Reply-To: <69E6C70090A0A14498CC98FAE5E06B6E2B3B04@hiob.intern.dresearch.de>
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.62
Subject: Re: Some beginners problems
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
X-List-Received-Date: Fri, 12 Sep 2008 11:29:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Sledz, Steffen wrote:
>>> I wan't to make an image (e.g. minimal-image) for atngw100 
>>> but with different linux kernel configuration (e.g. 
>>> CONFIG_EXT2_FS=y). What's th right way to do this?
>>>
>>> * Just edit packages/linux/linux-2.6.24/atngw100/defconfig?
>>>       
>>  
>> Yes. But don't forget to increase the PR. Otherwise bitbake 
>> doesn't know that the recipe was changed and doesn't rebuild
>> it.
>>     
>
> The change is not a bug fix or something like this. It's just a variant and not mentioned to become committed. So if i increase PR and someone else fixes a bug and increases PR too and I pull this fixes from git I have a conflict.  :(
>   
Yes but you will always have this problem with local changes and it 
shouldn't be too hard to resolve such conflicts.

Regards,
Thomas



