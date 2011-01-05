Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PaP4V-000833-BK
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Jan 2011 09:50:19 +0100
Received: by gwaa12 with SMTP id a12so3713479gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Jan 2011 00:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=47KS8U2UPIWd9o5eZiPwFVECsx2Zft/7r7pfybdJd6M=;
	b=bW4g8Bgtykg6cRULW6SfN5XWrUuHmny/sHgW2Itqhrn9YrwbB+bqTy3Dlz9v4pb4rZ
	y6mss3+0/nBJXGH9LjVnTubFzfwiSxRMx8KLmssbzGBUQ6BA3Sn+VV1mY1CxLD25kj1c
	IfvGEVCoUoRgsQL6ANzniqmEJW3C0nKl7jA3g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=HNSvKAjBxPJjye3uHB4ImtQYElMZ94+SLX8JDyGDTy/mtdDF5lkEy9mn7lIDxHSMci
	kxKVRFdnsZV0c6KhmIQ9zUYpdyQFBufg8K6xryx9zoXqCBe5emK8Q6PDh2O6i7ScZW/N
	vsAVPSxw769uQc4aMrNNwEAGCtdD43ZtOFAnw=
Received: by 10.90.98.11 with SMTP id v11mr388173agb.58.1294217394896; Wed, 05
	Jan 2011 00:49:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Wed, 5 Jan 2011 00:49:32 -0800 (PST)
In-Reply-To: <ig1ac2$ej0$1@dough.gmane.org>
References: <1294198349769396500@rkmorris.us>
	<AANLkTim22AbOed09n1Ez6A2gtJhnjUDm3Ksv+tRDnn=8@mail.gmail.com>
	<AANLkTimbxOoZQRPQ+MsSNT++aXYnJsta8VmOA_Nbmc-k@mail.gmail.com>
	<ig1ac2$ej0$1@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 5 Jan 2011 00:49:32 -0800
Message-ID: <AANLkTi=Ut9T_gyoaeiJO5Gubj3e4rb8hOxgCOwwR4hbT@mail.gmail.com>
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
X-List-Received-Date: Wed, 05 Jan 2011 08:50:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 5, 2011 at 12:33 AM, Koen Kooi <k.kooi@student.utwente.nl> wrot=
e:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> That looks suspiciously like
> http://www.flickr.com/photos/quimgil/478715643/ :)
>

heh yes indeed no suspicion. I am just making sure that he is not
getting bitten by potential clz instructions from libgcc because now
it defaults to armv5te. If thats the case then we have to use
--with-arch=3D${BASE_PACKAGE_ARCH} while configuring gcc and then it
will compile the gcc runtime libraries with proper options for an arch.

> On 05-01-11 08:42, Khem Raj wrote:
>> here is updated patch
>>
>>
>>
>> On Tue, Jan 4, 2011 at 10:46 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>> On Tue, Jan 4, 2011 at 7:32 PM, Russell Morris <openembedded@rkmorris.u=
s> wrote:
>>>> Hi,
>>>>
>>>>
>>>>
>>>> A bit more info to try and help out here - as I'm fighting with this a=
s best I can, but it's still kicking my butt ... :-).
>>>>
>>>>
>>>>
>>>> It really does look like the executable that is being created is not b=
uild for the arm920t (armv4t). I have tried to run the executable on the ta=
rget, and also with a modified version of qemu - and neither one works. If =
I tell qemu that the target is an arm920t the executable will not run, but =
if I let it be the default qemu-arm it runs just fine.
>>>>
>>>>
>>>>
>>>> Has anyone else been able to get an OE build to run on an arm920t (arm=
v4t) processor?
>>>>
>>>>
>>>
>>> OK you seem to be one patient guy :) Here is totally untested patch
>>> for gcc. Please apply it on top of your openembedded. Then use
>>> DISTRO=3Dminimal
>>> or any other distro that uses gcc 4.5 and build OE from scratch again
>>> and see if that helps and report back.
>>>
>>> Thanks
>>> -Khem
>>>
>>>
>>>
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFNJCzCMkyGM64RGpERAvW/AKCTiQztYmWbEMLOvxHWtP0TrfGSwgCgnIdQ
> Df+XY7rjrMPTZKaMxfAXwRg=3D
> =3DJXQ8
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


