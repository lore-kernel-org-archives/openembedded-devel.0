Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NPuHk-0006HC-Bm for openembedded-devel@lists.openembedded.org;
	Wed, 30 Dec 2009 09:52:07 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NPuFo-00046F-Py
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Dec 2009 09:50:04 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2009 09:50:04 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2009 09:50:04 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 30 Dec 2009 09:48:40 +0100
Message-ID: <hhf457$n7h$2@ger.gmane.org>
References: <c384c5ea0912290715l24b705fat6700077741b1cc5b@mail.gmail.com>	<hhdipd$25q$2@ger.gmane.org>	<c384c5ea0912291144p3c800d9fq4975f94494a04e1f@mail.gmail.com>
	<19c1b8a90912291442q426ddd95n9acff7b8df592092@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.5) Gecko/20091220 Shredder/3.0.1pre
In-Reply-To: <19c1b8a90912291442q426ddd95n9acff7b8df592092@mail.gmail.com>
X-Enigmail-Version: 1.0
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Move IMAGE_BOOT stuff into distro's?
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
X-List-Received-Date: Wed, 30 Dec 2009 08:52:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 29-12-09 23:42, Khem Raj wrote:
> On Tue, Dec 29, 2009 at 11:44 AM, Leon Woestenberg
> <leon.woestenberg@gmail.com> wrote:
>> Hello Koen,
>>
>> On Tue, Dec 29, 2009 at 7:46 PM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
>>> -----BEGIN PGP SIGNED MESSAGE-----
>>> Hash: SHA1
>>>
>>> On 29-12-09 16:15, Leon Woestenberg wrote:
>>>> Why do we hardcode names of default packages in the "image.bbclass"?
>>>>
>>>> Now every image recipe that doesn't want these has to know the
>>>> variables it has to override.
>>>>
>>>> Shouldn't this be distro material instead?
>>>
>>> No, since these are things you want to be able to manage on a per image
>>> basis, not distro wide. I don't want to create a whole 'new' distro just
>>> to try mdev instead of udev or use tinylogin instead of shadow, etc.
>>> When we made that change we discussed what the default values for those
>>> vars should be and it was agreed they should provide sane defaults.
>>>
>> OK understood, apparantly we want to have a generic image base
>> containing udev, a login, shadow etc.
>> that is distro-indepent.
>>
>> Can we remove that from the image class, and move into a
>> image-boot.inc or something?

What's the problem with setting 3 vars to "" in your helloworld image?

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLOxPoMkyGM64RGpERAi7PAJwMupouhtOhOH9pznDzucVaTHdBAACfYSua
B0hsO7h9Y0Y60IZJcu2zquw=
=HVbp
-----END PGP SIGNATURE-----



