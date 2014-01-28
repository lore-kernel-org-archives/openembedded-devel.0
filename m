Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f180.google.com (mail-ea0-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id 57D1F6E87E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jan 2014 20:47:39 +0000 (UTC)
Received: by mail-ea0-f180.google.com with SMTP id o10so479756eaj.25
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jan 2014 12:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=mTnNlXnBm2r9KCuJhwpIR9W4I6Zcc5tRD7u8pbWNNPY=;
	b=MmiDkSg7mzb+NWcp7yTFopzlFlIsMmmlw7nRbT8GiJGQR4TTNfT6LQL4hb8pgLAe4k
	x4dTQ/HwHKU3Y68+wtAJbVGRVtxRQOuJEZbhxrfFxHNli5elU68PSAOl7pCrVockRu5Z
	Si+PCItCB0QN7NAMsibIQgWLCuUMfiRI/kH8K4XGz5j0wtRI+7pmE6/eTLJ8yJBEWSaZ
	atsZSyHb9NosNU6wwJ88jvp/CNvGvasj8jcIwYOC5BfIqH/2zszy2aqqwMsdnspfTtYj
	H8Ae/d644rDz6gVdVsPjf9vgIsANBebaHq8THn5ygDWwEK1GW0Wut0bo7KKC41xe2yKR
	3DPQ==
X-Received: by 10.14.218.66 with SMTP id j42mr76668eep.94.1390942059776;
	Tue, 28 Jan 2014 12:47:39 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id v1sm59964126eef.9.2014.01.28.12.47.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Jan 2014 12:47:38 -0800 (PST)
Date: Tue, 28 Jan 2014 21:47:44 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140128204744.GN3718@jama>
References: <1390940341-28973-1-git-send-email-obi@opendreambox.org>
MIME-Version: 1.0
In-Reply-To: <1390940341-28973-1-git-send-email-obi@opendreambox.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-qt5][PATCH] qtwebkit: drop obsolete patch 0001-jsc-Add-licuuc-licui18n-LIBS.patch
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
X-List-Received-Date: Tue, 28 Jan 2014 20:47:42 -0000
X-Groupsio-MsgNum: 47929
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="r/w8vo2lxBmCPGjQ"
Content-Disposition: inline

--r/w8vo2lxBmCPGjQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 28, 2014 at 09:19:01PM +0100, Andreas Oberritter wrote:
> This patch caused a linker error:
>=20
> | linking ../../bin/jsc
> | [...]ld: cannot find -licuuc -licui18n
>=20
> The linker command-line contains:
>=20
> | [...] -licuuc\ -licui18n [...] -licui18n -licuuc -licudata [...]
>=20
> So the problem gets caused by the backslash, making the actual library
> name "libicuuc -licui18n.so". This may have been caused be the double
> quotes used in the patch. However, since both libs are already part
> of the command-line, the patch can just get dropped. The patch indicates,
> that it was created for a beta version, so I assume that this was
> fixed before the 5.2 release.

Weird, I'll try to reproduce the failure again.

It was failing like this for me when testing only in
oe-core+meta-qt5 and it wasn't needed in other setup (e.g.
meta-webos-ports).

I'll apply it in few days if I don't manage to reproduce it again with
oe-core only.

Thanks


>=20
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
>  recipes-qt/qt5/qtwebkit.inc                        |   1 -
>  .../0001-jsc-Add-licuuc-licui18n-LIBS.patch        | 443 ---------------=
------
>  2 files changed, 444 deletions(-)
>  delete mode 100644 recipes-qt/qt5/qtwebkit/0001-jsc-Add-licuuc-licui18n-=
LIBS.patch
>=20
> diff --git a/recipes-qt/qt5/qtwebkit.inc b/recipes-qt/qt5/qtwebkit.inc
> index 8f475d7..f2b678e 100644
> --- a/recipes-qt/qt5/qtwebkit.inc
> +++ b/recipes-qt/qt5/qtwebkit.inc
> @@ -15,7 +15,6 @@ EXTRA_QMAKEVARS_PRE +=3D "${QTWEBKIT_DEBUG}"
>  PACKAGES =3D "${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale=
 ${PACKAGE_BEFORE_PN} ${PN} ${PN}-qmlplugins-dbg ${PN}-tools-dbg ${PN}-plug=
ins-dbg ${PN}-qmlplugins ${PN}-tools ${PN}-plugins ${PN}-mkspecs "
> =20
>  SRC_URI +=3D "file://fix-rpath.patch"
> -SRC_URI +=3D "file://0001-jsc-Add-licuuc-licui18n-LIBS.patch"
> =20
>  # make sure rb files are used from sysroot, not from host
>  # ruby-1.9.3-always-use-i386.patch is doing target_cpu=3D`echo $target_c=
pu | sed s/i.86/i386/`
> diff --git a/recipes-qt/qt5/qtwebkit/0001-jsc-Add-licuuc-licui18n-LIBS.pa=
tch b/recipes-qt/qt5/qtwebkit/0001-jsc-Add-licuuc-licui18n-LIBS.patch
> deleted file mode 100644
> index f9e97cb..0000000
> --- a/recipes-qt/qt5/qtwebkit/0001-jsc-Add-licuuc-licui18n-LIBS.patch
> +++ /dev/null
> @@ -1,443 +0,0 @@
> -From 19da0b2f95c4c4ad3cc35ea3c6bb34adf4886a32 Mon Sep 17 00:00:00 2001
> -From: Martin Jansa <Martin.Jansa@gmail.com>
> -Date: Sat, 16 Nov 2013 15:47:13 +0100
> -Subject: [PATCH] jsc: Add -licuuc -licui18n LIBS
> -
> -* fails to link without them:
> -OE @ ~/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2=
=2E0-beta1+gitAUTOINC+2761751eca-r0/build/Source/JavaScriptCore $ x86_64-oe=
-linux-g++  -m64 --sysroot=3D/OE/build/oe-core/tmp-eglibc/sysroots/qemux86-=
64 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -Wl,-O1 -o ../../bin/jsc =
=2Eobj/release-shared/jsc.o   -Wl,-whole-archive -lJavaScriptCore -Wl,-no-w=
hole-archive -L/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5=
=2E1.99+5.2.0-beta1+gitAUTOINC+2761751eca-r0/build/Source/JavaScriptCore/re=
lease -Wl,-whole-archive -lWTF -Wl,-no-whole-archive -L/OE/build/oe-core/tm=
p-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-beta1+gitAUTOINC+276175=
1eca-r0/build/Source/WTF/release -lglib-2.0 -lgio-2.0 -lgobject-2.0 -lglib-=
2.0 -lQt5Core -lpthread -lpthread                    /OE/build/oe-core/tmp-=
eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-beta1+gitAUTOINC+2761751e=
ca-r0/build/Source/JavaScriptCore/release/libJavaScriptCore.a(Lexer.o): In =
function `JSC::isNonLatin1I
>  dentStar
>  t(int)':
> -Lexer.cpp:(.text+0x5): undefined reference to `u_charType_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/JavaScriptCore/release/libJavaS=
criptCore.a(Lexer.o): In function `JSC::isNonLatin1IdentPart(int)':
> -Lexer.cpp:(.text+0x24): undefined reference to `u_charType_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/JavaScriptCore/release/libJavaS=
criptCore.a(Lexer.o): In function `JSC::Lexer<unsigned short>::nextTokenIsC=
olon()':
> -Lexer.cpp:(.text._ZN3JSC5LexerItE16nextTokenIsColonEv[_ZN3JSC5LexerItE16=
nextTokenIsColonEv]+0x80): undefined reference to `u_charType_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/JavaScriptCore/release/libJavaS=
criptCore.a(Lexer.o): In function `JSC::Lexer<unsigned short>::lex(JSC::JST=
okenData*, JSC::JSTokenLocation*, unsigned int, bool)':
> -Lexer.cpp:(.text._ZN3JSC5LexerItE3lexEPNS_11JSTokenDataEPNS_15JSTokenLoc=
ationEjb[_ZN3JSC5LexerItE3lexEPNS_11JSTokenDataEPNS_15JSTokenLocationEjb]+0=
xb5): undefined reference to `u_charType_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/JavaScriptCore/release/libJavaS=
criptCore.a(YarrInterpreter.o): In function `JSC::Yarr::ByteCompiler::emitD=
isjunction(JSC::Yarr::PatternDisjunction*, unsigned int, unsigned int)':
> -YarrInterpreter.cpp:(.text._ZN3JSC4Yarr12ByteCompiler15emitDisjunctionEP=
NS0_18PatternDisjunctionEjj[_ZN3JSC4Yarr12ByteCompiler15emitDisjunctionEPNS=
0_18PatternDisjunctionEjj]+0x1117): undefined reference to `u_tolower_51'
> -YarrInterpreter.cpp:(.text._ZN3JSC4Yarr12ByteCompiler15emitDisjunctionEP=
NS0_18PatternDisjunctionEjj[_ZN3JSC4Yarr12ByteCompiler15emitDisjunctionEPNS=
0_18PatternDisjunctionEjj]+0x1126): undefined reference to `u_toupper_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/JavaScriptCore/release/libJavaS=
criptCore.a(DatePrototype.o): In function `JSC::formatLocaleDate(JSC::ExecS=
tate*, JSC::DateInstance*, double, JSC::LocaleDateTimeFormat) [clone .isra.=
61]':
> -DatePrototype.cpp:(.text+0x57cc): undefined reference to `udat_open_51'
> -DatePrototype.cpp:(.text+0x57f8): undefined reference to `udat_format_51'
> -DatePrototype.cpp:(.text+0x5802): undefined reference to `udat_close_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/JavaScriptCore/release/libJavaS=
criptCore.a(FunctionPrototype.o): In function `JSC::functionProtoFuncToStri=
ng(JSC::ExecState*)':
> -FunctionPrototype.cpp:(.text+0x2666): undefined reference to `u_charType=
_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/JavaScriptCore/release/libJavaS=
criptCore.a(JSGlobalObjectFunctions.o): In function `JSC::isStrWhiteSpace(u=
nsigned short)':
> -JSGlobalObjectFunctions.cpp:(.text+0x458): undefined reference to `u_cha=
rType_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/JavaScriptCore/release/libJavaS=
criptCore.a(JSGlobalObjectFunctions.o): In function `JSC::jsToNumber(WTF::S=
tring const&)':
> -JSGlobalObjectFunctions.cpp:(.text+0x789): undefined reference to `u_cha=
rType_51'
> -JSGlobalObjectFunctions.cpp:(.text+0x7bf): undefined reference to `u_cha=
rType_51'
> -JSGlobalObjectFunctions.cpp:(.text+0xc75): undefined reference to `u_cha=
rType_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/JavaScriptCore/release/libJavaS=
criptCore.a(JSGlobalObjectFunctions.o):JSGlobalObjectFunctions.cpp:(.text+0=
x1cd1): more undefined references to `u_charType_51' follow
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WTF/release/libWTF.a(Base64.o):=
 In function `WTF::base64Decode(WTF::String const&, WTF::Vector<char, 0ul, =
WTF::CrashOnOverflow>&, WTF::Base64DecodePolicy)':
> -Base64.cpp:(.text+0x5c8): undefined reference to `u_charDirection_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WTF/release/libWTF.a(Base64.o):=
 In function `WTF::base64Decode(char const*, unsigned int, WTF::Vector<char=
, 0ul, WTF::CrashOnOverflow>&, WTF::Base64DecodePolicy)':
> -Base64.cpp:(.text+0x1441): undefined reference to `u_charDirection_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WTF/release/libWTF.a(StringImpl=
=2Eo): In function `WTF::equalIgnoringCase(unsigned char const*, unsigned c=
har const*, unsigned int)':
> -StringImpl.cpp:(.text+0x6e4): undefined reference to `u_foldCase_51'
> -StringImpl.cpp:(.text+0x6f1): undefined reference to `u_foldCase_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WTF/release/libWTF.a(StringImpl=
=2Eo): In function `WTF::equalIgnoringCase(unsigned short const*, unsigned =
char const*, unsigned int)':
> -StringImpl.cpp:(.text+0x754): undefined reference to `u_foldCase_51'
> -StringImpl.cpp:(.text+0x761): undefined reference to `u_foldCase_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WTF/release/libWTF.a(StringImpl=
=2Eo): In function `WTF::StringImpl::findIgnoringCase(WTF::StringImpl*, uns=
igned int)':
> -StringImpl.cpp:(.text+0x2eb4): undefined reference to `u_memcasecmp_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WTF/release/libWTF.a(StringImpl=
=2Eo): In function `WTF::StringImpl::reverseFindIgnoringCase(WTF::StringImp=
l*, unsigned int)':
> -StringImpl.cpp:(.text+0x35f3): undefined reference to `u_memcasecmp_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WTF/release/libWTF.a(StringImpl=
=2Eo): In function `WTF::equalIgnoringCase(WTF::StringImpl const*, unsigned=
 char const*)':
> -StringImpl.cpp:(.text+0x4139): undefined reference to `u_foldCase_51'
> -StringImpl.cpp:(.text+0x4149): undefined reference to `u_foldCase_51'
> -StringImpl.cpp:(.text+0x421d): undefined reference to `u_foldCase_51'
> -StringImpl.cpp:(.text+0x422d): undefined reference to `u_foldCase_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WTF/release/libWTF.a(StringImpl=
=2Eo): In function `WTF::equalIgnoringCaseNonNull(WTF::StringImpl const*, W=
TF::StringImpl const*)':
> -StringImpl.cpp:(.text+0x42a5): undefined reference to `u_memcasecmp_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WTF/release/libWTF.a(StringImpl=
=2Eo): In function `WTF::StringImpl::defaultWritingDirection(bool*)':
> -StringImpl.cpp:(.text+0x438b): undefined reference to `u_charDirection_5=
1'
> -StringImpl.cpp:(.text+0x43b6): undefined reference to `u_charDirection_5=
1'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WTF/release/libWTF.a(StringImpl=
=2Eo): In function `WTF::StringImpl::simplifyWhiteSpace()':
> -StringImpl.cpp:(.text+0x48b1): undefined reference to `u_charDirection_5=
1'
> -StringImpl.cpp:(.text+0x48e1): undefined reference to `u_charDirection_5=
1'
> -StringImpl.cpp:(.text+0x49f1): undefined reference to `u_charDirection_5=
1'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WTF/release/libWTF.a(StringImpl=
=2Eo):StringImpl.cpp:(.text+0x4a19): more undefined references to `u_charDi=
rection_51' follow
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WTF/release/libWTF.a(StringImpl=
=2Eo): In function `WTF::StringImpl::lower()':
> -StringImpl.cpp:(.text+0x69bd): undefined reference to `u_strToLower_51'
> -StringImpl.cpp:(.text+0x6b51): undefined reference to `u_strToLower_51'
> -StringImpl.cpp:(.text+0x6c31): undefined reference to `u_tolower_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WTF/release/libWTF.a(StringImpl=
=2Eo): In function `WTF::StringImpl::foldCase()':
> -StringImpl.cpp:(.text+0x6cde): undefined reference to `u_tolower_51'
> -StringImpl.cpp:(.text+0x6d9e): undefined reference to `u_strFoldCase_51'
> -StringImpl.cpp:(.text+0x6e12): undefined reference to `u_strFoldCase_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WTF/release/libWTF.a(StringImpl=
=2Eo): In function `WTF::StringImpl::upper()':
> -StringImpl.cpp:(.text+0x6f9f): undefined reference to `u_strToUpper_51'
> -StringImpl.cpp:(.text+0x7031): undefined reference to `u_strToUpper_51'
> -StringImpl.cpp:(.text+0x70ec): undefined reference to `u_toupper_51'
> -StringImpl.cpp:(.text+0x71ea): undefined reference to `u_toupper_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WTF/release/libWTF.a(WTFString.=
o): In function `WTF::charactersToIntStrict(unsigned char const*, unsigned =
long, bool*, int)':
> -WTFString.cpp:(.text+0x2d81): undefined reference to `u_charDirection_51'
> -WTFString.cpp:(.text+0x3031): undefined reference to `u_charDirection_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WTF/release/libWTF.a(WTFString.=
o): In function `WTF::charactersToIntStrict(unsigned short const*, unsigned=
 long, bool*, int)':
> -WTFString.cpp:(.text+0x30c1): undefined reference to `u_charDirection_51'
> -WTFString.cpp:(.text+0x3331): undefined reference to `u_charDirection_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WTF/release/libWTF.a(WTFString.=
o): In function `WTF::charactersToUIntStrict(unsigned char const*, unsigned=
 long, bool*, int)':
