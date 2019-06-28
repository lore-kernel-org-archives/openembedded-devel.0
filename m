Return-Path: <chin.huat.ang@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 649007E90C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jun 2019 01:47:02 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Jun 2019 18:47:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,425,1557212400"; d="scan'208";a="153232711"
Received: from kmsmsx154.gar.corp.intel.com ([172.21.73.14])
	by orsmga007.jf.intel.com with ESMTP; 27 Jun 2019 18:47:01 -0700
Received: from pgsmsx110.gar.corp.intel.com ([169.254.13.63]) by
	KMSMSX154.gar.corp.intel.com ([169.254.12.105]) with mapi id
	14.03.0439.000; Fri, 28 Jun 2019 09:47:00 +0800
From: "Ang, Chin Huat" <chin.huat.ang@intel.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [PATCH] opencv: 3.4.5 -> 4.1.0
Thread-Index: AQHVLTCn72UF/l53REqadDok5ayoVaawTEz8
Date: Fri, 28 Jun 2019 01:47:00 +0000
Message-ID: <08E361F78D55674EADC52186A78684A534F0F0DD@PGSMSX110.gar.corp.intel.com>
References: <1561671493-67520-1-git-send-email-chin.huat.ang@intel.com>
In-Reply-To: <1561671493-67520-1-git-send-email-chin.huat.ang@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.3.86.137]
MIME-Version: 1.0
Subject: Re: [PATCH] opencv: 3.4.5 -> 4.1.0
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
X-List-Received-Date: Fri, 28 Jun 2019 01:47:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please discard this.=0A=
=0A=
________________________________________=0A=
From: Ang, Chin Huat=0A=
Sent: Friday, June 28, 2019 5:38 AM=0A=
To: openembedded-devel@lists.openembedded.org=0A=
Cc: Khem Raj; Ang, Chin Huat=0A=
Subject: [PATCH] opencv: 3.4.5 -> 4.1.0=0A=
=0A=
Update both opencv and opencv_contrib to 4.1.0 and refresh all patches.=0A=
=0A=
Remove tiny-dnn from SRC_URI as it is not picked up by opencv cmake=0A=
build system. This also fixes a QA warning about using unstable github=0A=
archive.=0A=
=0A=
Also update FILES_* to capture new paths which uses new directory name=0A=
"opencv4" instead of "OpenCV".=0A=
=0A=
Signed-off-by: Chin Huat Ang <chin.huat.ang@intel.com>=0A=
---=0A=
 ...01-3rdparty-ippicv-Use-pre-downloaded-ipp.patch |   8 +-=0A=
 .../opencv/opencv/0001-Dont-use-isystem.patch      |   8 +-=0A=
 ...-work-around-deprecated-ffmpeg-RAW-functi.patch |  10 +-=0A=
 ...-ts-create-share-library-intead-of-static.patch |  10 +-=0A=
 .../opencv/0003-To-fix-errors-as-following.patch   |  37 ++--=0A=
 .../opencv/opencv/fixpkgconfig.patch               |  30 ----=0A=
 .../opencv/opencv/uselocalxfeatures.patch          |  20 ---=0A=
 meta-oe/recipes-support/opencv/opencv_3.4.5.bb     | 190 -----------------=
----=0A=
 meta-oe/recipes-support/opencv/opencv_4.1.0.bb     | 180 +++++++++++++++++=
++=0A=
 9 files changed, 213 insertions(+), 280 deletions(-)=0A=
 delete mode 100644 meta-oe/recipes-support/opencv/opencv/fixpkgconfig.patc=
h=0A=
 delete mode 100644 meta-oe/recipes-support/opencv/opencv/uselocalxfeatures=
.patch=0A=
 delete mode 100644 meta-oe/recipes-support/opencv/opencv_3.4.5.bb=0A=
 create mode 100644 meta-oe/recipes-support/opencv/opencv_4.1.0.bb=0A=
=0A=
diff --git a/meta-oe/recipes-support/opencv/opencv/0001-3rdparty-ippicv-Use=
-pre-downloaded-ipp.patch b/meta-oe/recipes-support/opencv/opencv/0001-3rdp=
arty-ippicv-Use-pre-downloaded-ipp.patch=0A=
index 4d76ad4..5f909c1 100644=0A=
--- a/meta-oe/recipes-support/opencv/opencv/0001-3rdparty-ippicv-Use-pre-do=
wnloaded-ipp.patch=0A=
+++ b/meta-oe/recipes-support/opencv/opencv/0001-3rdparty-ippicv-Use-pre-do=
wnloaded-ipp.patch=0A=
@@ -1,16 +1,17 @@=0A=
-From 4801a057730632225337d7f6d26b9335e6b9b078 Mon Sep 17 00:00:00 2001=0A=
+From 85b882b4ceb57fe6538f47af58d0a970923fde0e Mon Sep 17 00:00:00 2001=0A=
 From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>=0A=
 Date: Thu, 31 Mar 2016 00:20:15 +0200=0A=
 Subject: [PATCH] 3rdparty/ippicv: Use pre-downloaded ipp=0A=
=0A=
 Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>=0A=
 Signed-off-by: Ismo Puustinen <ismo.puustinen@intel.com>=0A=
+=0A=
 ---=0A=
  3rdparty/ippicv/ippicv.cmake | 15 +--------------=0A=
  1 file changed, 1 insertion(+), 14 deletions(-)=0A=
=0A=
 diff --git a/3rdparty/ippicv/ippicv.cmake b/3rdparty/ippicv/ippicv.cmake=
=0A=
-index d601da4bb..f6fc1098c 100644=0A=
+index ae8748c..305abdb 100644=0A=
 --- a/3rdparty/ippicv/ippicv.cmake=0A=
 +++ b/3rdparty/ippicv/ippicv.cmake=0A=
 @@ -39,18 +39,5 @@ function(download_ippicv root_var)=0A=
@@ -33,6 +34,3 @@ index d601da4bb..f6fc1098c 100644=0A=
 -  endif()=0A=
 +  set(${root_var} "${THE_ROOT}/${OPENCV_ICV_PACKAGE_SUBDIR}" PARENT_SCOPE=
)=0A=
  endfunction()=0A=
---=0A=
-2.13.4=0A=
-=0A=
diff --git a/meta-oe/recipes-support/opencv/opencv/0001-Dont-use-isystem.pa=
tch b/meta-oe/recipes-support/opencv/opencv/0001-Dont-use-isystem.patch=0A=
index bf0b80a..40d3f53 100644=0A=
--- a/meta-oe/recipes-support/opencv/opencv/0001-Dont-use-isystem.patch=0A=
+++ b/meta-oe/recipes-support/opencv/opencv/0001-Dont-use-isystem.patch=0A=
@@ -1,4 +1,4 @@=0A=
-From 7144c44ec70dee73a628463b99ffeed74b1a8ef6 Mon Sep 17 00:00:00 2001=0A=
+From 9659f5a1e75fc29c9879c301767bba72ecf9042a Mon Sep 17 00:00:00 2001=0A=
 From: Khem Raj <raj.khem@gmail.com>=0A=
 Date: Tue, 11 Sep 2018 00:21:18 -0700=0A=
 Subject: [PATCH] Dont use isystem=0A=
@@ -8,12 +8,13 @@ clang really does not like it=0A=
 Upstream-Status: Pending=0A=
=0A=
 Signed-off-by: Khem Raj <raj.khem@gmail.com>=0A=
+=0A=
 ---=0A=
  cmake/OpenCVPCHSupport.cmake | 2 ++=0A=
  1 file changed, 2 insertions(+)=0A=
