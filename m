Return-Path: <ismo.puustinen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id EA30A71AC1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Aug 2017 09:58:37 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Aug 2017 02:58:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,352,1498546800"; d="scan'208";a="122005292"
Received: from ipuustin-desk.fi.intel.com ([10.237.72.72])
	by orsmga002.jf.intel.com with ESMTP; 10 Aug 2017 02:58:22 -0700
From: Ismo Puustinen <ismo.puustinen@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Aug 2017 12:58:18 +0300
Message-Id: <20170810095818.18934-1-ismo.puustinen@intel.com>
X-Mailer: git-send-email 2.13.4
Subject: [PATCH v2] opencv: update to version 3.3.
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
X-List-Received-Date: Thu, 10 Aug 2017 09:58:38 -0000

Update OpenCV recipe from version 3.2 to 3.3. Rebase patches and drop
those which are no longer relevant or already contained in upstream
OpenCV. Fix changed build options, such as UPDATE_PROTO_FILES to
PROTOBUF_UPDATE_FILES. Update also subcomponents (opencv-contrib and
opencv-3rdparty) to match with 3.3.

Signed-off-by: Ismo Puustinen <ismo.puustinen@intel.com>
---
 ...01-3rdparty-ippicv-Use-pre-downloaded-ipp.patch |  44 ++--
 .../0001-Revert-cuda-fix-fp16-compilation.patch    |  27 ---
 ...cking-make-opencv_dnn-dependancy-optional.patch | 243 --------------------
 ...ts-create-share-library-intead-of-static.patch} |  12 +-
 ...vert-check-FP16-build-condition-correctly.patch | 245 ---------------------
 ...patch => 0003-To-fix-errors-as-following.patch} |  22 +-
 .../opencv/opencv/uselocalxfeatures.patch          |  26 ++-
 .../opencv/opencv/useoeprotobuf.patch              |  13 --
 .../opencv/{opencv_3.2.bb => opencv_3.3.bb}        |  51 +++--
 9 files changed, 93 insertions(+), 590 deletions(-)
 delete mode 100644 meta-oe/recipes-support/opencv/opencv/0001-Revert-cuda-fix-fp16-compilation.patch
 delete mode 100644 meta-oe/recipes-support/opencv/opencv/0001-tracking-make-opencv_dnn-dependancy-optional.patch
 rename meta-oe/recipes-support/opencv/opencv/{0001-Make-opencv-ts-create-share-library-intead-of-static.patch => 0002-Make-opencv-ts-create-share-library-intead-of-static.patch} (64%)
 delete mode 100644 meta-oe/recipes-support/opencv/opencv/0002-Revert-check-FP16-build-condition-correctly.patch
 rename meta-oe/recipes-support/opencv/opencv/{0001-To-fix-errors-as-following.patch => 0003-To-fix-errors-as-following.patch} (82%)
 delete mode 100644 meta-oe/recipes-support/opencv/opencv/useoeprotobuf.patch
 rename meta-oe/recipes-support/opencv/{opencv_3.2.bb => opencv_3.3.bb} (86%)

diff --git a/meta-oe/recipes-support/opencv/opencv/0001-3rdparty-ippicv-Use-pre-downloaded-ipp.patch b/meta-oe/recipes-support/opencv/opencv/0001-3rdparty-ippicv-Use-pre-downloaded-ipp.patch
index 1077d05be..4d76ad40c 100644
--- a/meta-oe/recipes-support/opencv/opencv/0001-3rdparty-ippicv-Use-pre-downloaded-ipp.patch
+++ b/meta-oe/recipes-support/opencv/opencv/0001-3rdparty-ippicv-Use-pre-downloaded-ipp.patch
@@ -1,28 +1,38 @@
-From 049f931207631aa54af55a2917318d032b2ef3fa Mon Sep 17 00:00:00 2001
+From 4801a057730632225337d7f6d26b9335e6b9b078 Mon Sep 17 00:00:00 2001
 From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
 Date: Thu, 31 Mar 2016 00:20:15 +0200
 Subject: [PATCH] 3rdparty/ippicv: Use pre-downloaded ipp
 
 Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
+Signed-off-by: Ismo Puustinen <ismo.puustinen@intel.com>
 ---
- 3rdparty/ippicv/downloader.cmake | 2 ++
- 1 file changed, 2 insertions(+)
+ 3rdparty/ippicv/ippicv.cmake | 15 +--------------
+ 1 file changed, 1 insertion(+), 14 deletions(-)
 
-diff --git a/3rdparty/ippicv/downloader.cmake b/3rdparty/ippicv/downloader.cmake
-index a6016dbe10bc..af4062c8e95e 100644
---- a/3rdparty/ippicv/downloader.cmake
-+++ b/3rdparty/ippicv/downloader.cmake
-@@ -31,8 +31,10 @@ function(_icv_downloader)
-     return() # Not supported
+diff --git a/3rdparty/ippicv/ippicv.cmake b/3rdparty/ippicv/ippicv.cmake
+index d601da4bb..f6fc1098c 100644
+--- a/3rdparty/ippicv/ippicv.cmake
++++ b/3rdparty/ippicv/ippicv.cmake
+@@ -39,18 +39,5 @@ function(download_ippicv root_var)
    endif()
  
