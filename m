Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 47EAD788E0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2018 19:08:47 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id f125so3275774wme.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2018 12:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=ieU8bWoYpEbkepOPu6rHnqnMjnFL4R5Lx0iQT8J5lrI=;
	b=ms26q7pcibaTsbavuFFyEeo3ut62BKiKe4ispln03bzCw/K4TpN3jG57h6ENB22tR5
	EMwd9zGfgGlJmYzvpMnzWI4xWdjPQOPrw9u7kid9dkiPz+7Mi/iDd0fRWWcqcNM0FIGK
	f2fOZtN4kOzjk/7yRxwpM+Z112OZN/tWG7KABbWVzRg147J7pHNzbWf4HvtylzA8l0fl
	s5Xjqa8h9JBGW2sJGDpt8o6EcXl54ybR5UDKpZoTot3QhyRBT6Mhmr761WHFh/bvAITl
	oKBisorxFJ9bH3VAJWmExIIlcu6VkSlkPzCZUBzRse1xVX1mvTciKgHyowRN0s+nLkCc
	iO5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ieU8bWoYpEbkepOPu6rHnqnMjnFL4R5Lx0iQT8J5lrI=;
	b=t6Ezh00ubfxd8dy9Vn5rsFVz+u7Fa/uIV10vCRaCUY8MXvIajWRYXQxo57aCtzl07K
	8cKCFwI2xQFiEgKbcpDGcNl2E3sG4btuOzOKNCPMz5K9Xs+xGpdL9/i4yvz/qyt0DH1C
	NB8W0ZRYKpjHe40TiCS4vCYj0oC6e4CFipitc0OQliNCkOsDPPBbcus9bCfLIsGpkO9d
	EpmuCN15klV5fiSGBHZZYAnUpDIxlRhUXMoqkMnbkA9aV/StrNfScQsnB9EC+cKfGAHb
	hcMc6hmbxyqKK23psRClJVXKce+OgxqQI1kRJxf7WfpLd5HO9B7D3F+DAz0JZye3nGE/
	O4vA==
X-Gm-Message-State: AElRT7EvRPuYv4tmzGoA4Av6sfPkPEzNw0j8ee3uB2+JR8WTyX/cpglY
	6aVMyw/e/FkUPB9qhrxy1zMoWg==
X-Google-Smtp-Source: AG47ELtn2k43hlka/9kN0uiERu3w5g1cUEdRTHe0qZ0NlOUwLg1h/ceP2Tuy+f9NxKEnmVB3h6+uOw==
X-Received: by 10.28.84.74 with SMTP id p10mr3094667wmi.15.1521400127411;
	Sun, 18 Mar 2018 12:08:47 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC08B781E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc0:8b78:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	b8sm11614531wrf.29.2018.03.18.12.08.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 18 Mar 2018 12:08:46 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Mar 2018 20:08:27 +0100
Message-Id: <20180318190833.1393-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180318190833.1393-1-schnitzeltony@gmail.com>
References: <20180318190833.1393-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/8] glm: fix build breaks when using glx headers / fix install
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
X-List-Received-Date: Sun, 18 Mar 2018 19:08:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* With 0.9.9-a2 an error message was created when comiling with glx headers
  included. Instead of fixing all the packages using glm we fix it here.
* Ensure only headers are installed

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...ENABLE_EXPERIMENTAL-a-configurable-option.patch | 860 +++++++++++++++++++++
 .../glm/files/0002-glm-install-headers-only.patch  |  46 ++
 meta-oe/recipes-graphics/glm/glm_0.9.9-a2.bb       |   8 +-
 3 files changed, 913 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-graphics/glm/files/0001-Make-GLM_ENABLE_EXPERIMENTAL-a-configurable-option.patch
 create mode 100644 meta-oe/recipes-graphics/glm/files/0002-glm-install-headers-only.patch

