Return-Path: <u.oelmann@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C898BC4332F
	for <webhook@archiver.kernel.org>; Thu, 17 Nov 2022 13:54:33 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web10.15966.1668693263987809784
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Nov 2022 05:54:25 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: u.oelmann@pengutronix.de)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <u.oelmann@pengutronix.de>)
	id 1ovfLS-0000dP-3c; Thu, 17 Nov 2022 14:54:22 +0100
Received: from uol by dude.hi.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <u.oelmann@pengutronix.de>)
	id 1ovfLQ-007BLh-Ak; Thu, 17 Nov 2022 14:54:20 +0100
References: <17241B287E5C02A4.4885@lists.openembedded.org>
 <172632770EC1009A.18795@lists.openembedded.org>
User-agent: mu4e 1.6.9; emacs 29.0.50
From: Ulrich =?utf-8?Q?=C3=96lmann?= <u.oelmann@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Henning Heinold <henning@itconsulting-heinold.de>, Otavio Salvador
 <otavio@ossystems.com.br>, Richard Leitner <richard.leitner@skidata.com>
Subject: Re: [oe] [meta-java][PATCH] openjdk-8: refresh patches
Date: Thu, 17 Nov 2022 14:51:40 +0100
In-reply-to: <172632770EC1009A.18795@lists.openembedded.org>
Message-ID: <6rk03t4rg3.fsf@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: u.oelmann@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Nov 2022 13:54:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99606

Again a gentle ping!

