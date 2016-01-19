Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 919676E6B1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jan 2016 21:02:40 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id cy9so457528093pac.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jan 2016 13:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=NB25sNszo+kvnM3OaT99X6WH5EpoYEHbagzBrvUvhbc=;
	b=VOy1XM9J3SIzepn73s/uTOlbQ4F2sSKFMb7RKLycC81fSHD9ZPa3+GUFHZzyEXJVUZ
	7TvgCm3VH7PGSYeOEf8T02Z4yoH+0NpkD6Jk92uTdpMIJvJYinXogqWVth89yrjpennb
	A43HQAyOrJS4sRjpJ+1ORJzAwsLk5zmxD/O3+5z0fjdYvmqkJMX8/eisisFRfG9Hih6/
	69cCi25ufs+pvFolFEEYNR6/HZFFXvwn6t4Uz4DggJoQsh5GgfskBOxcw8/NlQGphNyo
	cw9BNRgkPa2EeZdfmIQz+rabLZdjOodh4OdX74/Fk1EQhH7c5/Ad15/O4LfDitPiKfcZ
	Y4yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:message-id:references:to;
	bh=NB25sNszo+kvnM3OaT99X6WH5EpoYEHbagzBrvUvhbc=;
	b=huweWSFqnWVtmXVRzuSnZPQqgKUNxRGG/FW5Hcx1/kYRr37p6xP/KVhnaRMOXoZWUa
	c8NkTJ+siRXgbDVoxdB7jcpl33ojExEFWs0KTvkmQ48/+n51ghcOpheEg82bQZUWYyPQ
	ZbVJ+uuHyyuNDJU6Wgg/jDmH+op+puiHIz0DFdPBBUsaqdUCC27a/5kQJCKJWanYSlpb
	FejaRytIKg0XRWHKqM5nivhYNJW4NwcpXIUaoDYuklfQjRNnQBUy83HdsV790l25KDpN
	ts0ggMtiuxhdJ0WXRQXW3kzTT6tBhOQxBzrDDyraxe2eQGP7JMA8+0hNRKjXkYH6920B
	o15w==
X-Gm-Message-State: ALoCoQnpk97MIPUgUV6KXgKlg6Uh1ykxf8d6ZyKih3E/FDHJQ80bQlZ5dIkfrd7icOS1uepkvxlya41adMrd6312Uer1Z9DQng==
X-Received: by 10.66.100.228 with SMTP id fb4mr46761258pab.84.1453237361599;
	Tue, 19 Jan 2016 13:02:41 -0800 (PST)
Received: from [192.168.0.4] (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	a62sm34612685pfj.40.2016.01.19.13.02.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 19 Jan 2016 13:02:40 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CADySD0EPvpk+zwvn0PKFChZPBev6xz-XOgbPx8W7mgNkwzsDxQ@mail.gmail.com>
Date: Tue, 19 Jan 2016 13:02:39 -0800
Message-Id: <19952B04-FAF4-41D2-A38E-878C1F40A746@gmail.com>
References: <CADySD0EvwTFr-0hGLTJDGTVLyhEtju3Rgxj85R8Tv=etXnRPuw@mail.gmail.com>
	<CADySD0EPvpk+zwvn0PKFChZPBev6xz-XOgbPx8W7mgNkwzsDxQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3112)
Subject: Re: meta-toolchain-qt5 error on fido branch
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Jan 2016 21:02:43 -0000
X-Groupsio-MsgNum: 59601
Content-Type: multipart/signed;
	boundary="Apple-Mail=_B9A7A491-6686-4C30-BE09-97980B693DFA";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_B9A7A491-6686-4C30-BE09-97980B693DFA
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jan 19, 2016, at 12:48 PM, Ankur Tyagi <ankur.tyagi85@gmail.com> =
wrote:
>=20
> Looks like the problem is because of partial inclusion of following =
patch:
>=20
> http://patchwork.openembedded.org/patch/91807/
>=20
> libgcov-dev has been removed from libgcc packages but
> packagegroup-core-standalone-sdk-target still adds libgcov-dev to =
target
>=20
> Requesting to remove libgov-dev from
> packagegroup-core-standalone-sdk-target as suggested in the above =
patch to
> fix toolchain build error.

For tracking purposes you should file bug at yoctoproject bugzilla if =
you are not going to send patches
to fix them.

>=20
> thanks
>=20
>=20
> On Tue, Jan 19, 2016 at 1:57 PM, Ankur Tyagi <ankur.tyagi85@gmail.com>
> wrote:
>=20
>> Hi,
>>=20
>> While building qt5 toolchain, I am getting this error :
>>=20
>> Collected errors:
>> * satisfy_dependencies_for: Cannot satisfy the following dependencies =
for
>> packagegroup-core-standalone-sdk-target:
>> *     libgcov-dev *
>> * opkg_install_cmd: Cannot install package
>> packagegroup-core-standalone-sdk-target.
>>=20
>> ERROR: Function failed: do_populate_sdk
>> ERROR: Logfile of failure stored in: /home/nws/yocto-fido-dev/oe-
>> =
layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa8hf-vfp-n=
eon-linux-gnueabi/meta-toolchain-qt5/1.0-r0/temp/log.do_populate_sdk.65427=

>> ERROR: Task 8
>> =
(/home/nws/yocto-fido-dev/oe-layersetup/sources/meta-qt5/recipes-qt/meta/
>> meta-toolchain-qt5.bb, do_populate_sdk) failed with exit code '1'
>>=20
>> Complete log @ http://pastebin.com/CNuJk2i2
>>=20
>> I have tried removing previous build tmp/work but still get this =
error on
>> fresh builds.
>>=20
>> thanks
>>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_B9A7A491-6686-4C30-BE09-97980B693DFA
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaepHAACgkQuwUzVZGdMxTvgQCfcVNWkbzX66ValpIJNq3y+ACT
GygAnjkFGd18XT5pXQ+ZNi8cGz+owuq/
=PBxn
-----END PGP SIGNATURE-----

--Apple-Mail=_B9A7A491-6686-4C30-BE09-97980B693DFA--
