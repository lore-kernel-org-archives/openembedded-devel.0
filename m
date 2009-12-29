Received: from ey-out-1920.google.com ([74.125.78.146])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1NPi1M-0005ZV-7b
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Dec 2009 20:46:23 +0100
Received: by ey-out-1920.google.com with SMTP id 26so1164815eyw.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Dec 2009 11:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=UwoAr4x+cOEQ/XdIWPwpIz6nYzMjJX2K6n9kb3Vq8IU=;
	b=nWHaqZjXS/SbqImKLwhJ8r492QKlmEjsIK92Tx7yGHLdRj7YBUdxQJWCOI8EK7W4Je
	blzRjdyr1km4Qajasfi8B2TdiOOEOuJiECJ0TmXQXCXJwllDXm1yTeVdEOT1yRwwMKHe
	ouqH5cP7kMkMhvS7bsz2JkZjtc3kVgE4jBAG4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=FiKdhJgG0Rv4vrW/MClfP/kv1yIy9LRTBOXNOSh4g4fR3DZuHKIDMX0ITrX4Cyaw3z
	eT5vPdILdOq8F1HZurcRhik9Ydmz5szm0dmXF8L1r6cFaM53x4/vEvnGMZDJqJl8Mlf/
	E32eSsfm6++Gy2YB9pXNT8zbPt6Iy3q8v3jrE=
MIME-Version: 1.0
Received: by 10.213.102.138 with SMTP id g10mr11973637ebo.19.1262115864407; 
	Tue, 29 Dec 2009 11:44:24 -0800 (PST)
In-Reply-To: <hhdipd$25q$2@ger.gmane.org>
References: <c384c5ea0912290715l24b705fat6700077741b1cc5b@mail.gmail.com>
	<hhdipd$25q$2@ger.gmane.org>
Date: Tue, 29 Dec 2009 20:44:24 +0100
Message-ID: <c384c5ea0912291144p3c800d9fq4975f94494a04e1f@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.78.146
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
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
X-List-Received-Date: Tue, 29 Dec 2009 19:46:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Koen,

On Tue, Dec 29, 2009 at 7:46 PM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 29-12-09 16:15, Leon Woestenberg wrote:
>> Why do we hardcode names of default packages in the "image.bbclass"?
>>
>> Now every image recipe that doesn't want these has to know the
>> variables it has to override.
>>
>> Shouldn't this be distro material instead?
>
> No, since these are things you want to be able to manage on a per image
> basis, not distro wide. I don't want to create a whole 'new' distro just
> to try mdev instead of udev or use tinylogin instead of shadow, etc.
> When we made that change we discussed what the default values for those
> vars should be and it was agreed they should provide sane defaults.
>
OK understood, apparantly we want to have a generic image base
containing udev, a login, shadow etc.
that is distro-indepent.

Can we remove that from the image class, and move into a
image-boot.inc or something?

Regards,
-- 
Leon


