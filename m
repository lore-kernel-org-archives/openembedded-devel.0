Received: from mail-lb0-f181.google.com ([209.85.217.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1URPEu-0000Ft-Pq
	for openembedded-devel@lists.openembedded.org;
	Sun, 14 Apr 2013 17:53:15 +0200
Received: by mail-lb0-f181.google.com with SMTP id r11so3803045lbv.26
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Apr 2013 08:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type:content-transfer-encoding;
	bh=tCkT4OILHeXyX/WFQ0rQtB6nztWsBfDH6WwV8ujE/dA=;
	b=tJZQN61PRh0RTAE2uuUUXzPEVlplt2so6LpYNEEalUsvaIyPLy8w9BNt78FjHWGbWd
	36ZzqyeYEriunmKny882d6PdHc7VbD1LlKADwZzMsu/vZNhbaAAVsdUAcREZb418Mkyw
	4gCCIwdlYsGeAni/j6s+9zMmMpaStRHyK+lSUJLeAmaKbx5ixy/R7928kKnCN5G7fBOa
	pbdOG4FcK1ff21sNvX457LVjwvsEiQAzuVHIrV21QJKvqeHKHkdEMW97L72NAnh8PrrG
	3SHKlloTJCtXxSbu6xd6Cl3zHuS8iWc/3KXYaSARW1ZhqiMvlAargDEYfRaVnDlB4+cK
	WuGA==
MIME-Version: 1.0
X-Received: by 10.112.147.170 with SMTP id tl10mr8621137lbb.100.1365953745306; 
	Sun, 14 Apr 2013 08:35:45 -0700 (PDT)
Received: by 10.112.75.161 with HTTP; Sun, 14 Apr 2013 08:35:45 -0700 (PDT)
In-Reply-To: <20130414145452.GD2475@jama>
References: <20130412225236.GZ2477@jama>
	<CADkTA4NKtqepA-XRRN9QyVw6eaDoW0_ikFzvGDHYkAvNk_3rOw@mail.gmail.com>
	<20130413010436.GB2477@jama>
	<CADkTA4NKXrnCWHxd3fvNOxy2Zd29=xwuDQvyVDaQ=BY6mD1TOQ@mail.gmail.com>
	<CADkTA4OenBfydWeEEj6AaEOJMt7GEHbx8+FCSzs2mYRFx-MJxQ@mail.gmail.com>
	<20130414145452.GD2475@jama>
Date: Sun, 14 Apr 2013 11:35:45 -0400
Message-ID: <CADkTA4NDZ2Ux__49A46f_5QY-mTsDu3CqdP=YAJqPk+e39MN4g@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-handheld] linux-yocto-3.8 failing
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
X-List-Received-Date: Sun, 14 Apr 2013 15:53:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 14, 2013 at 10:54 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> On Fri, Apr 12, 2013 at 11:59:35PM -0400, Bruce Ashfield wrote:
>> On Fri, Apr 12, 2013 at 11:00 PM, Bruce Ashfield
>> <bruce.ashfield@gmail.com> wrote:
>> > On Fri, Apr 12, 2013 at 9:04 PM, Martin Jansa <martin.jansa@gmail.com>=
 wrote:
>> >> On Fri, Apr 12, 2013 at 08:44:53PM -0400, Bruce Ashfield wrote:
>> >>> On Fri, Apr 12, 2013 at 6:52 PM, Martin Jansa <martin.jansa@gmail.co=
m> wrote:
>> >>> > Hi Andrea,
>> >>> >
>> >>> > patches from
>> >>> > http://git.openembedded.org/meta-handheld/commit/?id=3D54c01286d73=
8e6a6dc2971853644b9ed0e0a9a2e
>> >>> >
>> >>> > don't apply after linux-yocto upgrade in oe-core from today
>> >>> > http://git.openembedded.org/openembedded-core/commit/?id=3D0271dec=
64591c4d91933b3a8db875a374a63640b
>> >>>
>> >>> Hmm. Andrea and I debugged another problem with these BSPs just yest=
erday,
>> >>> I sent a fix to RP that is slightly newer than the commit you are re=
ferencing
>> >>> above.
>> >>>
>> >>> If it still doesn't work with the very tip of oe-core, then I'll hel=
p
>> >>> Andrea debug more ... unless
>> >>> the patches really do need a refresh :)
>> >>
>> >> Maybe it was caused by some other linux-yocto/kern-tools-native chang=
e
>> >> instead, because I've built linux-yocto-3.8 for spitz earlier today
>> >> (with oe-core revision from yesterday). Then I upgraded oe-core again
>> >> and it started to fail.
>> >
>> > There were some changes just this morning, to fix NFS root issues
>> > picked up on the
>> > h/w reference BSPS. Before that, some patches were being missed and no=
t throwing
>> > a hard error. They are likely found now .. and could be what is
>> > causing the problem.
>> >
>> > The easiest way for me is to just clone and configure my own spitz
>> > build and I'll
>> > let everyone know how it goes.
>>
>> Just a follow up. I tested the build, and it is just a straight up
>> patch refresh issue,
>> everything is being properly queued. If it ever worked on the 3.8
>> kernel, that was
>> the anomaly not the current patch failure.
>
> OK, thanks for looking into it. It seems that failing patch wasn't applie=
d
> at all before, reverting this commit
>
> commit ddce9f375c626ef2c86f48612b3d7a24e3111b0b
> Author: Bruce Ashfield <bruce.ashfield@windriver.com>
> Date:   Fri Apr 12 02:16:33 2013 +0000
>
>     kern-tools: fix non-local patch/config location
>
> allows to build it with spitz again, but I belive you it's just some
> patch which is now applied but needs to be refreshed first.

