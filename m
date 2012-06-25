Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <angweiyang@gmail.com>) id 1Siyiu-00051h-MB
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Jun 2012 04:08:16 +0200
Received: by obcva7 with SMTP id va7so5776541obc.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jun 2012 18:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=4FA1I7s6rodUKEhQaG4iGGufJm3uWa6dDsBE9V+pBbs=;
	b=SaMpA5Mor4aXbmE7oGQdsOldDsir6whaE2mfpl+5OhIF8lsmcmmaIqZVK02FR8QM/Q
	UA07CZnwBX3d3KozIOxWzCdzcDP1KVsF7pi3HlAndKi1gH+gae9KC7OG3TxthED0Roov
	UiOwwCSTXaVi4ucTrSTDohUS1wgIbuOjyC+tjpjBk1LGZX/bfV82kOYWY0P7nCRxxXSS
	nDWTI4Jeb/f/RpH9aEy/vf7vkqM8dbx76lBkUpkD2cbu8LqGtIgA7EhKLjZZGgsPIemi
	dobksOqWl4iAESSBd4oO6mDljSByyyFdzaAHw/e/4NXhT59vAUfklWcc9wi8VmfwNe3V
	5dbA==
MIME-Version: 1.0
Received: by 10.182.52.38 with SMTP id q6mr10460875obo.8.1340589445779; Sun,
	24 Jun 2012 18:57:25 -0700 (PDT)
Received: by 10.182.202.66 with HTTP; Sun, 24 Jun 2012 18:57:25 -0700 (PDT)
In-Reply-To: <CAOy7-nMFSuLONcnXRgntA7O4Nmx8Rxo4NcBq-jfhkmPZKAB++Q@mail.gmail.com>
References: <1335951932-6143-1-git-send-email-koen@dominion.thruhere.net>
	<1335951932-6143-3-git-send-email-koen@dominion.thruhere.net>
	<CAOy7-nMFSuLONcnXRgntA7O4Nmx8Rxo4NcBq-jfhkmPZKAB++Q@mail.gmail.com>
Date: Mon, 25 Jun 2012 09:57:25 +0800
Message-ID: <CAOy7-nNm90fkOR_f3a6fZkuBgnV7PFE-E9UXUkq-AR5A-MayBA@mail.gmail.com>
From: James <angweiyang@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-oe/denzil][PATCH 3/6] media-ctl: update to latest git
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
X-List-Received-Date: Mon, 25 Jun 2012 02:08:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Ping!!

On Wed, May 9, 2012 at 12:00 PM, James <angweiyang@gmail.com> wrote:
> Hi Koen,
>
> On Wed, May 2, 2012 at 5:45 PM, Koen Kooi <koen@dominion.thruhere.net> wr=
ote:
>> * split out libs
>> * media-ctl has been relicensed to LGPLv2.1+
>>
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>> =A0meta-oe/recipes-multimedia/v4l2apps/media-ctl_git.bb | =A0 12 +++++++=
+----
>> =A01 file changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta-oe/recipes-multimedia/v4l2apps/media-ctl_git.bb b/meta=
-oe/recipes-multimedia/v4l2apps/media-ctl_git.bb
>> index 99ec8e2..76d811b 100644
>> --- a/meta-oe/recipes-multimedia/v4l2apps/media-ctl_git.bb
>> +++ b/meta-oe/recipes-multimedia/v4l2apps/media-ctl_git.bb
>> @@ -1,16 +1,20 @@
>> =A0DESCRIPTION =3D "Media controller control application"
>> -LICENSE =3D "GPLv2"
>> -LIC_FILES_CHKSUM =3D "file://COPYING.GPL;md5=3D751419260aa954499f7abaab=
aa882bbe"
>> +LICENSE =3D "LGPLv2+"
>> +LIC_FILES_CHKSUM =3D "file://COPYING.LIB;md5=3Dd749e86a105281d7a44c2328=
acebc4b0"
>>
>> =A0SRC_URI =3D "git://git.ideasonboard.org/media-ctl.git;protocol=3Dgit"
>> -SRCREV =3D "a183835abdefb8e40650fc9eb22e2d291aac9883"
>> +SRCREV =3D "46bec667b675573cf1ce698c68112e3dbd31930e"
>>
>> =A0PV =3D "0.0.1"
>> +PR =3D "r1"
>> =A0S =3D "${WORKDIR}/git"
>>
>> =A0inherit autotools
>>
>> -# It needs some kernel definitions for v4l2, so it isn't machine specif=
ic
>> +# It needs some kernel definitions only for v4l2, so it isn't machine s=
pecific
>> =A0EXTRA_OECONF =3D "--with-kernel-headers=3D${STAGING_KERNEL_DIR}"
>>
>> +PACKAGES =3D+ "libmediactl libv4l2subdev"
>> +FILES_libmediactl =3D "${libdir}/libmediactl${SOLIBS}"
>> +FILES_libv4l2subdev =3D "${libdir}/libv4l2subdev${SOLIBS}"
>>
>> --
>> 1.7.10
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> I tried using this new recipe on OE-classic and bitbake v1.12 but the
> do_configure failed.
>
> A look into the configure.log shows
> ..
> checking linux/media.h usability ... no
> checking linux/media.h presence ... no
> checking for linux/media.h ... no
> ERROR: Kernel header file not found or not usable!
> ...
>
> This is due to ${STAGING_KERNEL_DIR} pointing to an invalid location.
> It's pointing to /sysroots/armv7a-angstrom-linux-gnueabi/kernel
> instead it is located in /sysroots/${MACHINE}-angstrom-linux-gnueabi/kern=
el
>
> Change you please relook into this?
>
> Thank you.
> --
> Regards,
> James Ang



--=20
Regards,
James


