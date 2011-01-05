Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PaOoM-0007kn-Ia for openembedded-devel@lists.openembedded.org;
	Wed, 05 Jan 2011 09:33:38 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PaOo1-0005Yr-5Y for openembedded-devel@lists.openembedded.org;
	Wed, 05 Jan 2011 09:33:17 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Jan 2011 09:33:17 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Jan 2011 09:33:17 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 05 Jan 2011 09:33:06 +0100
Message-ID: <ig1ac2$ej0$1@dough.gmane.org>
References: <1294198349769396500@rkmorris.us>	<AANLkTim22AbOed09n1Ez6A2gtJhnjUDm3Ksv+tRDnn=8@mail.gmail.com>
	<AANLkTimbxOoZQRPQ+MsSNT++aXYnJsta8VmOA_Nbmc-k@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <AANLkTimbxOoZQRPQ+MsSNT++aXYnJsta8VmOA_Nbmc-k@mail.gmail.com>
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
X-List-Received-Date: Wed, 05 Jan 2011 08:33:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

That looks suspiciously like
http://www.flickr.com/photos/quimgil/478715643/ :)

On 05-01-11 08:42, Khem Raj wrote:
> here is updated patch
> 
> 
> 
> On Tue, Jan 4, 2011 at 10:46 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Tue, Jan 4, 2011 at 7:32 PM, Russell Morris <openembedded@rkmorris.us> wrote:
>>> Hi,
>>>
>>>
>>>
>>> A bit more info to try and help out here - as I'm fighting with this as best I can, but it's still kicking my butt ... :-).
>>>
>>>
>>>
>>> It really does look like the executable that is being created is not build for the arm920t (armv4t). I have tried to run the executable on the target, and also with a modified version of qemu - and neither one works. If I tell qemu that the target is an arm920t the executable will not run, but if I let it be the default qemu-arm it runs just fine.
>>>
>>>
>>>
>>> Has anyone else been able to get an OE build to run on an arm920t (armv4t) processor?
>>>
>>>
>>
>> OK you seem to be one patient guy :) Here is totally untested patch
>> for gcc. Please apply it on top of your openembedded. Then use
>> DISTRO=minimal
>> or any other distro that uses gcc 4.5 and build OE from scratch again
>> and see if that helps and report back.
>>
>> Thanks
>> -Khem
>>
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNJCzCMkyGM64RGpERAvW/AKCTiQztYmWbEMLOvxHWtP0TrfGSwgCgnIdQ
Df+XY7rjrMPTZKaMxfAXwRg=
=JXQ8
-----END PGP SIGNATURE-----



