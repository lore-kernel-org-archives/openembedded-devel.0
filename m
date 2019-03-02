Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0ADEE71AB3
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  2 Mar 2019 13:50:54 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id p48so587000qtk.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Mar 2019 05:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=9/+dufIbIzPGr8zwXejEqSJrJzHKCDbmv+4v6I+3BNs=;
	b=YCcQcerH6155SkMsH8PXsk2dJeqmQrXNGkEHNSpvc4vi+a7bPMl0RIwneHa+rx1Dqc
	IVSFw/8NmRmB9AdfSSlJvTvGLshS+jS3dHiWfOgtp1RLnKR699rZP4hAhBAz4E5uGjPu
	d3A1o1llUChQwgfPPxrpCC5kP66NkaNlhheli2SqzmCraEcNnuwOvIB6hXQIbxLXR9Is
	hjE3DMKZikHsmjWCBg1ZQ0yN8v2vr9OJ3zD+VYfrXKLa9LpBLMYiBp3opRGM9xHc2E1i
	Q2czcf15J9Zyj6/3vEo6ilmcoqqt31+81xCm4wbYcEGAxnKWS0ZoYvtRrqAvyEjBGlKj
	wpMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=9/+dufIbIzPGr8zwXejEqSJrJzHKCDbmv+4v6I+3BNs=;
	b=BoNeW9l8zlwWa0pMKVA6q8RHi+Z3MJQGWK9nSbhho5uUHk1MhTd1zfZ49qrmRPmF9l
	2/cznQiRL9eoQca0nNji688n/8KLe65O6NWooIIX8/Q3WJ2cgprGamnvAKWaXrfMSVD7
	4uNA/Pr+AhoqjfuTnBb84zg9ddFp3OXdxrUoRinKGAGgNMGVqJhFcaXkqkExEhyMxK43
	AxYD0jMbY7cn24q2bH+PFCPCPozV/LB9DWRiCsc/tqAf7FEmfjMACORQOxp0AwMof2qw
	bAas1Nwh1si0vAZKZp+EmpZLN5Oz2sCRuNjJEcuzA94FdsHSouw7vs5v+oyBUusU6lIO
	wVGA==
X-Gm-Message-State: APjAAAXlUX6kixBsinR7f6PmtaiO+WZag4SE/caGqKDq8sS+ghwdrCla
	U8POWhGLquhyxG5iTR4hnoDF+GzGjeH7CtPfJDY=
X-Google-Smtp-Source: APXvYqxvLtWpG96PEzyNG+eaGjjp92cYo9MhcX0cHLYp/PYp9lyTWBFPF2yDLjRT0mdwlwI8DQLGgWD0DuTxZpDjNIw=
X-Received: by 2002:ac8:2c51:: with SMTP id e17mr7909172qta.254.1551534655265; 
	Sat, 02 Mar 2019 05:50:55 -0800 (PST)
MIME-Version: 1.0
References: <20190302025034.10954-1-raj.khem@gmail.com>
	<CALbNGRTf6TvxoQmC=fxGyVo31xn8w5p2sdJ3+aHmpPVn=EAEEA@mail.gmail.com>
In-Reply-To: <CALbNGRTf6TvxoQmC=fxGyVo31xn8w5p2sdJ3+aHmpPVn=EAEEA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 2 Mar 2019 05:50:29 -0800
Message-ID: <CAMKF1sp9AYu_skZBkVXw8ezFpVF2mS4w41EFFvQDdTEuXBHs8Q@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/3] glm: Upgrade to 0.9.9.3
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
X-List-Received-Date: Sat, 02 Mar 2019 13:50:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 2, 2019 at 12:57 AM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> On Sat, Mar 2, 2019 at 3:50 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Drop local patches, they were not accepted upstream
> >
> > Fix build with clang while here
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Cc: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > ---
> >  ...E_EXPERIMENTAL-a-configurable-option.patch | 860 ------------------
> >  .../files/0002-glm-install-headers-only.patch |  46 -
> >  ...-Remove-redundant-double-semi-colons.patch | 120 +++
> >  .../glm/{glm_0.9.9-a2.bb =3D> glm_0.9.9.3.bb}   |   8 +-
> >  4 files changed, 123 insertions(+), 911 deletions(-)
> >  delete mode 100644 meta-oe/recipes-graphics/glm/files/0001-Make-GLM_EN=
ABLE_EXPERIMENTAL-a-configurable-option.patch
> >  delete mode 100644 meta-oe/recipes-graphics/glm/files/0002-glm-install=
-headers-only.patch
> >  create mode 100644 meta-oe/recipes-graphics/glm/glm/0001-glm-Remove-re=
dundant-double-semi-colons.patch
> >  rename meta-oe/recipes-graphics/glm/{glm_0.9.9-a2.bb =3D> glm_0.9.9.3.=
bb} (72%)
> >
> > diff --git a/meta-oe/recipes-graphics/glm/files/0001-Make-GLM_ENABLE_EX=
PERIMENTAL-a-configurable-option.patch b/meta-oe/recipes-graphics/glm/files=
/0001-Make-GLM_ENABLE_EXPERIMENTAL-a-configurable-option.patch
> > deleted file mode 100644
> > index d69c5af3af..0000000000
> > --- a/meta-oe/recipes-graphics/glm/files/0001-Make-GLM_ENABLE_EXPERIMEN=
TAL-a-configurable-option.patch
> > +++ /dev/null
> > @@ -1,860 +0,0 @@
> > -From 99a9676a0193f6291d7202d7af72e24580abe565 Mon Sep 17 00:00:00 2001
> > -From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail=
.com>
> > -Date: Fri, 16 Mar 2018 13:55:29 +0100
> > -Subject: [PATCH 1/2] Make GLM_ENABLE_EXPERIMENTAL a configurable optio=
n
> > -MIME-Version: 1.0
> > -Content-Type: text/plain; charset=3DUTF-8
> > -Content-Transfer-Encoding: 8bit
> > -
> > -It seems that erroring out if GLM_ENABLE_EXPERIMENTAL is not set turns=
 into
