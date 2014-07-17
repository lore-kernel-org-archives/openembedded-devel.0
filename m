Return-Path: <just4tech83@gmail.com>
Received: from mail-qa0-f51.google.com (mail-qa0-f51.google.com
	[209.85.216.51])
	by mail.openembedded.org (Postfix) with ESMTP id 74011705FC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jul 2014 06:59:34 +0000 (UTC)
Received: by mail-qa0-f51.google.com with SMTP id k15so1544632qaq.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jul 2014 23:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=JNMR5Pt4W50ewwaTi2jqn+CwzNu6x7e/DZpkgE6posM=;
	b=Zt/X1cSlL9RvU0dvBtA+NYBG/vfO0IOpxEkje1cb51e7Y3v44KCZBFhr0OhdtghwIE
	kF1jz5hX7l2jSVU6s6TY3fscpEakD46rpSjaaCmRHHvVBUBZI6zZn+oucy/Wg5z8jQmA
	el/oxytEbSs3oKmENOrAUbKNYOQLLwgKAa7BYnsRT4Vi9/0fWQFGbtfRXLsV8dWUIYMS
	mLvAdreLqNEumKNLLknRM12E1B380Oz6oat3zsC7pJN/l0O5Vf5EbNdzN0tfL9olSMnI
	6SOvqWTgXytCoEgaQsiUxDKZc5PIcXfuvuLIssLGxqM9ZvfDtW5CFavO2DlrhRe1t+Km
	c98A==
MIME-Version: 1.0
X-Received: by 10.224.112.1 with SMTP id u1mr49406640qap.7.1405580375117; Wed,
	16 Jul 2014 23:59:35 -0700 (PDT)
Received: by 10.140.100.235 with HTTP; Wed, 16 Jul 2014 23:59:34 -0700 (PDT)
Received: by 10.140.100.235 with HTTP; Wed, 16 Jul 2014 23:59:34 -0700 (PDT)
In-Reply-To: <CAD2C2VR22ww51=1UQbW7OxtWvr8dV1PjLhr0d0O176JtX6PJKQ@mail.gmail.com>
References: <CAD2C2VT=3DipX=8chChc6_NefZSfs3jocmYxePJp5THxANiKVg@mail.gmail.com>
	<53BC1835.90204@balister.org>
	<CAD2C2VTnHrLsfhRXcUxpcpXgWK+LzxxD87XrvrN6wiiMK+CMUw@mail.gmail.com>
	<CAD2C2VSTKS+NX=0CAwh1PAtkKgcHh+mpwMMVmh_b4dw9GeaABw@mail.gmail.com>
	<53C51AE2.4030100@bec-systems.com>
	<CAD2C2VR22ww51=1UQbW7OxtWvr8dV1PjLhr0d0O176JtX6PJKQ@mail.gmail.com>
Date: Thu, 17 Jul 2014 12:29:34 +0530
Message-ID: <CAD2C2VRr+RfWqxJ_6gL+UCh1Y7j_T41NEpVAw=TrekmxKMadUg@mail.gmail.com>
From: Bryan <just4tech83@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: open embedded build issues with beagle board
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
X-List-Received-Date: Thu, 17 Jul 2014 06:59:34 -0000
Content-Type: text/plain; charset=UTF-8

---------- Forwarded message ----------
From: "Bryan" <just4tech83@gmail.com>
Date: Jul 17, 2014 10:36 AM
Subject: Re: Fwd: Re: [oe] open embedded build issues with beagle board
To: "Cliff Brake" <cbrake@bec-systems.com>, <philip@balister.org>, <
openembedded-devel@lidts.openembedded.org>
Cc:


Hi,
   Thanks for your suggestion to use meta-ti layer. Cau you please tell us
where we can find this layer as we couldn't find it on openembedded git.

We tried with following link to build but it gives error while building.
https://github.com/beagleboard/meta-beagleboard


Thanks
Bryan
On Jul 15, 2014 5:43 PM, "Cliff Brake" <cbrake@bec-systems.com> wrote:

