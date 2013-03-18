Received: from mail-ea0-f170.google.com ([209.85.215.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UHfBR-0005gV-JX
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Mar 2013 19:53:26 +0100
Received: by mail-ea0-f170.google.com with SMTP id a15so2618383eae.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Mar 2013 11:36:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:references:mime-version:in-reply-to:content-type
	:content-transfer-encoding:message-id:cc:x-mailer:from:subject:date
	:to:x-gm-message-state;
	bh=EP0UYI2eQ75MVo2KEo6O0ggEGtIJDJVoQjAOPPih78A=;
	b=FW68YAQVvMndg6jrrAP/o17mf2Yhr2Ie3SE7StbjBWPPp3bcnGY0AEMK9f8HvK80bb
	+97Y8Gmkn5lwKNTqI4LwY20XiOZD5qLEZPCuOb6LYX+LDfYt26cwMtIALn/qCdk2Xxdx
	M5lL0VF2Ms/qWxH2SWU/TaeXBerXN1CYRFkGN38caI+p7lFaGrT88zGGPW+0cPRVDva1
	cGAZgD2I5JTwqdAwBuPk5oHssztMPrDTdh8w6v33WNarBBcxDtLD5jYoWUnAaXXPSxKD
	tLMb1Hry7hDo+jk9lfm1oTJ3v4Ibh3NzHogwMTSZWcmafBZNEyp004Ptf+qs/CEzXGGG
	uvkQ==
X-Received: by 10.14.0.135 with SMTP id 7mr51423368eeb.5.1363631793121;
	Mon, 18 Mar 2013 11:36:33 -0700 (PDT)
Received: from [172.20.0.101] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id k7sm28741127een.8.2013.03.18.11.36.31
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 18 Mar 2013 11:36:32 -0700 (PDT)
References: <1363592406-27335-1-git-send-email-koen@dominion.thruhere.net>
	<20130318183325.GA14025@windriver.com>
Mime-Version: 1.0 (1.0)
In-Reply-To: <20130318183325.GA14025@windriver.com>
Message-Id: <2884D477-780D-4EBD-A28A-A5F30E0E6A03@dominion.thruhere.net>
X-Mailer: iPhone Mail (10B146)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 18 Mar 2013 19:36:24 +0100
To: Joe MacDonald <Joe.MacDonald@windriver.com>
X-Gm-Message-State: ALoCoQlBjNWlvYiYey1EDPEpIOSBD2ezuQcWP6f2FSAIA7Q9f6t/ExQN110wwBlhELNvALqcsjUS
Cc: "<openembedded-devel@lists.openembedded.org>"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] cifs-utils: add 5.9
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
X-List-Received-Date: Mon, 18 Mar 2013 18:53:26 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable



Op 18 mrt. 2013 om 19:33 heeft Joe MacDonald <Joe.MacDonald@windriver.com> h=
et volgende geschreven:

> Hey Koen,
>=20
> [[oe] [meta-networking][PATCH] cifs-utils: add 5.9] On 13.03.18 (Mon 08:40=
) Koen Kooi wrote:
>=20
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>> meta-networking/recipes-support/cifs/cifs-utils_git.bb | 15 +++++++++++++=
++
>> 1 file changed, 15 insertions(+)
>> create mode 100644 meta-networking/recipes-support/cifs/cifs-utils_git.bb=

>>=20
>> diff --git a/meta-networking/recipes-support/cifs/cifs-utils_git.bb b/met=
a-networking/recipes-support/cifs/cifs-utils_git.bb
>> new file mode 100644
>> index 0000000..c78527e
>> --- /dev/null
>> +++ b/meta-networking/recipes-support/cifs/cifs-utils_git.bb
>> @@ -0,0 +1,15 @@
>> +DESCRIPTION =3D "A a package of utilities for doing and managing mounts o=
f the Linux CIFS filesystem."
>> +HOMEPAGE =3D "http://wiki.samba.org/index.php/LinuxCIFS_utils"
>> +
>> +LICENSE =3D "GPLv3 && LGPLv3"
>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504"
>> +
>> +PV =3D "5.9"
>> +
>> +SRCREV =3D "353d491dcb5d69d31434abeb962c8e9a49c36867"
>> +SRC_URI =3D "git://git.samba.org/cifs-utils.git"
>> +
>> +S =3D "${WORKDIR}/git"
>> +
>> +inherit autotools
>> +
>=20
> I had to make two changes to this recipe to address the following QA:
>=20
> WARNING: cifs-utils-5.9-r0: Failed to parse it's LICENSE field.
> WARNING: QA Issue: cifs-utils: Files/directories were installed but not sh=
ipped
>  /usr/bin
>  /usr/sbin
>=20
> First one's easy, I changed:
>=20
> +LICENSE =3D "GPLv3 && LGPLv3"
>=20
> to
>=20
> +LICENSE =3D "GPLv3 & LGPLv3"
>=20
> The second one I wasn't completely sure I was capturing what you
> intended to do with this, but I added this to the bottom of your recipe:
>=20
> +do_install_append() {
> +    # Remove empty /usr/*bin directory since the mount helper is installe=
d to /sbin
> +    rmdir ${D}${bindir} ${D}${sbindir}
> +}
>=20
> This actually kind of seems like the wrong thing to do, but it also
> looks like cifs-utils don't care what sbindir and bindir point at.
>=20
> If you're okay with this, I'll merge the modified patch I have in tree
> now, or you can send an updated patch, whichever you prefer.

Yes, thanks for fixing that!


>=20
> --=20
> -Joe MacDonald.
> :wq


