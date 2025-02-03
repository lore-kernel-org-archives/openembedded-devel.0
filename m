Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54C3BC02192
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 20:28:33 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web11.98522.1738614510981987285
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Feb 2025 12:28:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=Jh/ZbvBy;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20250203202827323658b3d513faef1c-qny3lc@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20250203202827323658b3d513faef1c
        for <openembedded-devel@lists.openembedded.org>;
        Mon, 03 Feb 2025 21:28:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=vyBXTPkm4ODhvwMVXtgI/gPHtTT3rtkdWYKQVxD/5Dw=;
 b=Jh/ZbvByXDSG2A1qrjJuVOePcRc0yTAKyJnTzTXwkd6HzIN4WfZC+0zk24YS5fa33Xj3Lv
 vmzVh2T+oTcg/fSnis0Cf9qPzpgZdNI7XP0q95PbqgI2OSlbY4iNjH49LUA6svBNscAxVbLU
 DLV2jcR5fJWhUtesR1u0Qm0dKAWpgHyG1kr8DUfGzt2j+YuTRbB6xWBk91ffWtVc3NtZ4PSr
 I4g18lQ6ZOAdHfAWPw32omUYpLFf4CSLcG7QhnSbLQCsbHvlND/gy6N0H79+aQ/TUDRgSJZw
 mYvCYr2YIYgJ4QE2jF6rWp/e0vzov6IjaPXg999mg4ds5ivRS85nfYiQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-python][PATCH v3 7/9] python3-protobuf: add MIT to license
Date: Mon,  3 Feb 2025 21:27:37 +0100
Message-Id: <20250203202737.583492-1-peter.marko@siemens.com>
In-Reply-To: <20250203182210.574300-7-peter.marko@siemens.com>
References: <20250203182210.574300-7-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Feb 2025 20:28:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115260

From: Peter Marko <peter.marko@siemens.com>

utf_range is MIT licensed.
Although the LICENSE file is not distributed in python protobuf,
this can be read in c++ protobuf recipe where all files are present.

License-Update: added missing license

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
v3: added link li license as comment and fake LIC_FILES_CHKSUM

 .../recipes-devtools/python/python3-protobuf_4.25.3.bb | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_4.25.3.bb b/meta-python/recipes-devtools/python/python3-protobuf_4.25.3.bb
index b92f91b714..032a28963d 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_4.25.3.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_4.25.3.bb
@@ -1,9 +1,13 @@
 DESCRIPTION = "Protocol Buffers"
 HOMEPAGE = "https://developers.google.com/protocol-buffers/"
 SECTION = "devel/python"
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=53dbfa56f61b90215a9f8f0d527c043d"
+# MIT license is from utf8_range although it's packaged without this information
+# https://github.com/protocolbuffers/protobuf/blob/main/third_party/utf8_range/LICENSE
+LICENSE = "BSD-3-Clause & MIT"
+LIC_FILES_CHKSUM = " \
+    file://PKG-INFO;beginline=8;endline=8;md5=53dbfa56f61b90215a9f8f0d527c043d \
+    file://utf8_range/utf8_range.h;beginline=1;endline=2;md5=f05b3ef36cc354d7134597075a1af64f \
+"
 
 inherit pypi setuptools3
 SRC_URI[sha256sum] = "25b5d0b42fd000320bd7830b349e3b696435f3b329810427a6bcce6a5492cc5c"

