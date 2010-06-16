Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OOtOu-00076P-7X
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Jun 2010 16:15:37 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OOtKX-00057W-QD from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Jun 2010 07:11:01 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Wed, 16 Jun 2010 07:11:01 -0700
Received: from [172.30.80.129] ([172.30.80.129]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 16 Jun 2010 08:11:00 -0600
Message-ID: <4C18DB70.2060108@mentor.com>
Date: Wed, 16 Jun 2010 07:10:56 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <hva2uj$jco$2@dough.gmane.org>	<20100616095322.180eb9b5@xora-desktop.xora.org.uk>
	<4C18C342.2010304@balister.org>
In-Reply-To: <4C18C342.2010304@balister.org>
X-OriginalArrivalTime: 16 Jun 2010 14:11:00.0886 (UTC)
	FILETIME=[BFA96360:01CB0D5D]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: virtual/opkg-dev breaks task-sdk-native, please revert
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
X-List-Received-Date: Wed, 16 Jun 2010 14:15:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Philip Balister wrote:
> On 06/16/2010 04:53 AM, Graeme Gregory wrote:
>> On Wed, 16 Jun 2010 10:45:07 +0200
>> Koen Kooi<k.kooi@student.utwente.nl>  wrote:
>>
>>> -----BEGIN PGP SIGNED MESSAGE-----
>>> Hash: SHA1
>>>
>>> Hi,
>>>
>>> I noticed that
>>> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=eeffe0a6eee97604679cf9a3cf40ed4604ae6493 
>>>
>>> breaks lots of things:
>>>
>>> * a dependency loop in 'bitbake task-sdk-native'
>>> * using virtual/ namespace in packages instead of recipes.
>>>
>>> I propose to revert this change and just remove the ?pkg-dev from the
>>> sdk tasks.
>>>
>> virtual/ in package space is always wrong as it blows up on at least
>> one of our supported package types.
>>
>> Acked-by: Graeme Gregory<dp@xora.org.uk>
> 
> Acked-by: Philip Balister <philip@balister.org>

I'd like to make a different request.  The answer is that it should have 
been an RPROVIDES virtual-ipkg-dev like we do for other cases where we 
need virtuals in a rootfs/etc.  So lets not revert, lets fix?

-- 
Tom Rini
Mentor Graphics Corporation


