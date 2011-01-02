Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PZHgR-0002Gu-76
	for openembedded-devel@lists.openembedded.org;
	Sun, 02 Jan 2011 07:44:51 +0100
Received: by ywi6 with SMTP id 6so5321201ywi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 01 Jan 2011 22:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=crFQLZmw0e7grJiZNzKuD8FT2mAMUxrjR/2PYliPrhA=;
	b=A7LYt6sCyS/A7jl7AFmUq5x8O9H8463ryv5aE4LmZdMVAZ3rQBT8KVAspBO2egx0qY
	kcz5rMjhy0I8e0NEaQHLndEQRvnlFcQdiKQWAAA5gXG/0Q7E3n5adZoVzOFAYXV5SBhC
	HwJFxdvkcftY/jnb2Hr/kNf4dqAGEC6EAOOyY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=gZHcLJwOQa2Lfuonu8jW4TgjQG7e7UO+JWk/eIJ47Ngr1SiYLFM47s6g27AZtLJN6N
	cQhpYcekVnqG2eSkB2QDAWhHfFUM6jVks+DY7YQkSdz/VjRwbPm+x9+OOvRyLNJBUzjq
	zcsv33/ldwv1iStJLYI2exHoZPGnLfB0yiRzE=
Received: by 10.90.97.19 with SMTP id u19mr10621169agb.166.1293950668201; Sat,
	01 Jan 2011 22:44:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Sat, 1 Jan 2011 22:44:08 -0800 (PST)
In-Reply-To: <1293906868062803500@rkmorris.us>
References: <1293906868062803500@rkmorris.us>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 1 Jan 2011 22:44:08 -0800
Message-ID: <AANLkTim4xrqcQ2MoikD0jhjf3SJ8=g+HF9ikT=d01k8Y@mail.gmail.com>
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
X-List-Received-Date: Sun, 02 Jan 2011 06:44:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 1, 2011 at 10:34 AM,  <openembedded@rkmorris.us> wrote:
> Hi,
>
>
>
> As I have been debugging this it's looking more like a build issue - so l=
et me try the developer group, in case someone here has seen this before.
>
>
>
> Copying over the key point from below ... I (successfully) built the hell=
oworld-image,


what was MACHINE and DISTRO and OpenEmbedded revision you used ? I
think I asked same qestion when you posted this to oe-users ml. If you
are not going to provide information then I am afraid not many can
help you here

