Received: from smtprelay-b12.telenor.se ([62.127.194.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1QLbDb-0002g4-Bo
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 May 2011 15:18:47 +0200
Received: from ipb1.telenor.se (ipb1.telenor.se [195.54.127.164])
	by smtprelay-b12.telenor.se (Postfix) with ESMTP id 551B3EA72C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 May 2011 15:15:56 +0200 (CEST)
X-SENDER-IP: [83.227.57.42]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AscVAILRz01T4zkqPGdsb2JhbAAMphMBAQEBN8kkhhkEjkSBTY53
X-IronPort-AV: E=Sophos;i="4.64,369,1301868000"; 
	d="scan'208,217";a="189838600"
Received: from c-2a39e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.247]) ([83.227.57.42])
	by ipb1.telenor.se with ESMTP; 15 May 2011 15:15:56 +0200
Message-ID: <4DCFD20A.9090907@atmel.com>
Date: Sun, 15 May 2011 15:15:54 +0200
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <201105051150.06842.sgh@sgh.dk>	<4DC2827E.9020801@mlbassoc.com>	<4DCE3FCF.4050706@atmel.com>	<4DCE9282.5080603@mentor.com>	<F619927BD5260540BACE9E197A0F2A692005F7@hammb01.corp.atmel.com>	<4DCF059F.5080403@atmel.com>
	<4DCFC46F.3030300@mlbassoc.com>
In-Reply-To: <4DCFC46F.3030300@mlbassoc.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: perl-native fails on Ubuntu 11.04
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
X-List-Received-Date: Sun, 15 May 2011 13:18:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

2011-05-15 14:17, Gary Thomas skrev:
> On 05/14/2011 04:43 PM, Ulf Samuelsson wrote:
>>
>>> Skickat: l=F6 2011-05-14 16:32
>>> Till: openembedded-devel@lists.openembedded.org
>>> =C4mne: Re: [oe] perl-native fails on Ubuntu 11.04
>>>
>>> On 05/14/2011 01:39 AM, Ulf Samuelsson wrote:
>>>> 2011-05-05 12:57, Gary Thomas skrev:
>>>>> On 05/05/2011 03:50 AM, S=F8ren Holm wrote:
>>>>>> Please apply this patch to make perl-native build on Ubuntu 11.04
>>>>>>
>>>>>> https://gist.github.com/raw/925006/4217f358fb00b5b7f1dfbd1ce5f4afa=
4f64b0bb0/0001-perl-native-multilib-patch-for-ubuntu-11.04.patch=20
>>>>>>
>>>>>>
>>>>> This patch only works for x86_64 systems. A corrected version
>>>>> replaces `uname -m` with * in
>>>>> ++test -f /usr/lib/*-linux-gnu/libc.so&&
>>>>> glibpth=3D"/usr/lib/*-linux-gnu $glibpth"
>>>>>
>>>>
>>>> Yes , Just installed Ubuntu 11.04 on a machine and I tried that patc=
h
>>>> and failed.
>>>> 'uname -m` returns i686 but the library is in i386-linux-gnu
>>>> I symlinked i686-linux-gnu to i386-linux-gnu, and then the build=20
>>>> completes.
>>>>
>>>> `uname -i` will return i386 so that is an alternative as well.
>>> On my x86_64 ubuntu 10.04 box it returns unknown, so I think we'll ha=
ve
>>> to use the glob.
>>>
>>
>> How about using:
>> dirname `find /usr/lib/*-linux-gnu/libc.so`
>
> That's no different than just the glob
>

I may be mistaken, but I think that with the glob,
glibpth will contain    "/usr/lib/*-linux-gnu"
with the proposed patch,
glibpth will contain (on my machine) "/usr/lib/i386-linux-gnu"

Not a big difference, I admit, but I think the latter is a tad more=20
efficient.

BR
Ulf Samuelsson


