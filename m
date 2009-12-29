Received: from fg-out-1718.google.com ([72.14.220.152])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1NPeK4-0008PT-Sw
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Dec 2009 16:49:27 +0100
Received: by fg-out-1718.google.com with SMTP id 16so4146842fgg.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Dec 2009 07:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=za/SFawaStHrVtnSMxzxOg/nY8uggmsy8qUFsxkLTQw=;
	b=s3MneVqLNUdYQbozLvqcuISy0bxFxJTogTEXDRHEBLOrytNwzmW9ArfS90FOP8RGEv
	3fyENPjSixUfguIbVaR9+5nAT40Scbp9+gS5qz2wMvoaJ4w9JDDPQUvCvzV+4izsDhbg
	98bNbLh3Ccpt5aO1hTzrlG/befI9LvA41HwIM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=CsHgUUCTsryIOITM1ilsJ9liNrxxUn2DLcfKWO8z9Bd/hCKD1oZ2TcHKngbwzG2yLA
	rIX8xJXCmtH78f0LvaYKhg1rcnAvfNEKLs9UWpKAwsWxapqOHW6o9pA4QwGwxH2QmwYn
	+ZZkwS0FA0nijqcA8Ev/QyyvCEO2/d85Yjq1c=
MIME-Version: 1.0
Received: by 10.239.138.35 with SMTP id n35mr1871140hbn.30.1262101645504; Tue, 
	29 Dec 2009 07:47:25 -0800 (PST)
In-Reply-To: <1262100857.15344.112.camel@mill.internal.reciva.com>
References: <c384c5ea0912290715l24b705fat6700077741b1cc5b@mail.gmail.com>
	<1262100857.15344.112.camel@mill.internal.reciva.com>
Date: Tue, 29 Dec 2009 16:47:25 +0100
Message-ID: <c384c5ea0912290747g10ae4628md72a546de70ff18a@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 72.14.220.152
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
X-List-Received-Date: Tue, 29 Dec 2009 15:49:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello Phil, all,

On Tue, Dec 29, 2009 at 4:34 PM, Phil Blundell <philb@gnu.org> wrote:
> On Tue, 2009-12-29 at 16:15 +0100, Leon Woestenberg wrote:
>> Why do we hardcode names of default packages in the "image.bbclass"?
>>
>> Now every image recipe that doesn't want these has to know the
>> variables it has to override.
>>
>> Shouldn't this be distro material instead?
>
> Funnily enough I was just discussing a similar issue with Mickey on IRC
> a few minutes ago.
>
> Most of these variables did use to be part of the distro configuration
> but it appears they were moved into image.bbclass by commit
> 9752b780ae9cbe8b36507890d8ee55c439eb2b35. =A0Presumably this change was
> made for a reason, but it does seem like a retrograde step to me: one
> particular ill-effect of that change is that images built for micro have
> regressed to using udev, whereas previously they were selecting
> busybox-mdev via ${DISTRO_DEV_MANAGER}. =A0There doesn't seem to be any
> obviously-correct way to restore the previous behaviour.
>
I agree with your analysis.

Don't get me wrong; there must be a valid reason for the approach, I
just don't think we are heading in the right direction.
See reasoning below.

> I have suggested to Mickey that perhaps the TSC would like to consider
> this issue and come up with a coherent policy on how this stuff should
> be managed.
>

Too many assumptions are being made in our classes.
Ideally, the classes should be totally void of hardcoded values.

The image class should be instructed by the user and the distro about
what to install.



Currently, a number of variables have to be overridden to get back to
the previous behaviour.
(This is the "disabling" part I mentioned in my other thread.)
ONLINE_PACKAGE_MANAGEMENT
USE_DEVFS
IMAGE_BOOT


I already disliked our architectures being hard coded (such as
siteinfo) but that's the least annoying part.


Regards,
--=20
Leon