> -WTFString.cpp:(.text+0x3451): undefined reference to `u_charDirection_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WTF/release/libWTF.a(WTFString.=
o):WTFString.cpp:(.text+0x36b9): more undefined references to `u_charDirect=
ion_51' follow
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WTF/release/libWTF.a(CollatorIC=
U.o): In function `WTF::Collator::~Collator()':
> -CollatorICU.cpp:(.text+0x98): undefined reference to `ucol_close_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WTF/release/libWTF.a(CollatorIC=
U.o): In function `WTF::Collator::createCollator() const':
> -CollatorICU.cpp:(.text+0x174): undefined reference to `ucol_getLocaleByT=
ype_51'
> -CollatorICU.cpp:(.text+0x18b): undefined reference to `ucol_getAttribute=
_51'
> -CollatorICU.cpp:(.text+0x1d0): undefined reference to `ucol_open_51'
> -CollatorICU.cpp:(.text+0x1f3): undefined reference to `ucol_open_51'
> -CollatorICU.cpp:(.text+0x211): undefined reference to `ucol_setAttribute=
_51'
> -CollatorICU.cpp:(.text+0x226): undefined reference to `ucol_setAttribute=
_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WTF/release/libWTF.a(CollatorIC=
U.o): In function `WTF::Collator::releaseCollator()':
> -CollatorICU.cpp:(.text+0x368): undefined reference to `ucol_close_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WTF/release/libWTF.a(CollatorIC=
U.o): In function `WTF::Collator::collate(unsigned short const*, unsigned l=
ong, unsigned short const*, unsigned long) const':
> -CollatorICU.cpp:(.text+0x2e6): undefined reference to `ucol_strcoll_51'
> -CollatorICU.cpp:(.text+0x327): undefined reference to `ucol_strcoll_51'
> -collect2: error: ld returned 1 exit status
> -
> -* and later when linking main library:
> -E @ ~/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.=
0-beta1+gitAUTOINC+2761751eca-r0/build/Source $ make -j 9      MAKEFLAGS=3D=
'-j 9'     OE_QMAKE_COMPILER=3D'x86_64-oe-linux-gcc  -m64 --sysroot=3D/OE/b=
uild/oe-core/tmp-eglibc/sysroots/qemux86-64'     OE_QMAKE_CC=3D'x86_64-oe-l=
inux-gcc  -m64 --sysroot=3D/OE/build/oe-core/tmp-eglibc/sysroots/qemux86-64=
'     OE_QMAKE_CXX=3D'x86_64-oe-linux-g++  -m64 --sysroot=3D/OE/build/oe-co=
re/tmp-eglibc/sysroots/qemux86-64'     OE_QMAKE_CFLAGS=3D' -O2 -pipe -g -fe=
liminate-unused-debug-types'     OE_QMAKE_CXXFLAGS=3D' -O2 -pipe -g -felimi=
nate-unused-debug-types -fpermissive -fvisibility-inlines-hidden'     OE_QM=
AKE_LINK=3D'x86_64-oe-linux-g++  -m64 --sysroot=3D/OE/build/oe-core/tmp-egl=
ibc/sysroots/qemux86-64'     OE_QMAKE_LDFLAGS=3D'-Wl,-O1 -Wl,--hash-style=
=3Dgnu -Wl,--as-needed'     OE_QMAKE_AR=3D'x86_64-oe-linux-ar'     OE_QMAKE=
_STRIP=3D'echo'     OE_QMAKE_WAYLAND_SCANNER=3D'/OE/build/oe-core/tmp-eglib=
c/sysroots/x86_64-linux/usr/bin/wayland-scanner' -f
>   Makefil
>  e.api
> -rm -f libQt5WebKit.so.5.2.0 libQt5WebKit.so libQt5WebKit.so.5 libQt5WebK=
it.so.5.2
> -x86_64-oe-linux-g++  -m64 --sysroot=3D/OE/build/oe-core/tmp-eglibc/sysro=
ots/qemux86-64 -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -Wl,--gc-sect=
ions -Wl,--no-undefined -Wl,--no-undefined -Wl,-O1 -shared -Wl,-Bsymbolic-f=
unctions -Wl,-soname,libQt5WebKit.so.5 -o libQt5WebKit.so.5.2.0   -lQt5Netw=
ork -L/OE/build/oe-core/tmp-eglibc/sysroots/qemux86-64/usr/lib -lQt5Core -l=
pthread -lpthread -lQt5Gui -L/OE/build/oe-core/tmp-eglibc/sysroots/qemux86-=
64/usr/lib -lQt5Core -lpthread -lpthread -lQt5Core -lpthread -lpthread -Wl,=
-whole-archive -lWebKit1 -Wl,-no-whole-archive -L/OE/build/oe-core/tmp-egli=
bc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-beta1+gitAUTOINC+2761751eca-r=
0/build/Source/WebKit/release -Wl,-whole-archive -lWebKit2 -Wl,-no-whole-ar=
chive -L/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5=
=2E2.0-beta1+gitAUTOINC+2761751eca-r0/build/Source/WebKit2/release -lrt -Wl=
,-whole-archive -lWebCore -Wl,-no-whole-archive -L/OE/build/oe-core/tmp-egl=
ibc/work/x86_64-oe-linu
>  x/qtwebk
>  it/5.1.99+5.2.0-beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/rele=
ase -lz -lXrender -ludev -lXcomposite -lXrender -ljpeg -lpng -Wl,-whole-arc=
hive -lANGLE -Wl,-no-whole-archive -L/OE/build/oe-core/tmp-eglibc/work/x86_=
64-oe-linux/qtwebkit/5.1.99+5.2.0-beta1+gitAUTOINC+2761751eca-r0/build/Sour=
ce/ThirdParty/ANGLE/release -Wl,-whole-archive -lJavaScriptCore -Wl,-no-who=
le-archive -L/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1=
=2E99+5.2.0-beta1+gitAUTOINC+2761751eca-r0/build/Source/JavaScriptCore/rele=
ase -Wl,-whole-archive -lWTF -Wl,-no-whole-archive -L/OE/build/oe-core/tmp-=
eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-beta1+gitAUTOINC+2761751e=
ca-r0/build/Source/WTF/release -lXext -lX11 -lm -lX11 -lxslt -lxml2 -lz -lm=
 -ldl -lm -lxml2 -lxml2 -lglib-2.0 -lgio-2.0 -lgobject-2.0 -lglib-2.0 -lgst=
reamer-0.10 -lgobject-2.0 -lgmodule-2.0 -pthread -lgthread-2.0 -pthread -lg=
lib-2.0 -lxml2 -lgstapp-0.10 -lgstbase-0.10 -lgstreamer-0.10 -lgobject-2.0 =
-lgmodule-2.0 -pthr
>  ead -lgt
>  hread-2.0 -pthread -lglib-2.0 -lxml2 -lgstbase-0.10 -lgstreamer-0.10 -lg=
object-2.0 -lgmodule-2.0 -pthread -lgthread-2.0 -pthread -lglib-2.0 -lxml2 =
-lgstinterfaces-0.10 -lgstreamer-0.10 -lgobject-2.0 -lgmodule-2.0 -pthread =
-lgthread-2.0 -pthread -lglib-2.0 -lxml2 -lgstpbutils-0.10 -lgstreamer-0.10=
 -lgobject-2.0 -lgmodule-2.0 -pthread -lgthread-2.0 -pthread -lglib-2.0 -lx=
ml2 -lgstreamer-0.10 -lgobject-2.0 -lgmodule-2.0 -pthread -lgthread-2.0 -pt=
hread -lglib-2.0 -lxml2 -lgstvideo-0.10 -lgstbase-0.10 -lgstreamer-0.10 -lg=
object-2.0 -lgmodule-2.0 -pthread -lgthread-2.0 -pthread -lglib-2.0 -lxml2 =
-lsqlite3 -lQt5Quick -L/OE/build/oe-core/tmp-eglibc/sysroots/qemux86-64/usr=
/lib -lQt5Qml -ldl -lQt5Network -L/OE/build/oe-core/tmp-eglibc/sysroots/qem=
ux86-64/usr/lib -lQt5Core -lpthread -lpthread -L/OE/build/oe-core/tmp-eglib=
c/sysroots/qemux86-64/usr/lib -lQt5Core -lpthread -lpthread -ldl -L/OE/buil=
d/oe-core/tmp-eglibc/sysroots/qemux86-64/usr/lib -lQt5Network -L/OE/build/o=
e-core/tmp-eglibc
>  /sysroot
>  s/qemux86-64/usr/lib -lQt5Core -lpthread -lpthread -lQt5Gui -L/OE/build/=
oe-core/tmp-eglibc/sysroots/qemux86-64/usr/lib -lQt5Core -lpthread -lpthrea=
d -lQt5Core -lpthread -lpthread -lQt5Positioning -lQt5Qml -ldl -lQt5Network=
 -L/OE/build/oe-core/tmp-eglibc/sysroots/qemux86-64/usr/lib -lQt5Core -lpth=
read -lpthread -L/OE/build/oe-core/tmp-eglibc/sysroots/qemux86-64/usr/lib -=
lQt5Core -lpthread -lpthread -ldl -L/OE/build/oe-core/tmp-eglibc/sysroots/q=
emux86-64/usr/lib -lQt5Network -L/OE/build/oe-core/tmp-eglibc/sysroots/qemu=
x86-64/usr/lib -lQt5Core -lpthread -lpthread -lQt5Core -lpthread -lpthread =
-lQt5Qml -ldl -lQt5Network -L/OE/build/oe-core/tmp-eglibc/sysroots/qemux86-=
64/usr/lib -lQt5Core -lpthread -lpthread -L/OE/build/oe-core/tmp-eglibc/sys=
roots/qemux86-64/usr/lib -lQt5Core -lpthread -lpthread -lQt5Sql -L/OE/build=
/oe-core/tmp-eglibc/sysroots/qemux86-64/usr/lib -lQt5Core -lpthread -lpthre=
ad -lQt5Gui -L/OE/build/oe-core/tmp-eglibc/sysroots/qemux86-64/usr/lib -lQt=
5Core -lpthread -
>  lpthread
>   -lQt5Network -L/OE/build/oe-core/tmp-eglibc/sysroots/qemux86-64/usr/lib=
 -lQt5Core -lpthread -lpthread -lQt5Sensors -lQt5Core -lpthread -lpthread -=
