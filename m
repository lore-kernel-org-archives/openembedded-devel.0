Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QWghl-0003H8-W3
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Jun 2011 05:23:46 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5F3KJFn007089
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jun 2011 20:20:19 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 14 Jun 2011 20:20:18 -0700
Message-ID: <4DF824F2.3050204@windriver.com>
Date: Tue, 14 Jun 2011 22:20:18 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1308037783-31218-1-git-send-email-james@digitalmatter.com.au>	<1308043009.25285.219.camel@phil-desktop>	<840A81C1B782724A8EB52725BD519EFF02EA9D@MBX20.4emm.local>
	<4DF820DD.30606@windriver.com>
In-Reply-To: <4DF820DD.30606@windriver.com>
Subject: Re: [PATCH] prelink: Added prelink-20100106, which works on ARM.
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
X-List-Received-Date: Wed, 15 Jun 2011 03:23:46 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 6/14/11 10:02 PM, Mark Hatle wrote:
> Have you looked at:
> 
> http://git.yoctoproject.org/cgit/cgit.cgi/prelink-cross/
> 
> As far as I'm aware, this version works properly for all of the expected
> targets, including ARM.
> 
> If it doesn't work, someone should submit a patch to the maintainer (me) and
> we'll get things resolved.
> 
> The Yocto prelinker contains both local (on-target) as well as cross-prelinking
> support... (This is already integrated into oe-core)

Forgot to note, look at the cross_prelink branch.  This is the head of tree for
the embedded items.  The "master" is a mirror of the current SVN tree from Jakub
Jelinek.

The ld-linux... patch hunk is already there, and in a better shape then the one
proposed.  Both the ld-linux.so.2 and ld-linux.so.3 are supported.

> --Mark
> 
> On 6/14/11 8:16 PM, James Limbouris wrote:
>> On Tuesday, 14 June 2011 5:17 PM, Phil Blundell wrote:
>>> On Tue, 2011-06-14 at 15:49 +0800, James Limbouris wrote:
>>>> This version of prelink, together with a patch by Carsten Munk
>>>> <carsten@maemo.org>, taken from MeeGo, fixes an ARM incompatibility
>>>> with 20090925.
>>>>
>>>> Signed-off-by: James Limbouris <james@digitalmatter.com.au>
>>>> ---
>>>>  .../prelink-20100106-arm-fix.patch                 |   86 ++++++++++++++++++++
>>>>  recipes/prelink/prelink_20100106.bb                |   53 ++++++++++++
>>>>  2 files changed, 139 insertions(+), 0 deletions(-)  create mode
>>>> 100755 recipes/prelink/prelink-20100106/prelink-20100106-arm-fix.patch
>>>>  create mode 100644 recipes/prelink/prelink_20100106.bb
>>>>
>>>> diff --git
>>>> a/recipes/prelink/prelink-20100106/prelink-20100106-arm-fix.patch
>>>> b/recipes/prelink/prelink-20100106/prelink-20100106-arm-fix.patch
>>>> new file mode 100755
>>>> index 0000000..a694541
>>>> --- /dev/null
>>>> +++ b/recipes/prelink/prelink-20100106/prelink-20100106-arm-fix.patch
>>>> @@ -0,0 +1,86 @@
>>>> +diff -ru prelink-old/src/arch-arm.c prelink/src/arch-arm.c
>>>> +--- prelink-old/src/arch-arm.c	2009-06-15 07:37:50.000000000 -0400
>>>> ++++ prelink/src/arch-arm.c	2010-08-17 03:35:05.000000000 -0400
>>>> +@@ -832,7 +832,7 @@
>>>> +   .R_COPY = R_ARM_COPY,
>>>> +   .R_RELATIVE = R_ARM_RELATIVE,
>>>> +   .rtype_class_valid = RTYPE_CLASS_VALID,
>>>> +-  .dynamic_linker = "/lib/ld-linux.so.2",
>>>> ++  .dynamic_linker = "/lib/ld-linux.so.3",
>>>
>>> That looks like it's going to break OABI binaries.  I'm not sure to what extent
>>> we care about those anymore, but I'm not sure I would describe this as a
>>> "fix" exactly.
>>>
>>>> +-  switch (vfork ())
>>>> ++  switch (pid=fork ())
>>>> +     {
>>>> +     case -1:
>>>> +       error (0, errno, "Could not run %s", path); @@ -63,7 +65,9 @@
>>>> + 	  close (p[1]);
>>>> + 	}
>>>> +       dup2 (1, 2);
>>>> +-      execve (path, argv, envp);
>>>> ++      while (*envp)
>>>> ++        putenv(*envp++);
>>>> ++      execv (path, argv);
>>>> +       _exit (127);
>>>
>>> What's that about?
>>>
>>> p.
>>
>> Hi,
>>
>> I believe the vfork() changes are for qemu compatibility - I don't know what the issue was exactly.
>>
>> I didn't realise the linker version was for EABI/OABI compatibility - I guess prelink should determine the ABI and choose accordingly... 
>> But I don't have any OABI binaries on my system at all...
>> So we can:
>> 	1. Fix it properly
>> 	2. Switch from OABI only to EABI only
>> 	3. Make a prelink-eabi recipe.
>>
>> I don't really have the patience for 1., since I have no OABI binaries. Does anyone have any preferences here?
>>
>> Regards,
>> James
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