but cannot run the resulting helloworld binary on the target machine -
it does execute under QEMU, which doesn't provide support this CPU
(arm920t - armv4t). However, a functioning binary from the target
(armv4t) machine runs on the target, but not on QEMU (as expected). So
it seems that OpenEmbedded is not building for the right machine
(which is strange, as the OpenEmbedded built kernel works!).
>
>
>
> Any thoughts on this? It seems that OpenEmbedded / bitbake may be using Q=
EMU to create the binary for the target ... is that right (as it's what I h=
ave seen in a bit of poking around)? This would be a problem, as QEMU doesn=
't support the arm920t processor. Perhaps I have to apply the QEMU patch th=
at adds this support to QEMU, or change my config to somehow create the exe=
cutable in a different way?
>
>
>
> Any suggestions would be greatly appreciated - as my current built (actua=
lly, rootfs) is not functioning on the target machine.
>
>
>
> Thanks!
>
>
>
> ... Russell
>
>
>
>
>
>
>
>
>
>
> Subject: Re: [Openembedded-users] H1940 Boot Issues
> From: <openembedded@rkmorris.us>
> Date: Thu, Dec 30, 2010 11:36 PM
> To: Openembedded-users@lists.openembedded.org
>
>
>
>
>
>
> Hi,
>
>
>
> OK, I haven't given up on this - and now it gets more interesting ... :-)=
. It seems that OpenEmbedded is not properly building a binary for the ARM9=
20T CPU (arm4t) - has anyone else seen this?
>
>
>
> I built the helloworld-image, and cannot run the resulting helloworld bin=
ary on the target machine - but can run it under QEMU, which doesn't even s=
upport this CPU. However, a functioning binary from the target (arm4t) mach=
ine runs on the target, but not on QEMU (as expected). So it seems that Ope=
nEmbedded is not building for the right machine (which is strange, as the O=
penEmbedded built kernel works!).
>
>
>
> The config files seem to be set up for the right target machine, but the =
binary is not being built right for some reason. Does anyone have any ideas=
?
>
>
>
> Thanks!
>
>
>
> ... Russell
>
>
>
>
>
>
> On Fri, Dec 24, 2010 09:20 =C2=A0AM, <openembedded@rkmorris.us> wrote:
>
>
>>
>
>
>
> Hi,
>
>
>
> I have tried quite a few more things here, still with no luck. It really =
does seem that OpenEmbedded does not properly / fully build an image that w=
orks on (real?) embedded systems ... :-(. I am out of things to try, but le=
t me pass this info along in the hope that it will save others some time / =
grief if they try to do similar things.
>
>
>
> I have tried several different formats / approaches to the rootfs, none o=
f which work (except for the legacy Familiar Linux file system that I found=
). I cannot load the OpenEmbedded rootfs as an initrd, or when extracted to=
 an SD card (as a "normal" file system, either copied from the ext2 file, o=
r extracted from tar.gz). While this seems to be a rootfs issue, it still c=
ould be the build of init, as replacing the Familiar Linux init.sysvinit wi=
th the one generated by OpenEmbedded does in fact break the working file sy=
stem. I tried reducing the size of generated rootfs (by setting IMAGE_ROOTF=
S_SIZE), but that doesn't seem to be working either (so I cannot use the Op=
enEmbedded rootfs as an initrd, as it is 64 MB, which seems to cause proble=
ms on the target system). BTW, the OpenEmbedded generated linuxrc file is j=
ust a link to /bin/busybox, which seems a bit strange - so perhaps this is =
the issue?
>
>
>
> Hopefully this helps other folks - by not trying these same things.
>
>
>
> ... Russell
>
>
>
>
>
>>
>> On Wed, Dec 22, 2010 11:28 =C2=A0PM, <openembedded@rkmorris.us> wrote:
>>
>
>>
> Hi,
>>
>> I have been strugging with this for quite some now, and really am stuck =
- so I really would appreciate any thoughts or pointers anyone has! Let me =
try to explain my problem.
>>
>> I have been able to build OpenEmbedded on my machine, with a target of e=
ither h1940 or qemuarm - and for the console-image both build just fine. I =
can use the kernel for both of these (on the appropriate target), but my is=
sue is with the rootfs. If I use the OpenEmbedded built rootfs in qemuarm, =
targeted for either qemuarm or the h1940 (but always using the qemuarm kern=
el) everything works just fine.
>>
>> My issue arises when trying to use the rootfs on the h1940 - I cannot ge=
t my system to boot, and actually INIT is never launched (but the kernel se=
ems fine). If I take an old file system that I was able to find (from Famil=
iar Linux, ~ 2004-2005 vintage), it works fine on my h1940 (with the kernel=
 from OpenEmbedded!) ... so the issue seems to be the rootfs. If I just rep=
lace /sbin/init.sysvinit in the Familiar Linux file system with the one fro=
m OpenEmbedded - then I get kernel panic (and no init found it says ... :-(=
). Oddly enough, if I use the Familiar LInux file system with qemuarm - it =
doesn't work, I have file system errors (and kernel panic), but the OpenEmb=
edded built file system (even for the h1940) works just great).
>>
>> So it seems that I have some sort of filesystem incompatibility ... or a=
m I wrong? BTW, I can load the above mentioned filesystems as ext2 or ext3 =
in (OpenSUSE) Linux, no issues there.
>>
>> Again, any suggestions of how to fix this would be greatly appreciated!
>>
>> Thanks!
>>
>> ... Russell
>>
>>
>> _______________________________________________
>> Openembedded-users mailing list
>> Openembedded-users@linuxtogo.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-users
>> _______________________________________________
> Openembedded-users mailing list
> Openembedded-users@linuxtogo.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-users
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