lQt5Core -lpthread -lGL
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/JavaScriptCore/release/libJavaS=
criptCore.a(Lexer.o): In function `JSC::isNonLatin1IdentStart(int)':
> -Lexer.cpp:(.text+0x5): undefined reference to `u_charType_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/JavaScriptCore/release/libJavaS=
criptCore.a(Lexer.o): In function `JSC::isNonLatin1IdentPart(int)':
> -Lexer.cpp:(.text+0x24): undefined reference to `u_charType_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/JavaScriptCore/release/libJavaS=
criptCore.a(Lexer.o): In function `JSC::Lexer<unsigned short>::nextTokenIsC=
olon()':
> -Lexer.cpp:(.text._ZN3JSC5LexerItE16nextTokenIsColonEv[_ZN3JSC5LexerItE16=
nextTokenIsColonEv]+0x80): undefined reference to `u_charType_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/JavaScriptCore/release/libJavaS=
criptCore.a(Lexer.o): In function `JSC::Lexer<unsigned short>::lex(JSC::JST=
okenData*, JSC::JSTokenLocation*, unsigned int, bool)':
> -Lexer.cpp:(.text._ZN3JSC5LexerItE3lexEPNS_11JSTokenDataEPNS_15JSTokenLoc=
ationEjb[_ZN3JSC5LexerItE3lexEPNS_11JSTokenDataEPNS_15JSTokenLocationEjb]+0=
xb5): undefined reference to `u_charType_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebKit/release/libWebKit1.a(Fra=
meLoaderClientQt.o): In function `WTF::HashTable<WTF::AtomicString, WTF::Ke=
yValuePair<WTF::AtomicString, WTF::String>, WTF::KeyValuePairKeyExtractor<W=
TF::KeyValuePair<WTF::AtomicString, WTF::String> >, WTF::CaseFoldingHash, W=
TF::HashMapValueTraits<WTF::HashTraits<WTF::AtomicString>, WTF::HashTraits<=
WTF::String> >, WTF::HashTraits<WTF::AtomicString> >::rehash(int)':
> -FrameLoaderClientQt.cpp:(.text._ZN3WTF9HashTableINS_12AtomicStringENS_12=
KeyValuePairIS1_NS_6StringEEENS_24KeyValuePairKeyExtractorIS4_EENS_15CaseFo=
ldingHashENS_18HashMapValueTraitsINS_10HashTraitsIS1_EENS9_IS3_EEEESA_E6reh=
ashEi[_ZN3WTF9HashTableINS_12AtomicStringENS_12KeyValuePairIS1_NS_6StringEE=
ENS_24KeyValuePairKeyExtractorIS4_EENS_15CaseFoldingHashENS_18HashMapValueT=
raitsINS_10HashTraitsIS1_EENS9_IS3_EEEESA_E6rehashEi]+0xdc): undefined refe=
rence to `u_foldCase_51'
> -FrameLoaderClientQt.cpp:(.text._ZN3WTF9HashTableINS_12AtomicStringENS_12=
KeyValuePairIS1_NS_6StringEEENS_24KeyValuePairKeyExtractorIS4_EENS_15CaseFo=
ldingHashENS_18HashMapValueTraitsINS_10HashTraitsIS1_EENS9_IS3_EEEESA_E6reh=
ashEi[_ZN3WTF9HashTableINS_12AtomicStringENS_12KeyValuePairIS1_NS_6StringEE=
ENS_24KeyValuePairKeyExtractorIS4_EENS_15CaseFoldingHashENS_18HashMapValueT=
raitsINS_10HashTraitsIS1_EENS9_IS3_EEEESA_E6rehashEi]+0xf3): undefined refe=
rence to `u_foldCase_51'
> -FrameLoaderClientQt.cpp:(.text._ZN3WTF9HashTableINS_12AtomicStringENS_12=
KeyValuePairIS1_NS_6StringEEENS_24KeyValuePairKeyExtractorIS4_EENS_15CaseFo=
ldingHashENS_18HashMapValueTraitsINS_10HashTraitsIS1_EENS9_IS3_EEEESA_E6reh=
ashEi[_ZN3WTF9HashTableINS_12AtomicStringENS_12KeyValuePairIS1_NS_6StringEE=
ENS_24KeyValuePairKeyExtractorIS4_EENS_15CaseFoldingHashENS_18HashMapValueT=
raitsINS_10HashTraitsIS1_EENS9_IS3_EEEESA_E6rehashEi]+0x2fc): undefined ref=
erence to `u_foldCase_51'
> -FrameLoaderClientQt.cpp:(.text._ZN3WTF9HashTableINS_12AtomicStringENS_12=
KeyValuePairIS1_NS_6StringEEENS_24KeyValuePairKeyExtractorIS4_EENS_15CaseFo=
ldingHashENS_18HashMapValueTraitsINS_10HashTraitsIS1_EENS9_IS3_EEEESA_E6reh=
ashEi[_ZN3WTF9HashTableINS_12AtomicStringENS_12KeyValuePairIS1_NS_6StringEE=
ENS_24KeyValuePairKeyExtractorIS4_EENS_15CaseFoldingHashENS_18HashMapValueT=
raitsINS_10HashTraitsIS1_EENS9_IS3_EEEESA_E6rehashEi]+0x313): undefined ref=
erence to `u_foldCase_51'
> -FrameLoaderClientQt.cpp:(.text._ZN3WTF9HashTableINS_12AtomicStringENS_12=
KeyValuePairIS1_NS_6StringEEENS_24KeyValuePairKeyExtractorIS4_EENS_15CaseFo=
ldingHashENS_18HashMapValueTraitsINS_10HashTraitsIS1_EENS9_IS3_EEEESA_E6reh=
ashEi[_ZN3WTF9HashTableINS_12AtomicStringENS_12KeyValuePairIS1_NS_6StringEE=
ENS_24KeyValuePairKeyExtractorIS4_EENS_15CaseFoldingHashENS_18HashMapValueT=
raitsINS_10HashTraitsIS1_EENS9_IS3_EEEESA_E6rehashEi]+0x357): undefined ref=
erence to `u_foldCase_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebKit/release/libWebKit1.a(Fra=
meLoaderClientQt.o):FrameLoaderClientQt.cpp:(.text._ZN3WTF9HashTableINS_12A=
tomicStringENS_12KeyValuePairIS1_NS_6StringEEENS_24KeyValuePairKeyExtractor=
IS4_EENS_15CaseFoldingHashENS_18HashMapValueTraitsINS_10HashTraitsIS1_EENS9=
_IS3_EEEESA_E4findINS_22IdentityHashTranslatorIS7_EES1_EENS_17HashTableIter=
atorIS1_S4_S6_S7_SC_SA_EERKT0_[_ZN3WTF9HashTableINS_12AtomicStringENS_12Key=
ValuePairIS1_NS_6StringEEENS_24KeyValuePairKeyExtractorIS4_EENS_15CaseFoldi=
ngHashENS_18HashMapValueTraitsINS_10HashTraitsIS1_EENS9_IS3_EEEESA_E4findIN=
S_22IdentityHashTranslatorIS7_EES1_EENS_17HashTableIteratorIS1_S4_S6_S7_SC_=
SA_EERKT0_]+0x74): more undefined references to `u_foldCase_51' follow
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(Ty=
peAhead.o): In function `WebCore::TypeAhead::handleEvent(WebCore::KeyboardE=
vent*, unsigned int)':
> -TypeAhead.cpp:(.text._ZN7WebCore9TypeAhead11handleEventEPNS_13KeyboardEv=
entEj+0x511): undefined reference to `u_charDirection_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(Ca=
nvasRenderingContext2D.o): In function `WTF::isSpaceOrNewline(unsigned shor=
t)':
> -CanvasRenderingContext2D.cpp:(.text._ZN3WTFL16isSpaceOrNewlineEt+0x30): =
undefined reference to `u_charDirection_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(Cr=
ossOriginAccessControl.o): In function `WebCore::isOnAccessControlResponseH=
eaderWhitelist(WTF::String const&)':
> -CrossOriginAccessControl.cpp:(.text._ZN7WebCore40isOnAccessControlRespon=
seHeaderWhitelistERKN3WTF6StringE+0x8c): undefined reference to `u_foldCase=
_51'
> -CrossOriginAccessControl.cpp:(.text._ZN7WebCore40isOnAccessControlRespon=
seHeaderWhitelistERKN3WTF6StringE+0xa3): undefined reference to `u_foldCase=
_51'
> -CrossOriginAccessControl.cpp:(.text._ZN7WebCore40isOnAccessControlRespon=
seHeaderWhitelistERKN3WTF6StringE+0x1dc): undefined reference to `u_foldCas=
e_51'
> -CrossOriginAccessControl.cpp:(.text._ZN7WebCore40isOnAccessControlRespon=
seHeaderWhitelistERKN3WTF6StringE+0x1f3): undefined reference to `u_foldCas=
e_51'
> -CrossOriginAccessControl.cpp:(.text._ZN7WebCore40isOnAccessControlRespon=
seHeaderWhitelistERKN3WTF6StringE+0x226): undefined reference to `u_foldCas=
e_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(Cr=
ossOriginPreflightResultCache.o):CrossOriginPreflightResultCache.cpp:(.text=
=2E_ZNK7WebCore35CrossOriginPreflightResultCacheItem24allowsCrossOriginHead=
ersERKNS_13HTTPHeaderMapERN3WTF6StringE+0xac): more undefined references to=
 `u_foldCase_51' follow
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(Cr=
ossOriginPreflightResultCache.o): In function `void WebCore::addToAccessCon=
trolAllowList<WTF::StringHash>(WTF::String const&, unsigned int, unsigned i=
nt, WTF::HashSet<WTF::String, WTF::StringHash, WTF::HashTraits<WTF::String>=
 >&)':
> -CrossOriginPreflightResultCache.cpp:(.text._ZN7WebCoreL27addToAccessCont=
rolAllowListIN3WTF10StringHashEEEvRKNS1_6StringEjjRNS1_7HashSetIS3_T_NS1_10=
HashTraitsIS3_EEEE+0x3c): undefined reference to `u_charDirection_51'
> -CrossOriginPreflightResultCache.cpp:(.text._ZN7WebCoreL27addToAccessCont=
rolAllowListIN3WTF10StringHashEEEvRKNS1_6StringEjjRNS1_7HashSetIS3_T_NS1_10=
HashTraitsIS3_EEEE+0x19c): undefined reference to `u_charDirection_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(Cr=
ossOriginPreflightResultCache.o): In function `void WebCore::addToAccessCon=
trolAllowList<WTF::CaseFoldingHash>(WTF::String const&, unsigned int, unsig=
ned int, WTF::HashSet<WTF::String, WTF::CaseFoldingHash, WTF::HashTraits<WT=
F::String> >&)':
> -CrossOriginPreflightResultCache.cpp:(.text._ZN7WebCoreL27addToAccessCont=
rolAllowListIN3WTF15CaseFoldingHashEEEvRKNS1_6StringEjjRNS1_7HashSetIS3_T_N=
S1_10HashTraitsIS3_EEEE+0x3c): undefined reference to `u_charDirection_51'
> -CrossOriginPreflightResultCache.cpp:(.text._ZN7WebCoreL27addToAccessCont=
rolAllowListIN3WTF15CaseFoldingHashEEEvRKNS1_6StringEjjRNS1_7HashSetIS3_T_N=
S1_10HashTraitsIS3_EEEE+0x13c): undefined reference to `u_foldCase_51'
> -CrossOriginPreflightResultCache.cpp:(.text._ZN7WebCoreL27addToAccessCont=
rolAllowListIN3WTF15CaseFoldingHashEEEvRKNS1_6StringEjjRNS1_7HashSetIS3_T_N=
S1_10HashTraitsIS3_EEEE+0x153): undefined reference to `u_foldCase_51'
> -CrossOriginPreflightResultCache.cpp:(.text._ZN7WebCoreL27addToAccessCont=
rolAllowListIN3WTF15CaseFoldingHashEEEvRKNS1_6StringEjjRNS1_7HashSetIS3_T_N=
S1_10HashTraitsIS3_EEEE+0x254): undefined reference to `u_charDirection_51'
> -CrossOriginPreflightResultCache.cpp:(.text._ZN7WebCoreL27addToAccessCont=
rolAllowListIN3WTF15CaseFoldingHashEEEvRKNS1_6StringEjjRNS1_7HashSetIS3_T_N=
S1_10HashTraitsIS3_EEEE+0x2d4): undefined reference to `u_foldCase_51'
> -CrossOriginPreflightResultCache.cpp:(.text._ZN7WebCoreL27addToAccessCont=
rolAllowListIN3WTF15CaseFoldingHashEEEvRKNS1_6StringEjjRNS1_7HashSetIS3_T_N=
S1_10HashTraitsIS3_EEEE+0x2eb): undefined reference to `u_foldCase_51'
> -CrossOriginPreflightResultCache.cpp:(.text._ZN7WebCoreL27addToAccessCont=
rolAllowListIN3WTF15CaseFoldingHashEEEvRKNS1_6StringEjjRNS1_7HashSetIS3_T_N=
S1_10HashTraitsIS3_EEEE+0x327): undefined reference to `u_foldCase_51'
> -CrossOriginPreflightResultCache.cpp:(.text._ZN7WebCoreL27addToAccessCont=
rolAllowListIN3WTF15CaseFoldingHashEEEvRKNS1_6StringEjjRNS1_7HashSetIS3_T_N=
S1_10HashTraitsIS3_EEEE+0x45c): undefined reference to `u_foldCase_51'
> -CrossOriginPreflightResultCache.cpp:(.text._ZN7WebCoreL27addToAccessCont=
rolAllowListIN3WTF15CaseFoldingHashEEEvRKNS1_6StringEjjRNS1_7HashSetIS3_T_N=
S1_10HashTraitsIS3_EEEE+0x473): undefined reference to `u_foldCase_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(Cr=
ossOriginPreflightResultCache.o):CrossOriginPreflightResultCache.cpp:(.text=
=2E_ZN7WebCoreL27addToAccessControlAllowListIN3WTF15CaseFoldingHashEEEvRKNS=
1_6StringEjjRNS1_7HashSetIS3_T_NS1_10HashTraitsIS3_EEEE+0x5cc): more undefi=
ned references to `u_foldCase_51' follow
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(Co=
ntextMenuController.o): In function `WebCore::selectionContainsPossibleWord=
(WebCore::Frame*)':
> -ContextMenuController.cpp:(.text._ZN7WebCoreL29selectionContainsPossible=
WordEPNS_5FrameE+0x96): undefined reference to `u_charType_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(Fo=
ntGlyphs.o): In function `WebCore::FontGlyphs::glyphDataAndPageForCharacter=
(WebCore::FontDescription const&, int, bool, WebCore::FontDataVariant) cons=
t':
> -FontGlyphs.cpp:(.text._ZNK7WebCore10FontGlyphs28glyphDataAndPageForChara=
cterERKNS_15FontDescriptionEibNS_15FontDataVariantE+0x49d): undefined refer=
ence to `u_charMirror_51'
> -FontGlyphs.cpp:(.text._ZNK7WebCore10FontGlyphs28glyphDataAndPageForChara=
cterERKNS_15FontDescriptionEibNS_15FontDataVariantE+0x5b6): undefined refer=
ence to `u_toupper_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(Fo=
nt.o): In function `WebCore::Font::canReceiveTextEmphasis(int)':
> -Font.cpp:(.text._ZN7WebCore4Font22canReceiveTextEmphasisEi+0x4): undefin=
ed reference to `u_charType_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(Fo=
ntCache.o): In function `WTF::HashTableIterator<WebCore::FontPlatformDataCa=
cheKey, WTF::KeyValuePair<WebCore::FontPlatformDataCacheKey, WTF::OwnPtr<We=
bCore::FontPlatformData> >, WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair=
<WebCore::FontPlatformDataCacheKey, WTF::OwnPtr<WebCore::FontPlatformData> =
> >, WebCore::FontPlatformDataCacheKeyHash, WTF::HashMapValueTraits<WebCore=
::FontPlatformDataCacheKeyTraits, WTF::HashTraits<WTF::OwnPtr<WebCore::Font=
PlatformData> > >, WebCore::FontPlatformDataCacheKeyTraits> WTF::HashTable<=
WebCore::FontPlatformDataCacheKey, WTF::KeyValuePair<WebCore::FontPlatformD=
ataCacheKey, WTF::OwnPtr<WebCore::FontPlatformData> >, WTF::KeyValuePairKey=
Extractor<WTF::KeyValuePair<WebCore::FontPlatformDataCacheKey, WTF::OwnPtr<=
WebCore::FontPlatformData> > >, WebCore::FontPlatformDataCacheKeyHash, WTF:=
:HashMapValueTrai
>  ts<WebCo
>  re::FontPlatformDataCacheKeyTraits, WTF::HashTraits<WTF::OwnPtr<WebCore:=
:FontPlatformData> > >, WebCore::FontPlatformDataCacheKeyTraits>::find<WTF:=
:IdentityHashTranslator<WebCore::FontPlatformDataCacheKeyHash>, WebCore::Fo=
ntPlatformDataCacheKey>(WebCore::FontPlatformDataCacheKey const&)':
> -FontCache.cpp:(.text._ZN3WTF9HashTableIN7WebCore24FontPlatformDataCacheK=
eyENS_12KeyValuePairIS2_NS_6OwnPtrINS1_16FontPlatformDataEEEEENS_24KeyValue=
PairKeyExtractorIS7_EENS1_28FontPlatformDataCacheKeyHashENS_18HashMapValueT=
raitsINS1_30FontPlatformDataCacheKeyTraitsENS_10HashTraitsIS6_EEEESC_E4find=
INS_22IdentityHashTranslatorISA_EES2_EENS_17HashTableIteratorIS2_S7_S9_SA_S=
F_SC_EERKT0_[_ZN3WTF9HashTableIN7WebCore24FontPlatformDataCacheKeyENS_12Key=
ValuePairIS2_NS_6OwnPtrINS1_16FontPlatformDataEEEEENS_24KeyValuePairKeyExtr=
actorIS7_EENS1_28FontPlatformDataCacheKeyHashENS_18HashMapValueTraitsINS1_3=
0FontPlatformDataCacheKeyTraitsENS_10HashTraitsIS6_EEEESC_E4findINS_22Ident=
ityHashTranslatorISA_EES2_EENS_17HashTableIteratorIS2_S7_S9_SA_SF_SC_EERKT0=
_]+0xec): undefined reference to `u_foldCase_51'
> -FontCache.cpp:(.text._ZN3WTF9HashTableIN7WebCore24FontPlatformDataCacheK=
eyENS_12KeyValuePairIS2_NS_6OwnPtrINS1_16FontPlatformDataEEEEENS_24KeyValue=
PairKeyExtractorIS7_EENS1_28FontPlatformDataCacheKeyHashENS_18HashMapValueT=
raitsINS1_30FontPlatformDataCacheKeyTraitsENS_10HashTraitsIS6_EEEESC_E4find=
INS_22IdentityHashTranslatorISA_EES2_EENS_17HashTableIteratorIS2_S7_S9_SA_S=
F_SC_EERKT0_[_ZN3WTF9HashTableIN7WebCore24FontPlatformDataCacheKeyENS_12Key=
ValuePairIS2_NS_6OwnPtrINS1_16FontPlatformDataEEEEENS_24KeyValuePairKeyExtr=
actorIS7_EENS1_28FontPlatformDataCacheKeyHashENS_18HashMapValueTraitsINS1_3=
0FontPlatformDataCacheKeyTraitsENS_10HashTraitsIS6_EEEESC_E4findINS_22Ident=
ityHashTranslatorISA_EES2_EENS_17HashTableIteratorIS2_S7_S9_SA_SF_SC_EERKT0=
_]+0x100): undefined reference to `u_foldCase_51'
> -FontCache.cpp:(.text._ZN3WTF9HashTableIN7WebCore24FontPlatformDataCacheK=
eyENS_12KeyValuePairIS2_NS_6OwnPtrINS1_16FontPlatformDataEEEEENS_24KeyValue=
PairKeyExtractorIS7_EENS1_28FontPlatformDataCacheKeyHashENS_18HashMapValueT=
raitsINS1_30FontPlatformDataCacheKeyTraitsENS_10HashTraitsIS6_EEEESC_E4find=
INS_22IdentityHashTranslatorISA_EES2_EENS_17HashTableIteratorIS2_S7_S9_SA_S=
F_SC_EERKT0_[_ZN3WTF9HashTableIN7WebCore24FontPlatformDataCacheKeyENS_12Key=
ValuePairIS2_NS_6OwnPtrINS1_16FontPlatformDataEEEEENS_24KeyValuePairKeyExtr=
actorIS7_EENS1_28FontPlatformDataCacheKeyHashENS_18HashMapValueTraitsINS1_3=
0FontPlatformDataCacheKeyTraitsENS_10HashTraitsIS6_EEEESC_E4findINS_22Ident=
ityHashTranslatorISA_EES2_EENS_17HashTableIteratorIS2_S7_S9_SA_SF_SC_EERKT0=
_]+0x23c): undefined reference to `u_foldCase_51'
> -FontCache.cpp:(.text._ZN3WTF9HashTableIN7WebCore24FontPlatformDataCacheK=
eyENS_12KeyValuePairIS2_NS_6OwnPtrINS1_16FontPlatformDataEEEEENS_24KeyValue=
PairKeyExtractorIS7_EENS1_28FontPlatformDataCacheKeyHashENS_18HashMapValueT=
raitsINS1_30FontPlatformDataCacheKeyTraitsENS_10HashTraitsIS6_EEEESC_E4find=
INS_22IdentityHashTranslatorISA_EES2_EENS_17HashTableIteratorIS2_S7_S9_SA_S=
F_SC_EERKT0_[_ZN3WTF9HashTableIN7WebCore24FontPlatformDataCacheKeyENS_12Key=
ValuePairIS2_NS_6OwnPtrINS1_16FontPlatformDataEEEEENS_24KeyValuePairKeyExtr=
actorIS7_EENS1_28FontPlatformDataCacheKeyHashENS_18HashMapValueTraitsINS1_3=
0FontPlatformDataCacheKeyTraitsENS_10HashTraitsIS6_EEEESC_E4findINS_22Ident=
ityHashTranslatorISA_EES2_EENS_17HashTableIteratorIS2_S7_S9_SA_SF_SC_EERKT0=
_]+0x250): undefined reference to `u_foldCase_51'
> -FontCache.cpp:(.text._ZN3WTF9HashTableIN7WebCore24FontPlatformDataCacheK=
eyENS_12KeyValuePairIS2_NS_6OwnPtrINS1_16FontPlatformDataEEEEENS_24KeyValue=
PairKeyExtractorIS7_EENS1_28FontPlatformDataCacheKeyHashENS_18HashMapValueT=
raitsINS1_30FontPlatformDataCacheKeyTraitsENS_10HashTraitsIS6_EEEESC_E4find=
INS_22IdentityHashTranslatorISA_EES2_EENS_17HashTableIteratorIS2_S7_S9_SA_S=
F_SC_EERKT0_[_ZN3WTF9HashTableIN7WebCore24FontPlatformDataCacheKeyENS_12Key=
ValuePairIS2_NS_6OwnPtrINS1_16FontPlatformDataEEEEENS_24KeyValuePairKeyExtr=
actorIS7_EENS1_28FontPlatformDataCacheKeyHashENS_18HashMapValueTraitsINS1_3=
0FontPlatformDataCacheKeyTraitsENS_10HashTraitsIS6_EEEESC_E4findINS_22Ident=
ityHashTranslatorISA_EES2_EENS_17HashTableIteratorIS2_S7_S9_SA_SF_SC_EERKT0=
_]+0x27f): undefined reference to `u_foldCase_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(Fo=
ntCache.o):FontCache.cpp:(.text._ZN3WTF9HashTableIN7WebCore24FontPlatformDa=
taCacheKeyENS_12KeyValuePairIS2_NS_6OwnPtrINS1_16FontPlatformDataEEEEENS_24=
KeyValuePairKeyExtractorIS7_EENS1_28FontPlatformDataCacheKeyHashENS_18HashM=
apValueTraitsINS1_30FontPlatformDataCacheKeyTraitsENS_10HashTraitsIS6_EEEES=
C_E6rehashEi[_ZN3WTF9HashTableIN7WebCore24FontPlatformDataCacheKeyENS_12Key=
ValuePairIS2_NS_6OwnPtrINS1_16FontPlatformDataEEEEENS_24KeyValuePairKeyExtr=
actorIS7_EENS1_28FontPlatformDataCacheKeyHashENS_18HashMapValueTraitsINS1_3=
0FontPlatformDataCacheKeyTraitsENS_10HashTraitsIS6_EEEESC_E6rehashEi]+0x17d=
): more undefined references to `u_foldCase_51' follow
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(Gr=
aphicsContext.o): In function `WebCore::GraphicsContext::drawBidiText(WebCo=
re::Font const&, WebCore::TextRun const&, WebCore::FloatPoint const&, WebCo=
re::Font::CustomFontNotReadyAction)':
> -GraphicsContext.cpp:(.text._ZN7WebCore15GraphicsContext12drawBidiTextERK=
NS_4FontERKNS_7TextRunERKNS_10FloatPointENS1_24CustomFontNotReadyActionE+0x=
4de): undefined reference to `u_charDirection_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(SV=
GGlyph.o): In function `WebCore::charactersWithArabicForm(WTF::String const=
&, bool)':
> -SVGGlyph.cpp:(.text._ZN7WebCore24charactersWithArabicFormERKN3WTF6String=
Eb+0x59): undefined reference to `ublock_getCode_51'
> -SVGGlyph.cpp:(.text._ZN7WebCore24charactersWithArabicFormERKN3WTF6String=
Eb+0x8e): undefined reference to `ublock_getCode_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(Su=
rrogatePairAwareTextIterator.o): In function `WebCore::SurrogatePairAwareTe=
xtIterator::normalizeVoicingMarks()':
> -SurrogatePairAwareTextIterator.cpp:(.text._ZN7WebCore30SurrogatePairAwar=
eTextIterator21normalizeVoicingMarksEv+0x28): undefined reference to `u_get=
CombiningClass_51'
> -SurrogatePairAwareTextIterator.cpp:(.text._ZN7WebCore30SurrogatePairAwar=
eTextIterator21normalizeVoicingMarksEv+0x6d): undefined reference to `unorm=
_normalize_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(Wi=
dthIterator.o): In function `unsigned int WebCore::WidthIterator::advanceIn=
ternal<WebCore::SurrogatePairAwareTextIterator>(WebCore::SurrogatePairAware=
TextIterator&, WebCore::GlyphBuffer*)':
> -WidthIterator.cpp:(.text._ZN7WebCore13WidthIterator15advanceInternalINS_=
30SurrogatePairAwareTextIteratorEEEjRT_PNS_11GlyphBufferE[_ZN7WebCore13Widt=
hIterator15advanceInternalINS_30SurrogatePairAwareTextIteratorEEEjRT_PNS_11=
GlyphBufferE]+0x109e): undefined reference to `u_toupper_51'
> -WidthIterator.cpp:(.text._ZN7WebCore13WidthIterator15advanceInternalINS_=
30SurrogatePairAwareTextIteratorEEEjRT_PNS_11GlyphBufferE[_ZN7WebCore13Widt=
hIterator15advanceInternalINS_30SurrogatePairAwareTextIteratorEEEjRT_PNS_11=
GlyphBufferE]+0x10be): undefined reference to `u_toupper_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(Wi=
dthIterator.o): In function `unsigned int WebCore::WidthIterator::advanceIn=
ternal<WebCore::Latin1TextIterator>(WebCore::Latin1TextIterator&, WebCore::=
GlyphBuffer*)':
> -WidthIterator.cpp:(.text._ZN7WebCore13WidthIterator15advanceInternalINS_=
18Latin1TextIteratorEEEjRT_PNS_11GlyphBufferE[_ZN7WebCore13WidthIterator15a=
dvanceInternalINS_18Latin1TextIteratorEEEjRT_PNS_11GlyphBufferE]+0x106f): u=
ndefined reference to `u_toupper_51'
> -WidthIterator.cpp:(.text._ZN7WebCore13WidthIterator15advanceInternalINS_=
18Latin1TextIteratorEEEjRT_PNS_11GlyphBufferE[_ZN7WebCore13WidthIterator15a=
dvanceInternalINS_18Latin1TextIteratorEEEjRT_PNS_11GlyphBufferE]+0x108d): u=
ndefined reference to `u_toupper_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(KU=
RL.o): In function `WebCore::appendEncodedHostname(WTF::Vector<unsigned sho=
rt, 512ul, WTF::CrashOnOverflow>&, unsigned short const*, unsigned int) [cl=
one .part.54]':
> -KURL.cpp:(.text._ZN7WebCoreL21appendEncodedHostnameERN3WTF6VectorItLm512=
ENS0_15CrashOnOverflowEEEPKtj.part.54+0x39): undefined reference to `uidna_=
IDNToASCII_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(KU=
RL.o): In function `WTF::HashTable<WTF::String, WTF::KeyValuePair<WTF::Stri=
ng, unsigned int>, WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::Str=
ing, unsigned int> >, WTF::CaseFoldingHash, WTF::HashMapValueTraits<WTF::Ha=
shTraits<WTF::String>, WTF::HashTraits<unsigned int> >, WTF::HashTraits<WTF=
::String> >::rehash(int)':
> -KURL.cpp:(.text._ZN3WTF9HashTableINS_6StringENS_12KeyValuePairIS1_jEENS_=
24KeyValuePairKeyExtractorIS3_EENS_15CaseFoldingHashENS_18HashMapValueTrait=
sINS_10HashTraitsIS1_EENS8_IjEEEES9_E6rehashEi[_ZN3WTF9HashTableINS_6String=
ENS_12KeyValuePairIS1_jEENS_24KeyValuePairKeyExtractorIS3_EENS_15CaseFoldin=
gHashENS_18HashMapValueTraitsINS_10HashTraitsIS1_EENS8_IjEEEES9_E6rehashEi]=
+0xd4): undefined reference to `u_foldCase_51'
> -KURL.cpp:(.text._ZN3WTF9HashTableINS_6StringENS_12KeyValuePairIS1_jEENS_=
24KeyValuePairKeyExtractorIS3_EENS_15CaseFoldingHashENS_18HashMapValueTrait=
sINS_10HashTraitsIS1_EENS8_IjEEEES9_E6rehashEi[_ZN3WTF9HashTableINS_6String=
ENS_12KeyValuePairIS1_jEENS_24KeyValuePairKeyExtractorIS3_EENS_15CaseFoldin=
gHashENS_18HashMapValueTraitsINS_10HashTraitsIS1_EENS8_IjEEEES9_E6rehashEi]=
+0xeb): undefined reference to `u_foldCase_51'
> -KURL.cpp:(.text._ZN3WTF9HashTableINS_6StringENS_12KeyValuePairIS1_jEENS_=
24KeyValuePairKeyExtractorIS3_EENS_15CaseFoldingHashENS_18HashMapValueTrait=
sINS_10HashTraitsIS1_EENS8_IjEEEES9_E6rehashEi[_ZN3WTF9HashTableINS_6String=
ENS_12KeyValuePairIS1_jEENS_24KeyValuePairKeyExtractorIS3_EENS_15CaseFoldin=
gHashENS_18HashMapValueTraitsINS_10HashTraitsIS1_EENS8_IjEEEES9_E6rehashEi]=
+0x2ec): undefined reference to `u_foldCase_51'
> -KURL.cpp:(.text._ZN3WTF9HashTableINS_6StringENS_12KeyValuePairIS1_jEENS_=
24KeyValuePairKeyExtractorIS3_EENS_15CaseFoldingHashENS_18HashMapValueTrait=
sINS_10HashTraitsIS1_EENS8_IjEEEES9_E6rehashEi[_ZN3WTF9HashTableINS_6String=
ENS_12KeyValuePairIS1_jEENS_24KeyValuePairKeyExtractorIS3_EENS_15CaseFoldin=
gHashENS_18HashMapValueTraitsINS_10HashTraitsIS1_EENS8_IjEEEES9_E6rehashEi]=
+0x303): undefined reference to `u_foldCase_51'
> -KURL.cpp:(.text._ZN3WTF9HashTableINS_6StringENS_12KeyValuePairIS1_jEENS_=
24KeyValuePairKeyExtractorIS3_EENS_15CaseFoldingHashENS_18HashMapValueTrait=
sINS_10HashTraitsIS1_EENS8_IjEEEES9_E6rehashEi[_ZN3WTF9HashTableINS_6String=
ENS_12KeyValuePairIS1_jEENS_24KeyValuePairKeyExtractorIS3_EENS_15CaseFoldin=
gHashENS_18HashMapValueTraitsINS_10HashTraitsIS1_EENS8_IjEEEES9_E6rehashEi]=
+0x348): undefined reference to `u_foldCase_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(KU=
RL.o):KURL.cpp:(.text._ZN3WTF7HashMapINS_6StringEjNS_15CaseFoldingHashENS_1=
0HashTraitsIS1_EENS3_IjEEE3setERKS1_RKj[_ZN3WTF7HashMapINS_6StringEjNS_15Ca=
seFoldingHashENS_10HashTraitsIS1_EENS3_IjEEE3setERKS1_RKj]+0x7c): more unde=
fined references to `u_foldCase_51' follow
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(Le=
ngth.o): In function `WebCore::parseLength(unsigned short const*, unsigned =
int)':
> -Length.cpp:(.text._ZN7WebCoreL11parseLengthEPKtj+0x176): undefined refer=
ence to `u_charDirection_51'
> -Length.cpp:(.text._ZN7WebCoreL11parseLengthEPKtj+0x230): undefined refer=
ence to `u_charDirection_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(MI=
METypeRegistry.o): In function `WTF::HashTable<WTF::String, WTF::KeyValuePa=
ir<WTF::String, WTF::Vector<WTF::String, 0ul, WTF::CrashOnOverflow>*>, WTF:=
:KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String, WTF::Vector<WTF::S=
tring, 0ul, WTF::CrashOnOverflow>*> >, WTF::CaseFoldingHash, WTF::HashMapVa=
lueTraits<WTF::HashTraits<WTF::String>, WTF::HashTraits<WTF::Vector<WTF::St=
ring, 0ul, WTF::CrashOnOverflow>*> >, WTF::HashTraits<WTF::String> >::rehas=
h(int)':
> -MIMETypeRegistry.cpp:(.text._ZN3WTF9HashTableINS_6StringENS_12KeyValuePa=
irIS1_PNS_6VectorIS1_Lm0ENS_15CrashOnOverflowEEEEENS_24KeyValuePairKeyExtra=
ctorIS7_EENS_15CaseFoldingHashENS_18HashMapValueTraitsINS_10HashTraitsIS1_E=
ENSC_IS6_EEEESD_E6rehashEi[_ZN3WTF9HashTableINS_6StringENS_12KeyValuePairIS=
1_PNS_6VectorIS1_Lm0ENS_15CrashOnOverflowEEEEENS_24KeyValuePairKeyExtractor=
IS7_EENS_15CaseFoldingHashENS_18HashMapValueTraitsINS_10HashTraitsIS1_EENSC=
_IS6_EEEESD_E6rehashEi]+0xd4): undefined reference to `u_foldCase_51'
> -MIMETypeRegistry.cpp:(.text._ZN3WTF9HashTableINS_6StringENS_12KeyValuePa=
irIS1_PNS_6VectorIS1_Lm0ENS_15CrashOnOverflowEEEEENS_24KeyValuePairKeyExtra=
ctorIS7_EENS_15CaseFoldingHashENS_18HashMapValueTraitsINS_10HashTraitsIS1_E=
ENSC_IS6_EEEESD_E6rehashEi[_ZN3WTF9HashTableINS_6StringENS_12KeyValuePairIS=
1_PNS_6VectorIS1_Lm0ENS_15CrashOnOverflowEEEEENS_24KeyValuePairKeyExtractor=
IS7_EENS_15CaseFoldingHashENS_18HashMapValueTraitsINS_10HashTraitsIS1_EENSC=
_IS6_EEEESD_E6rehashEi]+0xeb): undefined reference to `u_foldCase_51'
> -MIMETypeRegistry.cpp:(.text._ZN3WTF9HashTableINS_6StringENS_12KeyValuePa=
irIS1_PNS_6VectorIS1_Lm0ENS_15CrashOnOverflowEEEEENS_24KeyValuePairKeyExtra=
ctorIS7_EENS_15CaseFoldingHashENS_18HashMapValueTraitsINS_10HashTraitsIS1_E=
ENSC_IS6_EEEESD_E6rehashEi[_ZN3WTF9HashTableINS_6StringENS_12KeyValuePairIS=
1_PNS_6VectorIS1_Lm0ENS_15CrashOnOverflowEEEEENS_24KeyValuePairKeyExtractor=
IS7_EENS_15CaseFoldingHashENS_18HashMapValueTraitsINS_10HashTraitsIS1_EENSC=
_IS6_EEEESD_E6rehashEi]+0x2fc): undefined reference to `u_foldCase_51'
> -MIMETypeRegistry.cpp:(.text._ZN3WTF9HashTableINS_6StringENS_12KeyValuePa=
irIS1_PNS_6VectorIS1_Lm0ENS_15CrashOnOverflowEEEEENS_24KeyValuePairKeyExtra=
ctorIS7_EENS_15CaseFoldingHashENS_18HashMapValueTraitsINS_10HashTraitsIS1_E=
ENSC_IS6_EEEESD_E6rehashEi[_ZN3WTF9HashTableINS_6StringENS_12KeyValuePairIS=
1_PNS_6VectorIS1_Lm0ENS_15CrashOnOverflowEEEEENS_24KeyValuePairKeyExtractor=
IS7_EENS_15CaseFoldingHashENS_18HashMapValueTraitsINS_10HashTraitsIS1_EENSC=
_IS6_EEEESD_E6rehashEi]+0x313): undefined reference to `u_foldCase_51'
> -MIMETypeRegistry.cpp:(.text._ZN3WTF9HashTableINS_6StringENS_12KeyValuePa=
irIS1_PNS_6VectorIS1_Lm0ENS_15CrashOnOverflowEEEEENS_24KeyValuePairKeyExtra=
ctorIS7_EENS_15CaseFoldingHashENS_18HashMapValueTraitsINS_10HashTraitsIS1_E=
ENSC_IS6_EEEESD_E6rehashEi[_ZN3WTF9HashTableINS_6StringENS_12KeyValuePairIS=
1_PNS_6VectorIS1_Lm0ENS_15CrashOnOverflowEEEEENS_24KeyValuePairKeyExtractor=
IS7_EENS_15CaseFoldingHashENS_18HashMapValueTraitsINS_10HashTraitsIS1_EENSC=
_IS6_EEEESD_E6rehashEi]+0x358): undefined reference to `u_foldCase_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(MI=
METypeRegistry.o):MIMETypeRegistry.cpp:(.text._ZN7WebCoreL16mediaMIMETypeMa=
pEv+0xcc): more undefined references to `u_foldCase_51' follow
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(HT=
TPParsers.o): In function `WebCore::extractMIMETypeFromMediaType(WTF::Strin=
g const&)':
> -HTTPParsers.cpp:(.text._ZN7WebCore28extractMIMETypeFromMediaTypeERKN3WTF=
6StringE+0x1a4): undefined reference to `u_charDirection_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(Re=
sourceRequestBase.o): In function `WebCore::ResourceRequestBase::setHTTPHea=
derField(WTF::AtomicString const&, WTF::String const&)':
> -ResourceRequestBase.cpp:(.text._ZN7WebCore19ResourceRequestBase18setHTTP=
HeaderFieldERKN3WTF12AtomicStringERKNS1_6StringE+0x9d): undefined reference=
 to `u_foldCase_51'
> -ResourceRequestBase.cpp:(.text._ZN7WebCore19ResourceRequestBase18setHTTP=
HeaderFieldERKN3WTF12AtomicStringERKNS1_6StringE+0xb5): undefined reference=
 to `u_foldCase_51'
