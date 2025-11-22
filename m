Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 746C1CFD2EB
	for <webhook@archiver.kernel.org>; Sat, 22 Nov 2025 19:31:42 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15747.1763839896877948180
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 Nov 2025 11:31:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=isdsmc7R;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47118259fd8so26836065e9.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 22 Nov 2025 11:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763839895; x=1764444695; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RQBlcmuUam6Ot3q/tLsOTQ1GP+TUWAV0ayUCvDU7Kp0=;
        b=isdsmc7RcVNH12gjblM8oq5X+hjb7Y7XiP0q3rTBav8wie/JmUQP0de7RJxB0ogRnn
         m5OwDT2i6WG/1Iap0uS8cTs9TR5tVsD6QSIfxYEFIjP+SDQOKmEFu7iu63ohEvVsmngt
         L/hBoNkJXk5aBebR1x3pxuiGrVDq7KwFxZ3H4oLFrkGexMzqACWex2uQI0CoLWeTOQjd
         E57O09tDlHNnCXdezIZFm1/ucjke0Jf4Y4mRnOyZ6ifqU2Om3+PxKjZ3sCQhb754v9MU
         eyI+IDSDzeFpUOChh3cEUFNoQNWs/n631Kew8HWX8ms5Am6E74Ty4skzJ2+DqjK454RR
         yKvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763839895; x=1764444695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RQBlcmuUam6Ot3q/tLsOTQ1GP+TUWAV0ayUCvDU7Kp0=;
        b=IvLy3lV8JGXfE9xpUmYkcYE1DAObK10vmPu60LGDlSFBdtQoJ7Eu4qPCSjB7TFZV/N
         Nx1wm6mu2jy1Z3NQ6Eo9QYmU1UMzy08RqjwbEIQAruh9qef/1D6COFBJ1yn72eT52MvK
         QH+ivgR6ZqtPQ0r9VnlfiLX6qSPtSG6umh2MjdVYePVAsKNvtirFjUwovt0TD9sK0dFA
         3JDocGqDgdHJuTPNInKivM7q+6fL0bllQYRMQBkd5XZ8S1uL77IJuBsFWZG/0MTAAg2n
         dicI3O/tj63taLSp4uciyk5EVcujGkFxF+dmOItPQ5c7BWCZ16m3veV/q0oEZCXw3aII
         tVBA==
X-Gm-Message-State: AOJu0YxJrsWtvCJVcccQ1BUyTBDLaMrP6BzkKha1xHXWvpOZvL25OTpw
	njvbhQJUbCseVcamw3+lS3geQ9MbR0nYp+blHoMY1fnQroEbnmLrqPGgJHHx9iV1
X-Gm-Gg: ASbGncusKXqHR28tXvMfwgGATPc6BHGz4TD4foIfsb13cQfN9Iuy9OZ+czxCmD0Ae3+
	FxlIQIQUmDzDrJ3Hgk+YGwRpZn+HqNechg6FhbbT2RCdmy+O+/7+y2LjKaJsE7tH3CV2qD8Z4Ll
	thBH5MQhiXa6ydmfxcdkwDoETHSoWrwCDs3obr76mMNf4YsFuoBkPt3F2CvIoKvcNHkV52DFuNR
	lBudoH4RwtcyymIn7UgFdpGfCOTDQE7b3h0vidyDboSlf8QSUuJzH/76cVjc+w47SwS8TSg+kSt
	dLwL3mvsLMLpUKeLPpUfqThSc6lnI6nAWSdfksZXhwZBPuElpLCMQufNYWqCcJ1onbTROU/ECfm
	3erjW34N66ZA2AP/W32y+R52gTZStiJyXNVEq614TetslTLVUkc7uIqveRa5OAonNkRDsoS9ptS
	cg6o6jT+tY
