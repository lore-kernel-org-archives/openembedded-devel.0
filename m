Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1Nk5YB-0006ic-0e
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Feb 2010 01:56:30 +0100
Received: (qmail 13560 invoked by uid 1003); 24 Feb 2010 00:53:41 -0000
Received: from localhost (HELO ?192.168.1.182?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 24 Feb 2010 00:53:40 -0000
Message-ID: <4B847891.7030706@balister.org>
Date: Tue, 23 Feb 2010 16:53:37 -0800
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.7) Gecko/20100120 Fedora/3.0.1-1.fc11 Thunderbird/3.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <mailman.5.1266922802.8892.openembedded-devel@lists.openembedded.org>	<4B83DD5C.8050408@tycoelectronics.com>
	<4B8458A7.40807@balister.org>
	<19c1b8a91002231509v4a7d870dia190e9aa2c0f6739@mail.gmail.com>
In-Reply-To: <19c1b8a91002231509v4a7d870dia190e9aa2c0f6739@mail.gmail.com>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: How to build g++ to run on target?
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
X-List-Received-Date: Wed, 24 Feb 2010 00:56:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



On 02/23/2010 03:09 PM, Khem Raj wrote:
> On Tue, Feb 23, 2010 at 2:37 PM, Philip Balister<philip@balister.org>  wrote:
>> On 02/23/2010 05:51 AM, Jay Snyder wrote:
>>>
>>> I was able to build gcc for installation directly onto the OE target
>>> with "bitbake gcc". "bitbake g++" gives me "nothing provides g++".
>>>
>>> What is the magic bitbake command to provide this?
>>
>> bitbake task-sdk-native, and install task-native-sdk. Anyone know why the
>> task creates a package with different name?
>
> may be because
>
> task-sdk-native.bb:RPROVIDES_${PN} = "task-native-sdk"

I know that :) I am curious why the renaming.

Philip

>
>>
>> Philip
>>
>>
>>>
>>> Thank you,
>>> Jay Snyder
>>>
>>>
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