>  The meta-ti layer includes support for the beagleboard.  You probably
> want the linux-mainline 3.2 recipe.
>
> Cliff
>
> On 07/15/2014 12:29 AM, Bryan wrote:
>
> Hi Cliff,
>          thanks for your suggestion, i tried links which you mentioned in
> your mail. Now i am able to build minimal image for MACHINE = qmux6.
> Can you please tell us how can we make it for beagleboard omap 3530.
> Where can we find support layer for beagleboard.
>
> Thanks a lot in advance !
> On Jul 11, 2014 11:30 AM, "Bryan" <just4tech83@gmail.com> wrote:
>
>> Hi,
>>      As per your suggestion we took oe-core and other packages from
>> followinf link:
>> -> http://git.openembedded.org/meta-openembedded
>>
>> We are using bitbake version 1.23.1.
>>
>> We have to build image for beagleboard so we find following to build
>> image:
>>
>> ->
>> http://www.crashcourse.ca/wiki/index.php/Building_for_BBB_using_OpenEmbedded
>>
>> While following steps from the above link we have done following settings
>> in local.conf  and bblayers.conf file.
>>
>> MACHINE ??= "beaglebone"
>> BBLAYERS ?= " \
>>   /home/rpjday/oe/dist/layers/oe-core/meta \
>>   /home/rpjday/oe/dist/layers/meta-openembedded/meta-oe \
>>   /home/rpjday/oe/dist/layers/meta-beagleboard/common-bsp \
>>   "
>> Now while running "bitbake core-image-minimal" command we are getting
>> following issues :
>>
>> chown: changing ownership of
>> `/home/test/oe/oe-core/build/tmp-eglibc/work/i686-linux/db-native/5.3.21-r0/image/home/test/oe/oe-core/build/tmp-eglibc/sysroots/i686-linux/usr/share/doc/programmer_reference/intro_what.html':
>> Operation not permitted
>> chown: changing ownership of
>> `/home/test/oe/oe-core/build/tmp-eglibc/work/i686-linux/db-native/5.3.21-r0/image/home/test/oe/oe-core/build/tmp-eglibc/sysroots/i686-linux/usr/share/doc/programmer_reference/program_ram.html':
>> Operation not permitted
>> chown: changing ownership of
>> `/home/test/oe/oe-core/build/tmp-eglibc/work/i686-linux/db-native/5.3.21-r0/image/home/test/oe/oe-core/build/tmp-eglibc/sysroots/i686-linux/usr/share/doc/programmer_reference/arch_apis.html':
>> Operation not permitted
>> chown: changing ownership of
>> `/home/test/oe/oe-core/build/tmp-eglibc/work/i686-linux/db-native/5.3.21-r0/image/home/test/oe/oe-core/build/tmp-eglibc/sysroots/i686-linux/usr/share/doc/programmer_reference/transapp_reclimit.html':
>> Operation not permitted
>> chown: changing ownership of
>> `/home/test/oe/oe-core/build/tmp-eglibc/work/i686-linux/db-native/5.3.21-r0/image/home/test/oe/oe-core/build/tmp-eglibc/sysroots/i686-linux/usr/share/doc/programmer_reference/am_close.html':
>> Operation not permitted
>> chown: changing ownership of
>> `/home/test/oe/oe-core/build/tmp-eglibc/work/i686-linux/db-native/5.3.21-r0/image/home/test/oe/oe-core/build/tmp-eglibc/sysroots/i686-linux/usr/share/doc/programmer_reference/lock_stdmode.html':
>> Operation not permitted
>> chown: changing ownership of
>> `/home/test/oe/oe-core/build/tmp-eglibc/work/i686-linux/db-native/5.3.21-r0/image/home/test/oe/oe-core/build/tmp-eglibc/sysroots/i686-linux/usr/share/doc/programmer_reference/transapp_env_open.html':
>> Operation not permitted
>>
>> WARNING:
>> /home/test/oe/oe-core/build/tmp-eglibc/work/i686-linux/db-native/5.3.21-r0/temp/run.do_install.26236:1
>> exit 1 from
>>   chown -R root:root
>> /home/test/oe/oe-core/build/tmp-eglibc/work/i686-linux/db-native/5.3.21-r0/image
>> ERROR: Function failed: do_install (log file is located at
>> /home/test/oe/oe-core/build/tmp-eglibc/work/i686-linux/db-native/5.3.21-r0/temp/log.do_install.26236)
>>
>> one more doubt about the code base which we should follow as we found one
>> other link which have oe-core code at "https://github.com/openembedded".
>> We have tried both and found seperate issues while using both.
>>
>> Please suggest us how we can overcome these issues to get test image
>> build for beagleboard.
>>
>> Thanks in advance
>> ---------- Forwarded message ----------
>> From: "Philip Balister" <philip@balister.org>
>> Date: Jul 8, 2014 9:42 PM
>> Subject: Re: [oe] open embedded build issues with beagle board
>> To: <openembedded-devel@lists.openembedded.org>
>> Cc:
>>
>> On 07/08/2014 02:54 AM, Bryan wrote:
>> > Hi All
>> >  I am trying to build  Openembeeded classic for Beagle board-XM but i am
>> > getting lot of broken link issues. I have  set DISTRO as
>> angstrom-2010.x in
>> > local.conf.   Is this approach  ok? or should i move to openembedded
>> core ??
>> > Pls suggest.
>>
>> Use the current Angstrom instructions, oe-classic is pretty much
>> completely unsupported now.
>>
>> Philip
>>
>> >
>> > Broken link e.g.
>> >
>> > Resolving www.angstrom-distribution.org (www.angstrom-distribution.org
>> )...
>> > 140.211.169.177
>> >  Connecting to www.angstrom-distribution.org
>> > (www.angstrom-distribution.org)|140.211.169.177|:80...
>> > connected.
>> >  HTTP request sent, awaiting response...
>> > 404 Not Found  2014-07-08 10:13:43 ERROR 404: Not Found.
>> >
>> > Thanks in advance
>> >
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>
>