X-Google-Smtp-Source: AGHT+IFbpGoQ9PLtSXt/TEwnOkH0Cb5ajaFKsFtlHKlePxOBmGM6C/ZiNdvjcm5IPLYbeHK4Gf9Qhg==
X-Received: by 2002:a05:600c:1f0f:b0:471:d2f:7987 with SMTP id 5b1f17b1804b1-477c01e87b1mr58468015e9.26.1763839895097;
        Sat, 22 Nov 2025 11:31:35 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fba201sm18314686f8f.32.2025.11.22.11.31.34
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 11:31:34 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 09/10] exiv2: patch CVE-2021-34334
Date: Sat, 22 Nov 2025 20:31:27 +0100
Message-ID: <20251122193128.1703871-9-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251122193128.1703871-1-skandigraun@gmail.com>
References: <20251122193128.1703871-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 22 Nov 2025 19:31:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121987

Details: https://nvd.nist.gov/vuln/detail/CVE-2021-34334

Pick the patches from the PR mentioned in the nvd report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../exiv2/exiv2/CVE-2021-34334-1.patch        |  36 ++
 .../exiv2/exiv2/CVE-2021-34334-2.patch        | 322 ++++++++++++++++++
 .../exiv2/exiv2/CVE-2021-34334-3.patch        |  35 ++
 .../exiv2/exiv2/CVE-2021-34334-4.patch        |  25 ++
 meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb |   4 +
 5 files changed, 422 insertions(+)
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-34334-1.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-34334-2.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-34334-3.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-34334-4.patch

