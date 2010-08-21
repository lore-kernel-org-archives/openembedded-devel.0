Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OmtTd-0007jf-DI
	for openembedded-devel@lists.openembedded.org;
	Sat, 21 Aug 2010 21:11:38 +0200
Received: by iwn2 with SMTP id 2so1581416iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Aug 2010 12:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=SI3g3mzfrAD9y0zuMoKA3y1RSimdWAKTpi8MSduvpn8=;
	b=Aftt1jeElOCgDjlMnXXWdwVxXjL0lqBqIBLA0/tfxwGGMAMj7YbE4Y1zr+CdOy5t5y
	abFXE2yU0NiLUoIOiCXEz/odcKegpO24XVyMcFk0NgiTE032jUmqT56uiU86cTMkadao
	J+mqqy08SwN1JcaaCWBqtM2Yn/S0WyKP/rcpY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=a6H5yren+BjVbK99a1FSSUgP4uV9UKn8WetskLiVyd6oqqqWeiorqjApdnDSsmnBGO
	zlVFcyMq3ORWUQxVWYkCkfdMSTEIF0X+XbPTDBYXgzo76ARo4WkScONnusJwk++mPkbR
	HPtKeqVNPh4vVd7lI/ItZ6Mhl0sRbZxemcKKs=
Received: by 10.231.157.205 with SMTP id c13mr3747355ibx.71.1282417876228;
	Sat, 21 Aug 2010 12:11:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.200.199 with HTTP; Sat, 21 Aug 2010 12:10:56 -0700 (PDT)
In-Reply-To: <AANLkTikdUOFo__6H_+MMqL8Crx-cyavdkeBNUq5F5ZkM@mail.gmail.com>
References: <20100809143611.GA4396@jama>
	<AANLkTikdUOFo__6H_+MMqL8Crx-cyavdkeBNUq5F5ZkM@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 21 Aug 2010 12:10:56 -0700
Message-ID: <AANLkTi=6piC-k5tJHc-q2-p-NUe_rPtGUKU7Ti3-rCPs@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: PACKAGE_ARCH_pn-${PN} should work?
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
X-List-Received-Date: Sat, 21 Aug 2010 19:11:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 9, 2010 at 11:51 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Mon, Aug 9, 2010 at 7:36 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
>> or did it worked before?
>>
>> Today I noticed it keeps PACKAGE_ARCH =3D "all" in task-x11-server
>> http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=3Dbf3cf7b95=
cb10c830c39ca4bfec4e7fcc19dad83
>>
>> It's used in few more places (mostly OM/SHR which can be my fault from m=
erging shr/import):
>>
>> conf/distro/openmoko.conf:PACKAGE_ARCH_pn-usb-gadget-mode_om-gta01 =3D "=
armv4t"
>> conf/distro/openmoko.conf:PACKAGE_ARCH_pn-usb-gadget-mode_om-gta02 =3D "=
armv4t"
>> conf/distro/openmoko.conf:PACKAGE_ARCH_pn-keymaps_om-gta01 =3D "armv4t"
>> conf/distro/openmoko.conf:PACKAGE_ARCH_pn-keymaps_om-gta02 =3D "armv4t"
>> conf/distro/openmoko.conf:PACKAGE_ARCH_pn-neod_om-gta01 =3D "armv4t"
>> conf/distro/openmoko.conf:PACKAGE_ARCH_pn-neod_om-gta02 =3D "armv4t"
>> conf/distro/shr.conf:PACKAGE_ARCH_pn-usb-gadget-mode_om-gta01 =3D "armv4=
t"
>> conf/distro/shr.conf:PACKAGE_ARCH_pn-usb-gadget-mode_om-gta02 =3D "armv4=
t"
>> conf/distro/shr.conf:PACKAGE_ARCH_pn-keymaps_om-gta01 =3D "armv4t"
>> conf/distro/shr.conf:PACKAGE_ARCH_pn-keymaps_om-gta02 =3D "armv4t"
>> conf/distro/shr.conf:PACKAGE_ARCH_pn-neod_om-gta01 =3D "armv4t"
>> conf/distro/shr.conf:PACKAGE_ARCH_pn-neod_om-gta02 =3D "armv4t"
>> recipes/fbreader/fbreader_0.8.2a.bb:PACKAGE_ARCH_pn-${PN} =3D "${MACHINE=
_ARCH}"
>> recipes/freesmartphone/frameworkd_git.bb:PACKAGE_ARCH_pn-${PN}-config =
=3D "${MACHINE_ARCH}"
>> recipes/miniinit/miniinit.bb:PACKAGE_ARCH_pn-${PN} =3D "${MACHINE_ARCH}"
>> recipes/mipl-mipv6/mipv6_1.1-v2.4.26.bb:PACKAGE_ARCH_pn-${PN} =3D "${MAC=
HINE_ARCH}"
>> recipes/mipl-mipv6/mipv6_2.0.2.bb:PACKAGE_ARCH_pn-${PN} =3D "${MACHINE_A=
RCH}"
>> recipes/obsolete/shr/alsa-scenarii-shr_git.bb:PACKAGE_ARCH_pn-${PN} =3D =
"${MACHINE_ARCH}"
>> recipes/openmoko2/openmoko-alsa-scenarios_svn.bb:PACKAGE_ARCH_pn-${PN} =
=3D "${MACHINE_ARCH}"
>> recipes/shadow/shadow.inc:PACKAGE_ARCH_pn-${PN} =3D "${MACHINE_ARCH}"
>> recipes/shr/frameworkd-config-shr_git.bb:PACKAGE_ARCH_pn-${PN} =3D "${MA=
CHINE_ARCH}"
>> recipes/sysvinit/sysvinit_2.86.bb:PACKAGE_ARCH_pn-${PN}-inittab =3D "${M=
ACHINE_ARCH}"
>> recipes/usb-gadget-mode/usb-gadget-mode.bb:PACKAGE_ARCH_pn-${PN} =3D "${=
MACHINE_ARCH}"
>>
>> Regards,
>>
>
> this is from my commit
>
> commit 4e9905b2be6438156dc8ad88839de04e91c922ec
> Author: Khem Raj <raj.khem@gmail.com>
> Date: =A0 Mon Jul 26 15:09:10 2010 -0700
>
> =A0 =A0recipes: Replace ${PN} override with pn-${PN} for PACKAGE_ARCH
>
> =A0 =A0* Needed to get CURRENT_TARGET_SYS to evaluate correctly in bitbak=
e.conf
>
> =A0 =A0Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
>
>
> hmm it worked well and the problem was other way around what
> you are seeing but now I dont remember which package it was.
> but if I check with the recipe you mentioned then I see
> that override did not work.
> We can revert it if needed but I would like to understand
> why pn-${PN} did not work

It works in few case where PN is only candidate to be overridden
but not when something like ${PN}-foo is needed so it works in some
cases but not in all. I have therefore reverted it.

Thanks for reporting.

>> --
>> Martin 'JaMa' Jansa =A0 =A0 jabber: Martin.Jansa@gmail.com
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>


