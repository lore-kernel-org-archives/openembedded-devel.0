Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 5DDE660017
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Aug 2015 16:55:51 +0000 (UTC)
Received: by wicne3 with SMTP id ne3so12732622wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Aug 2015 09:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=T38FkHuYMNopG+GYcJKu+czsZj8DHfEM353ZRCGF9ks=;
	b=hlCCMgh4pFCa20bigI+c/HPsGosRZ6mQSVcCgiIcmPU30pTDxC3Ikya3MSNtdRJ5as
	/PQPkwglIQOKu63Ww2r3DOfRog98w7blg69ozjVP93R4mIoWyuBEf1Jr3CEuol6LGyaL
	Xq/0MhHyYm226x0igFG8mVRKQs1++Kwq+u+iv8sLodM/0obnMcN6OgSnLWDj7sOi8Bhx
	eX5BbFxr6+xZs+svRwJ1GWpYEz6vT5VMCrEYO8EfT1S2JxRME/EfGTsGwi2W07FeSVW6
	oEuSNsKuClAIv18Ov8fjncnf6oNS8yiIbwQtvVKvS27jkFzhGRpmnwgIKfNdRRGdiKsy
	Dc6w==
X-Received: by 10.180.99.71 with SMTP id eo7mr373625wib.25.1438793749735;
	Wed, 05 Aug 2015 09:55:49 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id j19sm5014118wjq.5.2015.08.05.09.55.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Aug 2015 09:55:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 5 Aug 2015 18:56:05 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150805165605.GC2452@jama>
References: <1438571196-44094-1-git-send-email-leimaohui@cn.fujitsu.com>
	<1438571196-44094-2-git-send-email-leimaohui@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1438571196-44094-2-git-send-email-leimaohui@cn.fujitsu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH v4 1/6] cmpi-bindings: add new recipe
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
X-List-Received-Date: Wed, 05 Aug 2015 16:55:52 -0000
X-Groupsio-MsgNum: 56551
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5QAgd0e35j3NYeGe"
Content-Disposition: inline

--5QAgd0e35j3NYeGe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 03, 2015 at 11:06:31AM +0800, Lei Maohui wrote:
> Cmpi-bindings is the dependence of openlmi.

Still fails to build in jenkins buidls:

| [100%] Building C object swig/python/CMakeFiles/pyCmpiProvider.dir/cmpi_w=
rap.o
| cd /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/cmpi-bind=
ings/git-r0/build/swig/python && /home/jenkins/oe/world/shr-core/tmp-glibc/=
sysroots/x86_64-linux/usr/bin/i586-oe-linux/i586-oe-linux-gcc  -DCMPI_PLATF=
ORM_LINUX_GENERIC_GNU -DCMPI_VERSION=3D200 -DpyCmpiProvider_EXPORTS -m32 -m=
arch=3Di586  --sysroot=3D/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots=
/qemux86  -O2 -pipe -g -feliminate-unused-debug-types -g -Wall -fPIC -g -fP=
IC -I/home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/cmpi-bind=
ings/git-r0/git/swig/python/.. -I/home/jenkins/oe/world/shr-core/tmp-glibc/=
sysroots/x86_64-linux/usr/include/python3.4m    -o CMakeFiles/pyCmpiProvide=
r.dir/cmpi_wrap.o   -c /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-=
oe-linux/cmpi-bindings/git-r0/build/swig/python/cmpi_wrap.c
| In file included from /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/=
x86_64-linux/usr/include/python3.4m/Python.h:50:0,
|                  from /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586=
-oe-linux/cmpi-bindings/git-r0/build/swig/python/cmpi_wrap.c:144:
| /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/inclu=
de/python3.4m/pyport.h:814:2: error: #error "LONG_BIT definition appears wr=
ong for platform (bad gcc/glibc config?)."
|  #error "LONG_BIT definition appears wrong for platform (bad gcc/glibc co=
nfig?)."
|   ^
| /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/cmpi-binding=
s/git-r0/build/swig/python/cmpi_wrap.c: In function 'Target_DateTime':
| /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/cmpi-binding=
s/git-r0/build/swig/python/cmpi_wrap.c:3179:17: warning: unused variable 'd=
tstr' [-Wunused-variable]
|      CMPIString *dtstr =3D datetime->ft->getStringFormat(datetime, &st);
|                  ^

