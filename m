Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NPhU9-0005uX-Q8 for openembedded-devel@lists.openembedded.org;
	Tue, 29 Dec 2009 20:12:04 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NPhSH-0002Xi-2P
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Dec 2009 20:10:05 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Dec 2009 20:10:05 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Dec 2009 20:10:05 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 29 Dec 2009 20:09:42 +0100
Message-ID: <hhdk5l$6ph$1@ger.gmane.org>
References: <c384c5ea0912281419h3c14c675r8ec6d044c234a381@mail.gmail.com>	<hhcg4o$ubd$1@ger.gmane.org>	<c384c5ea0912290651i1d3370bdk509d6f04f54a8d1a@mail.gmail.com>	<hhdi83$13n$1@ger.gmane.org>
	<4B3A508D.8030908@mlbassoc.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.5) Gecko/20091220 Shredder/3.0.1pre
In-Reply-To: <4B3A508D.8030908@mlbassoc.com>
X-Enigmail-Version: 1.0
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: helloworld image
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
X-List-Received-Date: Tue, 29 Dec 2009 19:12:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 29-12-09 19:55, Gary Thomas wrote:
> On 12/29/2009 11:36 AM, Koen Kooi wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 29-12-09 15:51, Leon Woestenberg wrote:
>>> Hello Koen,
>>>
>>> On Tue, Dec 29, 2009 at 9:54 AM, Koen
>>> Kooi<k.kooi@student.utwente.nl>  wrote:
>>>> On 28-12-09 23:19, Leon Woestenberg wrote:
>>>>> I would like to start with nothing and then configure the system for
>>>>> what I need.
>>>>>
>>>>> Should I start another more-minimal distro or can we change the
>>>>> minimal distro to be truely minimalistic?
>>>>
>>>> You're confusing image and distro again. With angstrom I'm using a
>>>> 80KiB
>>>> big image that has an fbdev based gui, so it looks your image recipe is
>>>> doing something wrong.
>>>>
>>> I think I am not confusing them again, I think other people are.
>>>
>>> This is what happened:
>>>
>>> Changes to the distro have made the image bigger (80 kB to 4MB).
>>>
>>> Apparently, the image does not define what goes in the image, but the
>>> distro now specifies a minimum amount of packages that goes in.
>>
>> Actually it does not, your image recipe has the final say. Like I said,
>> I have no trouble building an 80KiB image with angstrom.
>>
> 
> I'd like to know what steps you take to make such an image.
> 
> Perhaps you could share your config files so that others can
> see how it's done (as opposed to just repeating that it *can*
> be done)?

the local.conf I use is the same as contrib/angstrom/local.conf, the
image is in recipes/kexecboot/initramfs-kexecboot-image.bb.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLOlP2MkyGM64RGpERAkjUAKCON8dwDj/dkhNWh79e8HOD1dxFsQCcCY1O
rJc1RWIiu9aE17ewOBQ5X4c=
=R+vW
-----END PGP SIGNATURE-----



