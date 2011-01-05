Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PaP2X-000806-RV for openembedded-devel@lists.openembedded.org;
	Wed, 05 Jan 2011 09:48:17 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PaP2C-0003Tk-91 for openembedded-devel@lists.openembedded.org;
	Wed, 05 Jan 2011 09:47:56 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Jan 2011 09:47:56 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Jan 2011 09:47:56 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 05 Jan 2011 09:47:40 +0100
Message-ID: <ig1b7c$j8n$1@dough.gmane.org>
References: <1294198349769396500@rkmorris.us>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1294198349769396500@rkmorris.us>
X-Enigmail-Version: 1.0.1
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
X-List-Received-Date: Wed, 05 Jan 2011 08:48:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 05-01-11 04:32, Russell Morris wrote:
> Hi,
> 
>  
> 
> A bit more info to try and help out here - as I'm fighting with this as best I can, but it's still kicking my butt ... :-).
> 
> It really does look like the executable that is being created is not build for the arm920t (armv4t). I have tried to run the executable on the target, and also with a modified version of qemu - and neither one works. If I tell qemu that the target is an arm920t the executable will not run, but if I let it be the default qemu-arm it runs just fine.
> 
> Has anyone else been able to get an OE build to run on an arm920t (armv4t) processor?

DISTRO=angstrom-2008.1 generates armv4t binaries just fine over here.

regards,

Koen