=0A=
 diff --git a/cmake/OpenCVPCHSupport.cmake b/cmake/OpenCVPCHSupport.cmake=
=0A=
-index f9b1b48b65..fe27a136f5 100644=0A=
+index 59bc826..055dfce 100644=0A=
 --- a/cmake/OpenCVPCHSupport.cmake=0A=
 +++ b/cmake/OpenCVPCHSupport.cmake=0A=
 @@ -18,6 +18,8 @@ IF(CV_GCC)=0A=
@@ -25,6 +26,3 @@ index f9b1b48b65..fe27a136f5 100644=0A=
      SET(_PCH_include_prefix "-I")=0A=
      SET(_PCH_isystem_prefix "-isystem")=0A=
      SET(_PCH_define_prefix "-D")=0A=
---=0A=
-2.18.0=0A=
-=0A=
diff --git a/meta-oe/recipes-support/opencv/opencv/0001-Temporarliy-work-ar=
ound-deprecated-ffmpeg-RAW-functi.patch b/meta-oe/recipes-support/opencv/op=
encv/0001-Temporarliy-work-around-deprecated-ffmpeg-RAW-functi.patch=0A=
index 63cb7f9..f8ccd1d 100644=0A=
--- a/meta-oe/recipes-support/opencv/opencv/0001-Temporarliy-work-around-de=
precated-ffmpeg-RAW-functi.patch=0A=
+++ b/meta-oe/recipes-support/opencv/opencv/0001-Temporarliy-work-around-de=
precated-ffmpeg-RAW-functi.patch=0A=
@@ -1,19 +1,20 @@=0A=
-From 7d31f41d2a6759e244983504ce855fc32916b97a Mon Sep 17 00:00:00 2001=0A=
+From fe27d0e2341683606704115949d16250e4cacbfa Mon Sep 17 00:00:00 2001=0A=
 From: Jason Wessel <jason.wessel@windriver.com>=0A=
 Date: Wed, 9 May 2018 13:33:59 -0700=0A=
 Subject: [PATCH] Temporarliy work around deprecated ffmpeg RAW function=0A=
  compile failure until next uprev=0A=
=0A=
 Signed-off-by: Jason Wessel <jason.wessel@windriver.com>=0A=
+=0A=
 ---=0A=
  modules/videoio/src/cap_ffmpeg_impl.hpp | 8 ++++++++=0A=
  1 file changed, 8 insertions(+)=0A=
=0A=
 diff --git a/modules/videoio/src/cap_ffmpeg_impl.hpp b/modules/videoio/src=
/cap_ffmpeg_impl.hpp=0A=
-index 5a9b10f075..97c6b74b07 100644=0A=
+index 0d360ad..566df66 100644=0A=
 --- a/modules/videoio/src/cap_ffmpeg_impl.hpp=0A=
 +++ b/modules/videoio/src/cap_ffmpeg_impl.hpp=0A=
-@@ -667,6 +667,14 @@ struct ImplMutex::Impl=0A=
+@@ -736,6 +736,14 @@ struct ImplMutex::Impl=0A=
=0A=
  #endif=0A=
=0A=
@@ -28,6 +29,3 @@ index 5a9b10f075..97c6b74b07 100644=0A=
  void ImplMutex::init()=0A=
  {=0A=
      impl =3D new Impl();=0A=
---=0A=
-2.11.0=0A=
-=0A=
diff --git a/meta-oe/recipes-support/opencv/opencv/0002-Make-opencv-ts-crea=
te-share-library-intead-of-static.patch b/meta-oe/recipes-support/opencv/op=
encv/0002-Make-opencv-ts-create-share-library-intead-of-static.patch=0A=
index a845505..46198fb 100644=0A=
--- a/meta-oe/recipes-support/opencv/opencv/0002-Make-opencv-ts-create-shar=
e-library-intead-of-static.patch=0A=
+++ b/meta-oe/recipes-support/opencv/opencv/0002-Make-opencv-ts-create-shar=
e-library-intead-of-static.patch=0A=
@@ -1,15 +1,16 @@=0A=
-From 350525293aef65490e80104ddd99e1b21c5d54b0 Mon Sep 17 00:00:00 2001=0A=
+From 46ffa1f8f443b71673774fcb864eb741bbc26200 Mon Sep 17 00:00:00 2001=0A=
 From: Bian Naimeng <biannm@cn.fujitsu.com>=0A=
 Date: Wed, 19 Apr 2017 03:11:37 +0900=0A=
-Subject: [PATCH 2/3] Make opencv-ts create share library intead of static.=
=0A=
+Subject: [PATCH] Make opencv-ts create share library intead of static.=0A=
=0A=
 Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>=0A=
+=0A=
 ---=0A=
  modules/ts/CMakeLists.txt | 2 +-=0A=
  1 file changed, 1 insertion(+), 1 deletion(-)=0A=
=0A=
 diff --git a/modules/ts/CMakeLists.txt b/modules/ts/CMakeLists.txt=0A=
-index f95bed079..ee67858df 100644=0A=
+index f95bed0..ee67858 100644=0A=
 --- a/modules/ts/CMakeLists.txt=0A=
 +++ b/modules/ts/CMakeLists.txt=0A=
 @@ -4,7 +4,7 @@ if(NOT BUILD_opencv_ts AND NOT BUILD_TESTS AND NOT BUILD_P=
ERF_TESTS)=0A=
@@ -21,6 +22,3 @@ index f95bed079..ee67858df 100644=0A=
  set(OPENCV_MODULE_IS_PART_OF_WORLD FALSE)=0A=
=0A=
  if(WINRT)=0A=
---=0A=
-2.13.4=0A=
-=0A=
diff --git a/meta-oe/recipes-support/opencv/opencv/0003-To-fix-errors-as-fo=
llowing.patch b/meta-oe/recipes-support/opencv/opencv/0003-To-fix-errors-as=
-following.patch=0A=
index 5270b8c..336c2e0 100644=0A=
--- a/meta-oe/recipes-support/opencv/opencv/0003-To-fix-errors-as-following=
.patch=0A=
+++ b/meta-oe/recipes-support/opencv/opencv/0003-To-fix-errors-as-following=
.patch=0A=
@@ -1,7 +1,7 @@=0A=
-From ace48a628dca34d742615598afeef42ed323a029 Mon Sep 17 00:00:00 2001=0A=
+From 867caccc358266f7021f076fc8c8e41bf048782c Mon Sep 17 00:00:00 2001=0A=
 From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>=0A=
 Date: Fri, 19 May 2017 04:27:50 +0900=0A=
-Subject: [PATCH 3/3] To fix errors as following:=0A=
+Subject: [PATCH] To fix errors as following:=0A=
=0A=
 "test_main.cpp:45: undefined reference to `parseCustomOptions(int, char**)=
'"=0A=
 "perf_abs.cpp:13: undefined reference to `cvtest::param_seed'"=0A=
@@ -13,17 +13,18 @@ Also add the visibility changes for certain OpenCL-rela=
ted functions in=0A=
 ts module.=0A=
=0A=
 Signed-off-by: Ismo Puustinen <ismo.puustinen@intel.com>=0A=
+=0A=
 ---=0A=
- modules/ts/include/opencv2/ts.hpp          | 6 +++---=0A=
+ modules/ts/include/opencv2/ts.hpp          | 4 ++--=0A=
  modules/ts/include/opencv2/ts/ocl_test.hpp | 2 +-=0A=
  modules/ts/include/opencv2/ts/ts_ext.hpp   | 2 +-=0A=
- 3 files changed, 5 insertions(+), 5 deletions(-)=0A=
+ 3 files changed, 4 insertions(+), 4 deletions(-)=0A=
=0A=
-Index: git/modules/ts/include/opencv2/ts.hpp=0A=
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
---- git.orig/modules/ts/include/opencv2/ts.hpp=0A=
-+++ git/modules/ts/include/opencv2/ts.hpp=0A=
-@@ -608,7 +608,7 @@ protected:=0A=
+diff --git a/modules/ts/include/opencv2/ts.hpp b/modules/ts/include/opencv=
2/ts.hpp=0A=
+index b9d6b74..f1ee7ee 100644=0A=
+--- a/modules/ts/include/opencv2/ts.hpp=0A=
++++ b/modules/ts/include/opencv2/ts.hpp=0A=
+@@ -622,7 +622,7 @@ protected:=0A=
      }=0A=
  };=0A=
