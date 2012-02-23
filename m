Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1S0VRi-0005CO-Ga
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Feb 2012 10:58:42 +0100
Received: by pbbjt11 with SMTP id jt11so496767pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2012 01:50:20 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.adami@gmail.com designates
	10.68.226.166 as permitted sender) client-ip=10.68.226.166; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of andrea.adami@gmail.com
	designates 10.68.226.166 as permitted sender)
	smtp.mail=andrea.adami@gmail.com;
	dkim=pass header.i=andrea.adami@gmail.com
Received: from mr.google.com ([10.68.226.166])
	by 10.68.226.166 with SMTP id rt6mr2140967pbc.23.1329990620306
	(num_hops = 1); Thu, 23 Feb 2012 01:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=OVPAjt+V99mf4dNfzyKtwhXVzRkpd8zzISri/EkwLxo=;
	b=t75liRuB3FzngRqFphRqivaIAwHZ3DXKfO1xp5lfeYMQ05itc4T8pWoi5jqXVnsJEO
	Dh18fQLD03Wm5GhAgEmvD8a9D+QrxISq6P2deuGhHBB55FYtixleS1vdiRL4PxfeLe4Q
	z5AEYeHJKSu8v2rHXWYe/eXCsa+LR9dvTR7xc=
MIME-Version: 1.0
Received: by 10.68.226.166 with SMTP id rt6mr1781548pbc.23.1329990620189; Thu,
	23 Feb 2012 01:50:20 -0800 (PST)
Received: by 10.143.147.17 with HTTP; Thu, 23 Feb 2012 01:50:20 -0800 (PST)
In-Reply-To: <20120223063635.GM3769@jama.jama.net>
References: <1329949688-15070-1-git-send-email-andrea.adami@gmail.com>
	<20120223063635.GM3769@jama.jama.net>
Date: Thu, 23 Feb 2012 10:50:20 +0100
Message-ID: <CAAQYJAv4M8-z7aBskt9T31RN27U+R2YU9CPT9NXJCq8F2EMtig@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-handheld][PATCH] linux_3.2: update from 3.2.1 to 3.2.7
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
X-List-Received-Date: Thu, 23 Feb 2012 09:58:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 23, 2012 at 7:36 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Wed, Feb 22, 2012 at 11:28:08PM +0100, Andrea Adami wrote:
>> * apply latest patchset
>> * bump INC_PR
>
> Looking at this commit and almost the same in meta-initramfs, why
> haven't you moved linux-3.2.inc to meta-initramfs and use that from
> meta-handheld as it already depends on meta-initramfs layer for
> kexecboot?
>
> Cheers,
>

Martin,
I even plan to merge the linux-3.1.inc, linux-3.2.inc and
linux-git.inc in the respective recipes...

I prefer to keep the two kernels clearly separated for several reasons:

- people can be interested in meta-initramfs only and it's much more
clear having a single file and one .inc
 (they would find this second .inc pointless)

- there is little need to match linux and linux-kexecboot 3.x versions

- I plan to test linux-yocto, maybe only for linux-kexecboot at the
beginning so the recipes will diverge

- Imho we have already too many kernel recipes and files in meta-initramfs

Regards

Andrea


>> ---
>> =A0recipes-kernel/linux/linux-3.2.inc | =A0 =A06 +++---
>> =A0recipes-kernel/linux/linux_3.2.bb =A0| =A0 =A02 +-
>> =A02 files changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/recipes-kernel/linux/linux-3.2.inc b/recipes-kernel/linux/l=
inux-3.2.inc
>> index 8dd30d9..3a37200 100644
>> --- a/recipes-kernel/linux/linux-3.2.inc
>> +++ b/recipes-kernel/linux/linux-3.2.inc
>> @@ -3,12 +3,12 @@ DEFAULT_PREFERENCE =3D "-1"
>> =A0COMPATIBLE_MACHINE =3D "(spitz)"
>>
>> =A0SRC_URI +=3D "${KERNELORG_MIRROR}/linux/kernel/v3.x/linux-${PV}.tar.b=
z2;name=3Dkernel \
>> - =A0 =A0 =A0 =A0 =A0 ${KERNELORG_MIRROR}/linux/kernel/v3.x/patch-${PV}.=
1.bz2;apply=3Dyes;name=3Dstablepatch \
>> + =A0 =A0 =A0 =A0 =A0 ${KERNELORG_MIRROR}/linux/kernel/v3.x/patch-${PV}.=
7.bz2;apply=3Dyes;name=3Dstablepatch \
>> =A0 =A0 =A0 =A0 =A0 =A0 file://defconfig \
>> =A0 =A0 =A0 =A0 =A0 =A0 file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2 \
>> =A0 =A0 =A0 =A0 =A0 =A0 "
>>
>> =A0SRC_URI[kernel.md5sum] =3D "7ceb61f87c097fc17509844b71268935"
>> =A0SRC_URI[kernel.sha256sum] =3D "c881fc2b53cf0da7ca4538aa44623a7de043a4=
1f76fd5d0f51a31f6ed699d463"
>> -SRC_URI[stablepatch.md5sum] =3D "31fc34340f11118873463a1d59d47b7f"
>> -SRC_URI[stablepatch.sha256sum] =3D "e9a26dc5faa309ae5172e3c65081fa98b60=
befab160fb14d9a75816bbde15626"
>> +SRC_URI[stablepatch.md5sum] =3D "899624bffed6a19578613b672cc9483f"
>> +SRC_URI[stablepatch.sha256sum] =3D "779c548f4418f0baa782252d15a54fadf3c=
88d79fc547ee5801d31798020e701"
>> diff --git a/recipes-kernel/linux/linux_3.2.bb b/recipes-kernel/linux/li=
nux_3.2.bb
>> index 28564b6..6c15a88 100644
>> --- a/recipes-kernel/linux/linux_3.2.bb
>> +++ b/recipes-kernel/linux/linux_3.2.bb
>> @@ -1,4 +1,4 @@
>> =A0require linux.inc
>> =A0require linux-${PV}.inc
>>
>> -PR =3D "${INC_PR}.0"
>> +PR =3D "${INC_PR}.1"
>> --
>> 1.7.3.4
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa =A0 =A0 jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