-+  if(NOT DEFINED OPENCV_ICV_PATH)
-   set(OPENCV_ICV_UNPACK_PATH "${CMAKE_BINARY_DIR}/3rdparty/ippicv")
-   set(OPENCV_ICV_PATH "${OPENCV_ICV_UNPACK_PATH}${OPENCV_ICV_PACKAGE_SUBDIR}")
-+  endif()
- 
-   if(DEFINED OPENCV_ICV_PACKAGE_DOWNLOADED
-        AND OPENCV_ICV_PACKAGE_DOWNLOADED STREQUAL OPENCV_ICV_PACKAGE_HASH
+   set(THE_ROOT "${OpenCV_BINARY_DIR}/3rdparty/ippicv")
+-  ocv_download(FILENAME ${OPENCV_ICV_NAME}
+-               HASH ${OPENCV_ICV_HASH}
+-               URL
+-                 "${OPENCV_IPPICV_URL}"
+-                 "$ENV{OPENCV_IPPICV_URL}"
+-                 "https://raw.githubusercontent.com/opencv/opencv_3rdparty/${IPPICV_COMMIT}/ippicv/"
+-               DESTINATION_DIR "${THE_ROOT}"
+-               ID IPPICV
+-               STATUS res
+-               UNPACK RELATIVE_URL)
+-
+-  if(res)
+-    set(${root_var} "${THE_ROOT}/${OPENCV_ICV_PACKAGE_SUBDIR}" PARENT_SCOPE)
+-  endif()
++  set(${root_var} "${THE_ROOT}/${OPENCV_ICV_PACKAGE_SUBDIR}" PARENT_SCOPE)
+ endfunction()
 -- 
-2.8.0.rc3
+2.13.4
 
diff --git a/meta-oe/recipes-support/opencv/opencv/0001-Revert-cuda-fix-fp16-compilation.patch b/meta-oe/recipes-support/opencv/opencv/0001-Revert-cuda-fix-fp16-compilation.patch
deleted file mode 100644
index 507d7968a..000000000
--- a/meta-oe/recipes-support/opencv/opencv/0001-Revert-cuda-fix-fp16-compilation.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 69f9707678190f6a0948a547dce948251f972676 Mon Sep 17 00:00:00 2001
-From: Randy MacLeod <Randy.MacLeod@windriver.com>
-Date: Wed, 26 Apr 2017 14:57:30 -0400
-Subject: [PATCH 1/2] Revert "cuda: fix fp16 compilation"
-
-This reverts commit 12e00827be40576b686ea4438a6e6ef85208743d.
----
- modules/core/include/opencv2/core/cvdef.h | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/modules/core/include/opencv2/core/cvdef.h b/modules/core/include/opencv2/core/cvdef.h
-index 699b166..efc24ca 100644
---- a/modules/core/include/opencv2/core/cvdef.h
-+++ b/modules/core/include/opencv2/core/cvdef.h
-@@ -303,8 +303,7 @@ enum CpuFeatures {
- #define CV_2PI 6.283185307179586476925286766559
- #define CV_LOG2 0.69314718055994530941723212145818
- 
--#if defined __ARM_FP16_FORMAT_IEEE \
--    && !defined __CUDACC__
-+#if defined (__ARM_FP16_FORMAT_IEEE)
- #  define CV_FP16_TYPE 1
- #else
- #  define CV_FP16_TYPE 0
--- 
-2.9.3
-
diff --git a/meta-oe/recipes-support/opencv/opencv/0001-tracking-make-opencv_dnn-dependancy-optional.patch b/meta-oe/recipes-support/opencv/opencv/0001-tracking-make-opencv_dnn-dependancy-optional.patch
deleted file mode 100644
index fba43eba7..000000000
--- a/meta-oe/recipes-support/opencv/opencv/0001-tracking-make-opencv_dnn-dependancy-optional.patch
+++ /dev/null
@@ -1,243 +0,0 @@
-From 69f86025978b9bbbefa54a7248316a859773aeaf Mon Sep 17 00:00:00 2001
-From: berak <px1704@web.de>
-Date: Sat, 4 Mar 2017 12:38:50 +0100
-Subject: [PATCH] tracking: make opencv_dnn dependancy optional
-
-Upstream-status: Backport [https://github.com/opencv/opencv_contrib/commit/43925b60d392fbd01d6b0449713f010f9babe448]
-Signed-off-by: Ismo Puustinen <ismo.puustinen@intel.com>
-
----
- modules/tracking/CMakeLists.txt                   |  3 +--
- modules/tracking/samples/goturnTracker.cpp        | 22 +++++++++++++++++++---
- modules/tracking/samples/multiTracker_dataset.cpp |  1 +
- modules/tracking/samples/tracker_dataset.cpp      |  1 +
- modules/tracking/src/gtrTracker.cpp               | 11 ++++++++++-
- modules/tracking/src/gtrTracker.hpp               | 12 ++++++++----
- modules/tracking/src/gtrUtils.cpp                 |  6 +++---
- modules/tracking/src/gtrUtils.hpp                 |  5 ++---
- modules/tracking/src/tracker.cpp                  |  1 +
- 9 files changed, 46 insertions(+), 16 deletions(-)
-
-diff --git a/modules/tracking/CMakeLists.txt b/modules/tracking/CMakeLists.txt
-index a8b3183..d27f999 100644
---- a/modules/tracking/CMakeLists.txt
-+++ b/modules/tracking/CMakeLists.txt
-@@ -1,2 +1 @@
--set(the_description "Tracking API")
--ocv_define_module(tracking opencv_imgproc opencv_core opencv_video opencv_highgui opencv_dnn opencv_plot OPTIONAL opencv_datasets WRAP python)
-\ No newline at end of file
-+ocv_define_module(tracking opencv_imgproc opencv_core opencv_video opencv_highgui opencv_plot OPTIONAL opencv_dnn opencv_datasets WRAP python)
-diff --git a/modules/tracking/samples/goturnTracker.cpp b/modules/tracking/samples/goturnTracker.cpp
-index 389771e..1e6632d 100644
---- a/modules/tracking/samples/goturnTracker.cpp
-+++ b/modules/tracking/samples/goturnTracker.cpp
-@@ -45,6 +45,9 @@
- //1 - Train you own GOTURN model using <https://github.com/Auron-X/GOTURN_Training_Toolkit>
- //2 - Download pretrained caffemodel from <https://github.com/opencv/opencv_extra>
- 
-+#include "opencv2/opencv_modules.hpp"
-+#if defined(HAVE_OPENCV_DNN) && defined(HAVE_OPENCV_DATASETS)
-+
- #include "opencv2/datasets/track_alov.hpp"
- #include <opencv2/core/utility.hpp>
- #include <opencv2/tracking.hpp>
-@@ -65,8 +68,8 @@ static bool startSelection = false;
- Rect2d boundingBox;
- 
- static const char* keys =
--{ "{@dataset_path     |true| Dataset path     }"
--"{@dataset_id     |1| Dataset ID     }"
-+{ "{@dataset_path     || Dataset path   }"
-+  "{@dataset_id      |1| Dataset ID     }"
- };
- 
- static void onMouse(int event, int x, int y, int, void*)
-@@ -144,9 +147,14 @@ int main(int argc, char *argv[])
-     Ptr<cv::datasets::TRACK_alov> dataset = TRACK_alov::create();
-     dataset->load(datasetRootPath);
-     dataset->initDataset(datasetID);
--
-     //Read first frame
-     dataset->getNextFrame(frame);
-+    if (frame.empty())
-+    {
-+        cout << "invalid dataset: " << datasetRootPath << endl;
-+        return -2;
-+    }
-+
-     frame.copyTo(image);
-     rectangle(image, boundingBox, Scalar(255, 0, 0), 2, 1);
-     imshow("GOTURN Tracking", image);
-@@ -215,3 +223,11 @@ int main(int argc, char *argv[])
- 
-     return 0;
- }
-+
-+#else // ! HAVE_OPENCV_DNN && HAVE_OPENCV_DATASETS
-+#include <opencv2/core.hpp>
-+int main() {
-+    CV_Error(cv::Error::StsNotImplemented , "this sample needs to be built with opencv_datasets and opencv_dnn !");
-+    return -1;
-+}
-+#endif
-diff --git a/modules/tracking/samples/multiTracker_dataset.cpp b/modules/tracking/samples/multiTracker_dataset.cpp
-index 2826b19..b5c27da 100644
---- a/modules/tracking/samples/multiTracker_dataset.cpp
-+++ b/modules/tracking/samples/multiTracker_dataset.cpp
-@@ -234,6 +234,7 @@ int main(int argc, char *argv[])
- }
- 
- #else // ! HAVE_OPENCV_DATASETS
-+#include <opencv2/core.hpp>
- int main() {
- 	CV_Error(cv::Error::StsNotImplemented , "this sample needs to be built with opencv_datasets !");
- 	return -1;
-diff --git a/modules/tracking/samples/tracker_dataset.cpp b/modules/tracking/samples/tracker_dataset.cpp
-index 8b7832a..6178105 100644
---- a/modules/tracking/samples/tracker_dataset.cpp
-+++ b/modules/tracking/samples/tracker_dataset.cpp
-@@ -234,6 +234,7 @@ int main(int argc, char *argv[])
- 
- 
- #else // ! HAVE_OPENCV_DATASETS
-+#include <opencv2/core.hpp>
- int main() {
- 	CV_Error(cv::Error::StsNotImplemented , "this sample needs to be built with opencv_datasets !");
- 	return -1;
-diff --git a/modules/tracking/src/gtrTracker.cpp b/modules/tracking/src/gtrTracker.cpp
-index 58debfd..4904f47 100644
---- a/modules/tracking/src/gtrTracker.cpp
-+++ b/modules/tracking/src/gtrTracker.cpp
-@@ -38,7 +38,7 @@
- // the use of this software, even if advised of the possibility of such damage.
- //
- //M*/
--
-+#include "opencv2/opencv_modules.hpp"
- #include "gtrTracker.hpp"
- 
- 
-@@ -54,9 +54,16 @@ void TrackerGOTURN::Params::write(cv::FileStorage& /*fs*/) const {}
- 
- Ptr<TrackerGOTURN> TrackerGOTURN::createTracker(const TrackerGOTURN::Params &parameters)
- {
-+#ifdef HAVE_OPENCV_DNN
-     return Ptr<gtr::TrackerGOTURNImpl>(new gtr::TrackerGOTURNImpl(parameters));
-+#else
-+    (void)(parameters);
-+    CV_ErrorNoReturn(cv::Error::StsNotImplemented , "to use GOTURN, the tracking module needs to be built with opencv_dnn !");
-+#endif
- }
- 
-+
-+#ifdef HAVE_OPENCV_DNN
- namespace gtr
- {
- 
-@@ -183,9 +190,11 @@ bool TrackerGOTURNImpl::updateImpl(const Mat& image, Rect2d& boundingBox)
-     //Set new model image and BB from current frame
-     ((TrackerGOTURNModel*)static_cast<TrackerModel*>(model))->setImage(curFrame);
-     ((TrackerGOTURNModel*)static_cast<TrackerModel*>(model))->setBoudingBox(curBB);
-+
-     return true;
- }
- 
- }
-+#endif // OPENCV_HAVE_DNN
- 
- }
-diff --git a/modules/tracking/src/gtrTracker.hpp b/modules/tracking/src/gtrTracker.hpp
-index 34f2c48..21ae3d9 100644
---- a/modules/tracking/src/gtrTracker.hpp
-+++ b/modules/tracking/src/gtrTracker.hpp
-@@ -45,11 +45,15 @@
- 
- #include "precomp.hpp"
- #include "opencv2/video/tracking.hpp"
--#include "opencv2/dnn.hpp"
- #include "gtrUtils.hpp"
- #include "opencv2/imgproc.hpp"
--#include<algorithm>
--#include<limits.h>
-+
-+#include <algorithm>
-+#include <limits.h>
-+
-+#include "opencv2/opencv_modules.hpp"
-+#ifdef HAVE_OPENCV_DNN
-+#include "opencv2/dnn.hpp"
- 
- namespace cv
- {
-@@ -72,5 +76,5 @@ public:
- 
- }
- }
--
-+#endif
- #endif
-diff --git a/modules/tracking/src/gtrUtils.cpp b/modules/tracking/src/gtrUtils.cpp
-index 0df1197..e80dda1 100644
---- a/modules/tracking/src/gtrUtils.cpp
-+++ b/modules/tracking/src/gtrUtils.cpp
-@@ -58,7 +58,7 @@ double generateRandomLaplacian(double b, double m)
-         return m - b*log(n);
- }
- 
--Rect2f anno2rect(vector<Point2f> annoBB)
-+Rect2f anno2rect(std::vector<Point2f> annoBB)
- {
-     Rect2f rectBB;
-     rectBB.x = min(annoBB[0].x, annoBB[1].x);
-@@ -69,9 +69,9 @@ Rect2f anno2rect(vector<Point2f> annoBB)
-     return rectBB;
- }
- 
--vector <TrainingSample> gatherFrameSamples(Mat prevFrame, Mat currFrame, Rect2f prevBB, Rect2f currBB)
-+std::vector <TrainingSample> gatherFrameSamples(Mat prevFrame, Mat currFrame, Rect2f prevBB, Rect2f currBB)
- {
--    vector <TrainingSample> trainingSamples;
-+    std::vector <TrainingSample> trainingSamples;
-     Point2f currCenter, prevCenter;
-     Rect2f targetPatchRect, searchPatchRect;
-     Mat targetPatch, searchPatch;
-diff --git a/modules/tracking/src/gtrUtils.hpp b/modules/tracking/src/gtrUtils.hpp
-index 8f388be..41aad21 100644
---- a/modules/tracking/src/gtrUtils.hpp
-+++ b/modules/tracking/src/gtrUtils.hpp
-@@ -4,7 +4,6 @@
- #include "precomp.hpp"
- #include <vector>
- #include "opencv2/highgui.hpp"
--#include <opencv2/datasets/track_alov.hpp>
- 
- namespace cv
- {
-@@ -50,10 +49,10 @@ struct TrainingSample
- double generateRandomLaplacian(double b, double m);
- 
- //Convert ALOV300++ anno coordinates to Rectangle BB
--Rect2f anno2rect(vector<Point2f> annoBB);
-+Rect2f anno2rect(std::vector<Point2f> annoBB);
- 
- //Gather samples from random video frame
--vector <TrainingSample> gatherFrameSamples(Mat prevFrame, Mat currFrame, Rect2f prevBB, Rect2f currBB);
-+std::vector <TrainingSample> gatherFrameSamples(Mat prevFrame, Mat currFrame, Rect2f prevBB, Rect2f currBB);
- 
- }
- }
-diff --git a/modules/tracking/src/tracker.cpp b/modules/tracking/src/tracker.cpp
-index 8127f2a..b96aca8 100644
---- a/modules/tracking/src/tracker.cpp
-+++ b/modules/tracking/src/tracker.cpp
-@@ -112,6 +112,7 @@ Ptr<Tracker> Tracker::create( const String& trackerType )
-   BOILERPLATE_CODE("TLD",TrackerTLD);
-   BOILERPLATE_CODE("KCF",TrackerKCF);
-   BOILERPLATE_CODE("GOTURN", TrackerGOTURN);
-+
-   return Ptr<Tracker>();
- }
- 
--- 
-2.9.4
-
diff --git a/meta-oe/recipes-support/opencv/opencv/0001-Make-opencv-ts-create-share-library-intead-of-static.patch b/meta-oe/recipes-support/opencv/opencv/0002-Make-opencv-ts-create-share-library-intead-of-static.patch
similarity index 64%
rename from meta-oe/recipes-support/opencv/opencv/0001-Make-opencv-ts-create-share-library-intead-of-static.patch
rename to meta-oe/recipes-support/opencv/opencv/0002-Make-opencv-ts-create-share-library-intead-of-static.patch
index 05ec41fd8..a845505a8 100644
--- a/meta-oe/recipes-support/opencv/opencv/0001-Make-opencv-ts-create-share-library-intead-of-static.patch
+++ b/meta-oe/recipes-support/opencv/opencv/0002-Make-opencv-ts-create-share-library-intead-of-static.patch
@@ -1,7 +1,7 @@
-From 49d1f7c40a5d097f23671318045ac54bc07846cf Mon Sep 17 00:00:00 2001
+From 350525293aef65490e80104ddd99e1b21c5d54b0 Mon Sep 17 00:00:00 2001
 From: Bian Naimeng <biannm@cn.fujitsu.com>
 Date: Wed, 19 Apr 2017 03:11:37 +0900
