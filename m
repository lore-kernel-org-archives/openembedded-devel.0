Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PaX2a-0000ts-Hg
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Jan 2011 18:20:52 +0100
Received: by gxk20 with SMTP id 20so6633898gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Jan 2011 09:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=IQ+RFCwA46Gpe3nZVeNzx26SBV2idaawDaJ5UUEAmSw=;
	b=u5SoUo3b8vKxW++SVyKlWcFeArXyRcxkELc8dUwIcPooUgVoOU41kSpyMqpZsc8Qv0
	1pODHziXUf75aJu7IjenQcz78GdseviM9/MtxNYolZJD3fWE4fWC6Cmv4NFyAH/vBKIh
	SOS2/rMgKAlC6LKmPEp4jJkaq6ULxHgo3bEf0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=UOeuhVKoHuaPkQyPW6rfULC7u3YOxNHbYxGb+c+stroSuqc6DvYSv/6xSmrA1uSXQF
	8Ez3wcrcwI3surwx3GpqtUxklJXIkJdzdkre8FfitScbGR/tnOwyhkP9J0iUkVf4Jyww
	Fxsln/ZVOFwKF5QmOuPMIndMKp0X5qmjXssh8=
Received: by 10.90.104.20 with SMTP id b20mr933702agc.193.1294248027767; Wed,
	05 Jan 2011 09:20:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Wed, 5 Jan 2011 09:20:07 -0800 (PST)
In-Reply-To: <ig1b7c$j8n$1@dough.gmane.org>
References: <1294198349769396500@rkmorris.us> <ig1b7c$j8n$1@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 5 Jan 2011 09:20:07 -0800
Message-ID: <AANLkTi=h8ciaBs5ayv58ssB5BWpxFSb64E2V2t2XyUKS@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: H1940 Boot Issues -> Executable Build Problems?
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
X-List-Received-Date: Wed, 05 Jan 2011 17:20:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 5, 2011 at 12:47 AM, Koen Kooi <k.kooi@student.utwente.nl> wrot=
e:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 05-01-11 04:32, Russell Morris wrote:
>> Hi,
>>
>>
>>
>> A bit more info to try and help out here - as I'm fighting with this as =
best I can, but it's still kicking my butt ... :-).
>>
>> It really does look like the executable that is being created is not bui=
ld for the arm920t (armv4t). I have tried to run the executable on the targ=
et, and also with a modified version of qemu - and neither one works. If I =
tell qemu that the target is an arm920t the executable will not run, but if=
 I let it be the default qemu-arm it runs just fine.
>>
>> Has anyone else been able to get an OE build to run on an arm920t (armv4=
t) processor?
>
> DISTRO=3Dangstrom-2008.1 generates armv4t binaries just fine over here.

hmmm one of distro he tried was angstrom-2008.1. so this ay not be the
issue then

>
> regards,
>
> Koen
>
>
>>
>>
>>
>> Thanks,
>>
>> ... Russell
>>
>>
>>
>>
>>
>>
>> On Sun, Jan 2, 2011 06:34 =C2=A0AM, <openembedded@rkmorris.us> wrote:
>>
>>>
>> My sincere apologies - as I never got that earlier email (but was having=
 issues with Norton filtering my email, so I'm sure it was on my side .. :-=
().
>>>
>>> To answer your question though - the MACHINE is h1940, and I have tried=
 two different DISTRO's ... minimal and angstrom-2008.1. I am using the mas=
ter branch of OpenEmbedded, and last updated it ~ 30 days ago.
>>>
>>> Thoughts?
>>>
>>> Thanks!
>>>
>>> ... Russell
>>>
>>>
>>> On Sun, Jan 2, 2011 00:44 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>>> On Sat, Jan 1, 2011 at 10:34 AM, <openembedded@rkmorris.us> wrote:
>>>>> Hi,
>>>>>
>>>>>
>>>>>
>>>>> As I have been debugging this it's looking more like a build issue - =
so let me try the developer group, in case someone here has seen this befor=
e.
>>>>>
>>>>>
>>>>>
>>>>> Copying over the key point from below ... I (successfully) built the =
helloworld-image,
>>>>
>>>>
>>>> what was MACHINE and DISTRO and OpenEmbedded revision you used ? I
>>>> think I asked same qestion when you posted this to oe-users ml. If you
>>>> are not going to provide information then I am afraid not many can
>>>> help you here
>>>>
>>>> but cannot run the resulting helloworld binary on the target machine -
>>>> it does execute under QEMU, which doesn't provide support this CPU
>>>> (arm920t - armv4t). However, a functioning binary from the target
>>>> (armv4t) machine runs on the target, but not on QEMU (as expected). So
>>>> it seems that OpenEmbedded is not building for the right machine
>>>> (which is strange, as the OpenEmbedded built kernel works!).
>>>>>
>>>>>
>>>>>
>>>>> Any thoughts on this? It seems that OpenEmbedded / bitbake may be usi=
ng QEMU to create the binary for the target ... is that right (as it's what=
 I have seen in a bit of poking around)? This would be a problem, as QEMU d=
oesn't support the arm920t processor. Perhaps I have to apply the QEMU patc=
h that adds this support to QEMU, or change my config to somehow create the=
 executable in a different way?
>>>>>
>>>>>
>>>>>
>>>>> Any suggestions would be greatly appreciated - as my current built (a=
ctually, rootfs) is not functioning on the target machine.
>>>>>
>>>>>
>>>>>
>>>>> Thanks!
>>>>>
>>>>>
>>>>>
>>>>> ... Russell
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>
>>>>> Subject: Re: [Openembedded-users] H1940 Boot Issues
>>>>> From: <openembedded@rkmorris.us>
>>>>> Date: Thu, Dec 30, 2010 11:36 PM
>>>>> To: Openembedded-users@lists.openembedded.org
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>
>>>>> Hi,
>>>>>
>>>>>
>>>>>
>>>>> OK, I haven't given up on this - and now it gets more interesting ...=
 :-). It seems that OpenEmbedded is not properly building a binary for the =
