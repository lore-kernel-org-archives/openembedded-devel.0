Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15A5DC433F5
	for <webhook@archiver.kernel.org>; Sat, 30 Apr 2022 16:52:10 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.24515.1651337526031409650
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 09:52:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oP4WajUK;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id p6so9545043pjm.1
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 09:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gcjTNstRGttoTCd9Tftj2yvkEmjKx38JRpsGI54oJJg=;
        b=oP4WajUK2RpYn1g9U640LNJW18blYzyPaUJN91T1yBSaIBFQTah3gb5G20+qPN6v1K
         83e9YmzIo838ReEiHwFXjJismuFpQXnWRWBnTr+QwqcQ74aB6DVnoLWWMhleAP6fKnWS
         nVFKZSETgsOt5LmUavryk72yRubuFEU3vscSIQFXZWk6z/yNlsRqwsFMIxdliAfYCXlq
         2kENc+KEY27UJxYapMh2Lz+3HickPAgLfobRMiaYGatAgtsEp6XxvsUW/n6q2LwZDUC6
         zqk3ceCrO7j6kcol9jMgF/nJqTg2pbS/7UDIAqQTtVeGjyqVBReWcLkRkGECv0uLC8p+
         FnqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gcjTNstRGttoTCd9Tftj2yvkEmjKx38JRpsGI54oJJg=;
        b=4XGoH7Ch34O3DIW4b0jfcjUccQ8zy8bp0z7Obv/nI+QHDjSVzYA5nlHGGjHpWBbQXk
         FjEcXU5f5bqR9CvGdGsPylaCW84x2CxL9fwfdtoJudVHiiJH7ciNtt3FkLRD2ZCdWgp3
         qP8i3vedmetYzYEof/CSiAjJjHGeQt5HWFqOw9ALVmizeJvkQFLh7pA0jzsxyVy/7WNW
         DM9M/0sy0HajNMjGm9fnmkD2Bh2ZYCKGr2Mu8b/f33gL6EgWkU+4xm5cCzJYV4/+KkJk
         49jurssJHc4AKE8/XFWW5xdRFRRBjBWR+6xf3m/WCynoqD63rDSaiXpZT+fZV13JLw8m
         ja8g==
X-Gm-Message-State: AOAM533q+hEQGLIKfKUTMryrvTqWwhjNLmpuoh8nhuQM4s9RxSXf+mMn
	7OrR5YIVXtVFFK20cPKlGAYU8FkH1O8ahw==
X-Google-Smtp-Source: 
 ABdhPJyttX9F//28QwVgGu/TJ8L+8oXttYW/ORZM6cjH6mEPSZWRHatYQFiOAM8W5vaU6tJbmmwbpA==
X-Received: by 2002:a17:90b:4b04:b0:1db:d6c9:dcc1 with SMTP id
 lx4-20020a17090b4b0400b001dbd6c9dcc1mr9723480pjb.246.1651337525151;
        Sat, 30 Apr 2022 09:52:05 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2ca3])
        by smtp.gmail.com with ESMTPSA id
 q12-20020a17090311cc00b0015e8d4eb276sm1719568plh.192.2022.04.30.09.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Apr 2022 09:52:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [meta-multimedia][PATCH] mimic: Use special rateconv.c license
Date: Sat, 30 Apr 2022 09:52:01 -0700
Message-Id: <20220430165201.1746798-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Apr 2022 16:52:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96866

rateconv.c looks like BSD-2 but it has second clause modified
significantly, therefore be specific about it.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>
---
 .../recipes-multimedia/mimic/mimic_1.3.0.1.bb |  2 +-
 meta-oe/licenses/rateconv                     | 27 +++++++++++++++++++
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/licenses/rateconv

diff --git a/meta-multimedia/recipes-multimedia/mimic/mimic_1.3.0.1.bb b/meta-multimedia/recipes-multimedia/mimic/mimic_1.3.0.1.bb
index ac0165a5d0..76f51196aa 100644
--- a/meta-multimedia/recipes-multimedia/mimic/mimic_1.3.0.1.bb
+++ b/meta-multimedia/recipes-multimedia/mimic/mimic_1.3.0.1.bb
@@ -7,7 +7,7 @@ SECTION = "multimedia"
 LICENSE = "MIT & \
            PD & \
            CMU-Tex & \
-           BSD & \
+           rateconv & \
            BSD-2-Clause & \
            BSD-3-Clause & \
            flite & \
diff --git a/meta-oe/licenses/rateconv b/meta-oe/licenses/rateconv
new file mode 100644
index 0000000000..a0f5683a05
--- /dev/null
+++ b/meta-oe/licenses/rateconv
@@ -0,0 +1,27 @@
+Authors:	Markus Mummert
+
+Copyright (c) 1992, 1995 by Markus Mummert
+
+License:
+ Redistribution and use of this software, modifcation and inclusion
+   into other forms of software are permitted provided that the following
+   conditions are met:
+
+   1. Redistributions of this software must retain the above copyright
+      notice, this list of conditions and the following disclaimer.
+   2. If this software is redistributed in a modified condition
+      it must reveal clearly that it has been modified.
+
+   THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS''
+   AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
+   TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
+   PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR
+   CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
+   EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
+   PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
+   PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
+   OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+   (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
+   USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
+   DAMAGE.
+
-- 
2.36.0


