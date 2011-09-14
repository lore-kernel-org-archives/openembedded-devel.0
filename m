Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R3pz0-00018g-5s
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Sep 2011 15:58:34 +0200
Received: by gyg8 with SMTP id 8so1346871gyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Sep 2011 06:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=HDzoanOHOlSdMM1M4UGhRcOzuRzA+hwfxMQddmv6OAY=;
	b=jXolqUuNPO8sUK9nbYFU8n1GdVfk04mexpeb8wYBTdm8J901nd6swz3H4LP1Bw2mHH
	mBbpz7WStESmXG89ZROXYNRiTD9f0ApInpPtxkdGQHj90YsxmEBh+pjVKyAk3HSiq4Ae
	YEtw2JHwQfE8lW11yK7hApb5aBeT5+MXqMKD0=
MIME-Version: 1.0
Received: by 10.68.13.72 with SMTP id f8mr18171pbc.294.1316008402393; Wed, 14
	Sep 2011 06:53:22 -0700 (PDT)
Received: by 10.142.170.15 with HTTP; Wed, 14 Sep 2011 06:53:22 -0700 (PDT)
In-Reply-To: <1315581847-21074-1-git-send-email-raj.khem@gmail.com>
References: <1315581847-21074-1-git-send-email-raj.khem@gmail.com>
Date: Wed, 14 Sep 2011 15:53:22 +0200
Message-ID: <CA+chaQe74_9ddaL6CgUGCVoDtVfze4hPvu2co9Z0CdM+aS3+ww@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] openssl: Upgrade 1.0.0d -> 1.0.0e
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
X-List-Received-Date: Wed, 14 Sep 2011 13:58:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 9, 2011 at 5:24 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =C2=A0.../configure-targets.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A00
> =C2=A0.../debian/c_rehash-compat.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A00
> =C2=A0.../debian/ca.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =
=C2=A00
> =C2=A0.../debian/debian-targets.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A00
> =C2=A0.../debian/make-targets.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A00
> =C2=A0.../debian/man-dir.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A00
> =C2=A0.../debian/man-section.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A00
> =C2=A0.../debian/no-rpath.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A00
> =C2=A0.../debian/no-symbolic.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A00
> =C2=A0.../debian/pic.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0=
0
> =C2=A0.../debian/pkg-config.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A00
> =C2=A0.../debian/version-script.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A00
> =C2=A0.../engines-install-in-libdir-ssl.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| =C2=A0 =C2=A00
> =C2=A0.../oe-ldflags.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0=
0
> =C2=A0.../openssl-fix-link.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A00
> =C2=A0.../parallel-make-fix.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A00
> =C2=A0.../shared-libs.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A00
> =C2=A0.../{openssl_1.0.0d.bb =3D> openssl_1.0.0e.bb} =C2=A0 =C2=A0 =C2=A0=
 | =C2=A0 =C2=A08 ++++----
