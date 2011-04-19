Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <michael.lippautz@gmail.com>) id 1QCANv-0003yk-Pu
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Apr 2011 14:50:27 +0200
Received: by qyk35 with SMTP id 35so1833171qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Apr 2011 05:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=rZXC+860CCOvUYOpEU6LDiRum3vIvw4OvgdneIIyqZw=;
	b=qwavQIox9lDIuAMu3VIMaNywzCTg3hOdhTXjkq9xH4GSSVdbOzrGVgf8RpyhRUSffy
	TQTMqk6rz2t20wngJozq1FO+CYAwPWl4T33rkY40m8qncFgM2WXNh12UtKMJr5WpIRaf
	sqc0Qkq9OqG4o5iZWCTNAbRL4l59+KdaS8xcY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=TN1sC08hVGoQYzgy7C6jqeXxb3LGsz4641m3PqLOSIORfDnztuB2l4LqVHSfG64TFd
	/KACovSv/7V9VlP5mBo6CxLvkESjEMrZpV4hG9JIxLi2JkXgFEq+Pm9TWn9WrvEZcrxV
	xsCAa0StoZL085SF6NKYLi8EzqXp1cr8GXINI=
Received: by 10.229.27.65 with SMTP id h1mr4214425qcc.216.1303217285062; Tue,
	19 Apr 2011 05:48:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.46.10 with HTTP; Tue, 19 Apr 2011 05:47:44 -0700 (PDT)
In-Reply-To: <iojvfl$aue$1@dough.gmane.org>
References: <1303213631-7082-1-git-send-email-michael.lippautz@gmail.com>
	<iojvfl$aue$1@dough.gmane.org>
From: Michael Lippautz <michael.lippautz@gmail.com>
Date: Tue, 19 Apr 2011 14:47:44 +0200
Message-ID: <BANLkTindS0_R+7PrTWPizgT+hAm0yvEe4g@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe] fakeroot: Add LIC_FILES_CHKSUM
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
X-List-Received-Date: Tue, 19 Apr 2011 12:50:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/4/19 Koen Kooi <koen@dominion.thruhere.net>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 19-04-11 13:47, Michael Lippautz wrote:
>> Signed-off-by: Michael Lippautz <michael.lippautz@gmail.com>
>> ---
>> =A0meta-oe/recipes-core/fakeroot/fakeroot_1.12.4.bb | =A0 =A01 +
>
> Thank you for your patch, but I'm not sure if it should go in or not. In
> oe-core we switched to pseudo-native as fakeroot-native replacement, so
> the fakeroot recipe seems redundant.
> Does anyone have a need for fakeroot(-native) or can it get deleted?
>
> Michaels immediate need for fakeroot-native was addressed with
> http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-texasinstrumen=
ts/commit/

Since I could build the omap-psp kernel with the new fix, I have no
need for it anymore. It looks like not that much ppl are actually
using the bsp layer, or otherwise this should have come up earlier ;)

meta-oe seems to be free of DEPENDS on fakeroot, however

 openembedded-core/meta $ grep -r "DEPENDS" * | grep "fakeroot"
    classes/populate_sdk.bbclass:DEPENDS =3D "virtual/fakeroot-native sed-n=
ative"
    recipes-connectivity/portmap/portmap.inc:DEPENDS =3D "virtual/fakeroot-=
native"
    recipes-core/meta/external-python-tarball.bb:DEPENDS =3D
"opkg-native opkg-utils-native virtual/fakeroot-native sed-native"

-Michael

> regards,
>
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFNrYE1MkyGM64RGpERAuwVAJ0daBSvkRTQT+KIzy6pWjwl6xsVKQCfUMTR
> FM+Ueun/df2VrXD7pM0Ff2s=3D
> =3DBRdx
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