On Thu, Nov 10 2022 at 11:27 +0100, Ulrich =C3=96lmann <u.oelmann@pengutron=
ix.de> wrote:
> Gentle ping!
>
> On Thu, Nov 03 2022 at 16:00 +0100, Ulrich =C3=96lmann <u.oelmann@pengutr=
onix.de> wrote:
>> Signed-off-by: Ulrich =C3=96lmann <u.oelmann@pengutronix.de>
>> ---
>>  .../0013-autoconf-remove-Werror.patch         | 22 +++++++++----------
>>  ...pot-Turn-on-the-Wreturn-type-warning.patch | 20 ++++++++---------
>>  .../1010-hotspot-fix-shark-build-common.patch | 12 +++++-----
>>  .../1012-hotspot-enable-Wno-error.patch       |  4 ++--
>>  4 files changed, 29 insertions(+), 29 deletions(-)
>>
>> diff --git a/recipes-core/openjdk/patches-openjdk-8/0013-autoconf-remove=
-Werror.patch b/recipes-core/openjdk/patches-openjdk-8/0013-autoconf-remove=
-Werror.patch
>> index d3bd8e7d1808..91fedb5310ec 100644
>> --- a/recipes-core/openjdk/patches-openjdk-8/0013-autoconf-remove-Werror=
.patch
>> +++ b/recipes-core/openjdk/patches-openjdk-8/0013-autoconf-remove-Werror=
.patch
>> @@ -63,10 +63,10 @@ index 077efa2..b98575a 100644
>>     CFLAGS_JDK=3D"${CFLAGS_JDK} ${NO_DELETE_NULL_POINTER_CHECKS_CFLAG} $=
{NO_LIFETIME_DSE_CFLAG}"
>>     AC_SUBST([NO_LIFETIME_DSE_CFLAG])
>>  diff --git a/common/autoconf/generated-configure.sh b/common/autoconf/g=
enerated-configure.sh
>> -index d57035b..1953dc4 100644
>> +index f285a74..31d41b1 100644
>>  --- a/common/autoconf/generated-configure.sh
>>  +++ b/common/autoconf/generated-configure.sh
>> -@@ -41498,12 +41498,12 @@ $as_echo "$ac_cv_c_bigendian" >&6; }
>> +@@ -41503,12 +41503,12 @@ $as_echo "$ac_cv_c_bigendian" >&6; }
>>       fi
>>       CXXSTD_CXXFLAG=3D"-std=3Dgnu++98"
>>=20=20=20
>> @@ -82,7 +82,7 @@ index d57035b..1953dc4 100644
>>     ac_ext=3Dcpp
>>   ac_cpp=3D'$CXXCPP $CPPFLAGS'
>>   ac_compile=3D'$CXX -c $CXXFLAGS $CPPFLAGS conftest.$ac_ext >&5'
>> -@@ -41654,12 +41654,12 @@ fi
>> +@@ -41659,12 +41659,12 @@ fi
>>     NO_DELETE_NULL_POINTER_CHECKS_CFLAG=3D"-fno-delete-null-pointer-chec=
ks"
>>=20=20=20
>>=20=20=20
>> @@ -98,7 +98,7 @@ index d57035b..1953dc4 100644
>>     ac_ext=3Dc
>>   ac_cpp=3D'$CPP $CPPFLAGS'
>>   ac_compile=3D'$CC -c $CFLAGS $CPPFLAGS conftest.$ac_ext >&5'
>> -@@ -41694,12 +41694,12 @@ $as_echo "$supports" >&6; }
>> +@@ -41699,12 +41699,12 @@ $as_echo "$supports" >&6; }
>>     fi
>>=20=20=20
>>=20=20=20
>> @@ -114,7 +114,7 @@ index d57035b..1953dc4 100644
>>     ac_ext=3Dcpp
>>   ac_cpp=3D'$CXXCPP $CPPFLAGS'
>>   ac_compile=3D'$CXX -c $CXXFLAGS $CPPFLAGS conftest.$ac_ext >&5'
>> -@@ -41733,8 +41733,8 @@ $as_echo "$supports" >&6; }
>> +@@ -41738,8 +41738,8 @@ $as_echo "$supports" >&6; }
>>     fi
>>=20=20=20
>>=20=20=20
>> @@ -125,7 +125,7 @@ index d57035b..1953dc4 100644
>>     supports=3Dno
>>     if test "x$C_COMP_SUPPORTS" =3D "xyes" -a "x$CXX_COMP_SUPPORTS" =3D =
"xyes"; then supports=3Dyes; fi
>>=20=20=20
>> -@@ -41750,12 +41750,12 @@ $as_echo "$supports" >&6; }
>> +@@ -41755,12 +41755,12 @@ $as_echo "$supports" >&6; }
>>     NO_LIFETIME_DSE_CFLAG=3D"-fno-lifetime-dse"
>>=20=20=20
>>=20=20=20
>> @@ -141,7 +141,7 @@ index d57035b..1953dc4 100644
>>     ac_ext=3Dc
>>   ac_cpp=3D'$CPP $CPPFLAGS'
>>   ac_compile=3D'$CC -c $CFLAGS $CPPFLAGS conftest.$ac_ext >&5'
>> -@@ -41789,12 +41789,12 @@ $as_echo "$supports" >&6; }
>> +@@ -41794,12 +41794,12 @@ $as_echo "$supports" >&6; }
>>     fi
>>=20=20=20
>>=20=20=20
>> @@ -157,7 +157,7 @@ index d57035b..1953dc4 100644
>>     ac_ext=3Dcpp
>>   ac_cpp=3D'$CXXCPP $CPPFLAGS'
>>   ac_compile=3D'$CXX -c $CXXFLAGS $CPPFLAGS conftest.$ac_ext >&5'
>> -@@ -41828,8 +41828,8 @@ $as_echo "$supports" >&6; }
>> +@@ -41833,8 +41833,8 @@ $as_echo "$supports" >&6; }
>>     fi
>>=20=20=20
>>=20=20=20
>> @@ -168,7 +168,7 @@ index d57035b..1953dc4 100644
>>     supports=3Dno
>>     if test "x$C_COMP_SUPPORTS" =3D "xyes" -a "x$CXX_COMP_SUPPORTS" =3D =
"xyes"; then supports=3Dyes; fi
>>=20=20=20
>> -@@ -41862,12 +41862,12 @@ $as_echo "$supports" >&6; }
>> +@@ -41867,12 +41867,12 @@ $as_echo "$supports" >&6; }
>>       #          -mno-fused-madd -fno-strict-aliasing for GCC < 4.6
>>       COMPILER_FP_CONTRACT_OFF_FLAG=3D"-ffp-contract=3Doff"
>>=20=20=20
>> @@ -184,7 +184,7 @@ index d57035b..1953dc4 100644
>>     ac_ext=3Dcpp
>>   ac_cpp=3D'$CXXCPP $CPPFLAGS'
>>   ac_compile=3D'$CXX -c $CXXFLAGS $CPPFLAGS conftest.$ac_ext >&5'
>> -@@ -41906,12 +41906,12 @@ $as_echo "$supports" >&6; }
>> +@@ -41911,12 +41911,12 @@ $as_echo "$supports" >&6; }
>>            test "$OPENJDK_TARGET_CPU_ARCH" =3D "ppc"; then
>>           M_NO_FUSED_ADD_FLAG=3D"-mno-fused-madd"
>>=20=20=20
>> @@ -200,7 +200,7 @@ index d57035b..1953dc4 100644
>>     ac_ext=3Dcpp
>>   ac_cpp=3D'$CXXCPP $CPPFLAGS'
>>   ac_compile=3D'$CXX -c $CXXFLAGS $CPPFLAGS conftest.$ac_ext >&5'
>> -@@ -41946,12 +41946,12 @@ $as_echo "$supports" >&6; }
>> +@@ -41951,12 +41951,12 @@ $as_echo "$supports" >&6; }
>>=20=20=20
>>           NO_STRICT_ALIASING_FLAG=3D"-fno-strict-aliasing"
>>=20=20=20
>> diff --git a/recipes-core/openjdk/patches-openjdk-8/1007-hotspot-Turn-on=
-the-Wreturn-type-warning.patch b/recipes-core/openjdk/patches-openjdk-8/10=
07-hotspot-Turn-on-the-Wreturn-type-warning.patch
>> index b5173a939733..0dc09b68c38a 100644
>> --- a/recipes-core/openjdk/patches-openjdk-8/1007-hotspot-Turn-on-the-Wr=
eturn-type-warning.patch
>> +++ b/recipes-core/openjdk/patches-openjdk-8/1007-hotspot-Turn-on-the-Wr=
eturn-type-warning.patch
>> @@ -36,10 +36,10 @@ Signed-off-by: Richard Leitner <richard.leitner@skid=
ata.com>
>>   13 files changed, 17 insertions(+), 15 deletions(-)
>>=20=20
>>  diff --git a/hotspot/make/linux/makefiles/gcc.make b/hotspot/make/linux=
/makefiles/gcc.make
>> -index 36b3c8ba9..cd9511e50 100644
>> +index ac44b6837..7a5162a06 100644
>>  --- a/hotspot/make/linux/makefiles/gcc.make
>>  +++ b/hotspot/make/linux/makefiles/gcc.make
>> -@@ -211,7 +211,7 @@ ifeq ($(USE_CLANG), true)
>> +@@ -212,7 +212,7 @@ ifeq ($(USE_CLANG), true)
>>     WARNINGS_ARE_ERRORS +=3D -Wno-return-type -Wno-empty-body
>>   endif
>>=20=20=20
>> @@ -95,7 +95,7 @@ index 4b4b4e250..196622aed 100644
>>=20=20=20
>>=20=20=20
>>  diff --git a/hotspot/src/share/vm/classfile/symbolTable.cpp b/hotspot/s=
rc/share/vm/classfile/symbolTable.cpp
>> -index 83369cbcf..8dd4e6b21 100644
>> +index ec97077b7..2621a7d62 100644
>>  --- a/hotspot/src/share/vm/classfile/symbolTable.cpp
>>  +++ b/hotspot/src/share/vm/classfile/symbolTable.cpp
>>  @@ -249,7 +249,7 @@ Symbol* SymbolTable::lookup(const char* name, int l=
en, TRAPS) {
>> @@ -117,7 +117,7 @@ index 83369cbcf..8dd4e6b21 100644
>>=20=20=20
>>   Symbol* SymbolTable::lookup_only(const char* name, int len,
>>  diff --git a/hotspot/src/share/vm/classfile/systemDictionary.cpp b/hots=
pot/src/share/vm/classfile/systemDictionary.cpp
>> -index 4541e815a..98412e1e1 100644
>> +index 5911d94f5..df4d56f6f 100644
>>  --- a/hotspot/src/share/vm/classfile/systemDictionary.cpp
>>  +++ b/hotspot/src/share/vm/classfile/systemDictionary.cpp
>>  @@ -236,15 +236,15 @@ Klass* SystemDictionary::resolve_or_null(Symbol* =
class_name, Handle class_loader
>> @@ -166,10 +166,10 @@ index 2f3abae6a..d58ebecb2 100644
>>     static ReservedSpace* shared_rs() {
>>       CDS_ONLY(return _shared_rs);
>>  diff --git a/hotspot/src/share/vm/oops/constantPool.hpp b/hotspot/src/s=
hare/vm/oops/constantPool.hpp
>> -index 68435471d..fad4a92cb 100644
>> +index 124c970e2..dae574c09 100644
>>  --- a/hotspot/src/share/vm/oops/constantPool.hpp
>>  +++ b/hotspot/src/share/vm/oops/constantPool.hpp
>> -@@ -350,7 +350,7 @@ class ConstantPool : public Metadata {
>> +@@ -353,7 +353,7 @@ class ConstantPool : public Metadata {
>>=20=20=20
>>     Klass* klass_at(int which, TRAPS) {
>>       constantPoolHandle h_this(THREAD, this);
>> @@ -177,7 +177,7 @@ index 68435471d..fad4a92cb 100644
>>  +    return klass_at_impl(h_this, which, THREAD);
>>     }
>>=20=20=20
>> -   Symbol* klass_name_at(int which) const;  // Returns the name, w/o re=
solving.
>> +   Symbol* klass_name_at(int which);  // Returns the name, w/o resolvin=
g.
>>  diff --git a/hotspot/src/share/vm/prims/jvm.cpp b/hotspot/src/share/vm/=
prims/jvm.cpp
>>  index 6f2221c41..daa69f89a 100644
>>  --- a/hotspot/src/share/vm/prims/jvm.cpp
>> @@ -192,7 +192,7 @@ index 6f2221c41..daa69f89a 100644
>>=20=20=20
>>   JVM_ENTRY(jboolean,JVM_DTraceIsProbeEnabled(JNIEnv* env, jmethodID met=
hod))
>>  diff --git a/hotspot/src/share/vm/runtime/reflection.cpp b/hotspot/src/=
share/vm/runtime/reflection.cpp
>> -index 4b39d8ccb..9cd7b0dcb 100644
>> +index d9fddbe47..a5f737935 100644
>>  --- a/hotspot/src/share/vm/runtime/reflection.cpp
>>  +++ b/hotspot/src/share/vm/runtime/reflection.cpp
>>  @@ -1093,7 +1093,7 @@ oop Reflection::invoke(instanceKlassHandle klass,=
 methodHandle reflected_method,
>> @@ -205,10 +205,10 @@ index 4b39d8ccb..9cd7b0dcb 100644
>>   }
>>=20=20=20
>>  diff --git a/hotspot/src/share/vm/runtime/sharedRuntime.cpp b/hotspot/s=
rc/share/vm/runtime/sharedRuntime.cpp
>> -index d5bea29c3..50578ad63 100644
>> +index 013aa7a23..df4cde963 100644
>>  --- a/hotspot/src/share/vm/runtime/sharedRuntime.cpp
>>  +++ b/hotspot/src/share/vm/runtime/sharedRuntime.cpp
>> -@@ -1041,7 +1041,7 @@ Handle SharedRuntime::find_callee_info(JavaThread=
* thread, Bytecodes::Code& bc,
>> +@@ -1045,7 +1045,7 @@ Handle SharedRuntime::find_callee_info(JavaThread=
* thread, Bytecodes::Code& bc,
>>     // last java frame on stack (which includes native call frames)
>>     vframeStream vfst(thread, true);  // Do not skip and javaCalls
>>=20=20=20
>> diff --git a/recipes-core/openjdk/patches-openjdk-8/1010-hotspot-fix-sha=
rk-build-common.patch b/recipes-core/openjdk/patches-openjdk-8/1010-hotspot=
-fix-shark-build-common.patch
>> index 8e70cab814c7..711d17bfd43c 100644
>> --- a/recipes-core/openjdk/patches-openjdk-8/1010-hotspot-fix-shark-buil=
d-common.patch
>> +++ b/recipes-core/openjdk/patches-openjdk-8/1010-hotspot-fix-shark-buil=
d-common.patch
>> @@ -22,10 +22,10 @@ Signed-off-by: Richard Leitner <richard.leitner@skid=
ata.com>
>>   14 files changed, 123 insertions(+), 12 deletions(-)
>>=20=20
>>  diff --git a/hotspot/make/Makefile b/hotspot/make/Makefile
>> -index ad195763b..53b5ea046 100644
>> +index de2607c71..3054c3fe8 100644
>>  --- a/hotspot/make/Makefile
>>  +++ b/hotspot/make/Makefile
>> -@@ -525,7 +525,7 @@ $(EXPORT_INCLUDE_DIR)/%:			$(SHARK_BUILD_DIR)/../ge=
nerated/jvmtifiles/%
>> +@@ -536,7 +536,7 @@ $(EXPORT_INCLUDE_DIR)/%:			$(SHARK_BUILD_DIR)/../ge=
nerated/jvmtifiles/%
>>   # Unix
>>   $(EXPORT_JRE_LIB_ARCH_DIR)/%.$(LIBRARY_SUFFIX): $(SHARK_BUILD_DIR)/%.$=
(LIBRARY_SUFFIX)
>>   	$(install-file)
>> @@ -79,10 +79,10 @@ index 4707cc96e..a2b297ca0 100644
>>           flow_block(blk, temp_vector, temp_set);
>>           if (failing()) return; // Watch for bailouts.
>>  diff --git a/hotspot/src/share/vm/classfile/systemDictionary.cpp b/hots=
pot/src/share/vm/classfile/systemDictionary.cpp
>> -index 98412e1e1..f62731c43 100644
>> +index df4d56f6f..b1dd335cb 100644
>>  --- a/hotspot/src/share/vm/classfile/systemDictionary.cpp
>>  +++ b/hotspot/src/share/vm/classfile/systemDictionary.cpp
>> -@@ -2392,6 +2392,7 @@ methodHandle SystemDictionary::find_method_handle=
_intrinsic(vmIntrinsics::ID iid
>> +@@ -2371,6 +2371,7 @@ methodHandle SystemDictionary::find_method_handle=
_intrinsic(vmIntrinsics::ID iid
>>       spe =3D NULL;
>>       // Must create lots of stuff here, but outside of the SystemDictio=
nary lock.
>>       m =3D Method::make_method_handle_intrinsic(iid, signature, CHECK_(=
empty));
>> @@ -90,7 +90,7 @@ index 98412e1e1..f62731c43 100644
>>       if (!Arguments::is_interpreter_only()) {
>>         // Generate a compiled form of the MH intrinsic.
>>         AdapterHandlerLibrary::create_native_wrapper(m);
>> -@@ -2401,6 +2402,7 @@ methodHandle SystemDictionary::find_method_handle=
_intrinsic(vmIntrinsics::ID iid
>> +@@ -2380,6 +2381,7 @@ methodHandle SystemDictionary::find_method_handle=
_intrinsic(vmIntrinsics::ID iid
>>                      "out of space in CodeCache for method handle intrin=
sic", empty);
>>         }
>>       }
>> @@ -98,7 +98,7 @@ index 98412e1e1..f62731c43 100644
>>       // Now grab the lock.  We might have to throw away the new method,
>>       // if a racing thread has managed to install one at the same time.
>>       {
>> -@@ -2414,9 +2416,11 @@ methodHandle SystemDictionary::find_method_handl=
e_intrinsic(vmIntrinsics::ID iid
>> +@@ -2393,9 +2395,11 @@ methodHandle SystemDictionary::find_method_handl=
e_intrinsic(vmIntrinsics::ID iid
>>     }
>>=20=20=20
>>     assert(spe !=3D NULL && spe->method() !=3D NULL, "");
>> diff --git a/recipes-core/openjdk/patches-openjdk-8/1012-hotspot-enable-=
Wno-error.patch b/recipes-core/openjdk/patches-openjdk-8/1012-hotspot-enabl=
e-Wno-error.patch
>> index 2239d481ae82..aeeba6b87602 100644
>> --- a/recipes-core/openjdk/patches-openjdk-8/1012-hotspot-enable-Wno-err=
or.patch
>> +++ b/recipes-core/openjdk/patches-openjdk-8/1012-hotspot-enable-Wno-err=
or.patch
>> @@ -14,10 +14,10 @@ Signed-off-by: Richard Leitner <richard.leitner@skid=
ata.com>
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>=20=20
>>  diff --git a/hotspot/make/linux/makefiles/gcc.make b/hotspot/make/linux=
/makefiles/gcc.make
>> -index cd9511e50..94412c8fe 100644
>> +index 7a5162a06..67607fb26 100644
>>  --- a/hotspot/make/linux/makefiles/gcc.make
>>  +++ b/hotspot/make/linux/makefiles/gcc.make
>> -@@ -200,8 +200,8 @@ else
>> +@@ -201,8 +201,8 @@ else
>>     CFLAGS +=3D -pipe
>>   endif
--=20
Pengutronix e.K.                           | Ulrich =C3=96lmann            =
   |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