> =C2=A018 files changed, 4 insertions(+), 4 deletions(-)
> =C2=A0rename meta-oe/recipes-connectivity/openssl/{openssl-1.0.0d =3D> op=
enssl-1.0.0e}/configure-targets.patch (100%)
> =C2=A0rename meta-oe/recipes-connectivity/openssl/{openssl-1.0.0d =3D> op=
enssl-1.0.0e}/debian/c_rehash-compat.patch (100%)
> =C2=A0rename meta-oe/recipes-connectivity/openssl/{openssl-1.0.0d =3D> op=
enssl-1.0.0e}/debian/ca.patch (100%)
> =C2=A0rename meta-oe/recipes-connectivity/openssl/{openssl-1.0.0d =3D> op=
enssl-1.0.0e}/debian/debian-targets.patch (100%)
> =C2=A0rename meta-oe/recipes-connectivity/openssl/{openssl-1.0.0d =3D> op=
enssl-1.0.0e}/debian/make-targets.patch (100%)
> =C2=A0rename meta-oe/recipes-connectivity/openssl/{openssl-1.0.0d =3D> op=
enssl-1.0.0e}/debian/man-dir.patch (100%)
> =C2=A0rename meta-oe/recipes-connectivity/openssl/{openssl-1.0.0d =3D> op=
enssl-1.0.0e}/debian/man-section.patch (100%)
> =C2=A0rename meta-oe/recipes-connectivity/openssl/{openssl-1.0.0d =3D> op=
enssl-1.0.0e}/debian/no-rpath.patch (100%)
> =C2=A0rename meta-oe/recipes-connectivity/openssl/{openssl-1.0.0d =3D> op=
enssl-1.0.0e}/debian/no-symbolic.patch (100%)
> =C2=A0rename meta-oe/recipes-connectivity/openssl/{openssl-1.0.0d =3D> op=
enssl-1.0.0e}/debian/pic.patch (100%)
> =C2=A0rename meta-oe/recipes-connectivity/openssl/{openssl-1.0.0d =3D> op=
enssl-1.0.0e}/debian/pkg-config.patch (100%)
> =C2=A0rename meta-oe/recipes-connectivity/openssl/{openssl-1.0.0d =3D> op=
enssl-1.0.0e}/debian/version-script.patch (100%)
> =C2=A0rename meta-oe/recipes-connectivity/openssl/{openssl-1.0.0d =3D> op=
enssl-1.0.0e}/engines-install-in-libdir-ssl.patch (100%)
> =C2=A0rename meta-oe/recipes-connectivity/openssl/{openssl-1.0.0d =3D> op=
enssl-1.0.0e}/oe-ldflags.patch (100%)
> =C2=A0rename meta-oe/recipes-connectivity/openssl/{openssl-1.0.0d =3D> op=
enssl-1.0.0e}/openssl-fix-link.patch (100%)
> =C2=A0rename meta-oe/recipes-connectivity/openssl/{openssl-1.0.0d =3D> op=
enssl-1.0.0e}/parallel-make-fix.patch (100%)
> =C2=A0rename meta-oe/recipes-connectivity/openssl/{openssl-1.0.0d =3D> op=
enssl-1.0.0e}/shared-libs.patch (100%)
> =C2=A0rename meta-oe/recipes-connectivity/openssl/{openssl_1.0.0d.bb =3D>=
 openssl_1.0.0e.bb} (88%)

Hi,

1.0.0d was building fine, but 1.0.0e fails with:

| making all in crypto/modes...
| make[2]: Entering directory
`/OE/shr-core/tmp/work/armv4t-oe-linux-gnueabi/openssl-1.0.0e-r13.0/openssl=
-1.0.0e/crypto/modes'
| arm-oe-linux-gnueabi-gcc  -march=3Darmv4t -mthumb -mthumb-interwork
-mtune=3Darm920t --sysroot=3D/OE/shr-core/tmp/sysroots/om-gta02 -I..
-I../.. -I../asn1 -I../evp -I../../include  -fPIC -DOPENSSL_PIC
-DOPENSSL_THREADS -D_REENTRANT -DDSO_DLFCN -DHAVE_DLFCN_H -DL_ENDIAN
 -DTERMIO -O2 -pipe -g -feliminate-unused-debug-types -Wall
-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS   -c -o cbc128.o cbc128.c
| arm-oe-linux-gnueabi-gcc  -march=3Darmv4t -mthumb -mthumb-interwork
-mtune=3Darm920t --sysroot=3D/OE/shr-core/tmp/sysroots/om-gta02 -I..
-I../.. -I../asn1 -I../evp -I../../include  -fPIC -DOPENSSL_PIC
-DOPENSSL_THREADS -D_REENTRANT -DDSO_DLFCN -DHAVE_DLFCN_H -DL_ENDIAN
 -DTERMIO -O2 -pipe -g -feliminate-unused-debug-types -Wall
-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS   -c -o ctr128.o ctr128.c
| /OE/shr-core/tmp/sysroots/x86_64-linux/usr/libexec/armv4t-oe-linux-gnueab=
i/gcc/arm-oe-linux-gnueabi/4.6.1/ld:
libcrypto.a(cryptlib.o): invalid string offset 2288 >=3D 1268 for
section `.strtab'
| /OE/shr-core/tmp/sysroots/x86_64-linux/usr/libexec/armv4t-oe-linux-gnueab=
i/gcc/arm-oe-linux-gnueabi/4.6.1/ld:
final link failed: Nonrepresentable section on output
| collect2: ld returned 1 exit status
| make[4]: *** [link_a.gnu] Error 1
| make[4]: Leaving directory
`/OE/shr-core/tmp/work/armv4t-oe-linux-gnueabi/openssl-1.0.0e-r13.0/openssl=
-1.0.0e'

have you seen this error? any hint?

Thanks,

Regards,


