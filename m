Received: from mail-vc0-f171.google.com ([209.85.220.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <hirst689@gmail.com>) id 1UJ6tw-0003Zl-0W
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Mar 2013 19:42:18 +0100
Received: by mail-vc0-f171.google.com with SMTP id ha11so3312547vcb.16
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2013 11:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type;
	bh=7cHg4Y32mqRgnMNgsoVLly9ppvECDW2cQNdZNPK9P44=;
	b=UmGzIm+/X2HOrLHMn0GAWPTrpva6tmMMfUzWEC0LtADWJDcj4cK1dj+39KN/9KE6T8
	r6SqGMnVC3PxM2RwnpeynmxhgP9Ml8frTIeswZIOtlMp24XlBkENunptrLik2btcZqoL
	AO7S1TqUQWxQFrfz+3VM7q32XQCqii9WCmCLJXmWCQpnU2JaD+MM8s14kmYq4YKRACCb
	SbrwvXeNzEW77WTpgB4Eg+B+0uaDg+7WNEy0r5tkrFBxHxc+R5RR7IkP1Vt7YasixOuT
	7L8OH0/ZeNlY/qJHA08QxuBFp2BVOHkyqZ3u27SObYZ2agBL05fZicg6JfMJhL/HkDKM
	l83A==
MIME-Version: 1.0
X-Received: by 10.220.8.4 with SMTP id f4mr3611597vcf.20.1363976661488; Fri,
	22 Mar 2013 11:24:21 -0700 (PDT)
Received: by 10.59.11.37 with HTTP; Fri, 22 Mar 2013 11:24:21 -0700 (PDT)
In-Reply-To: <514C9AA9.7010302@mlbassoc.com>
References: <CAHu+ux18fZzDuBjYj_d8r9P=y=khrCSjuRjKPKG9RzxEAO2vXw@mail.gmail.com>
	<514C6AFC.1050405@mlbassoc.com>
	<CAHu+ux0PVbRQh0vY9VOzv78Ey2kAKPBNsfU1v0ptT06zHYKabw@mail.gmail.com>
	<514C700C.6010707@mlbassoc.com>
	<CAHu+ux07zRGozTjykPzaDfN9Rnf2jL01XiBQoceXyxe6SOOp1w@mail.gmail.com>
	<CAHu+ux1GEMztMO78WKsBHErhCP_FAV8378dT0sAVDtpDvfLsQQ@mail.gmail.com>
	<514C9AA9.7010302@mlbassoc.com>
Date: Fri, 22 Mar 2013 14:24:21 -0400
Message-ID: <CAHu+ux0BdGsGcyJ9ywM-MkCugKoi7Fw5Tbho=e+MH7P6rM7T-A@mail.gmail.com>
From: David Hirst <hirst689@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Adding a recipe to oe bitbake
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
X-List-Received-Date: Fri, 22 Mar 2013 18:42:20 -0000
X-List-Received-Date: Fri, 22 Mar 2013 18:42:20 -0000
Content-Type: text/plain; charset=ISO-8859-1

BitBake Build Tool Core version 1.15.2, bitbake version 1.15.2

gst-meta-base
:0.10-r10
meta-environment-arm
:1.0-r8
meta-ide-support
:1.0-r2
meta-toolchain
:1.0-r7
meta-toolchain-arago
:1.0-r13
meta-toolchain-arago-qte
:1.0-r9
meta-toolchain-arago-tisdk
:1.0-r0
meta-toolchain-gmae
:1.0-r7
meta-toolchain-qte
:1.0-r7
metacity
:2.30.3-r3
metacity-native                                    :2.30.3-r3


On Fri, Mar 22, 2013 at 1:53 PM, Gary Thomas <gary@mlbassoc.com> wrote:

> On 2013-03-22 11:31, David Hirst wrote:
>
>> Here are the results, the same as before, in the build directories all
>> seems fine but the final output only has the /usr/share/man/man8/files
>>
>> in
>> oe-layersetup/build/arago-tmp-**external-arago-toolchain/work/**
>> armv7a-vfp-neon-oe-linux-**gnueabi/pure-ftpd-1.0.29-r0/**image/usr/sbin
>> are the following files:
>>
>> pure-authd  pure-ftpd  pure-ftpwho  pure-mrtginfo  pure-quotacheck
>> pure-uploadscript
>>
>> in
>> oe-layersetup/build/arago-tmp-**external-arago-toolchain/work/**
>> armv7a-vfp-neon-oe-linux-**gnueabi/pure-ftpd-1.0.29-r0/**image/usr/bin
>> are the following files:
>>
>> pure-pw  pure-pwconvert  pure-statsdecode
>>
>> in
>> oe-layersetup/build/arago-tmp-**external-arago-toolchain/work/**
>> armv7a-vfp-neon-oe-linux-**gnueabi/pure-ftpd-1.0.29-r0/**
>> image/usr/share/man/man8
>>
>> pure-authd.8  pure-ftpd.8  pure-ftpwho.8  pure-mrtginfo.8  pure-pw.8
>> pure-pwconvert.8  pure-quotacheck.8  pure-statsdecode.8
>>  pure-uploadscript.8
>>
>
> You still didn't answer the question about the version of bitbake, the OE
> metadata, etc.
> which does make a difference...
>
> Try adding this line in your pure-ftpd recipe:
>   FILES_${PN} += "/usr/sbin"
>
>
>>
>> hirst689@hirst689-HP-Z210-**Workstation:~/oe-layersetup/**
>> build/arago-tmp-external-**arago-toolchain/deploy/images$
>> tar tvf tisdk-rootfs-image-am335x-evm.**tar.gz | grep pure*
>>
>> -rw-r--r-- root/root      4151 2013-03-22 12:36
>> ./usr/share/man/man8/pure-**uploadscript.8
>> -rw-r--r-- root/root      3187 2013-03-22 12:36
>> ./usr/share/man/man8/pure-pw.8
>> -rw-r--r-- root/root      2169 2013-03-22 12:36
>> ./usr/share/man/man8/pure-**quotacheck.8
>> -rw-r--r-- root/root      1123 2013-03-22 12:36
>> ./usr/share/man/man8/pure-**statsdecode.8
>> -rw-r--r-- root/root       764 2013-03-22 12:36
>> ./usr/share/man/man8/pure-**pwconvert.8
>> -rw-r--r-- root/root      4160 2013-03-22 12:36
>> ./usr/share/man/man8/pure-**authd.8
>> -rw-r--r-- root/root      2119 2013-03-22 12:36
>> ./usr/share/man/man8/pure-**mrtginfo.8
>> -rw-r--r-- root/root     28755 2013-03-22 12:36
>> ./usr/share/man/man8/pure-**ftpd.8
>> -rw-r--r-- root/root      2449 2013-03-22 12:36
>> ./usr/share/man/man8/pure-**ftpwho.8
>>
>>
>>
>> On Fri, Mar 22, 2013 at 11:02 AM, David Hirst <hirst689@gmail.com> wrote:
>>
>>  I did a bitbake tisdk-rootfs-image -c clean
>>> I will try the cleanstate
>>> It seems really difficult to get started from an absolutely clean slate,
>>> some where status is held that gets in the way
>>> I will let you know
>>>
>>> Thanks so far
>>>
>>>
>>>
>>>
>>> On Fri, Mar 22, 2013 at 10:51 AM, Gary Thomas <gary@mlbassoc.com> wrote:
>>>
>>>  On 2013-03-22 08:42, David Hirst wrote:
>>>>
>>>>  OK,
>>>>>       Sorry for the carpet bombing! I added this to tisdk-rootfs-image
>>>>> "task-arago-xyz \" to look for the new task file
>>>>> I have included the task and pure-ftpd bb files also. I would love to
>>>>> understand why this does not work.
>>>>>
>>>>>
>>>> What steps did you run after making this change?
>>>> What version of bitbake are you using?
>>>>
>>>> Most likely, bitbake did not [fully] realize that you made a change.
>>>> I'd try something like this:
>>>>    % bitbake tisdk-rootfs-image -c cleansstate
>>>>    % bitbake tisdk-rootfs-image
>>>> and see what happens.
>>>>
>>>> BTW, top-posting is evil :-(
>>>>
>>>>
>>>>  ==========================**tisd**k-rootfs-image.bb<http:/**
>>>>> /tisdk-rootfs-image.bb <http://tisdk-rootfs-image.bb>>
>>>>> =============**===============
>>>>>
>>>>> # Arago TI SDK filesystem image
>>>>> COMPATIBLE_MACHINE = "omap3|omapl138|ti33x"
>>>>>
>>>>> require arago-base-tisdk-image.bb
>>>>>
>>>>> IMAGE_INSTALL += "\
>>>>>       task-arago-test \
>>>>>       task-arago-tisdk-graphics \
>>>>>       task-arago-tisdk-qte \
>>>>>       task-arago-tisdk-addons \
>>>>>       task-arago-tisdk-connectivity \
>>>>>       task-arago-tisdk-crypto \
>>>>>       task-arago-tisdk-matrix \
>>>>>       task-arago-tisdk-multimedia \
>>>>>       task-arago-tisdk-amsdk \
>>>>>       task-arago-xyz \
>>>>> "
>>>>>
>>>>> export IMAGE_BASENAME = "tisdk-rootfs-image"
>>>>>
>>>>> =================task-arago.****xyz.bb <http://xyz.bb> <
>>>>> http://task-arago.xyz.bb>
>>>>>
>>>>> ================
>>>>>
>>>>> DESCRIPTION = "Extended task to get extras"
>>>>> LICENSE = "MIT"
>>>>> LIC_FILES_CHKSUM =
>>>>> "file://${COREBASE}/meta/****COPYING.MIT;md5=**
>>>>> 3da9cfbcb788c80a0384361b4de204****20"
>>>>>
>>>>> PR = "r0"
>>>>>
>>>>> inherit task
>>>>>
>>>>> ARAGO_XYZ = " \
>>>>>       pure-ftpd \
>>>>>       "
>>>>>
>>>>> ARAGO_XYZ_INT = "\
>>>>>       ${ARAGO_XYZ} \
>>>>>       "
>>>>> RDEPENDS_${PN} = "\
>>>>>       ${ARAGO_XYZ_INT} \
>>>>>       "
>>>>> ===============pure-ftpd_1.0.****29.bb <http://pure-ftpd_1.0.29.bb>
>>>>>
>>>>> ====================
>>>>>
>>>>> DESCRIPTION = "Sample program"
>>>>> LICENSE = "GPLv2"
>>>>> LIC_FILES_CHKSUM = "file://COPYING;md5=****
>>>>> d7b47170f564f6a314b82b3ea67a40***
>>>>>
>>>>> *bd"
>>>>> PR = "r0"
>>>>> PV = "1.0.29"
>>>>> DEPENDS = ""
>>>>> RPROVIDES = "pure-ftpd"
>>>>> PROVIDES = "pure-ftpd"
>>>>> ARM_INSTRUCTION_SET = "arm"
>>>>>
>>>>> PARALLEL_MAKE = ""
>>>>>
>>>>> inherit autotools pkgconfig
>>>>>
>>>>> EXTRA_OECONF = "--enable-cross-compile --host=arm-arago-linux-****
>>>>> gnueabi"
>>>>>
>>>>> SRC_URI = "
>>>>> http://iweb.dl.sourceforge.****net/project/pureftpd/Pure-**
>>>>> FTPd/1.0.29/pure-ftpd-${PV}.****tar.gz<http://iweb.dl.**
>>>>> sourceforge.net/project/**pureftpd/Pure-FTPd/1.0.29/**
>>>>> pure-ftpd-$%7BPV%7D.tar.gz<http://iweb.dl.sourceforge.net/project/pureftpd/Pure-FTPd/1.0.29/pure-ftpd-$%7BPV%7D.tar.gz>
>>>>> >
>>>>> "
>>>>> SRC_URI[md5sum] = "****e0132a51357d419f8b66e8997d9dc5****fa"
>>>>> SRC_URI[sha256sum] =
>>>>> "****55bfb84fa63a37e5b56906afb4444f******
>>>>> da7285d0f8b5ed24798f59c978ddea****2749"
>>>>>
>>>>> S = "${WORKDIR}/pure-ftpd-${PV}"
>>>>>
>>>>> EXTRA_OECONF_append_armv6 = " --enable-armv6"
>>>>> EXTRA_OECONF_append_armv7a = " --enable-armv6 --enable-neon"
>>>>>
>>>>> FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer
>>>>> -frename-registers -O4 -ffast-math"
>>>>> BUILD_OPTIMIZATION = "${FULL_OPTIMIZATION}"
>>>>>
>>>>> do_configure(){
>>>>>     oe_runconf ${EXTRE_OECONF}
>>>>> }
>>>>>
>>>>> do_compile () {
>>>>>     oe_runmake
>>>>> }
>>>>>
>>>>> do_install () {
>>>>>     oe_runmake install DESTDIR=${D}
>>>>> }
>>>>>
>>>>>
>>>>> ARM_INSTRUCTION_SET = "arm"
>>>>>
>>>>> BBCLASSEXTEND = "native"
>>>>>
>>>>> ============================ END===========================
>>>>>
>>>>> On Fri, Mar 22, 2013 at 10:30 AM, Gary Thomas <gary@mlbassoc.com>
>>>>> wrote:
>>>>>
>>>>>   On 2013-03-22 08:24, David Hirst wrote:
>>>>>
>>>>>>
>>>>>>   Hi,
>>>>>>
>>>>>>>        I have been struggling with a oe/bitbake issue. I wanted to
>>>>>>> add
>>>>>>> an
>>>>>>> other .bb to the image file.
>>>>>>> I have tried multiple ways but always end up at the same spot. I have
>>>>>>> created a new task-XXX.bb file which includes my bb
>>>>>>> I edited the XXXX-rootfs-image.bb to include the task-XXX.bb.
>>>>>>> Once built I find that everything built fine and the new recipe was
>>>>>>> built
>>>>>>> but was not loaded into the XXXX-rootfs-image.tar,gz.
>>>>>>> If I look into the image directory for the bb file I see the compiled
>>>>>>> application in usr/sbin.
>>>>>>> I have tried this with my own .bb file and net-snmp bb file which
>>>>>>> comes
>>>>>>> with the default oe-layersetup installation with the same result.
>>>>>>> Did I not edit a file or miss some other required step?
>>>>>>>
>>>>>>>
>>>>>>>   Wow, the same question on three mailing lists (that I read, there
>>>>>>>
>>>>>> may be more...) and no cross-posting!
>>>>>>
>>>>>> This list is perhaps the most appropriate one for your question.
>>>>>>
>>>>>> More details will help.  Exactly what did you change in the
>>>>>> "XXXX-rootfs-image.bb"
>>>>>> recipe?
>>>>>>
>>>>>> --
>>>>>> ------------------------------******--------------------------**
>>>>>> --**--
>>>>>>
>>>>>>
>>>>>> Gary Thomas                 |  Consulting for the
>>>>>> MLB Associates              |    Embedded world
>>>>>> ------------------------------******--------------------------**
>>>>>> --**--
>>>>>>
>>>>>> ______________________________******_________________
>>>>>> Openembedded-devel mailing list
>>>>>> Openembedded-devel@lists.****ope**nembedded.org <
>>>>>> http://openembedded.org>
>>>>>> <Openembedded-**devel@lists.**openembedded.org<devel@lists.openembedded.org>
>>>>>> <Openembedded-**devel@lists.openembedded.org<Openembedded-devel@lists.openembedded.org>
>>>>>> >
>>>>>>
>>>>>>>
>>>>>>>  http://lists.linuxtogo.org/******cgi-bin/mailman/listinfo/****<http://lists.linuxtogo.org/****cgi-bin/mailman/listinfo/****>
>>>>>> openembedded-devel<http://**lists.linuxtogo.org/**cgi-bin/**
>>>>>> mailman/listinfo/****openembedded-devel<http://lists.linuxtogo.org/**cgi-bin/mailman/listinfo/**openembedded-devel>
>>>>>> >
>>>>>> <http://**lists.linuxtogo.org/**cgi-bin/**mailman/listinfo/**
>>>>>> openembedded-*<http://lists.linuxtogo.org/cgi-bin/**mailman/listinfo/openembedded-*>
>>>>>> *devel<http://lists.linuxtogo.**org/cgi-bin/mailman/listinfo/**
>>>>>> openembedded-devel<http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>
>>>>>> >
>>>>>>
>>>>>>>
>>>>>>>
>>>>>>
>>>>>>
>>>>>
>>>>>
>>>>>  --
>>>> ------------------------------****----------------------------**--
>>>> Gary Thomas                 |  Consulting for the
>>>> MLB Associates              |    Embedded world
>>>> ------------------------------****----------------------------**--
>>>>
>>>> ______________________________****_________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.**ope**nembedded.org <http://openembedded.org>
>>>> <Openembedded-**devel@lists.openembedded.org<Openembedded-devel@lists.openembedded.org>
>>>> >
>>>> http://lists.linuxtogo.org/****cgi-bin/mailman/listinfo/**<http://lists.linuxtogo.org/**cgi-bin/mailman/listinfo/**>
>>>> openembedded-devel<http://**lists.linuxtogo.org/cgi-bin/**
>>>> mailman/listinfo/openembedded-**devel<http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>
>>>> >
>>>>
>>>>
>>>
>>>
>>> --
>>> David Hirst
>>> hirst689@gmail.com
>>>
>>>
>>>
>>
>>
> --
> ------------------------------**------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------**------------------------------
>
> ______________________________**_________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.**openembedded.org<Openembedded-devel@lists.openembedded.org>
> http://lists.linuxtogo.org/**cgi-bin/mailman/listinfo/**openembedded-devel<http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>
>



-- 
David Hirst
hirst689@gmail.com