Whole log in:
http://errors.yoctoproject.org:80/Errors/Build/7773/

>=20
> Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> ---
>  .../cmpi-bindings/0001-Fix-error.patch             |  26 ++
>  .../cmpi-bindings/0001-Modify-cmakelist.patch      |  41 ++++
>  .../0001-fix-build-error-when-the-swig-3.0.6.patch | 268 +++++++++++++++=
++++++
>  .../0001-fix-the-build-error-when-python-3.0.patch |  31 +++
>  .../cmpi-bindings-0.4.17-no-ruby-perl.patch        |  44 ++++
>  .../cmpi-bindings-0.4.17-sblim-sigsegv.patch       |  22 ++
>  .../cmpi-bindings-0.9.5-python-lib-dir.patch       |  17 ++
>  .../cmpi-bindings/cmpi-bindings_git.bb             |  37 +++
>  8 files changed, 486 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/=
0001-Fix-error.patch
>  create mode 100644 meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/=
0001-Modify-cmakelist.patch
>  create mode 100644 meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/=
0001-fix-build-error-when-the-swig-3.0.6.patch
>  create mode 100644 meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/=
0001-fix-the-build-error-when-python-3.0.patch
>  create mode 100644 meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/=
cmpi-bindings-0.4.17-no-ruby-perl.patch
>  create mode 100644 meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/=
cmpi-bindings-0.4.17-sblim-sigsegv.patch
>  create mode 100644 meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/=
cmpi-bindings-0.9.5-python-lib-dir.patch
>  create mode 100644 meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_=
git.bb
>=20
> diff --git a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-Fi=
x-error.patch b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-F=
ix-error.patch
> new file mode 100644
> index 0000000..d1a303c
> --- /dev/null
> +++ b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-Fix-error=
=2Epatch
> @@ -0,0 +1,26 @@
> +From b8e791ce93a467081fb1594b91841e2f57c634a0 Mon Sep 17 00:00:00 2001
> +From: Qian Lei <qianl.fnst@cn.fujitsu.com>
> +Date: Fri, 16 Jan 2015 18:37:26 +0800
> +Subject: [PATCH] Fix error
> +
> +Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
> +---
> + swig/python/CMakeLists.txt | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/swig/python/CMakeLists.txt b/swig/python/CMakeLists.txt
> +index 3976296..8073fc8 100644
> +--- a/swig/python/CMakeLists.txt
> ++++ b/swig/python/CMakeLists.txt
> +@@ -27,7 +27,7 @@ SET( SWIG_INPUT "${CMAKE_CURRENT_SOURCE_DIR}/../cmpi.i=
" )
> + ADD_CUSTOM_COMMAND (
> +    OUTPUT  ${SWIG_OUTPUT}
> +    COMMAND ${CMAKE_COMMAND} -E echo_append "Creating wrapper code for P=
ython ..."
> +-   COMMAND ${SWIG_EXECUTABLE} -python -Wall -threads -features autodoc =
-o ${SWIG_OUTPUT} -outdir ${CMAKE_CURRENT_BINARY_DIR} -I/usr/include ${SWIG=
_INPUT}
> ++   COMMAND ${SWIG_EXECUTABLE} -python -Wall -threads -features autodoc =
-o ${SWIG_OUTPUT} -outdir ${CMAKE_CURRENT_BINARY_DIR} -I$ENV{STAGING_INCDIR=
} ${SWIG_INPUT}
> +    COMMAND ${CMAKE_COMMAND} -E echo "Done."
> +    WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
> +    DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/../*.i
> +--=20
> +1.8.3.1
> +
> diff --git a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-Mo=
dify-cmakelist.patch b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings=
/0001-Modify-cmakelist.patch
> new file mode 100644
> index 0000000..92e5e56
> --- /dev/null
> +++ b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-Modify-cm=
akelist.patch
> @@ -0,0 +1,41 @@
> +From 070822507befe7c1b8bb1be2d36cb12141d03b8f Mon Sep 17 00:00:00 2001
> +From: Qian Lei <qianl.fnst@cn.fujitsu.com>
> +Date: Tue, 6 Jan 2015 18:38:32 +0800
> +Subject: [PATCH] Change the install path in cmakelist
> +
> +Upstream-Status: Pending
> +Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
> +---
> + swig/python/CMakeLists.txt | 8 ++++----
> + 1 file changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/swig/python/CMakeLists.txt b/swig/python/CMakeLists.txt
> +index 3976296..93c87c1 100644
> +--- a/swig/python/CMakeLists.txt
> ++++ b/swig/python/CMakeLists.txt
> +@@ -56,18 +56,18 @@ TARGET_LINK_LIBRARIES( ${NAME} util )
> +=20
> + INSTALL(TARGETS ${NAME} LIBRARY DESTINATION ${CMPI_LIBRARY_DIR})
> + # .py: swig generated
> +-INSTALL(FILES ${CMAKE_CURRENT_BINARY_DIR}/cmpi.py DESTINATION ${PYTHON_=
SITE_DIR} )
> ++INSTALL(FILES ${CMAKE_CURRENT_BINARY_DIR}/cmpi.py DESTINATION $ENV{ENV_=
INSTALL_PATH} )
> +=20
> +=20
> + #
> + # cmpi_pywbem_bindings.py: provider implementation
> + #
> +-INSTALL(FILES cmpi_pywbem_bindings.py DESTINATION ${PYTHON_SITE_DIR} )
> ++INSTALL(FILES cmpi_pywbem_bindings.py DESTINATION $ENV{ENV_INSTALL_PATH=
} )
> + #INSTALL(FILES Py_UnixProcessProvider.py DESTINATION /usr/lib/pycim )
> +=20
> +-INSTALL(CODE "EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c \"from py=
_compile import compile; compile('\$ENV{DESTDIR}${PYTHON_SITE_DIR}/cmpi.py'=
, dfile=3D'${PYTHON_SITE_DIR}/cmpi.py')\")")
> ++INSTALL(CODE "EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c \"from py=
_compile import compile; compile('\$ENV{DESTDIR}$ENV{ENV_INSTALL_PATH}/cmpi=
=2Epy', dfile=3D'\$ENV{ENV_INSTALL_PATH}/cmpi.py')\")")
> +=20
> +-INSTALL(CODE "EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c \"from py=
_compile import compile; compile('\$ENV{DESTDIR}${PYTHON_SITE_DIR}/cmpi_pyw=
bem_bindings.py', dfile=3D'${PYTHON_SITE_DIR}/cmpi_pywbem_bindings.py')\")")
> ++INSTALL(CODE "EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c \"from py=
_compile import compile; compile('\$ENV{DESTDIR}$ENV{ENV_INSTALL_PATH}/cmpi=
_pywbem_bindings.py', dfile=3D'$ENV{ENV_INSTALL_PATH}/cmpi_pywbem_bindings.=
py')\")")
> +=20
> +=20
> +=20
> +--=20
> +1.8.3.1
> +
> diff --git a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-fi=
x-build-error-when-the-swig-3.0.6.patch b/meta-oe/recipes-extended/cmpi-bin=
dings/cmpi-bindings/0001-fix-build-error-when-the-swig-3.0.6.patch
> new file mode 100644
> index 0000000..18d27a1
> --- /dev/null
> +++ b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-fix-build=
-error-when-the-swig-3.0.6.patch
> @@ -0,0 +1,268 @@
> +From 7479e3e13871a20d87f45ba4373a3a919071557a Mon Sep 17 00:00:00 2001
> +From: Lei Maohui <leimaohui@cn.fujitsu.com>
> +Date: Sun, 26 Jul 2015 21:39:50 +0900
> +Subject: [PATCH] fix build error when the swig =3D 3.0.6
> +
> +Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> +---
> + swig/cmpi.i           |  6 +++---
> + swig/cmpi_callbacks.i |  6 +++---
> + swig/cmpi_defs.i      | 10 +++++-----
> + swig/cmpi_types.i     | 44 ++++++++++++++++++++++----------------------
> + 4 files changed, 33 insertions(+), 33 deletions(-)
> +
> +diff --git a/swig/cmpi.i b/swig/cmpi.i
> +index d8f9ac4..59d285b 100644
> +--- a/swig/cmpi.i
> ++++ b/swig/cmpi.i
> +@@ -980,11 +980,11 @@ release_select_filter_exp(select_filter_exp *sfe)
> + %apply SWIGTYPE *DISOWN { CMPIInstance *instance_disown };
> + %apply SWIGTYPE *DISOWN { CMPIObjectPath *path_disown };
> +=20
> +-# Definitions
> ++%# Definitions
> + %include "cmpi_defs.i"
> +=20
> +-# Data types
> ++%# Data types
> + %include "cmpi_types.i"
> +=20
> +-# Broker callbacks
> ++%# Broker callbacks
> + %include "cmpi_callbacks.i"
> +diff --git a/swig/cmpi_callbacks.i b/swig/cmpi_callbacks.i
> +index 4e93a9e..4bba76d 100644
> +--- a/swig/cmpi_callbacks.i
> ++++ b/swig/cmpi_callbacks.i
> +@@ -1,6 +1,6 @@
> +-# cmpi_callbacks.i
> ++%# cmpi_callbacks.i
> + #
> +-# swig bindings for CMPI broker callbacks
> ++%# swig bindings for CMPI broker callbacks
> + #
> +=20
> + %nodefault _CMPIBroker;
> +@@ -445,7 +445,7 @@ typedef struct _CMPIBroker {} CMPIBroker;
> +=20
> + #-----------------------------------------------------
> + #
> +-# TODO: CMPIMsgFileHandle stuff
> ++%# TODO: CMPIMsgFileHandle stuff
> + #
> +   /*
> +    * query: The select expression.
> +diff --git a/swig/cmpi_defs.i b/swig/cmpi_defs.i
> +index ec3e455..7dfb608 100644
> +--- a/swig/cmpi_defs.i
> ++++ b/swig/cmpi_defs.i
> +@@ -1,6 +1,6 @@
> +-# cmpi_defs.i
> ++%# cmpi_defs.i
> + #
> +-# swig bindings for CMPI constant definitions
> ++%# swig bindings for CMPI constant definitions
> + #
> +=20
> + %nodefault CMPIData;
> +@@ -78,7 +78,7 @@
> +=20
> + #if defined(SWIGPYTHON)
> + #
> +-# Conversion from list of python strings to null terminated char** arra=
y.
> ++%# Conversion from list of python strings to null terminated char** arr=
ay.
> + #
> +=20
> + %typemap(in) char **=20
> +@@ -129,7 +129,7 @@
> +=20
> + #-----------------------------------------------------
> + #
> +-# CMPIData
> ++%# CMPIData
> + #
> +=20
> + %extend _CMPIData {
> +@@ -199,7 +199,7 @@
> +=20
> + #-----------------------------------------------------
> + #
> +-# CMPIStatus
> ++%# CMPIStatus
> + #
> +=20
> + %extend _CMPIStatus {
> +diff --git a/swig/cmpi_types.i b/swig/cmpi_types.i
> +index f69ec16..062b948 100644
> +--- a/swig/cmpi_types.i
> ++++ b/swig/cmpi_types.i
> +@@ -29,15 +29,15 @@
> + * ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> + ***********************************************************************=
******/
> +=20
> +-# cmpift.i
> ++%# cmpift.i
> + #
> +-# swig bindings for CMPI function tables
> ++%# swig bindings for CMPI function tables
> + #
> +=20
> + #
> +-# Prevent default con-/destructors for all types
> +-# CMPI types are handled through function tables
> +-# and the broker.
> ++%# Prevent default con-/destructors for all types
> ++%# CMPI types are handled through function tables
> ++%# and the broker.
> + #
> +=20
> + %nodefault _CMPIError;
> +@@ -102,7 +102,7 @@ typedef struct _CMPIDateTime {} CMPIDateTime;
> +=20
> + #-----------------------------------------------------
> + #
> +-# CMPIException
> ++%# CMPIException
> + #
> + #-----------------------------------------------------
> +=20
> +@@ -177,7 +177,7 @@ typedef struct _CMPIException {} CMPIException;
> +=20
> + #-----------------------------------------------------
> + #
> +-# CMPIError
> ++%# CMPIError
> + #
> +=20
> + /*
> +@@ -372,7 +372,7 @@ typedef struct _CMPIException {} CMPIException;
> +=20
> + #-----------------------------------------------------
> + #
> +-# CMPIResult
> ++%# CMPIResult
> + #
> +=20
> + /*
> +@@ -409,7 +409,7 @@ typedef struct _CMPIException {} CMPIException;
> +=20
> + #-----------------------------------------------------
> + #
> +-# CMPIObjectPath
> ++%# CMPIObjectPath
> + #
> +=20
> + /*
> +@@ -860,7 +860,7 @@ FIXME: if clone() is exposed, release() must also
> +=20
> + #-----------------------------------------------------
> + #
> +-# CMPIInstance
> ++%# CMPIInstance
> + #
> +=20
> + /*
> +@@ -1166,7 +1166,7 @@ FIXME: if clone() is exposed, release() must also
> +=20
> + #-----------------------------------------------------
> + #
> +-# CMPIArgs
> ++%# CMPIArgs
> +=20
> + /*
> +  * CMPI Arguments
> +@@ -1282,7 +1282,7 @@ FIXME: if clone() is exposed, release() must also
> +=20
> + #-----------------------------------------------------
> + #
> +-# CMPISelectExp
> ++%# CMPISelectExp
> +=20
> + /*
> +  * This structure encompasses queries
> +@@ -1343,7 +1343,7 @@ FIXME: if clone() is exposed, release() must also
> +=20
> + #-----------------------------------------------------
> + #
> +-# CMPISelectCond
> ++%# CMPISelectCond
> +=20
> + /*
> +  * Select conditions
> +@@ -1372,7 +1372,7 @@ FIXME: if clone() is exposed, release() must also
> +=20
> + #-----------------------------------------------------
> + #
> +-# CMPISubCond
> ++%# CMPISubCond
> +=20
> + /*
> +  * Sub Conditions
> +@@ -1384,7 +1384,7 @@ FIXME: if clone() is exposed, release() must also
> +=20
> + #-----------------------------------------------------
> + #
> +-# CMPIPredicate
> ++%# CMPIPredicate
> +=20
> + /*
> +  * Predicate
> +@@ -1413,7 +1413,7 @@ FIXME: if clone() is exposed, release() must also
> +=20
> + #-----------------------------------------------------
> + #
> +-# CMPIEnumeration
> ++%# CMPIEnumeration
> +=20
> + /*
> +  * Enumeration provide a linked-list type access to multiple elements
> +@@ -1474,7 +1474,7 @@ Python for compatibility */
> +=20
> + #-----------------------------------------------------
> + #
> +-# CMPIArray
> ++%# CMPIArray
> +=20
> + /*
> +  * Array of equally-typed elements
> +@@ -1546,11 +1546,11 @@ Python for compatibility */
> +   }
> + }
> +=20
> +-#BOOKMARK
> ++%#BOOKMARK
> +=20
> + #-----------------------------------------------------
> + #
> +-# CMPIString
> ++%# CMPIString
> +=20
> + /*
> +  * A string
> +@@ -1573,7 +1573,7 @@ Python for compatibility */
> +=20
> + #-----------------------------------------------------
> + #
> +-# CMPIContext
> ++%# CMPIContext
> +=20
> + /*
> +  * Context of the provider invocation
> +@@ -1687,7 +1687,7 @@ Python for compatibility */
> +=20
> + #-----------------------------------------------------
> + #
> +-# CMPIDateTime
> ++%# CMPIDateTime
> +=20
> + /*
> +  * Date and Time
> +@@ -1729,4 +1729,4 @@ Python for compatibility */
> +   }
> + }
> +=20
> +-# EOF
> ++%# EOF
> +--=20
> +1.8.4.2
> +
> diff --git a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-fi=
x-the-build-error-when-python-3.0.patch b/meta-oe/recipes-extended/cmpi-bin=
dings/cmpi-bindings/0001-fix-the-build-error-when-python-3.0.patch
> new file mode 100644
> index 0000000..0d6f029
> --- /dev/null
> +++ b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-fix-the-b=
uild-error-when-python-3.0.patch
> @@ -0,0 +1,31 @@
> +From 323ced03a66e6cd963d8277b66cfcc7dce740be7 Mon Sep 17 00:00:00 2001
> +From: Lei Maohui <leimaohui@cn.fujitsu.com>
> +Date: Fri, 17 Jul 2015 01:33:43 -0700
> +Subject: [PATCH] fix Xthe build error when python>3.0
> +
> +Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> +---
> + src/target_python.c | 7 ++++++-
> + 1 file changed, 6 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/target_python.c b/src/target_python.c
> +index 90b43a1..2b76c9e 100644
> +--- a/src/target_python.c
> ++++ b/src/target_python.c
> +@@ -167,7 +167,12 @@ PyGlobalInitialize(const CMPIBroker* broker, CMPISt=
atus* st)
> +  =20
> +   Py_SetProgramName("cmpi_swig");
> +   Py_Initialize();
> +-  SWIGEXPORT void SWIG_init(void);
> ++#if PY_VERSION_HEX >=3D 0x03000000
> ++SWIGEXPORT PyObject*
> ++#else
> ++  SWIGEXPORT void=20
> ++#endif
> ++  SWIG_init(void);
> +   SWIG_init();
> +   cmpiMainPyThreadState =3D PyGILState_GetThisThreadState();
> +   PyEval_ReleaseThread(cmpiMainPyThreadState);=20
> +--=20
> +2.1.0
> +
> diff --git a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/cmpi-bi=
ndings-0.4.17-no-ruby-perl.patch b/meta-oe/recipes-extended/cmpi-bindings/c=
mpi-bindings/cmpi-bindings-0.4.17-no-ruby-perl.patch
> new file mode 100644
> index 0000000..a586dbd
> --- /dev/null
> +++ b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/cmpi-bindings-=
0.4.17-no-ruby-perl.patch
> @@ -0,0 +1,44 @@
> +Port from Fedora20
> +
> +Upstream-Status: Pending
> +Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
> +
> +diff -up cmpi-bindings-0.5.2/swig/CMakeLists.txt.orig cmpi-bindings-0.5.=
2/swig/CMakeLists.txt
> +--- cmpi-bindings-0.5.2/swig/CMakeLists.txt.orig	2012-05-04 15:47:18.000=
000000 +0200
> ++++ cmpi-bindings-0.5.2/swig/CMakeLists.txt	2012-05-07 09:59:33.63964891=
8 +0200
> +@@ -4,12 +4,12 @@
> +=20
> + enable_testing()
> +=20
> +-FIND_PACKAGE(Ruby)
> +-IF (RUBY_LIBRARY AND RUBY_INCLUDE_PATH)
> +-  MESSAGE(STATUS "Building Ruby...")
> +-  ADD_SUBDIRECTORY(ruby)
> +-  OPTION( BUILD_RUBY_GEM "Build Ruby GEM" YES )
> +-ENDIF (RUBY_LIBRARY AND RUBY_INCLUDE_PATH)
> ++#FIND_PACKAGE(Ruby)
> ++#IF (RUBY_LIBRARY AND RUBY_INCLUDE_PATH)
> ++#  MESSAGE(STATUS "Building Ruby...")
> ++#  ADD_SUBDIRECTORY(ruby)
> ++#  OPTION( BUILD_RUBY_GEM "Build Ruby GEM" YES )
> ++#ENDIF (RUBY_LIBRARY AND RUBY_INCLUDE_PATH)
> +=20
> + FIND_PACKAGE(PythonLibs)
> + IF (PYTHON_LIBRARY)
> +@@ -22,9 +22,9 @@ IF (PYTHON_LIBRARY)
> +   ENDIF (PYTHON_LINK_LIBS)
> + ENDIF (PYTHON_LIBRARY)
> +=20
> +-FIND_PACKAGE(Perl)
> +-IF (PERL_EXECUTABLE)
> +-  MESSAGE(STATUS "Building Perl...")
> +-  ADD_SUBDIRECTORY(perl)
> +-ENDIF (PERL_EXECUTABLE)
> +-   =20
> +\ No newline at end of file
> ++#FIND_PACKAGE(Perl)
> ++#IF (PERL_EXECUTABLE)
> ++#  MESSAGE(STATUS "Building Perl...")
> ++#  ADD_SUBDIRECTORY(perl)
> ++#ENDIF (PERL_EXECUTABLE)
> ++   =20
> diff --git a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/cmpi-bi=
ndings-0.4.17-sblim-sigsegv.patch b/meta-oe/recipes-extended/cmpi-bindings/=
cmpi-bindings/cmpi-bindings-0.4.17-sblim-sigsegv.patch
> new file mode 100644
> index 0000000..b993372
> --- /dev/null
> +++ b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/cmpi-bindings-=
0.4.17-sblim-sigsegv.patch
> @@ -0,0 +1,22 @@
> +Port from Fedora20
> +
> +Upstream-Status: Pending
> +Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
> +
> +diff -up cmpi-bindings-0.4.17/swig/python/cmpi_pywbem_bindings.py.orig c=
mpi-bindings-0.4.17/swig/python/cmpi_pywbem_bindings.py
> +--- cmpi-bindings-0.4.17/swig/python/cmpi_pywbem_bindings.py.orig	2012-0=
3-01 17:05:31.878367281 +0100
> ++++ cmpi-bindings-0.4.17/swig/python/cmpi_pywbem_bindings.py	2012-03-01 =
17:06:34.718110137 +0100
> +@@ -350,10 +350,10 @@ class BrokerCIMOMHandle(object):
> +             allow_null_ns =3D False
> +         else:
> +             allow_null_ns =3D True
> +-            if self.broker.name() =3D=3D 'RequestHandler':
> ++#            if self.broker.name() =3D=3D 'RequestHandler':
> +                 # Check sblim bug #2185410.
> +-                if instance.path is not None:
> +-                    instance.path.namespace =3D None
> ++#                if instance.path is not None:
> ++#                    instance.path.namespace =3D None
> +         inst =3D self.proxy.pywbem2cmpi_inst(instance, allow_null_ns)
> +         rv =3D self.broker.deliverIndication(self.ctx, ns, inst)
> +         return rv
> diff --git a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/cmpi-bi=
ndings-0.9.5-python-lib-dir.patch b/meta-oe/recipes-extended/cmpi-bindings/=
cmpi-bindings/cmpi-bindings-0.9.5-python-lib-dir.patch
> new file mode 100644
> index 0000000..b6a51ec
> --- /dev/null
> +++ b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/cmpi-bindings-=
0.9.5-python-lib-dir.patch
> @@ -0,0 +1,17 @@
> +Port from Fedora20
> +
> +Upstream-Status: Pending
> +Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
> +
> +diff -up cmpi-bindings-0.9.5/swig/python/CMakeLists.txt.old cmpi-binding=
s-0.9.5/swig/python/CMakeLists.txt
> +--- cmpi-bindings-0.9.5/swig/python/CMakeLists.txt.old	2013-08-06 15:57:=
03.576285764 +0200
> ++++ cmpi-bindings-0.9.5/swig/python/CMakeLists.txt	2013-08-06 15:57:14.8=
91345941 +0200
> +@@ -9,7 +9,7 @@ SET (BUILD_SHARED_LIBS ON)
> +=20
> + FIND_PACKAGE(PythonInterp REQUIRED)
> +=20
> +-EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "from sys import stdout=
; from distutils import sysconfig; stdout.write(sysconfig.get_python_lib())=
" OUTPUT_VARIABLE PYTHON_LIB_DIR)
> ++EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "from sys import stdout=
; from distutils import sysconfig; stdout.write(sysconfig.get_python_lib(1)=
)" OUTPUT_VARIABLE PYTHON_LIB_DIR)
> +=20
> + IF (NOT PYTHON_SITE_DIR)
> +   SET (PYTHON_SITE_DIR ${PYTHON_LIB_DIR})
> diff --git a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_git.bb =
b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_git.bb
> new file mode 100644
> index 0000000..370f35e
> --- /dev/null
> +++ b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_git.bb
> @@ -0,0 +1,37 @@
> +SUMMARY =3D "Adapter to write and run CMPI-type CIM providers"
> +DESCRIPTION =3D "CMPI-compliant provider interface for various languages=
 via SWIG"
