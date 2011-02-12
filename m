Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <coolaj86@gmail.com>) id 1Po4nE-0003kA-9G
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Feb 2011 03:01:10 +0100
Received: by fxm17 with SMTP id 17so3227498fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Feb 2011 17:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=CLzzMltuDgNEkvkDsguxfRNDSBJy7mbctfJuqaIyqw0=;
	b=RybG4UjpDr41NRj3/igUMplSO5Nv2dTj1QZGex5DcIw3a7HVKRbd0ZciDIiLQBX2Zl
	8l5K9vvj4PXb4G10NRAfeRBzg7Vf+8xNEiLrtVgqsvXuNxV5yzH8q5hBbzrXvkKR2da4
	hJykQVH/578Fza4g3YJWU7/Bh7P5yXR5fQJ6w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=VMDQINxDXYbeRnHYP0tV4ITZCrB7d9SaV7wlp4C5Gx9fJFEZ54QatrDRXmTSQePxvm
	RqKCT6R9O5BHC+pxcAOUiEwxeqyJNw2QKTrk98d2RP9L4bLQHLbPDtcEZfWViMgRYczT
	tL2SaVvOp2R3ZbZMj0xg5Ua4Nenr7ENmfeVRw=
Received: by 10.223.101.206 with SMTP id d14mr1296811fao.134.1297475988066;
	Fri, 11 Feb 2011 17:59:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.114.73 with HTTP; Fri, 11 Feb 2011 17:59:27 -0800 (PST)
In-Reply-To: <4D559E72.4000601@mentor.com>
References: <1297450895-15614-1-git-send-email-coolaj86@gmail.com>
	<4D559E72.4000601@mentor.com>
From: AJ ONeal <coolaj86@gmail.com>
Date: Fri, 11 Feb 2011 18:59:27 -0700
Message-ID: <AANLkTinir2zYiw7czxkAhBpH+xhuq5H08mYmDB1H5CtR@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH v5] nodejs: updated to 0.2.6
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
X-List-Received-Date: Sat, 12 Feb 2011 02:01:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Thank you and your welcome.

Hopefully next time I get it right the first time.

AJ ONeal


