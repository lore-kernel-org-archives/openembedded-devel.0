Received: from smtp2.nedap.com ([213.160.213.92] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jaap.dejong@nedap.com>) id 1Ogvzl-0005gA-3c
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Aug 2010 10:40:10 +0200
Received: from nvs0066.nedap.local ([10.91.8.1]) by smtp.nedap.com with
	Microsoft SMTPSVC(6.0.3790.1830); Thu, 5 Aug 2010 10:40:03 +0200
X-TM-IMSS-Message-ID: <551d48650001b0dd@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.0) id 551d48650001b0dd for
	<jaap.dejong@nedap.com>; Thu, 5 Aug 2010 10:40:00 +0100
Message-ID: <4C5A78E3.4030606@nedap.com>
Date: Thu, 05 Aug 2010 10:40:03 +0200
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.11) Gecko/20100713 Lightning/1.0b1 Thunderbird/3.0.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C56973F.9090208@nedap.com>
	<Pine.LNX.4.64.1008031934390.7055@juice.ott.cti.com>
In-Reply-To: <Pine.LNX.4.64.1008031934390.7055@juice.ott.cti.com>
X-OriginalArrivalTime: 05 Aug 2010 08:40:03.0748 (UTC)
	FILETIME=[CC8A1640:01CB3479]
X-SA-Exim-Connect-IP: 213.160.213.92
X-SA-Exim-Mail-From: jaap.dejong@nedap.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: PREMIRRORS trouble
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
X-List-Received-Date: Thu, 05 Aug 2010 08:40:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

#PREMIRRORS = "(ftp|http|https)://.*/.* http://myServer/sources/"
SOURCE_MIRROR_URL = "http://myServer/sources/"
INHERIT += "own-mirrors"

seems to work...
Thanks for your help!


On 08/04/2010 01:36 AM, Michael Smith wrote:
> On Mon, 2 Aug 2010, Jaap de Jong wrote:
>
>    
>>      PREMIRRORS = "(ftp|http|https)://.*/.* http://myServer/sources/"
>>      
>    
>> NOTE: Task failed: Unknown fetch Error: too many values to unpack
>>      
> Hi Jaap,
>
> Does it work if you set SOURCE_MIRROR_URL to your mirror, and add this to
> your conf somewhere?
>
> INHERIT += "own-mirrors"
>
> Just a guess, but maybe it has trouble with the "(ftp|http|https)".
>
> Mike
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>    