> +HOMEPAGE =3D "http://github.com/kkaempf/cmpi-bindings"
> +LICENSE =3D "BSD"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db19ee058d2d5f69af45da98051d91=
064"
> +SECTION =3D "Development/Libraries"
> +DEPENDS =3D "swig-native python sblim-cmpi-devel"
> +
> +SRC_URI =3D "git://github.com/kkaempf/cmpi-bindings.git;protocol=3Dhttp \
> +           file://cmpi-bindings-0.4.17-no-ruby-perl.patch \
> +           file://cmpi-bindings-0.4.17-sblim-sigsegv.patch \
> +           file://cmpi-bindings-0.9.5-python-lib-dir.patch \
> +           file://0001-Modify-cmakelist.patch \
> +           file://0001-Fix-error.patch \
> +           file://0001-fix-the-build-error-when-python-3.0.patch \
> +           file://0001-fix-build-error-when-the-swig-3.0.6.patch \
> +          "
> +
> +SRCREV =3D "93b6044f53bcfa79253d7af51a9c23ddd73f8486"
> +S =3D "${WORKDIR}/git"
> +
> +inherit cmake pythonnative
> +
> +EXTRA_OECMAKE =3D "-DLIB=3D'${baselib}'"
> +
> +do_configure_prepend() {
> +    export HOST_SYS=3D${HOST_SYS}
> +    export BUILD_SYS=3D${BUILD_SYS}
> +    export STAGING_LIBDIR=3D${STAGING_LIBDIR}
> +    export STAGING_INCDIR=3D${STAGING_INCDIR}
> +    export ENV_INSTALL_PATH=3D${PYTHON_SITEPACKAGES_DIR}
> +}
> +
> +FILES_${PN} =3D+"${libdir}/cmpi/libpyCmpiProvider.so ${PYTHON_SITEPACKAG=
ES_DIR}/*"
> +FILES_${PN}-dbg =3D+ "${libdir}/cmpi/.debug/libpyCmpiProvider.so"
> +
> +BBCLASSEXTEND =3D "native"
> --=20
> 1.8.4.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--5QAgd0e35j3NYeGe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXCQCQACgkQN1Ujt2V2gBz+XwCfbMMC8i8waVoxLbWx+D//wYAi
yiEAoKflp7U5OZQmOdiS9ZEw6jbOyBZ9
=3jdu
-----END PGP SIGNATURE-----

--5QAgd0e35j3NYeGe--