=0A=
@@ -32,7 +33,7 @@ Index: git/modules/ts/include/opencv2/ts.hpp=0A=
=0A=
  struct DefaultRngAuto=0A=
  {=0A=
-@@ -671,7 +671,7 @@ private:=0A=
+@@ -685,7 +685,7 @@ private:=0A=
  #endif=0A=
  #endif=0A=
=0A=
@@ -41,10 +42,10 @@ Index: git/modules/ts/include/opencv2/ts.hpp=0A=
=0A=
  #define CV_TEST_INIT0_NOOP (void)0=0A=
=0A=
-Index: git/modules/ts/include/opencv2/ts/ocl_test.hpp=0A=
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
---- git.orig/modules/ts/include/opencv2/ts/ocl_test.hpp=0A=
-+++ git/modules/ts/include/opencv2/ts/ocl_test.hpp=0A=
+diff --git a/modules/ts/include/opencv2/ts/ocl_test.hpp b/modules/ts/inclu=
de/opencv2/ts/ocl_test.hpp=0A=
+index 11572e9..438112e 100644=0A=
+--- a/modules/ts/include/opencv2/ts/ocl_test.hpp=0A=
++++ b/modules/ts/include/opencv2/ts/ocl_test.hpp=0A=
 @@ -82,7 +82,7 @@ inline UMat ToUMat(InputArray src)=0A=
      return dst;=0A=
  }=0A=
@@ -54,10 +55,10 @@ Index: git/modules/ts/include/opencv2/ts/ocl_test.hpp=
=0A=
=0A=
  #define MAX_VALUE 357=0A=
=0A=
-Index: git/modules/ts/include/opencv2/ts/ts_ext.hpp=0A=
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
---- git.orig/modules/ts/include/opencv2/ts/ts_ext.hpp=0A=
-+++ git/modules/ts/include/opencv2/ts/ts_ext.hpp=0A=
+diff --git a/modules/ts/include/opencv2/ts/ts_ext.hpp b/modules/ts/include=
/opencv2/ts/ts_ext.hpp=0A=
+index b5cea3e..e5b0b4b 100644=0A=
+--- a/modules/ts/include/opencv2/ts/ts_ext.hpp=0A=
++++ b/modules/ts/include/opencv2/ts/ts_ext.hpp=0A=
 @@ -9,7 +9,7 @@=0A=
  #define OPENCV_TS_EXT_HPP=0A=
