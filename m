Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id 016EF7896B
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Jul 2018 16:43:10 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id h22-v6so9505202vke.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Jul 2018 09:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=TeWWVUsT65mB2zl9LQz7m3eR+bALUNekJ+rbuViTNxo=;
	b=klkaMGQeyQg+bN6ofywpIuTMowOiwV7SFGxJslFtg2bstZBQe/p0jHDy02RnVq4j+W
	12bI5oPmXv8B64md4xtcGGhWrJ9yCPGv5Qnw+r2sUIVGPBpJAVrwrSCnoVh5eP2iundj
	UiNmEGn9VeH24U8cai2vQab3Q4Xa2JWHfHMaVUhoDWmr+Ua9ZG2cYHc9yjJxtePRBMDh
	jIHeCKqEdMqlEE1YYgmQ2tg9RMm8tXxasERzR0GD2I7zDadcqa/N/JwYvyQpHWJY7szI
	GX3Xled2kiF2gaytxhT6belX6V4qzlSTZKqOtpk5XPQUCSWyJrguVL2opyRVZEe/yxrA
	gm3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=TeWWVUsT65mB2zl9LQz7m3eR+bALUNekJ+rbuViTNxo=;
	b=qhx0tcZpijQRfaIeugSE+YeB1CUaCBCdF4GRUdjevOLYDTpT4ieB8G95kKEdEOiwUZ
	33uCtXRski4z9fPmX9V+C5ypgaFhINYBVI86FnooVZ7kNcuhiVzCJzk4UZnE7FMK/EU4
	q4i5wmpUDitNk/Z+t/zm4crdY7lRTVZTS6TyQp3xBM2HSb1BO5GSaoTCfFgQPXmCuoMY
	RwlwBnRqRmc7BoE/h2SvZcZJRXHlcELjm3Cpar3RP/bTLBJnLzRNC9/e3QD83MCZFy71
	utNV7T4BsWkZpJDp6E1f9MxztHXeJ2j48DRnAwReeFjKh9ct1/x9ROUdYjAbTA2CCHAQ
	V0WA==
X-Gm-Message-State: APt69E0TS6svhe4t2jcnqNyg41TGEBBHW1tvBci1JdLoUl8yMDUVDXsp
	husngWn9zHKb2n2teWimRWRBoPud4qJ0Eo3FfO0=
X-Google-Smtp-Source: AAOMgpfcg5b78RUpegEdtIceqa1LwRNqRSLBlmXIbUl+Vz+B+1zBZ6iZ9eaFFv/iPPAg+oX3R38HfflIBrvf9zyFZN4=
X-Received: by 2002:a1f:e605:: with SMTP id d5-v6mr5816286vkh.4.1530549791379; 
	Mon, 02 Jul 2018 09:43:11 -0700 (PDT)
MIME-Version: 1.0
References: <1530498665-132100-1-git-send-email-changqing.li@windriver.com>
	<CAMKF1spEavbzFD9JN8UDERdcawBZfjC_MkAwbc_j8d-r=nSCcQ@mail.gmail.com>
	<53d5e3d6-aaa1-c5ed-d344-de4b908c39c7@windriver.com>
In-Reply-To: <53d5e3d6-aaa1-c5ed-d344-de4b908c39c7@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 2 Jul 2018 09:42:45 -0700
Message-ID: <CAMKF1sriX8Ly_RxRX9ROtvj=Rry532zycatu9ZuobZHyU7eFKw@mail.gmail.com>
To: changqing.li@windriver.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-oe] crash: fix do_compile relocation error
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
X-List-Received-Date: Mon, 02 Jul 2018 16:43:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 2, 2018 at 12:08 AM Changqing Li <changqing.li@windriver.com> w=
rote:
>
> On 07/02/2018 02:09 PM, Khem Raj wrote:
> > On Sun, Jul 1, 2018 at 7:31 PM Changqing Li <changqing.li@windriver.com=
> wrote:
> >> error info:
> >>
> >> id: relocation error: /lib/x86_64-linux-gnu/libnss_nis.so.2:
> >> symbol _nsl_default_nss version GLIBC_PRIVATE not defined in
> >> file libnsl.so.1 with link time reference
> >>
> >> Recent glibc change removed libnss-nis module from glibc and
> >> a new recipe libnss-nis.bb was added. After this change,
> >> we need to include native libnss_nis in crash. otherwise,
> >> with "nis" in /etc/nssswitch.conf, we will met above error=EF=BC=8E
> >>
> >> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> >> ---
> >>   meta-oe/recipes-kernel/crash/crash_7.2.0.bb | 1 +
> >>   1 file changed, 1 insertion(+)
> >>
> >> diff --git a/meta-oe/recipes-kernel/crash/crash_7.2.0.bb b/meta-oe/rec=
ipes-kernel/crash/crash_7.2.0.bb
> >> index 440a69d..09fe50d 100644
> >> --- a/meta-oe/recipes-kernel/crash/crash_7.2.0.bb
> >> +++ b/meta-oe/recipes-kernel/crash/crash_7.2.0.bb
> >> @@ -11,6 +11,7 @@ LICENSE =3D "GPLv3"
> >>   LIC_FILES_CHKSUM =3D "file://COPYING3;md5=3Dd32239bcb673463ab874e80d=
47fae504"
> >>
> >>   DEPENDS =3D "zlib readline coreutils-native"
> >> +DEPENDS_append_libc-glibc =3D " libnss-nis-native"
> > A native dependency which is specific to a target libc seems not
> > right. It should depend on
> > build host libc which in this case is always glibc so please drop the o=
verride.
>
> Hi,  according  to below content of recipe libnss-nis,  only for glibc,
> we will DEPNDS
> libnss-nis-native, so I add this override.
>
> # We will skip parsing this packagegeoup for non-glibc systems
> #
> python __anonymous () {
>      if d.getVar('TCLIBC') !=3D "glibc":
>          raise bb.parse.SkipRecipe("incompatible with %s C library" %
>                                     d.getVar('TCLIBC'))

may be this can be made to exclude non target recipes.

