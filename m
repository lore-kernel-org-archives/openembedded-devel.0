Received: from mail-la0-f53.google.com ([209.85.215.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1UQqyY-0004Qg-Dw
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Apr 2013 05:18:02 +0200
Received: by mail-la0-f53.google.com with SMTP id fp13so3019081lab.40
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Apr 2013 20:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type:content-transfer-encoding;
	bh=EDb2kwviJg5RCqr5u5H3YGRro243nctuj9kkMuzjDmw=;
	b=qJCcgrm8UxhtK+FZvOUCeo311UQWFN89JdlahX1GG6jTPhTXaPkf7xmybTrYnH2ZFK
	vaUmbMFFCYu5423m9FVPGDdjo2X1MJgX9jUyBL9fhq0cJidWI8mHz/bBfpUds5rtDx78
	cq5l+6+KqyvjqQpEwcFyQlIBo2suAD4pdJSYBiinSnJhldw0gxgtv5dzf56Z0Oq8/Rj3
	l3MG7JpWlTbJ7aqBiMrIwTK2nIcZ9aS31zeVvE7Owc7OwESUij2RWXOm+0V0A3+XiNGB
	hdQogg+i5pi2GsvoSfDg5SXVvLHTzh6zfBp43RTMVIrrxgf25jNvSA9iQ1WYP9xs5URb
	bEIQ==
MIME-Version: 1.0
X-Received: by 10.112.61.6 with SMTP id l6mr4930563lbr.57.1365822036811; Fri,
	12 Apr 2013 20:00:36 -0700 (PDT)
Received: by 10.112.75.161 with HTTP; Fri, 12 Apr 2013 20:00:36 -0700 (PDT)
In-Reply-To: <20130413010436.GB2477@jama>
References: <20130412225236.GZ2477@jama>
	<CADkTA4NKtqepA-XRRN9QyVw6eaDoW0_ikFzvGDHYkAvNk_3rOw@mail.gmail.com>
	<20130413010436.GB2477@jama>
Date: Fri, 12 Apr 2013 23:00:36 -0400
Message-ID: <CADkTA4NKXrnCWHxd3fvNOxy2Zd29=xwuDQvyVDaQ=BY6mD1TOQ@mail.gmail.com>
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
X-List-Received-Date: Sat, 13 Apr 2013 03:18:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 12, 2013 at 9:04 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Fri, Apr 12, 2013 at 08:44:53PM -0400, Bruce Ashfield wrote:
>> On Fri, Apr 12, 2013 at 6:52 PM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
>> > Hi Andrea,
>> >
>> > patches from
>> > http://git.openembedded.org/meta-handheld/commit/?id=3D54c01286d738e6a=
6dc2971853644b9ed0e0a9a2e
>> >
>> > don't apply after linux-yocto upgrade in oe-core from today
>> > http://git.openembedded.org/openembedded-core/commit/?id=3D0271dec6459=
1c4d91933b3a8db875a374a63640b
>>
>> Hmm. Andrea and I debugged another problem with these BSPs just yesterda=
y,
>> I sent a fix to RP that is slightly newer than the commit you are refere=
ncing
>> above.
>>
>> If it still doesn't work with the very tip of oe-core, then I'll help
>> Andrea debug more ... unless
>> the patches really do need a refresh :)
>
> Maybe it was caused by some other linux-yocto/kern-tools-native change
> instead, because I've built linux-yocto-3.8 for spitz earlier today
> (with oe-core revision from yesterday). Then I upgraded oe-core again
> and it started to fail.

There were some changes just this morning, to fix NFS root issues
picked up on the
h/w reference BSPS. Before that, some patches were being missed and not thr=
owing
a hard error. They are likely found now .. and could be what is
causing the problem.

The easiest way for me is to just clone and configure my own spitz
build and I'll
let everyone know how it goes.

Cheers,

Bruce

>
> https://github.com/shr-distribution/buildhistory/commit/0e3324cd91d06a362=
661b4151a298fa2f3f6566e
> is my last successful spitz image build and it shows
> kernel_3.8.4+git0+27b63fdbd25ad1a37bacc05f49a205c150d21779_11998bd1f44b21=
cd0b8c0ca11cbd36865f14bfdc-r4.0.0_spitz.ipk
> (same SRCREVs as now failing build)
>
> Cheers,
>
>> > ERROR: Function failed: do_patch (see /OE/shr-core/tmp-eglibc/work/spi=
tz-oe-linux-gnueabi/linux-yocto/3.8.4+gitAUTOINC+27b63fdbd25ad1a37bacc05f49=
a205c150d21779_11998bd1f44b21cd0b8c0ca11cbd36865f14bfdc-r4.1/temp/log.do_pa=
tch.18051 for further information)
>> > ERROR: Logfile of failure stored in: /OE/shr-core/tmp-eglibc/work/spit=
z-oe-linux-gnueabi/linux-yocto/3.8.4+gitAUTOINC+27b63fdbd25ad1a37bacc05f49a=
205c150d21779_11998bd1f44b21cd0b8c0ca11cbd36865f14bfdc-r4.1/temp/log.do_pat=
ch.18051
>> > Log data follows:
>> > | DEBUG: Executing shell function do_patch
>> > | Deleted branch meta-temp (was 37fdb0c).
>> > | [INFO] validating against known patches  (spitz-standard-meta)
>> > error: patch failed: arch/arm/mach-pxa/spitz_pm.c:86##] (\)(102 %)
>> > | error: arch/arm/mach-pxa/spitz_pm.c: patch does not apply
>> > | To force apply this patch, use 'guilt push -f'
>> > | [ERROR] unable to complete push
>> > | pending patches are:
>> > | links/linux-yocto-3.8/spitz_pm.patch
>> > | links/linux-yocto-3.8/pxa27x-sa1100-rtc.patch
>> > | links/linux-yocto-3.8/spi-pxa2xx-fix-mem.patch
>> > | ERROR. could not update git tree
>> > | ERROR. Could not apply patches for spitz.
>> > |        Patch failures can be resolved in the devshell (bitbake -c de=
vshell linux-yocto)
>> > | ERROR: Function failed: do_patch (see /OE/shr-core/tmp-eglibc/work/s=
pitz-oe-linux-gnueabi/linux-yocto/3.8.4+gitAUTOINC+27b63fdbd25ad1a37bacc05f=
49a205c150d21779_11998bd1f44b21cd0b8c0ca11cbd36865f14bfdc-r4.1/temp/log.do_=
patch.18051 for further information)
>> > ERROR: Task 3 (/OE/shr-core/openembedded-core/meta/recipes-kernel/linu=
x/linux-yocto_3.8.bb, do_patch) failed with exit code '1'
>> > NOTE: Tasks Summary: Attempted 26 tasks of which 21 didn't need to be =
rerun and 1 failed.
>> >
>> > --
>> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>> >
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>> >
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


