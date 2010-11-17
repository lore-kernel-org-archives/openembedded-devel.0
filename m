Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PInKt-0002IN-An
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Nov 2010 20:06:29 +0100
Received: by gxk2 with SMTP id 2so1389244gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Nov 2010 11:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=gPmSedicxpJijdEoPdMcLsf+DhkleyVpRhQXBQtTwvE=;
	b=BBuP77AF2eh5nK0Tosai1/T2On6P05Y6XGBHjIIvWKwDL9RDKB2jFrAnAhllo0wZcq
	NPZNLlkXbsMd5Lh/+BpXbDbBzAPP+H0iVf2hBslQ9H/iLIWEuDuu+NgARg8MQbX7yIt/
	zvt/0uaW9YC48i1bvhLc1hAvFPFwn84xGpwQo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=IlU1h+JNHsBnP29/nlmjnhY6NfCdp6zSdk4F63zUAwphYQleXgKN00qcKNWTlHR4rp
	JdfrE/vLcAzxSXoMwReyXbtUBJ0NHjjfHaqmsk8PP1p0n9YunIHzI0I57cageTfC8w6K
	5EHKgmzW38znA+47aaeXl9RKSspo8zTdK9N7s=
Received: by 10.91.121.3 with SMTP id y3mr5883643agm.156.1290020719526; Wed,
	17 Nov 2010 11:05:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Wed, 17 Nov 2010 11:04:59 -0800 (PST)
In-Reply-To: <1290003334-11092-1-git-send-email-tom_rini@mentor.com>
References: <1290003334-11092-1-git-send-email-tom_rini@mentor.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 17 Nov 2010 11:04:59 -0800
Message-ID: <AANLkTik3oBWhZvdYcEQdcgsar-7pyAk4J3G2ffyHMTFV@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] sane-toolchain-*glibc.inc: Use -O2 on PowerPC
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
X-List-Received-Date: Wed, 17 Nov 2010 19:06:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 17, 2010 at 6:15 AM, Tom Rini <tom_rini@mentor.com> wrote:
> In FULL_OPTIMIZATION use -O2 on powerpc due to some problems
> with libgcc.a and -Os when using gcc 4.5.x.
>
> Signed-off-by: Tom Rini <tom_rini@mentor.com>


patch is ok. In comment you should also mention gcc 4.4 which has the
same problem.

> ---
> =C2=A0conf/distro/include/sane-toolchain-eglibc.inc | =C2=A0 =C2=A03 +++
> =C2=A0conf/distro/include/sane-toolchain-glibc.inc =C2=A0| =C2=A0 =C2=A03=
 +++
> =C2=A02 files changed, 6 insertions(+), 0 deletions(-)
>
> diff --git a/conf/distro/include/sane-toolchain-eglibc.inc b/conf/distro/=
include/sane-toolchain-eglibc.inc
> index c077ed1..77f2e3b 100644
> --- a/conf/distro/include/sane-toolchain-eglibc.inc
> +++ b/conf/distro/include/sane-toolchain-eglibc.inc
> @@ -9,6 +9,9 @@ FULL_OPTIMIZATION_pn-eglibc_arm =3D "-fexpensive-optimiza=
tions -fomit-frame-pointe
> =C2=A0FULL_OPTIMIZATION_pn-perl =3D "-fexpensive-optimizations -fomit-fra=
me-pointer -frename-registers -O1"
> =C2=A0FULL_OPTIMIZATION_sparc =3D "-fexpensive-optimizations -fomit-frame=
-pointer -frename-registers -O2"
>
> +# gcc 4.5 has a problem with 'leakage' into libgcc.a with -Os
> +FULL_OPTIMIZATION_powerpc =3D "-fexpensive-optimizations -fomit-frame-po=
inter -frename-registers -O2"
> +
> =C2=A0# JaMa: I promise to report bug upstream, but as it can take a whil=
e to fix it, I'll switch to -O2 here
> =C2=A0# Tested with gcc-4.4.2 and gcc-4.4.3 on armv4t and armv5te and it =
fails with -Os, with gcc-4.3.3 it works OK with -Os
> =C2=A0# Here is testcase, but you have to rebuild whole libqtxml to test =
it
> diff --git a/conf/distro/include/sane-toolchain-glibc.inc b/conf/distro/i=
nclude/sane-toolchain-glibc.inc
> index e806de6..5802ef1 100644
> --- a/conf/distro/include/sane-toolchain-glibc.inc
> +++ b/conf/distro/include/sane-toolchain-glibc.inc
> @@ -13,6 +13,9 @@ FULL_OPTIMIZATION_pn-perl =3D "-fexpensive-optimization=
s -fomit-frame-pointer -fre
> =C2=A0FULL_OPTIMIZATION_pn-glibc =3D "-fexpensive-optimizations -fomit-fr=
ame-pointer -O2"
> =C2=A0FULL_OPTIMIZATION_sparc =3D "-fexpensive-optimizations -fomit-frame=
-pointer -frename-registers -O2"
>
> +# gcc 4.5 has a problem with 'leakage' into libgcc.a with -Os
> +FULL_OPTIMIZATION_powerpc =3D "-fexpensive-optimizations -fomit-frame-po=
inter -frename-registers -O2"
> +
> =C2=A0BUILD_OPTIMIZATION_pn-perl =3D "-O1"
> =C2=A0BUILD_OPTIMIZATION_pn-glibc =3D "-O2"
> =C2=A0BUILD_OPTIMIZATION_sparc =3D "-O2"
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