diff --git a/meta-oe/recipes-graphics/glm/files/0001-Make-GLM_ENABLE_EXPERIMENTAL-a-configurable-option.patch b/meta-oe/recipes-graphics/glm/files/0001-Make-GLM_ENABLE_EXPERIMENTAL-a-configurable-option.patch
new file mode 100644
index 000000000..d69c5af3a
--- /dev/null
+++ b/meta-oe/recipes-graphics/glm/files/0001-Make-GLM_ENABLE_EXPERIMENTAL-a-configurable-option.patch
@@ -0,0 +1,860 @@
+From 99a9676a0193f6291d7202d7af72e24580abe565 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Fri, 16 Mar 2018 13:55:29 +0100
+Subject: [PATCH 1/2] Make GLM_ENABLE_EXPERIMENTAL a configurable option
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+It seems that erroring out if GLM_ENABLE_EXPERIMENTAL is not set turns into
+packagers nightmare: There are packages around expecting glx headers. E.g
+libgltf [1] fails during configure checking for usable headers AND during
+compile. Paticularly fixing configure for those packages is time-consuming:
+The only way (correct me if I am wrong) is creating a patch adding
+
+AC_DEFINE([GLM_ENABLE_EXPERIMENTAL], [1], [glm needs this for gtx headers])
+
+By adding a configure option 'GLM_ENABLE_EXPERIMENTAL', the decision to use
+glm/glx is done at one (and the right) place.
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+
+[1] https://gerrit.libreoffice.org/gitweb?p=libgltf.git
+
+Uptream-Status: Submitted [2]
+
+[2] https://github.com/g-truc/glm/pull/741
+---
+ CMakeLists.txt                      | 6 ++++++
+ glm/CMakeLists.txt                  | 2 ++
+ glm/experimental.hpp.in             | 1 +
+ glm/ext.hpp                         | 1 +
+ glm/gtx/associated_min_max.hpp      | 1 +
+ glm/gtx/bit.hpp                     | 1 +
+ glm/gtx/closest_point.hpp           | 1 +
+ glm/gtx/color_space.hpp             | 1 +
+ glm/gtx/color_space_YCoCg.hpp       | 1 +
+ glm/gtx/common.hpp                  | 1 +
+ glm/gtx/compatibility.hpp           | 1 +
+ glm/gtx/component_wise.hpp          | 1 +
+ glm/gtx/dual_quaternion.hpp         | 1 +
+ glm/gtx/euler_angles.hpp            | 1 +
+ glm/gtx/extend.hpp                  | 1 +
+ glm/gtx/extended_min_max.hpp        | 1 +
+ glm/gtx/fast_exponential.hpp        | 1 +
+ glm/gtx/fast_square_root.hpp        | 1 +
+ glm/gtx/fast_trigonometry.hpp       | 1 +
+ glm/gtx/gradient_paint.hpp          | 1 +
+ glm/gtx/handed_coordinate_space.hpp | 1 +
+ glm/gtx/hash.hpp                    | 1 +
+ glm/gtx/integer.hpp                 | 1 +
+ glm/gtx/intersect.hpp               | 1 +
+ glm/gtx/io.hpp                      | 1 +
+ glm/gtx/log_base.hpp                | 1 +
+ glm/gtx/matrix_cross_product.hpp    | 1 +
+ glm/gtx/matrix_decompose.hpp        | 1 +
+ glm/gtx/matrix_factorisation.hpp    | 1 +
+ glm/gtx/matrix_interpolation.hpp    | 1 +
+ glm/gtx/matrix_major_storage.hpp    | 1 +
+ glm/gtx/matrix_operation.hpp        | 1 +
+ glm/gtx/matrix_query.hpp            | 1 +
+ glm/gtx/matrix_transform_2d.hpp     | 1 +
+ glm/gtx/mixed_product.hpp           | 1 +
+ glm/gtx/norm.hpp                    | 1 +
+ glm/gtx/normal.hpp                  | 1 +
+ glm/gtx/normalize_dot.hpp           | 1 +
+ glm/gtx/number_precision.hpp        | 1 +
+ glm/gtx/optimum_pow.hpp             | 1 +
+ glm/gtx/orthonormalize.hpp          | 1 +
+ glm/gtx/perpendicular.hpp           | 1 +
+ glm/gtx/polar_coordinates.hpp       | 1 +
+ glm/gtx/projection.hpp              | 1 +
+ glm/gtx/quaternion.hpp              | 1 +
+ glm/gtx/range.hpp                   | 1 +
+ glm/gtx/raw_data.hpp                | 1 +
+ glm/gtx/rotate_normalized_axis.hpp  | 1 +
+ glm/gtx/rotate_vector.hpp           | 1 +
+ glm/gtx/scalar_multiplication.hpp   | 1 +
+ glm/gtx/scalar_relational.hpp       | 1 +
+ glm/gtx/spline.hpp                  | 1 +
+ glm/gtx/std_based_type.hpp          | 1 +
+ glm/gtx/string_cast.hpp             | 1 +
+ glm/gtx/texture.hpp                 | 1 +
+ glm/gtx/transform.hpp               | 1 +
+ glm/gtx/transform2.hpp              | 1 +
+ glm/gtx/type_aligned.hpp            | 1 +
+ glm/gtx/type_trait.hpp              | 1 +
+ glm/gtx/vec_swizzle.hpp             | 1 +
+ glm/gtx/vector_angle.hpp            | 1 +
+ glm/gtx/vector_query.hpp            | 1 +
+ glm/gtx/wrap.hpp                    | 1 +
+ 63 files changed, 69 insertions(+)
+ create mode 100644 glm/experimental.hpp.in
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index e5159b0f..bd4dd654 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -82,6 +82,11 @@ option(GLM_TEST_ENABLE_SIMD_AVX "Enable AVX optimizations" OFF)
+ option(GLM_TEST_ENABLE_SIMD_AVX2 "Enable AVX2 optimizations" OFF)
+ option(GLM_TEST_FORCE_PURE "Force 'pure' instructions" OFF)
+ 
++option(GLM_ENABLE_EXPERIMENTAL "Enable experimental GLM_GTX" OFF)
++configure_file(glm/experimental.hpp.in experimental.hpp @ONLY)
++include_directories(${CMAKE_BINARY_DIR}/glm)
++include_directories(${CMAKE_BINARY_DIR})
++
+ if(GLM_TEST_FORCE_PURE)
+ 	add_definitions(-DGLM_FORCE_PURE)
+ 
+@@ -167,6 +172,7 @@ option(GLM_INSTALL_ENABLE "GLM install" ON)
+ set(GLM_INSTALL_CONFIGDIR "${CMAKE_INSTALL_LIBDIR}/cmake/glm")
+ if (GLM_INSTALL_ENABLE)
+ 	install(DIRECTORY glm DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
++	install(FILES "${CMAKE_CURRENT_BINARY_DIR}/experimental.hpp" DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/glm)
+ endif()
+ 
+ write_basic_package_version_file("${CMAKE_CURRENT_BINARY_DIR}/glmConfigVersion.cmake" VERSION ${GLM_VERSION} COMPATIBILITY AnyNewerVersion)
+diff --git a/glm/CMakeLists.txt b/glm/CMakeLists.txt
+index df9c9ee5..dc5db4bc 100644
+--- a/glm/CMakeLists.txt
++++ b/glm/CMakeLists.txt
+@@ -43,6 +43,8 @@ source_group("SIMD Files" FILES ${SIMD_INLINE})
+ source_group("SIMD Files" FILES ${SIMD_HEADER})
+ 
+ include_directories(${CMAKE_CURRENT_SOURCE_DIR}/..)
++# make out-of tree builds find experimental.hpp
++include_directories(${CMAKE_BINARY_DIR}/glm)
+ 
+ if(GLM_STATIC_LIBRARY_ENABLE OR GLM_DYNAMIC_LIBRARY_ENABLE)
+ 	if(GLM_STATIC_LIBRARY_ENABLE)
+diff --git a/glm/experimental.hpp.in b/glm/experimental.hpp.in
+new file mode 100644
+index 00000000..bfab5138
+--- /dev/null
++++ b/glm/experimental.hpp.in
+@@ -0,0 +1 @@
++#cmakedefine GLM_ENABLE_EXPERIMENTAL
+diff --git a/glm/ext.hpp b/glm/ext.hpp
+index d085bfd5..a2948447 100644
+--- a/glm/ext.hpp
++++ b/glm/ext.hpp
+@@ -39,6 +39,7 @@
+ #	include "./gtc/type_aligned.hpp"
+ #endif
+ 
++#include "experimental.hpp"
+ #ifdef GLM_ENABLE_EXPERIMENTAL
+ #include "./gtx/associated_min_max.hpp"
+ #include "./gtx/bit.hpp"
+diff --git a/glm/gtx/associated_min_max.hpp b/glm/gtx/associated_min_max.hpp
+index 0c9935f3..d00c2bc4 100644
+--- a/glm/gtx/associated_min_max.hpp
++++ b/glm/gtx/associated_min_max.hpp
+@@ -16,6 +16,7 @@
+ // Dependency:
+ #include "../glm.hpp"
+ 
++#include "../experimental.hpp"
+ #ifndef GLM_ENABLE_EXPERIMENTAL
+ #	error "GLM: GTX_associated_min_max is an experimental extension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including it, if you really want to use it."
+ #endif
+diff --git a/glm/gtx/bit.hpp b/glm/gtx/bit.hpp
+index 1447fa00..31957083 100644
+--- a/glm/gtx/bit.hpp
++++ b/glm/gtx/bit.hpp
+@@ -15,6 +15,7 @@
+ // Dependencies
+ #include "../gtc/bitfield.hpp"
+ 
++#include "../experimental.hpp"
+ #ifndef GLM_ENABLE_EXPERIMENTAL
+ #	error "GLM: GLM_GTX_bit is an experimental extension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including it, if you really want to use it."
+ #endif
+diff --git a/glm/gtx/closest_point.hpp b/glm/gtx/closest_point.hpp
+index 6859bb96..ebd9fe5a 100644
+--- a/glm/gtx/closest_point.hpp
++++ b/glm/gtx/closest_point.hpp
+@@ -15,6 +15,7 @@
+ // Dependency:
+ #include "../glm.hpp"
+ 
++#include "../experimental.hpp"
+ #ifndef GLM_ENABLE_EXPERIMENTAL
+ #	error "GLM: GLM_GTX_closest_point is an experimental extension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including it, if you really want to use it."
+ #endif
+diff --git a/glm/gtx/color_space.hpp b/glm/gtx/color_space.hpp
+index d1e655c3..51416819 100644
+--- a/glm/gtx/color_space.hpp
++++ b/glm/gtx/color_space.hpp
+@@ -15,6 +15,7 @@
+ // Dependency:
+ #include "../glm.hpp"
+ 
++#include "../experimental.hpp"
+ #ifndef GLM_ENABLE_EXPERIMENTAL
+ #	error "GLM: GLM_GTX_color_space is an experimental extension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including it, if you really want to use it."
+ #endif
+diff --git a/glm/gtx/color_space_YCoCg.hpp b/glm/gtx/color_space_YCoCg.hpp
+index e82cbd8b..7ae71041 100644
+--- a/glm/gtx/color_space_YCoCg.hpp
++++ b/glm/gtx/color_space_YCoCg.hpp
+@@ -15,6 +15,7 @@
+ // Dependency:
+ #include "../glm.hpp"
+ 
++#include "../experimental.hpp"
+ #ifndef GLM_ENABLE_EXPERIMENTAL
+ #	error "GLM: GLM_GTX_color_space_YCoCg is an experimental extension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including it, if you really want to use it."
+ #endif
+diff --git a/glm/gtx/common.hpp b/glm/gtx/common.hpp
+index 8081bff7..57a68a8d 100644
+--- a/glm/gtx/common.hpp
++++ b/glm/gtx/common.hpp
+@@ -18,6 +18,7 @@
+ #include "../vec4.hpp"
+ #include "../gtc/vec1.hpp"
+ 
++#include "../experimental.hpp"
+ #ifndef GLM_ENABLE_EXPERIMENTAL
+ #	error "GLM: GLM_GTX_common is an experimental extension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including it, if you really want to use it."
+ #endif
+diff --git a/glm/gtx/compatibility.hpp b/glm/gtx/compatibility.hpp
+index e5b60399..9876669c 100644
+--- a/glm/gtx/compatibility.hpp
++++ b/glm/gtx/compatibility.hpp
+@@ -16,6 +16,7 @@
+ #include "../glm.hpp"
+ #include "../gtc/quaternion.hpp"
+ 
++#include "../experimental.hpp"
+ #ifndef GLM_ENABLE_EXPERIMENTAL
+ #	error "GLM: GLM_GTX_compatibility is an experimental extension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including it, if you really want to use it."
+ #endif
+diff --git a/glm/gtx/component_wise.hpp b/glm/gtx/component_wise.hpp
+index 39bab5d5..4fe0e4e2 100644
+--- a/glm/gtx/component_wise.hpp
++++ b/glm/gtx/component_wise.hpp
+@@ -18,6 +18,7 @@
+ #include "../detail/setup.hpp"
+ #include "../detail/qualifier.hpp"
+ 
++#include "../experimental.hpp"
+ #ifndef GLM_ENABLE_EXPERIMENTAL
+ #	error "GLM: GLM_GTX_component_wise is an experimental extension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including it, if you really want to use it."
+ #endif
+diff --git a/glm/gtx/dual_quaternion.hpp b/glm/gtx/dual_quaternion.hpp
+index c4343e9d..d59fb459 100644
+--- a/glm/gtx/dual_quaternion.hpp
++++ b/glm/gtx/dual_quaternion.hpp
+@@ -20,6 +20,7 @@
+ #include "../gtc/constants.hpp"
+ #include "../gtc/quaternion.hpp"
+ 
++#include "../experimental.hpp"
+ #ifndef GLM_ENABLE_EXPERIMENTAL
+ #	error "GLM: GLM_GTX_dual_quaternion is an experimental extension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including it, if you really want to use it."
+ #endif
+diff --git a/glm/gtx/euler_angles.hpp b/glm/gtx/euler_angles.hpp
+index e66e9281..ad5988c1 100644
+--- a/glm/gtx/euler_angles.hpp
++++ b/glm/gtx/euler_angles.hpp
+@@ -15,6 +15,7 @@
+ // Dependency:
+ #include "../glm.hpp"
+ 
++#include "../experimental.hpp"
+ #ifndef GLM_ENABLE_EXPERIMENTAL
+ #	error "GLM: GLM_GTX_euler_angles is an experimental extension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including it, if you really want to use it."
+ #endif
+diff --git a/glm/gtx/extend.hpp b/glm/gtx/extend.hpp
+index eda4e470..cde6db63 100644
+--- a/glm/gtx/extend.hpp
++++ b/glm/gtx/extend.hpp
+@@ -15,6 +15,7 @@
+ // Dependency:
+ #include "../glm.hpp"
+ 
++#include "../experimental.hpp"
+ #ifndef GLM_ENABLE_EXPERIMENTAL
+ #	error "GLM: GLM_GTX_extend is an experimental extension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including it, if you really want to use it."
+ #endif
+diff --git a/glm/gtx/extended_min_max.hpp b/glm/gtx/extended_min_max.hpp
+index 3e767b0c..0bcffcc6 100644
+--- a/glm/gtx/extended_min_max.hpp
++++ b/glm/gtx/extended_min_max.hpp
+@@ -15,6 +15,7 @@
+ // Dependency:
+ #include "../glm.hpp"
+ 
++#include "../experimental.hpp"
+ #ifndef GLM_ENABLE_EXPERIMENTAL
+ #	error "GLM: GLM_GTX_extented_min_max is an experimental extension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including it, if you really want to use it."
+ #endif
+diff --git a/glm/gtx/fast_exponential.hpp b/glm/gtx/fast_exponential.hpp
+index 2d4918e7..e6d11f0a 100644
+--- a/glm/gtx/fast_exponential.hpp
++++ b/glm/gtx/fast_exponential.hpp
+@@ -16,6 +16,7 @@
+ // Dependency:
+ #include "../glm.hpp"
+ 
++#include "../experimental.hpp"
+ #ifndef GLM_ENABLE_EXPERIMENTAL
+ #	error "GLM: GLM_GTX_fast_exponential is an experimental extension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including it, if you really want to use it."
+ #endif
+diff --git a/glm/gtx/fast_square_root.hpp b/glm/gtx/fast_square_root.hpp
+index 1e1ec3cf..f758aeef 100644
+--- a/glm/gtx/fast_square_root.hpp
++++ b/glm/gtx/fast_square_root.hpp
+@@ -19,6 +19,7 @@
+ #include "../exponential.hpp"
+ #include "../geometric.hpp"
+ 
++#include "../experimental.hpp"
+ #ifndef GLM_ENABLE_EXPERIMENTAL
+ #	error "GLM: GLM_GTX_fast_square_root is an experimental extension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including it, if you really want to use it."
+ #endif
+diff --git a/glm/gtx/fast_trigonometry.hpp b/glm/gtx/fast_trigonometry.hpp
+index 739065fb..f1332958 100644
+--- a/glm/gtx/fast_trigonometry.hpp
++++ b/glm/gtx/fast_trigonometry.hpp
+@@ -15,6 +15,7 @@
+ // Dependency:
+ #include "../gtc/constants.hpp"
+ 
++#include "../experimental.hpp"
+ #ifndef GLM_ENABLE_EXPERIMENTAL
+ #	error "GLM: GLM_GTX_fast_trigonometry is an experimental extension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including it, if you really want to use it."
+ #endif
+diff --git a/glm/gtx/gradient_paint.hpp b/glm/gtx/gradient_paint.hpp
+index 2713cec0..d4703991 100644
+--- a/glm/gtx/gradient_paint.hpp
++++ b/glm/gtx/gradient_paint.hpp
+@@ -17,6 +17,7 @@
+ #include "../glm.hpp"
+ #include "../gtx/optimum_pow.hpp"
+ 
++#include "../experimental.hpp"
+ #ifndef GLM_ENABLE_EXPERIMENTAL
+ #	error "GLM: GLM_GTX_gradient_paint is an experimental extension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including it, if you really want to use it."
+ #endif
+diff --git a/glm/gtx/handed_coordinate_space.hpp b/glm/gtx/handed_coordinate_space.hpp
+index 1d0d4104..3a52ddcf 100644
+--- a/glm/gtx/handed_coordinate_space.hpp
++++ b/glm/gtx/handed_coordinate_space.hpp
+@@ -15,6 +15,7 @@
+ // Dependency:
+ #include "../glm.hpp"
+ 
++#include "../experimental.hpp"
+ #ifndef GLM_ENABLE_EXPERIMENTAL
+ #	error "GLM: GLM_GTX_handed_coordinate_space is an experimental extension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including it, if you really want to use it."
+ #endif
+diff --git a/glm/gtx/hash.hpp b/glm/gtx/hash.hpp
+index fe8a3efd..92bfc9b2 100644
+--- a/glm/gtx/hash.hpp
++++ b/glm/gtx/hash.hpp
+@@ -12,6 +12,7 @@
+ 
+ #pragma once
+ 
++#include "../experimental.hpp"
+ #ifndef GLM_ENABLE_EXPERIMENTAL
+ #	error "GLM: GLM_GTX_hash is an experimental extension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including it, if you really want to use it."
+ #endif
+diff --git a/glm/gtx/integer.hpp b/glm/gtx/integer.hpp
+index 96637a13..5d1a16c6 100644
+--- a/glm/gtx/integer.hpp
++++ b/glm/gtx/integer.hpp
+@@ -16,6 +16,7 @@
+ #include "../glm.hpp"
+ #include "../gtc/integer.hpp"
+ 
++#include "../experimental.hpp"
+ #ifndef GLM_ENABLE_EXPERIMENTAL
+ #	error "GLM: GLM_GTX_integer is an experimental extension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including it, if you really want to use it."
+ #endif
+diff --git a/glm/gtx/intersect.hpp b/glm/gtx/intersect.hpp
+index 61e2226a..4895ba93 100644
+--- a/glm/gtx/intersect.hpp
++++ b/glm/gtx/intersect.hpp
+@@ -21,6 +21,7 @@
+ #include "../gtx/closest_point.hpp"
+ #include "../gtx/vector_query.hpp"
+ 
++#include "../experimental.hpp"
+ #ifndef GLM_ENABLE_EXPERIMENTAL
+ #	error "GLM: GLM_GTX_closest_point is an experimental extension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including it, if you really want to use it."
+ #endif
+diff --git a/glm/gtx/io.hpp b/glm/gtx/io.hpp
+index 49a1ec11..ae39cd60 100644
+--- a/glm/gtx/io.hpp
++++ b/glm/gtx/io.hpp
+@@ -23,6 +23,7 @@
+ #include "../glm.hpp"
+ #include "../gtx/quaternion.hpp"
+ 
++#include "../experimental.hpp"
+ #ifndef GLM_ENABLE_EXPERIMENTAL
+ #	error "GLM: GLM_GTX_io is an experimental extension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including it, if you really want to use it."
+ #endif
+diff --git a/glm/gtx/log_base.hpp b/glm/gtx/log_base.hpp
+index e873e356..45b8d53c 100644
+--- a/glm/gtx/log_base.hpp
++++ b/glm/gtx/log_base.hpp
+@@ -15,6 +15,7 @@
+ // Dependency:
+ #include "../glm.hpp"
+ 
++#include "../experimental.hpp"
+ #ifndef GLM_ENABLE_EXPERIMENTAL
+ #	error "GLM: GLM_GTX_log_base is an experimental extension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including it, if you really want to use it."
+ #endif
+diff --git a/glm/gtx/matrix_cross_product.hpp b/glm/gtx/matrix_cross_product.hpp
+index 967743b8..52d6c173 100644
+--- a/glm/gtx/matrix_cross_product.hpp
++++ b/glm/gtx/matrix_cross_product.hpp
+@@ -16,6 +16,7 @@
+ // Dependency:
+ #include "../glm.hpp"
+ 
++#include "../experimental.hpp"
+ #ifndef GLM_ENABLE_EXPERIMENTAL
+ #	error "GLM: GLM_GTX_matrix_cross_product is an experimental extension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including it, if you really want to use it."
+ #endif
+diff --git a/glm/gtx/matrix_decompose.hpp b/glm/gtx/matrix_decompose.hpp
+index b7ec0e83..6793fee2 100644
+--- a/glm/gtx/matrix_decompose.hpp
++++ b/glm/gtx/matrix_decompose.hpp
+@@ -20,6 +20,7 @@
+ #include "../gtc/quaternion.hpp"
+ #include "../gtc/matrix_transform.hpp"
+ 
++#include "../experimental.hpp"
+ #ifndef GLM_ENABLE_EXPERIMENTAL
+ #	error "GLM: GLM_GTX_matrix_decompose is an experimental extension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including it, if you really want to use it."
+ #endif
+diff --git a/glm/gtx/matrix_factorisation.hpp b/glm/gtx/matrix_factorisation.hpp
+index e30a7746..79c293be 100644
+--- a/glm/gtx/matrix_factorisation.hpp
++++ b/glm/gtx/matrix_factorisation.hpp
+@@ -15,6 +15,7 @@
+ // Dependency:
+ #include "../glm.hpp"
+ 
++#include "../experimental.hpp"
+ #ifndef GLM_ENABLE_EXPERIMENTAL
+ #	error "GLM: GLM_GTX_matrix_factorisation is an experimental extension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including it, if you really want to use it."
+ #endif
+diff --git a/glm/gtx/matrix_interpolation.hpp b/glm/gtx/matrix_interpolation.hpp
+index 89c4596c..799983bb 100644
+--- a/glm/gtx/matrix_interpolation.hpp
++++ b/glm/gtx/matrix_interpolation.hpp
+@@ -16,6 +16,7 @@
+ // Dependency:
+ #include "../glm.hpp"
+ 
++#include "../experimental.hpp"
+ #ifndef GLM_ENABLE_EXPERIMENTAL
+ #	error "GLM: GLM_GTX_matrix_interpolation is an experimental extension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including it, if you really want to use it."
+ #endif
+diff --git a/glm/gtx/matrix_major_storage.hpp b/glm/gtx/matrix_major_storage.hpp
+index 7f264a59..e68467cd 100644
+--- a/glm/gtx/matrix_major_storage.hpp
++++ b/glm/gtx/matrix_major_storage.hpp
+@@ -16,6 +16,7 @@
+ // Dependency:
+ #include "../glm.hpp"
+ 
++#include "../experimental.hpp"
+ #ifndef GLM_ENABLE_EXPERIMENTAL
+ #	error "GLM: GLM_GTX_matrix_major_storage is an experimental extension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including it, if you really want to use it."
+ #endif
+diff --git a/glm/gtx/matrix_operation.hpp b/glm/gtx/matrix_operation.hpp
+index bce938bb..1e85bb5e 100644
+--- a/glm/gtx/matrix_operation.hpp
++++ b/glm/gtx/matrix_operation.hpp
+@@ -15,6 +15,7 @@
+ // Dependency:
+ #include "../glm.hpp"
+ 
++#include "../experimental.hpp"
+ #ifndef GLM_ENABLE_EXPERIMENTAL
+ #	error "GLM: GLM_GTX_matrix_operation is an experimental extension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including it, if you really want to use it."
+ #endif
+diff --git a/glm/gtx/matrix_query.hpp b/glm/gtx/matrix_query.hpp
+index 5df5f52f..eec1eec0 100644
+--- a/glm/gtx/matrix_query.hpp
++++ b/glm/gtx/matrix_query.hpp
+@@ -18,6 +18,7 @@
+ #include "../gtx/vector_query.hpp"
+ #include <limits>
+ 
++#include "../experimental.hpp"
+ #ifndef GLM_ENABLE_EXPERIMENTAL
+ #	error "GLM: GLM_GTX_matrix_query is an experimental extension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including it, if you really want to use it."
+ #endif
+diff --git a/glm/gtx/matrix_transform_2d.hpp b/glm/gtx/matrix_transform_2d.hpp
+index 239ab9f4..3ca8d2f2 100644
+--- a/glm/gtx/matrix_transform_2d.hpp
++++ b/glm/gtx/matrix_transform_2d.hpp
+@@ -17,6 +17,7 @@
+ #include "../mat3x3.hpp"
+ #include "../vec2.hpp"
+ 
++#include "../experimental.hpp"
+ #ifndef GLM_ENABLE_EXPERIMENTAL
+ #	error "GLM: GLM_GTX_matrix_transform_2d is an experimental extension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including it, if you really want to use it."
+ #endif
+diff --git a/glm/gtx/mixed_product.hpp b/glm/gtx/mixed_product.hpp
+index 58562aab..5c7460d5 100644
+--- a/glm/gtx/mixed_product.hpp
++++ b/glm/gtx/mixed_product.hpp
+@@ -15,6 +15,7 @@
+ // Dependency:
+ #include "../glm.hpp"
+ 
++#include "../experimental.hpp"
+ #ifndef GLM_ENABLE_EXPERIMENTAL
+ #	error "GLM: GLM_GTX_mixed_product is an experimental extension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including it, if you really want to use it."
+ #endif
+diff --git a/glm/gtx/norm.hpp b/glm/gtx/norm.hpp
+index 46474e07..3cf2c3ea 100644
+--- a/glm/gtx/norm.hpp
++++ b/glm/gtx/norm.hpp
+@@ -17,6 +17,7 @@
+ #include "../geometric.hpp"
+ #include "../gtx/quaternion.hpp"
+ 
++#include "../experimental.hpp"
+ #ifndef GLM_ENABLE_EXPERIMENTAL
+ #	error "GLM: GLM_GTX_norm is an experimental extension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including it, if you really want to use it."
+ #endif
+diff --git a/glm/gtx/normal.hpp b/glm/gtx/normal.hpp
+index 15cec9c2..7bb4c096 100644
+--- a/glm/gtx/normal.hpp
++++ b/glm/gtx/normal.hpp
+@@ -16,6 +16,7 @@
+ // Dependency:
+ #include "../glm.hpp"
+ 
++#include "../experimental.hpp"
+ #ifndef GLM_ENABLE_EXPERIMENTAL
+ #	error "GLM: GLM_GTX_normal is an experimental extension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including it, if you really want to use it."
+ #endif
+diff --git a/glm/gtx/normalize_dot.hpp b/glm/gtx/normalize_dot.hpp
+index 86048e70..c6604da4 100644
+--- a/glm/gtx/normalize_dot.hpp
++++ b/glm/gtx/normalize_dot.hpp
+@@ -16,6 +16,7 @@
+ // Dependency:
+ #include "../gtx/fast_square_root.hpp"
+ 
++#include "../experimental.hpp"
+ #ifndef GLM_ENABLE_EXPERIMENTAL
+ #	error "GLM: GLM_GTX_normalize_dot is an experimental extension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including it, if you really want to use it."
+ #endif
+diff --git a/glm/gtx/number_precision.hpp b/glm/gtx/number_precision.hpp
+index 3732a56c..b48845f7 100644
+--- a/glm/gtx/number_precision.hpp
++++ b/glm/gtx/number_precision.hpp
+@@ -18,6 +18,7 @@
+ #include "../glm.hpp"
+ #include "../gtc/type_precision.hpp"
+ 
++#include "../experimental.hpp"
+ #ifndef GLM_ENABLE_EXPERIMENTAL
+ #	error "GLM: GLM_GTX_number_precision is an experimental extension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including it, if you really want to use it."
+ #endif
+diff --git a/glm/gtx/optimum_pow.hpp b/glm/gtx/optimum_pow.hpp
+index eb09f1c3..94a6bbb2 100644
+--- a/glm/gtx/optimum_pow.hpp
++++ b/glm/gtx/optimum_pow.hpp
+@@ -15,6 +15,7 @@
+ // Dependency:
+ #include "../glm.hpp"
+ 
++#include "../experimental.hpp"
+ #ifndef GLM_ENABLE_EXPERIMENTAL
+ #	error "GLM: GLM_GTX_optimum_pow is an experimental extension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including it, if you really want to use it."
+ #endif
+diff --git a/glm/gtx/orthonormalize.hpp b/glm/gtx/orthonormalize.hpp
+index 2a684ee4..4ff47e53 100644
+--- a/glm/gtx/orthonormalize.hpp
++++ b/glm/gtx/orthonormalize.hpp
+@@ -18,6 +18,7 @@
+ #include "../mat3x3.hpp"
+ #include "../geometric.hpp"
+ 
++#include "../experimental.hpp"
+ #ifndef GLM_ENABLE_EXPERIMENTAL
+ #	error "GLM: GLM_GTX_orthonormalize is an experimental extension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including it, if you really want to use it."
+ #endif
+diff --git a/glm/gtx/perpendicular.hpp b/glm/gtx/perpendicular.hpp
+index 35601ac7..17251ebe 100644
+--- a/glm/gtx/perpendicular.hpp
++++ b/glm/gtx/perpendicular.hpp
+@@ -17,6 +17,7 @@
+ #include "../glm.hpp"
+ #include "../gtx/projection.hpp"
+ 
++#include "../experimental.hpp"
+ #ifndef GLM_ENABLE_EXPERIMENTAL
+ #	error "GLM: GLM_GTX_perpendicular is an experimental extension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including it, if you really want to use it."
+ #endif
+diff --git a/glm/gtx/polar_coordinates.hpp b/glm/gtx/polar_coordinates.hpp
+index b8421db4..5125215d 100644
+--- a/glm/gtx/polar_coordinates.hpp
++++ b/glm/gtx/polar_coordinates.hpp
+@@ -15,6 +15,7 @@
+ // Dependency:
+ #include "../glm.hpp"
+ 
++#include "../experimental.hpp"
+ #ifndef GLM_ENABLE_EXPERIMENTAL
+ #	error "GLM: GLM_GTX_polar_coordinates is an experimental extension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including it, if you really want to use it."
+ #endif
+diff --git a/glm/gtx/projection.hpp b/glm/gtx/projection.hpp
+index 9a24abf9..4d5bf76f 100644
+--- a/glm/gtx/projection.hpp
++++ b/glm/gtx/projection.hpp
+@@ -15,6 +15,7 @@
+ // Dependency:
+ #include "../geometric.hpp"
+ 
++#include "../experimental.hpp"
+ #ifndef GLM_ENABLE_EXPERIMENTAL
+ #	error "GLM: GLM_GTX_projection is an experimental extension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including it, if you really want to use it."
+ #endif
+diff --git a/glm/gtx/quaternion.hpp b/glm/gtx/quaternion.hpp
+index c3d99a5c..808ba0fd 100644
+--- a/glm/gtx/quaternion.hpp
++++ b/glm/gtx/quaternion.hpp
+@@ -19,6 +19,7 @@
+ #include "../gtc/quaternion.hpp"
+ #include "../gtx/norm.hpp"
+ 
++#include "../experimental.hpp"
+ #ifndef GLM_ENABLE_EXPERIMENTAL
+ #	error "GLM: GLM_GTX_quaternion is an experimental extension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including it, if you really want to use it."
+ #endif
+diff --git a/glm/gtx/range.hpp b/glm/gtx/range.hpp
+index e0ef46af..03c797c3 100644
+--- a/glm/gtx/range.hpp
++++ b/glm/gtx/range.hpp
+@@ -15,6 +15,7 @@
+ // Dependencies
+ #include "../detail/setup.hpp"
+ 
++#include "../experimental.hpp"
+ #ifndef GLM_ENABLE_EXPERIMENTAL
+ #	error "GLM: GLM_GTX_range is an experimental extension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including it, if you really want to use it."
+ #endif
+diff --git a/glm/gtx/raw_data.hpp b/glm/gtx/raw_data.hpp
+index fb34c8cb..0084fec6 100644
+--- a/glm/gtx/raw_data.hpp
++++ b/glm/gtx/raw_data.hpp
+@@ -16,6 +16,7 @@
+ #include "../detail/setup.hpp"
+ #include "../detail/type_int.hpp"
+ 
++#include "../experimental.hpp"
+ #ifndef GLM_ENABLE_EXPERIMENTAL
+ #	error "GLM: GLM_GTX_raw_data is an experimental extension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including it, if you really want to use it."
+ #endif
+diff --git a/glm/gtx/rotate_normalized_axis.hpp b/glm/gtx/rotate_normalized_axis.hpp
+index eee90d6e..82612928 100644
+--- a/glm/gtx/rotate_normalized_axis.hpp
++++ b/glm/gtx/rotate_normalized_axis.hpp
+@@ -19,6 +19,7 @@
+ #include "../gtc/epsilon.hpp"
+ #include "../gtc/quaternion.hpp"
+ 
++#include "../experimental.hpp"
+ #ifndef GLM_ENABLE_EXPERIMENTAL
+ #	error "GLM: GLM_GTX_rotate_normalized_axis is an experimental extension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including it, if you really want to use it."
+ #endif
+diff --git a/glm/gtx/rotate_vector.hpp b/glm/gtx/rotate_vector.hpp
+index c8ace89e..e954b041 100644
+--- a/glm/gtx/rotate_vector.hpp
++++ b/glm/gtx/rotate_vector.hpp
+@@ -17,6 +17,7 @@
+ #include "../glm.hpp"
+ #include "../gtx/transform.hpp"
+ 
++#include "../experimental.hpp"
+ #ifndef GLM_ENABLE_EXPERIMENTAL
+ #	error "GLM: GLM_GTX_rotate_vector is an experimental extension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including it, if you really want to use it."
+ #endif
+diff --git a/glm/gtx/scalar_multiplication.hpp b/glm/gtx/scalar_multiplication.hpp
+index b73edf67..22baa52a 100644
+--- a/glm/gtx/scalar_multiplication.hpp
++++ b/glm/gtx/scalar_multiplication.hpp
+@@ -16,6 +16,7 @@
+ 
+ #include "../detail/setup.hpp"
+ 
++#include "../experimental.hpp"
+ #ifndef GLM_ENABLE_EXPERIMENTAL
+ #	error "GLM: GLM_GTX_scalar_multiplication is an experimental extension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including it, if you really want to use it."
+ #endif
+diff --git a/glm/gtx/scalar_relational.hpp b/glm/gtx/scalar_relational.hpp
+index 7fc8c1cc..f21f3b2b 100644
+--- a/glm/gtx/scalar_relational.hpp
++++ b/glm/gtx/scalar_relational.hpp
+@@ -15,6 +15,7 @@
+ // Dependency:
+ #include "../glm.hpp"
+ 
++#include "../experimental.hpp"
+ #ifndef GLM_ENABLE_EXPERIMENTAL
+ #	error "GLM: GLM_GTX_extend is an experimental extension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including it, if you really want to use it."
+ #endif
+diff --git a/glm/gtx/spline.hpp b/glm/gtx/spline.hpp
+index f96d7e07..76359cfd 100644
+--- a/glm/gtx/spline.hpp
++++ b/glm/gtx/spline.hpp
+@@ -16,6 +16,7 @@
+ #include "../glm.hpp"
+ #include "../gtx/optimum_pow.hpp"
+ 
++#include "../experimental.hpp"
+ #ifndef GLM_ENABLE_EXPERIMENTAL
+ #	error "GLM: GLM_GTX_spline is an experimental extension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including it, if you really want to use it."
+ #endif
+diff --git a/glm/gtx/std_based_type.hpp b/glm/gtx/std_based_type.hpp
+index 55a2f074..92532b9e 100644
+--- a/glm/gtx/std_based_type.hpp
++++ b/glm/gtx/std_based_type.hpp
+@@ -17,6 +17,7 @@
+ #include "../glm.hpp"
+ #include <cstdlib>
+ 
++#include "../experimental.hpp"
+ #ifndef GLM_ENABLE_EXPERIMENTAL
+ #	error "GLM: GLM_GTX_std_based_type is an experimental extension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including it, if you really want to use it."
+ #endif
+diff --git a/glm/gtx/string_cast.hpp b/glm/gtx/string_cast.hpp
+index 4b4e280f..dfcd5085 100644
+--- a/glm/gtx/string_cast.hpp
++++ b/glm/gtx/string_cast.hpp
+@@ -24,6 +24,7 @@
+ #include <string>
+ #include <cmath>
+ 
++#include "../experimental.hpp"
+ #ifndef GLM_ENABLE_EXPERIMENTAL
+ #	error "GLM: GLM_GTX_string_cast is an experimental extension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including it, if you really want to use it."
+ #endif
+diff --git a/glm/gtx/texture.hpp b/glm/gtx/texture.hpp
+index 312bf398..7af185f6 100644
+--- a/glm/gtx/texture.hpp
++++ b/glm/gtx/texture.hpp
+@@ -17,6 +17,7 @@
+ #include "../gtc/integer.hpp"
+ #include "../gtx/component_wise.hpp"
+ 
++#include "../experimental.hpp"
+ #ifndef GLM_ENABLE_EXPERIMENTAL
+ #	error "GLM: GLM_GTX_texture is an experimental extension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including it, if you really want to use it."
+ #endif
+diff --git a/glm/gtx/transform.hpp b/glm/gtx/transform.hpp
+index d23b99ce..5a5d9619 100644
+--- a/glm/gtx/transform.hpp
++++ b/glm/gtx/transform.hpp
+@@ -19,6 +19,7 @@
+ #include "../glm.hpp"
+ #include "../gtc/matrix_transform.hpp"
+ 
++#include "../experimental.hpp"
+ #ifndef GLM_ENABLE_EXPERIMENTAL
+ #	error "GLM: GLM_GTX_transform is an experimental extension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including it, if you really want to use it."
+ #endif
+diff --git a/glm/gtx/transform2.hpp b/glm/gtx/transform2.hpp
+index 85f5bea4..5d7c83fc 100644
+--- a/glm/gtx/transform2.hpp
++++ b/glm/gtx/transform2.hpp
+@@ -17,6 +17,7 @@
+ #include "../glm.hpp"
+ #include "../gtx/transform.hpp"
+ 
++#include "../experimental.hpp"
+ #ifndef GLM_ENABLE_EXPERIMENTAL
+ #	error "GLM: GLM_GTX_transform2 is an experimental extension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including it, if you really want to use it."
+ #endif
+diff --git a/glm/gtx/type_aligned.hpp b/glm/gtx/type_aligned.hpp
+index 6ff9f276..6ad92fad 100644
+--- a/glm/gtx/type_aligned.hpp
++++ b/glm/gtx/type_aligned.hpp
+@@ -18,6 +18,7 @@
+ // Dependency:
+ #include "../gtc/type_precision.hpp"
+ 
++#include "../experimental.hpp"
+ #ifndef GLM_ENABLE_EXPERIMENTAL
+ #	error "GLM: GLM_GTX_type_aligned is an experimental extension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including it, if you really want to use it."
+ #endif
+diff --git a/glm/gtx/type_trait.hpp b/glm/gtx/type_trait.hpp
+index 637bbd19..65519cab 100644
+--- a/glm/gtx/type_trait.hpp
++++ b/glm/gtx/type_trait.hpp
+@@ -12,6 +12,7 @@
+ 
+ #pragma once
+ 
++#include "../experimental.hpp"
+ #ifndef GLM_ENABLE_EXPERIMENTAL
+ #	error "GLM: GLM_GTX_type_trait is an experimental extension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including it, if you really want to use it."
+ #endif
+diff --git a/glm/gtx/vec_swizzle.hpp b/glm/gtx/vec_swizzle.hpp
+index daebac38..13d523dc 100644
+--- a/glm/gtx/vec_swizzle.hpp
++++ b/glm/gtx/vec_swizzle.hpp
+@@ -14,6 +14,7 @@
+ 
+ #include "../glm.hpp"
+ 
++#include "../experimental.hpp"
+ #ifndef GLM_ENABLE_EXPERIMENTAL
+ #	error "GLM: GLM_GTX_vec_swizzle is an experimental extension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including it, if you really want to use it."
+ #endif
+diff --git a/glm/gtx/vector_angle.hpp b/glm/gtx/vector_angle.hpp
+index 401a47eb..98c9d110 100644
+--- a/glm/gtx/vector_angle.hpp
++++ b/glm/gtx/vector_angle.hpp
+@@ -20,6 +20,7 @@
+ #include "../gtx/quaternion.hpp"
+ #include "../gtx/rotate_vector.hpp"
+ 
++#include "../experimental.hpp"
+ #ifndef GLM_ENABLE_EXPERIMENTAL
+ #	error "GLM: GLM_GTX_vector_angle is an experimental extension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including it, if you really want to use it."
+ #endif
+diff --git a/glm/gtx/vector_query.hpp b/glm/gtx/vector_query.hpp
+index 6560eaa5..5ab1ffda 100644
+--- a/glm/gtx/vector_query.hpp
++++ b/glm/gtx/vector_query.hpp
+@@ -17,6 +17,7 @@
+ #include <cfloat>
+ #include <limits>
+ 
++#include "../experimental.hpp"
+ #ifndef GLM_ENABLE_EXPERIMENTAL
+ #	error "GLM: GLM_GTX_vector_query is an experimental extension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including it, if you really want to use it."
+ #endif
+diff --git a/glm/gtx/wrap.hpp b/glm/gtx/wrap.hpp
+index 2c4b55df..5bf26a33 100644
+--- a/glm/gtx/wrap.hpp
++++ b/glm/gtx/wrap.hpp
+@@ -16,6 +16,7 @@
+ #include "../glm.hpp"
+ #include "../gtc/vec1.hpp"
+ 
++#include "../experimental.hpp"
+ #ifndef GLM_ENABLE_EXPERIMENTAL
+ #	error "GLM: GLM_GTX_wrap is an experimental extension and may change in the future. Use #define GLM_ENABLE_EXPERIMENTAL before including it, if you really want to use it."
+ #endif
+-- 
+2.14.3
+
diff --git a/meta-oe/recipes-graphics/glm/files/0002-glm-install-headers-only.patch b/meta-oe/recipes-graphics/glm/files/0002-glm-install-headers-only.patch
new file mode 100644
index 000000000..1be3318cc
--- /dev/null
+++ b/meta-oe/recipes-graphics/glm/files/0002-glm-install-headers-only.patch
@@ -0,0 +1,46 @@
+From 7fdd36d7496238e03e43fcc32839f75588116c5d Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Fri, 16 Mar 2018 15:44:48 +0100
+Subject: [PATCH 2/2] glm: install headers only
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Plausibility check in root source path
+
+$ find glm -type f ! -name '*.hpp' ! -name '*.h' ! -name '*.inl'
+glm/detail/glm.cpp
+glm/detail/dummy.cpp
+glm/experimental.hpp.in
+glm/CMakeLists.txt
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+
+Uptream-Status: Submitted [1]
+
+[1] https://github.com/g-truc/glm/pull/741
+---
+ CMakeLists.txt | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index bd4dd654..113dd735 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -171,7 +171,12 @@ option(GLM_INSTALL_ENABLE "GLM install" ON)
+ 
+ set(GLM_INSTALL_CONFIGDIR "${CMAKE_INSTALL_LIBDIR}/cmake/glm")
+ if (GLM_INSTALL_ENABLE)
+-	install(DIRECTORY glm DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
++	install(DIRECTORY glm
++		DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
++		FILES_MATCHING
++			PATTERN "*.h"
++			PATTERN "*.hpp"
++			PATTERN "*.inl")
+ 	install(FILES "${CMAKE_CURRENT_BINARY_DIR}/experimental.hpp" DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/glm)
+ endif()
+ 
+-- 
+2.14.3
+
diff --git a/meta-oe/recipes-graphics/glm/glm_0.9.9-a2.bb b/meta-oe/recipes-graphics/glm/glm_0.9.9-a2.bb
index ed050a148..4e2ee2378 100644
--- a/meta-oe/recipes-graphics/glm/glm_0.9.9-a2.bb
+++ b/meta-oe/recipes-graphics/glm/glm_0.9.9-a2.bb
@@ -10,12 +10,18 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://readme.md;beginline=21;endline=22;md5=3075b5727d36f29edccf97b93e72b790"
 
-SRC_URI = "git://github.com/g-truc/glm;branch=master"
+SRC_URI = " \
+    git://github.com/g-truc/glm;branch=master \
+    file://0001-Make-GLM_ENABLE_EXPERIMENTAL-a-configurable-option.patch \
+    file://0002-glm-install-headers-only.patch \
+"
 SRCREV = "fcbedf5058ef8613dd02aac62ef00d55dcfeadd7"
 S = "${WORKDIR}/git"
 
 inherit cmake
 
+EXTRA_OECMAKE = "-DGLM_ENABLE_EXPERIMENTAL=ON"
+
 FILES_${PN}-dev += "${libdir}/cmake"
 RDEPENDS_${PN}-dev = ""
 
-- 
2.14.3


