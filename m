Received: from smtp3.nedap.com ([87.249.123.12] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jaap.dejong@nedap.com>) id 1OdiFM-0008HL-Jl
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Jul 2010 13:22:59 +0200
Received: from nvs0066.nedap.local ([10.91.8.1]) by smtp.nedap.com with
	Microsoft SMTPSVC(6.0.3790.1830); Tue, 27 Jul 2010 13:22:39 +0200
X-TM-IMSS-Message-ID: <2758cbfc0000ca1a@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.0) id 2758cbfc0000ca1a for
	<jaap.dejong@nedap.com>; Tue, 27 Jul 2010 13:22:42 +0100
Message-ID: <4C4EC17E.5040102@nedap.com>
Date: Tue, 27 Jul 2010 13:22:38 +0200
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.11) Gecko/20100713 Lightning/1.0b1 Thunderbird/3.0.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C4E9C53.7040405@nedap.com>
	<20100727085440.GC3397@rhein.zuhause.netz>
In-Reply-To: <20100727085440.GC3397@rhein.zuhause.netz>
X-OriginalArrivalTime: 27 Jul 2010 11:22:39.0557 (UTC)
	FILETIME=[05BCA750:01CB2D7E]
X-SA-Exim-Connect-IP: 87.249.123.12
X-SA-Exim-Mail-From: jaap.dejong@nedap.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] update libftdi recipe
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
X-List-Received-Date: Tue, 27 Jul 2010 11:23:26 -0000
X-List-Received-Date: Tue, 27 Jul 2010 11:23:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Agree on that!

I was able to
     bitbake ftdi-eeprom
(which depends on libftdi) from scratch without errors.

Is this different from the stable/2009 branch?

Jaap

On 07/27/2010 10:54 AM, Henning Heinold wrote:
> On Tue, Jul 27, 2010 at 10:44:03AM +0200, Jaap de Jong wrote:
>    
>> Hi,
>>
>> below an update for building an up-to-date version of libftdi.
>>
>> thanks and best regards,
>>
>> Jaap
>> ---
>> +do_stage() {
>> +    autotools_stage_all
>> +}
>> +
>>      
> Hi,
>
> the lines above arent needed anymore the do_install from inherit autotools is enough.
>
> Bye Henning
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>    


