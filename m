Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3CF25782FE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Nov 2017 19:20:00 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id y42so15541410wrd.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Nov 2017 11:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=VTfE+3XKhPluLND5mMR6Qb1BgDFaeMYy2DFYYBfIyCM=;
	b=c6Hpiyo5dKDSx+bUubjKAXDkqOjgzIBnicgSE51Ct3/UDkOOuw7Ktcx4W+OhuyuQKR
	l2dfxvRcccmb5dCPXJn2opsNWITyyoHwjaFUZTVhYtLe/qTWCeiCEQff0LmvBIX9Tbxo
	CvaRQigZJv1QjcoYP4mh42i7GFTxADgjdgX39JR+qYgwUgfFmZwXIObH/SOnYbjiV/3I
	Ag1MBpkjiN/FnGZU0PF7alIAbUbek9CGs2w+haje2imI1KA2MRORB+91O7HQSGGiXyFj
	4x8Lcc+PElVpH1FnnJY/thj5JQjc+zaSOlyNE4Vo7h3Dj1U2O5F3w5jEUOUVOQ6wP9xT
	nfSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=VTfE+3XKhPluLND5mMR6Qb1BgDFaeMYy2DFYYBfIyCM=;
	b=j6AYFTRcmB9PuRk9KXwd5WKW1w26812AovzHz0akdtfbURLIDyOweSmU49o/IQNIZW
	agh5jxzUwOgRpGV07T4/qVXH1z3zEAn16Rhg07mQtIanE75fjIW97v3NwdjOa/yv3po2
	4v/8aRryKYp4eo7IoOaX2xflsN2ZGgnf8CM0S+SuD+T9J1yi564+w7jYjQyyYmsRN//H
	LOldcesp1n30xUS355vtftJFVBftwFchl2cphJla3325w4G/AeFFrJJcLHUtfPrraBPY
	CzFrN0eEZtKGtyegjanAsZ36Fu8OBasN/fajgpIwAretxQ1TVehEg8EC9rzlB3h7+VYJ
	JuAA==
X-Gm-Message-State: AJaThX5rv2LwY+hN69DonOcbjZLj2pBjuZO+QBW0omSkV/e2OuLN6Cob
	te7wHe6+zlktXHWRKgj1XQ1cYo9p
X-Google-Smtp-Source: AGs4zMbWMg9zmqjn7U9AXwLYxXJS2NRAvQ2RQf3fqegofUzG8+owWmNsSjiItuMoPlwxJnhHEgrJrQ==
X-Received: by 10.223.178.87 with SMTP id y23mr6110665wra.3.1511378401302;
	Wed, 22 Nov 2017 11:20:01 -0800 (PST)
Received: from localhost.localdomain (80-71-134-83.u.parknet.dk.
	[80.71.134.83]) by smtp.gmail.com with ESMTPSA id
	n14sm1695032wmh.37.2017.11.22.11.19.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Nov 2017 11:20:00 -0800 (PST)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Nov 2017 20:19:56 +0100
Message-Id: <20171122191956.4113-1-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.15.0
Subject: [meta-oe][PATCH] opencv: Fix error when dynamic link
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
X-List-Received-Date: Wed, 22 Nov 2017 19:20:01 -0000

If opencv was imported in python or dynamic linked in gstreamer it was
producing this output and dying:

 [libprotobuf ERROR google/protobuf/descriptor_database.cc:58] File already
 exists in database: caffe.proto
 [libprotobuf FATAL google/protobuf/descriptor.cc:1315] CHECK failed:
 generated_database_->Add(encoded_file_descriptor, size):
 terminate called after throwing an instance of
 'google::protobuf::FatalException'

This patch backports a patch that fixes this issue.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 .../recipes-support/opencv/already-exists.patch    | 394 +++++++++++++++++++++
 meta-oe/recipes-support/opencv/opencv_3.3.bb       |   1 +
 2 files changed, 395 insertions(+)
 create mode 100644 meta-oe/recipes-support/opencv/already-exists.patch

