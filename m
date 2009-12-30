Received: from mail-gx0-f217.google.com ([209.85.217.217])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NPurT-0003mF-AL
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Dec 2009 10:29:02 +0100
Received: by gxk9 with SMTP id 9so27096009gxk.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2009 01:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=8CihIWKDmQqQnYubyoHzxUMfo8Y4Q6W6Wnu4DwqvwY8=;
	b=JnDYycK6V684JQjaq6dcs0rYm/EhSWYbOc5Vq7kZz4I5Y7uMogzrVsAuLqtA6zehYO
	1aImP3YXezJcaBJwqwgn6YpVRUMC5dbJMa6V7oKGmdGh9CYdIrX2Bha2e2701n+Z7jqF
	NNvd39Vmkla4CWEUayCwyxku0ZAfvmgtSArVw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=xVyi8UEj1FA1+Ax6mx6FzgxC7JX5Vz3FxALurO+irBzjOsQaHfLUg/3wukuGv7wogI
	7Ux4sMYmhrJy7SUrbx/FQ8A/2z9Ka47sBvRyTinMqdTRdt6E1MyuuTWaMoIQ1fs8s99X
	X6ws9A1X+eRxgzsinHkYfAjjtjNmIlHYfB11E=
MIME-Version: 1.0
Received: by 10.101.130.8 with SMTP id h8mr2785449ann.168.1262165220390; Wed, 
	30 Dec 2009 01:27:00 -0800 (PST)
In-Reply-To: <hhf457$n7h$2@ger.gmane.org>
References: <c384c5ea0912290715l24b705fat6700077741b1cc5b@mail.gmail.com>
	<hhdipd$25q$2@ger.gmane.org>
	<c384c5ea0912291144p3c800d9fq4975f94494a04e1f@mail.gmail.com>
	<19c1b8a90912291442q426ddd95n9acff7b8df592092@mail.gmail.com>
	<hhf457$n7h$2@ger.gmane.org>
Date: Wed, 30 Dec 2009 10:27:00 +0100
Message-ID: <ac9c93b10912300127h3235cd26p25c9fddf3265af16@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.217.217
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
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
X-List-Received-Date: Wed, 30 Dec 2009 09:29:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

2009/12/30 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 29-12-09 23:42, Khem Raj wrote:
>> On Tue, Dec 29, 2009 at 11:44 AM, Leon Woestenberg
>> <leon.woestenberg@gmail.com> wrote:
>>> Hello Koen,
>>>
>>> On Tue, Dec 29, 2009 at 7:46 PM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
>>>> -----BEGIN PGP SIGNED MESSAGE-----
>>>> Hash: SHA1
>>>>
>>>> On 29-12-09 16:15, Leon Woestenberg wrote:
>>>>> Why do we hardcode names of default packages in the "image.bbclass"?
>>>>>
>>>>> Now every image recipe that doesn't want these has to know the
>>>>> variables it has to override.
>>>>>
>>>>> Shouldn't this be distro material instead?
>>>>
>>>> No, since these are things you want to be able to manage on a per image
>>>> basis, not distro wide. I don't want to create a whole 'new' distro just
>>>> to try mdev instead of udev or use tinylogin instead of shadow, etc.
>>>> When we made that change we discussed what the default values for those
>>>> vars should be and it was agreed they should provide sane defaults.
>>>>
>>> OK understood, apparantly we want to have a generic image base
>>> containing udev, a login, shadow etc.
>>> that is distro-indepent.
>>>
>>> Can we remove that from the image class, and move into a
>>> image-boot.inc or something?
>
> What's the problem with setting 3 vars to "" in your helloworld image?
>

What is wrong with the philosophy to have a bare minimal system and
add the three images to those who need them (and allow them to derive
from a base image that has these 3 packages.

E.g. one could then derive/extend base_image if you want to.

My philosophy is to keep things generic and specialize when going to
more specific situations, not to have a partially specialized solution
which has to be made more generic.fro a specific situation.

Frans.