> > -packagers nightmare: There are packages around expecting glx headers. =
E.g
> > -libgltf [1] fails during configure checking for usable headers AND dur=
ing
> > -compile. Paticularly fixing configure for those packages is time-consu=
ming:
> > -The only way (correct me if I am wrong) is creating a patch adding
> > -
> > -AC_DEFINE([GLM_ENABLE_EXPERIMENTAL], [1], [glm needs this for gtx head=
ers])
> > -
> > -By adding a configure option 'GLM_ENABLE_EXPERIMENTAL', the decision t=
o use
> > -glm/glx is done at one (and the right) place.
> > -
> > -Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > -
> > -[1] https://gerrit.libreoffice.org/gitweb?p=3Dlibgltf.git
> > -
> > -Uptream-Status: Submitted [2]
> > -
> > -[2] https://github.com/g-truc/glm/pull/741
> > ----
> > - CMakeLists.txt                      | 6 ++++++
> > - glm/CMakeLists.txt                  | 2 ++
> > - glm/experimental.hpp.in             | 1 +
> > - glm/ext.hpp                         | 1 +
> > - glm/gtx/associated_min_max.hpp      | 1 +
> > - glm/gtx/bit.hpp                     | 1 +
> > - glm/gtx/closest_point.hpp           | 1 +
> > - glm/gtx/color_space.hpp             | 1 +
> > - glm/gtx/color_space_YCoCg.hpp       | 1 +
> > - glm/gtx/common.hpp                  | 1 +
> > - glm/gtx/compatibility.hpp           | 1 +
> > - glm/gtx/component_wise.hpp          | 1 +
> > - glm/gtx/dual_quaternion.hpp         | 1 +
> > - glm/gtx/euler_angles.hpp            | 1 +
> > - glm/gtx/extend.hpp                  | 1 +
> > - glm/gtx/extended_min_max.hpp        | 1 +
> > - glm/gtx/fast_exponential.hpp        | 1 +
> > - glm/gtx/fast_square_root.hpp        | 1 +
> > - glm/gtx/fast_trigonometry.hpp       | 1 +
> > - glm/gtx/gradient_paint.hpp          | 1 +
> > - glm/gtx/handed_coordinate_space.hpp | 1 +
> > - glm/gtx/hash.hpp                    | 1 +
> > - glm/gtx/integer.hpp                 | 1 +
> > - glm/gtx/intersect.hpp               | 1 +
> > - glm/gtx/io.hpp                      | 1 +
> > - glm/gtx/log_base.hpp                | 1 +
> > - glm/gtx/matrix_cross_product.hpp    | 1 +
> > - glm/gtx/matrix_decompose.hpp        | 1 +
> > - glm/gtx/matrix_factorisation.hpp    | 1 +
> > - glm/gtx/matrix_interpolation.hpp    | 1 +
> > - glm/gtx/matrix_major_storage.hpp    | 1 +
> > - glm/gtx/matrix_operation.hpp        | 1 +
> > - glm/gtx/matrix_query.hpp            | 1 +
> > - glm/gtx/matrix_transform_2d.hpp     | 1 +
> > - glm/gtx/mixed_product.hpp           | 1 +
> > - glm/gtx/norm.hpp                    | 1 +
> > - glm/gtx/normal.hpp                  | 1 +
> > - glm/gtx/normalize_dot.hpp           | 1 +
> > - glm/gtx/number_precision.hpp        | 1 +
> > - glm/gtx/optimum_pow.hpp             | 1 +
> > - glm/gtx/orthonormalize.hpp          | 1 +
> > - glm/gtx/perpendicular.hpp           | 1 +
> > - glm/gtx/polar_coordinates.hpp       | 1 +
> > - glm/gtx/projection.hpp              | 1 +
> > - glm/gtx/quaternion.hpp              | 1 +
> > - glm/gtx/range.hpp                   | 1 +
> > - glm/gtx/raw_data.hpp                | 1 +
> > - glm/gtx/rotate_normalized_axis.hpp  | 1 +
> > - glm/gtx/rotate_vector.hpp           | 1 +
> > - glm/gtx/scalar_multiplication.hpp   | 1 +
> > - glm/gtx/scalar_relational.hpp       | 1 +
> > - glm/gtx/spline.hpp                  | 1 +
> > - glm/gtx/std_based_type.hpp          | 1 +
> > - glm/gtx/string_cast.hpp             | 1 +
> > - glm/gtx/texture.hpp                 | 1 +
> > - glm/gtx/transform.hpp               | 1 +
> > - glm/gtx/transform2.hpp              | 1 +
> > - glm/gtx/type_aligned.hpp            | 1 +
> > - glm/gtx/type_trait.hpp              | 1 +
> > - glm/gtx/vec_swizzle.hpp             | 1 +
> > - glm/gtx/vector_angle.hpp            | 1 +
> > - glm/gtx/vector_query.hpp            | 1 +
> > - glm/gtx/wrap.hpp                    | 1 +
> > - 63 files changed, 69 insertions(+)
> > - create mode 100644 glm/experimental.hpp.in
> > -
> > -diff --git a/CMakeLists.txt b/CMakeLists.txt
> > -index e5159b0f..bd4dd654 100644
> > ---- a/CMakeLists.txt
> > -+++ b/CMakeLists.txt
> > -@@ -82,6 +82,11 @@ option(GLM_TEST_ENABLE_SIMD_AVX "Enable AVX optimiz=
ations" OFF)
> > - option(GLM_TEST_ENABLE_SIMD_AVX2 "Enable AVX2 optimizations" OFF)
> > - option(GLM_TEST_FORCE_PURE "Force 'pure' instructions" OFF)
> > -
> > -+option(GLM_ENABLE_EXPERIMENTAL "Enable experimental GLM_GTX" OFF)
> > -+configure_file(glm/experimental.hpp.in experimental.hpp @ONLY)
> > -+include_directories(${CMAKE_BINARY_DIR}/glm)
> > -+include_directories(${CMAKE_BINARY_DIR})
> > -+
> > - if(GLM_TEST_FORCE_PURE)
> > -       add_definitions(-DGLM_FORCE_PURE)
> > -
> > -@@ -167,6 +172,7 @@ option(GLM_INSTALL_ENABLE "GLM install" ON)
> > - set(GLM_INSTALL_CONFIGDIR "${CMAKE_INSTALL_LIBDIR}/cmake/glm")
> > - if (GLM_INSTALL_ENABLE)
> > -       install(DIRECTORY glm DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
> > -+      install(FILES "${CMAKE_CURRENT_BINARY_DIR}/experimental.hpp" DE=
STINATION ${CMAKE_INSTALL_INCLUDEDIR}/glm)
> > - endif()
> > -
> > - write_basic_package_version_file("${CMAKE_CURRENT_BINARY_DIR}/glmConf=
igVersion.cmake" VERSION ${GLM_VERSION} COMPATIBILITY AnyNewerVersion)
> > -diff --git a/glm/CMakeLists.txt b/glm/CMakeLists.txt
> > -index df9c9ee5..dc5db4bc 100644
> > ---- a/glm/CMakeLists.txt
> > -+++ b/glm/CMakeLists.txt
> > -@@ -43,6 +43,8 @@ source_group("SIMD Files" FILES ${SIMD_INLINE})
> > - source_group("SIMD Files" FILES ${SIMD_HEADER})
> > -
> > - include_directories(${CMAKE_CURRENT_SOURCE_DIR}/..)
> > -+# make out-of tree builds find experimental.hpp
> > -+include_directories(${CMAKE_BINARY_DIR}/glm)
> > -
> > - if(GLM_STATIC_LIBRARY_ENABLE OR GLM_DYNAMIC_LIBRARY_ENABLE)
> > -       if(GLM_STATIC_LIBRARY_ENABLE)
> > -diff --git a/glm/experimental.hpp.in b/glm/experimental.hpp.in
> > -new file mode 100644
> > -index 00000000..bfab5138
> > ---- /dev/null
> > -+++ b/glm/experimental.hpp.in
> > -@@ -0,0 +1 @@
> > -+#cmakedefine GLM_ENABLE_EXPERIMENTAL
> > -diff --git a/glm/ext.hpp b/glm/ext.hpp
> > -index d085bfd5..a2948447 100644
> > ---- a/glm/ext.hpp
> > -+++ b/glm/ext.hpp
> > -@@ -39,6 +39,7 @@
> > - #     include "./gtc/type_aligned.hpp"
> > - #endif
> > -
> > -+#include "experimental.hpp"
> > - #ifdef GLM_ENABLE_EXPERIMENTAL
> > - #include "./gtx/associated_min_max.hpp"
> > - #include "./gtx/bit.hpp"
> > -diff --git a/glm/gtx/associated_min_max.hpp b/glm/gtx/associated_min_m=
ax.hpp
> > -index 0c9935f3..d00c2bc4 100644
> > ---- a/glm/gtx/associated_min_max.hpp
> > -+++ b/glm/gtx/associated_min_max.hpp
> > -@@ -16,6 +16,7 @@
> > - // Dependency:
> > - #include "../glm.hpp"
> > -
> > -+#include "../experimental.hpp"
> > - #ifndef GLM_ENABLE_EXPERIMENTAL
> > - #     error "GLM: GTX_associated_min_max is an experimental extension=
 and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before i=
ncluding it, if you really want to use it."
> > - #endif
> > -diff --git a/glm/gtx/bit.hpp b/glm/gtx/bit.hpp
> > -index 1447fa00..31957083 100644
> > ---- a/glm/gtx/bit.hpp
> > -+++ b/glm/gtx/bit.hpp
> > -@@ -15,6 +15,7 @@
> > - // Dependencies
> > - #include "../gtc/bitfield.hpp"
> > -
> > -+#include "../experimental.hpp"
> > - #ifndef GLM_ENABLE_EXPERIMENTAL
> > - #     error "GLM: GLM_GTX_bit is an experimental extension and may ch=
ange in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including it=
, if you really want to use it."
> > - #endif
> > -diff --git a/glm/gtx/closest_point.hpp b/glm/gtx/closest_point.hpp
> > -index 6859bb96..ebd9fe5a 100644
> > ---- a/glm/gtx/closest_point.hpp
> > -+++ b/glm/gtx/closest_point.hpp
> > -@@ -15,6 +15,7 @@
> > - // Dependency:
> > - #include "../glm.hpp"
> > -
> > -+#include "../experimental.hpp"
> > - #ifndef GLM_ENABLE_EXPERIMENTAL
> > - #     error "GLM: GLM_GTX_closest_point is an experimental extension =
and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before in=
cluding it, if you really want to use it."
> > - #endif
> > -diff --git a/glm/gtx/color_space.hpp b/glm/gtx/color_space.hpp
> > -index d1e655c3..51416819 100644
> > ---- a/glm/gtx/color_space.hpp
> > -+++ b/glm/gtx/color_space.hpp
> > -@@ -15,6 +15,7 @@
> > - // Dependency:
> > - #include "../glm.hpp"
> > -
> > -+#include "../experimental.hpp"
> > - #ifndef GLM_ENABLE_EXPERIMENTAL
> > - #     error "GLM: GLM_GTX_color_space is an experimental extension an=
d may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before incl=
uding it, if you really want to use it."
> > - #endif
> > -diff --git a/glm/gtx/color_space_YCoCg.hpp b/glm/gtx/color_space_YCoCg=
.hpp
> > -index e82cbd8b..7ae71041 100644
> > ---- a/glm/gtx/color_space_YCoCg.hpp
> > -+++ b/glm/gtx/color_space_YCoCg.hpp
> > -@@ -15,6 +15,7 @@
> > - // Dependency:
> > - #include "../glm.hpp"
> > -
> > -+#include "../experimental.hpp"
> > - #ifndef GLM_ENABLE_EXPERIMENTAL
> > - #     error "GLM: GLM_GTX_color_space_YCoCg is an experimental extens=
ion and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL befor=
e including it, if you really want to use it."
> > - #endif
> > -diff --git a/glm/gtx/common.hpp b/glm/gtx/common.hpp
> > -index 8081bff7..57a68a8d 100644
> > ---- a/glm/gtx/common.hpp
> > -+++ b/glm/gtx/common.hpp
> > -@@ -18,6 +18,7 @@
> > - #include "../vec4.hpp"
> > - #include "../gtc/vec1.hpp"
> > -
> > -+#include "../experimental.hpp"
> > - #ifndef GLM_ENABLE_EXPERIMENTAL
> > - #     error "GLM: GLM_GTX_common is an experimental extension and may=
 change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including=
 it, if you really want to use it."
> > - #endif
> > -diff --git a/glm/gtx/compatibility.hpp b/glm/gtx/compatibility.hpp
> > -index e5b60399..9876669c 100644
> > ---- a/glm/gtx/compatibility.hpp
> > -+++ b/glm/gtx/compatibility.hpp
> > -@@ -16,6 +16,7 @@
> > - #include "../glm.hpp"
> > - #include "../gtc/quaternion.hpp"
> > -
> > -+#include "../experimental.hpp"
> > - #ifndef GLM_ENABLE_EXPERIMENTAL
> > - #     error "GLM: GLM_GTX_compatibility is an experimental extension =
and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before in=
cluding it, if you really want to use it."
> > - #endif
> > -diff --git a/glm/gtx/component_wise.hpp b/glm/gtx/component_wise.hpp
> > -index 39bab5d5..4fe0e4e2 100644
> > ---- a/glm/gtx/component_wise.hpp
> > -+++ b/glm/gtx/component_wise.hpp
> > -@@ -18,6 +18,7 @@
> > - #include "../detail/setup.hpp"
> > - #include "../detail/qualifier.hpp"
> > -
> > -+#include "../experimental.hpp"
> > - #ifndef GLM_ENABLE_EXPERIMENTAL
> > - #     error "GLM: GLM_GTX_component_wise is an experimental extension=
 and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before i=
ncluding it, if you really want to use it."
> > - #endif
> > -diff --git a/glm/gtx/dual_quaternion.hpp b/glm/gtx/dual_quaternion.hpp
> > -index c4343e9d..d59fb459 100644
> > ---- a/glm/gtx/dual_quaternion.hpp
> > -+++ b/glm/gtx/dual_quaternion.hpp
> > -@@ -20,6 +20,7 @@
> > - #include "../gtc/constants.hpp"
> > - #include "../gtc/quaternion.hpp"
> > -
> > -+#include "../experimental.hpp"
> > - #ifndef GLM_ENABLE_EXPERIMENTAL
> > - #     error "GLM: GLM_GTX_dual_quaternion is an experimental extensio=
n and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before =
including it, if you really want to use it."
> > - #endif
> > -diff --git a/glm/gtx/euler_angles.hpp b/glm/gtx/euler_angles.hpp
> > -index e66e9281..ad5988c1 100644
> > ---- a/glm/gtx/euler_angles.hpp
> > -+++ b/glm/gtx/euler_angles.hpp
> > -@@ -15,6 +15,7 @@
> > - // Dependency:
> > - #include "../glm.hpp"
> > -
> > -+#include "../experimental.hpp"
> > - #ifndef GLM_ENABLE_EXPERIMENTAL
> > - #     error "GLM: GLM_GTX_euler_angles is an experimental extension a=
nd may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before inc=
luding it, if you really want to use it."
> > - #endif
> > -diff --git a/glm/gtx/extend.hpp b/glm/gtx/extend.hpp
> > -index eda4e470..cde6db63 100644
> > ---- a/glm/gtx/extend.hpp
> > -+++ b/glm/gtx/extend.hpp
> > -@@ -15,6 +15,7 @@
> > - // Dependency:
> > - #include "../glm.hpp"
> > -
> > -+#include "../experimental.hpp"
> > - #ifndef GLM_ENABLE_EXPERIMENTAL
> > - #     error "GLM: GLM_GTX_extend is an experimental extension and may=
 change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including=
 it, if you really want to use it."
> > - #endif
> > -diff --git a/glm/gtx/extended_min_max.hpp b/glm/gtx/extended_min_max.h=
pp
> > -index 3e767b0c..0bcffcc6 100644
> > ---- a/glm/gtx/extended_min_max.hpp
> > -+++ b/glm/gtx/extended_min_max.hpp
> > -@@ -15,6 +15,7 @@
> > - // Dependency:
> > - #include "../glm.hpp"
> > -
> > -+#include "../experimental.hpp"
> > - #ifndef GLM_ENABLE_EXPERIMENTAL
> > - #     error "GLM: GLM_GTX_extented_min_max is an experimental extensi=
on and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before=
 including it, if you really want to use it."
> > - #endif
> > -diff --git a/glm/gtx/fast_exponential.hpp b/glm/gtx/fast_exponential.h=
pp
> > -index 2d4918e7..e6d11f0a 100644
> > ---- a/glm/gtx/fast_exponential.hpp
> > -+++ b/glm/gtx/fast_exponential.hpp
> > -@@ -16,6 +16,7 @@
> > - // Dependency:
> > - #include "../glm.hpp"
> > -
> > -+#include "../experimental.hpp"
> > - #ifndef GLM_ENABLE_EXPERIMENTAL
> > - #     error "GLM: GLM_GTX_fast_exponential is an experimental extensi=
on and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before=
 including it, if you really want to use it."
> > - #endif
> > -diff --git a/glm/gtx/fast_square_root.hpp b/glm/gtx/fast_square_root.h=
pp
> > -index 1e1ec3cf..f758aeef 100644
> > ---- a/glm/gtx/fast_square_root.hpp
> > -+++ b/glm/gtx/fast_square_root.hpp
> > -@@ -19,6 +19,7 @@
> > - #include "../exponential.hpp"
> > - #include "../geometric.hpp"
> > -
> > -+#include "../experimental.hpp"
> > - #ifndef GLM_ENABLE_EXPERIMENTAL
> > - #     error "GLM: GLM_GTX_fast_square_root is an experimental extensi=
on and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before=
 including it, if you really want to use it."
> > - #endif
> > -diff --git a/glm/gtx/fast_trigonometry.hpp b/glm/gtx/fast_trigonometry=
.hpp
> > -index 739065fb..f1332958 100644
> > ---- a/glm/gtx/fast_trigonometry.hpp
> > -+++ b/glm/gtx/fast_trigonometry.hpp
> > -@@ -15,6 +15,7 @@
> > - // Dependency:
> > - #include "../gtc/constants.hpp"
> > -
> > -+#include "../experimental.hpp"
> > - #ifndef GLM_ENABLE_EXPERIMENTAL
> > - #     error "GLM: GLM_GTX_fast_trigonometry is an experimental extens=
ion and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL befor=
e including it, if you really want to use it."
> > - #endif
> > -diff --git a/glm/gtx/gradient_paint.hpp b/glm/gtx/gradient_paint.hpp
> > -index 2713cec0..d4703991 100644
> > ---- a/glm/gtx/gradient_paint.hpp
> > -+++ b/glm/gtx/gradient_paint.hpp
> > -@@ -17,6 +17,7 @@
> > - #include "../glm.hpp"
> > - #include "../gtx/optimum_pow.hpp"
> > -
> > -+#include "../experimental.hpp"
> > - #ifndef GLM_ENABLE_EXPERIMENTAL
> > - #     error "GLM: GLM_GTX_gradient_paint is an experimental extension=
 and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before i=
ncluding it, if you really want to use it."
> > - #endif
> > -diff --git a/glm/gtx/handed_coordinate_space.hpp b/glm/gtx/handed_coor=
dinate_space.hpp
> > -index 1d0d4104..3a52ddcf 100644
> > ---- a/glm/gtx/handed_coordinate_space.hpp
> > -+++ b/glm/gtx/handed_coordinate_space.hpp
> > -@@ -15,6 +15,7 @@
> > - // Dependency:
> > - #include "../glm.hpp"
> > -
> > -+#include "../experimental.hpp"
> > - #ifndef GLM_ENABLE_EXPERIMENTAL
> > - #     error "GLM: GLM_GTX_handed_coordinate_space is an experimental =
extension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL=
 before including it, if you really want to use it."
> > - #endif
> > -diff --git a/glm/gtx/hash.hpp b/glm/gtx/hash.hpp
> > -index fe8a3efd..92bfc9b2 100644
> > ---- a/glm/gtx/hash.hpp
> > -+++ b/glm/gtx/hash.hpp
> > -@@ -12,6 +12,7 @@
> > -
> > - #pragma once
> > -
> > -+#include "../experimental.hpp"
> > - #ifndef GLM_ENABLE_EXPERIMENTAL
> > - #     error "GLM: GLM_GTX_hash is an experimental extension and may c=
hange in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including i=
t, if you really want to use it."
> > - #endif
> > -diff --git a/glm/gtx/integer.hpp b/glm/gtx/integer.hpp
> > -index 96637a13..5d1a16c6 100644
> > ---- a/glm/gtx/integer.hpp
> > -+++ b/glm/gtx/integer.hpp
> > -@@ -16,6 +16,7 @@
> > - #include "../glm.hpp"
> > - #include "../gtc/integer.hpp"
> > -
> > -+#include "../experimental.hpp"
> > - #ifndef GLM_ENABLE_EXPERIMENTAL
> > - #     error "GLM: GLM_GTX_integer is an experimental extension and ma=
y change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before includin=
g it, if you really want to use it."
> > - #endif
> > -diff --git a/glm/gtx/intersect.hpp b/glm/gtx/intersect.hpp
> > -index 61e2226a..4895ba93 100644
> > ---- a/glm/gtx/intersect.hpp
> > -+++ b/glm/gtx/intersect.hpp
> > -@@ -21,6 +21,7 @@
> > - #include "../gtx/closest_point.hpp"
> > - #include "../gtx/vector_query.hpp"
> > -
> > -+#include "../experimental.hpp"
> > - #ifndef GLM_ENABLE_EXPERIMENTAL
> > - #     error "GLM: GLM_GTX_closest_point is an experimental extension =
and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before in=
cluding it, if you really want to use it."
> > - #endif
> > -diff --git a/glm/gtx/io.hpp b/glm/gtx/io.hpp
> > -index 49a1ec11..ae39cd60 100644
> > ---- a/glm/gtx/io.hpp
> > -+++ b/glm/gtx/io.hpp
> > -@@ -23,6 +23,7 @@
> > - #include "../glm.hpp"
> > - #include "../gtx/quaternion.hpp"
> > -
> > -+#include "../experimental.hpp"
> > - #ifndef GLM_ENABLE_EXPERIMENTAL
> > - #     error "GLM: GLM_GTX_io is an experimental extension and may cha=
nge in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including it,=
 if you really want to use it."
> > - #endif
> > -diff --git a/glm/gtx/log_base.hpp b/glm/gtx/log_base.hpp
> > -index e873e356..45b8d53c 100644
> > ---- a/glm/gtx/log_base.hpp
> > -+++ b/glm/gtx/log_base.hpp
> > -@@ -15,6 +15,7 @@
> > - // Dependency:
> > - #include "../glm.hpp"
> > -
> > -+#include "../experimental.hpp"
> > - #ifndef GLM_ENABLE_EXPERIMENTAL
> > - #     error "GLM: GLM_GTX_log_base is an experimental extension and m=
ay change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before includi=
ng it, if you really want to use it."
> > - #endif
> > -diff --git a/glm/gtx/matrix_cross_product.hpp b/glm/gtx/matrix_cross_p=
roduct.hpp
> > -index 967743b8..52d6c173 100644
> > ---- a/glm/gtx/matrix_cross_product.hpp
> > -+++ b/glm/gtx/matrix_cross_product.hpp
> > -@@ -16,6 +16,7 @@
> > - // Dependency:
> > - #include "../glm.hpp"
> > -
> > -+#include "../experimental.hpp"
> > - #ifndef GLM_ENABLE_EXPERIMENTAL
> > - #     error "GLM: GLM_GTX_matrix_cross_product is an experimental ext=
ension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL be=
fore including it, if you really want to use it."
> > - #endif
> > -diff --git a/glm/gtx/matrix_decompose.hpp b/glm/gtx/matrix_decompose.h=
pp
> > -index b7ec0e83..6793fee2 100644
> > ---- a/glm/gtx/matrix_decompose.hpp
> > -+++ b/glm/gtx/matrix_decompose.hpp
> > -@@ -20,6 +20,7 @@
> > - #include "../gtc/quaternion.hpp"
> > - #include "../gtc/matrix_transform.hpp"
> > -
> > -+#include "../experimental.hpp"
> > - #ifndef GLM_ENABLE_EXPERIMENTAL
> > - #     error "GLM: GLM_GTX_matrix_decompose is an experimental extensi=
on and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before=
 including it, if you really want to use it."
> > - #endif
> > -diff --git a/glm/gtx/matrix_factorisation.hpp b/glm/gtx/matrix_factori=
sation.hpp
> > -index e30a7746..79c293be 100644
> > ---- a/glm/gtx/matrix_factorisation.hpp
> > -+++ b/glm/gtx/matrix_factorisation.hpp
> > -@@ -15,6 +15,7 @@
> > - // Dependency:
> > - #include "../glm.hpp"
> > -
> > -+#include "../experimental.hpp"
> > - #ifndef GLM_ENABLE_EXPERIMENTAL
> > - #     error "GLM: GLM_GTX_matrix_factorisation is an experimental ext=
ension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL be=
fore including it, if you really want to use it."
> > - #endif
> > -diff --git a/glm/gtx/matrix_interpolation.hpp b/glm/gtx/matrix_interpo=
lation.hpp
> > -index 89c4596c..799983bb 100644
> > ---- a/glm/gtx/matrix_interpolation.hpp
> > -+++ b/glm/gtx/matrix_interpolation.hpp
> > -@@ -16,6 +16,7 @@
> > - // Dependency:
> > - #include "../glm.hpp"
> > -
> > -+#include "../experimental.hpp"
> > - #ifndef GLM_ENABLE_EXPERIMENTAL
> > - #     error "GLM: GLM_GTX_matrix_interpolation is an experimental ext=
ension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL be=
fore including it, if you really want to use it."
> > - #endif
> > -diff --git a/glm/gtx/matrix_major_storage.hpp b/glm/gtx/matrix_major_s=
torage.hpp
> > -index 7f264a59..e68467cd 100644
> > ---- a/glm/gtx/matrix_major_storage.hpp
> > -+++ b/glm/gtx/matrix_major_storage.hpp
> > -@@ -16,6 +16,7 @@
> > - // Dependency:
> > - #include "../glm.hpp"
> > -
> > -+#include "../experimental.hpp"
> > - #ifndef GLM_ENABLE_EXPERIMENTAL
> > - #     error "GLM: GLM_GTX_matrix_major_storage is an experimental ext=
ension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL be=
fore including it, if you really want to use it."
> > - #endif
> > -diff --git a/glm/gtx/matrix_operation.hpp b/glm/gtx/matrix_operation.h=
pp
> > -index bce938bb..1e85bb5e 100644
> > ---- a/glm/gtx/matrix_operation.hpp
> > -+++ b/glm/gtx/matrix_operation.hpp
> > -@@ -15,6 +15,7 @@
> > - // Dependency:
> > - #include "../glm.hpp"
> > -
> > -+#include "../experimental.hpp"
> > - #ifndef GLM_ENABLE_EXPERIMENTAL
> > - #     error "GLM: GLM_GTX_matrix_operation is an experimental extensi=
on and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before=
 including it, if you really want to use it."
> > - #endif
> > -diff --git a/glm/gtx/matrix_query.hpp b/glm/gtx/matrix_query.hpp
> > -index 5df5f52f..eec1eec0 100644
> > ---- a/glm/gtx/matrix_query.hpp
> > -+++ b/glm/gtx/matrix_query.hpp
> > -@@ -18,6 +18,7 @@
> > - #include "../gtx/vector_query.hpp"
> > - #include <limits>
> > -
> > -+#include "../experimental.hpp"
> > - #ifndef GLM_ENABLE_EXPERIMENTAL
> > - #     error "GLM: GLM_GTX_matrix_query is an experimental extension a=
nd may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before inc=
luding it, if you really want to use it."
> > - #endif
> > -diff --git a/glm/gtx/matrix_transform_2d.hpp b/glm/gtx/matrix_transfor=
m_2d.hpp
> > -index 239ab9f4..3ca8d2f2 100644
> > ---- a/glm/gtx/matrix_transform_2d.hpp
> > -+++ b/glm/gtx/matrix_transform_2d.hpp
> > -@@ -17,6 +17,7 @@
> > - #include "../mat3x3.hpp"
> > - #include "../vec2.hpp"
> > -
> > -+#include "../experimental.hpp"
> > - #ifndef GLM_ENABLE_EXPERIMENTAL
> > - #     error "GLM: GLM_GTX_matrix_transform_2d is an experimental exte=
nsion and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL bef=
ore including it, if you really want to use it."
> > - #endif
> > -diff --git a/glm/gtx/mixed_product.hpp b/glm/gtx/mixed_product.hpp
> > -index 58562aab..5c7460d5 100644
> > ---- a/glm/gtx/mixed_product.hpp
> > -+++ b/glm/gtx/mixed_product.hpp
> > -@@ -15,6 +15,7 @@
> > - // Dependency:
> > - #include "../glm.hpp"
> > -
> > -+#include "../experimental.hpp"
> > - #ifndef GLM_ENABLE_EXPERIMENTAL
> > - #     error "GLM: GLM_GTX_mixed_product is an experimental extension =
and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before in=
cluding it, if you really want to use it."
> > - #endif
> > -diff --git a/glm/gtx/norm.hpp b/glm/gtx/norm.hpp
> > -index 46474e07..3cf2c3ea 100644
> > ---- a/glm/gtx/norm.hpp
> > -+++ b/glm/gtx/norm.hpp
> > -@@ -17,6 +17,7 @@
> > - #include "../geometric.hpp"
> > - #include "../gtx/quaternion.hpp"
> > -
> > -+#include "../experimental.hpp"
> > - #ifndef GLM_ENABLE_EXPERIMENTAL
> > - #     error "GLM: GLM_GTX_norm is an experimental extension and may c=
hange in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including i=
t, if you really want to use it."
> > - #endif
> > -diff --git a/glm/gtx/normal.hpp b/glm/gtx/normal.hpp
> > -index 15cec9c2..7bb4c096 100644
> > ---- a/glm/gtx/normal.hpp
> > -+++ b/glm/gtx/normal.hpp
> > -@@ -16,6 +16,7 @@
> > - // Dependency:
> > - #include "../glm.hpp"
> > -
> > -+#include "../experimental.hpp"
> > - #ifndef GLM_ENABLE_EXPERIMENTAL
> > - #     error "GLM: GLM_GTX_normal is an experimental extension and may=
 change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including=
 it, if you really want to use it."
> > - #endif
> > -diff --git a/glm/gtx/normalize_dot.hpp b/glm/gtx/normalize_dot.hpp
> > -index 86048e70..c6604da4 100644
> > ---- a/glm/gtx/normalize_dot.hpp
> > -+++ b/glm/gtx/normalize_dot.hpp
> > -@@ -16,6 +16,7 @@
> > - // Dependency:
> > - #include "../gtx/fast_square_root.hpp"
> > -
> > -+#include "../experimental.hpp"
> > - #ifndef GLM_ENABLE_EXPERIMENTAL
> > - #     error "GLM: GLM_GTX_normalize_dot is an experimental extension =
and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before in=
cluding it, if you really want to use it."
> > - #endif
> > -diff --git a/glm/gtx/number_precision.hpp b/glm/gtx/number_precision.h=
pp
> > -index 3732a56c..b48845f7 100644
> > ---- a/glm/gtx/number_precision.hpp
> > -+++ b/glm/gtx/number_precision.hpp
> > -@@ -18,6 +18,7 @@
> > - #include "../glm.hpp"
> > - #include "../gtc/type_precision.hpp"
> > -
> > -+#include "../experimental.hpp"
> > - #ifndef GLM_ENABLE_EXPERIMENTAL
> > - #     error "GLM: GLM_GTX_number_precision is an experimental extensi=
on and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before=
 including it, if you really want to use it."
> > - #endif
> > -diff --git a/glm/gtx/optimum_pow.hpp b/glm/gtx/optimum_pow.hpp
> > -index eb09f1c3..94a6bbb2 100644
> > ---- a/glm/gtx/optimum_pow.hpp
> > -+++ b/glm/gtx/optimum_pow.hpp
> > -@@ -15,6 +15,7 @@
> > - // Dependency:
> > - #include "../glm.hpp"
> > -
> > -+#include "../experimental.hpp"
> > - #ifndef GLM_ENABLE_EXPERIMENTAL
> > - #     error "GLM: GLM_GTX_optimum_pow is an experimental extension an=
d may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before incl=
uding it, if you really want to use it."
> > - #endif
> > -diff --git a/glm/gtx/orthonormalize.hpp b/glm/gtx/orthonormalize.hpp
> > -index 2a684ee4..4ff47e53 100644
> > ---- a/glm/gtx/orthonormalize.hpp
> > -+++ b/glm/gtx/orthonormalize.hpp
> > -@@ -18,6 +18,7 @@
> > - #include "../mat3x3.hpp"
> > - #include "../geometric.hpp"
> > -
> > -+#include "../experimental.hpp"
> > - #ifndef GLM_ENABLE_EXPERIMENTAL
> > - #     error "GLM: GLM_GTX_orthonormalize is an experimental extension=
 and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before i=
ncluding it, if you really want to use it."
> > - #endif
> > -diff --git a/glm/gtx/perpendicular.hpp b/glm/gtx/perpendicular.hpp
> > -index 35601ac7..17251ebe 100644
> > ---- a/glm/gtx/perpendicular.hpp
> > -+++ b/glm/gtx/perpendicular.hpp
> > -@@ -17,6 +17,7 @@
> > - #include "../glm.hpp"
> > - #include "../gtx/projection.hpp"
> > -
> > -+#include "../experimental.hpp"
> > - #ifndef GLM_ENABLE_EXPERIMENTAL
> > - #     error "GLM: GLM_GTX_perpendicular is an experimental extension =
and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before in=
cluding it, if you really want to use it."
> > - #endif
> > -diff --git a/glm/gtx/polar_coordinates.hpp b/glm/gtx/polar_coordinates=
.hpp
> > -index b8421db4..5125215d 100644
> > ---- a/glm/gtx/polar_coordinates.hpp
> > -+++ b/glm/gtx/polar_coordinates.hpp
> > -@@ -15,6 +15,7 @@
> > - // Dependency:
> > - #include "../glm.hpp"
> > -
> > -+#include "../experimental.hpp"
> > - #ifndef GLM_ENABLE_EXPERIMENTAL
> > - #     error "GLM: GLM_GTX_polar_coordinates is an experimental extens=
ion and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL befor=
e including it, if you really want to use it."
> > - #endif
> > -diff --git a/glm/gtx/projection.hpp b/glm/gtx/projection.hpp
> > -index 9a24abf9..4d5bf76f 100644
> > ---- a/glm/gtx/projection.hpp
> > -+++ b/glm/gtx/projection.hpp
> > -@@ -15,6 +15,7 @@
> > - // Dependency:
> > - #include "../geometric.hpp"
> > -
> > -+#include "../experimental.hpp"
> > - #ifndef GLM_ENABLE_EXPERIMENTAL
> > - #     error "GLM: GLM_GTX_projection is an experimental extension and=
 may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before inclu=
ding it, if you really want to use it."
> > - #endif
> > -diff --git a/glm/gtx/quaternion.hpp b/glm/gtx/quaternion.hpp
> > -index c3d99a5c..808ba0fd 100644
> > ---- a/glm/gtx/quaternion.hpp
> > -+++ b/glm/gtx/quaternion.hpp
> > -@@ -19,6 +19,7 @@
> > - #include "../gtc/quaternion.hpp"
> > - #include "../gtx/norm.hpp"
> > -
> > -+#include "../experimental.hpp"
> > - #ifndef GLM_ENABLE_EXPERIMENTAL
> > - #     error "GLM: GLM_GTX_quaternion is an experimental extension and=
 may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before inclu=
ding it, if you really want to use it."
> > - #endif
> > -diff --git a/glm/gtx/range.hpp b/glm/gtx/range.hpp
> > -index e0ef46af..03c797c3 100644
> > ---- a/glm/gtx/range.hpp
> > -+++ b/glm/gtx/range.hpp
> > -@@ -15,6 +15,7 @@
> > - // Dependencies
> > - #include "../detail/setup.hpp"
> > -
> > -+#include "../experimental.hpp"
> > - #ifndef GLM_ENABLE_EXPERIMENTAL
> > - #     error "GLM: GLM_GTX_range is an experimental extension and may =
change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including =
it, if you really want to use it."
> > - #endif
> > -diff --git a/glm/gtx/raw_data.hpp b/glm/gtx/raw_data.hpp
> > -index fb34c8cb..0084fec6 100644
> > ---- a/glm/gtx/raw_data.hpp
> > -+++ b/glm/gtx/raw_data.hpp
> > -@@ -16,6 +16,7 @@
> > - #include "../detail/setup.hpp"
> > - #include "../detail/type_int.hpp"
> > -
> > -+#include "../experimental.hpp"
> > - #ifndef GLM_ENABLE_EXPERIMENTAL
> > - #     error "GLM: GLM_GTX_raw_data is an experimental extension and m=
ay change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before includi=
ng it, if you really want to use it."
> > - #endif
> > -diff --git a/glm/gtx/rotate_normalized_axis.hpp b/glm/gtx/rotate_norma=
lized_axis.hpp
> > -index eee90d6e..82612928 100644
> > ---- a/glm/gtx/rotate_normalized_axis.hpp
> > -+++ b/glm/gtx/rotate_normalized_axis.hpp
> > -@@ -19,6 +19,7 @@
> > - #include "../gtc/epsilon.hpp"
> > - #include "../gtc/quaternion.hpp"
> > -
> > -+#include "../experimental.hpp"
> > - #ifndef GLM_ENABLE_EXPERIMENTAL
> > - #     error "GLM: GLM_GTX_rotate_normalized_axis is an experimental e=
xtension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL =
before including it, if you really want to use it."
> > - #endif
> > -diff --git a/glm/gtx/rotate_vector.hpp b/glm/gtx/rotate_vector.hpp
> > -index c8ace89e..e954b041 100644
> > ---- a/glm/gtx/rotate_vector.hpp
> > -+++ b/glm/gtx/rotate_vector.hpp
> > -@@ -17,6 +17,7 @@
> > - #include "../glm.hpp"
> > - #include "../gtx/transform.hpp"
> > -
> > -+#include "../experimental.hpp"
> > - #ifndef GLM_ENABLE_EXPERIMENTAL
> > - #     error "GLM: GLM_GTX_rotate_vector is an experimental extension =
and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before in=
cluding it, if you really want to use it."
> > - #endif
> > -diff --git a/glm/gtx/scalar_multiplication.hpp b/glm/gtx/scalar_multip=
lication.hpp
> > -index b73edf67..22baa52a 100644
> > ---- a/glm/gtx/scalar_multiplication.hpp
> > -+++ b/glm/gtx/scalar_multiplication.hpp
> > -@@ -16,6 +16,7 @@
> > -
> > - #include "../detail/setup.hpp"
> > -
> > -+#include "../experimental.hpp"
> > - #ifndef GLM_ENABLE_EXPERIMENTAL
> > - #     error "GLM: GLM_GTX_scalar_multiplication is an experimental ex=
tension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL b=
efore including it, if you really want to use it."
> > - #endif
> > -diff --git a/glm/gtx/scalar_relational.hpp b/glm/gtx/scalar_relational=
.hpp
> > -index 7fc8c1cc..f21f3b2b 100644
> > ---- a/glm/gtx/scalar_relational.hpp
> > -+++ b/glm/gtx/scalar_relational.hpp
> > -@@ -15,6 +15,7 @@
> > - // Dependency:
> > - #include "../glm.hpp"
> > -
> > -+#include "../experimental.hpp"
> > - #ifndef GLM_ENABLE_EXPERIMENTAL
> > - #     error "GLM: GLM_GTX_extend is an experimental extension and may=
 change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including=
 it, if you really want to use it."
> > - #endif
> > -diff --git a/glm/gtx/spline.hpp b/glm/gtx/spline.hpp
> > -index f96d7e07..76359cfd 100644
> > ---- a/glm/gtx/spline.hpp
> > -+++ b/glm/gtx/spline.hpp
> > -@@ -16,6 +16,7 @@
> > - #include "../glm.hpp"
> > - #include "../gtx/optimum_pow.hpp"
> > -
> > -+#include "../experimental.hpp"
> > - #ifndef GLM_ENABLE_EXPERIMENTAL
> > - #     error "GLM: GLM_GTX_spline is an experimental extension and may=
 change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including=
 it, if you really want to use it."
> > - #endif
> > -diff --git a/glm/gtx/std_based_type.hpp b/glm/gtx/std_based_type.hpp
> > -index 55a2f074..92532b9e 100644
> > ---- a/glm/gtx/std_based_type.hpp
> > -+++ b/glm/gtx/std_based_type.hpp
> > -@@ -17,6 +17,7 @@
> > - #include "../glm.hpp"
> > - #include <cstdlib>
> > -
> > -+#include "../experimental.hpp"
> > - #ifndef GLM_ENABLE_EXPERIMENTAL
> > - #     error "GLM: GLM_GTX_std_based_type is an experimental extension=
 and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before i=
ncluding it, if you really want to use it."
> > - #endif
> > -diff --git a/glm/gtx/string_cast.hpp b/glm/gtx/string_cast.hpp
> > -index 4b4e280f..dfcd5085 100644
> > ---- a/glm/gtx/string_cast.hpp
> > -+++ b/glm/gtx/string_cast.hpp
> > -@@ -24,6 +24,7 @@
> > - #include <string>
> > - #include <cmath>
> > -
> > -+#include "../experimental.hpp"
> > - #ifndef GLM_ENABLE_EXPERIMENTAL
> > - #     error "GLM: GLM_GTX_string_cast is an experimental extension an=
d may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before incl=
uding it, if you really want to use it."
> > - #endif
> > -diff --git a/glm/gtx/texture.hpp b/glm/gtx/texture.hpp
> > -index 312bf398..7af185f6 100644
> > ---- a/glm/gtx/texture.hpp
> > -+++ b/glm/gtx/texture.hpp
> > -@@ -17,6 +17,7 @@
> > - #include "../gtc/integer.hpp"
> > - #include "../gtx/component_wise.hpp"
> > -
> > -+#include "../experimental.hpp"
> > - #ifndef GLM_ENABLE_EXPERIMENTAL
> > - #     error "GLM: GLM_GTX_texture is an experimental extension and ma=
y change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before includin=
g it, if you really want to use it."
> > - #endif
> > -diff --git a/glm/gtx/transform.hpp b/glm/gtx/transform.hpp
> > -index d23b99ce..5a5d9619 100644
> > ---- a/glm/gtx/transform.hpp
> > -+++ b/glm/gtx/transform.hpp
> > -@@ -19,6 +19,7 @@
> > - #include "../glm.hpp"
> > - #include "../gtc/matrix_transform.hpp"
> > -
> > -+#include "../experimental.hpp"
> > - #ifndef GLM_ENABLE_EXPERIMENTAL
> > - #     error "GLM: GLM_GTX_transform is an experimental extension and =
may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before includ=
ing it, if you really want to use it."
> > - #endif
> > -diff --git a/glm/gtx/transform2.hpp b/glm/gtx/transform2.hpp
> > -index 85f5bea4..5d7c83fc 100644
> > ---- a/glm/gtx/transform2.hpp
> > -+++ b/glm/gtx/transform2.hpp
> > -@@ -17,6 +17,7 @@
> > - #include "../glm.hpp"
> > - #include "../gtx/transform.hpp"
> > -
> > -+#include "../experimental.hpp"
> > - #ifndef GLM_ENABLE_EXPERIMENTAL
> > - #     error "GLM: GLM_GTX_transform2 is an experimental extension and=
 may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before inclu=
ding it, if you really want to use it."
> > - #endif
> > -diff --git a/glm/gtx/type_aligned.hpp b/glm/gtx/type_aligned.hpp
> > -index 6ff9f276..6ad92fad 100644
> > ---- a/glm/gtx/type_aligned.hpp
> > -+++ b/glm/gtx/type_aligned.hpp
> > -@@ -18,6 +18,7 @@
> > - // Dependency:
> > - #include "../gtc/type_precision.hpp"
> > -
> > -+#include "../experimental.hpp"
> > - #ifndef GLM_ENABLE_EXPERIMENTAL
> > - #     error "GLM: GLM_GTX_type_aligned is an experimental extension a=
nd may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before inc=
luding it, if you really want to use it."
> > - #endif
> > -diff --git a/glm/gtx/type_trait.hpp b/glm/gtx/type_trait.hpp
> > -index 637bbd19..65519cab 100644
> > ---- a/glm/gtx/type_trait.hpp
> > -+++ b/glm/gtx/type_trait.hpp
> > -@@ -12,6 +12,7 @@
> > -
> > - #pragma once
> > -
> > -+#include "../experimental.hpp"
> > - #ifndef GLM_ENABLE_EXPERIMENTAL
> > - #     error "GLM: GLM_GTX_type_trait is an experimental extension and=
 may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before inclu=
ding it, if you really want to use it."
> > - #endif
> > -diff --git a/glm/gtx/vec_swizzle.hpp b/glm/gtx/vec_swizzle.hpp
> > -index daebac38..13d523dc 100644
> > ---- a/glm/gtx/vec_swizzle.hpp
> > -+++ b/glm/gtx/vec_swizzle.hpp
> > -@@ -14,6 +14,7 @@
> > -
> > - #include "../glm.hpp"
> > -
> > -+#include "../experimental.hpp"
> > - #ifndef GLM_ENABLE_EXPERIMENTAL
> > - #     error "GLM: GLM_GTX_vec_swizzle is an experimental extension an=
d may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before incl=
uding it, if you really want to use it."
> > - #endif
> > -diff --git a/glm/gtx/vector_angle.hpp b/glm/gtx/vector_angle.hpp
> > -index 401a47eb..98c9d110 100644
> > ---- a/glm/gtx/vector_angle.hpp
> > -+++ b/glm/gtx/vector_angle.hpp
> > -@@ -20,6 +20,7 @@
> > - #include "../gtx/quaternion.hpp"
> > - #include "../gtx/rotate_vector.hpp"
> > -
> > -+#include "../experimental.hpp"
> > - #ifndef GLM_ENABLE_EXPERIMENTAL
> > - #     error "GLM: GLM_GTX_vector_angle is an experimental extension a=
nd may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before inc=
luding it, if you really want to use it."
> > - #endif
> > -diff --git a/glm/gtx/vector_query.hpp b/glm/gtx/vector_query.hpp
> > -index 6560eaa5..5ab1ffda 100644
> > ---- a/glm/gtx/vector_query.hpp
> > -+++ b/glm/gtx/vector_query.hpp
> > -@@ -17,6 +17,7 @@
> > - #include <cfloat>
> > - #include <limits>
> > -
> > -+#include "../experimental.hpp"
> > - #ifndef GLM_ENABLE_EXPERIMENTAL
> > - #     error "GLM: GLM_GTX_vector_query is an experimental extension a=
nd may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before inc=
luding it, if you really want to use it."
> > - #endif
> > -diff --git a/glm/gtx/wrap.hpp b/glm/gtx/wrap.hpp
> > -index 2c4b55df..5bf26a33 100644
> > ---- a/glm/gtx/wrap.hpp
> > -+++ b/glm/gtx/wrap.hpp
> > -@@ -16,6 +16,7 @@
> > - #include "../glm.hpp"
> > - #include "../gtc/vec1.hpp"
> > -
> > -+#include "../experimental.hpp"
> > - #ifndef GLM_ENABLE_EXPERIMENTAL
> > - #     error "GLM: GLM_GTX_wrap is an experimental extension and may c=
hange in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including i=
t, if you really want to use it."
> > - #endif
> > ---
> > -2.14.3
> > -
> > diff --git a/meta-oe/recipes-graphics/glm/files/0002-glm-install-header=
s-only.patch b/meta-oe/recipes-graphics/glm/files/0002-glm-install-headers-=
only.patch
> > deleted file mode 100644
> > index 1be3318cc1..0000000000
> > --- a/meta-oe/recipes-graphics/glm/files/0002-glm-install-headers-only.=
patch
> > +++ /dev/null
> > @@ -1,46 +0,0 @@
> > -From 7fdd36d7496238e03e43fcc32839f75588116c5d Mon Sep 17 00:00:00 2001
> > -From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail=
.com>
> > -Date: Fri, 16 Mar 2018 15:44:48 +0100
> > -Subject: [PATCH 2/2] glm: install headers only
> > -MIME-Version: 1.0
> > -Content-Type: text/plain; charset=3DUTF-8
> > -Content-Transfer-Encoding: 8bit
> > -
> > -Plausibility check in root source path
> > -
> > -$ find glm -type f ! -name '*.hpp' ! -name '*.h' ! -name '*.inl'
> > -glm/detail/glm.cpp
> > -glm/detail/dummy.cpp
> > -glm/experimental.hpp.in
> > -glm/CMakeLists.txt
> > -
> > -Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > -
> > -Uptream-Status: Submitted [1]
> > -
> > -[1] https://github.com/g-truc/glm/pull/741
> > ----
> > - CMakeLists.txt | 7 ++++++-
> > - 1 file changed, 6 insertions(+), 1 deletion(-)
> > -
> > -diff --git a/CMakeLists.txt b/CMakeLists.txt
> > -index bd4dd654..113dd735 100644
> > ---- a/CMakeLists.txt
> > -+++ b/CMakeLists.txt
> > -@@ -171,7 +171,12 @@ option(GLM_INSTALL_ENABLE "GLM install" ON)
> > -
> > - set(GLM_INSTALL_CONFIGDIR "${CMAKE_INSTALL_LIBDIR}/cmake/glm")
> > - if (GLM_INSTALL_ENABLE)
> > --      install(DIRECTORY glm DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
> > -+      install(DIRECTORY glm
> > -+              DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
> > -+              FILES_MATCHING
> > -+                      PATTERN "*.h"
> > -+                      PATTERN "*.hpp"
> > -+                      PATTERN "*.inl")
> > -       install(FILES "${CMAKE_CURRENT_BINARY_DIR}/experimental.hpp" DE=
STINATION ${CMAKE_INSTALL_INCLUDEDIR}/glm)
> > - endif()
> > -
> > ---
> > -2.14.3
> > -
> > diff --git a/meta-oe/recipes-graphics/glm/glm/0001-glm-Remove-redundant=
-double-semi-colons.patch b/meta-oe/recipes-graphics/glm/glm/0001-glm-Remov=
e-redundant-double-semi-colons.patch
> > new file mode 100644
> > index 0000000000..6e50f2cf23
> > --- /dev/null
> > +++ b/meta-oe/recipes-graphics/glm/glm/0001-glm-Remove-redundant-double=
-semi-colons.patch
> > @@ -0,0 +1,120 @@
> > +From 3f6869e392b061f2932f3df155b6cc37e3e7d342 Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 1 Mar 2019 10:56:05 -0800
> > +Subject: [PATCH] glm: Remove redundant double semi-colons
> > +
> > +Make clang happy
> > +/glm/gtc/../ext/../detail/../simd/common.h:106:45: error: empty expres=
sion statement has no effect; remove unnecessary ';' to silence this warnin=
g [-Werror,-Wextra-semi-stmt]
> > +|         glm_vec4 const or0 =3D _mm_or_ps(and0, and1);;
> > +|                                                    ^
> > +| 1 error generated.
> > +
> > +Upstream-Status: Submitted [https://github.com/g-truc/glm/pull/874]
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + glm/gtx/associated_min_max.inl      | 8 ++++----
> > + glm/simd/common.h                   | 2 +-
> > + test/core/core_func_exponential.cpp | 6 +++---
> > + test/gtx/gtx_easing.cpp             | 4 ++--
> > + 4 files changed, 10 insertions(+), 10 deletions(-)
> > +
> > +diff --git a/glm/gtx/associated_min_max.inl b/glm/gtx/associated_min_m=
ax.inl
> > +index 1a459add..5186c471 100644
> > +--- a/glm/gtx/associated_min_max.inl
> > ++++ b/glm/gtx/associated_min_max.inl
> > +@@ -86,7 +86,7 @@ GLM_FUNC_QUALIFIER U associatedMin
> > + )
> > + {
> > +       T Test1 =3D min(x, y);
> > +-      T Test2 =3D min(z, w);;
> > ++      T Test2 =3D min(z, w);
> > +       U Result1 =3D x < y ? a : b;
> > +       U Result2 =3D z < w ? c : d;
> > +       U Result =3D Test1 < Test2 ? Result1 : Result2;
> > +@@ -152,7 +152,7 @@ GLM_FUNC_QUALIFIER vec<L, U, Q> associatedMin
> > +       for(length_t i =3D 0, n =3D Result.length(); i < n; ++i)
> > +       {
> > +               T Test1 =3D min(x[i], y[i]);
> > +-              T Test2 =3D min(z[i], w[i]);;
> > ++              T Test2 =3D min(z[i], w[i]);
> > +               U Result1 =3D x[i] < y[i] ? a : b;
> > +               U Result2 =3D z[i] < w[i] ? c : d;
> > +               Result[i] =3D Test1 < Test2 ? Result1 : Result2;
> > +@@ -278,7 +278,7 @@ GLM_FUNC_QUALIFIER U associatedMax
> > + )
> > + {
> > +       T Test1 =3D max(x, y);
> > +-      T Test2 =3D max(z, w);;
> > ++      T Test2 =3D max(z, w);
> > +       U Result1 =3D x > y ? a : b;
> > +       U Result2 =3D z > w ? c : d;
> > +       U Result =3D Test1 > Test2 ? Result1 : Result2;
> > +@@ -344,7 +344,7 @@ GLM_FUNC_QUALIFIER vec<L, U, Q> associatedMax
> > +       for(length_t i =3D 0, n =3D Result.length(); i < n; ++i)
> > +       {
> > +               T Test1 =3D max(x[i], y[i]);
> > +-              T Test2 =3D max(z[i], w[i]);;
> > ++              T Test2 =3D max(z[i], w[i]);
> > +               U Result1 =3D x[i] > y[i] ? a : b;
> > +               U Result2 =3D z[i] > w[i] ? c : d;
> > +               Result[i] =3D Test1 > Test2 ? Result1 : Result2;
> > +diff --git a/glm/simd/common.h b/glm/simd/common.h
> > +index d07920a3..9b017cb4 100644
> > +--- a/glm/simd/common.h
> > ++++ b/glm/simd/common.h
> > +@@ -103,7 +103,7 @@ GLM_FUNC_QUALIFIER glm_vec4 glm_vec4_sign(glm_vec4=
 x)
> > +       glm_vec4 const cmp1 =3D _mm_cmpgt_ps(x, zro0);
> > +       glm_vec4 const and0 =3D _mm_and_ps(cmp0, _mm_set1_ps(-1.0f));
> > +       glm_vec4 const and1 =3D _mm_and_ps(cmp1, _mm_set1_ps(1.0f));
> > +-      glm_vec4 const or0 =3D _mm_or_ps(and0, and1);;
> > ++      glm_vec4 const or0 =3D _mm_or_ps(and0, and1);
> > +       return or0;
> > + }
> > +
> > +diff --git a/test/core/core_func_exponential.cpp b/test/core/core_func=
_exponential.cpp
> > +index a414a4e9..380cdfb1 100644
> > +--- a/test/core/core_func_exponential.cpp
> > ++++ b/test/core/core_func_exponential.cpp
> > +@@ -153,13 +153,13 @@ static int test_inversesqrt()
> > +       float A =3D glm::inversesqrt(16.f) * glm::sqrt(16.f);
> > +       Error +=3D glm::equal(A, 1.f, 0.01f) ? 0 : 1;
> > +
> > +-      glm::vec1 B =3D glm::inversesqrt(glm::vec1(16.f)) * glm::sqrt(1=
6.f);;
> > ++      glm::vec1 B =3D glm::inversesqrt(glm::vec1(16.f)) * glm::sqrt(1=
6.f);
> > +       Error +=3D glm::all(glm::equal(B, glm::vec1(1.f), 0.01f)) ? 0 :=
 1;
> > +
> > +-      glm::vec2 C =3D glm::inversesqrt(glm::vec2(16.f)) * glm::sqrt(1=
6.f);;
> > ++      glm::vec2 C =3D glm::inversesqrt(glm::vec2(16.f)) * glm::sqrt(1=
6.f);
> > +       Error +=3D glm::all(glm::equal(C, glm::vec2(1.f), 0.01f)) ? 0 :=
 1;
> > +
> > +-      glm::vec3 D =3D glm::inversesqrt(glm::vec3(16.f)) * glm::sqrt(1=
6.f);;
> > ++      glm::vec3 D =3D glm::inversesqrt(glm::vec3(16.f)) * glm::sqrt(1=
6.f);
> > +       Error +=3D glm::all(glm::equal(D, glm::vec3(1.f), 0.01f)) ? 0 :=
 1;
> > +
> > +       glm::vec4 E =3D glm::inversesqrt(glm::vec4(16.f)) * glm::sqrt(1=
6.f);
> > +diff --git a/test/gtx/gtx_easing.cpp b/test/gtx/gtx_easing.cpp
> > +index b3e13997..0e98cd53 100644
> > +--- a/test/gtx/gtx_easing.cpp
> > ++++ b/test/gtx/gtx_easing.cpp
> > +@@ -34,7 +34,7 @@ namespace
> > +               r =3D glm::circularEaseOut(a);
> > +               r =3D glm::circularEaseInOut(a);
> > +
> > +-              r =3D glm::exponentialEaseIn(a);;
> > ++              r =3D glm::exponentialEaseIn(a);
> > +               r =3D glm::exponentialEaseOut(a);
> > +               r =3D glm::exponentialEaseInOut(a);
> > +
> > +@@ -46,7 +46,7 @@ namespace
> > +               r =3D glm::backEaseOut(a);
> > +               r =3D glm::backEaseInOut(a);
> > +
> > +-              r =3D glm::bounceEaseIn(a);;
> > ++              r =3D glm::bounceEaseIn(a);
> > +               r =3D glm::bounceEaseOut(a);
> > +               r =3D glm::bounceEaseInOut(a);
> > +       }
> > +--
> > +2.21.0
> > +
> > diff --git a/meta-oe/recipes-graphics/glm/glm_0.9.9-a2.bb b/meta-oe/rec=
ipes-graphics/glm/glm_0.9.9.3.bb
> > similarity index 72%
> > rename from meta-oe/recipes-graphics/glm/glm_0.9.9-a2.bb
> > rename to meta-oe/recipes-graphics/glm/glm_0.9.9.3.bb
> > index 7f16708edb..2a26a5bc71 100644
> > --- a/meta-oe/recipes-graphics/glm/glm_0.9.9-a2.bb
> > +++ b/meta-oe/recipes-graphics/glm/glm_0.9.9.3.bb
> > @@ -10,17 +10,15 @@ LIC_FILES_CHKSUM =3D "file://readme.md;beginline=3D=
21;endline=3D22;md5=3D3075b5727d36f29
> >
> >  SRC_URI =3D " \
> >      git://github.com/g-truc/glm;branch=3Dmaster \
> > -    file://0001-Make-GLM_ENABLE_EXPERIMENTAL-a-configurable-option.pat=
ch \
> > -    file://0002-glm-install-headers-only.patch \
> > +    file://0001-glm-Remove-redundant-double-semi-colons.patch \
> >  "
> > -SRCREV =3D "fcbedf5058ef8613dd02aac62ef00d55dcfeadd7"
> > +# v0.9.9.3
> > +SRCREV =3D "9749727c2db4742369219e1d452f43e918734b4e"
> >
> >  S =3D "${WORKDIR}/git"
> >
> >  inherit cmake
> >
> > -EXTRA_OECMAKE =3D "-DGLM_ENABLE_EXPERIMENTAL=3DON"
> > -
> >  RDEPENDS_${PN}-dev =3D ""
> >
> >  BBCLASSEXTEND =3D "native"
> > --
> > 2.21.0
> >
> Dropping the patch breaks several packages for me.
>

can you forward port and submit upstream as well
> Andreas

