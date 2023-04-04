Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E03E6C761A6
	for <webhook@archiver.kernel.org>; Tue,  4 Apr 2023 23:51:04 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.118099.1680652255084745890
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Apr 2023 16:50:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=VI2bcz7c;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1680652255;
  x=1712188255;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=0ddZaQYteduuUrJ4QyYbckXV8awZCrI5oKe2Bpyn4VM=;
  b=VI2bcz7ccfoKOL92+RhmWQsXD9gj6+gtEP4smmPV+vpeYid1R+AuGbSO
   0Gmuc9URludYyv0eP1R27Hkn0Nnl/sgyhTqNCJmwjWR9jI+rwDRYU+yL5
   o5fhw4v9Anpzh9pvdesg0EtxU8ZWRY2CEqpl1eAflqT6/bWDSESO+Z2Nl
   CobTYeAFAWuvbK+VycaN4ZhB9qVLiRUIn67kdsvshxzGJrQFcXpzassdS
   +jNcZzlOn3WJxMGrDF87nJbgC4JM9lKd7E+ZpBRb1XVC2o2TF9frZt3Fc
   itx0qrN8RtOErn+GJljJar4I1lLZL3YFjDeqfXoZa1R40BJ7CkyLyVeGt
   A==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 2/5] paho-mqtt-cpp: Improve the license information
Date: Wed, 5 Apr 2023 01:50:44 +0200
Message-ID: <20230404235047.601178-2-pkj@axis.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404235047.601178-1-pkj@axis.com>
References: <20230404235047.601178-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Apr 2023 23:51:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101953

Replace the about.html and notice.html files in LIC_FILES_CHKSUM with
the license information from one of the source files. Including HTML
files in LIC_FILES_CHKSUM complicates things when the license files that
OE collects are, e.g., later processed and presented to a user where the
expectation is that they are plain text files.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.2.0.bb  | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.2.0.bb b/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.2.0.bb
index a9e16fa04..d0441b844 100644
--- a/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.2.0.bb
+++ b/meta-oe/recipes-connectivity/paho-mqtt-cpp/paho-mqtt-cpp_1.2.0.bb
@@ -5,10 +5,9 @@ SECTION = "console/network"
 LICENSE = "EPL-1.0 | EDL-1.0"
 
 LIC_FILES_CHKSUM = " \
+    file://src/mqtt/message.h;beginline=9;endline=18;md5=5eec304e6066523386c222963ceeb6ff \
     file://edl-v10;md5=3adfcc70f5aeb7a44f3f9b495aa1fbf3 \
     file://epl-v10;md5=659c8e92a40b6df1d9e3dccf5ae45a08 \
-    file://notice.html;md5=a00d6f9ab542be7babc2d8b80d5d2a4c \
-    file://about.html;md5=dcde438d73cf42393da9d40fabc0c9bc \
 "
 
 SRC_URI = "git://github.com/eclipse/paho.mqtt.cpp;protocol=http;branch=master;protocol=https \