> -ResourceRequestBase.cpp:(.text._ZN7WebCore19ResourceRequestBase18setHTTP=
HeaderFieldERKN3WTF12AtomicStringERKNS1_6StringE+0x31f): undefined referenc=
e to `u_foldCase_51'
> -ResourceRequestBase.cpp:(.text._ZN7WebCore19ResourceRequestBase18setHTTP=
HeaderFieldERKN3WTF12AtomicStringERKNS1_6StringE+0x36d): undefined referenc=
e to `u_foldCase_51'
> -ResourceRequestBase.cpp:(.text._ZN7WebCore19ResourceRequestBase18setHTTP=
HeaderFieldERKN3WTF12AtomicStringERKNS1_6StringE+0x385): undefined referenc=
e to `u_foldCase_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(Re=
sourceResponseBase.o):ResourceResponseBase.cpp:(.text._ZN7WebCore20Resource=
ResponseBase18setHTTPHeaderFieldERKN3WTF12AtomicStringERKNS1_6StringE+0x8c)=
: more undefined references to `u_foldCase_51' follow
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(XP=
athParser.o): In function `charCat(unsigned short) [clone .part.4]':
> -XPathParser.cpp:(.text._ZL7charCatt.part.4+0x8): undefined reference to =
`u_charType_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(XP=
athParser.o): In function `WebCore::XPath::Parser::skipWS()':
> -XPathParser.cpp:(.text._ZN7WebCore5XPath6Parser6skipWSEv+0x3d): undefine=
d reference to `u_charDirection_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(Sm=
artReplaceICU.o): In function `WebCore::addAllCodePoints(USet*, WTF::String=
 const&)':
> -SmartReplaceICU.cpp:(.text._ZN7WebCoreL16addAllCodePointsEP4USetRKN3WTF6=
StringE+0x46): undefined reference to `uset_add_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(Sm=
artReplaceICU.o): In function `WebCore::isCharacterSmartReplaceExempt(int, =
bool)':
> -SmartReplaceICU.cpp:(.text._ZN7WebCore29isCharacterSmartReplaceExemptEib=
+0x2b): undefined reference to `uset_contains_51'
> -SmartReplaceICU.cpp:(.text._ZN7WebCore29isCharacterSmartReplaceExemptEib=
+0x7e): undefined reference to `uset_openPattern_51'
> -SmartReplaceICU.cpp:(.text._ZN7WebCore29isCharacterSmartReplaceExemptEib=
+0x93): undefined reference to `uset_addRange_51'
> -SmartReplaceICU.cpp:(.text._ZN7WebCore29isCharacterSmartReplaceExemptEib=
+0xa5): undefined reference to `uset_addRange_51'
> -SmartReplaceICU.cpp:(.text._ZN7WebCore29isCharacterSmartReplaceExemptEib=
+0xb7): undefined reference to `uset_addRange_51'
> -SmartReplaceICU.cpp:(.text._ZN7WebCore29isCharacterSmartReplaceExemptEib=
+0xc9): undefined reference to `uset_addRange_51'
> -SmartReplaceICU.cpp:(.text._ZN7WebCore29isCharacterSmartReplaceExemptEib=
+0xdb): undefined reference to `uset_addRange_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(Sm=
artReplaceICU.o):SmartReplaceICU.cpp:(.text._ZN7WebCore29isCharacterSmartRe=
placeExemptEib+0xed): more undefined references to `uset_addRange_51' follow
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(Sm=
artReplaceICU.o): In function `WebCore::isCharacterSmartReplaceExempt(int, =
bool)':
> -SmartReplaceICU.cpp:(.text._ZN7WebCore29isCharacterSmartReplaceExemptEib=
+0x209): undefined reference to `uset_openPattern_51'
> -SmartReplaceICU.cpp:(.text._ZN7WebCore29isCharacterSmartReplaceExemptEib=
+0x217): undefined reference to `uset_addAll_51'
> -SmartReplaceICU.cpp:(.text._ZN7WebCore29isCharacterSmartReplaceExemptEib=
+0x21f): undefined reference to `uset_close_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(Ar=
chiveFactory.o): In function `WTF::HashTable<WTF::String, WTF::KeyValuePair=
<WTF::String, WTF::PassRefPtr<WebCore::Archive> (*)(WebCore::KURL const&, W=
ebCore::SharedBuffer*)>, WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WT=
F::String, WTF::PassRefPtr<WebCore::Archive> (*)(WebCore::KURL const&, WebC=
ore::SharedBuffer*)> >, WTF::CaseFoldingHash, WTF::HashMapValueTraits<WTF::=
HashTraits<WTF::String>, WTF::HashTraits<WTF::PassRefPtr<WebCore::Archive> =
(*)(WebCore::KURL const&, WebCore::SharedBuffer*)> >, WTF::HashTraits<WTF::=
String> >::rehash(int)':
> -ArchiveFactory.cpp:(.text._ZN3WTF9HashTableINS_6StringENS_12KeyValuePair=
IS1_PFNS_10PassRefPtrIN7WebCore7ArchiveEEERKNS4_4KURLEPNS4_12SharedBufferEE=
EENS_24KeyValuePairKeyExtractorISE_EENS_15CaseFoldingHashENS_18HashMapValue=
TraitsINS_10HashTraitsIS1_EENSJ_ISD_EEEESK_E6rehashEi[_ZN3WTF9HashTableINS_=
6StringENS_12KeyValuePairIS1_PFNS_10PassRefPtrIN7WebCore7ArchiveEEERKNS4_4K=
URLEPNS4_12SharedBufferEEEENS_24KeyValuePairKeyExtractorISE_EENS_15CaseFold=
ingHashENS_18HashMapValueTraitsINS_10HashTraitsIS1_EENSJ_ISD_EEEESK_E6rehas=
hEi]+0xd4): undefined reference to `u_foldCase_51'
> -ArchiveFactory.cpp:(.text._ZN3WTF9HashTableINS_6StringENS_12KeyValuePair=
IS1_PFNS_10PassRefPtrIN7WebCore7ArchiveEEERKNS4_4KURLEPNS4_12SharedBufferEE=
EENS_24KeyValuePairKeyExtractorISE_EENS_15CaseFoldingHashENS_18HashMapValue=
TraitsINS_10HashTraitsIS1_EENSJ_ISD_EEEESK_E6rehashEi[_ZN3WTF9HashTableINS_=
6StringENS_12KeyValuePairIS1_PFNS_10PassRefPtrIN7WebCore7ArchiveEEERKNS4_4K=
URLEPNS4_12SharedBufferEEEENS_24KeyValuePairKeyExtractorISE_EENS_15CaseFold=
ingHashENS_18HashMapValueTraitsINS_10HashTraitsIS1_EENSJ_ISD_EEEESK_E6rehas=
hEi]+0xeb): undefined reference to `u_foldCase_51'
> -ArchiveFactory.cpp:(.text._ZN3WTF9HashTableINS_6StringENS_12KeyValuePair=
IS1_PFNS_10PassRefPtrIN7WebCore7ArchiveEEERKNS4_4KURLEPNS4_12SharedBufferEE=
EENS_24KeyValuePairKeyExtractorISE_EENS_15CaseFoldingHashENS_18HashMapValue=
TraitsINS_10HashTraitsIS1_EENSJ_ISD_EEEESK_E6rehashEi[_ZN3WTF9HashTableINS_=
6StringENS_12KeyValuePairIS1_PFNS_10PassRefPtrIN7WebCore7ArchiveEEERKNS4_4K=
URLEPNS4_12SharedBufferEEEENS_24KeyValuePairKeyExtractorISE_EENS_15CaseFold=
ingHashENS_18HashMapValueTraitsINS_10HashTraitsIS1_EENSJ_ISD_EEEESK_E6rehas=
hEi]+0x2ec): undefined reference to `u_foldCase_51'
> -ArchiveFactory.cpp:(.text._ZN3WTF9HashTableINS_6StringENS_12KeyValuePair=
IS1_PFNS_10PassRefPtrIN7WebCore7ArchiveEEERKNS4_4KURLEPNS4_12SharedBufferEE=
EENS_24KeyValuePairKeyExtractorISE_EENS_15CaseFoldingHashENS_18HashMapValue=
TraitsINS_10HashTraitsIS1_EENSJ_ISD_EEEESK_E6rehashEi[_ZN3WTF9HashTableINS_=
6StringENS_12KeyValuePairIS1_PFNS_10PassRefPtrIN7WebCore7ArchiveEEERKNS4_4K=
URLEPNS4_12SharedBufferEEEENS_24KeyValuePairKeyExtractorISE_EENS_15CaseFold=
ingHashENS_18HashMapValueTraitsINS_10HashTraitsIS1_EENSJ_ISD_EEEESK_E6rehas=
hEi]+0x303): undefined reference to `u_foldCase_51'
> -ArchiveFactory.cpp:(.text._ZN3WTF9HashTableINS_6StringENS_12KeyValuePair=
IS1_PFNS_10PassRefPtrIN7WebCore7ArchiveEEERKNS4_4KURLEPNS4_12SharedBufferEE=
EENS_24KeyValuePairKeyExtractorISE_EENS_15CaseFoldingHashENS_18HashMapValue=
TraitsINS_10HashTraitsIS1_EENSJ_ISD_EEEESK_E6rehashEi[_ZN3WTF9HashTableINS_=
6StringENS_12KeyValuePairIS1_PFNS_10PassRefPtrIN7WebCore7ArchiveEEERKNS4_4K=
URLEPNS4_12SharedBufferEEEENS_24KeyValuePairKeyExtractorISE_EENS_15CaseFold=
ingHashENS_18HashMapValueTraitsINS_10HashTraitsIS1_EENSJ_ISD_EEEESK_E6rehas=
hEi]+0x348): undefined reference to `u_foldCase_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(Ar=
chiveFactory.o):ArchiveFactory.cpp:(.text._ZN3WTF9HashTableINS_6StringENS_1=
2KeyValuePairIS1_PFNS_10PassRefPtrIN7WebCore7ArchiveEEERKNS4_4KURLEPNS4_12S=
haredBufferEEEENS_24KeyValuePairKeyExtractorISE_EENS_15CaseFoldingHashENS_1=
8HashMapValueTraitsINS_10HashTraitsIS1_EENSJ_ISD_EEEESK_E4findINS_22Identit=
yHashTranslatorISH_EES1_EENS_17HashTableIteratorIS1_SE_SG_SH_SM_SK_EERKT0_[=
_ZN3WTF9HashTableINS_6StringENS_12KeyValuePairIS1_PFNS_10PassRefPtrIN7WebCo=
re7ArchiveEEERKNS4_4KURLEPNS4_12SharedBufferEEEENS_24KeyValuePairKeyExtract=
orISE_EENS_15CaseFoldingHashENS_18HashMapValueTraitsINS_10HashTraitsIS1_EEN=
SJ_ISD_EEEESK_E4findINS_22IdentityHashTranslatorISH_EES1_EENS_17HashTableIt=
eratorIS1_SE_SG_SH_SM_SK_EERKT0_]+0x74): more undefined references to `u_fo=
ldCase_51' follow
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(SV=
GAllInOne.o): In function `WebCore::SVGFontData::createStringWithMirroredCh=
aracters(unsigned short const*, unsigned int) const':
> -SVGAllInOne.cpp:(.text._ZNK7WebCore11SVGFontData34createStringWithMirror=
edCharactersEPKtj+0x129): undefined reference to `u_charMirror_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(In=
spectorAllInOne.o): In function `WebCore::(anonymous namespace)::parseToken=
(unsigned short const*, unsigned short const*, unsigned short const**, unsi=
gned short const**)':
> -InspectorAllInOne.cpp:(.text._ZN7WebCore12_GLOBAL__N_110parseTokenEPKtS2=
_PS2_S3_+0x49): undefined reference to `u_charDirection_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(In=
spectorAllInOne.o): In function `WebCore::InspectorStyleTextEditor::interna=
lReplaceProperty(WebCore::InspectorStyleProperty const&, WTF::String const&=
, WebCore::SourceRange*, unsigned int*)':
> -InspectorAllInOne.cpp:(.text._ZN7WebCore24InspectorStyleTextEditor23inte=
rnalReplacePropertyERKNS_22InspectorStylePropertyERKN3WTF6StringEPNS_11Sour=
ceRangeEPj+0x43a): undefined reference to `u_charDirection_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(In=
spectorAllInOne.o): In function `WebCore::InspectorResourceAgent::willLoadX=
HR(WebCore::ThreadableLoaderClient*, WTF::String const&, WebCore::KURL cons=
t&, bool, WTF::PassRefPtr<WebCore::FormData>, WebCore::HTTPHeaderMap const&=
, bool)':
> -InspectorAllInOne.cpp:(.text._ZN7WebCore22InspectorResourceAgent11willLo=
adXHREPNS_22ThreadableLoaderClientERKN3WTF6StringERKNS_4KURLEbNS3_10PassRef=
PtrINS_8FormDataEEERKNS_13HTTPHeaderMapEb+0x12c): undefined reference to `u=
_foldCase_51'
> -InspectorAllInOne.cpp:(.text._ZN7WebCore22InspectorResourceAgent11willLo=
adXHREPNS_22ThreadableLoaderClientERKN3WTF6StringERKNS_4KURLEbNS3_10PassRef=
PtrINS_8FormDataEEERKNS_13HTTPHeaderMapEb+0x13b): undefined reference to `u=
_foldCase_51'
> -InspectorAllInOne.cpp:(.text._ZN7WebCore22InspectorResourceAgent11willLo=
adXHREPNS_22ThreadableLoaderClientERKN3WTF6StringERKNS_4KURLEbNS3_10PassRef=
PtrINS_8FormDataEEERKNS_13HTTPHeaderMapEb+0x3cc): undefined reference to `u=
_foldCase_51'
> -InspectorAllInOne.cpp:(.text._ZN7WebCore22InspectorResourceAgent11willLo=
adXHREPNS_22ThreadableLoaderClientERKN3WTF6StringERKNS_4KURLEbNS3_10PassRef=
PtrINS_8FormDataEEERKNS_13HTTPHeaderMapEb+0x3db): undefined reference to `u=
_foldCase_51'
> -InspectorAllInOne.cpp:(.text._ZN7WebCore22InspectorResourceAgent11willLo=
adXHREPNS_22ThreadableLoaderClientERKN3WTF6StringERKNS_4KURLEbNS3_10PassRef=
PtrINS_8FormDataEEERKNS_13HTTPHeaderMapEb+0x411): undefined reference to `u=
_foldCase_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(Te=
xtAllInOne.o): In function `WebCore::setUpIterator(bool&, WebCore::TextBrea=
kIterator*&, UBreakIteratorType, unsigned short const*, int)':
> -TextAllInOne.cpp:(.text._ZN7WebCoreL13setUpIteratorERbRPNS_17TextBreakIt=
eratorE18UBreakIteratorTypePKti+0x3e): undefined reference to `ubrk_setText=
_51'
> -TextAllInOne.cpp:(.text._ZN7WebCoreL13setUpIteratorERbRPNS_17TextBreakIt=
eratorE18UBreakIteratorTypePKti+0x80): undefined reference to `ubrk_open_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(Te=
xtAllInOne.o): In function `WebCore::gbkCallbackEscape(void const*, UConver=
terFromUnicodeArgs*, unsigned short const*, int, int, UConverterCallbackRea=
son, UErrorCode*)':
> -TextAllInOne.cpp:(.text._ZN7WebCoreL17gbkCallbackEscapeEPKvP25UConverter=
=46romUnicodeArgsPKtii24UConverterCallbackReasonP10UErrorCode+0x5d): undefi=
ned reference to `ucnv_cbFromUWriteUChars_51'
> -TextAllInOne.cpp:(.text._ZN7WebCoreL17gbkCallbackEscapeEPKvP25UConverter=
=46romUnicodeArgsPKtii24UConverterCallbackReasonP10UErrorCode+0x90): undefi=
ned reference to `UCNV_FROM_U_CALLBACK_ESCAPE_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(Te=
xtAllInOne.o): In function `WebCore::gbkCallbackSubstitute(void const*, UCo=
nverterFromUnicodeArgs*, unsigned short const*, int, int, UConverterCallbac=
kReason, UErrorCode*)':
> -TextAllInOne.cpp:(.text._ZN7WebCoreL21gbkCallbackSubstituteEPKvP25UConve=
rterFromUnicodeArgsPKtii24UConverterCallbackReasonP10UErrorCode+0x5d): unde=
fined reference to `ucnv_cbFromUWriteUChars_51'
> -TextAllInOne.cpp:(.text._ZN7WebCoreL21gbkCallbackSubstituteEPKvP25UConve=
rterFromUnicodeArgsPKtii24UConverterCallbackReasonP10UErrorCode+0x98): unde=
fined reference to `UCNV_FROM_U_CALLBACK_SUBSTITUTE_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(Te=
xtAllInOne.o): In function `WebCore::textClone(UText*, UText const*, signed=
 char, UErrorCode*)':
