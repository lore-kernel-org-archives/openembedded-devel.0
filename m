Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Ore9a-0003o8-IQ
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Sep 2010 23:50:51 +0200
Received: by iwn2 with SMTP id 2so1854991iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Sep 2010 14:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=0+b/w3BXz6HacZ54Ii60vWLdrnqkgyy8rt+MyAyBGRs=;
	b=Da9q3097JhmNb0zuy0igIzmv89p/mGj/p21v+KjJdyXw0B0HpGrd9ZdEFMToOi07gw
	rt2dhSvbTtjxuLb5q0adxnFTJyq0KnVsaf/nf3PMv5a5kl4X/YuHcLA9UIzTW6aWUi66
	Ha9Dl1Z/pCbd8E+W8Lbd6a80cMcKFbsbjTF2s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=wVZRQ+dVjUHDKk70FhOUaZ6a+qzRetvKOeavL0LKjLc74j7tsix271gGd83N39cJ/5
	vkZdnG9NZU2Q1KhaLEkCBZGC/tCJcoA5F1XIE1va0EOozgxXaSEK5lN6RrTPRFS/Z0Pi
	/4ippS+ryvxLnCA1UOcew6Cv/y2AnEV+8iAKY=
Received: by 10.231.11.3 with SMTP id r3mr1450795ibr.53.1283550599264; Fri, 03
	Sep 2010 14:49:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.207.8 with HTTP; Fri, 3 Sep 2010 14:49:39 -0700 (PDT)
In-Reply-To: <1283523286-30999-2-git-send-email-michael.lippautz@gmail.com>
References: <1283523286-30999-1-git-send-email-michael.lippautz@gmail.com>
	<1283523286-30999-2-git-send-email-michael.lippautz@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 3 Sep 2010 14:49:39 -0700
Message-ID: <AANLkTin9pQfGPRHfp5kro__vknb_Wn+Qb-Zh9Hfn-vSH@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/2] x-load/igep0020.conf: Unbreak x-load for igep0020 machine.
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
X-List-Received-Date: Fri, 03 Sep 2010 21:50:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 3, 2010 at 7:14 AM, Michael Lippautz
<michael.lippautz@gmail.com> wrote:
> * x-load is needed since e2b9225af36b2979b255634f79ceecea482601a7
>
> Signed-off-by: Michael Lippautz <michael.lippautz@gmail.com>

looks ok but why is it needed to remove ldflags

> ---
> =A0conf/machine/igep0020.conf =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 | =A0 =A02 ++
> =A0.../x-load-git/igep0020/remove-final-ldflags.patch | =A0 11 ++++++++++=
+
> =A0recipes/x-load/x-load_git.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | =A0 =A07 ++++++-
> =A03 files changed, 19 insertions(+), 1 deletions(-)
> =A0create mode 100644 recipes/x-load/x-load-git/igep0020/remove-final-ldf=
lags.patch
>
> diff --git a/conf/machine/igep0020.conf b/conf/machine/igep0020.conf
> index 55c1850..6295010 100644
> --- a/conf/machine/igep0020.conf
> +++ b/conf/machine/igep0020.conf
> @@ -21,6 +21,8 @@ KERNEL_IMAGETYPE =3D "uImage"
>
> =A0UBOOT_MACHINE =3D "omap3_igep0020b_config"
>
> +XLOAD_MACHINE =3D "igep0020-flash_config"
> +
> =A0IMAGE_FSTYPES +=3D "tar.bz2 ubi"
>
> =A0# Guesswork
> diff --git a/recipes/x-load/x-load-git/igep0020/remove-final-ldflags.patc=
h b/recipes/x-load/x-load-git/igep0020/remove-final-ldflags.patch
> new file mode 100644
> index 0000000..c5ac09b
> --- /dev/null
> +++ b/recipes/x-load/x-load-git/igep0020/remove-final-ldflags.patch
> @@ -0,0 +1,11 @@
> +--- a/Makefile 2010-09-03 09:59:12.000000000 +0200
> ++++ b/Makefile 2010-09-03 10:43:46.650000018 +0200
> +@@ -90,7 +90,7 @@
> +
> + x-load: =A0 =A0 =A0 $(OBJS) $(LIBS) $(LDSCRIPT)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 UNDEF_SYM=3D`$(OBJDUMP) -x $(LIBS) |sed =A0=
-n -e 's/.*\(__u_boot_cmd_.*\)/-u\1/p'|sort|uniq`;\
> +- =A0 =A0 =A0 =A0 =A0 =A0 =A0$(LD) $(LDFLAGS) $$UNDEF_SYM $(OBJS) \
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0$(LD) $$UNDEF_SYM $(OBJS) \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 --start-group $(LIBS) --end=
-group $(PLATFORM_LIBS) \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -Map x-load.map -o x-load
> +
> diff --git a/recipes/x-load/x-load_git.bb b/recipes/x-load/x-load_git.bb
> index cbcbf17..eb4a2de 100644
> --- a/recipes/x-load/x-load_git.bb
> +++ b/recipes/x-load/x-load_git.bb
> @@ -9,7 +9,7 @@ SRCREV_beagleboard =3D "1c9276af4d6a5b7014a7630a1abeddf3b=
3177563"
>
> =A0PV =3D "1.42+${PR}+gitr${SRCREV}"
> =A0PV_beagleboard =3D "1.44+${PR}+gitr${SRCREV}"
> -PR =3D"r15"
> +PR =3D"r16"
> =A0PE =3D "1"
>
> =A0SRC_URI =3D "git://gitorious.org/x-load-omap3/mainline.git;branch=3Dma=
ster;protocol=3Dgit"
> @@ -56,6 +56,11 @@ SRCREV_omapzoom36x =3D "251d92815500143aefdbe3b3558a0c=
e6daeaebdc"
> =A0SRC_URI[uboot.md5sum] =3D "e68b30714d22ce2f926d2dd19f94a2be"
> =A0SRC_URI[uboot.sha256sum] =3D "e7e5c87d939cc4c1f14d17ea0814b0bed97021c7=
afca3ef9053c896c2b5bdd6f"
>
> +SRC_URI_igep0020 =3D "git://git.igep.es/pub/scm/x-loader.git;protocol=3D=
git \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0file://remove-final-ldflags.patc=
h"
> +SRCREV_igep0020 =3D "213d95fcadc54424c796259928d7c15c5a2945a0"
> +PV_igep0020 =3D "1.43+${PR}+gitr${SRCREV}"
> +
> =A0S =3D "${WORKDIR}/git"
>
> =A0PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> --
> 1.7.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


