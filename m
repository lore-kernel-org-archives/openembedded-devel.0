Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heroor@gmail.com>) id 1QJjN5-00027F-1y
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 11:36:51 +0200
Received: by qyk27 with SMTP id 27so5703312qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2011 02:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=RA0ccaoXj36X42f+UjT6NGk0FIBhfSNWgdaclJwwbrg=;
	b=ow8wLgmv1sIpIjX7wk6k3Xn0vfUgYx9eJfesFSpuiTG2sUV6ySP+O68mS8Bix1Y+Ux
	pDzbUjEUnHWs4+efPwwkLb9NeuntW9AxtFV5G9ec8t2Jw92XoOOBH6boCT9P2PxH/uYu
	4JW8U6MhM4jUhlvLz5TyTogb0kCtsPGJ2wCjs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=R0eHgc2oi99oTd8gpYpfBaWKWjpJc7PIs2loBwNPDbGi9l2mGQQAGWXlw4/ZgjZxDR
	4qfYhUOZ9QyqDJwR5sNAyKwBUWOkzIQpIQucSQBEBs9WhZHaU20GBI2mx9NXQNQ1dqxB
	l3EQVM12vkZPa3w3ZQ8V/l0fx6wRriuPlJGJ8=
MIME-Version: 1.0
Received: by 10.229.117.95 with SMTP id p31mr5999043qcq.97.1305020044958; Tue,
	10 May 2011 02:34:04 -0700 (PDT)
Received: by 10.224.6.79 with HTTP; Tue, 10 May 2011 02:34:04 -0700 (PDT)
In-Reply-To: <20110508180923.GG26466@ibawizard.net>
References: <1304243449-12028-1-git-send-email-heroor@ti.com>
	<20110501173015.GI27708@ibawizard.net>
	<BANLkTimKHp5M5VvMR21+C_rSRBiu2M0BKQ@mail.gmail.com>
	<20110506090243.GE26466@ibawizard.net>
	<BANLkTikt+X9ocYn-0bsfwzbCcZDQFnm_ww@mail.gmail.com>
	<20110508180923.GG26466@ibawizard.net>
Date: Tue, 10 May 2011 15:04:04 +0530
Message-ID: <BANLkTikQ81NTULOMEu9k9+nvkpB4m3iSrw@mail.gmail.com>
From: Siddharth Heroor <heroor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/2] zeromq: Add zeromq socket library.
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
X-List-Received-Date: Tue, 10 May 2011 09:36:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, May 8, 2011 at 11:39 PM, Petr =C5=A0tetiar <ynezz@true.cz> wrote:
> Siddharth Heroor <heroor@gmail.com> [2011-05-06 15:39:23]:
>
>> Ok. I'll wait for your patch. I'm facing some issues with testing my pat=
ch
>> and so I'll withdraw it.
>
> It's in[1], please test it and give some feedback. I'm using it with
> lua-zeromq for some time already on arm9, so I would be suprised if there=
 are
> some issues. Thanks.
>
> 1. http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=3Db8e9009=
1aca8777092aa410fbfbb5c5d8cc7cbcb

I tried to build it and it fails. The error is as follows -

ERROR: Logfile of failure stored in:
/swcoe/sdk/sid/arago/build-oe/angstrom-setup-scripts/build/tmp-angstrom_201=
0_x/work/armv7a-angstrom-linux-gnueabi/zeromq-2.1.6-r0/temp/log.do_configur=
e.10701
Log data follows:
| + do_configure
| + ./autogen.sh
| autogen.sh: error: could not find libtool.  libtool is required to
run autogen.sh.
NOTE: package zeromq-2.1.6-r0: task do_configure: Failed

My build configuration is

Build Configuration:
BB_VERSION        =3D "1.12.0"
METADATA_BRANCH   =3D "master"
METADATA_REVISION =3D "980407c"
TARGET_ARCH       =3D "arm"
TARGET_OS         =3D "linux-gnueabi"
MACHINE           =3D "c6a816x-evm"
DISTRO            =3D "angstrom"
DISTRO_VERSION    =3D "v2011.05"
TARGET_FPU        =3D "hard"

By removing do_configure_prepend() from the recipe, I am able to build zero=
mq.
Why do we need to run autogen.sh to regenerate the configure script?
Won't the shipped configure work?

Also, shouldn't most the recipe be in an .inc file and the checksums
in a version.bb?
>
> -- ynezz
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
Sid


