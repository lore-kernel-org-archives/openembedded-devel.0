Received: from starfish.geekisp.com ([216.168.135.166])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1PKEJd-0005kS-6S
	for openembedded-devel@lists.openembedded.org;
	Sun, 21 Nov 2010 19:07:06 +0100
Received: (qmail 27392 invoked by uid 1003); 21 Nov 2010 18:05:46 -0000
Received: from adsl-75-37-22-143.dsl.pltn13.sbcglobal.net (HELO
	?192.168.1.148?) (philip@opensdr.com@75.37.22.143)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	21 Nov 2010 18:05:46 -0000
Message-ID: <4CE95F77.9000804@balister.org>
Date: Sun, 21 Nov 2010 10:05:43 -0800
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.12) Gecko/20101027 Fedora/3.1.6-1.fc13 Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CE6FA0C.2090801@balister.org>
	<4CE9332C.7020701@opendreambox.org>	<AANLkTim-vJEbUXtQtm4TQLbKBBrwG2m_tbao0u4kJuWu@mail.gmail.com>
	<4CE95578.8000604@opendreambox.org>
In-Reply-To: <4CE95578.8000604@opendreambox.org>
X-SA-Exim-Connect-IP: 216.168.135.166
X-SA-Exim-Mail-From: philip@balister.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Revert commit c2c8fe4c5629add94bd0b922f5b3446624a9f4d8
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
X-List-Received-Date: Sun, 21 Nov 2010 18:07:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/21/2010 09:23 AM, Andreas Oberritter wrote:
> On 11/21/2010 05:17 PM, Khem Raj wrote:
>> On Sun, Nov 21, 2010 at 6:56 AM, Andreas Oberritter
>> <obi@opendreambox.org>  wrote:
>>> On 11/19/2010 11:28 PM, Philip Balister wrote:
>>>> I'd like to revert commit c2c8fe4c5629add94bd0b922f5b3446624a9f4d8. With
>>>> this commit my build that includes angstrom-task-gnome.bb fails in a
>>>> peculiar way. Basically, my process table is filled with a task. Looks
>>>> like it is trying to run a pkg-config gtk+ operation. This is with
>>>> angstrom-2010.x and a custom machine very similar to an overo.
>>>>
>>>> I realize this is a vague description, but I do not have time to isolate
>>>> better at this time.
>>>>
>>>> Can we go ahead and revert this for now?
>>>
>>> No, please don't.
>>>
>>> I'm 100% sure that this patch is the only sane way of handling
>>> pkg-config files. I hope you agree that it wasn't possible for me to
>>> test every single package before this got merged.
>>>
>>
>> agreed. but we are soon going to make a release. So it compiled (in
>> whatever way)
>> and now it doesnt (looking from 36000 ft above).
>> So either we fix the known regressions caused or backout because we
>> can not make release in this state for sure.
>
> Soon means in 10 days AFAIK, and you can still revert the patch in the
> release branch if needed. No need to revert it in master just to hide
> already existing bugs.

If we can fix this before the release, I am happy. It looks like several 
people are working on this. I'll be traveling most of the next week, but 
I will try to keep testing .dev to make sure this is OK for the release.

Thanks for working on this issue!

Philip



>
>>> Still, the solution for problems popping up now is simple: Make sure
>>> that required libraries install their pkg-config files themselves.
>>> Usually, they would already do it, but their install rules are
>>> overridden by custom do_install or do_stage rules in their bitbake recipe.
>>>
>>> As you already mentioned, the package causing the problem is gtk+
>>> (gtk+-1.2_1.2.10.bb).
>>>
>>> The solution in this case is very likely to
>>> - remove do_stage
>>> - add ${bindir}/gtk-config to FILES_${PN}-dev
>>> - bump PR
>>>
>>
>> super can you cook up a patch.
>
> Sure, but only after I either received positive feedback or the build on
> my newly set up host finished. That's why I wrote:
>
>>> I'd have already submitted a patch, but testing takes a lot of time,
>>> especially when a recipe takes down the build machine.
>
> Regards,
> Andreas
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