diff --git a/meta-oe/recipes-support/opencv/already-exists.patch b/meta-oe/recipes-support/opencv/already-exists.patch
new file mode 100644
index 000000000000..6e24f2de8715
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/already-exists.patch
@@ -0,0 +1,394 @@
+From e4bf148cddf277834e57c9afeec8daff8378a655 Mon Sep 17 00:00:00 2001
+From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
+Date: Wed, 22 Nov 2017 15:27:07 +0100
+Subject: [PATCH] Fix: File already exists in database: caffe.proto
+
+Fixes error when importing python cv
+
+Upstream-status: Backport https://github.com/opencv/opencv/pull/10092
+Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
+---
+ modules/dnn/CMakeLists.txt                                | 6 +++---
+ modules/dnn/src/caffe/caffe_importer.cpp                  | 1 -
+ modules/dnn/src/caffe/caffe_io.cpp                        | 1 -
+ modules/dnn/src/caffe/caffe_io.hpp                        | 2 +-
+ modules/dnn/src/caffe/{caffe.proto => opencv-caffe.proto} | 0
+ 5 files changed, 4 insertions(+), 6 deletions(-)
+ rename modules/dnn/src/caffe/{caffe.proto => opencv-caffe.proto} (100%)
+
+diff --git a/modules/dnn/CMakeLists.txt b/modules/dnn/CMakeLists.txt
+index c6329a742263..8ef00ef983ff 100644
+--- a/modules/dnn/CMakeLists.txt
++++ b/modules/dnn/CMakeLists.txt
+@@ -55,13 +55,13 @@ ocv_warnings_disable(CMAKE_CXX_FLAGS
+ 
+ if(PROTOBUF_UPDATE_FILES)
+   file(GLOB proto_files src/tensorflow/*.proto)
+-  list(APPEND proto_files src/caffe/caffe.proto)
++  list(APPEND proto_files src/caffe/opencv-caffe.proto)
+   PROTOBUF_GENERATE_CPP(Protobuf_HDRS Protobuf_SRCS ${proto_files})
+ else()
+   file(GLOB fw_srcs ${CMAKE_CURRENT_SOURCE_DIR}/misc/tensorflow/*.cc)
+   file(GLOB fw_hdrs ${CMAKE_CURRENT_SOURCE_DIR}/misc/tensorflow/*.h)
+-  list(APPEND fw_srcs ${CMAKE_CURRENT_SOURCE_DIR}/misc/caffe/caffe.pb.cc)
+-  list(APPEND fw_hdrs ${CMAKE_CURRENT_SOURCE_DIR}/misc/caffe/caffe.pb.h)
++  list(APPEND fw_srcs ${CMAKE_CURRENT_SOURCE_DIR}/misc/caffe/opencv-caffe.pb.cc)
++  list(APPEND fw_hdrs ${CMAKE_CURRENT_SOURCE_DIR}/misc/caffe/opencv-caffe.pb.h)
+   list(APPEND Protobuf_SRCS ${fw_srcs})
+   list(APPEND Protobuf_HDRS ${fw_hdrs})
+   list(APPEND Protobuf_INCLUDE_DIRS ${CMAKE_CURRENT_SOURCE_DIR}/misc/caffe)
+diff --git a/modules/dnn/src/caffe/caffe_importer.cpp b/modules/dnn/src/caffe/caffe_importer.cpp
+index c075651b95b3..2c977c84b0f4 100644
+--- a/modules/dnn/src/caffe/caffe_importer.cpp
++++ b/modules/dnn/src/caffe/caffe_importer.cpp
+@@ -42,7 +42,6 @@
+ #include "../precomp.hpp"
+ 
+ #ifdef HAVE_PROTOBUF
+-#include "caffe.pb.h"
+ 
+ #include <iostream>
+ #include <fstream>
+diff --git a/modules/dnn/src/caffe/caffe_io.cpp b/modules/dnn/src/caffe/caffe_io.cpp
+index 0f46ea77df9a..1d3c518f1328 100644
+--- a/modules/dnn/src/caffe/caffe_io.cpp
++++ b/modules/dnn/src/caffe/caffe_io.cpp
+@@ -99,7 +99,6 @@
+ #include <fstream>
+ #include <vector>
+ 
+-#include "caffe.pb.h"
+ #include "caffe_io.hpp"
+ #include "glog_emulator.hpp"
+ 
+diff --git a/modules/dnn/src/caffe/caffe_io.hpp b/modules/dnn/src/caffe/caffe_io.hpp
+index 09bc5709a24e..f5912c3bcec1 100644
+--- a/modules/dnn/src/caffe/caffe_io.hpp
++++ b/modules/dnn/src/caffe/caffe_io.hpp
+@@ -91,7 +91,7 @@
+ #define __OPENCV_DNN_CAFFE_IO_HPP__
+ #ifdef HAVE_PROTOBUF
+ 
+-#include "caffe.pb.h"
++#include "opencv-caffe.pb.h"
+ 
+ namespace cv {
+ namespace dnn {
+diff --git a/modules/dnn/src/caffe/caffe.proto b/modules/dnn/src/caffe/opencv-caffe.proto
+similarity index 100%
+rename from modules/dnn/src/caffe/caffe.proto
+rename to modules/dnn/src/caffe/opencv-caffe.proto
+diff --git a/modules/dnn/src/layers/detection_output_layer.cpp b/modules/dnn/src/layers/detection_output_layer.cpp
+index 0b72326f7e7d..f413bad5b81a 100644
+--- a/modules/dnn/src/layers/detection_output_layer.cpp
++++ b/modules/dnn/src/layers/detection_output_layer.cpp
+@@ -44,7 +44,7 @@
+ #include "layers_common.hpp"
+ #include <float.h>
+ #include <string>
+-#include <caffe.pb.h>
++#include <opencv-caffe.pb.h>
+ 
+ namespace cv
+ {
+diff --git a/modules/dnn/src/caffe/caffe_importer.cpp b/modules/dnn/src/caffe/caffe_importer.cpp
+index 2c977c84b0f4..a1827a381117 100644
+--- a/modules/dnn/src/caffe/caffe_importer.cpp
++++ b/modules/dnn/src/caffe/caffe_importer.cpp
+@@ -78,8 +78,8 @@ static cv::String toString(const T &v)
+ 
+ class CaffeImporter : public Importer
+ {
+-    caffe::NetParameter net;
+-    caffe::NetParameter netBinary;
++    opencvcaffe::NetParameter net;
++    opencvcaffe::NetParameter netBinary;
+ 
+ public:
+ 
+@@ -197,7 +197,7 @@ public:
+         }
+     }
+ 
+-    void blobShapeFromProto(const caffe::BlobProto &pbBlob, MatShape& shape)
++    void blobShapeFromProto(const opencvcaffe::BlobProto &pbBlob, MatShape& shape)
+     {
+         shape.clear();
+         if (pbBlob.has_num() || pbBlob.has_channels() || pbBlob.has_height() || pbBlob.has_width())
+@@ -209,7 +209,7 @@ public:
+         }
+         else if (pbBlob.has_shape())
+         {
+-            const caffe::BlobShape &_shape = pbBlob.shape();
++            const opencvcaffe::BlobShape &_shape = pbBlob.shape();
+ 
+             for (int i = 0; i < _shape.dim_size(); i++)
+                 shape.push_back((int)_shape.dim(i));
+@@ -218,7 +218,7 @@ public:
+             CV_Error(Error::StsError, "Unknown shape of input blob");
+     }
+ 
+-    void blobFromProto(const caffe::BlobProto &pbBlob, cv::Mat &dstBlob)
++    void blobFromProto(const opencvcaffe::BlobProto &pbBlob, cv::Mat &dstBlob)
+     {
+         MatShape shape;
+         blobShapeFromProto(pbBlob, shape);
+@@ -233,7 +233,7 @@ public:
+             dstData[i] = pbBlob.data(i);
+     }
+ 
+-    void extractBinaryLayerParms(const caffe::LayerParameter& layer, LayerParams& layerParams)
++    void extractBinaryLayerParms(const opencvcaffe::LayerParameter& layer, LayerParams& layerParams)
+     {
+         const std::string &name = layer.name();
+ 
+@@ -247,7 +247,7 @@ public:
+         if (li == netBinary.layer_size() || netBinary.layer(li).blobs_size() == 0)
+             return;
+ 
+-        const caffe::LayerParameter &binLayer = netBinary.layer(li);
++        const opencvcaffe::LayerParameter &binLayer = netBinary.layer(li);
+         layerParams.blobs.resize(binLayer.blobs_size());
+         for (int bi = 0; bi < binLayer.blobs_size(); bi++)
+         {
+@@ -289,7 +289,7 @@ public:
+ 
+         for (int li = 0; li < layersSize; li++)
+         {
+-            const caffe::LayerParameter &layer = net.layer(li);
++            const opencvcaffe::LayerParameter &layer = net.layer(li);
+             String name = layer.name();
+             String type = layer.type();
+             LayerParams layerParams;
+@@ -313,7 +313,7 @@ public:
+         addedBlobs.clear();
+     }
+ 
+-    void addOutput(const caffe::LayerParameter &layer, int layerId, int outNum)
++    void addOutput(const opencvcaffe::LayerParameter &layer, int layerId, int outNum)
+     {
+         const std::string &name = layer.top(outNum);
+ 
+diff --git a/modules/dnn/src/caffe/caffe_io.hpp b/modules/dnn/src/caffe/caffe_io.hpp
+index f5912c3bcec1..24cd5fa254eb 100644
+--- a/modules/dnn/src/caffe/caffe_io.hpp
++++ b/modules/dnn/src/caffe/caffe_io.hpp
+@@ -98,9 +98,9 @@ namespace dnn {
+ 
+ // Read parameters from a file into a NetParameter proto message.
+ void ReadNetParamsFromTextFileOrDie(const char* param_file,
+-                                    caffe::NetParameter* param);
++                                    opencvcaffe::NetParameter* param);
+ void ReadNetParamsFromBinaryFileOrDie(const char* param_file,
+-                                      caffe::NetParameter* param);
++                                      opencvcaffe::NetParameter* param);
+ 
+ }
+ }
+diff --git a/modules/dnn/src/caffe/opencv-caffe.proto b/modules/dnn/src/caffe/opencv-caffe.proto
+index 3d23fb48ea6a..df4e1d3269ae 100644
+--- a/modules/dnn/src/caffe/opencv-caffe.proto
++++ b/modules/dnn/src/caffe/opencv-caffe.proto
+@@ -48,7 +48,7 @@
+ 
+ syntax = "proto2";
+ 
+-package caffe;
++package opencvcaffe;
+ 
+ // Specifies the shape (dimensions) of a Blob.
+ message BlobShape {
+diff --git a/modules/dnn/src/layers/detection_output_layer.cpp b/modules/dnn/src/layers/detection_output_layer.cpp
+index f413bad5b81a..832c257eebf9 100644
+--- a/modules/dnn/src/layers/detection_output_layer.cpp
++++ b/modules/dnn/src/layers/detection_output_layer.cpp
+@@ -72,7 +72,7 @@ public:
+ 
+     int _backgroundLabelId;
+ 
+-    typedef caffe::PriorBoxParameter_CodeType CodeType;
++    typedef opencvcaffe::PriorBoxParameter_CodeType CodeType;
+     CodeType _codeType;
+ 
+     bool _varianceEncodedInTarget;
+@@ -85,7 +85,7 @@ public:
+     enum { _numAxes = 4 };
+     static const std::string _layerName;
+ 
+-    typedef std::map<int, std::vector<caffe::NormalizedBBox> > LabelBBox;
++    typedef std::map<int, std::vector<opencvcaffe::NormalizedBBox> > LabelBBox;
+ 
+     bool getParameterDict(const LayerParams &params,
+                           const std::string &parameterName,
+@@ -131,11 +131,11 @@ public:
+     {
+         String codeTypeString = params.get<String>("code_type").toLowerCase();
+         if (codeTypeString == "corner")
+-            _codeType = caffe::PriorBoxParameter_CodeType_CORNER;
++            _codeType = opencvcaffe::PriorBoxParameter_CodeType_CORNER;
+         else if (codeTypeString == "center_size")
+-            _codeType = caffe::PriorBoxParameter_CodeType_CENTER_SIZE;
++            _codeType = opencvcaffe::PriorBoxParameter_CodeType_CENTER_SIZE;
+         else
+-            _codeType = caffe::PriorBoxParameter_CodeType_CORNER;
++            _codeType = opencvcaffe::PriorBoxParameter_CodeType_CORNER;
+     }
+ 
+     DetectionOutputLayerImpl(const LayerParams &params)
+@@ -215,7 +215,7 @@ public:
+             GetConfidenceScores(confidenceData, num, numPriors, _numClasses, allConfidenceScores);
+ 
+             // Retrieve all prior bboxes
+-            std::vector<caffe::NormalizedBBox> priorBBoxes;
++            std::vector<opencvcaffe::NormalizedBBox> priorBBoxes;
+             std::vector<std::vector<float> > priorVariances;
+             GetPriorBBoxes(priorData, numPriors, priorBBoxes, priorVariances);
+ 
+@@ -272,7 +272,7 @@ public:
+             for (size_t j = 0; j < indices.size(); ++j, ++count)
+             {
+                 int idx = indices[j];
+-                const caffe::NormalizedBBox& decode_bbox = label_bboxes->second[idx];
++                const opencvcaffe::NormalizedBBox& decode_bbox = label_bboxes->second[idx];
+                 outputsData[count * 7] = i;
+                 outputsData[count * 7 + 1] = label;
+                 outputsData[count * 7 + 2] = scores[idx];
+@@ -355,7 +355,7 @@ public:
+ 
+     // Compute bbox size
+     template<bool normalized>
+-    static float BBoxSize(const caffe::NormalizedBBox& bbox)
++    static float BBoxSize(const opencvcaffe::NormalizedBBox& bbox)
+     {
+         if (bbox.xmax() < bbox.xmin() || bbox.ymax() < bbox.ymin())
+         {
+@@ -388,10 +388,10 @@ public:
+     // Decode a bbox according to a prior bbox
+     template<bool variance_encoded_in_target>
+     static void DecodeBBox(
+-        const caffe::NormalizedBBox& prior_bbox, const std::vector<float>& prior_variance,
++        const opencvcaffe::NormalizedBBox& prior_bbox, const std::vector<float>& prior_variance,
+         const CodeType code_type,
+-        const bool clip_bbox, const caffe::NormalizedBBox& bbox,
+-        caffe::NormalizedBBox& decode_bbox)
++        const bool clip_bbox, const opencvcaffe::NormalizedBBox& bbox,
++        opencvcaffe::NormalizedBBox& decode_bbox)
+     {
+         float bbox_xmin = variance_encoded_in_target ? bbox.xmin() : prior_variance[0] * bbox.xmin();
+         float bbox_ymin = variance_encoded_in_target ? bbox.ymin() : prior_variance[1] * bbox.ymin();
+@@ -399,13 +399,13 @@ public:
+         float bbox_ymax = variance_encoded_in_target ? bbox.ymax() : prior_variance[3] * bbox.ymax();
+         switch(code_type)
+         {
+-            case caffe::PriorBoxParameter_CodeType_CORNER:
++            case opencvcaffe::PriorBoxParameter_CodeType_CORNER:
+                 decode_bbox.set_xmin(prior_bbox.xmin() + bbox_xmin);
+                 decode_bbox.set_ymin(prior_bbox.ymin() + bbox_ymin);
+                 decode_bbox.set_xmax(prior_bbox.xmax() + bbox_xmax);
+                 decode_bbox.set_ymax(prior_bbox.ymax() + bbox_ymax);
+                 break;
+-            case caffe::PriorBoxParameter_CodeType_CENTER_SIZE:
++            case opencvcaffe::PriorBoxParameter_CodeType_CENTER_SIZE:
+             {
+                 float prior_width = prior_bbox.xmax() - prior_bbox.xmin();
+                 CV_Assert(prior_width > 0);
+@@ -431,7 +431,7 @@ public:
+         };
+         if (clip_bbox)
+         {
+-            // Clip the caffe::NormalizedBBox such that the range for each corner is [0, 1]
++            // Clip the opencvcaffe::NormalizedBBox such that the range for each corner is [0, 1]
+             decode_bbox.set_xmin(std::max(std::min(decode_bbox.xmin(), 1.f), 0.f));
+             decode_bbox.set_ymin(std::max(std::min(decode_bbox.ymin(), 1.f), 0.f));
+             decode_bbox.set_xmax(std::max(std::min(decode_bbox.xmax(), 1.f), 0.f));
+@@ -443,11 +443,11 @@ public:
+ 
+     // Decode a set of bboxes according to a set of prior bboxes
+     static void DecodeBBoxes(
+-        const std::vector<caffe::NormalizedBBox>& prior_bboxes,
++        const std::vector<opencvcaffe::NormalizedBBox>& prior_bboxes,
+         const std::vector<std::vector<float> >& prior_variances,
+         const CodeType code_type, const bool variance_encoded_in_target,
+-        const bool clip_bbox, const std::vector<caffe::NormalizedBBox>& bboxes,
+-        std::vector<caffe::NormalizedBBox>& decode_bboxes)
++        const bool clip_bbox, const std::vector<opencvcaffe::NormalizedBBox>& bboxes,
++        std::vector<opencvcaffe::NormalizedBBox>& decode_bboxes)
+     {
+         CV_Assert(prior_bboxes.size() == prior_variances.size());
+         CV_Assert(prior_bboxes.size() == bboxes.size());
+@@ -470,7 +470,7 @@ public:
+ 
+     // Decode all bboxes in a batch
+     static void DecodeBBoxesAll(const std::vector<LabelBBox>& all_loc_preds,
+-        const std::vector<caffe::NormalizedBBox>& prior_bboxes,
++        const std::vector<opencvcaffe::NormalizedBBox>& prior_bboxes,
+         const std::vector<std::vector<float> >& prior_variances,
+         const int num, const bool share_location,
+         const int num_loc_classes, const int background_label_id,
+@@ -503,10 +503,10 @@ public:
+     // Get prior bounding boxes from prior_data
+     //    prior_data: 1 x 2 x num_priors * 4 x 1 blob.
+     //    num_priors: number of priors.
+-    //    prior_bboxes: stores all the prior bboxes in the format of caffe::NormalizedBBox.
++    //    prior_bboxes: stores all the prior bboxes in the format of opencvcaffe::NormalizedBBox.
+     //    prior_variances: stores all the variances needed by prior bboxes.
+     static void GetPriorBBoxes(const float* priorData, const int& numPriors,
+-                        std::vector<caffe::NormalizedBBox>& priorBBoxes,
++                        std::vector<opencvcaffe::NormalizedBBox>& priorBBoxes,
+                         std::vector<std::vector<float> >& priorVariances)
+     {
+         priorBBoxes.clear(); priorBBoxes.resize(numPriors);
+@@ -514,7 +514,7 @@ public:
+         for (int i = 0; i < numPriors; ++i)
+         {
+             int startIdx = i * 4;
+-            caffe::NormalizedBBox& bbox = priorBBoxes[i];
++            opencvcaffe::NormalizedBBox& bbox = priorBBoxes[i];
+             bbox.set_xmin(priorData[startIdx]);
+             bbox.set_ymin(priorData[startIdx + 1]);
+             bbox.set_xmax(priorData[startIdx + 2]);
+@@ -565,7 +565,7 @@ public:
+                     {
+                         labelBBox[label].resize(numPredsPerClass);
+                     }
+-                    caffe::NormalizedBBox& bbox = labelBBox[label][p];
++                    opencvcaffe::NormalizedBBox& bbox = labelBBox[label][p];
+                     bbox.set_xmin(locData[startIdx + c * 4]);
+                     bbox.set_ymin(locData[startIdx + c * 4 + 1]);
+                     bbox.set_xmax(locData[startIdx + c * 4 + 2]);
+@@ -612,7 +612,7 @@ public:
+     //    nms_threshold: a threshold used in non maximum suppression.
+     //    top_k: if not -1, keep at most top_k picked indices.
+     //    indices: the kept indices of bboxes after nms.
+-    static void ApplyNMSFast(const std::vector<caffe::NormalizedBBox>& bboxes,
++    static void ApplyNMSFast(const std::vector<opencvcaffe::NormalizedBBox>& bboxes,
+           const std::vector<float>& scores, const float score_threshold,
+           const float nms_threshold, const float eta, const int top_k,
+           std::vector<int>& indices)
+@@ -674,10 +674,10 @@ public:
+ 
+     // Compute the jaccard (intersection over union IoU) overlap between two bboxes.
+     template<bool normalized>
+-    static float JaccardOverlap(const caffe::NormalizedBBox& bbox1,
+-                         const caffe::NormalizedBBox& bbox2)
++    static float JaccardOverlap(const opencvcaffe::NormalizedBBox& bbox1,
++                         const opencvcaffe::NormalizedBBox& bbox2)
+     {
+-        caffe::NormalizedBBox intersect_bbox;
++        opencvcaffe::NormalizedBBox intersect_bbox;
+         if (bbox2.xmin() > bbox1.xmax() || bbox2.xmax() < bbox1.xmin() ||
+             bbox2.ymin() > bbox1.ymax() || bbox2.ymax() < bbox1.ymin())
+         {
+diff --git a/modules/dnn/src/caffe/caffe_io.cpp b/modules/dnn/src/caffe/caffe_io.cpp
+index 1d3c518f1328..3cf6e255aa60 100644
+--- a/modules/dnn/src/caffe/caffe_io.cpp
++++ b/modules/dnn/src/caffe/caffe_io.cpp
+@@ -107,7 +107,7 @@ namespace dnn {
+ 
+ using std::string;
+ using std::map;
+-using namespace caffe;
++using namespace opencvcaffe;
+ using namespace ::google::protobuf;
+ using namespace ::google::protobuf::io;
+ 
diff --git a/meta-oe/recipes-support/opencv/opencv_3.3.bb b/meta-oe/recipes-support/opencv/opencv_3.3.bb
index 773bfe9f7a09..3663d30e9271 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.3.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.3.bb
@@ -59,6 +59,7 @@ SRC_URI = "git://github.com/opencv/opencv.git;name=opencv \
     file://CVE-2017-14136.patch \
     file://javagen.patch \
     file://protobuf.patch \
+    file://already-exists.patch \
 "
 PV = "3.3+git${SRCPV}"
 
-- 
2.15.0