-Subject: [PATCH] Make opencv-ts create share library intead of static.
+Subject: [PATCH 2/3] Make opencv-ts create share library intead of static.
 
 Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
 ---
@@ -9,10 +9,10 @@ Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/modules/ts/CMakeLists.txt b/modules/ts/CMakeLists.txt
-index bb56da2..7bb4ce9 100644
+index f95bed079..ee67858df 100644
 --- a/modules/ts/CMakeLists.txt
 +++ b/modules/ts/CMakeLists.txt
-@@ -4,7 +4,7 @@ if(IOS)
+@@ -4,7 +4,7 @@ if(NOT BUILD_opencv_ts AND NOT BUILD_TESTS AND NOT BUILD_PERF_TESTS)
    ocv_module_disable(ts)
  endif()
  
@@ -20,7 +20,7 @@ index bb56da2..7bb4ce9 100644
 +#set(OPENCV_MODULE_TYPE STATIC)
  set(OPENCV_MODULE_IS_PART_OF_WORLD FALSE)
  
- ocv_warnings_disable(CMAKE_CXX_FLAGS -Wundef)
+ if(WINRT)
 -- 
-1.8.4.2
+2.13.4
 
diff --git a/meta-oe/recipes-support/opencv/opencv/0002-Revert-check-FP16-build-condition-correctly.patch b/meta-oe/recipes-support/opencv/opencv/0002-Revert-check-FP16-build-condition-correctly.patch
deleted file mode 100644
index d1950a936..000000000
--- a/meta-oe/recipes-support/opencv/opencv/0002-Revert-check-FP16-build-condition-correctly.patch
+++ /dev/null
@@ -1,245 +0,0 @@
-From 9108e39e5584ef9b41f80751639b4ec72b3e9538 Mon Sep 17 00:00:00 2001
-From: Randy MacLeod <Randy.MacLeod@windriver.com>
-Date: Wed, 26 Apr 2017 15:00:32 -0400
-Subject: [PATCH 2/2] Revert "check FP16 build condition correctly"
-
-This reverts commit c7cb116dc08441fe56cf82d5b21f929e5b674c13.
-
-Fix up revert conflicts to take previous behaviour.
----
- cmake/OpenCVCompilerOptions.cmake         | 45 +++++++++--------------
- modules/core/include/opencv2/core/cvdef.h |  2 +-
- modules/core/src/convert.cpp              | 11 +++---
- modules/core/test/test_intrin.cpp         | 60 ++++++++++++++-----------------
- 4 files changed, 48 insertions(+), 70 deletions(-)
-
-diff --git a/cmake/OpenCVCompilerOptions.cmake b/cmake/OpenCVCompilerOptions.cmake
-index 5bb0479..4b19fdb 100644
---- a/cmake/OpenCVCompilerOptions.cmake
-+++ b/cmake/OpenCVCompilerOptions.cmake
-@@ -185,7 +185,7 @@ if(CMAKE_COMPILER_IS_GNUCXX)
-     add_extra_compiler_option("-mfp16-format=ieee")
-   endif(ARM)
-   if(ENABLE_NEON)
--    add_extra_compiler_option("-mfpu=neon")
-+    add_extra_compiler_option("-mfpu=neon-fp16")
-   endif()
-   if(ENABLE_VFPV3 AND NOT ENABLE_NEON)
-     add_extra_compiler_option("-mfpu=vfpv3")
-@@ -370,34 +370,6 @@ if(CMAKE_COMPILER_IS_GNUCXX AND CMAKE_OPENCV_GCC_VERSION_NUM GREATER 399)
-   add_extra_compiler_option(-fvisibility-inlines-hidden)
- endif()
- 
--if(NOT OPENCV_FP16_DISABLE AND NOT IOS)
--  if(ARM AND ENABLE_NEON)
--    set(FP16_OPTION "-mfpu=neon-fp16")
--  elseif((X86 OR X86_64) AND NOT MSVC AND ENABLE_AVX)
--    set(FP16_OPTION "-mf16c")
--  endif()
--  try_compile(__VALID_FP16
--    "${OpenCV_BINARY_DIR}"
--    "${OpenCV_SOURCE_DIR}/cmake/checks/fp16.cpp"
--    COMPILE_DEFINITIONS "-DCHECK_FP16" "${FP16_OPTION}"
--    OUTPUT_VARIABLE TRY_OUT
--    )
--  if(NOT __VALID_FP16)
--    if((X86 OR X86_64) AND NOT MSVC AND NOT ENABLE_AVX)
--      # GCC enables AVX when mf16c is passed
--      message(STATUS "FP16: Feature disabled")
--    else()
--      message(STATUS "FP16: Compiler support is not available")
--    endif()
--  else()
--    message(STATUS "FP16: Compiler support is available")
--    set(HAVE_FP16 1)
--    if(NOT ${FP16_OPTION} STREQUAL "")
--      add_extra_compiler_option(${FP16_OPTION})
--    endif()
--  endif()
--endif()
--
- #combine all "extra" options
- set(CMAKE_C_FLAGS           "${CMAKE_C_FLAGS} ${OPENCV_EXTRA_FLAGS} ${OPENCV_EXTRA_C_FLAGS}")
- set(CMAKE_CXX_FLAGS         "${CMAKE_CXX_FLAGS} ${OPENCV_EXTRA_FLAGS} ${OPENCV_EXTRA_CXX_FLAGS}")
-@@ -450,6 +422,21 @@ if(MSVC)
-   endif()
- endif()
- 
-+if(NOT OPENCV_FP16_DISABLE)
-+  try_compile(__VALID_FP16
-+    "${OpenCV_BINARY_DIR}"
-+    "${OpenCV_SOURCE_DIR}/cmake/checks/fp16.cpp"
-+    COMPILE_DEFINITIONS "-DCHECK_FP16"
-+    OUTPUT_VARIABLE TRY_OUT
-+    )
-+  if(NOT __VALID_FP16)
-+    message(STATUS "FP16: Compiler support is not available")
-+  else()
-+    message(STATUS "FP16: Compiler support is available")
-+    set(HAVE_FP16 1)
-+  endif()
-+endif()
-+
- if(APPLE AND NOT CMAKE_CROSSCOMPILING AND NOT DEFINED ENV{LDFLAGS} AND EXISTS "/usr/local/lib")
-   link_directories("/usr/local/lib")
- endif()
-diff --git a/modules/core/include/opencv2/core/cvdef.h b/modules/core/include/opencv2/core/cvdef.h
-index efc24ca..a10936b 100644
---- a/modules/core/include/opencv2/core/cvdef.h
-+++ b/modules/core/include/opencv2/core/cvdef.h
-@@ -312,7 +312,7 @@ enum CpuFeatures {
- typedef union Cv16suf
- {
-     short i;
--#if CV_FP16_TYPE
-+#if ( defined (__arm__) || defined (__aarch64__) ) && !defined (__CUDACC__) && ( defined (__GNUC__) && ( ( ( 4 <= __GNUC__ ) && ( 7 <= __GNUC__ ) ) || ( 5 <= __GNUC__ ) ) )
-     __fp16 h;
- #endif
-     struct _fp16Format
-diff --git a/modules/core/src/convert.cpp b/modules/core/src/convert.cpp
-index e04d89e..46db26f 100644
---- a/modules/core/src/convert.cpp
-+++ b/modules/core/src/convert.cpp
-@@ -44,7 +44,6 @@
- #include "precomp.hpp"
- 
- #include "opencl_kernels_core.hpp"
--#include "opencv2/core/hal/intrin.hpp"
- 
- #include "opencv2/core/openvx/ovx_defs.hpp"
- 
-@@ -4382,7 +4381,7 @@ struct Cvt_SIMD<float, int>
- 
- #endif
- 
--#if !CV_FP16_TYPE
-+#if !( ( defined (__arm__) || defined (__aarch64__) ) && ( defined (__GNUC__) && ( ( ( 4 <= __GNUC__ ) && ( 7 <= __GNUC__ ) ) || ( 5 <= __GNUC__ ) ) ) )
- // const numbers for floating points format
- const unsigned int kShiftSignificand    = 13;
- const unsigned int kMaskFp16Significand = 0x3ff;
-@@ -4390,7 +4389,7 @@ const unsigned int kBiasFp16Exponent    = 15;
- const unsigned int kBiasFp32Exponent    = 127;
- #endif
- 
--#if CV_FP16_TYPE
-+#if ( defined (__arm__) || defined (__aarch64__) ) && ( defined (__GNUC__) && ( ( ( 4 <= __GNUC__ ) && ( 7 <= __GNUC__ ) ) || ( 5 <= __GNUC__ ) ) )
- static float convertFp16SW(short fp16)
- {
-     // Fp16 -> Fp32
-@@ -4452,7 +4451,7 @@ static float convertFp16SW(short fp16)
- }
- #endif
- 
--#if CV_FP16_TYPE
-+#if ( defined (__arm__) || defined (__aarch64__) ) && ( defined (__GNUC__) && ( ( ( 4 <= __GNUC__ ) && ( 7 <= __GNUC__ ) ) || ( 5 <= __GNUC__ ) ) )
- static short convertFp16SW(float fp32)
- {
-     // Fp32 -> Fp16
-@@ -4560,7 +4559,7 @@ cvtScaleHalf_<float, short>( const float* src, size_t sstep, short* dst, size_t
-             if ( ( (intptr_t)dst & 0xf ) == 0 )
- #endif
-             {
--#if CV_FP16 && CV_SIMD128
-+#if CV_FP16
-                 for ( ; x <= size.width - 4; x += 4)
-                 {
-                     v_float32x4 v_src = v_load(src + x);
-@@ -4606,7 +4605,7 @@ cvtScaleHalf_<short, float>( const short* src, size_t sstep, float* dst, size_t
-             if ( ( (intptr_t)src & 0xf ) == 0 )
- #endif
-             {
--#if CV_FP16 && CV_SIMD128
-+#if CV_FP16
-                 for ( ; x <= size.width - 4; x += 4)
-                 {
-                     v_float16x4 v_src = v_load_f16(src + x);
-diff --git a/modules/core/test/test_intrin.cpp b/modules/core/test/test_intrin.cpp
-index 66b2083..7349d48 100644
---- a/modules/core/test/test_intrin.cpp
-+++ b/modules/core/test/test_intrin.cpp
-@@ -729,56 +729,48 @@ template<typename R> struct TheTest
-         return *this;
-     }
- 
-+#if CV_FP16
-     TheTest & test_loadstore_fp16()
-     {
--#if CV_FP16
-         AlignedData<R> data;
-         AlignedData<R> out;
- 
--        if(checkHardwareSupport(CV_CPU_FP16))
--        {
--            // check if addresses are aligned and unaligned respectively
--            EXPECT_EQ((size_t)0, (size_t)&data.a.d % 16);
--            EXPECT_NE((size_t)0, (size_t)&data.u.d % 16);
--            EXPECT_EQ((size_t)0, (size_t)&out.a.d % 16);
--            EXPECT_NE((size_t)0, (size_t)&out.u.d % 16);
--
--            // check some initialization methods
--            R r1 = data.u;
--            R r2 = v_load_f16(data.a.d);
--            R r3(r2);
--            EXPECT_EQ(data.u[0], r1.get0());
--            EXPECT_EQ(data.a[0], r2.get0());
--            EXPECT_EQ(data.a[0], r3.get0());
--
--            // check some store methods
--            out.a.clear();
--            v_store_f16(out.a.d, r1);
--            EXPECT_EQ(data.a, out.a);
--        }
-+        // check if addresses are aligned and unaligned respectively
-+        EXPECT_EQ((size_t)0, (size_t)&data.a.d % 16);
-+        EXPECT_NE((size_t)0, (size_t)&data.u.d % 16);
-+        EXPECT_EQ((size_t)0, (size_t)&out.a.d % 16);
-+        EXPECT_NE((size_t)0, (size_t)&out.u.d % 16);
-+
-+        // check some initialization methods
-+        R r1 = data.u;
-+        R r2 = v_load_f16(data.a.d);
-+        R r3(r2);
-+        EXPECT_EQ(data.u[0], r1.get0());
-+        EXPECT_EQ(data.a[0], r2.get0());
-+        EXPECT_EQ(data.a[0], r3.get0());
-+
-+        // check some store methods
-+        out.a.clear();
-+        v_store_f16(out.a.d, r1);
-+        EXPECT_EQ(data.a, out.a);
- 
-         return *this;
--#endif
-     }
- 
-     TheTest & test_float_cvt_fp16()
-     {
--#if CV_FP16
-         AlignedData<v_float32x4> data;
- 
--        if(checkHardwareSupport(CV_CPU_FP16))
--        {
--            // check conversion
--            v_float32x4 r1 = v_load(data.a.d);
--            v_float16x4 r2 = v_cvt_f16(r1);
--            v_float32x4 r3 = v_cvt_f32(r2);
--            EXPECT_EQ(0x3c00, r2.get0());
--            EXPECT_EQ(r3.get0(), r1.get0());
--        }
-+        // check conversion
-+        v_float32x4 r1 = v_load(data.a.d);
-+        v_float16x4 r2 = v_cvt_f16(r1);
-+        v_float32x4 r3 = v_cvt_f32(r2);
-+        EXPECT_EQ(0x3c00, r2.get0());
-+        EXPECT_EQ(r3.get0(), r1.get0());
- 
-         return *this;
--#endif
-     }
-+#endif
- 
- };
- 
--- 
-2.9.3
-
diff --git a/meta-oe/recipes-support/opencv/opencv/0001-To-fix-errors-as-following.patch b/meta-oe/recipes-support/opencv/opencv/0003-To-fix-errors-as-following.patch
similarity index 82%
rename from meta-oe/recipes-support/opencv/opencv/0001-To-fix-errors-as-following.patch
rename to meta-oe/recipes-support/opencv/opencv/0003-To-fix-errors-as-following.patch
index 9c1b9b3ae..a22b04a90 100644
--- a/meta-oe/recipes-support/opencv/opencv/0001-To-fix-errors-as-following.patch
+++ b/meta-oe/recipes-support/opencv/opencv/0003-To-fix-errors-as-following.patch
@@ -1,7 +1,7 @@
-From a4abe478bf4514ec95aa10b2d6f258647ce325f5 Mon Sep 17 00:00:00 2001
+From ace48a628dca34d742615598afeef42ed323a029 Mon Sep 17 00:00:00 2001
 From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
 Date: Fri, 19 May 2017 04:27:50 +0900
-Subject: [PATCH] To fix errors as following:
+Subject: [PATCH 3/3] To fix errors as following:
 
 "test_main.cpp:45: undefined reference to `parseCustomOptions(int, char**)'"
 "perf_abs.cpp:13: undefined reference to `cvtest::param_seed'"
@@ -20,10 +20,10 @@ Signed-off-by: Ismo Puustinen <ismo.puustinen@intel.com>
  3 files changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/modules/ts/include/opencv2/ts.hpp b/modules/ts/include/opencv2/ts.hpp
-index c573905..230f598 100644
+index 41a76b13e..205646140 100644
 --- a/modules/ts/include/opencv2/ts.hpp
 +++ b/modules/ts/include/opencv2/ts.hpp
-@@ -539,7 +539,7 @@ protected:
+@@ -555,7 +555,7 @@ protected:
      }
  };
  
@@ -32,7 +32,7 @@ index c573905..230f598 100644
  
  struct CV_EXPORTS DefaultRngAuto
  {
-@@ -595,14 +595,14 @@ CV_EXPORTS std::string findDataFile(const std::string& relative_path, bool requi
+@@ -611,14 +611,14 @@ CV_EXPORTS std::string findDataFile(const std::string& relative_path, bool requi
  
  #ifdef HAVE_OPENCL
  namespace ocl {
@@ -47,13 +47,13 @@ index c573905..230f598 100644
 -void parseCustomOptions(int argc, char **argv);
 +CV_EXPORTS void parseCustomOptions(int argc, char **argv);
  
- #define CV_TEST_MAIN(resourcesubdir, ...) \
- int main(int argc, char **argv) \
+ #define CV_TEST_INIT0_NOOP (void)0
+ 
 diff --git a/modules/ts/include/opencv2/ts/ocl_test.hpp b/modules/ts/include/opencv2/ts/ocl_test.hpp
-index c967cd7..ff35b40 100644
+index 54b33ece8..ef56bf9ef 100644
 --- a/modules/ts/include/opencv2/ts/ocl_test.hpp
 +++ b/modules/ts/include/opencv2/ts/ocl_test.hpp
-@@ -84,7 +84,7 @@ inline UMat ToUMat(InputArray src)
+@@ -82,7 +82,7 @@ inline UMat ToUMat(InputArray src)
      return dst;
  }
  
@@ -63,7 +63,7 @@ index c967cd7..ff35b40 100644
  #define MAX_VALUE 357
  
 diff --git a/modules/ts/include/opencv2/ts/ts_ext.hpp b/modules/ts/include/opencv2/ts/ts_ext.hpp
-index 05ccc63..8075065 100644
+index 0bdd346dd..2cd34dfce 100644
 --- a/modules/ts/include/opencv2/ts/ts_ext.hpp
 +++ b/modules/ts/include/opencv2/ts/ts_ext.hpp
 @@ -9,7 +9,7 @@
@@ -76,5 +76,5 @@ index 05ccc63..8075065 100644
  
  #define CV_TEST_INIT \
 -- 
-2.9.4
+2.13.4
 
diff --git a/meta-oe/recipes-support/opencv/opencv/uselocalxfeatures.patch b/meta-oe/recipes-support/opencv/opencv/uselocalxfeatures.patch
index a2db48d7c..fc273a891 100644
--- a/meta-oe/recipes-support/opencv/opencv/uselocalxfeatures.patch
+++ b/meta-oe/recipes-support/opencv/opencv/uselocalxfeatures.patch
@@ -1,12 +1,20 @@
 diff --git a/modules/xfeatures2d/CMakeLists.txt b/modules/xfeatures2d/CMakeLists.txt
-index f295bddaed66..6086e75ec37b 100644
+index e1755595..c7009c47 100644
 --- a/modules/xfeatures2d/CMakeLists.txt
 +++ b/modules/xfeatures2d/CMakeLists.txt
-@@ -1,5 +1,5 @@
- set(the_description "Contributed/Experimental Algorithms for Salient 2D Features Detection")
- ocv_define_module(xfeatures2d opencv_core opencv_imgproc opencv_features2d opencv_calib3d opencv_shape opencv_highgui opencv_videoio opencv_ml
-                   OPTIONAL opencv_cudaarithm WRAP python java)
--include(cmake/download_vgg.cmake)
--include(cmake/download_boostdesc.cmake)
-+#include(cmake/download_vgg.cmake)
-+#include(cmake/download_boostdesc.cmake)
+@@ -5,10 +5,10 @@ ocv_define_module(xfeatures2d opencv_core opencv_imgproc opencv_features2d openc
+ include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/download_vgg.cmake)
+ include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/download_boostdesc.cmake)
+ set(DOWNLOAD_DIR "${OpenCV_BINARY_DIR}/downloads/xfeatures2d")
+-download_boost_descriptors("${DOWNLOAD_DIR}" boost_status)
+-download_vgg_descriptors("${DOWNLOAD_DIR}" vgg_status)
+-if(NOT boost_status OR NOT vgg_status)
+-  ocv_module_disable(xfeatures2d)
+-endif()
++#download_boost_descriptors("${DOWNLOAD_DIR}" boost_status)
++#download_vgg_descriptors("${DOWNLOAD_DIR}" vgg_status)
++#if(NOT boost_status OR NOT vgg_status)
++#  ocv_module_disable(xfeatures2d)
++#endif()
+ 
+ ocv_module_include_directories("${DOWNLOAD_DIR}")
diff --git a/meta-oe/recipes-support/opencv/opencv/useoeprotobuf.patch b/meta-oe/recipes-support/opencv/opencv/useoeprotobuf.patch
deleted file mode 100644
index 3068bd44d..000000000
--- a/meta-oe/recipes-support/opencv/opencv/useoeprotobuf.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-diff --git a/modules/dnn/cmake/OpenCVFindLibProtobuf.cmake b/modules/dnn/cmake/OpenCVFindLibProtobuf.cmake
-index eb2a729cc2eb..8717736484de 100644
---- a/modules/dnn/cmake/OpenCVFindLibProtobuf.cmake
-+++ b/modules/dnn/cmake/OpenCVFindLibProtobuf.cmake
-@@ -24,7 +24,7 @@ if(NOT BUILD_PROTOBUF AND NOT (DEFINED PROTOBUF_INCLUDE_DIR AND DEFINED PROTOBUF
-   find_package(Protobuf QUIET)
- endif()
- 
--if(PROTOBUF_FOUND)
-+if(PROTOBUF_FOUND OR (DEFINED PROTOBUF_INCLUDE_DIR AND DEFINED PROTOBUF_LIBRARIES))
-   # nothing
- else()
-   include(${CMAKE_CURRENT_LIST_DIR}/download_protobuf.cmake)
diff --git a/meta-oe/recipes-support/opencv/opencv_3.2.bb b/meta-oe/recipes-support/opencv/opencv_3.3.bb
similarity index 86%
rename from meta-oe/recipes-support/opencv/opencv_3.2.bb
rename to meta-oe/recipes-support/opencv/opencv_3.3.bb
index fc62e9975..a6a130271 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.2.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.3.bb
@@ -10,38 +10,52 @@ ARM_INSTRUCTION_SET_armv5 = "arm"
 
 DEPENDS = "libtool swig-native bzip2 zlib glib-2.0 libwebp"
 
-SRCREV_opencv = "70bbf17b133496bd7d54d034b0f94bd869e0e810"
-SRCREV_contrib = "86342522b0eb2b16fa851c020cc4e0fef4e010b7"
-SRCREV_ipp = "81a676001ca8075ada498583e4166079e5744668"
-SRCREV_bootdesc = "34e4206aef44d50e6bbcd0ab06354b52e7466d26"
+SRCREV_opencv = "87c27a074db9f6d9d60513f351daa903606ca370"
+SRCREV_contrib = "2a9d1b22ed76eb22fad1a5edf6faf4d05f207b13"
+SRCREV_ipp = "a62e20676a60ee0ad6581e217fe7e4bada3b95db"
+SRCREV_boostdesc = "34e4206aef44d50e6bbcd0ab06354b52e7466d26"
 SRCREV_vgg = "fccf7cd6a4b12079f73bbfb21745f9babcd4eb1d"
-IPP_MD5 = "808b791a6eac9ed78d32a7666804320e"
 
-SRCREV_FORMAT = "opencv"
+def ipp_filename(d):
+    import re
+    arch = d.getVar('TARGET_ARCH', True)
+    if re.match("i.86$", arch):
+        return "ippicv_2017u2_lnx_ia32_20170418.tgz"
+    else:
+        return "ippicv_2017u2_lnx_intel64_20170418.tgz"
+
+def ipp_md5sum(d):
+    import re
+    arch = d.getVar('TARGET_ARCH', True)
+    if re.match("i.86$", arch):
+        return "f2cece00d802d4dea86df52ed095257e"
+    else:
+        return "808b791a6eac9ed78d32a7666804320e"
+
+IPP_FILENAME = "${@ipp_filename(d)}"
+IPP_MD5 = "${@ipp_md5sum(d)}"
+
+SRCREV_FORMAT = "opencv_contrib_ipp_boostdesc_vgg"
 SRC_URI = "git://github.com/opencv/opencv.git;name=opencv \
     git://github.com/opencv/opencv_contrib.git;destsuffix=contrib;name=contrib \
-    git://github.com/opencv/opencv_3rdparty.git;branch=ippicv/master_20151201;destsuffix=ipp;name=ipp \
-    git://github.com/opencv/opencv_3rdparty.git;branch=contrib_xfeatures2d_boostdesc_20161012;destsuffix=bootdesc;name=bootdesc \
+    git://github.com/opencv/opencv_3rdparty.git;branch=ippicv/master_20170418;destsuffix=ipp;name=ipp \
+    git://github.com/opencv/opencv_3rdparty.git;branch=contrib_xfeatures2d_boostdesc_20161012;destsuffix=boostdesc;name=boostdesc \
     git://github.com/opencv/opencv_3rdparty.git;branch=contrib_xfeatures2d_vgg_20160317;destsuffix=vgg;name=vgg \
     file://0001-3rdparty-ippicv-Use-pre-downloaded-ipp.patch \
     file://fixpkgconfig.patch \
     file://uselocalxfeatures.patch;patchdir=../contrib/ \
-    file://useoeprotobuf.patch;patchdir=../contrib/ \
-    file://0001-Revert-cuda-fix-fp16-compilation.patch \
-    file://0002-Revert-check-FP16-build-condition-correctly.patch \
-    file://0001-Make-opencv-ts-create-share-library-intead-of-static.patch \
-    file://0001-To-fix-errors-as-following.patch \
-    file://0001-tracking-make-opencv_dnn-dependancy-optional.patch;patchdir=../contrib/ \
+    file://0002-Make-opencv-ts-create-share-library-intead-of-static.patch \
+    file://0003-To-fix-errors-as-following.patch \
 "
 
-PV = "3.2+git${SRCPV}"
+PV = "3.3+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
 do_unpack_extra() {
-    tar xzf ${WORKDIR}/ipp/ippicv/ippicv_linux_20151201.tgz -C ${WORKDIR}
+    tar xzf ${WORKDIR}/ipp/ippicv/${IPP_FILENAME} -C ${WORKDIR}
     cp ${WORKDIR}/vgg/*.i ${WORKDIR}/contrib/modules/xfeatures2d/src
-    cp ${WORKDIR}/bootdesc/*.i ${WORKDIR}/contrib/modules/xfeatures2d/src
+    cp ${WORKDIR}/boostdesc/*.i ${WORKDIR}/contrib/modules/xfeatures2d/src
 }
 addtask unpack_extra after do_unpack before do_patch
 
@@ -64,7 +78,7 @@ PACKAGECONFIG ??= "python3 eigen jpeg png tiff v4l libv4l gstreamer samples tbb
 
 PACKAGECONFIG[amdblas] = "-DWITH_OPENCLAMDBLAS=ON,-DWITH_OPENCLAMDBLAS=OFF,libclamdblas,"
 PACKAGECONFIG[amdfft] = "-DWITH_OPENCLAMDFFT=ON,-DWITH_OPENCLAMDFFT=OFF,libclamdfft,"
-PACKAGECONFIG[dnn] = "-DBUILD_opencv_dnn=ON -DUPDATE_PROTO_FILES=ON -DBUILD_PROTOBUF=OFF,-DBUILD_opencv_dnn=OFF,protobuf protobuf-native,"
+PACKAGECONFIG[dnn] = "-DBUILD_opencv_dnn=ON -DPROTOBUF_UPDATE_FILES=ON -DBUILD_PROTOBUF=OFF,-DBUILD_opencv_dnn=OFF,protobuf protobuf-native,"
 PACKAGECONFIG[eigen] = "-DWITH_EIGEN=ON,-DWITH_EIGEN=OFF,libeigen gflags glog,"
 PACKAGECONFIG[freetype] = "-DBUILD_opencv_freetype=ON,-DBUILD_opencv_freetype=OFF,freetype,"
 PACKAGECONFIG[gphoto2] = "-DWITH_GPHOTO2=ON,-DWITH_GPHOTO2=OFF,libgphoto2,"
@@ -132,7 +146,6 @@ python populate_packages_prepend () {
         if not pkg in blacklist and not pkg in metapkg_rdepends and not pkg.endswith('-dev') and not pkg.endswith('-dbg') and not pkg.endswith('-doc') and not pkg.endswith('-locale') and not pkg.endswith('-staticdev'):
             metapkg_rdepends.append(pkg)
     d.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends))
-
 }
 
 PACKAGES_DYNAMIC += "^libopencv-.*"
-- 
2.13.4


