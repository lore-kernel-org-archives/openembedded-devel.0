Received: from smtp4.nedap.com ([213.160.213.85] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jaap.dejong@nedap.com>) id 1UPwvw-0000qu-A1
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Apr 2013 17:27:37 +0200
Received: from nvs0066.nedap.local (10.91.8.1) by relaysmtp1.nedap.local
	(10.1.8.139) with Microsoft SMTP Server id 8.3.279.5; Wed, 10 Apr 2013
	17:10:12 +0200
X-TM-IMSS-Message-ID: <69ce129b0005094d@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.1) id 69ce129b0005094d ;
	Wed, 10 Apr 2013 17:10:14 +0200
Message-ID: <516580D4.1030802@nedap.com>
Date: Wed, 10 Apr 2013 17:10:12 +0200
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:16.0) Gecko/20121011 Thunderbird/16.0.1
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <51656126.2020505@nedap.com> <5165792D.9070200@nedap.com>
	<2302654.XPc2iUTDec@helios> <1683367.FB5G2sIQUU@helios>
In-Reply-To: <1683367.FB5G2sIQUU@helios>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: dropbear
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
X-List-Received-Date: Wed, 10 Apr 2013 15:27:43 -0000
X-List-Received-Date: Wed, 10 Apr 2013 15:27:43 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


On 04/10/2013 04:50 PM, Paul Eggleton wrote:
> On Wednesday 10 April 2013 15:47:09 Paul Eggleton wrote:
>> On Wednesday 10 April 2013 16:37:33 Jaap de Jong wrote:
>>> On 04/10/2013 04:04 PM, Paul Eggleton wrote:
>>>> On Wednesday 10 April 2013 14:55:02 Jaap de Jong wrote:
>>>>> dropbear 2013.56 is currently the most recent version.
>>>>> Although not documented, they left out the functionality patched in
>>>>> with
>>>>> allow-nopw.patch in the 2013.56 release.
>>>> How did you find this out?
>>> the patch fails and inspection of the code learns that it can't be
>>> applied.
>> Ah right - to explain what has happened, I developed a new patch to change
>> dropbear so that the functionality is now controlled through a command-line
>> switch, and that is now configured in the image using a script in
>> /etc/default/; if you look at the dropbear recipe in master you can see how
>> it works. This avoids the need to rebuild dropbear depending upon the value
>> of IMAGE_FEATURES which was not really ideal.
>>
>> If you want to use the latest version of dropbear with an older branch I'd
>> suggest just taking the dropbear recipe in master, removing the nopw-option
>> patch (which has been applied).
Seems that the nopw-option.patch is added to dropbear rev 2013.56, so 
that one should be remove also from the list of patches to apply.
> If you do do this you'll also need to apply this patch:
>
> http://cgit.openembedded.org/openembedded-core/commit/?id=0937054e6e3e02565f57e60a8bdc14b0ad62e249
Ok.
Thanks for your help!

> Cheers,
> Paul
>