=0A=
diff --git a/meta-oe/recipes-support/opencv/opencv/fixpkgconfig.patch b/met=
a-oe/recipes-support/opencv/opencv/fixpkgconfig.patch=0A=
deleted file mode 100644=0A=
index 3ed3468..0000000=0A=
--- a/meta-oe/recipes-support/opencv/opencv/fixpkgconfig.patch=0A=
+++ /dev/null=0A=
@@ -1,30 +0,0 @@=0A=
-Index: git/cmake/OpenCVGenPkgconfig.cmake=0A=
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
---- git.orig/cmake/OpenCVGenPkgconfig.cmake=0A=
-+++ git/cmake/OpenCVGenPkgconfig.cmake=0A=
-@@ -31,7 +31,7 @@ macro(fix_prefix lst isown)=0A=
-       get_filename_component(libdir "${item}" PATH)=0A=
-       get_filename_component(_libname "${item}" NAME)=0A=
-       ocv_get_libname(libname "${_libname}")=0A=
--      list(APPEND _lst "-L${libdir}" "-l${libname}")=0A=
-+      list(APPEND _lst "-l${libname}")=0A=
-     else()=0A=
-       list(APPEND _lst "-l${item}")=0A=
-     endif()=0A=
-@@ -124,11 +124,14 @@ ocv_list_unique(_extra)=0A=
- ocv_list_unique(_3rdparty)=0A=
-=0A=
- set(OPENCV_PC_LIBS=0A=
--  "-L\${exec_prefix}/${OPENCV_LIB_INSTALL_PATH}"=0A=
-+  "-L\${exec_prefix}/${OPENCV_3P_LIB_INSTALL_PATH}"=0A=
-   "${_modules}"=0A=
- )=0A=
- if(BUILD_SHARED_LIBS)=0A=
--  set(OPENCV_PC_LIBS_PRIVATE "${_extra}")=0A=
-+  set(OPENCV_PC_LIBS_PRIVATE=0A=
-+    "-L\${exec_prefix}/${OPENCV_LIB_INSTALL_PATH}"=0A=
-+    "${_extra}"=0A=
-+  )=0A=
- else()=0A=
-   set(OPENCV_PC_LIBS_PRIVATE=0A=
-     "-L\${exec_prefix}/${OPENCV_3P_LIB_INSTALL_PATH}"=0A=
diff --git a/meta-oe/recipes-support/opencv/opencv/uselocalxfeatures.patch =
b/meta-oe/recipes-support/opencv/opencv/uselocalxfeatures.patch=0A=
deleted file mode 100644=0A=
index fc273a8..0000000=0A=
--- a/meta-oe/recipes-support/opencv/opencv/uselocalxfeatures.patch=0A=
+++ /dev/null=0A=
@@ -1,20 +0,0 @@=0A=
-diff --git a/modules/xfeatures2d/CMakeLists.txt b/modules/xfeatures2d/CMak=
eLists.txt=0A=
-index e1755595..c7009c47 100644=0A=
---- a/modules/xfeatures2d/CMakeLists.txt=0A=
-+++ b/modules/xfeatures2d/CMakeLists.txt=0A=
-@@ -5,10 +5,10 @@ ocv_define_module(xfeatures2d opencv_core opencv_imgproc=
 opencv_features2d openc=0A=
- include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/download_vgg.cmake)=0A=
- include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/download_boostdesc.cmake)=0A=
- set(DOWNLOAD_DIR "${OpenCV_BINARY_DIR}/downloads/xfeatures2d")=0A=
--download_boost_descriptors("${DOWNLOAD_DIR}" boost_status)=0A=
--download_vgg_descriptors("${DOWNLOAD_DIR}" vgg_status)=0A=
--if(NOT boost_status OR NOT vgg_status)=0A=
--  ocv_module_disable(xfeatures2d)=0A=
--endif()=0A=
-+#download_boost_descriptors("${DOWNLOAD_DIR}" boost_status)=0A=
-+#download_vgg_descriptors("${DOWNLOAD_DIR}" vgg_status)=0A=
-+#if(NOT boost_status OR NOT vgg_status)=0A=
-+#  ocv_module_disable(xfeatures2d)=0A=
-+#endif()=0A=
-=0A=
- ocv_module_include_directories("${DOWNLOAD_DIR}")=0A=
diff --git a/meta-oe/recipes-support/opencv/opencv_3.4.5.bb b/meta-oe/recip=
es-support/opencv/opencv_3.4.5.bb=0A=
deleted file mode 100644=0A=
index ce60698..0000000=0A=
--- a/meta-oe/recipes-support/opencv/opencv_3.4.5.bb=0A=
+++ /dev/null=0A=
@@ -1,190 +0,0 @@=0A=
-SUMMARY =3D "Opencv : The Open Computer Vision Library"=0A=
-HOMEPAGE =3D "http://opencv.org/"=0A=
-SECTION =3D "libs"=0A=
-=0A=
-LICENSE =3D "BSD-3-Clause"=0A=
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D62d89c5dcb0583609ea919c56be0ee7=
6"=0A=
-=0A=
-ARM_INSTRUCTION_SET_armv4 =3D "arm"=0A=
-ARM_INSTRUCTION_SET_armv5 =3D "arm"=0A=
-=0A=
-DEPENDS =3D "libtool swig-native bzip2 zlib glib-2.0 libwebp"=0A=
-=0A=
-SRCREV_opencv =3D "8f1356c3c5b16721349582db461a2051653059e8"=0A=
-SRCREV_contrib =3D "7292df62624ded8af8035231435dfd17c93e1a80"=0A=
-SRCREV_ipp =3D "32e315a5b106a7b89dbed51c28f8120a48b368b4"=0A=
-SRCREV_boostdesc =3D "34e4206aef44d50e6bbcd0ab06354b52e7466d26"=0A=
-SRCREV_vgg =3D "fccf7cd6a4b12079f73bbfb21745f9babcd4eb1d"=0A=
-SRC_URI[tinydnn.md5sum] =3D "adb1c512e09ca2c7a6faef36f9c53e59"=0A=
-SRC_URI[tinydnn.sha256sum] =3D "e2c61ce8c5debaa644121179e9dbdcf83f497f39de=
853f8dd5175846505aa18b"=0A=
-=0A=
-def ipp_filename(d):=0A=
-    import re=0A=
-    arch =3D d.getVar('TARGET_ARCH')=0A=
-    if re.match("i.86$", arch):=0A=
-        return "ippicv_2019_lnx_ia32_general_20180723.tgz"=0A=
-    else:=0A=
-        return "ippicv_2019_lnx_intel64_general_20180723.tgz"=0A=
-=0A=
-def ipp_md5sum(d):=0A=
-    import re=0A=
-    arch =3D d.getVar('TARGET_ARCH')=0A=
-    if re.match("i.86$", arch):=0A=
-        return "4f38432c30bfd6423164b7a24bbc98a0"=0A=
-    else:=0A=
-        return "c0bd78adb4156bbf552c1dfe90599607"=0A=
-=0A=
-IPP_FILENAME =3D "${@ipp_filename(d)}"=0A=
-IPP_MD5 =3D "${@ipp_md5sum(d)}"=0A=
-=0A=
-SRCREV_FORMAT =3D "opencv_contrib_ipp_boostdesc_vgg"=0A=
-SRC_URI =3D "git://github.com/opencv/opencv.git;name=3Dopencv \=0A=
-    git://github.com/opencv/opencv_contrib.git;destsuffix=3Dcontrib;name=
=3Dcontrib \=0A=
-    git://github.com/opencv/opencv_3rdparty.git;branch=3Dippicv/master_201=
80723;destsuffix=3Dipp;name=3Dipp \=0A=
-    git://github.com/opencv/opencv_3rdparty.git;branch=3Dcontrib_xfeatures=
2d_boostdesc_20161012;destsuffix=3Dboostdesc;name=3Dboostdesc \=0A=
-    git://github.com/opencv/opencv_3rdparty.git;branch=3Dcontrib_xfeatures=
2d_vgg_20160317;destsuffix=3Dvgg;name=3Dvgg \=0A=
-    https://github.com/tiny-dnn/tiny-dnn/archive/v1.0.0a3.tar.gz;destsuffi=
x=3Dgit/3rdparty/tinydnn/tiny-dnn-1.0.0a3;name=3Dtinydnn;unpack=3Dfalse \=
=0A=
-    file://0001-3rdparty-ippicv-Use-pre-downloaded-ipp.patch \=0A=
-    file://uselocalxfeatures.patch;patchdir=3D../contrib/ \=0A=
-    file://0002-Make-opencv-ts-create-share-library-intead-of-static.patch=
 \=0A=
-    file://0003-To-fix-errors-as-following.patch \=0A=
-    file://fixpkgconfig.patch \=0A=
-    file://0001-Temporarliy-work-around-deprecated-ffmpeg-RAW-functi.patch=
 \=0A=
