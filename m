Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1NVPw6-0005Md-K0
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Jan 2010 14:40:33 +0100
Received: (qmail 11562 invoked by uid 1003); 14 Jan 2010 13:38:17 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 14 Jan 2010 13:38:17 -0000
Message-ID: <4B4F1E48.5030008@balister.org>
Date: Thu, 14 Jan 2010 08:38:16 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.5) Gecko/20091209 Fedora/3.0-3.fc11 Thunderbird/3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <353547.18069.qm@web112505.mail.gq1.yahoo.com>
In-Reply-To: <353547.18069.qm@web112505.mail.gq1.yahoo.com>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: =?UTF-8?B?UmU6IERvZXMgT0XigJlzIEFuZ3N0cm9tIExpbnV4IHN1cHBvcnQgU01QIChTeW1tZXRyaWMgbXVsdGlwcm9jZXNzaW5nKSBvbiBiZWFnbGUgYm9hcmQu?=
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
X-List-Received-Date: Thu, 14 Jan 2010 13:40:34 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 01/13/2010 10:06 AM, gagan singh wrote:
> Hi Phil,
>              Thanks for the response.  So you recon Asynchronous Multi-Processing (AMP) concept is better suited in beagle board configuration.   If so what exactly I have to do in angstom to get such thing working.
>
> regards

Read up on dsplink, codec engine and dsp bridge. These are all packages 
for using the DSP from linux running on the ARM.

Philip


>
> Gagan
>
>
> --- On Tue, 1/12/10, Phil Blundell<philb@gnu.org>  wrote:
>
>
> From: Phil Blundell<philb@gnu.org>
> Subject: Re: [oe] Does OE’s Angstrom Linux support SMP (Symmetric multiprocessing) on beagle board.
> To: openembedded-devel@lists.openembedded.org
> Date: Tuesday, January 12, 2010, 11:44 AM
>
>
> I would have thought the interconnect performance would be the least of
> your worries.  It seems that a rather bigger obstacle to running any
> kind of SMP on this hardware would be the issue that the two cores have
> different instruction sets: the DSP can't execute ARM code, and the ARM
> can't execute DSP code.
>
> p.
>
> On Tue, 2010-01-12 at 07:51 -0800, gagan singh wrote:
>> Hi Phil,
>>
>> I thought general response time of any general application time will be faster.
>> Say Just getting a feeling of running General purpose Computer OS/applications  on a 1 GHz  processor while actually it is running on 500MHz CPU with SMP support(Keeping overhead time aside)
>>              DSP seems to remain idle most of the time while everything runs on Arm core.  You says difficult to implement on that sort Of Cores. Do the inter communication link/memory interface  is bottle neck for implementing shared workload.
>>
>> regards
>>
>> Gagan
>>
>>
>> --- On Tue, 1/12/10, Phil Blundell<philb@gnu.org>  wrote:
>>
>>
>> From: Phil Blundell<philb@gnu.org>
>> Subject: Re: [oe] Does OE’s Angstrom Linux support SMP (Symmetric multiprocessing) on beagle board.
>> To: openembedded-devel@lists.openembedded.org
>> Date: Tuesday, January 12, 2010, 10:06 AM
>>
>>
>> On Tue, 2010-01-12 at 06:57 -0800, gagan singh wrote:
>>>                        Do the Angstrom version of Linux supports SMP for  Dual core (A8 + TI DSP 320C64x) beagle board. If not, where I should look in tutorial to work on adding support for such a feature.
>>>    I try Google it but no much could be located.
>>
>> I'm not quite sure what you are trying to do here.  It's hard to imagine
>> how you could have any meaningful kind of "symmetric" multiprocessing on
>> that combination of cores.
>>
>> What exactly are you hoping to achieve?
>>
>> p.
>>
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>>
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