> -TextAllInOne.cpp:(.text._ZN7WebCoreL9textCloneEP5UTextPKS0_aP10UErrorCod=
e+0x27): undefined reference to `utext_setup_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(Te=
xtAllInOne.o): In function `WebCore::endOfFirstWordBoundaryContext(unsigned=
 short const*, int)':
> -TextAllInOne.cpp:(.text._ZN7WebCore29endOfFirstWordBoundaryContextEPKti+=
0x26): undefined reference to `u_getIntPropertyValue_51'
> -TextAllInOne.cpp:(.text._ZN7WebCore29endOfFirstWordBoundaryContextEPKti+=
0x84): undefined reference to `u_getIntPropertyValue_51'
> -TextAllInOne.cpp:(.text._ZN7WebCore29endOfFirstWordBoundaryContextEPKti+=
0xa6): undefined reference to `u_getIntPropertyValue_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(Te=
xtAllInOne.o): In function `WebCore::startOfLastWordBoundaryContext(unsigne=
d short const*, int)':
> -TextAllInOne.cpp:(.text._ZN7WebCore30startOfLastWordBoundaryContextEPKti=
+0x1e): undefined reference to `u_getIntPropertyValue_51'
> -TextAllInOne.cpp:(.text._ZN7WebCore30startOfLastWordBoundaryContextEPKti=
+0x77): undefined reference to `u_getIntPropertyValue_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(Te=
xtAllInOne.o):TextAllInOne.cpp:(.text._ZN7WebCore30startOfLastWordBoundaryC=
ontextEPKti+0x96): more undefined references to `u_getIntPropertyValue_51' =
follow
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(Te=
xtAllInOne.o): In function `WebCore::NonSharedCharacterBreakIterator::~NonS=
haredCharacterBreakIterator()':
> -TextAllInOne.cpp:(.text._ZN7WebCore31NonSharedCharacterBreakIteratorD2Ev=
+0x24): undefined reference to `ubrk_close_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(Te=
xtAllInOne.o): In function `WebCore::numGraphemeClusters(WTF::String const&=
)':
> -TextAllInOne.cpp:(.text._ZN7WebCore19numGraphemeClustersERKN3WTF6StringE=
+0x48): undefined reference to `ubrk_next_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(Te=
xtAllInOne.o): In function `WebCore::numCharactersInGraphemeClusters(WTF::S=
tring const&, unsigned int)':
> -TextAllInOne.cpp:(.text._ZN7WebCore31numCharactersInGraphemeClustersERKN=
3WTF6StringEj+0x9d): undefined reference to `ubrk_next_51'
> -TextAllInOne.cpp:(.text._ZN7WebCore31numCharactersInGraphemeClustersERKN=
3WTF6StringEj+0xe9): undefined reference to `ubrk_current_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(Te=
xtAllInOne.o): In function `WebCore::textBreakFirst(WebCore::TextBreakItera=
tor*)':
> -TextAllInOne.cpp:(.text._ZN7WebCore14textBreakFirstEPNS_17TextBreakItera=
torE+0x1): undefined reference to `ubrk_first_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(Te=
xtAllInOne.o): In function `WebCore::textBreakNext(WebCore::TextBreakIterat=
or*)':
> -TextAllInOne.cpp:(.text._ZN7WebCore13textBreakNextEPNS_17TextBreakIterat=
orE+0x1): undefined reference to `ubrk_next_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(Te=
xtAllInOne.o): In function `WebCore::textBreakPreceding(WebCore::TextBreakI=
terator*, int)':
> -TextAllInOne.cpp:(.text._ZN7WebCore18textBreakPrecedingEPNS_17TextBreakI=
teratorEi+0x1): undefined reference to `ubrk_preceding_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(Te=
xtAllInOne.o): In function `WebCore::textBreakFollowing(WebCore::TextBreakI=
terator*, int)':
> -TextAllInOne.cpp:(.text._ZN7WebCore18textBreakFollowingEPNS_17TextBreakI=
teratorEi+0x1): undefined reference to `ubrk_following_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(Te=
xtAllInOne.o): In function `WebCore::textBreakCurrent(WebCore::TextBreakIte=
rator*)':
> -TextAllInOne.cpp:(.text._ZN7WebCore16textBreakCurrentEPNS_17TextBreakIte=
ratorE+0x1): undefined reference to `ubrk_current_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(Te=
xtAllInOne.o): In function `WebCore::isTextBreak(WebCore::TextBreakIterator=
*, int)':
> -TextAllInOne.cpp:(.text._ZN7WebCore11isTextBreakEPNS_17TextBreakIterator=
Ei+0x5): undefined reference to `ubrk_isBoundary_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(Te=
xtAllInOne.o): In function `WebCore::isWordTextBreak(WebCore::TextBreakIter=
ator*)':
> -TextAllInOne.cpp:(.text._ZN7WebCore15isWordTextBreakEPNS_17TextBreakIter=
atorE+0x5): undefined reference to `ubrk_getRuleStatus_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(Te=
xtAllInOne.o): In function `WebCore::cursorMovementIterator(unsigned short =
const*, int)':
> -TextAllInOne.cpp:(.text._ZN7WebCore22cursorMovementIteratorEPKti+0x43): =
undefined reference to `ubrk_setText_51'
> -TextAllInOne.cpp:(.text._ZN7WebCore22cursorMovementIteratorEPKti+0xb3): =
undefined reference to `ubrk_openRules_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(Te=
xtAllInOne.o): In function `WebCore::urlEscapedEntityCallback(void const*, =
UConverterFromUnicodeArgs*, unsigned short const*, int, int, UConverterCall=
backReason, UErrorCode*)':
> -TextAllInOne.cpp:(.text._ZN7WebCoreL24urlEscapedEntityCallbackEPKvP25UCo=
nverterFromUnicodeArgsPKtii24UConverterCallbackReasonP10UErrorCode+0x1a): u=
ndefined reference to `UCNV_FROM_U_CALLBACK_ESCAPE_51'
> -TextAllInOne.cpp:(.text._ZN7WebCoreL24urlEscapedEntityCallbackEPKvP25UCo=
nverterFromUnicodeArgsPKtii24UConverterCallbackReasonP10UErrorCode+0x59): u=
ndefined reference to `ucnv_cbFromUWriteBytes_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(Te=
xtAllInOne.o): In function `WebCore::gbkUrlEscapedEntityCallack(void const*=
, UConverterFromUnicodeArgs*, unsigned short const*, int, int, UConverterCa=
llbackReason, UErrorCode*)':
> -TextAllInOne.cpp:(.text._ZN7WebCoreL26gbkUrlEscapedEntityCallackEPKvP25U=
ConverterFromUnicodeArgsPKtii24UConverterCallbackReasonP10UErrorCode+0x65):=
 undefined reference to `ucnv_cbFromUWriteUChars_51'