On Fri, Feb 11, 2011 at 1:39 PM, Tom Rini <tom_rini@mentor.com> wrote:
> On 02/11/2011 12:01 PM, AJ ONeal wrote:
>>
>> * added version number to patches
>> * libev-cross-cc_0.2.6.patch - turns off execution so that cross-compile
>> succeeds
>> * node-cross-cc_0.2.6.patch - enables cross-compiling of v8 for x86,
>> x86_64, arm, and mips
>>
>> Signed-off-by: AJ ONeal<coolaj86@gmail.com>
>
> Applied, thanks for re-working it as needed!
>
>> ---
>> =A0recipes/nodejs/files/libev-cross-cc.patch =A0 =A0 =A0 | =A0 18 ------=
------
>> =A0recipes/nodejs/files/libev-cross-cc_0.2.6.patch | =A0 13 +++++++++
>> =A0recipes/nodejs/files/node-cross-cc.patch =A0 =A0 =A0 =A0| =A0 14 ----=
-----
>> =A0recipes/nodejs/files/node-cross-cc_0.2.6.patch =A0| =A0 19 ++++++++++=
+++
>> =A0recipes/nodejs/nodejs_0.2.1.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 34
>> -----------------------
>> =A0recipes/nodejs/nodejs_0.2.6.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 32
>> +++++++++++++++++++++
>> =A06 files changed, 64 insertions(+), 66 deletions(-)
>> =A0delete mode 100644 recipes/nodejs/files/libev-cross-cc.patch
>> =A0create mode 100644 recipes/nodejs/files/libev-cross-cc_0.2.6.patch
>> =A0delete mode 100644 recipes/nodejs/files/node-cross-cc.patch
>> =A0create mode 100644 recipes/nodejs/files/node-cross-cc_0.2.6.patch
>> =A0delete mode 100644 recipes/nodejs/nodejs_0.2.1.bb
>> =A0create mode 100644 recipes/nodejs/nodejs_0.2.6.bb
>>
>> diff --git a/recipes/nodejs/files/libev-cross-cc.patch
>> b/recipes/nodejs/files/libev-cross-cc.patch
>> deleted file mode 100644
>> index 4dd34f4..0000000
>> --- a/recipes/nodejs/files/libev-cross-cc.patch
>> +++ /dev/null
>> @@ -1,18 +0,0 @@
>> -diff --git node-v0.2.1/deps/libev/wscript.orig
>> node-v0.2.1/deps/libev/wscript
>> -index 19e7bb2..f0a3d3b 100644
>> ---- node-v0.2.1/deps/libev/wscript.orig
>> -+++ node-v0.2.1/deps/libev/wscript
>> -@@ -52,7 +52,12 @@ def configure(conf):
>> - =A0 =A0 =A0 =A0 =A0 return 0;
>> - =A0 =A0 =A0 }
>> - =A0 """
>> -- =A0conf.check_cc(fragment=3Dcode, define_name=3D"HAVE_CLOCK_SYSCALL",
>> execute=3DTrue,
>> -+ =A0# TODO determine this dynamically
>> -+ =A0CROSS =3D True
>> -+ =A0execute =3D True
>> -+ =A0if CROSS:
>> -+ =A0 =A0execute =3D False
>> -+ =A0conf.check_cc(fragment=3Dcode, define_name=3D"HAVE_CLOCK_SYSCALL",
>> execute=3Dexecute,
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 msg=3D"Checking for SYS_clock_gettime"=
)
>> -
>> - =A0 have_librt =3D conf.check(lib=3D'rt', uselib_store=3D'RT')
>> diff --git a/recipes/nodejs/files/libev-cross-cc_0.2.6.patch
>> b/recipes/nodejs/files/libev-cross-cc_0.2.6.patch
>> new file mode 100644
>> index 0000000..13ce4d8
>> --- /dev/null
>> +++ b/recipes/nodejs/files/libev-cross-cc_0.2.6.patch
>> @@ -0,0 +1,13 @@
>> +diff --git node-v0.2.6/deps/libev/wscript.orig
>> node-v0.2.6/deps/libev/wscript
>> +index 19e7bb2..5ec9143 100644
>> +--- node-v0.2.6/deps/libev/wscript.orig
>> ++++ node-v0.2.6/deps/libev/wscript
>> +@@ -52,7 +52,7 @@ def configure(conf):
>> + =A0 =A0 =A0 =A0 =A0 return 0;
>> + =A0 =A0 =A0 }
>> + =A0 """
>> +- =A0conf.check_cc(fragment=3Dcode, define_name=3D"HAVE_CLOCK_SYSCALL",
>> execute=3DTrue,
>> ++ =A0conf.check_cc(fragment=3Dcode, define_name=3D"HAVE_CLOCK_SYSCALL",
>> execute=3DFalse,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 msg=3D"Checking for SYS_clock_gettime"=
)
>> +
>> + =A0 have_librt =3D conf.check(lib=3D'rt', uselib_store=3D'RT')
>> diff --git a/recipes/nodejs/files/node-cross-cc.patch
>> b/recipes/nodejs/files/node-cross-cc.patch
>> deleted file mode 100644
>> index 0d15afc..0000000
>> --- a/recipes/nodejs/files/node-cross-cc.patch
>> +++ /dev/null
>> @@ -1,14 +0,0 @@
>> -diff --git node-v0.2.1/wscript.orig node-v0.2.1/wscript
>> -index 9c4243c..3cf6689 100644
>> ---- node-v0.2.1/wscript.orig
>> -+++ node-v0.2.1/wscript
>> -@@ -326,6 +326,9 @@ def v8_cmd(bld, variant):
>> - =A0 arch =3D ""
>> - =A0 if bld.env['DEST_CPU'] =3D=3D 'x86_64':
>> - =A0 =A0 arch =3D "arch=3Dx64"
>> -+ =A0# XXX Better support cross-compilation
>> -+ =A0else:
>> -+ =A0 =A0arch =3D "arch=3D" + bld.env['DEST_CPU']
>> -
>> - =A0 if variant =3D=3D "default":
>> - =A0 =A0 mode =3D "release"
>> diff --git a/recipes/nodejs/files/node-cross-cc_0.2.6.patch
>> b/recipes/nodejs/files/node-cross-cc_0.2.6.patch
>> new file mode 100644
>> index 0000000..1087ce2
>> --- /dev/null
>> +++ b/recipes/nodejs/files/node-cross-cc_0.2.6.patch
>> @@ -0,0 +1,19 @@
>> +diff --git node-v0.2.6/wscript.orig node-v0.2.6/wscript
>> +index a6bade2..566bf5e 100644
>> +--- node-v0.2.6/wscript.orig
>> ++++ node-v0.2.6/wscript
>> +@@ -338,6 +338,14 @@ def v8_cmd(bld, variant):
>> + =A0 arch =3D ""
>> + =A0 if bld.env['DEST_CPU'] =3D=3D 'x86_64':
>> + =A0 =A0 arch =3D "arch=3Dx64"
>> ++ =A0elif bld.env['DEST_CPU'] =3D=3D 'x86':
>> ++ =A0 =A0arch =3D "arch=3Dx86"
>> ++ =A0elif bld.env['DEST_CPU'] =3D=3D 'arm':
>> ++ =A0 =A0arch =3D "arch=3Darm"
>> ++ =A0elif bld.env['DEST_CPU'] =3D=3D 'mips':
>> ++ =A0 =A0arch =3D "arch=3Dmips"
>> ++ =A0else:
>> ++ =A0 =A0raise Exception(bld.env['DEST_CPU'], "is not one of these supp=
orted
>> architectures: x86, x86_64, arm, mips")
>> +
>> + =A0 if variant =3D=3D "default":
>> + =A0 =A0 mode =3D "release"
>> diff --git a/recipes/nodejs/nodejs_0.2.1.bb
>> b/recipes/nodejs/nodejs_0.2.1.bb
>> deleted file mode 100644
>> index c2e9c41..0000000
>> --- a/recipes/nodejs/nodejs_0.2.1.bb
>> +++ /dev/null
>> @@ -1,34 +0,0 @@
>> -DESCRIPTION =3D "nodeJS Evented I/O for V8 JavaScript"
>> -HOMEPAGE =3D "http://nodejs.org"
>> -LICENSE =3D "MIT"
>> -
>> -PR =3D "r1"
>> -
>> -DEPENDS =3D "openssl"
>> -
>> -SRC_URI =3D " \
>> - =A0http://nodejs.org/dist/node-v${PV}.tar.gz \
>> - =A0file://libev-cross-cc.patch \
>> - =A0file://node-cross-cc.patch \
>> -"
>> -SRC_URI[md5sum] =3D "c6051dd216817bf0f95bea80c42cf262"
>> -SRC_URI[sha256sum] =3D
>> "5bb7d084b2138ce43fcb34739ed894379c450a1dd569a1c710405bc39d2861c2"
>> -
>> -S =3D "${WORKDIR}/node-v${PV}"
>> -
>> -# v8 errors out if you have set CCACHE
>> -CCACHE =3D ""
>> -
>> -do_configure () {
>> - =A0./configure --prefix=3D${prefix} --without-snapshot
>> -}
>> -
>> -do_compile () {
>> - =A0make
>> -}
>> -
>> -do_install () {
>> - =A0DESTDIR=3D${D} oe_runmake install
>> -}
>> -
>> -BBCLASSEXTEND =3D "native"
>> diff --git a/recipes/nodejs/nodejs_0.2.6.bb
>> b/recipes/nodejs/nodejs_0.2.6.bb
>> new file mode 100644
>> index 0000000..76ad993
>> --- /dev/null
>> +++ b/recipes/nodejs/nodejs_0.2.6.bb
>> @@ -0,0 +1,32 @@
>> +DESCRIPTION =3D "nodeJS Evented I/O for V8 JavaScript"
>> +HOMEPAGE =3D "http://nodejs.org"
>> +LICENSE =3D "MIT"
>> +
>> +DEPENDS =3D "openssl"
>> +
>> +SRC_URI =3D " \
>> + =A0http://nodejs.org/dist/node-v${PV}.tar.gz \
>> + =A0file://libev-cross-cc_${PV}.patch \
>> + =A0file://node-cross-cc_${PV}.patch \
>> +"
>> +SRC_URI[md5sum] =3D "b1c50ceb43bee1b221be210b7bc7a216"
>> +SRC_URI[sha256sum] =3D
>> "e97fe9c81ff4b569ae9a0d46e64a0572a1f171293573a5b5290bcc3996a19701"
>> +
>> +S =3D "${WORKDIR}/node-v${PV}"
>> +
>> +# v8 errors out if you have set CCACHE
>> +CCACHE =3D ""
>> +
>> +do_configure () {
>> + =A0./configure --prefix=3D${prefix} --without-snapshot
>> +}
>> +
>> +do_compile () {
>> + =A0make
>> +}
>> +
>> +do_install () {
>> + =A0DESTDIR=3D${D} oe_runmake install
>> +}
>> +
>> +BBCLASSEXTEND =3D "native"
>
>
> --
> Tom Rini
> Mentor Graphics Corporation
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


