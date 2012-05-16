Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fromm@dresearch-fe.de>) id 1SUZn0-0004Vd-Oo
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 May 2012 10:40:58 +0200
Received: by lbol5 with SMTP id l5so334991lbo.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2012 01:30:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=g9Fih5sJWCnzyQWJJYXGfEa7DPqiNNRdAFwidwG5lP0=;
	b=I8ZgFBGiuGS1GbCMBnuJcfjzNqRmAVdKTyvIQmQA7pvR76dvqXmw6/C5VfGwiI/V54
	ZVX/PmMtSIaKVV5D2BNCWRhT12D820CyXWpTCSTwuaKGpVcG8iU/1XCGMwXu+PihTS+a
	ZYmDoQpZiFweVdjf17EEDLk3NYYWWIkITgbdUuNGFDidgmzFYFixJQm6UIaWBn3Cl9qG
	IlzJ2OGvYOyT6AVsh4feYMRNdyFtqNUTag+BH7Bfri89/bhRzreYYB4fse6NhpZcgs7w
	+Cg1epWObxKcsig1HZJGxDdvY71gLYS4i2PVyfFWk5F+fn6F5LDZEvSzqG979Z7jNin5
	OJsQ==
MIME-Version: 1.0
Received: by 10.152.104.44 with SMTP id gb12mr2016050lab.29.1337157057522;
	Wed, 16 May 2012 01:30:57 -0700 (PDT)
Received: by 10.112.10.201 with HTTP; Wed, 16 May 2012 01:30:57 -0700 (PDT)
In-Reply-To: <20120515201620.GA14162@denix.org>
References: <CADZ6=asJ+xLvpodv=u9duDuWs=dp8mLamv=Sj6yJc6B5sjWMrw@mail.gmail.com>
	<3578934.ouGGrvIU0p@helios>
	<CADZ6=at4UmAFwAgggrDYOs0L-rMQBNU1idmD+Eo9FGMoqnKq1g@mail.gmail.com>
	<20120515201620.GA14162@denix.org>
Date: Wed, 16 May 2012 10:30:57 +0200
Message-ID: <CADZ6=av5E7VFiq8oLvj0+rXirn7a04Oe_t+iC2yo+k9X=NVqfg@mail.gmail.com>
From: Thilo Fromm <fromm@dresearch-fe.de>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQkVPUWzEs6PBZFgL+5MtZrucBuKurXMLbeg+ZjArL0+ld5IyY01U+X6A6RfIS6IduWfauNM
Subject: Re: Where do I override DISTRO_FEATURES?
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
X-List-Received-Date: Wed, 16 May 2012 08:40:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello Denys,

>> >> I'm trying to remove an element from DISTRO_FEATURES (specifically
>> >> "ld-is-gold"), but I am unable to find the right spot to do it. The
>> >> distribution we're using (Angstrom, as it happens) sets this in
>> >> conf/distro/angstrom-v2012.x.conf. My machine configuration is the
>> >> wrong spot to modify DISTRO_FEATURES, since it will be processed
>> >> first. local.conf is not working, too.
>>
>> It's a backwards compatibility thing: we're bound to gcc-4.5 (we have
>> kernel build issues with newer gcc versions; we're nailed to
>> linux-2.6.37 thanks to lack of support by Texas Instruments) which
>> fails to detect the correct version of binutils GOLD (LD would work)
>> and therefore misses critical features which break the build later on.
>> I won't, however, try to convince the Angstrom guys to further support
>> ancient toolchains and make gold optional again just because of TI's
>> laziness.
>
> I think you are severely misinformed! Above issues (binutils-2.20/gcc-4.5
> requirement and gold ld problem with Thumb) were already fixed. I've been
> testing the builds with gcc-4.6 and binutils-2.22 for few weeks and even
> gcc-4.7 with gold linker since last week.

You're right, gcc-4.7 works well in the current setup. gcc-4.5,
however, does not detect the right binutils version with the GOLD
linker. GOLD version output is:

GNU gold (GNU Binutils 2.22) 1.11

The configure logic of gcc-4.5 would extract "1.11", not "2.22", for
the version number. Since Binutils 1.11 is ancient, some features of
gcc-initial are not set up correctly (gcc thinks the linker does not
support the "hidden" attribute). This breaks the build of
eglibc-initial later on.

I overslept the whole thing and I guess I'll just provide a patch to
gcc-4.5's configure so the GOLD linker version is detected correctly
instead of setting up my own distribution config.

> I don't know what layer you are
> using, but you may need to update, if you are using meta-ti.

meta-ti does not provide any toolchain anywhere. I have a toolchain
issue. The issue is with gcc-4.5 from meta-oe/toolchain-layer in
combination with binutils-2.22 from
openembedded-core/meta/recipes-devtools/.

Just in case you're curious, our layer structure is documented here:
<https://github.com/DFE/HidaV/wiki/Hidav-oe-layers>.

> Otherwise, if your platform is not directly supported by meta-ti, please =
send
> the bug report with the error message to meta-ti mailing list and I'll tr=
y to
> address it.

Which meta-ti mailing list are you talking about? There seem to be
many: this one, the arago lists, yocto-ti, ... And then again, it's a
toolchain issue (see above); meta-ti doesn't have toolchains.

> As of linux-2.6.37 for your specific platform - this one I can't help wit=
h,
> you would need to talk to your TI rep from the division that makes the
> platform and convince them to provide support for newer kernels.

I know, it's OK. We talked to TI a lot for quite a while, but our
realistic assessment from our TI experiences is that they'll never do
it. There are still a lot of issues with their old 2.6.37 kernel, TI
continually keeps breaking things. They don't have proper issue
trackers or mailing lists for communication with their developers.
From the reps and FAEs we'd get the occasional empty promise, but
that's it. Personally I think we went wrong with buying TI in the
first place.

Regards,
Thilo

--=20
Dipl.-Ing (FH) Thilo Fromm, MSc., Embedded Systems Architect
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, D-10319 Berlin, Germany
Tel: +49 (30) 515 932 228 =C2=A0 mailto:fromm@dresearch-fe.de
Fax: +49 (30) 515 932 77 =C2=A0 =C2=A0http://www.dresearch.de
Amtsgericht: Berlin Charlottenburg, HRB 130120 B
Ust.-IDNr. DE273952058
Gesch=C3=A4ftsf=C3=BChrer: Dr. M. Weber, W. M=C3=B6gle