> -TextAllInOne.cpp:(.text._ZN7WebCoreL26gbkUrlEscapedEntityCallackEPKvP25U=
ConverterFromUnicodeArgsPKtii24UConverterCallbackReasonP10UErrorCode+0x9d):=
 undefined reference to `UCNV_FROM_U_CALLBACK_ESCAPE_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(Te=
xtAllInOne.o): In function `WebCore::ICUConverterWrapper::~ICUConverterWrap=
per()':
> -TextAllInOne.cpp:(.text._ZN7WebCore19ICUConverterWrapperD2Ev+0x9): undef=
ined reference to `ucnv_close_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(Te=
xtAllInOne.o): In function `WebCore::TextCodecICU::registerEncodingNames(vo=
id (*)(char const*, char const*))':
> -TextAllInOne.cpp:(.text._ZN7WebCore12TextCodecICU21registerEncodingNames=
EPFvPKcS2_E+0x21): undefined reference to `ucnv_countAvailable_51'
> -TextAllInOne.cpp:(.text._ZN7WebCore12TextCodecICU21registerEncodingNames=
EPFvPKcS2_E+0x56): undefined reference to `ucnv_getStandardName_51'
> -TextAllInOne.cpp:(.text._ZN7WebCore12TextCodecICU21registerEncodingNames=
EPFvPKcS2_E+0x7e): undefined reference to `ucnv_getAvailableName_51'
> -TextAllInOne.cpp:(.text._ZN7WebCore12TextCodecICU21registerEncodingNames=
EPFvPKcS2_E+0x9b): undefined reference to `ucnv_getStandardName_51'
> -TextAllInOne.cpp:(.text._ZN7WebCore12TextCodecICU21registerEncodingNames=
EPFvPKcS2_E+0x136): undefined reference to `ucnv_countAliases_51'
> -TextAllInOne.cpp:(.text._ZN7WebCore12TextCodecICU21registerEncodingNames=
EPFvPKcS2_E+0x182): undefined reference to `ucnv_getAlias_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(Te=
xtAllInOne.o): In function `WebCore::TextCodecICU::registerCodecs(void (*)(=
char const*, WTF::PassOwnPtr<WebCore::TextCodec> (*)(WebCore::TextEncoding =
const&, void const*), void const*))':
> -TextAllInOne.cpp:(.text._ZN7WebCore12TextCodecICU14registerCodecsEPFvPKc=
PFN3WTF10PassOwnPtrINS_9TextCodecEEERKNS_12TextEncodingEPKvESB_E+0x38): und=
efined reference to `ucnv_getCanonicalName_51'
> -TextAllInOne.cpp:(.text._ZN7WebCore12TextCodecICU14registerCodecsEPFvPKc=
PFN3WTF10PassOwnPtrINS_9TextCodecEEERKNS_12TextEncodingEPKvESB_E+0x51): und=
efined reference to `ucnv_countAvailable_51'
> -TextAllInOne.cpp:(.text._ZN7WebCore12TextCodecICU14registerCodecsEPFvPKc=
PFN3WTF10PassOwnPtrINS_9TextCodecEEERKNS_12TextEncodingEPKvESB_E+0x7e): und=
efined reference to `ucnv_getStandardName_51'
> -TextAllInOne.cpp:(.text._ZN7WebCore12TextCodecICU14registerCodecsEPFvPKc=
PFN3WTF10PassOwnPtrINS_9TextCodecEEERKNS_12TextEncodingEPKvESB_E+0xa0): und=
efined reference to `ucnv_getAvailableName_51'
> -TextAllInOne.cpp:(.text._ZN7WebCore12TextCodecICU14registerCodecsEPFvPKc=
PFN3WTF10PassOwnPtrINS_9TextCodecEEERKNS_12TextEncodingEPKvESB_E+0xbd): und=
efined reference to `ucnv_getStandardName_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(Te=
xtAllInOne.o): In function `WebCore::TextCodecICU::releaseICUConverter() co=
nst':
> -TextAllInOne.cpp:(.text._ZNK7WebCore12TextCodecICU19releaseICUConverterE=
v+0x42): undefined reference to `ucnv_close_51'
> -TextAllInOne.cpp:(.text._ZNK7WebCore12TextCodecICU19releaseICUConverterE=
v+0x4b): undefined reference to `ucnv_reset_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(Te=
xtAllInOne.o): In function `WebCore::TextCodecICU::createICUConverter() con=
st':
> -TextAllInOne.cpp:(.text._ZNK7WebCore12TextCodecICU18createICUConverterEv=
+0x79): undefined reference to `ucnv_getName_51'
> -TextAllInOne.cpp:(.text._ZNK7WebCore12TextCodecICU18createICUConverterEv=
+0x95): undefined reference to `ucnv_open_51'
> -TextAllInOne.cpp:(.text._ZNK7WebCore12TextCodecICU18createICUConverterEv=
+0xab): undefined reference to `ucnv_setFallback_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(Te=
xtAllInOne.o): In function `WebCore::TextCodecICU::decode(char const*, unsi=
gned long, bool, bool, bool&)':
> -TextAllInOne.cpp:(.text._ZN7WebCore12TextCodecICU6decodeEPKcmbbRb+0x49):=
 undefined reference to `UCNV_TO_U_CALLBACK_SUBSTITUTE_51'
> -TextAllInOne.cpp:(.text._ZN7WebCore12TextCodecICU6decodeEPKcmbbRb+0x73):=
 undefined reference to `ucnv_setToUCallBack_51'