ARM920T CPU (arm4t) - has anyone else seen this?
>>>>>
>>>>>
>>>>>
>>>>> I built the helloworld-image, and cannot run the resulting helloworld=
 binary on the target machine - but can run it under QEMU, which doesn't ev=
en support this CPU. However, a functioning binary from the target (arm4t) =
machine runs on the target, but not on QEMU (as expected). So it seems that=
 OpenEmbedded is not building for the right machine (which is strange, as t=
he OpenEmbedded built kernel works!).
>>>>>
>>>>>
>>>>>
>>>>> The config files seem to be set up for the right target machine, but =
the binary is not being built right for some reason. Does anyone have any i=
deas?
>>>>>
>>>>>
>>>>>
>>>>> Thanks!
>>>>>
>>>>>
>>>>>
>>>>> ... Russell
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>
>>>>> On Fri, Dec 24, 2010 09:20 AM, <openembedded@rkmorris.us> wrote:
>>>>>
>>>>>
>>>>>>
>>>>>
>>>>>
>>>>>
>>>>> Hi,
>>>>>
>>>>>
>>>>>
>>>>> I have tried quite a few more things here, still with no luck. It rea=
lly does seem that OpenEmbedded does not properly / fully build an image th=
at works on (real?) embedded systems ... :-(. I am out of things to try, bu=
t let me pass this info along in the hope that it will save others some tim=
e / grief if they try to do similar things.
>>>>>
>>>>>
>>>>>
>>>>> I have tried several different formats / approaches to the rootfs, no=
ne of which work (except for the legacy Familiar Linux file system that I f=
ound). I cannot load the OpenEmbedded rootfs as an initrd, or when extracte=
d to an SD card (as a "normal" file system, either copied from the ext2 fil=
e, or extracted from tar.gz). While this seems to be a rootfs issue, it sti=
ll could be the build of init, as replacing the Familiar Linux init.sysvini=
t with the one generated by OpenEmbedded does in fact break the working fil=
e system. I tried reducing the size of generated rootfs (by setting IMAGE_R=
OOTFS_SIZE), but that doesn't seem to be working either (so I cannot use th=
e OpenEmbedded rootfs as an initrd, as it is 64 MB, which seems to cause pr=
oblems on the target system). BTW, the OpenEmbedde
>> =C2=A0d generated linuxrc file is just a link to /bin/busybox, which see=
ms a bit strange - so perhaps this is the issue?
>>>>>
>>>>>
>>>>>
>>>>> Hopefully this helps other folks - by not trying these same things.
>>>>>
>>>>>
>>>>>
>>>>> ... Russell
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>>
>>>>>> On Wed, Dec 22, 2010 11:28 PM, <openembedded@rkmorris.us> wrote:
>>>>>>
>>>>>
>>>>>>
>>>>> Hi,
>>>>>>
>>>>>> I have been strugging with this for quite some now, and really am st=
uck - so I really would appreciate any thoughts or pointers anyone has! Let=
 me try to explain my problem.
>>>>>>
>>>>>> I have been able to build OpenEmbedded on my machine, with a target =
of either h1940 or qemuarm - and for the console-image both build just fine=
. I can use the kernel for both of these (on the appropriate target), but m=
y issue is with the rootfs. If I use the OpenEmbedded built rootfs in qemua=
rm, targeted for either qemuarm or the h1940 (but always using the qemuarm =
kernel) everything works just fine.
>>>>>>
>>>>>> My issue arises when trying to use the rootfs on the h1940 - I canno=
t get my system to boot, and actually INIT is never launched (but the kerne=
l seems fine). If I take an old file system that I was able to find (from F=
amiliar Linux, ~ 2004-2005 vintage), it works fine on my h1940 (with the ke=
rnel from OpenEmbedded!) ... so the issue seems to be the rootfs. If I just=
 replace /sbin/init.sysvinit in the Familiar Linux file system with the one=
 from OpenEmbedded - then I get kernel panic (and no init found it says ...=
 :-(). Oddly enough, if I use the Familiar LInux file system with qemuarm -=
 it doesn't work, I have file system errors (and kernel panic), but the Ope=
nEmbedded built file system (even for the h1940) works just great).
>>>>>>
>>>>>> So it seems that I have some sort of filesystem incompatibility ... =
or am I wrong? BTW, I can load the above mentioned filesystems as ext2 or e=
xt3 in (OpenSUSE) Linux, no issues there.
>>>>>>
>>>>>> Again, any suggestions of how to fix this would be greatly appreciat=
ed!
>>>>>>
>>>>>> Thanks!
>>>>>>
>>>>>> ... Russell
>>>>>>
>>>>>>
>>>>>> _______________________________________________
>>>>>> Openembedded-users mailing list
>>>>>> Openembedded-users@linuxtogo.org
>>>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-use=
rs
>>>>>> _______________________________________________
>>>>> Openembedded-users mailing list
>>>>> Openembedded-users@linuxtogo.org
>>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-user=
s
>>>>> _______________________________________________
>>>>> Openembedded-devel mailing list
>>>>> Openembedded-devel@lists.openembedded.org
>>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-deve=
l
>>>>>
>>>>
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>>
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFNJDAsMkyGM64RGpERAnXbAJ4nw3gu1JA47X0xUMOHFJ1sA31aTACdFw1K
> mJcYeEnaLSmo0XaY0eXokUU=3D
> =3DHU+c
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


