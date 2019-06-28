Return-Path: <robert.joslyn@redrectangle.org>
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
	by mail.openembedded.org (Postfix) with ESMTP id 574C67E71D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jun 2019 03:51:03 +0000 (UTC)
Received: from xps13.localdomain (50-37-95-192.mscw.id.frontiernet.net
	[50.37.95.192])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id 5629C200005;
	Fri, 28 Jun 2019 03:50:59 +0000 (UTC)
Message-ID: <d8448c1b0b28e1a502bbd1c8a6cae3f8690d54e9.camel@redrectangle.org>
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, akuster808
	<akuster808@gmail.com>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 27 Jun 2019 20:50:53 -0700
In-Reply-To: <e09a230789494c4087469516707a2016@xbox06.axis.com>
References: <20190602231221.24148-1-robert.joslyn@redrectangle.org>
	<ed9e6fc4-d91c-7457-34d7-491c153215cb@gmail.com>
	<6624e8f8b1bf2f068d9abd17d2c895517fb96fc8.camel@redrectangle.org>
	<e09a230789494c4087469516707a2016@xbox06.axis.com>
User-Agent: Evolution 3.30.5 
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH] cryptsetup: Add PACKAGECONFIG options
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
X-List-Received-Date: Fri, 28 Jun 2019 03:51:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-06-27 at 10:56 +0000, Peter Kjellerstedt wrote:
> It is no longer possible to build cryptsetup-native after this was
> merged. 
> It now fails with:
> 
> ERROR: Nothing PROVIDES 'udev-native' (but virtual:native:.../meta-
> oe/recipes-crypto/cryptsetup/cryptsetup_2.1.0.bb DEPENDS on or otherwise
> requires it). Close matches:
>   fuse-native
>   unifdef-native
>   db-native
> ERROR: Required build target 'cryptsetup-native' has no buildable
> providers.
> Missing or unbuildable dependency chain was: ['cryptsetup-native',
> 'udev-native']
> 
> This is with systemd in DISTRO_FEATURES.
> 
> //Peter
> 

Sorry about that. Is there a reasonable set of options useful for the
native build? Any preference for an empty native PACKAGECONFIG or should
it be the same as the target (minus udev obviously)?

Thanks,
Robert