Indeed. It was just hidden before. I looked a the series file, and
didn't see anything
where the patch had been picked up and applied twice, hunting down that com=
mit
showed that it merged into the 3.7 kernel, so the one being carried
for spitz can
be dropped (or at least most of it).

Cheers,

Bruce

>
> Cheers,
>
>> The first example of spitz_pm.patch failing is because the following mai=
nline
>> commit has already done the job:
>>
>> > git show 510fcb0d331f314cd20d0067d56f29302846f47b
>> commit 510fcb0d331f314cd20d0067d56f29302846f47b
>> Author: Marko Katic <dromede@gmail.com>
>> Date:   Thu Oct 25 18:51:38 2012 +0200
>>
>>     ARM: pxa/spitz_pm: Fix hang when resuming from STR
>>
>>     Devices that use spitz_pm.c will fail to resume
>>     from STR (Suspend To Ram) when the charger plug is inserted
>>     or removed when a device is in STR mode. The culprit is
>>     a misconfigured gpio line - GPIO18. GPIO18 should be configured as a
>>     regular GPIO input but it gets configured as an alternate function
>>     GPIO18_RDY. And then later in postsuspend() it gets configured as
>>     a regular GPIO18 input line.
>>
>>     Fix this by removing the GPIO18_RDY configuration so that GPIO18
>>     only gets configured as a regular gpio input.
>>
>>     Signed-off-by: Marko Katic <dromede@gmail.com>
>>     Signed-off-by: Haojian Zhuang <haojian.zhuang@gmail.com>
>>
>> diff --git a/arch/arm/mach-pxa/spitz_pm.c b/arch/arm/mach-pxa/spitz_pm.c
>>
>> ... etc.
>>
>> So just the standard matter of refreshing and dropping some patches.
>> Unless Andrea
>> finds out that I'm just missing something in my config or test.
>>
>> Cheers,
>>
>> Bruce
>>
>> >
>> > Cheers,
>> >
>> > Bruce
>> >
>> >>
>> >> https://github.com/shr-distribution/buildhistory/commit/0e3324cd91d06=
a362661b4151a298fa2f3f6566e
>> >> is my last successful spitz image build and it shows
>> >> kernel_3.8.4+git0+27b63fdbd25ad1a37bacc05f49a205c150d21779_11998bd1f4=
4b21cd0b8c0ca11cbd36865f14bfdc-r4.0.0_spitz.ipk
>> >> (same SRCREVs as now failing build)
>> >>
>> >> Cheers,
>> >>
>> >>> > ERROR: Function failed: do_patch (see /OE/shr-core/tmp-eglibc/work=
/spitz-oe-linux-gnueabi/linux-yocto/3.8.4+gitAUTOINC+27b63fdbd25ad1a37bacc0=
5f49a205c150d21779_11998bd1f44b21cd0b8c0ca11cbd36865f14bfdc-r4.1/temp/log.d=
o_patch.18051 for further information)
>> >>> > ERROR: Logfile of failure stored in: /OE/shr-core/tmp-eglibc/work/=
spitz-oe-linux-gnueabi/linux-yocto/3.8.4+gitAUTOINC+27b63fdbd25ad1a37bacc05=
f49a205c150d21779_11998bd1f44b21cd0b8c0ca11cbd36865f14bfdc-r4.1/temp/log.do=
_patch.18051
>> >>> > Log data follows:
>> >>> > | DEBUG: Executing shell function do_patch
>> >>> > | Deleted branch meta-temp (was 37fdb0c).
>> >>> > | [INFO] validating against known patches  (spitz-standard-meta)
>> >>> > error: patch failed: arch/arm/mach-pxa/spitz_pm.c:86##] (\)(102 %)
>> >>> > | error: arch/arm/mach-pxa/spitz_pm.c: patch does not apply
>> >>> > | To force apply this patch, use 'guilt push -f'
>> >>> > | [ERROR] unable to complete push
>> >>> > | pending patches are:
>> >>> > | links/linux-yocto-3.8/spitz_pm.patch
>> >>> > | links/linux-yocto-3.8/pxa27x-sa1100-rtc.patch
>> >>> > | links/linux-yocto-3.8/spi-pxa2xx-fix-mem.patch
>> >>> > | ERROR. could not update git tree
>> >>> > | ERROR. Could not apply patches for spitz.
>> >>> > |        Patch failures can be resolved in the devshell (bitbake -=
c devshell linux-yocto)
>> >>> > | ERROR: Function failed: do_patch (see /OE/shr-core/tmp-eglibc/wo=
rk/spitz-oe-linux-gnueabi/linux-yocto/3.8.4+gitAUTOINC+27b63fdbd25ad1a37bac=
c05f49a205c150d21779_11998bd1f44b21cd0b8c0ca11cbd36865f14bfdc-r4.1/temp/log=
.do_patch.18051 for further information)
>> >>> > ERROR: Task 3 (/OE/shr-core/openembedded-core/meta/recipes-kernel/=
linux/linux-yocto_3.8.bb, do_patch) failed with exit code '1'
>> >>> > NOTE: Tasks Summary: Attempted 26 tasks of which 21 didn't need to=
 be rerun and 1 failed.
>> >>> >
>> >>> > --
>> >>> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>> >>> >
>> >>> > _______________________________________________
>> >>> > Openembedded-devel mailing list
>> >>> > Openembedded-devel@lists.openembedded.org
>> >>> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-d=
evel
>> >>> >
>> >>>
>> >>>
>> >>>
>> >>> --
>> >>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>> >>> thee at its end"
>> >>>
>> >>> _______________________________________________
>> >>> Openembedded-devel mailing list
>> >>> Openembedded-devel@lists.openembedded.org
>> >>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-dev=
el
>> >>
>> >> --
>> >> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>> >>
>> >> _______________________________________________
>> >> Openembedded-devel mailing list
>> >> Openembedded-devel@lists.openembedded.org
>> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-deve=
l
>> >>
>> >
>> >
>> >
>> > --
>> > "Thou shalt not follow the NULL pointer, for chaos and madness await
>> > thee at its end"
>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end"
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


