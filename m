Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 22C086A352
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2013 15:41:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r4MFfRNu022935
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2013 08:41:27 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Wed, 22 May 2013 08:41:27 -0700
Message-ID: <519CE726.7090101@windriver.com>
Date: Wed, 22 May 2013 10:41:26 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <CA+YB3rYf0Tt181v+zAqCwjKk74uP88Zoaht_+FMuS7ee2tJRfQ@mail.gmail.com>
	<CALbNGRSV7KK5hPddSiVTRborW6_PZfYstDFfu4M2oRJ5QwtV_Q@mail.gmail.com>
	<519CCFFF.2060506@windriver.com>
	<CALbNGRTbELHNDyfF_0zfu9qL=ZpG17ffx3DU-bw8GNbrKODcgA@mail.gmail.com>
In-Reply-To: <CALbNGRTbELHNDyfF_0zfu9qL=ZpG17ffx3DU-bw8GNbrKODcgA@mail.gmail.com>
Subject: Re: [OE-core] OE TSC Minutes 7 May 2013
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 May 2013 15:41:27 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 5/22/13 9:33 AM, Andreas Müller wrote:
> On Wed, May 22, 2013 at 4:02 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
>> On 5/22/13 3:31 AM, Andreas Müller wrote:
>>>
>>> On Tue, May 21, 2013 at 9:36 PM, Jeff Osier-Mixon <jefro@jefro.net> wrote:
>>>>
>>>> OpenEmbedded Technical Steering Committee
>>>> 7 May 2013
>>>>
>>>> Attendees:
>>>>     Koen (koen)
>>>>     Khem (khem)
>>>>     Fray (fray)
>>>>     Paul (bluelightning)
>>>>     Richard (RP)
>>>> Apologies:
>>>>
>>>> Notes: Jefro
>>>>
>>>> Agenda at a glance:
>>>>
>>>> 1. pick a chair
>>>> 2. new issues
>>>> 3. lingering issues
>>>> a. systemd merge unhappiness
>>>> 4. projects in progress - status
>>>> a. oe-classic recipe migration status
>>>> b. oe-core release
>>>> c. systemd into master
>>>> d. meta-oe appends/overlayed recipes RFC
>>>> e. 1.5 planning
>>>> 5. infrastructure
>>>> a. mailing list moving to YP server, in progress
>>>> b. oe.org flooded
>>>> 6. projects deferred
>>>> a. raise awareness of "janitor" list, QA "bugs"
>>>> b. document whitespace changes to the shell
>>>> c. raise ntp with the Yocto Project [RP]
>>>>
>>> There are three issues I would like to comment on:
>>>
>>> 1. systemd migration:
>>>
>>>   From what I see the only major step left over is to bury meta-systemd.
>>> The only appends found there are those for oe-core. I asked for this
>>> long time ago [1] and support was offered but...
>>>
>>> 2. indention:
>>> Reading between the lines there is some unhappiness on meta-oe using
>>> four spaces for shell and python code. I personally agree with Martin
>>> here because I have not seen a technical reason for shell requiring
>>> tabs so far. To me this looks like a style decision which increases
>>> the burden to submit for low-skilled people like me. Could somebody
>>> please enlighten me: For what technical reason do we need tabs in
>>> shell code?
>>
>>
>> (Background) When the spacing was decided, looking at the existing OE
>> recipes and classes, the majority of things were indented such that python
>> used tabs, and recipe (shell scripting) used spaces.  During the cleanup of
>> the scripting sections it was decided that the least impact to all was
>> desirable.  Thus the python-tab, shell-spaces convention.
>
> ??? - see
>
> commit 604d46c686d06d62d5a07b9c7f4fa170f99307d8
> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> Date:   Wed Jul 11 17:33:43 2012 +0000
>
>      Convert tab indentation in python functions into four-space
>
>      Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
>
> So now at least I am totally confused ( which might be an argument
> preferring only one type of indentation )

Sorry, I've been working on too many projects lately..  I switched python and 
shell in what I was saying.

It's python that's four spaces, shell that's tabs.. but the rational is the 
same.  Python is strict, shell is not.. existing conventions were used.

Sorry for the confusion.

--Mark

>>
>> It's true that shell scripts don't really care about indenting, so the four
>> spaces is just a convention that was decided on based on that.  The concern
>> is that if we go in and change the convention now, it's going to cause a lot
>> of potential disruption.
>>
>> So the answer isn't that it's a technical reason, it's a community reason.
>
> Please give me the link to the decision written and I'll follow the community.
>
>> Don't rock the boat on something that is just going to annoy people and
>> provide no actual help.  So far I haven't seen a compelling argument to
>> change the convention BTW, other then (paraphrase) "I don't like spaces, and
>> want to use tabs".  (Note, when I write shell scripts, I prefer tabs as
>> well..)
>>
>
> Please don't misunderstand me: I thought I have read some sidenotes on
> meta-oe using four-spaces for all type of code:
>
> (9:31:13 AM) fray: ok.. so what about the comment of an 'oe'
> maintainer ignoring the TSC?
>
> Maybe I am over-interpreting this. Whatever, this is not that
> important and should stop here - we face other challenges - sorry for
> the noise
>
> Andreas
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>