> 
>  
> 
> Thanks,
> 
> ... Russell
> 
>  
> 
> 
> 
> 
> On Sun, Jan 2, 2011 06:34  AM, <openembedded@rkmorris.us> wrote:
> 
>>
> My sincere apologies - as I never got that earlier email (but was having issues with Norton filtering my email, so I'm sure it was on my side .. :-().
>>
>> To answer your question though - the MACHINE is h1940, and I have tried two different DISTRO's ... minimal and angstrom-2008.1. I am using the master branch of OpenEmbedded, and last updated it ~ 30 days ago.
>>
>> Thoughts?
>>
>> Thanks!
>>
>> ... Russell
>>
>>
>> On Sun, Jan 2, 2011 00:44 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>> On Sat, Jan 1, 2011 at 10:34 AM, <openembedded@rkmorris.us> wrote:
>>>> Hi,
>>>>
>>>>
>>>>
>>>> As I have been debugging this it's looking more like a build issue - so let me try the developer group, in case someone here has seen this before.
>>>>
>>>>
>>>>
>>>> Copying over the key point from below ... I (successfully) built the helloworld-image,
>>>
>>>
>>> what was MACHINE and DISTRO and OpenEmbedded revision you used ? I
>>> think I asked same qestion when you posted this to oe-users ml. If you
>>> are not going to provide information then I am afraid not many can
>>> help you here
>>>
>>> but cannot run the resulting helloworld binary on the target machine -
>>> it does execute under QEMU, which doesn't provide support this CPU
>>> (arm920t - armv4t). However, a functioning binary from the target
>>> (armv4t) machine runs on the target, but not on QEMU (as expected). So
>>> it seems that OpenEmbedded is not building for the right machine
>>> (which is strange, as the OpenEmbedded built kernel works!).
>>>>
>>>>
>>>>
>>>> Any thoughts on this? It seems that OpenEmbedded / bitbake may be using QEMU to create the binary for the target ... is that right (as it's what I have seen in a bit of poking around)? This would be a problem, as QEMU doesn't support the arm920t processor. Perhaps I have to apply the QEMU patch that adds this support to QEMU, or change my config to somehow create the executable in a different way?
>>>>
>>>>
>>>>
>>>> Any suggestions would be greatly appreciated - as my current built (actually, rootfs) is not functioning on the target machine.
>>>>
>>>>
>>>>
>>>> Thanks!
>>>>
>>>>
>>>>
>>>> ... Russell
>>>>
>>>>
>>>>
>>>>
>>>>
>>>>
>>>>
>>>>
>>>>
>>>>
>>>> Subject: Re: [Openembedded-users] H1940 Boot Issues
>>>> From: <openembedded@rkmorris.us>
>>>> Date: Thu, Dec 30, 2010 11:36 PM
>>>> To: Openembedded-users@lists.openembedded.org
>>>>
>>>>
>>>>
>>>>
>>>>
>>>>
>>>> Hi,
>>>>
>>>>
>>>>
>>>> OK, I haven't given up on this - and now it gets more interesting ... :-). It seems that OpenEmbedded is not properly building a binary for the ARM920T CPU (arm4t) - has anyone else seen this?
>>>>
>>>>
>>>>
>>>> I built the helloworld-image, and cannot run the resulting helloworld binary on the target machine - but can run it under QEMU, which doesn't even support this CPU. However, a functioning binary from the target (arm4t) machine runs on the target, but not on QEMU (as expected). So it seems that OpenEmbedded is not building for the right machine (which is strange, as the OpenEmbedded built kernel works!).
>>>>
>>>>
>>>>
>>>> The config files seem to be set up for the right target machine, but the binary is not being built right for some reason. Does anyone have any ideas?
>>>>
>>>>
>>>>
>>>> Thanks!
>>>>
>>>>
>>>>
>>>> ... Russell
>>>>
>>>>
>>>>
>>>>
>>>>
>>>>
>>>> On Fri, Dec 24, 2010 09:20 AM, <openembedded@rkmorris.us> wrote:
>>>>
>>>>
>>>>>
>>>>
>>>>
>>>>
>>>> Hi,
>>>>
>>>>
>>>>
>>>> I have tried quite a few more things here, still with no luck. It really does seem that OpenEmbedded does not properly / fully build an image that works on (real?) embedded systems ... :-(. I am out of things to try, but let me pass this info along in the hope that it will save others some time / grief if they try to do similar things.
>>>>
>>>>
>>>>
>>>> I have tried several different formats / approaches to the rootfs, none of which work (except for the legacy Familiar Linux file system that I found). I cannot load the OpenEmbedded rootfs as an initrd, or when extracted to an SD card (as a "normal" file system, either copied from the ext2 file, or extracted from tar.gz). While this seems to be a rootfs issue, it still could be the build of init, as replacing the Familiar Linux init.sysvinit with the one generated by OpenEmbedded does in fact break the working file system. I tried reducing the size of generated rootfs (by setting IMAGE_ROOTFS_SIZE), but that doesn't seem to be working either (so I cannot use the OpenEmbedded rootfs as an initrd, as it is 64 MB, which seems to cause problems on the target system). BTW, the OpenEmbedde
>  d generated linuxrc file is just a link to /bin/busybox, which seems a bit strange - so perhaps this is the issue?
>>>>
>>>>
>>>>
>>>> Hopefully this helps other folks - by not trying these same things.
>>>>
>>>>
>>>>
>>>> ... Russell
>>>>
>>>>
>>>>
>>>>
>>>>
>>>>>
>>>>> On Wed, Dec 22, 2010 11:28 PM, <openembedded@rkmorris.us> wrote:
>>>>>
>>>>
>>>>>
>>>> Hi,
>>>>>
>>>>> I have been strugging with this for quite some now, and really am stuck - so I really would appreciate any thoughts or pointers anyone has! Let me try to explain my problem.
>>>>>
>>>>> I have been able to build OpenEmbedded on my machine, with a target of either h1940 or qemuarm - and for the console-image both build just fine. I can use the kernel for both of these (on the appropriate target), but my issue is with the rootfs. If I use the OpenEmbedded built rootfs in qemuarm, targeted for either qemuarm or the h1940 (but always using the qemuarm kernel) everything works just fine.
>>>>>
>>>>> My issue arises when trying to use the rootfs on the h1940 - I cannot get my system to boot, and actually INIT is never launched (but the kernel seems fine). If I take an old file system that I was able to find (from Familiar Linux, ~ 2004-2005 vintage), it works fine on my h1940 (with the kernel from OpenEmbedded!) ... so the issue seems to be the rootfs. If I just replace /sbin/init.sysvinit in the Familiar Linux file system with the one from OpenEmbedded - then I get kernel panic (and no init found it says ... :-(). Oddly enough, if I use the Familiar LInux file system with qemuarm - it doesn't work, I have file system errors (and kernel panic), but the OpenEmbedded built file system (even for the h1940) works just great).
>>>>>
>>>>> So it seems that I have some sort of filesystem incompatibility ... or am I wrong? BTW, I can load the above mentioned filesystems as ext2 or ext3 in (OpenSUSE) Linux, no issues there.
>>>>>
>>>>> Again, any suggestions of how to fix this would be greatly appreciated!
>>>>>
>>>>> Thanks!
>>>>>
>>>>> ... Russell
>>>>>
>>>>>
>>>>> _______________________________________________
>>>>> Openembedded-users mailing list
>>>>> Openembedded-users@linuxtogo.org
>>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-users
>>>>> _______________________________________________
>>>> Openembedded-users mailing list
>>>> Openembedded-users@linuxtogo.org
>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-users
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>>
>>>
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNJDAsMkyGM64RGpERAnXbAJ4nw3gu1JA47X0xUMOHFJ1sA31aTACdFw1K
mJcYeEnaLSmo0XaY0eXokUU=
=HU+c
-----END PGP SIGNATURE-----