> -TextAllInOne.cpp:(.text._ZN7WebCore12TextCodecICU6decodeEPKcmbbRb+0x122)=
: undefined reference to `ucnv_toUnicode_51'
> -TextAllInOne.cpp:(.text._ZN7WebCore12TextCodecICU6decodeEPKcmbbRb+0x183)=
: undefined reference to `ucnv_toUnicode_51'
> -TextAllInOne.cpp:(.text._ZN7WebCore12TextCodecICU6decodeEPKcmbbRb+0x25d)=
: undefined reference to `ucnv_setToUCallBack_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(Te=
xtAllInOne.o): In function `WebCore::TextEncoding::encode(unsigned short co=
nst*, unsigned long, WebCore::UnencodableHandling) const':
> -TextAllInOne.cpp:(.text._ZNK7WebCore12TextEncoding6encodeEPKtmNS_19Unenc=
odableHandlingE+0x68): undefined reference to `unorm_quickCheck_51'
> -TextAllInOne.cpp:(.text._ZNK7WebCore12TextEncoding6encodeEPKtmNS_19Unenc=
odableHandlingE+0x9d): undefined reference to `unorm_normalize_51'
> -TextAllInOne.cpp:(.text._ZNK7WebCore12TextEncoding6encodeEPKtmNS_19Unenc=
odableHandlingE+0x1bf): undefined reference to `unorm_normalize_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(Te=
xtAllInOne.o): In function `WebCore::TextCodecICU::encode(unsigned short co=
nst*, unsigned long, WebCore::UnencodableHandling)':
> -TextAllInOne.cpp:(.text._ZN7WebCore12TextCodecICU6encodeEPKtmNS_19Unenco=
dableHandlingE+0x13f): undefined reference to `ucnv_fromUnicode_51'
> -TextAllInOne.cpp:(.text._ZN7WebCore12TextCodecICU6encodeEPKtmNS_19Unenco=
dableHandlingE+0x198): undefined reference to `UCNV_FROM_U_CALLBACK_ESCAPE_=
51'
> -TextAllInOne.cpp:(.text._ZN7WebCore12TextCodecICU6encodeEPKtmNS_19Unenco=
dableHandlingE+0x1b5): undefined reference to `ucnv_setFromUCallBack_51'
> -TextAllInOne.cpp:(.text._ZN7WebCore12TextCodecICU6encodeEPKtmNS_19Unenco=
dableHandlingE+0x31c): undefined reference to `ucnv_setSubstChars_51'
> -TextAllInOne.cpp:(.text._ZN7WebCore12TextCodecICU6encodeEPKtmNS_19Unenco=
dableHandlingE+0x330): undefined reference to `UCNV_FROM_U_CALLBACK_SUBSTIT=
UTE_51'
> -TextAllInOne.cpp:(.text._ZN7WebCore12TextCodecICU6encodeEPKtmNS_19Unenco=
dableHandlingE+0x343): undefined reference to `ucnv_setFromUCallBack_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(Te=
xtAllInOne.o): In function `WebCore::acquireLineBreakIterator(unsigned char=
 const*, int, WTF::AtomicString const&, unsigned short const*, unsigned int=
)':
> -TextAllInOne.cpp:(.text._ZN7WebCore24acquireLineBreakIteratorEPKhiRKN3WT=
F12AtomicStringEPKtj+0x174): undefined reference to `utext_setup_51'
> -TextAllInOne.cpp:(.text._ZN7WebCore24acquireLineBreakIteratorEPKhiRKN3WT=
F12AtomicStringEPKtj+0x1c9): undefined reference to `ubrk_setUText_51'
> -TextAllInOne.cpp:(.text._ZN7WebCore24acquireLineBreakIteratorEPKhiRKN3WT=
F12AtomicStringEPKtj+0x1dd): undefined reference to `utext_close_51'
> -TextAllInOne.cpp:(.text._ZN7WebCore24acquireLineBreakIteratorEPKhiRKN3WT=
F12AtomicStringEPKtj+0x2ac): undefined reference to `ubrk_open_51'
> -TextAllInOne.cpp:(.text._ZN7WebCore24acquireLineBreakIteratorEPKhiRKN3WT=
F12AtomicStringEPKtj+0x356): undefined reference to `ubrk_open_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(Te=
xtAllInOne.o): In function `WebCore::acquireLineBreakIterator(unsigned shor=
t const*, int, WTF::AtomicString const&, unsigned short const*, unsigned in=
t)':
> -TextAllInOne.cpp:(.text._ZN7WebCore24acquireLineBreakIteratorEPKtiRKN3WT=
F12AtomicStringES1_j+0x168): undefined reference to `utext_setup_51'
> -TextAllInOne.cpp:(.text._ZN7WebCore24acquireLineBreakIteratorEPKtiRKN3WT=
F12AtomicStringES1_j+0x1bd): undefined reference to `ubrk_setUText_51'
> -TextAllInOne.cpp:(.text._ZN7WebCore24acquireLineBreakIteratorEPKtiRKN3WT=
F12AtomicStringES1_j+0x1d1): undefined reference to `utext_close_51'
> -TextAllInOne.cpp:(.text._ZN7WebCore24acquireLineBreakIteratorEPKtiRKN3WT=
F12AtomicStringES1_j+0x29c): undefined reference to `ubrk_open_51'
> -TextAllInOne.cpp:(.text._ZN7WebCore24acquireLineBreakIteratorEPKtiRKN3WT=
F12AtomicStringES1_j+0x346): undefined reference to `ubrk_open_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(Te=
xtAllInOne.o): In function `WebCore::releaseLineBreakIterator(WebCore::Text=
BreakIterator*)':
> -TextAllInOne.cpp:(.text._ZN7WebCore24releaseLineBreakIteratorEPNS_17Text=
BreakIteratorE+0x190): undefined reference to `ubrk_close_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(Te=
xtAllInOne.o): In function `WebCore::detectTextEncoding(char const*, unsign=
ed long, char const*, WebCore::TextEncoding*)':
> -TextAllInOne.cpp:(.text._ZN7WebCore18detectTextEncodingEPKcmS1_PNS_12Tex=
tEncodingE+0x40): undefined reference to `ucsdet_open_51'
> -TextAllInOne.cpp:(.text._ZN7WebCore18detectTextEncodingEPKcmS1_PNS_12Tex=
tEncodingE+0x6c): undefined reference to `ucsdet_enableInputFilter_51'
> -TextAllInOne.cpp:(.text._ZN7WebCore18detectTextEncodingEPKcmS1_PNS_12Tex=
tEncodingE+0x7d): undefined reference to `ucsdet_setText_51'
> -TextAllInOne.cpp:(.text._ZN7WebCore18detectTextEncodingEPKcmS1_PNS_12Tex=
tEncodingE+0x95): undefined reference to `ucsdet_detectAll_51'
> -TextAllInOne.cpp:(.text._ZN7WebCore18detectTextEncodingEPKcmS1_PNS_12Tex=
tEncodingE+0x100): undefined reference to `ucsdet_getConfidence_51'
> -TextAllInOne.cpp:(.text._ZN7WebCore18detectTextEncodingEPKcmS1_PNS_12Tex=
tEncodingE+0x118): undefined reference to `ucsdet_getName_51'
> -TextAllInOne.cpp:(.text._ZN7WebCore18detectTextEncodingEPKcmS1_PNS_12Tex=
tEncodingE+0x14d): undefined reference to `ucsdet_close_51'
> -TextAllInOne.cpp:(.text._ZN7WebCore18detectTextEncodingEPKcmS1_PNS_12Tex=
tEncodingE+0x16c): undefined reference to `ucsdet_getName_51'
> -TextAllInOne.cpp:(.text._ZN7WebCore18detectTextEncodingEPKcmS1_PNS_12Tex=
tEncodingE+0x197): undefined reference to `ucsdet_close_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(HT=
MLElementsAllInOne.o): In function `WTF::StringImpl** WTF::HashTable<WTF::S=
tringImpl*, WTF::StringImpl*, WTF::IdentityExtractor, WTF::CaseFoldingHash,=
 WTF::HashTraits<WTF::StringImpl*>, WTF::HashTraits<WTF::StringImpl*> >::lo=
okup<WTF::IdentityHashTranslator<WTF::CaseFoldingHash>, WTF::StringImpl*>(W=
TF::StringImpl* const&)':
> -HTMLElementsAllInOne.cpp:(.text._ZN3WTF9HashTableIPNS_10StringImplES2_NS=
_17IdentityExtractorENS_15CaseFoldingHashENS_10HashTraitsIS2_EES6_E6lookupI=
NS_22IdentityHashTranslatorIS4_EES2_EEPS2_RKT0_[_ZN3WTF9HashTableIPNS_10Str=
ingImplES2_NS_17IdentityExtractorENS_15CaseFoldingHashENS_10HashTraitsIS2_E=
ES6_E6lookupINS_22IdentityHashTranslatorIS4_EES2_EEPS2_RKT0_]+0x64): undefi=
ned reference to `u_foldCase_51'
> -HTMLElementsAllInOne.cpp:(.text._ZN3WTF9HashTableIPNS_10StringImplES2_NS=
_17IdentityExtractorENS_15CaseFoldingHashENS_10HashTraitsIS2_EES6_E6lookupI=
NS_22IdentityHashTranslatorIS4_EES2_EEPS2_RKT0_[_ZN3WTF9HashTableIPNS_10Str=
ingImplES2_NS_17IdentityExtractorENS_15CaseFoldingHashENS_10HashTraitsIS2_E=
ES6_E6lookupINS_22IdentityHashTranslatorIS4_EES2_EEPS2_RKT0_]+0x7b): undefi=
ned reference to `u_foldCase_51'
> -HTMLElementsAllInOne.cpp:(.text._ZN3WTF9HashTableIPNS_10StringImplES2_NS=
_17IdentityExtractorENS_15CaseFoldingHashENS_10HashTraitsIS2_EES6_E6lookupI=
NS_22IdentityHashTranslatorIS4_EES2_EEPS2_RKT0_[_ZN3WTF9HashTableIPNS_10Str=
ingImplES2_NS_17IdentityExtractorENS_15CaseFoldingHashENS_10HashTraitsIS2_E=
ES6_E6lookupINS_22IdentityHashTranslatorIS4_EES2_EEPS2_RKT0_]+0x197): undef=
ined reference to `u_foldCase_51'
> -HTMLElementsAllInOne.cpp:(.text._ZN3WTF9HashTableIPNS_10StringImplES2_NS=
_17IdentityExtractorENS_15CaseFoldingHashENS_10HashTraitsIS2_EES6_E6lookupI=
NS_22IdentityHashTranslatorIS4_EES2_EEPS2_RKT0_[_ZN3WTF9HashTableIPNS_10Str=
ingImplES2_NS_17IdentityExtractorENS_15CaseFoldingHashENS_10HashTraitsIS2_E=
ES6_E6lookupINS_22IdentityHashTranslatorIS4_EES2_EEPS2_RKT0_]+0x1fc): undef=
ined reference to `u_foldCase_51'
> -HTMLElementsAllInOne.cpp:(.text._ZN3WTF9HashTableIPNS_10StringImplES2_NS=
_17IdentityExtractorENS_15CaseFoldingHashENS_10HashTraitsIS2_EES6_E6lookupI=
NS_22IdentityHashTranslatorIS4_EES2_EEPS2_RKT0_[_ZN3WTF9HashTableIPNS_10Str=
ingImplES2_NS_17IdentityExtractorENS_15CaseFoldingHashENS_10HashTraitsIS2_E=
ES6_E6lookupINS_22IdentityHashTranslatorIS4_EES2_EEPS2_RKT0_]+0x20b): undef=
ined reference to `u_foldCase_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(HT=
MLElementsAllInOne.o):HTMLElementsAllInOne.cpp:(.text._ZN3WTF9HashTableIPNS=
_10StringImplES2_NS_17IdentityExtractorENS_15CaseFoldingHashENS_10HashTrait=
sIS2_EES6_E6lookupINS_22IdentityHashTranslatorIS4_EES2_EEPS2_RKT0_[_ZN3WTF9=
HashTableIPNS_10StringImplES2_NS_17IdentityExtractorENS_15CaseFoldingHashEN=
S_10HashTraitsIS2_EES6_E6lookupINS_22IdentityHashTranslatorIS4_EES2_EEPS2_R=
KT0_]+0x286): more undefined references to `u_foldCase_51' follow
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(HT=
MLElementsAllInOne.o): In function `WebCore::HTMLSelectElement::defaultEven=
tHandler(WebCore::Event*)':
> -HTMLElementsAllInOne.cpp:(.text._ZN7WebCore17HTMLSelectElement19defaultE=
ventHandlerEPNS_5EventE+0xbe): undefined reference to `u_isprint_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(HT=
MLElementsAllInOne.o): In function `WTF::HashTable<WTF::StringImpl*, WTF::S=
tringImpl*, WTF::IdentityExtractor, WTF::CaseFoldingHash, WTF::HashTraits<W=
TF::StringImpl*>, WTF::HashTraits<WTF::StringImpl*> >::rehash(int)':
> -HTMLElementsAllInOne.cpp:(.text._ZN3WTF9HashTableIPNS_10StringImplES2_NS=
_17IdentityExtractorENS_15CaseFoldingHashENS_10HashTraitsIS2_EES6_E6rehashE=
i[_ZN3WTF9HashTableIPNS_10StringImplES2_NS_17IdentityExtractorENS_15CaseFol=
dingHashENS_10HashTraitsIS2_EES6_E6rehashEi]+0xd4): undefined reference to =
`u_foldCase_51'
> -HTMLElementsAllInOne.cpp:(.text._ZN3WTF9HashTableIPNS_10StringImplES2_NS=
_17IdentityExtractorENS_15CaseFoldingHashENS_10HashTraitsIS2_EES6_E6rehashE=
i[_ZN3WTF9HashTableIPNS_10StringImplES2_NS_17IdentityExtractorENS_15CaseFol=
dingHashENS_10HashTraitsIS2_EES6_E6rehashEi]+0xeb): undefined reference to =
`u_foldCase_51'
> -HTMLElementsAllInOne.cpp:(.text._ZN3WTF9HashTableIPNS_10StringImplES2_NS=
_17IdentityExtractorENS_15CaseFoldingHashENS_10HashTraitsIS2_EES6_E6rehashE=
i[_ZN3WTF9HashTableIPNS_10StringImplES2_NS_17IdentityExtractorENS_15CaseFol=
dingHashENS_10HashTraitsIS2_EES6_E6rehashEi]+0x11e): undefined reference to=
 `u_foldCase_51'
> -HTMLElementsAllInOne.cpp:(.text._ZN3WTF9HashTableIPNS_10StringImplES2_NS=
_17IdentityExtractorENS_15CaseFoldingHashENS_10HashTraitsIS2_EES6_E6rehashE=
i[_ZN3WTF9HashTableIPNS_10StringImplES2_NS_17IdentityExtractorENS_15CaseFol=
dingHashENS_10HashTraitsIS2_EES6_E6rehashEi]+0x2ac): undefined reference to=
 `u_foldCase_51'
