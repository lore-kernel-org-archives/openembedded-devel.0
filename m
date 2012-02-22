Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1S0JuI-0000Dx-06
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Feb 2012 22:39:26 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 5B78EF81225; Wed, 22 Feb 2012 14:31:06 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 368FEF8121D;
	Wed, 22 Feb 2012 14:31:04 -0700 (MST)
Message-ID: <4F455E98.3010308@mlbassoc.com>
Date: Wed, 22 Feb 2012 14:31:04 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:10.0) Gecko/20120131 Thunderbird/10.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <CALbNGRSPf7xJ8wziDTbi7c6vsbwx-ve93dJioJBru5RNusferw@mail.gmail.com>
	<CAEsOVNdi-m0y=FsJ_yu8CxK=UiPYdrV8bAV3_Y0mzKc6ft+h3g@mail.gmail.com>
	<CAMKF1srj5zBNQy=bQ1Co0jEV6yryx=EU=vyy2+3KwGUEUxiYkw@mail.gmail.com>
In-Reply-To: <CAMKF1srj5zBNQy=bQ1Co0jEV6yryx=EU=vyy2+3KwGUEUxiYkw@mail.gmail.com>
Subject: Re: gcc-cross-initial patching fails
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
X-List-Received-Date: Wed, 22 Feb 2012 21:39:26 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-02-22 14:18, Khem Raj wrote:
> On Wed, Feb 22, 2012 at 12:15 PM, McClintock Matthew-B29882
> <B29882@freescale.com>  wrote:
>>> Applying patch gcc45-no-add-needed.patch
>>> patching file gcc/config/alpha/elf.h
>>> patching file gcc/config/ia64/linux.h
>>> patching file gcc/config/linux.h
>>> Hunk #1 succeeded at 89 (offset -12 lines).
>>> patching file gcc/config/rs6000/sysv4.h
>>> Hunk #1 FAILED at 908.
>>> 1 out of 1 hunk FAILED -- rejects in file gcc/config/rs6000/sysv4.h
>>> Patch gcc45-no-add-needed.patch does not apply (enforce with -f)
>>> ERROR: Function failed: patch_do_patch
>>> ERROR: Logfile of failure stored in:
>>> /home/Superandy/tmp/oe-core-eglibc/work-shared/gcc-4.5-r45+svnr181733/temp/log.do_patch.5367
>>> NOTE: package gcc-cross-initial-4.5-r45+svnr181733: task do_patch: Failed
>>> ERROR: Task 2829
>>> (/home/Superandy/data/oe-core/sources/meta-openembedded/meta-oe/recipes-devtools/gcc/gcc-cross-initial_4.5.bb,
>>> do_patch) failed with exit code '1'
>>>
>>> git log does not help me much -  what goes wrong?
>>
>> Which actual patch is it failing on? Is there a conflict between
>> oe-core and meta-oe patch set against gcc?
>
> gcc45-no-add-needed.patch is the patch in question. I dont see
> anything wrong with it.
> Can you do bitbake -ccleanall gcc-cross-initial and redo bitbake
> gcc-cross-initial -cpatch ?

I saw this as well after updating today but not a totally clean build tree.
I'm building now totally from scratch (no build tree) and it seems
to no longer have the issue.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


