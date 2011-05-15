Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1QLfMa-0008Gj-5Z
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 May 2011 19:44:21 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id 8320A16601A6; Sun, 15 May 2011 11:41:29 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2-r929478 (2010-03-31) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2-r929478
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 6C52D166015E;
	Sun, 15 May 2011 11:41:27 -0600 (MDT)
Message-ID: <4DD01047.6000007@mlbassoc.com>
Date: Sun, 15 May 2011 11:41:27 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc13
	Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <201105051150.06842.sgh@sgh.dk>	<4DC2827E.9020801@mlbassoc.com>	<4DCE3FCF.4050706@atmel.com>	<4DCE9282.5080603@mentor.com>	<F619927BD5260540BACE9E197A0F2A692005F7@hammb01.corp.atmel.com>	<4DCF059F.5080403@atmel.com>	<4DCFC46F.3030300@mlbassoc.com>
	<4DCFD20A.9090907@atmel.com>
In-Reply-To: <4DCFD20A.9090907@atmel.com>
Cc: Ulf Samuelsson <ulf.samuelsson@atmel.com>
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
X-List-Received-Date: Sun, 15 May 2011 17:44:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

On 05/15/2011 07:15 AM, Ulf Samuelsson wrote:
> 2011-05-15 14:17, Gary Thomas skrev:
>> On 05/14/2011 04:43 PM, Ulf Samuelsson wrote:
>>>
>>>> Skickat: l=F6 2011-05-14 16:32
>>>> Till: openembedded-devel@lists.openembedded.org
>>>> =C4mne: Re: [oe] perl-native fails on Ubuntu 11.04
>>>>
>>>> On 05/14/2011 01:39 AM, Ulf Samuelsson wrote:
>>>>> 2011-05-05 12:57, Gary Thomas skrev:
>>>>>> On 05/05/2011 03:50 AM, S=F8ren Holm wrote:
>>>>>>> Please apply this patch to make perl-native build on Ubuntu 11.04
>>>>>>>
>>>>>>> https://gist.github.com/raw/925006/4217f358fb00b5b7f1dfbd1ce5f4af=
a4f64b0bb0/0001-perl-native-multilib-patch-for-ubuntu-11.04.patch
>>>>>>>
>>>>>> This patch only works for x86_64 systems. A corrected version
>>>>>> replaces `uname -m` with * in
>>>>>> ++test -f /usr/lib/*-linux-gnu/libc.so&&
>>>>>> glibpth=3D"/usr/lib/*-linux-gnu $glibpth"
>>>>>>
>>>>>
>>>>> Yes , Just installed Ubuntu 11.04 on a machine and I tried that pat=
ch
>>>>> and failed.
>>>>> 'uname -m` returns i686 but the library is in i386-linux-gnu
>>>>> I symlinked i686-linux-gnu to i386-linux-gnu, and then the build co=
mpletes.
>>>>>
>>>>> `uname -i` will return i386 so that is an alternative as well.
>>>> On my x86_64 ubuntu 10.04 box it returns unknown, so I think we'll h=
ave
>>>> to use the glob.
>>>>
>>>
>>> How about using:
>>> dirname `find /usr/lib/*-linux-gnu/libc.so`
>>
>> That's no different than just the glob
>>
>
> I may be mistaken, but I think that with the glob,
> glibpth will contain "/usr/lib/*-linux-gnu"
> with the proposed patch,
> glibpth will contain (on my machine) "/usr/lib/i386-linux-gnu"
>
> Not a big difference, I admit, but I think the latter is a tad more eff=
icient.

No, the glob will be expanded in the assignment (globs inside of "" strin=
gs
are expanded by the shell)

--=20
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