> > -----Original Message-----
> > From: openembedded-devel-bounces@lists.openembedded.org <openembedded-
> > devel-bounces@lists.openembedded.org> On Behalf Of Robert Joslyn
> > Sent: den 7 juni 2019 05:46
> > To: akuster808 <akuster808@gmail.com>; openembedded-
> > devel@lists.openembedded.org
> > Subject: Re: [oe] [meta-oe][PATCH] cryptsetup: Add PACKAGECONFIG
> > options
> > 
> > On Thu, 2019-06-06 at 07:24 -0700, akuster808 wrote:
> > > On 6/2/19 4:12 PM, Robert Joslyn wrote:
> > > > Add various PACKAGECONFIG options, keeping the default options
> > > > enabled.
> > > the PACKCONFIG went from openssl to a lot more, how is that keeping
> > > the
> > > defaults?
> > 
> > My intent was to add PACKAGECONFIG options, but to keep the resulting
> > build the same as before. This should match the default options that
> > are set by upstream when you don't specify any --enable or --disable
> > options.
> > 
> > I can send a v2 with a better description if desired.
> > 
> > Thanks,
> > Robert
> > 
> > > > ---
> > > >  .../cryptsetup/cryptsetup_2.1.0.bb            | 51
> > > > ++++++++++++++++++-
> > > >  1 file changed, 49 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.1.0.bb
> > > > b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.1.0.bb
> > > > index cf1d22242..51cecf5d2 100644
> > > > --- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.1.0.bb
> > > > +++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.1.0.bb
> > > > @@ -9,7 +9,12 @@ SECTION = "console"
> > > >  LICENSE = "GPL-2.0-with-OpenSSL-exception"
> > > >  LIC_FILES_CHKSUM =
> > > > "file://COPYING;md5=32107dd283b1dfeb66c9b3e6be312326"
> > > > 
> > > > -DEPENDS = "util-linux libdevmapper popt libgcrypt json-c"
> > > > +DEPENDS = " \
> > > > +    json-c \
> > > > +    libdevmapper \
> > > > +    popt \
> > > > +    util-linux \
> > > > +"
> > > > 
> > > >  SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${@d.getVar('P
> > > > V
> > > > ').split('.')[0]}.${@d.getVar('PV').split('.')[1]}/${BP}.tar.xz"
> > > >  SRC_URI[md5sum] = "41d8b985ef69242852b93e95d53e8e28"
> > > > @@ -19,9 +24,45 @@ inherit autotools gettext pkgconfig
> > > > 
> > > >  # Use openssl because libgcrypt drops root privileges
> > > >  # if libgcrypt is linked with libcap support
> > > > -PACKAGECONFIG ??= "openssl"
> > > > +PACKAGECONFIG ??= " \
> > > > +    keyring \
> > > > +    cryptsetup \
> > > > +    veritysetup \
> > > > +    cryptsetup-reencrypt \
> > > > +    integritysetup \
> > > > +    ${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)} \
> > > > +    udev \
> > > > +    kernel_crypto \
> > > > +    internal-argon2 \
> > > > +    blkid \
> > > > +    luks-adjust-xts-keysize \
> > > > +    openssl \
> > > > +"
> > > > +
> > > > +PACKAGECONFIG[keyring] = "--enable-keyring,--disable-keyring"
> > > > +PACKAGECONFIG[fips] = "--enable-fips,--disable-fips"
> > > > +PACKAGECONFIG[pwquality] = "--enable-pwquality,--disable-
> > > > pwquality,libpwquality"
> > > > +PACKAGECONFIG[passwdqc] = "--enable-passwdqc,--disable-
> > > > passwdqc,passwdqc"
> > > > +PACKAGECONFIG[cryptsetup] = "--enable-cryptsetup,--disable-
> > > > cryptsetup"
> > > > +PACKAGECONFIG[veritysetup] = "--enable-veritysetup,--disable-
> > > > veritysetup"
> > > > +PACKAGECONFIG[cryptsetup-reencrypt] = "--enable-cryptsetup-
> > > > reencrypt,--disable-cryptsetup-reencrypt"
> > > > +PACKAGECONFIG[integritysetup] = "--enable-integritysetup,
> > > > --disable-integritysetup"
> > > > +PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux"
> > > > +PACKAGECONFIG[udev] = "--enable-udev,--disable-udev,udev"
> > > > +PACKAGECONFIG[kernel_crypto] = "--enable-kernel_crypto,--disable-
> > > > kernel_crypto"
> > > > +# gcrypt-pkbdf2 requries --with-crypto_backend=gcrypt or the flag
> > > > isn't
> > > > +# recognized.
> > > > +PACKAGECONFIG[gcrypt-pbkdf2] = "--enable-gcrypt-pbkdf2"
> > > > +PACKAGECONFIG[internal-argon2] = "--enable-internal-argon2,
> > > > --disable-internal-argon2"
> > > > +PACKAGECONFIG[internal-sse-argon2] = "--enable-internal-sse-
> > > > argon2,--disable-internal-sse-argon2"
> > > > +PACKAGECONFIG[blkid] = "--enable-blkid,--disable-blkid,util-
> > > > linux"
> > > > +PACKAGECONFIG[dev-random] = "--enable-dev-random,--disable-dev-
> > > > random"
> > > > +PACKAGECONFIG[luks-adjust-xts-keysize] = "--enable-luks-adjust-
> > > > xts-keysize,--disable-luks-adjust-xts-keysize"
> > > >  PACKAGECONFIG[openssl] = "--with-crypto_backend=openssl,,openssl"
> > > >  PACKAGECONFIG[gcrypt] = "--with-crypto_backend=gcrypt,,libgcrypt"
> > > > +PACKAGECONFIG[nss] = "--with-crypto_backend=nss,,nss"
> > > > +PACKAGECONFIG[kernel] = "--with-crypto_backend=kernel"
> > > > +PACKAGECONFIG[nettle] = "--with-crypto_backend=nettle,,nettle"
> > > > 
> > > >  RRECOMMENDS_${PN} = "kernel-module-aes-generic \
> > > >                       kernel-module-dm-crypt \
> > > > @@ -32,6 +73,12 @@ RRECOMMENDS_${PN} = "kernel-module-aes-generic
> > > > \
> > > >  "
> > > > 
> > > >  EXTRA_OECONF = "--enable-static"
> > > > +# Building without largefile is not supported by upstream
> > > > +EXTRA_OECONF += "--enable-largefile"
> > > > +# Requires a static popt library
> > > > +EXTRA_OECONF += "--disable-static-cryptsetup"
> > > > +# There's no recipe for libargon2 yet
> > > > +EXTRA_OECONF += "--disable-libargon2"
> > > > 
> > > >  FILES_${PN} += "${@bb.utils.contains('DISTRO_FEATURES','systemd',
> > > > '
> > > > ${exec_prefix}/lib/tmpfiles.d/cryptsetup.conf', '', d)}"
> > > > 
> > 
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel



