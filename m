Return-Path: <ismo.puustinen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 2C1B871999
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 May 2017 13:30:45 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 May 2017 06:30:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,386,1491289200"; d="scan'208";a="265850614"
Received: from ipuustin-desk.fi.intel.com ([10.237.72.72])
	by fmsmga004.fm.intel.com with ESMTP; 24 May 2017 06:30:45 -0700
From: Ismo Puustinen <ismo.puustinen@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 May 2017 16:30:39 +0300
Message-Id: <20170524133039.13273-1-ismo.puustinen@intel.com>
X-Mailer: git-send-email 2.9.4
Subject: [PATCH] opencv: fix building with PACKAGECONFIG "dnn" enabled.
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
X-List-Received-Date: Wed, 24 May 2017 13:30:46 -0000

Dependency "lapack" isn't available in meta-openembedded and it doesn't
cause a build error, so drop it. Fix buidling dnn module by backporting
a patch from opencv-contrib.

Signed-off-by: Ismo Puustinen <ismo.puustinen@intel.com>
---
 ...cking-make-opencv_dnn-dependancy-optional.patch | 243 +++++++++++++++++++++
 meta-oe/recipes-support/opencv/opencv_3.2.bb       |   3 +-
 2 files changed, 245 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/opencv/opencv/0001-tracking-make-opencv_dnn-dependancy-optional.patch

