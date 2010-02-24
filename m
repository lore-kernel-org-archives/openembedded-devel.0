Received: from exprod5og107.obsmtp.com ([64.18.0.184])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martyn.welch@ge.com>) id 1NkHWI-0008S1-80
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Feb 2010 14:43:21 +0100
Received: from source ([4.78.218.129]) (using TLSv1) by
	exprod5ob107.postini.com ([64.18.4.12]) with SMTP
	ID DSNKS4UsUVqf3XkSbos/afW9YoPyDQZYW7fJ@postini.com;
	Wed, 24 Feb 2010 05:40:35 PST
Received: from unknown (HELO cinmlip01.e2k.ad.ge.com) ([3.159.213.48])
	by Cinmlip09.e2k.ad.ge.com with ESMTP; 24 Feb 2010 03:54:11 -0500
Received: from es-j7s4d2j.amer.consind.ge.com (HELO [3.138.54.92])
	([3.138.54.92])
	by cinmlip01.e2k.ad.ge.com with ESMTP; 24 Feb 2010 03:54:07 -0500
Message-ID: <4B84E9E5.8060903@ge.com>
Date: Wed, 24 Feb 2010 08:57:09 +0000
From: Martyn Welch <martyn.welch@ge.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <mailman.5.1266922802.8892.openembedded-devel@lists.openembedded.org>	<4B83DD5C.8050408@tycoelectronics.com>
	<4B8458A7.40807@balister.org>	<19c1b8a91002231509v4a7d870dia190e9aa2c0f6739@mail.gmail.com>	<4B847891.7030706@balister.org>
	<1266973598.18176.366.camel@trini-m4400>
In-Reply-To: <1266973598.18176.366.camel@trini-m4400>
X-SA-Exim-Connect-IP: 64.18.0.184
X-SA-Exim-Mail-From: martyn.welch@ge.com
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
X-List-Received-Date: Wed, 24 Feb 2010 13:43:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Tom Rini wrote:
> On Tue, 2010-02-23 at 16:53 -0800, Philip Balister wrote:
>   
>> On 02/23/2010 03:09 PM, Khem Raj wrote:
>>     
>>> On Tue, Feb 23, 2010 at 2:37 PM, Philip Balister<philip@balister.org>  wrote:
>>>       
>>>> On 02/23/2010 05:51 AM, Jay Snyder wrote:
>>>>         
>>>>> I was able to build gcc for installation directly onto the OE target
>>>>> with "bitbake gcc". "bitbake g++" gives me "nothing provides g++".
>>>>>
>>>>> What is the magic bitbake command to provide this?
>>>>>           
>>>> bitbake task-sdk-native, and install task-native-sdk. Anyone know why the
>>>> task creates a package with different name?
>>>>         
>>> may be because
>>>
>>> task-sdk-native.bb:RPROVIDES_${PN} = "task-native-sdk"
>>>       
>> I know that :) I am curious why the renaming.
>>     
>
> And if perhaps we couldn't get a different name altogether?  'native'
> has a meaning normally that's not what it means here.
> task-on-device-sdk is a bit wordy, but avoids 'native'.  Of course,
> 'native development' also has a meaning too.. RPROVIDES perhaps?  Or is
> that just the worst of both worlds.
"target"?

-- 
Martyn Welch (Principal Software Engineer)   |   Registered in England and
GE Intelligent Platforms                     |   Wales (3828642) at 100
T +44(0)127322748                            |   Barbirolli Square, Manchester,
E martyn.welch@ge.com                        |   M2 3AB  VAT:GB 927559189