> -HTMLElementsAllInOne.cpp:(.text._ZN3WTF9HashTableIPNS_10StringImplES2_NS=
_17IdentityExtractorENS_15CaseFoldingHashENS_10HashTraitsIS2_EES6_E6rehashE=
i[_ZN3WTF9HashTableIPNS_10StringImplES2_NS_17IdentityExtractorENS_15CaseFol=
dingHashENS_10HashTraitsIS2_EES6_E6rehashEi]+0x2c3): undefined reference to=
 `u_foldCase_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(HT=
MLElementsAllInOne.o):HTMLElementsAllInOne.cpp:(.text._ZN3WTF9HashTableIPNS=
_10StringImplES2_NS_17IdentityExtractorENS_15CaseFoldingHashENS_10HashTrait=
sIS2_EES6_E6rehashEi[_ZN3WTF9HashTableIPNS_10StringImplES2_NS_17IdentityExt=
ractorENS_15CaseFoldingHashENS_10HashTraitsIS2_EES6_E6rehashEi]+0x337): mor=
e undefined references to `u_foldCase_51' follow
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(Ed=
itingAllInOne.o): In function `WebCore::searcher()':
> -EditingAllInOne.cpp:(.text._ZN7WebCoreL8searcherEv+0xba): undefined refe=
rence to `usearch_open_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(Ed=
itingAllInOne.o): In function `WebCore::normalizeCharacters(unsigned short =
const*, unsigned int, WTF::Vector<unsigned short, 0ul, WTF::CrashOnOverflow=
>&)':
> -EditingAllInOne.cpp:(.text._ZN7WebCoreL19normalizeCharactersEPKtjRN3WTF6=
VectorItLm0ENS2_15CrashOnOverflowEEE+0x4c): undefined reference to `unorm_n=
ormalize_51'
> -EditingAllInOne.cpp:(.text._ZN7WebCoreL19normalizeCharactersEPKtjRN3WTF6=
VectorItLm0ENS2_15CrashOnOverflowEEE+0xa3): undefined reference to `unorm_n=
ormalize_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(Ed=
itingAllInOne.o): In function `WebCore::SearchBuffer::search(unsigned long&=
)':
> -EditingAllInOne.cpp:(.text._ZN7WebCore12SearchBuffer6searchERm[_ZN7WebCo=
re12SearchBuffer6searchERm]+0x55): undefined reference to `usearch_setText_=
51'
> -EditingAllInOne.cpp:(.text._ZN7WebCore12SearchBuffer6searchERm[_ZN7WebCo=
re12SearchBuffer6searchERm]+0x63): undefined reference to `usearch_setOffse=
t_51'
> -EditingAllInOne.cpp:(.text._ZN7WebCore12SearchBuffer6searchERm[_ZN7WebCo=
re12SearchBuffer6searchERm]+0x6e): undefined reference to `usearch_next_51'
> -EditingAllInOne.cpp:(.text._ZN7WebCore12SearchBuffer6searchERm[_ZN7WebCo=
re12SearchBuffer6searchERm]+0xb7): undefined reference to `usearch_getMatch=
edLength_51'
> -EditingAllInOne.cpp:(.text._ZN7WebCore12SearchBuffer6searchERm[_ZN7WebCo=
re12SearchBuffer6searchERm]+0x1d7): undefined reference to `usearch_next_51'
> -EditingAllInOne.cpp:(.text._ZN7WebCore12SearchBuffer6searchERm[_ZN7WebCo=
re12SearchBuffer6searchERm]+0x7b4): undefined reference to `u_charType_51'
> -EditingAllInOne.cpp:(.text._ZN7WebCore12SearchBuffer6searchERm[_ZN7WebCo=
re12SearchBuffer6searchERm]+0x8f2): undefined reference to `u_charType_51'
> -EditingAllInOne.cpp:(.text._ZN7WebCore12SearchBuffer6searchERm[_ZN7WebCo=
re12SearchBuffer6searchERm]+0x9c4): undefined reference to `u_charType_51'
> -EditingAllInOne.cpp:(.text._ZN7WebCore12SearchBuffer6searchERm[_ZN7WebCo=
re12SearchBuffer6searchERm]+0xad8): undefined reference to `u_charType_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(Ed=
itingAllInOne.o): In function `WTF::HashTable<WTF::String, WTF::KeyValuePai=
r<WTF::String, WebCore::EditorInternalCommand const*>, WTF::KeyValuePairKey=
Extractor<WTF::KeyValuePair<WTF::String, WebCore::EditorInternalCommand con=
st*> >, WTF::CaseFoldingHash, WTF::HashMapValueTraits<WTF::HashTraits<WTF::=
String>, WTF::HashTraits<WebCore::EditorInternalCommand const*> >, WTF::Has=
hTraits<WTF::String> >::rehash(int)':
> -EditingAllInOne.cpp:(.text._ZN3WTF9HashTableINS_6StringENS_12KeyValuePai=
rIS1_PKN7WebCore21EditorInternalCommandEEENS_24KeyValuePairKeyExtractorIS7_=
EENS_15CaseFoldingHashENS_18HashMapValueTraitsINS_10HashTraitsIS1_EENSC_IS6=
_EEEESD_E6rehashEi[_ZN3WTF9HashTableINS_6StringENS_12KeyValuePairIS1_PKN7We=
bCore21EditorInternalCommandEEENS_24KeyValuePairKeyExtractorIS7_EENS_15Case=
FoldingHashENS_18HashMapValueTraitsINS_10HashTraitsIS1_EENSC_IS6_EEEESD_E6r=
ehashEi]+0xd4): undefined reference to `u_foldCase_51'
> -EditingAllInOne.cpp:(.text._ZN3WTF9HashTableINS_6StringENS_12KeyValuePai=
rIS1_PKN7WebCore21EditorInternalCommandEEENS_24KeyValuePairKeyExtractorIS7_=
EENS_15CaseFoldingHashENS_18HashMapValueTraitsINS_10HashTraitsIS1_EENSC_IS6=
_EEEESD_E6rehashEi[_ZN3WTF9HashTableINS_6StringENS_12KeyValuePairIS1_PKN7We=
bCore21EditorInternalCommandEEENS_24KeyValuePairKeyExtractorIS7_EENS_15Case=
FoldingHashENS_18HashMapValueTraitsINS_10HashTraitsIS1_EENSC_IS6_EEEESD_E6r=
ehashEi]+0xeb): undefined reference to `u_foldCase_51'
> -EditingAllInOne.cpp:(.text._ZN3WTF9HashTableINS_6StringENS_12KeyValuePai=
rIS1_PKN7WebCore21EditorInternalCommandEEENS_24KeyValuePairKeyExtractorIS7_=
EENS_15CaseFoldingHashENS_18HashMapValueTraitsINS_10HashTraitsIS1_EENSC_IS6=
_EEEESD_E6rehashEi[_ZN3WTF9HashTableINS_6StringENS_12KeyValuePairIS1_PKN7We=
bCore21EditorInternalCommandEEENS_24KeyValuePairKeyExtractorIS7_EENS_15Case=
FoldingHashENS_18HashMapValueTraitsINS_10HashTraitsIS1_EENSC_IS6_EEEESD_E6r=
ehashEi]+0x2ec): undefined reference to `u_foldCase_51'
> -EditingAllInOne.cpp:(.text._ZN3WTF9HashTableINS_6StringENS_12KeyValuePai=
rIS1_PKN7WebCore21EditorInternalCommandEEENS_24KeyValuePairKeyExtractorIS7_=
EENS_15CaseFoldingHashENS_18HashMapValueTraitsINS_10HashTraitsIS1_EENSC_IS6=
_EEEESD_E6rehashEi[_ZN3WTF9HashTableINS_6StringENS_12KeyValuePairIS1_PKN7We=
bCore21EditorInternalCommandEEENS_24KeyValuePairKeyExtractorIS7_EENS_15Case=
FoldingHashENS_18HashMapValueTraitsINS_10HashTraitsIS1_EENSC_IS6_EEEESD_E6r=
ehashEi]+0x303): undefined reference to `u_foldCase_51'
> -EditingAllInOne.cpp:(.text._ZN3WTF9HashTableINS_6StringENS_12KeyValuePai=
rIS1_PKN7WebCore21EditorInternalCommandEEENS_24KeyValuePairKeyExtractorIS7_=
EENS_15CaseFoldingHashENS_18HashMapValueTraitsINS_10HashTraitsIS1_EENSC_IS6=
_EEEESD_E6rehashEi[_ZN3WTF9HashTableINS_6StringENS_12KeyValuePairIS1_PKN7We=
bCore21EditorInternalCommandEEENS_24KeyValuePairKeyExtractorIS7_EENS_15Case=
FoldingHashENS_18HashMapValueTraitsINS_10HashTraitsIS1_EENSC_IS6_EEEESD_E6r=
ehashEi]+0x348): undefined reference to `u_foldCase_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(Ed=
itingAllInOne.o):EditingAllInOne.cpp:(.text._ZN7WebCoreL15internalCommandER=
KN3WTF6StringE+0x8c): more undefined references to `u_foldCase_51' follow
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(Ed=
itingAllInOne.o): In function `WebCore::findPlainText(WebCore::Range const*=
, WTF::String const&, unsigned int)':
> -EditingAllInOne.cpp:(.text._ZN7WebCore13findPlainTextEPKNS_5RangeERKN3WT=
F6StringEj+0x539): undefined reference to `usearch_getCollator_51'
> -EditingAllInOne.cpp:(.text._ZN7WebCore13findPlainTextEPKNS_5RangeERKN3WT=
F6StringEj+0x555): undefined reference to `ucol_getStrength_51'
> -EditingAllInOne.cpp:(.text._ZN7WebCore13findPlainTextEPKNS_5RangeERKN3WT=
F6StringEj+0x565): undefined reference to `ucol_setStrength_51'
> -EditingAllInOne.cpp:(.text._ZN7WebCore13findPlainTextEPKNS_5RangeERKN3WT=
F6StringEj+0x56d): undefined reference to `usearch_reset_51'
> -EditingAllInOne.cpp:(.text._ZN7WebCore13findPlainTextEPKNS_5RangeERKN3WT=
F6StringEj+0x5a1): undefined reference to `usearch_setPattern_51'
> -EditingAllInOne.cpp:(.text._ZN7WebCore13findPlainTextEPKNS_5RangeERKN3WT=
F6StringEj+0x75f): undefined reference to `usearch_setPattern_51'
> -EditingAllInOne.cpp:(.text._ZN7WebCore13findPlainTextEPKNS_5RangeERKN3WT=
F6StringEj+0xf29): undefined reference to `u_charType_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(Ed=
itingAllInOne.o): In function `WebCore::VisibleSelection::appendTrailingWhi=
tespace()':
> -EditingAllInOne.cpp:(.text._ZN7WebCore16VisibleSelection24appendTrailing=
WhitespaceEv+0x305): undefined reference to `u_charDirection_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(Ed=
itingAllInOne.o): In function `WebCore::WordAwareIterator::advance()':
> -EditingAllInOne.cpp:(.text._ZN7WebCore17WordAwareIterator7advanceEv+0x34=
1): undefined reference to `u_charDirection_51'
> -EditingAllInOne.cpp:(.text._ZN7WebCore17WordAwareIterator7advanceEv+0x3a=
9): undefined reference to `u_charDirection_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(Ed=
itingAllInOne.o): In function `WebCore::previousBoundary(WebCore::VisiblePo=
sition const&, unsigned int (*)(unsigned short const*, unsigned int, unsign=
ed int, WebCore::BoundarySearchContextAvailability, bool&))':
> -EditingAllInOne.cpp:(.text._ZN7WebCoreL16previousBoundaryERKNS_15Visible=
PositionEPFjPKtjjNS_33BoundarySearchContextAvailabilityERbE+0x1a0): undefin=
ed reference to `u_getIntPropertyValue_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(Ed=
itingAllInOne.o): In function `WebCore::nextBoundary(WebCore::VisiblePositi=
on const&, unsigned int (*)(unsigned short const*, unsigned int, unsigned i=
nt, WebCore::BoundarySearchContextAvailability, bool&))':
> -EditingAllInOne.cpp:(.text._ZN7WebCoreL12nextBoundaryERKNS_15VisiblePosi=
tionEPFjPKtjjNS_33BoundarySearchContextAvailabilityERbE+0xe1): undefined re=
ference to `u_getIntPropertyValue_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWebCore.a(Ed=
itingAllInOne.o): In function `WebCore::Editor::insertTextWithoutSendingTex=
tEvent(WTF::String const&, bool, WebCore::TextEvent*)':
> -EditingAllInOne.cpp:(.text._ZN7WebCore6Editor33insertTextWithoutSendingT=
extEventERKN3WTF6StringEbPNS_9TextEventE+0x3cb): undefined reference to `u_=
ispunct_51'
> -EditingAllInOne.cpp:(.text._ZN7WebCore6Editor33insertTextWithoutSendingT=
extEventERKN3WTF6StringEbPNS_9TextEventE+0x3d8): undefined reference to `u_=
charDirection_51'
> -/OE/build/oe-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.99+5.2.0-=
beta1+gitAUTOINC+2761751eca-r0/build/Source/WebCore/release/libWe
> -...
> -
> -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ----
> - Source/JavaScriptCore/jsc.pro | 2 ++
> - Source/api.pri                | 2 ++
> - 2 files changed, 4 insertions(+)
> -
> -diff --git a/Source/JavaScriptCore/jsc.pro b/Source/JavaScriptCore/jsc.p=
ro
> -index dfd73e8..ef6e55d 100644
> ---- a/Source/JavaScriptCore/jsc.pro
> -+++ b/Source/JavaScriptCore/jsc.pro
> -@@ -27,6 +27,8 @@ wince* {
> -     LIBS +=3D mmtimer.lib
> - }
> -=20
> -+LIBS +=3D "-licuuc -licui18n"
> -+
> - # Prevent warnings about difference in visibility on Mac OS X
> - contains(QT_CONFIG, reduce_exports):CONFIG +=3D hide_symbols
> - unix:contains(QT_CONFIG, reduce_relocations):CONFIG +=3D bsymbolic_func=
tions
> -diff --git a/Source/api.pri b/Source/api.pri
> -index ccd206c..39c56dd 100644
> ---- a/Source/api.pri
> -+++ b/Source/api.pri
> -@@ -29,6 +29,8 @@ use?(3D_GRAPHICS): WEBKIT +=3D angle
> - MODULE =3D webkit
> - CONFIG +=3D creating_module
> -=20
> -+LIBS +=3D "-licuuc -licui18n"
> -+
> - # This is the canonical list of dependencies for the public API of
> - # the QtWebKit library, and will end up in the library's prl file.
> - QT_API_DEPENDS =3D core gui network
> ---=20
> -1.8.4.3
> -
> --=20
> 1.8.3.2
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--r/w8vo2lxBmCPGjQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLoF3AACgkQN1Ujt2V2gBxkvACgul0Z1pGTN2cDWAiRlwUJzI+a
W18AoLhQ5yPRhJ3/2lYBYANBp1JozNAZ
=VjpD
-----END PGP SIGNATURE-----

--r/w8vo2lxBmCPGjQ--
