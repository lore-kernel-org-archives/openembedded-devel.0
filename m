Return-Path: <danismostlikely@gmail.com>
Received: from mail-qa0-f45.google.com (mail-qa0-f45.google.com
	[209.85.216.45])
	by mail.openembedded.org (Postfix) with ESMTP id 487CB72DE7
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Feb 2015 15:03:05 +0000 (UTC)
Received: by mail-qa0-f45.google.com with SMTP id n8so11171489qaq.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Feb 2015 07:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=EDHafPfPbspghxuDt21PtM6AzDrmjz+ffhczYnuZinA=;
	b=q++bDL2X6BuKLFMH0DdZTCCnLjfuCImbT+Jli+z+Ngm3jSD753rfp79gto8feG86wP
	A1A80nq8ZLVPdyGpYT4uCQCqqQsLNmHTPj9aBVptzQxxIRsSI5zVodhi8fdsZqygKOcH
	t5HRWEPqRdzkU6pagUk8BezhzWuXodmIQHmjTD4bnVY8rPoo6mIbvJpLWVmgqd2CMEVh
	1NkLGCd5REd5MyvktH0K4htJzAPSz9Ql+Tgg/lqX9wwueZ6fUeWSsqr/bZ9udrAbtp7Q
	HCFKuWLHtWgITXPOHZcENi+LbYqSsN6ZTCMm6YJ8CxbilW86wKVcJvQ8UjFsSg5vtItv
	wTFw==
MIME-Version: 1.0
X-Received: by 10.229.69.131 with SMTP id z3mr9125006qci.14.1423234987252;
	Fri, 06 Feb 2015 07:03:07 -0800 (PST)
Received: by 10.96.30.35 with HTTP; Fri, 6 Feb 2015 07:03:07 -0800 (PST)
In-Reply-To: <54D3B9FF.4030405@dominion.thruhere.net>
References: <mavrvk$83v$1@ger.gmane.org>
	<1423153742-11829-1-git-send-email-danismostlikely@gmail.com>
	<54D3B9FF.4030405@dominion.thruhere.net>
Date: Fri, 6 Feb 2015 09:03:07 -0600
Message-ID: <CACS+7ZTyBkSO73bX+1oFoDKYH0hZK+V5+wj_NLkme=DgGFj0DQ@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-initramfs][PATCH v2 5/5] dracut: recipe cleanup
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Feb 2015 15:03:06 -0000
Content-Type: text/plain; charset=UTF-8

On 5 February 2015 at 12:44, Koen Kooi <koen@dominion.thruhere.net> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Dan McGregor schreef op 05-02-15 om 17:29:
>> From: Dan McGregor <dan.mcgregor@usask.ca>
>>
>> Split out bash-completion data Update RDEPENDS: getopt is
>> util-linux-getopt now
>
> So the blanket 'util-linux' RDEPENDS can go away, right?

Yep. I just confirmed that it can. A new version of this is on its way.


>
>> Use distro_features_check to require systemd Recommend busybox
>>
>> Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca> ---
>> .../recipes-devtools/dracut/dracut_git.bb          | 25
>> ++++++++++++++++------ 1 file changed, 19 insertions(+), 6 deletions(-)
>>
>> diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
>> b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb index
>> ea55a4d..e425845 100644 ---
>> a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb +++
>> b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb @@ -13,8 +13,10 @@
>> SRC_URI = "git://git.kernel.org/pub/scm/boot/dracut/dracut.git"
>>
>> S = "${WORKDIR}/git"
>>
>> -do_configure() { -    ./configure --prefix=${prefix} \ +inherit
>> distro_features_check +REQUIRED_DISTRO_FEATURES = "systemd" +
>> +EXTRA_OECONF = "--prefix=${prefix} \ --libdir=${libdir} \
>> --datadir=${datadir} \ --sysconfdir=${sysconfdir} \ @@ -23,20 +25,31 @@
>> do_configure() { --bindir=${bindir} \ --includedir=${includedir} \
>> --localstatedir=${localstatedir} \ +
>> --systemdsystemunitdir=${systemd_unitdir}/system" + +do_configure() { +
>> ./configure ${EXTRA_OECONF} }
>>
>> do_install() { oe_runmake install DESTDIR=${D} }
>>
>> -FILES_${PN} += "${datadir}/bash-completion \ -
>> ${libdir}/kernel \ +PACKAGES =+ "${PN}-bash-completion" +
>> +FILES_${PN}-bash-completion = "${datadir}/bash-completion" +
>> +FILES_${PN} += " ${libdir}/kernel \ +                ${systemd_unitdir}
>> \ " +CONFFILES_${PN} += "${sysconfdir}/dracut.conf" + +RDEPENDS_${PN} =
>> "systemd findutils cpio util-linux-blkid util-linux-getopt util-linux
>> bash ldd" +RDEPENDS_${PN}-bash-completion = "bash-completion"
>>
>> -# 'getopt' is in the util-linux main package -RDEPENDS_${PN} = "systemd
>> findutils cpio util-linux-blkid util-linux bash ldd" # This could be
>> optimized a bit, but let's avoid non-booting systems :) RRECOMMENDS_${PN}
>> = " \ kernel-modules \ +                     busybox \ coreutils \ "
>>
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>
> iD8DBQFU07n/MkyGM64RGpERAuZ6AKCK1aT62H7XvOeZU2+9RCZnMeMSqACfc/Ej
> 8ubI00/FGsDFssxdkXURRY0=
> =SpL4
> -----END PGP SIGNATURE-----
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

