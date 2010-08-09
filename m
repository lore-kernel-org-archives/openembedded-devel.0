Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OiXSS-0001LT-LN
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Aug 2010 20:52:33 +0200
Received: by bwz8 with SMTP id 8so1473694bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Aug 2010 11:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=Y8CKcR8D8+EhwWrIebqIk/FXvcQXR61bn1M7lz9RNeQ=;
	b=FqCBgL+cSpJvzboHo9CHcLD4H35q8nqHNAChgIbZS+XBc8fEtBXP9Dnfcc8SVegjLQ
	9nRV+IjCO3yyu3LFCj5zp8sO3imXZmghZxHUdMyD/SLrVKBFc/gXzjOiN70G3BIkyPjW
	bpI81cN9RB7ZTPM7rhP1KTRHrXR19k3E4yy8Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=kBe8Kn4h7JzXniuT05u9sAXTOOFaGSuMudDUGKOPeQzyn06Kii9Pq3IdQOetAyJgzS
	louxj0f4YaOecHs99m3wq2MLtyu5/8f5tr7/9o5K7Ng9Wvb2n4s/EsbJQKRhdd7JCcLw
	K8qBdUMNuPVVZNUQl6Rr9f7PMKtONZbV34eQA=
Received: by 10.204.73.130 with SMTP id q2mr3336630bkj.137.1281379934877; Mon, 
	09 Aug 2010 11:52:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.204.71.8 with HTTP; Mon, 9 Aug 2010 11:51:53 -0700 (PDT)
In-Reply-To: <20100809143611.GA4396@jama>
References: <20100809143611.GA4396@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 9 Aug 2010 11:51:53 -0700
Message-ID: <AANLkTikdUOFo__6H_+MMqL8Crx-cyavdkeBNUq5F5ZkM@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
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
X-List-Received-Date: Mon, 09 Aug 2010 18:52:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 9, 2010 at 7:36 AM, Martin Jansa <martin.jansa@gmail.com> wrote=
:
> or did it worked before?
>
> Today I noticed it keeps PACKAGE_ARCH =3D "all" in task-x11-server
> http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=3Dbf3cf7b95c=
b10c830c39ca4bfec4e7fcc19dad83
>
> It's used in few more places (mostly OM/SHR which can be my fault from me=
rging shr/import):
>
> conf/distro/openmoko.conf:PACKAGE_ARCH_pn-usb-gadget-mode_om-gta01 =3D "a=
rmv4t"
> conf/distro/openmoko.conf:PACKAGE_ARCH_pn-usb-gadget-mode_om-gta02 =3D "a=
rmv4t"
> conf/distro/openmoko.conf:PACKAGE_ARCH_pn-keymaps_om-gta01 =3D "armv4t"
> conf/distro/openmoko.conf:PACKAGE_ARCH_pn-keymaps_om-gta02 =3D "armv4t"
> conf/distro/openmoko.conf:PACKAGE_ARCH_pn-neod_om-gta01 =3D "armv4t"
> conf/distro/openmoko.conf:PACKAGE_ARCH_pn-neod_om-gta02 =3D "armv4t"
> conf/distro/shr.conf:PACKAGE_ARCH_pn-usb-gadget-mode_om-gta01 =3D "armv4t=
"
> conf/distro/shr.conf:PACKAGE_ARCH_pn-usb-gadget-mode_om-gta02 =3D "armv4t=
"
> conf/distro/shr.conf:PACKAGE_ARCH_pn-keymaps_om-gta01 =3D "armv4t"
> conf/distro/shr.conf:PACKAGE_ARCH_pn-keymaps_om-gta02 =3D "armv4t"
> conf/distro/shr.conf:PACKAGE_ARCH_pn-neod_om-gta01 =3D "armv4t"
> conf/distro/shr.conf:PACKAGE_ARCH_pn-neod_om-gta02 =3D "armv4t"
> recipes/fbreader/fbreader_0.8.2a.bb:PACKAGE_ARCH_pn-${PN} =3D "${MACHINE_=
ARCH}"
> recipes/freesmartphone/frameworkd_git.bb:PACKAGE_ARCH_pn-${PN}-config =3D=
 "${MACHINE_ARCH}"
> recipes/miniinit/miniinit.bb:PACKAGE_ARCH_pn-${PN} =3D "${MACHINE_ARCH}"
> recipes/mipl-mipv6/mipv6_1.1-v2.4.26.bb:PACKAGE_ARCH_pn-${PN} =3D "${MACH=
INE_ARCH}"
> recipes/mipl-mipv6/mipv6_2.0.2.bb:PACKAGE_ARCH_pn-${PN} =3D "${MACHINE_AR=
CH}"
> recipes/obsolete/shr/alsa-scenarii-shr_git.bb:PACKAGE_ARCH_pn-${PN} =3D "=
${MACHINE_ARCH}"
> recipes/openmoko2/openmoko-alsa-scenarios_svn.bb:PACKAGE_ARCH_pn-${PN} =
=3D "${MACHINE_ARCH}"
> recipes/shadow/shadow.inc:PACKAGE_ARCH_pn-${PN} =3D "${MACHINE_ARCH}"
> recipes/shr/frameworkd-config-shr_git.bb:PACKAGE_ARCH_pn-${PN} =3D "${MAC=
HINE_ARCH}"
> recipes/sysvinit/sysvinit_2.86.bb:PACKAGE_ARCH_pn-${PN}-inittab =3D "${MA=
CHINE_ARCH}"
> recipes/usb-gadget-mode/usb-gadget-mode.bb:PACKAGE_ARCH_pn-${PN} =3D "${M=
ACHINE_ARCH}"
>
> Regards,
>

this is from my commit

commit 4e9905b2be6438156dc8ad88839de04e91c922ec
Author: Khem Raj <raj.khem@gmail.com>
Date:   Mon Jul 26 15:09:10 2010 -0700

    recipes: Replace ${PN} override with pn-${PN} for PACKAGE_ARCH

    * Needed to get CURRENT_TARGET_SYS to evaluate correctly in bitbake.con=
f

    Signed-off-by: Khem Raj <raj.khem@gmail.com>



hmm it worked well and the problem was other way around what
you are seeing but now I dont remember which package it was.
but if I check with the recipe you mentioned then I see
that override did not work.
We can revert it if needed but I would like to understand
why pn-${PN} did not work
> --
> Martin 'JaMa' Jansa =A0 =A0 jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