diff --git a/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-34334-1.patch b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-34334-1.patch
new file mode 100644
index 0000000000..3ec5873ab4
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-34334-1.patch
@@ -0,0 +1,36 @@
+From 5a11c81fe8df7cb82c2b2889b1d5863b42d59cc6 Mon Sep 17 00:00:00 2001
+From: Kevin Backhouse <kevinbackhouse@github.com>
+Date: Tue, 6 Jul 2021 18:15:40 +0100
+Subject: [PATCH] Extra checking to prevent the loop counter from wrapping
+ around.
+
+CVE: CVE-2021-34334
+Upstream-Status: Backport [https://github.com/Exiv2/exiv2/pull/1766/commits/97c4880882d87aee77809b4b6e8fb4a5558e4ca2]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/crwimage_int.cpp | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/src/crwimage_int.cpp b/src/crwimage_int.cpp
+index 0232867..4ccea63 100644
+--- a/src/crwimage_int.cpp
++++ b/src/crwimage_int.cpp
+@@ -868,12 +868,16 @@ namespace Exiv2 {
+         assert(ifdId != ifdIdNotSet);
+ 
+         std::string groupName(Internal::groupName(ifdId));
++        const uint32_t component_size = ciffComponent.size();
++        enforce(component_size % 2 == 0, kerCorruptedMetadata);
++        enforce(component_size/2 <= static_cast<uint32_t>(std::numeric_limits<uint16_t>::max()), kerCorruptedMetadata);
++        const uint16_t num_components = static_cast<uint16_t>(component_size/2);
+         uint16_t c = 1;
+-        while (uint32_t(c)*2 < ciffComponent.size()) {
++        while (c < num_components) {
+             uint16_t n = 1;
+             ExifKey key(c, groupName);
+             UShortValue value;
+-            if (ifdId == canonCsId && c == 23 && ciffComponent.size() > 50) n = 3;
++            if (ifdId == canonCsId && c == 23 && component_size >= 52) n = 3;
+             value.read(ciffComponent.pData() + c*2, n*2, byteOrder);
+             image.exifData().add(key, &value);
+             if (ifdId == canonSiId && c == 21) aperture = value.toLong();
diff --git a/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-34334-2.patch b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-34334-2.patch
new file mode 100644
index 0000000000..bc11894827
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-34334-2.patch
@@ -0,0 +1,322 @@
+From fd66118143640ed248e209c18fc8f2447f1bc85e Mon Sep 17 00:00:00 2001
+From: Kevin Backhouse <kevinbackhouse@github.com>
+Date: Wed, 7 Jul 2021 14:41:42 +0100
+Subject: [PATCH] Defensive coding changes to avoid integer overflow in loop
+ conditions.
+
+CVE: CVE-2021-34334
+Upstream-Status: Backport [https://github.com/Exiv2/exiv2/pull/1766/commits/1b204d9b19efcff1acad56737d6483a393e24832]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/actions.cpp           |  4 ++--
+ src/basicio.cpp           |  9 ++++-----
+ src/convert.cpp           | 10 +++++-----
+ src/exif.cpp              |  2 +-
+ src/exiv2.cpp             |  4 ++--
+ src/iptc.cpp              |  9 ++++++---
+ src/preview.cpp           |  2 +-
+ src/tags_int.cpp          |  7 +++++--
+ src/tiffcomposite_int.cpp |  4 ++--
+ src/tiffvisitor_int.cpp   |  6 +++---
+ src/types.cpp             |  2 +-
+ src/xmp.cpp               |  2 +-
+ src/xmpsidecar.cpp        |  2 +-
+ 13 files changed, 34 insertions(+), 29 deletions(-)
+
+diff --git a/src/actions.cpp b/src/actions.cpp
+index a941d67..97acac7 100644
+--- a/src/actions.cpp
++++ b/src/actions.cpp
+@@ -702,8 +702,8 @@ namespace Action {
+             std::ostringstream os;
+             // #1114 - show negative values for SByte
+             if (md.typeId() == Exiv2::signedByte) {
+-                for ( int c = 0 ; c < md.value().count() ; c++ ) {
+-                    int value = md.value().toLong(c);
++                for ( long c = 0 ; c < md.value().count() ; c++ ) {
++                    long value = md.value().toLong(c);
+                     os << (c?" ":"") << std::dec << (value < 128 ? value : value - 256);
+                 }
+             } else {
+diff --git a/src/basicio.cpp b/src/basicio.cpp
+index b5ec43c..7b707e1 100644
+--- a/src/basicio.cpp
++++ b/src/basicio.cpp
+@@ -1800,9 +1800,10 @@ namespace Exiv2 {
+ 
+         // find $right
+         findDiff    = false;
+-        blockIndex  = nBlocks - 1;
+-        blockSize   = p_->blocksMap_[blockIndex].getSize();
+-        while ((blockIndex + 1 > 0) && right < src.size() && !findDiff) {
++        blockIndex  = nBlocks;
++        while (blockIndex > 0 && right < src.size() && !findDiff) {
++            blockIndex--;
++            blockSize = p_->blocksMap_[blockIndex].getSize();
+             if(src.seek(-1 * (blockSize + right), BasicIo::end)) {
+                 findDiff = true;
+             } else {
+@@ -1817,8 +1818,6 @@ namespace Exiv2 {
+                     }
+                 }
+             }
+-            blockIndex--;
+-            blockSize = (long)p_->blocksMap_[blockIndex].getSize();
+         }
+ 
+         // free buf
+diff --git a/src/convert.cpp b/src/convert.cpp
+index ef83a23..25fb587 100644
+--- a/src/convert.cpp
++++ b/src/convert.cpp
+@@ -545,7 +545,7 @@ namespace Exiv2 {
+         Exiv2::ExifData::iterator pos = exifData_->findKey(ExifKey(from));
+         if (pos == exifData_->end()) return;
+         if (!prepareXmpTarget(to)) return;
+-        for (int i = 0; i < pos->count(); ++i) {
++        for (long i = 0; i < pos->count(); ++i) {
+             std::string value = pos->toString(i);
+             if (!pos->value().ok()) {
+ #ifndef SUPPRESS_WARNINGS
+@@ -692,7 +692,7 @@ namespace Exiv2 {
+         if (pos == exifData_->end()) return;
+         if (!prepareXmpTarget(to)) return;
+         std::ostringstream value;
+-        for (int i = 0; i < pos->count(); ++i) {
++        for (long i = 0; i < pos->count(); ++i) {
+             value << static_cast<char>(pos->toLong(i));
+         }
+         (*xmpData_)[to] = value.str();
+@@ -705,7 +705,7 @@ namespace Exiv2 {
+         if (pos == exifData_->end()) return;
+         if (!prepareXmpTarget(to)) return;
+         std::ostringstream value;
+-        for (int i = 0; i < pos->count(); ++i) {
++        for (long i = 0; i < pos->count(); ++i) {
+             if (i > 0) value << '.';
+             value << pos->toLong(i);
+         }
+@@ -823,7 +823,7 @@ namespace Exiv2 {
+         Exiv2::XmpData::iterator pos = xmpData_->findKey(XmpKey(from));
+         if (pos == xmpData_->end()) return;
+         std::ostringstream array;
+-        for (int i = 0; i < pos->count(); ++i) {
++        for (long i = 0; i < pos->count(); ++i) {
+             std::string value = pos->toString(i);
+             if (!pos->value().ok()) {
+ #ifndef SUPPRESS_WARNINGS
+@@ -972,7 +972,7 @@ namespace Exiv2 {
+             return;
+         }
+ 
+-        for (unsigned i = 0; i < value.length(); ++i) {
++        for (size_t i = 0; i < value.length(); ++i) {
+             if (value[i] == '.') value[i] = ' ';
+         }
+         (*exifData_)[to] = value;
+diff --git a/src/exif.cpp b/src/exif.cpp
+index 493fd20..de93980 100644
+--- a/src/exif.cpp
++++ b/src/exif.cpp
+@@ -948,7 +948,7 @@ namespace {
+     long sumToLong(const Exiv2::Exifdatum& md)
+     {
+         long sum = 0;
+-        for (int i = 0; i < md.count(); ++i) {
++        for (long i = 0; i < md.count(); ++i) {
+             sum += md.toLong(i);
+         }
+         return sum;
+diff --git a/src/exiv2.cpp b/src/exiv2.cpp
+index a7c542e..09f690d 100644
+--- a/src/exiv2.cpp
++++ b/src/exiv2.cpp
+@@ -1499,7 +1499,7 @@ namespace {
+     std::string parseEscapes(const std::string& input)
+     {
+         std::string result = "";
+-        for (unsigned int i = 0; i < input.length(); ++i) {
++        for (size_t i = 0; i < input.length(); ++i) {
+             char ch = input[i];
+             if (ch != '\\') {
+                 result.push_back(ch);
+@@ -1526,7 +1526,7 @@ namespace {
+                 result.push_back('\t');
+                 break;
+             case 'u':                           // Escaping of unicode
+-                if (input.length() - 4 > i) {
++                if (input.length() >= 4 && input.length() - 4 > i) {
+                     int acc = 0;
+                     for (int j = 0; j < 4; ++j) {
+                         ++i;
+diff --git a/src/iptc.cpp b/src/iptc.cpp
+index 1ffc759..f823f74 100644
+--- a/src/iptc.cpp
++++ b/src/iptc.cpp
+@@ -27,6 +27,7 @@
+ #include "iptc.hpp"
+ #include "types.hpp"
+ #include "error.hpp"
++#include "enforce.hpp"
+ #include "value.hpp"
+ #include "datasets.hpp"
+ #include "jpgimage.hpp"
+@@ -350,22 +351,24 @@ namespace Exiv2 {
+ 
+     void IptcData::printStructure(std::ostream& out, const Slice<byte*>& bytes, uint32_t depth)
+     {
+-        uint32_t i = 0;
+-        while (i < bytes.size() - 3 && bytes.at(i) != 0x1c)
++        size_t i = 0;
++        while (i + 3 < bytes.size() && bytes.at(i) != 0x1c)
+             i++;
+         depth++;
+         out << Internal::indent(depth) << "Record | DataSet | Name                     | Length | Data" << std::endl;
+-        while (i < bytes.size() - 3) {
++        while (i + 3 < bytes.size()) {
+             if (bytes.at(i) != 0x1c) {
+                 break;
+             }
+             char buff[100];
+             uint16_t record = bytes.at(i + 1);
+             uint16_t dataset = bytes.at(i + 2);
++            enforce(bytes.size() - i >= 5, kerCorruptedMetadata);
+             uint16_t len = getUShort(bytes.subSlice(i + 3, bytes.size()), bigEndian);
+             sprintf(buff, "  %6d | %7d | %-24s | %6d | ", record, dataset,
+                     Exiv2::IptcDataSets::dataSetName(dataset, record).c_str(), len);
+ 
++            enforce(bytes.size() - i >= 5 + len, kerCorruptedMetadata);
+             out << buff << Internal::binaryToString(makeSlice(bytes, i + 5, i + 5 + (len > 40 ? 40 : len)))
+                 << (len > 40 ? "..." : "")
+                 << std::endl;
+diff --git a/src/preview.cpp b/src/preview.cpp
+index ed45566..d99a03a 100644
+--- a/src/preview.cpp
++++ b/src/preview.cpp
+@@ -809,7 +809,7 @@ namespace {
+                     enforce(size_ <= static_cast<uint32_t>(io.size()), kerCorruptedMetadata);
+                     DataBuf buf(size_);
+                     uint32_t idxBuf = 0;
+-                    for (int i = 0; i < sizes.count(); i++) {
++                    for (long i = 0; i < sizes.count(); i++) {
+                         uint32_t offset = dataValue.toLong(i);
+                         uint32_t size = sizes.toLong(i);
+                         enforce(Safe::add(idxBuf, size) < size_, kerCorruptedMetadata);
+diff --git a/src/tags_int.cpp b/src/tags_int.cpp
+index f29b1e3..6f76a87 100644
+--- a/src/tags_int.cpp
++++ b/src/tags_int.cpp
+@@ -24,6 +24,7 @@
+ 
+ #include "convert.hpp"
+ #include "error.hpp"
++#include "enforce.hpp"
+ #include "i18n.h"                // NLS support.
+ 
+ #include "canonmn_int.hpp"
+@@ -2173,7 +2174,9 @@ namespace Exiv2 {
+         {
+             uint16_t bit   = 0;
+             uint16_t comma = 0;
+-            for (uint16_t i = 0; i < value.count(); i++ ) { // for each element in value array
++            long count = value.count();
++            enforce(0 <= count && count <= std::numeric_limits<uint16_t>::max(), kerCorruptedMetadata);
++            for (uint16_t i = 0; i < count; i++ ) { // for each element in value array
+                 uint16_t bits = static_cast<uint16_t>(value.toLong(i));
+                 for (uint16_t b = 0; b < 16; ++b) { // for every bit
+                     if (bits & (1 << b)) {
+@@ -2867,7 +2870,7 @@ namespace Exiv2 {
+         if (stringValue[19] == 'Z') {
+             stringValue = stringValue.substr(0, 19);
+         }
+-        for (unsigned int i = 0; i < stringValue.length(); ++i) {
++        for (size_t i = 0; i < stringValue.length(); ++i) {
+             if (stringValue[i] == 'T') stringValue[i] = ' ';
+             if (stringValue[i] == '-') stringValue[i] = ':';
+         }
+diff --git a/src/tiffcomposite_int.cpp b/src/tiffcomposite_int.cpp
+index a6bf925..6424156 100644
+--- a/src/tiffcomposite_int.cpp
++++ b/src/tiffcomposite_int.cpp
+@@ -431,7 +431,7 @@ namespace Exiv2 {
+             return;
+         }
+         uint32_t size = 0;
+-        for (int i = 0; i < pSize->count(); ++i) {
++        for (long i = 0; i < pSize->count(); ++i) {
+             size += static_cast<uint32_t>(pSize->toLong(i));
+         }
+         uint32_t offset = static_cast<uint32_t>(pValue()->toLong(0));
+@@ -488,7 +488,7 @@ namespace Exiv2 {
+ #endif
+             return;
+         }
+-        for (int i = 0; i < pValue()->count(); ++i) {
++        for (long i = 0; i < pValue()->count(); ++i) {
+             const uint32_t offset = static_cast<uint32_t>(pValue()->toLong(i));
+             const byte* pStrip = pData + baseOffset + offset;
+             const uint32_t size = static_cast<uint32_t>(pSize->toLong(i));
+diff --git a/src/tiffvisitor_int.cpp b/src/tiffvisitor_int.cpp
+index 066e4fc..cca9679 100644
+--- a/src/tiffvisitor_int.cpp
++++ b/src/tiffvisitor_int.cpp
+@@ -477,7 +477,7 @@ namespace Exiv2 {
+         // create vector of signedShorts from unsignedShorts in Exif.Canon.AFInfo
+         std::vector<int16_t>  ints;
+         std::vector<uint16_t> uint;
+-        for (int i = 0; i < object->pValue()->count(); i++) {
++        for (long i = 0; i < object->pValue()->count(); i++) {
+             ints.push_back((int16_t) object->pValue()->toLong(i));
+             uint.push_back((uint16_t) object->pValue()->toLong(i));
+         }
+@@ -524,9 +524,9 @@ namespace Exiv2 {
+                 Exiv2::Value::AutoPtr v = Exiv2::Value::create(records[i].bSigned?Exiv2::signedShort:Exiv2::unsignedShort);
+                 std::ostringstream    s;
+                 if ( records[i].bSigned ) {
+-                    for ( int16_t k = 0 ; k < records[i].size ; k++ ) s << " " << ints.at(nStart++);
++                    for ( uint16_t k = 0 ; k < records[i].size ; k++ ) s << " " << ints.at(nStart++);
+                 } else {
+-                    for ( int16_t k = 0 ; k < records[i].size ; k++ ) s << " " << uint.at(nStart++);
++                    for ( uint16_t k = 0 ; k < records[i].size ; k++ ) s << " " << uint.at(nStart++);
+                 }
+ 
+                 v->read(s.str());
+diff --git a/src/types.cpp b/src/types.cpp
+index 17ab051..a122640 100644
+--- a/src/types.cpp
++++ b/src/types.cpp
+@@ -612,7 +612,7 @@ namespace Exiv2 {
+     bool stringTo<bool>(const std::string& s, bool& ok)
+     {
+         std::string lcs(s); /* lowercase string */
+-        for(unsigned i = 0; i < lcs.length(); i++) {
++        for(size_t i = 0; i < lcs.length(); i++) {
+             lcs[i] = std::tolower(s[i]);
+         }
+         /* handle the same values as xmp sdk */
+diff --git a/src/xmp.cpp b/src/xmp.cpp
+index d426c1e..0b7ade0 100644
+--- a/src/xmp.cpp
++++ b/src/xmp.cpp
+@@ -794,7 +794,7 @@ namespace Exiv2 {
+                 || i->typeId() == xmpAlt) {
+                 printNode(ns, i->tagName(), "", options);
+                 meta.SetProperty(ns.c_str(), i->tagName().c_str(), 0, options);
+-                for (int idx = 0; idx < i->count(); ++idx) {
++                for (long idx = 0; idx < i->count(); ++idx) {
+                     const std::string item = i->tagName() + "[" + toString(idx + 1) + "]";
+                     printNode(ns, item, i->toString(idx), 0);
+                     meta.SetProperty(ns.c_str(), item.c_str(), i->toString(idx).c_str());
+diff --git a/src/xmpsidecar.cpp b/src/xmpsidecar.cpp
+index 3146721..4791918 100644
+--- a/src/xmpsidecar.cpp
++++ b/src/xmpsidecar.cpp
+@@ -238,7 +238,7 @@ namespace Exiv2 {
+         std::string head(reinterpret_cast<const char*>(buf + start), len - start);
+         if (head.substr(0, 5)  == "<?xml") {
+             // Forward to the next tag
+-            for (unsigned i = 5; i < head.size(); ++i) {
++            for (size_t i = 5; i < head.size(); ++i) {
+                 if (head[i] == '<') {
+                     head = head.substr(i);
+                     break;
diff --git a/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-34334-3.patch b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-34334-3.patch
new file mode 100644
index 0000000000..7ee54a7bf0
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-34334-3.patch
@@ -0,0 +1,35 @@
+From 95f5403e8b3a5d71241b6b9ef809f4097ad404a5 Mon Sep 17 00:00:00 2001
+From: Kevin Backhouse <kevinbackhouse@github.com>
+Date: Wed, 7 Jul 2021 16:49:24 +0100
+Subject: [PATCH] Better fix for potential integer overflow in `bytes.size() -
+ 3`.
+
+CVE: CVE-2021-34334
+Upstream-Status: Backport [https://github.com/Exiv2/exiv2/pull/1766/commits/ee8af718983469af5a86f041b58a5f52b1cbad76]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/iptc.cpp | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/src/iptc.cpp b/src/iptc.cpp
+index f823f74..8e54b9c 100644
+--- a/src/iptc.cpp
++++ b/src/iptc.cpp
+@@ -351,12 +351,15 @@ namespace Exiv2 {
+ 
+     void IptcData::printStructure(std::ostream& out, const Slice<byte*>& bytes, uint32_t depth)
+     {
++        if (bytes.size() < 3) {
++            return;
++        }
+         size_t i = 0;
+-        while (i + 3 < bytes.size() && bytes.at(i) != 0x1c)
++        while (i < bytes.size() - 3 && bytes.at(i) != 0x1c)
+             i++;
+         depth++;
+         out << Internal::indent(depth) << "Record | DataSet | Name                     | Length | Data" << std::endl;
+-        while (i + 3 < bytes.size()) {
++        while (i < bytes.size() - 3) {
+             if (bytes.at(i) != 0x1c) {
+                 break;
+             }
diff --git a/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-34334-4.patch b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-34334-4.patch
new file mode 100644
index 0000000000..5fa7b14629
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-34334-4.patch
@@ -0,0 +1,25 @@
+From 28c81a061768f06aa88d52bf46e7195fe350c272 Mon Sep 17 00:00:00 2001
+From: Kevin Backhouse <kevinbackhouse@github.com>
+Date: Thu, 8 Jul 2021 10:46:24 +0100
+Subject: [PATCH] Type of escapeStart should be size_t.
+
+CVE: CVE-2021-34334
+Upstream-Status: Backport [https://github.com/Exiv2/exiv2/pull/1766/commits/e74d8accc431d9064589bad6cf8f17c30229523d]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/exiv2.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/exiv2.cpp b/src/exiv2.cpp
+index 09f690d..3d9fa4f 100644
+--- a/src/exiv2.cpp
++++ b/src/exiv2.cpp
+@@ -1505,7 +1505,7 @@ namespace {
+                 result.push_back(ch);
+                 continue;
+             }
+-            int escapeStart = i;
++            size_t escapeStart = i;
+             if (!(input.length() - 1 > i)) {
+                 result.push_back(ch);
+                 continue;
diff --git a/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb b/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
index 2807cb8948..339ce221dd 100644
--- a/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
+++ b/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
@@ -16,6 +16,10 @@ SRC_URI = "https://github.com/Exiv2/${BPN}/releases/download/v${PV}/${BP}-Source
            file://CVE-2021-29623.patch \
            file://CVE-2021-32617.patch \
            file://CVE-2021-32815.patch \
+           file://CVE-2021-34334-1.patch \
+           file://CVE-2021-34334-2.patch \
+           file://CVE-2021-34334-3.patch \
+           file://CVE-2021-34334-4.patch \
            "
 SRC_URI[sha256sum] = "a79f5613812aa21755d578a297874fb59a85101e793edc64ec2c6bd994e3e778"
 