diff --git a/meta-oe/recipes-support/opencv/opencv/0001-tracking-make-opencv_dnn-dependancy-optional.patch b/meta-oe/recipes-support/opencv/opencv/0001-tracking-make-opencv_dnn-dependancy-optional.patch
new file mode 100644
index 0000000..fba43eb
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv/0001-tracking-make-opencv_dnn-dependancy-optional.patch
@@ -0,0 +1,243 @@
+From 69f86025978b9bbbefa54a7248316a859773aeaf Mon Sep 17 00:00:00 2001
+From: berak <px1704@web.de>
+Date: Sat, 4 Mar 2017 12:38:50 +0100
+Subject: [PATCH] tracking: make opencv_dnn dependancy optional
+
+Upstream-status: Backport [https://github.com/opencv/opencv_contrib/commit/43925b60d392fbd01d6b0449713f010f9babe448]
+Signed-off-by: Ismo Puustinen <ismo.puustinen@intel.com>
+
+---
+ modules/tracking/CMakeLists.txt                   |  3 +--
+ modules/tracking/samples/goturnTracker.cpp        | 22 +++++++++++++++++++---
+ modules/tracking/samples/multiTracker_dataset.cpp |  1 +
+ modules/tracking/samples/tracker_dataset.cpp      |  1 +
+ modules/tracking/src/gtrTracker.cpp               | 11 ++++++++++-
+ modules/tracking/src/gtrTracker.hpp               | 12 ++++++++----
+ modules/tracking/src/gtrUtils.cpp                 |  6 +++---
+ modules/tracking/src/gtrUtils.hpp                 |  5 ++---
+ modules/tracking/src/tracker.cpp                  |  1 +
+ 9 files changed, 46 insertions(+), 16 deletions(-)
+
+diff --git a/modules/tracking/CMakeLists.txt b/modules/tracking/CMakeLists.txt
+index a8b3183..d27f999 100644
+--- a/modules/tracking/CMakeLists.txt
++++ b/modules/tracking/CMakeLists.txt
+@@ -1,2 +1 @@
+-set(the_description "Tracking API")
+-ocv_define_module(tracking opencv_imgproc opencv_core opencv_video opencv_highgui opencv_dnn opencv_plot OPTIONAL opencv_datasets WRAP python)
+\ No newline at end of file
++ocv_define_module(tracking opencv_imgproc opencv_core opencv_video opencv_highgui opencv_plot OPTIONAL opencv_dnn opencv_datasets WRAP python)
+diff --git a/modules/tracking/samples/goturnTracker.cpp b/modules/tracking/samples/goturnTracker.cpp
+index 389771e..1e6632d 100644
+--- a/modules/tracking/samples/goturnTracker.cpp
++++ b/modules/tracking/samples/goturnTracker.cpp
+@@ -45,6 +45,9 @@
+ //1 - Train you own GOTURN model using <https://github.com/Auron-X/GOTURN_Training_Toolkit>
+ //2 - Download pretrained caffemodel from <https://github.com/opencv/opencv_extra>
+ 
++#include "opencv2/opencv_modules.hpp"
++#if defined(HAVE_OPENCV_DNN) && defined(HAVE_OPENCV_DATASETS)
++
+ #include "opencv2/datasets/track_alov.hpp"
+ #include <opencv2/core/utility.hpp>
+ #include <opencv2/tracking.hpp>
+@@ -65,8 +68,8 @@ static bool startSelection = false;
+ Rect2d boundingBox;
+ 
+ static const char* keys =
+-{ "{@dataset_path     |true| Dataset path     }"
+-"{@dataset_id     |1| Dataset ID     }"
++{ "{@dataset_path     || Dataset path   }"
++  "{@dataset_id      |1| Dataset ID     }"
+ };
+ 
+ static void onMouse(int event, int x, int y, int, void*)
+@@ -144,9 +147,14 @@ int main(int argc, char *argv[])
+     Ptr<cv::datasets::TRACK_alov> dataset = TRACK_alov::create();
+     dataset->load(datasetRootPath);
+     dataset->initDataset(datasetID);
+-
+     //Read first frame
+     dataset->getNextFrame(frame);
++    if (frame.empty())
++    {
++        cout << "invalid dataset: " << datasetRootPath << endl;
++        return -2;
++    }
++
+     frame.copyTo(image);
+     rectangle(image, boundingBox, Scalar(255, 0, 0), 2, 1);
+     imshow("GOTURN Tracking", image);
+@@ -215,3 +223,11 @@ int main(int argc, char *argv[])
+ 
+     return 0;
+ }
++
++#else // ! HAVE_OPENCV_DNN && HAVE_OPENCV_DATASETS
++#include <opencv2/core.hpp>
++int main() {
++    CV_Error(cv::Error::StsNotImplemented , "this sample needs to be built with opencv_datasets and opencv_dnn !");
++    return -1;
++}
++#endif
+diff --git a/modules/tracking/samples/multiTracker_dataset.cpp b/modules/tracking/samples/multiTracker_dataset.cpp
+index 2826b19..b5c27da 100644
+--- a/modules/tracking/samples/multiTracker_dataset.cpp
++++ b/modules/tracking/samples/multiTracker_dataset.cpp
+@@ -234,6 +234,7 @@ int main(int argc, char *argv[])
+ }
+ 
+ #else // ! HAVE_OPENCV_DATASETS
++#include <opencv2/core.hpp>
+ int main() {
+ 	CV_Error(cv::Error::StsNotImplemented , "this sample needs to be built with opencv_datasets !");
+ 	return -1;
+diff --git a/modules/tracking/samples/tracker_dataset.cpp b/modules/tracking/samples/tracker_dataset.cpp
+index 8b7832a..6178105 100644
+--- a/modules/tracking/samples/tracker_dataset.cpp
++++ b/modules/tracking/samples/tracker_dataset.cpp
+@@ -234,6 +234,7 @@ int main(int argc, char *argv[])
+ 
+ 
+ #else // ! HAVE_OPENCV_DATASETS
++#include <opencv2/core.hpp>
+ int main() {
+ 	CV_Error(cv::Error::StsNotImplemented , "this sample needs to be built with opencv_datasets !");
+ 	return -1;
+diff --git a/modules/tracking/src/gtrTracker.cpp b/modules/tracking/src/gtrTracker.cpp
+index 58debfd..4904f47 100644
+--- a/modules/tracking/src/gtrTracker.cpp
++++ b/modules/tracking/src/gtrTracker.cpp
+@@ -38,7 +38,7 @@
+ // the use of this software, even if advised of the possibility of such damage.
+ //
+ //M*/
+-
++#include "opencv2/opencv_modules.hpp"
+ #include "gtrTracker.hpp"
+ 
+ 
+@@ -54,9 +54,16 @@ void TrackerGOTURN::Params::write(cv::FileStorage& /*fs*/) const {}
+ 
+ Ptr<TrackerGOTURN> TrackerGOTURN::createTracker(const TrackerGOTURN::Params &parameters)
+ {
++#ifdef HAVE_OPENCV_DNN
+     return Ptr<gtr::TrackerGOTURNImpl>(new gtr::TrackerGOTURNImpl(parameters));
++#else
++    (void)(parameters);
++    CV_ErrorNoReturn(cv::Error::StsNotImplemented , "to use GOTURN, the tracking module needs to be built with opencv_dnn !");
++#endif
+ }
+ 
++
++#ifdef HAVE_OPENCV_DNN
+ namespace gtr
+ {
+ 
+@@ -183,9 +190,11 @@ bool TrackerGOTURNImpl::updateImpl(const Mat& image, Rect2d& boundingBox)
+     //Set new model image and BB from current frame
+     ((TrackerGOTURNModel*)static_cast<TrackerModel*>(model))->setImage(curFrame);
+     ((TrackerGOTURNModel*)static_cast<TrackerModel*>(model))->setBoudingBox(curBB);
++
+     return true;
+ }
+ 
+ }
++#endif // OPENCV_HAVE_DNN
+ 
+ }
+diff --git a/modules/tracking/src/gtrTracker.hpp b/modules/tracking/src/gtrTracker.hpp
+index 34f2c48..21ae3d9 100644
+--- a/modules/tracking/src/gtrTracker.hpp
++++ b/modules/tracking/src/gtrTracker.hpp
+@@ -45,11 +45,15 @@
+ 
+ #include "precomp.hpp"
+ #include "opencv2/video/tracking.hpp"
+-#include "opencv2/dnn.hpp"
+ #include "gtrUtils.hpp"
+ #include "opencv2/imgproc.hpp"
+-#include<algorithm>
+-#include<limits.h>
++
++#include <algorithm>
++#include <limits.h>
++
++#include "opencv2/opencv_modules.hpp"
++#ifdef HAVE_OPENCV_DNN
++#include "opencv2/dnn.hpp"
+ 
+ namespace cv
+ {
+@@ -72,5 +76,5 @@ public:
+ 
+ }
+ }
+-
++#endif
+ #endif
+diff --git a/modules/tracking/src/gtrUtils.cpp b/modules/tracking/src/gtrUtils.cpp
+index 0df1197..e80dda1 100644
+--- a/modules/tracking/src/gtrUtils.cpp
++++ b/modules/tracking/src/gtrUtils.cpp
+@@ -58,7 +58,7 @@ double generateRandomLaplacian(double b, double m)
+         return m - b*log(n);
+ }
+ 
+-Rect2f anno2rect(vector<Point2f> annoBB)
++Rect2f anno2rect(std::vector<Point2f> annoBB)
+ {
+     Rect2f rectBB;
+     rectBB.x = min(annoBB[0].x, annoBB[1].x);
+@@ -69,9 +69,9 @@ Rect2f anno2rect(vector<Point2f> annoBB)
+     return rectBB;
+ }
+ 
+-vector <TrainingSample> gatherFrameSamples(Mat prevFrame, Mat currFrame, Rect2f prevBB, Rect2f currBB)
++std::vector <TrainingSample> gatherFrameSamples(Mat prevFrame, Mat currFrame, Rect2f prevBB, Rect2f currBB)
+ {
+-    vector <TrainingSample> trainingSamples;
++    std::vector <TrainingSample> trainingSamples;
+     Point2f currCenter, prevCenter;
+     Rect2f targetPatchRect, searchPatchRect;
+     Mat targetPatch, searchPatch;
+diff --git a/modules/tracking/src/gtrUtils.hpp b/modules/tracking/src/gtrUtils.hpp
+index 8f388be..41aad21 100644
+--- a/modules/tracking/src/gtrUtils.hpp
++++ b/modules/tracking/src/gtrUtils.hpp
+@@ -4,7 +4,6 @@
+ #include "precomp.hpp"
+ #include <vector>
+ #include "opencv2/highgui.hpp"
+-#include <opencv2/datasets/track_alov.hpp>
+ 
+ namespace cv
+ {
+@@ -50,10 +49,10 @@ struct TrainingSample
+ double generateRandomLaplacian(double b, double m);
+ 
+ //Convert ALOV300++ anno coordinates to Rectangle BB
+-Rect2f anno2rect(vector<Point2f> annoBB);
++Rect2f anno2rect(std::vector<Point2f> annoBB);
+ 
+ //Gather samples from random video frame
+-vector <TrainingSample> gatherFrameSamples(Mat prevFrame, Mat currFrame, Rect2f prevBB, Rect2f currBB);
++std::vector <TrainingSample> gatherFrameSamples(Mat prevFrame, Mat currFrame, Rect2f prevBB, Rect2f currBB);
+ 
+ }
+ }
+diff --git a/modules/tracking/src/tracker.cpp b/modules/tracking/src/tracker.cpp
+index 8127f2a..b96aca8 100644
+--- a/modules/tracking/src/tracker.cpp
++++ b/modules/tracking/src/tracker.cpp
+@@ -112,6 +112,7 @@ Ptr<Tracker> Tracker::create( const String& trackerType )
+   BOILERPLATE_CODE("TLD",TrackerTLD);
+   BOILERPLATE_CODE("KCF",TrackerKCF);
+   BOILERPLATE_CODE("GOTURN", TrackerGOTURN);
++
+   return Ptr<Tracker>();
+ }
+ 
+-- 
+2.9.4
+
diff --git a/meta-oe/recipes-support/opencv/opencv_3.2.bb b/meta-oe/recipes-support/opencv/opencv_3.2.bb
index 98b6b06..c241cf4 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.2.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.2.bb
@@ -29,6 +29,7 @@ SRC_URI = "git://github.com/opencv/opencv.git;name=opencv \
     file://useoeprotobuf.patch;patchdir=../contrib/ \
     file://0001-Revert-cuda-fix-fp16-compilation.patch \
     file://0002-Revert-check-FP16-build-condition-correctly.patch \
+    file://0001-tracking-make-opencv_dnn-dependancy-optional.patch;patchdir=../contrib/ \
 "
 
 PV = "3.2+git${SRCPV}"