-    file://0001-Dont-use-isystem.patch \=0A=
-"=0A=
-PV =3D "3.4.5"=0A=
-=0A=
-S =3D "${WORKDIR}/git"=0A=
-=0A=
-do_unpack_extra() {=0A=
-    mkdir -p ${S}/3rdparty/tinydnn/=0A=
-    tar xzf ${WORKDIR}/v1.0.0a3.tar.gz -C ${S}/3rdparty/tinydnn/=0A=
-    tar xzf ${WORKDIR}/ipp/ippicv/${IPP_FILENAME} -C ${WORKDIR}=0A=
-    cp ${WORKDIR}/vgg/*.i ${WORKDIR}/contrib/modules/xfeatures2d/src=0A=
-    cp ${WORKDIR}/boostdesc/*.i ${WORKDIR}/contrib/modules/xfeatures2d/src=
=0A=
-}=0A=
-addtask unpack_extra after do_unpack before do_patch=0A=
-=0A=
-EXTRA_OECMAKE =3D "-DOPENCV_EXTRA_MODULES_PATH=3D${WORKDIR}/contrib/module=
s \=0A=
-    -DWITH_1394=3DOFF \=0A=
-    -DENABLE_PRECOMPILED_HEADERS=3DOFF \=0A=
-    -DCMAKE_SKIP_RPATH=3DON \=0A=
-    -DOPENCV_ICV_HASH=3D${IPP_MD5} \=0A=
-    -DIPPROOT=3D${WORKDIR}/ippicv_lnx \=0A=
-    ${@bb.utils.contains("TARGET_CC_ARCH", "-msse3", "-DENABLE_SSE=3D1 -DE=
NABLE_SSE2=3D1 -DENABLE_SSE3=3D1 -DENABLE_SSSE3=3D1", "", d)} \=0A=
-    ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.1", "-DENABLE_SSE=3D1 -=
DENABLE_SSE2=3D1 -DENABLE_SSE3=3D1 -DENABLE_SSSE3=3D1 -DENABLE_SSE41=3D1", =
"", d)} \=0A=
-    ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.2", "-DENABLE_SSE=3D1 -=
DENABLE_SSE2=3D1 -DENABLE_SSE3=3D1 -DENABLE_SSSE3=3D1 -DENABLE_SSE41=3D1 -D=
ENABLE_SSE42=3D1", "", d)} \=0A=
-"=0A=
-EXTRA_OECMAKE_append_x86 =3D " -DX86=3DON"=0A=
-=0A=
-PACKAGECONFIG ??=3D "python3 eigen jpeg png tiff v4l libv4l gstreamer samp=
les tbb gphoto2 \=0A=
-    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gtk", "", d)} \=0A=
-    ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "libav",=
 "", d)}"=0A=
-=0A=
-PACKAGECONFIG[amdblas] =3D "-DWITH_OPENCLAMDBLAS=3DON,-DWITH_OPENCLAMDBLAS=
=3DOFF,libclamdblas,"=0A=
-PACKAGECONFIG[amdfft] =3D "-DWITH_OPENCLAMDFFT=3DON,-DWITH_OPENCLAMDFFT=3D=
OFF,libclamdfft,"=0A=
-PACKAGECONFIG[dnn] =3D "-DBUILD_opencv_dnn=3DON -DPROTOBUF_UPDATE_FILES=3D=
ON -DBUILD_PROTOBUF=3DOFF,-DBUILD_opencv_dnn=3DOFF,protobuf protobuf-native=
,"=0A=
-PACKAGECONFIG[eigen] =3D "-DWITH_EIGEN=3DON,-DWITH_EIGEN=3DOFF,libeigen gf=
lags glog,"=0A=
-PACKAGECONFIG[freetype] =3D "-DBUILD_opencv_freetype=3DON,-DBUILD_opencv_f=
reetype=3DOFF,freetype,"=0A=
-PACKAGECONFIG[gphoto2] =3D "-DWITH_GPHOTO2=3DON,-DWITH_GPHOTO2=3DOFF,libgp=
hoto2,"=0A=
-PACKAGECONFIG[gstreamer] =3D "-DWITH_GSTREAMER=3DON,-DWITH_GSTREAMER=3DOFF=
,gstreamer1.0 gstreamer1.0-plugins-base,"=0A=
-PACKAGECONFIG[gtk] =3D "-DWITH_GTK=3DON,-DWITH_GTK=3DOFF,gtk+3,"=0A=
-PACKAGECONFIG[jasper] =3D "-DWITH_JASPER=3DON,-DWITH_JASPER=3DOFF,jasper,"=
=0A=
-PACKAGECONFIG[java] =3D "-DJAVA_INCLUDE_PATH=3D${JAVA_HOME}/include -DJAVA=
_INCLUDE_PATH2=3D${JAVA_HOME}/include/linux -DJAVA_AWT_INCLUDE_PATH=3D${JAV=
A_HOME}/include -DJAVA_AWT_LIBRARY=3D${JAVA_HOME}/lib/amd64/libjawt.so -DJA=
VA_JVM_LIBRARY=3D${JAVA_HOME}/lib/amd64/server/libjvm.so,,ant-native fastja=
r-native openjdk-8-native,"=0A=
-PACKAGECONFIG[jpeg] =3D "-DWITH_JPEG=3DON,-DWITH_JPEG=3DOFF,jpeg,"=0A=
-PACKAGECONFIG[libav] =3D "-DWITH_FFMPEG=3DON,-DWITH_FFMPEG=3DOFF,libav,"=
=0A=
-PACKAGECONFIG[libv4l] =3D "-DWITH_LIBV4L=3DON,-DWITH_LIBV4L=3DOFF,v4l-util=
s,"=0A=
-PACKAGECONFIG[opencl] =3D "-DWITH_OPENCL=3DON,-DWITH_OPENCL=3DOFF,opencl-h=
eaders virtual/opencl-icd,"=0A=
-PACKAGECONFIG[oracle-java] =3D "-DJAVA_INCLUDE_PATH=3D${ORACLE_JAVA_HOME}/=
include -DJAVA_INCLUDE_PATH2=3D${ORACLE_JAVA_HOME}/include/linux -DJAVA_AWT=
_INCLUDE_PATH=3D${ORACLE_JAVA_HOME}/include -DJAVA_AWT_LIBRARY=3D${ORACLE_J=
AVA_HOME}/lib/amd64/libjawt.so -DJAVA_JVM_LIBRARY=3D${ORACLE_JAVA_HOME}/lib=
/amd64/server/libjvm.so,,ant-native oracle-jse-jdk oracle-jse-jdk-native,"=
=0A=
-PACKAGECONFIG[png] =3D "-DWITH_PNG=3DON,-DWITH_PNG=3DOFF,libpng,"=0A=
-PACKAGECONFIG[python2] =3D "-DPYTHON2_NUMPY_INCLUDE_DIRS:PATH=3D${STAGING_=
LIBDIR}/${PYTHON_DIR}/site-packages/numpy/core/include,,python-numpy,"=0A=
-PACKAGECONFIG[python3] =3D "-DPYTHON3_NUMPY_INCLUDE_DIRS:PATH=3D${STAGING_=
LIBDIR}/${PYTHON_DIR}/site-packages/numpy/core/include,,python3-numpy,"=0A=
-PACKAGECONFIG[samples] =3D "-DBUILD_EXAMPLES=3DON -DINSTALL_PYTHON_EXAMPLE=
S=3DON,-DBUILD_EXAMPLES=3DOFF,,"=0A=
-PACKAGECONFIG[tbb] =3D "-DWITH_TBB=3DON,-DWITH_TBB=3DOFF,tbb,"=0A=
-PACKAGECONFIG[text] =3D "-DBUILD_opencv_text=3DON,-DBUILD_opencv_text=3DOF=
F,tesseract,"=0A=
-PACKAGECONFIG[tiff] =3D "-DWITH_TIFF=3DON,-DWITH_TIFF=3DOFF,tiff,"=0A=
-PACKAGECONFIG[v4l] =3D "-DWITH_V4L=3DON,-DWITH_V4L=3DOFF,v4l-utils,"=0A=
-=0A=
-inherit pkgconfig cmake=0A=
-=0A=
-inherit ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'distutils3-base'=
, '', d)}=0A=
-inherit ${@bb.utils.contains('PACKAGECONFIG', 'python2', 'distutils-base',=
 '', d)}=0A=
-=0A=
-export PYTHON_CSPEC=3D"-I${STAGING_INCDIR}/${PYTHON_DIR}"=0A=
-export PYTHON=3D"${STAGING_BINDIR_NATIVE}/${@bb.utils.contains('PACKAGECON=
FIG', 'python3', 'python3', 'python', d)}"=0A=
-export ORACLE_JAVA_HOME=3D"${STAGING_DIR_NATIVE}/usr/bin/java"=0A=
-export JAVA_HOME=3D"${STAGING_DIR_NATIVE}/usr/lib/jvm/openjdk-8-native"=0A=
-export ANT_DIR=3D"${STAGING_DIR_NATIVE}/usr/share/ant/"=0A=
-=0A=
-TARGET_CC_ARCH +=3D "-I${S}/include "=0A=
-=0A=
-PACKAGES +=3D "${@bb.utils.contains('PACKAGECONFIG', 'samples', '${PN}-sam=
ples', '', d)} \=0A=
-    ${@bb.utils.contains('PACKAGECONFIG', 'oracle-java', '${PN}-java', '',=
 d)} \=0A=
-    ${@bb.utils.contains('PACKAGECONFIG', 'java', '${PN}-java', '', d)} \=
=0A=
-    ${@bb.utils.contains('PACKAGECONFIG', 'python2', 'python-${BPN}', '', =
d)} \=0A=
-    ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3-${BPN}', '',=
 d)} \=0A=
-    ${PN}-apps"=0A=
-=0A=
-python populate_packages_prepend () {=0A=
-    cv_libdir =3D d.expand('${libdir}')=0A=
-    do_split_packages(d, cv_libdir, '^lib(.*)\.so$', 'lib%s-dev', 'OpenCV =
%s development package', extra_depends=3D'${PN}-dev', allow_links=3DTrue)=
=0A=
-    do_split_packages(d, cv_libdir, '^lib(.*)\.la$', 'lib%s-dev', 'OpenCV =
%s development package', extra_depends=3D'${PN}-dev')=0A=
-    do_split_packages(d, cv_libdir, '^lib(.*)\.a$', 'lib%s-dev', 'OpenCV %=
s development package', extra_depends=3D'${PN}-dev')=0A=
-    do_split_packages(d, cv_libdir, '^lib(.*)\.so\.*', 'lib%s', 'OpenCV %s=
 library', extra_depends=3D'', allow_links=3DTrue)=0A=
-=0A=
-    pn =3D d.getVar('PN')=0A=
-    metapkg =3D  pn + '-dev'=0A=
-    d.setVar('ALLOW_EMPTY_' + metapkg, "1")=0A=
-    blacklist =3D [ metapkg ]=0A=
-    metapkg_rdepends =3D [ ]=0A=
-    packages =3D d.getVar('PACKAGES').split()=0A=
-    for pkg in packages[1:]:=0A=
-        if not pkg in blacklist and not pkg in metapkg_rdepends and pkg.en=
dswith('-dev'):=0A=
-            metapkg_rdepends.append(pkg)=0A=
-    d.setVar('RRECOMMENDS_' + metapkg, ' '.join(metapkg_rdepends))=0A=
-=0A=
-    metapkg =3D  pn=0A=
-    d.setVar('ALLOW_EMPTY_' + metapkg, "1")=0A=
-    blacklist =3D [ metapkg, "libopencv-ts" ]=0A=
-    metapkg_rdepends =3D [ ]=0A=
-    for pkg in packages[1:]:=0A=
-        if not pkg in blacklist and not pkg in metapkg_rdepends and not pk=
g.endswith('-dev') and not pkg.endswith('-dbg') and not pkg.endswith('-doc'=
) and not pkg.endswith('-locale') and not pkg.endswith('-staticdev'):=0A=
-            metapkg_rdepends.append(pkg)=0A=
-    d.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends))=0A=
-}=0A=
-=0A=
-PACKAGES_DYNAMIC +=3D "^libopencv-.*"=0A=
-=0A=
-FILES_${PN} =3D ""=0A=
-FILES_${PN}-dbg +=3D "${datadir}/OpenCV/java/.debug/* ${datadir}/OpenCV/sa=
mples/bin/.debug/*"=0A=
-FILES_${PN}-dev =3D "${includedir} ${libdir}/pkgconfig ${datadir}/OpenCV/*=
.cmake"=0A=
-FILES_${PN}-staticdev +=3D "${datadir}/OpenCV/3rdparty/lib/*.a"=0A=
-FILES_${PN}-apps =3D "${bindir}/* ${datadir}/OpenCV"=0A=
-FILES_${PN}-java =3D "${datadir}/OpenCV/java"=0A=
-FILES_${PN}-samples =3D "${datadir}/OpenCV/samples/"=0A=
-=0A=
-INSANE_SKIP_${PN}-java =3D "libdir"=0A=
-INSANE_SKIP_${PN}-dbg =3D "libdir"=0A=
-=0A=
-ALLOW_EMPTY_${PN} =3D "1"=0A=
-=0A=
-SUMMARY_python-opencv =3D "Python bindings to opencv"=0A=
-FILES_python-opencv =3D "${PYTHON_SITEPACKAGES_DIR}/*"=0A=
-RDEPENDS_python-opencv =3D "python-core python-numpy"=0A=
-=0A=
-SUMMARY_python3-opencv =3D "Python bindings to opencv"=0A=
-FILES_python3-opencv =3D "${PYTHON_SITEPACKAGES_DIR}/*"=0A=
-RDEPENDS_python3-opencv =3D "python3-core python3-numpy"=0A=
-=0A=
-RDEPENDS_${PN}-apps  =3D "bash"=0A=
-=0A=
-do_install_append() {=0A=
-    cp ${S}/include/opencv/*.h ${D}${includedir}/opencv/=0A=
-    sed -i '/blobtrack/d' ${D}${includedir}/opencv/cvaux.h=0A=
-=0A=
-    # Move Python files into correct library folder (for multilib build)=
=0A=
-    if [ "$libdir" !=3D "/usr/lib" -a -d ${D}/usr/lib ]; then=0A=
-        mv ${D}/usr/lib/* ${D}/${libdir}/=0A=
-        rm -rf ${D}/usr/lib=0A=
-    fi=0A=
-}=0A=
diff --git a/meta-oe/recipes-support/opencv/opencv_4.1.0.bb b/meta-oe/recip=
es-support/opencv/opencv_4.1.0.bb=0A=
new file mode 100644=0A=
index 0000000..77b5dd6=0A=
--- /dev/null=0A=
+++ b/meta-oe/recipes-support/opencv/opencv_4.1.0.bb=0A=
@@ -0,0 +1,180 @@=0A=
+SUMMARY =3D "Opencv : The Open Computer Vision Library"=0A=
+HOMEPAGE =3D "http://opencv.org/"=0A=
+SECTION =3D "libs"=0A=
+=0A=
+LICENSE =3D "BSD-3-Clause"=0A=
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6450921bb12a3133c8f5cb2a8034371=
0"=0A=
+=0A=
+ARM_INSTRUCTION_SET_armv4 =3D "arm"=0A=
+ARM_INSTRUCTION_SET_armv5 =3D "arm"=0A=
+=0A=
+DEPENDS =3D "libtool swig-native bzip2 zlib glib-2.0 libwebp"=0A=
+=0A=
+SRCREV_opencv =3D "371bba8f54560b374fbcd47e7e02f015ac4969ad"=0A=
+SRCREV_contrib =3D "2c32791a9c500343568a21ea34bf2daeac2adae7"=0A=
+SRCREV_ipp =3D "32e315a5b106a7b89dbed51c28f8120a48b368b4"=0A=
+SRCREV_boostdesc =3D "34e4206aef44d50e6bbcd0ab06354b52e7466d26"=0A=
+SRCREV_vgg =3D "fccf7cd6a4b12079f73bbfb21745f9babcd4eb1d"=0A=
+=0A=
+def ipp_filename(d):=0A=
+    import re=0A=
+    arch =3D d.getVar('TARGET_ARCH')=0A=
+    if re.match("i.86$", arch):=0A=
+        return "ippicv_2019_lnx_ia32_general_20180723.tgz"=0A=
+    else:=0A=
+        return "ippicv_2019_lnx_intel64_general_20180723.tgz"=0A=
+=0A=
+def ipp_md5sum(d):=0A=
+    import re=0A=
+    arch =3D d.getVar('TARGET_ARCH')=0A=
+    if re.match("i.86$", arch):=0A=
+        return "4f38432c30bfd6423164b7a24bbc98a0"=0A=
+    else:=0A=
+        return "c0bd78adb4156bbf552c1dfe90599607"=0A=
+=0A=
+IPP_FILENAME =3D "${@ipp_filename(d)}"=0A=
+IPP_MD5 =3D "${@ipp_md5sum(d)}"=0A=
+=0A=
+SRCREV_FORMAT =3D "opencv_contrib_ipp_boostdesc_vgg"=0A=
+SRC_URI =3D "git://github.com/opencv/opencv.git;name=3Dopencv \=0A=
+           git://github.com/opencv/opencv_contrib.git;destsuffix=3Dcontrib=
;name=3Dcontrib \=0A=
+           git://github.com/opencv/opencv_3rdparty.git;branch=3Dippicv/mas=
ter_20180723;destsuffix=3Dipp;name=3Dipp \=0A=
+           git://github.com/opencv/opencv_3rdparty.git;branch=3Dcontrib_xf=
eatures2d_boostdesc_20161012;destsuffix=3Dboostdesc;name=3Dboostdesc \=0A=
+           git://github.com/opencv/opencv_3rdparty.git;branch=3Dcontrib_xf=
eatures2d_vgg_20160317;destsuffix=3Dvgg;name=3Dvgg \=0A=
+           file://0001-3rdparty-ippicv-Use-pre-downloaded-ipp.patch \=0A=
+           file://0002-Make-opencv-ts-create-share-library-intead-of-stati=
c.patch \=0A=
+           file://0003-To-fix-errors-as-following.patch \=0A=
+           file://0001-Temporarliy-work-around-deprecated-ffmpeg-RAW-funct=
i.patch \=0A=
+           file://0001-Dont-use-isystem.patch \=0A=
+           "=0A=
+PV =3D "4.1.0"=0A=
+=0A=
+S =3D "${WORKDIR}/git"=0A=
+=0A=
+do_unpack_extra() {=0A=
+    tar xzf ${WORKDIR}/ipp/ippicv/${IPP_FILENAME} -C ${WORKDIR}=0A=
+    cp ${WORKDIR}/vgg/*.i ${WORKDIR}/contrib/modules/xfeatures2d/src=0A=
+    cp ${WORKDIR}/boostdesc/*.i ${WORKDIR}/contrib/modules/xfeatures2d/src=
=0A=
+}=0A=
+addtask unpack_extra after do_unpack before do_patch=0A=
+=0A=
+EXTRA_OECMAKE =3D "-DOPENCV_EXTRA_MODULES_PATH=3D${WORKDIR}/contrib/module=
s \=0A=
+    -DWITH_1394=3DOFF \=0A=
+    -DENABLE_PRECOMPILED_HEADERS=3DOFF \=0A=
+    -DCMAKE_SKIP_RPATH=3DON \=0A=
+    -DOPENCV_ICV_HASH=3D${IPP_MD5} \=0A=
+    -DIPPROOT=3D${WORKDIR}/ippicv_lnx \=0A=
+    ${@bb.utils.contains("TARGET_CC_ARCH", "-msse3", "-DENABLE_SSE=3D1 -DE=
NABLE_SSE2=3D1 -DENABLE_SSE3=3D1 -DENABLE_SSSE3=3D1", "", d)} \=0A=
+    ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.1", "-DENABLE_SSE=3D1 -=
DENABLE_SSE2=3D1 -DENABLE_SSE3=3D1 -DENABLE_SSSE3=3D1 -DENABLE_SSE41=3D1", =
"", d)} \=0A=
+    ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.2", "-DENABLE_SSE=3D1 -=
DENABLE_SSE2=3D1 -DENABLE_SSE3=3D1 -DENABLE_SSSE3=3D1 -DENABLE_SSE41=3D1 -D=
ENABLE_SSE42=3D1", "", d)} \=0A=
+"=0A=
+EXTRA_OECMAKE_append_x86 =3D " -DX86=3DON"=0A=
+=0A=
+PACKAGECONFIG ??=3D "python3 eigen jpeg png tiff v4l libv4l gstreamer samp=
les tbb gphoto2 \=0A=
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gtk", "", d)} \=0A=
+    ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "libav",=
 "", d)}"=0A=
+=0A=
+PACKAGECONFIG[amdblas] =3D "-DWITH_OPENCLAMDBLAS=3DON,-DWITH_OPENCLAMDBLAS=
=3DOFF,libclamdblas,"=0A=
+PACKAGECONFIG[amdfft] =3D "-DWITH_OPENCLAMDFFT=3DON,-DWITH_OPENCLAMDFFT=3D=
OFF,libclamdfft,"=0A=
+PACKAGECONFIG[dnn] =3D "-DBUILD_opencv_dnn=3DON -DPROTOBUF_UPDATE_FILES=3D=
ON -DBUILD_PROTOBUF=3DOFF,-DBUILD_opencv_dnn=3DOFF,protobuf protobuf-native=
,"=0A=
+PACKAGECONFIG[eigen] =3D "-DWITH_EIGEN=3DON,-DWITH_EIGEN=3DOFF,libeigen gf=
lags glog,"=0A=
+PACKAGECONFIG[freetype] =3D "-DBUILD_opencv_freetype=3DON,-DBUILD_opencv_f=
reetype=3DOFF,freetype,"=0A=
+PACKAGECONFIG[gphoto2] =3D "-DWITH_GPHOTO2=3DON,-DWITH_GPHOTO2=3DOFF,libgp=
hoto2,"=0A=
+PACKAGECONFIG[gstreamer] =3D "-DWITH_GSTREAMER=3DON,-DWITH_GSTREAMER=3DOFF=
,gstreamer1.0 gstreamer1.0-plugins-base,"=0A=
+PACKAGECONFIG[gtk] =3D "-DWITH_GTK=3DON,-DWITH_GTK=3DOFF,gtk+3,"=0A=
+PACKAGECONFIG[jasper] =3D "-DWITH_JASPER=3DON,-DWITH_JASPER=3DOFF,jasper,"=
=0A=
+PACKAGECONFIG[java] =3D "-DJAVA_INCLUDE_PATH=3D${JAVA_HOME}/include -DJAVA=
_INCLUDE_PATH2=3D${JAVA_HOME}/include/linux -DJAVA_AWT_INCLUDE_PATH=3D${JAV=
A_HOME}/include -DJAVA_AWT_LIBRARY=3D${JAVA_HOME}/lib/amd64/libjawt.so -DJA=
VA_JVM_LIBRARY=3D${JAVA_HOME}/lib/amd64/server/libjvm.so,,ant-native fastja=
r-native openjdk-8-native,"=0A=
+PACKAGECONFIG[jpeg] =3D "-DWITH_JPEG=3DON,-DWITH_JPEG=3DOFF,jpeg,"=0A=
+PACKAGECONFIG[libav] =3D "-DWITH_FFMPEG=3DON,-DWITH_FFMPEG=3DOFF,libav,"=
=0A=
+PACKAGECONFIG[libv4l] =3D "-DWITH_LIBV4L=3DON,-DWITH_LIBV4L=3DOFF,v4l-util=
s,"=0A=
+PACKAGECONFIG[opencl] =3D "-DWITH_OPENCL=3DON,-DWITH_OPENCL=3DOFF,opencl-h=
eaders virtual/opencl-icd,"=0A=
+PACKAGECONFIG[oracle-java] =3D "-DJAVA_INCLUDE_PATH=3D${ORACLE_JAVA_HOME}/=
include -DJAVA_INCLUDE_PATH2=3D${ORACLE_JAVA_HOME}/include/linux -DJAVA_AWT=
_INCLUDE_PATH=3D${ORACLE_JAVA_HOME}/include -DJAVA_AWT_LIBRARY=3D${ORACLE_J=
AVA_HOME}/lib/amd64/libjawt.so -DJAVA_JVM_LIBRARY=3D${ORACLE_JAVA_HOME}/lib=
/amd64/server/libjvm.so,,ant-native oracle-jse-jdk oracle-jse-jdk-native,"=
=0A=
+PACKAGECONFIG[png] =3D "-DWITH_PNG=3DON,-DWITH_PNG=3DOFF,libpng,"=0A=
+PACKAGECONFIG[python2] =3D "-DPYTHON2_NUMPY_INCLUDE_DIRS:PATH=3D${STAGING_=
LIBDIR}/${PYTHON_DIR}/site-packages/numpy/core/include,,python-numpy,"=0A=
+PACKAGECONFIG[python3] =3D "-DPYTHON3_NUMPY_INCLUDE_DIRS:PATH=3D${STAGING_=
LIBDIR}/${PYTHON_DIR}/site-packages/numpy/core/include,,python3-numpy,"=0A=
+PACKAGECONFIG[samples] =3D "-DBUILD_EXAMPLES=3DON -DINSTALL_PYTHON_EXAMPLE=
S=3DON,-DBUILD_EXAMPLES=3DOFF,,"=0A=
+PACKAGECONFIG[tbb] =3D "-DWITH_TBB=3DON,-DWITH_TBB=3DOFF,tbb,"=0A=
+PACKAGECONFIG[text] =3D "-DBUILD_opencv_text=3DON,-DBUILD_opencv_text=3DOF=
F,tesseract,"=0A=
+PACKAGECONFIG[tiff] =3D "-DWITH_TIFF=3DON,-DWITH_TIFF=3DOFF,tiff,"=0A=
+PACKAGECONFIG[v4l] =3D "-DWITH_V4L=3DON,-DWITH_V4L=3DOFF,v4l-utils,"=0A=
+=0A=
+inherit pkgconfig cmake=0A=
+=0A=
+inherit ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'distutils3-base'=
, '', d)}=0A=
+inherit ${@bb.utils.contains('PACKAGECONFIG', 'python2', 'distutils-base',=
 '', d)}=0A=
+=0A=
+export PYTHON_CSPEC=3D"-I${STAGING_INCDIR}/${PYTHON_DIR}"=0A=
+export PYTHON=3D"${STAGING_BINDIR_NATIVE}/${@bb.utils.contains('PACKAGECON=
FIG', 'python3', 'python3', 'python', d)}"=0A=
+export ORACLE_JAVA_HOME=3D"${STAGING_DIR_NATIVE}/usr/bin/java"=0A=
+export JAVA_HOME=3D"${STAGING_DIR_NATIVE}/usr/lib/jvm/openjdk-8-native"=0A=
+export ANT_DIR=3D"${STAGING_DIR_NATIVE}/usr/share/ant/"=0A=
+=0A=
+TARGET_CC_ARCH +=3D "-I${S}/include "=0A=
+=0A=
+PACKAGES +=3D "${@bb.utils.contains('PACKAGECONFIG', 'samples', '${PN}-sam=
ples', '', d)} \=0A=
+    ${@bb.utils.contains('PACKAGECONFIG', 'oracle-java', '${PN}-java', '',=
 d)} \=0A=
+    ${@bb.utils.contains('PACKAGECONFIG', 'java', '${PN}-java', '', d)} \=
=0A=
+    ${@bb.utils.contains('PACKAGECONFIG', 'python2', 'python-${BPN}', '', =
d)} \=0A=
+    ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3-${BPN}', '',=
 d)} \=0A=
+    ${PN}-apps"=0A=
+=0A=
+python populate_packages_prepend () {=0A=
+    cv_libdir =3D d.expand('${libdir}')=0A=
+    do_split_packages(d, cv_libdir, '^lib(.*)\.so$', 'lib%s-dev', 'OpenCV =
%s development package', extra_depends=3D'${PN}-dev', allow_links=3DTrue)=
=0A=
+    do_split_packages(d, cv_libdir, '^lib(.*)\.la$', 'lib%s-dev', 'OpenCV =
%s development package', extra_depends=3D'${PN}-dev')=0A=
+    do_split_packages(d, cv_libdir, '^lib(.*)\.a$', 'lib%s-dev', 'OpenCV %=
s development package', extra_depends=3D'${PN}-dev')=0A=
+    do_split_packages(d, cv_libdir, '^lib(.*)\.so\.*', 'lib%s', 'OpenCV %s=
 library', extra_depends=3D'', allow_links=3DTrue)=0A=
+=0A=
+    pn =3D d.getVar('PN')=0A=
+    metapkg =3D  pn + '-dev'=0A=
+    d.setVar('ALLOW_EMPTY_' + metapkg, "1")=0A=
+    blacklist =3D [ metapkg ]=0A=
+    metapkg_rdepends =3D [ ]=0A=
+    packages =3D d.getVar('PACKAGES').split()=0A=
+    for pkg in packages[1:]:=0A=
+        if not pkg in blacklist and not pkg in metapkg_rdepends and pkg.en=
dswith('-dev'):=0A=
+            metapkg_rdepends.append(pkg)=0A=
+    d.setVar('RRECOMMENDS_' + metapkg, ' '.join(metapkg_rdepends))=0A=
+=0A=
+    metapkg =3D  pn=0A=
+    d.setVar('ALLOW_EMPTY_' + metapkg, "1")=0A=
+    blacklist =3D [ metapkg, "libopencv-ts" ]=0A=
+    metapkg_rdepends =3D [ ]=0A=
+    for pkg in packages[1:]:=0A=
+        if not pkg in blacklist and not pkg in metapkg_rdepends and not pk=
g.endswith('-dev') and not pkg.endswith('-dbg') and not pkg.endswith('-doc'=
) and not pkg.endswith('-locale') and not pkg.endswith('-staticdev'):=0A=
+            metapkg_rdepends.append(pkg)=0A=
+    d.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends))=0A=
+}=0A=
+=0A=
+PACKAGES_DYNAMIC +=3D "^libopencv-.*"=0A=
+=0A=
+FILES_${PN} =3D ""=0A=
+FILES_${PN}-dbg +=3D "${datadir}/OpenCV/java/.debug/* ${datadir}/OpenCV/sa=
mples/bin/.debug/*"=0A=
+FILES_${PN}-dev =3D "${includedir} ${libdir}/pkgconfig  ${libdir}/cmake/op=
encv4/*.cmake"=0A=
+FILES_${PN}-staticdev +=3D "${libdir}/opencv4/3rdparty/*.a"=0A=
+FILES_${PN}-apps =3D "${bindir}/* ${datadir}/opencv4 ${datadir}/licenses"=
=0A=
+FILES_${PN}-java =3D "${datadir}/OpenCV/java"=0A=
+FILES_${PN}-samples =3D "${datadir}/opencv4/samples/"=0A=
+=0A=
+INSANE_SKIP_${PN}-java =3D "libdir"=0A=
+INSANE_SKIP_${PN}-dbg =3D "libdir"=0A=
+=0A=
+ALLOW_EMPTY_${PN} =3D "1"=0A=
+=0A=
+SUMMARY_python-opencv =3D "Python bindings to opencv"=0A=
+FILES_python-opencv =3D "${PYTHON_SITEPACKAGES_DIR}/*"=0A=
+RDEPENDS_python-opencv =3D "python-core python-numpy"=0A=
+=0A=
+SUMMARY_python3-opencv =3D "Python bindings to opencv"=0A=
+FILES_python3-opencv =3D "${PYTHON_SITEPACKAGES_DIR}/*"=0A=
+RDEPENDS_python3-opencv =3D "python3-core python3-numpy"=0A=
+=0A=
+RDEPENDS_${PN}-apps  =3D "bash"=0A=
+=0A=
+do_install_append() {=0A=
+    # Move Python files into correct library folder (for multilib build)=
=0A=
+    if [ "$libdir" !=3D "/usr/lib" -a -d ${D}/usr/lib ]; then=0A=
+        mv ${D}/usr/lib/* ${D}/${libdir}/=0A=
+        rm -rf ${D}/usr/lib=0A=
+    fi=0A=
+}=0A=
--=0A=
2.7.4=0A=
=0A=

