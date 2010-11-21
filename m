Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1PKDeF-0002sB-IQ
	for openembedded-devel@lists.openembedded.org;
	Sun, 21 Nov 2010 18:24:20 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 2111A314ADE9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Nov 2010 18:23:11 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id eshG-Ws2d6tM
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Nov 2010 18:23:04 +0100 (CET)
Received: from [172.22.22.60] (ip-109-90-189-193.unitymediagroup.de
	[109.90.189.193])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id A4D0E314ADD6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Nov 2010 18:23:04 +0100 (CET)
Message-ID: <4CE95578.8000604@opendreambox.org>
Date: Sun, 21 Nov 2010 18:23:04 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.12) Gecko/20101027 Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CE6FA0C.2090801@balister.org> <4CE9332C.7020701@opendreambox.org>
	<AANLkTim-vJEbUXtQtm4TQLbKBBrwG2m_tbao0u4kJuWu@mail.gmail.com>
In-Reply-To: <AANLkTim-vJEbUXtQtm4TQLbKBBrwG2m_tbao0u4kJuWu@mail.gmail.com>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
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
X-List-Received-Date: Sun, 21 Nov 2010 17:24:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 11/21/2010 05:17 PM, Khem Raj wrote:
> On Sun, Nov 21, 2010 at 6:56 AM, Andreas Oberritter
> <obi@opendreambox.org> wrote:
>> On 11/19/2010 11:28 PM, Philip Balister wrote:
>>> I'd like to revert commit c2c8fe4c5629add94bd0b922f5b3446624a9f4d8. With
>>> this commit my build that includes angstrom-task-gnome.bb fails in a
>>> peculiar way. Basically, my process table is filled with a task. Looks
>>> like it is trying to run a pkg-config gtk+ operation. This is with
>>> angstrom-2010.x and a custom machine very similar to an overo.
>>>
>>> I realize this is a vague description, but I do not have time to isolate
>>> better at this time.
>>>
>>> Can we go ahead and revert this for now?
>>
>> No, please don't.
>>
>> I'm 100% sure that this patch is the only sane way of handling
>> pkg-config files. I hope you agree that it wasn't possible for me to
>> test every single package before this got merged.
>>
> 
> agreed. but we are soon going to make a release. So it compiled (in
> whatever way)
> and now it doesnt (looking from 36000 ft above).
> So either we fix the known regressions caused or backout because we
> can not make release in this state for sure.

Soon means in 10 days AFAIK, and you can still revert the patch in the
release branch if needed. No need to revert it in master just to hide
already existing bugs.

>> Still, the solution for problems popping up now is simple: Make sure
>> that required libraries install their pkg-config files themselves.
>> Usually, they would already do it, but their install rules are
>> overridden by custom do_install or do_stage rules in their bitbake recipe.
>>
>> As you already mentioned, the package causing the problem is gtk+
>> (gtk+-1.2_1.2.10.bb).
>>
>> The solution in this case is very likely to
>> - remove do_stage
>> - add ${bindir}/gtk-config to FILES_${PN}-dev
>> - bump PR
>>
> 
> super can you cook up a patch.

Sure, but only after I either received positive feedback or the build on
my newly set up host finished. That's why I wrote:

>> I'd have already submitted a patch, but testing takes a lot of time,
>> especially when a recipe takes down the build machine.

Regards,
Andreas