@@ -61,7 +62,7 @@ PACKAGECONFIG ??= "python3 eigen jpeg png tiff v4l libv4l gstreamer samples tbb
 
 PACKAGECONFIG[amdblas] = "-DWITH_OPENCLAMDBLAS=ON,-DWITH_OPENCLAMDBLAS=OFF,libclamdblas,"
 PACKAGECONFIG[amdfft] = "-DWITH_OPENCLAMDFFT=ON,-DWITH_OPENCLAMDFFT=OFF,libclamdfft,"
-PACKAGECONFIG[dnn] = "-DBUILD_opencv_dnn=ON -DUPDATE_PROTO_FILES=ON -DBUILD_PROTOBUF=OFF,-DBUILD_opencv_dnn=OFF,lapack protobuf protobuf-native,"
+PACKAGECONFIG[dnn] = "-DBUILD_opencv_dnn=ON -DUPDATE_PROTO_FILES=ON -DBUILD_PROTOBUF=OFF,-DBUILD_opencv_dnn=OFF,protobuf protobuf-native,"
 PACKAGECONFIG[eigen] = "-DWITH_EIGEN=ON,-DWITH_EIGEN=OFF,libeigen gflags glog,"
 PACKAGECONFIG[freetype] = "-DBUILD_opencv_freetype=ON,-DBUILD_opencv_freetype=OFF,freetype,"
 PACKAGECONFIG[gphoto2] = "-DWITH_GPHOTO2=ON,-DWITH_GPHOTO2=OFF,libgphoto2,"
-- 
2.9.4


