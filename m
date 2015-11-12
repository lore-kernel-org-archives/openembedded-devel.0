Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ob0-f173.google.com (mail-ob0-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id D512376E4A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 14:39:12 +0000 (UTC)
Received: by obbnk6 with SMTP id nk6so47589188obb.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 06:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=OHMlqThCcYCJse+gDhCGa2UFgkFdbzJc8dz+4eNRX/s=;
	b=Yu9sFQlH0aU2uiyswSmmAoakimXP5WNypPFbCkrAXJ0kfa9gPv4Db191nvVuxJOkVi
	qLDChryuw0ouUkAIRnhd28V6i19KfVwJY0qlrc+1kosius1d2ifGEC1eYcbnlR619OLX
	88ZvsoDSlQA/nxH/hf17zOpqF09ftzqkpztbW/RYKtUCtexa62iN/6Y8C6kxVqdU9Dmk
	AaVVr132KhkpomFQHAgB2Wtwp8g+kkj6AQzKiMQDGq3XPOE58Q35xjU+NvoZPidX7oEq
	qyIF/RJ5FReASJYUSEj9W7b9Cf2tli4nJ4c/9ZvBPs5ZbZaUMu7Q9cP5wBFdsWMUqWol
	iY2Q==
MIME-Version: 1.0
X-Received: by 10.182.153.226 with SMTP id vj2mr8686801obb.61.1447339152585;
	Thu, 12 Nov 2015 06:39:12 -0800 (PST)
Received: by 10.76.75.135 with HTTP; Thu, 12 Nov 2015 06:39:12 -0800 (PST)
In-Reply-To: <1447338183-9675-1-git-send-email-Martin.Jansa@gmail.com>
References: <1447338183-9675-1-git-send-email-Martin.Jansa@gmail.com>
Date: Thu, 12 Nov 2015 15:39:12 +0100
Message-ID: <CALbNGRTs5LyeazLDrmKrrJfYo0NVBaW3uUVe7jxFpWQus-daEA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-oe 1/9] ipsec-tools: set MACHINE_ARCH, because it depends on kernel
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
X-List-Received-Date: Thu, 12 Nov 2015 14:39:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2015 at 3:22 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> * see:
>   http://lists.openembedded.org/pipermail/openembedded-devel/2015-Septemb=
er/103271.html
> * fixes:
> ERROR: ipsec-tools different signature for task do_configure.sigdata betw=
een qemux86copy and qemux86
> runtaskdeps changed from ['autoconfautoconf_2.69.bb.do_populate_sysroot:v=
irtual:native', 'automakeautomake_1.15.bb.do_populate_sysroot:virtual:nativ=
e', 'bisonbison_3.0.4.bb.do_populate_sysroot:virtual:native', 'flexflex_2.5=
.39.bb.do_populate_sysroot:virtual:native', 'gccgcc-cross_5.2.bb.do_populat=
e_sysroot', 'gccgcc-runtime_5.2.bb.do_populate_sysroot', 'glibcglibc_2.22.b=
b.do_populate_sysroot', 'gnu-configgnu-config_git.bb.do_populate_sysroot:vi=
rtual:native', 'ipsec-toolsipsec-tools_0.8.2.bb.do_patch', 'libtoollibtool-=
cross_2.4.6.bb.do_populate_sysroot', 'libtoollibtool-native_2.4.6.bb.do_pop=
ulate_sysroot', 'linuxlinux-yocto_4.1.bb.do_populate_sysroot', 'opensslopen=
ssl_1.0.2d.bb.do_populate_sysroot', 'readlinereadline_6.3.bb.do_populate_sy=
sroot', 'systemdsystemd-systemctl-native.bb.do_populate_sysroot']
> to
> ['autoconfautoconf_2.69.bb.do_populate_sysroot:virtual:native', 'automake=
automake_1.15.bb.do_populate_sysroot:virtual:native', 'bisonbison_3.0.4.bb.=
do_populate_sysroot:virtual:native', 'flexflex_2.5.39.bb.do_populate_sysroo=
t:virtual:native', 'gccgcc-cross_5.2.bb.do_populate_sysroot', 'gccgcc-runti=
me_5.2.bb.do_populate_sysroot', 'glibcglibc_2.22.bb.do_populate_sysroot', '=
gnu-configgnu-config_git.bb.do_populate_sysroot:virtual:native', 'ipsec-too=
lsipsec-tools_0.8.2.bb.do_patch', 'libtoollibtool-cross_2.4.6.bb.do_populat=
e_sysroot', 'libtoollibtool-native_2.4.6.bb.do_populate_sysroot', 'linuxlin=
ux-yocto_4.1.bb.do_populate_sysroot', 'opensslopenssl_1.0.2d.bb.do_populate=
_sysroot', 'readlinereadline_6.3.bb.do_populate_sysroot', 'systemdsystemd-s=
ystemctl-native.bb.do_populate_sysroot']
> openembedded-core/meta/recipes-kernel/linux/linux-yocto_4.1.bb.do_populat=
e_sysroot with hash 1a8aa7a50a6cf3ebf5401af43dd6bf3b
>  changed to
> openembedded-core/meta/recipes-kernel/linux/linux-yocto_4.1.bb.do_populat=
e_sysroot with hash 143d2686a37f592891fb2aa6fa9b752e
> Hash for dependent task linuxlinux-yocto_4.1.bb.do_populate_sysroot chang=
ed from 1a8aa7a50a6cf3ebf5401af43dd6bf3b to 143d2686a37f592891fb2aa6fa9b752=
e
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.=
2.bb b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
> index 8ee81f8..d9f1212 100644
> --- a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
> +++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
> @@ -7,6 +7,8 @@ LIC_FILES_CHKSUM =3D "file://src/libipsec/pfkey.c;beginli=
ne=3D6;endline=3D31;md5=3Dbc9b7
>
>  DEPENDS =3D "virtual/kernel openssl readline flex-native bison-native"
>
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> +
>  SRC_URI =3D "ftp://ftp.netbsd.org/pub/NetBSD/misc/ipsec-tools/0.8/ipsec-=
tools-${PV}.tar.bz2 \
>             file://0002-Don-t-link-against-libfl.patch \
>             file://configure.patch \
> --
> 2.6.3
>
Maybe I am wrong: I think there were times when depending on kernel
made recipe machine specific. I somehow get the feeling that this is
the wrong fix...

Andreas

