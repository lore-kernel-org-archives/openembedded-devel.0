Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0D9AC61DA0
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 07:17:51 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.68540.1674717466733444619
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jan 2023 23:17:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UzZCrFBL;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id b24-20020a17090a551800b0022beefa7a23so4456190pji.5
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 23:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VKLQgCf8oXFXwJXuko35PzRcB8IQCpcRQaPpz0jBmYU=;
        b=UzZCrFBLXUc9p9lL5N9PJj4MZNd2J2qfefRiJEyjIF422jbH4WVyd63dq9Dso2is8V
         1s1uS2nBWNxq3wsnQYhOKET2lYrdg2HSI7IhIeDLN+QA5G0+nGigdvZaYSJV1pnzO2RE
         B2Hl1bHv7o3ZY/kPkmZmJFb/ppef5vjwQwbhu/N0QD/h3Bi2JojVmY7EGKG1HhIysUsF
         G4rZw446yRI3kWoZPbhH+9CZ2j84+JDIqDouvD7E272UHHE/KGSlpTIOwrfictJK7frQ
         CehET8akCjQwFhSydIkPITxVGtT7OXBzAqdebJdEIcuuytnKfmqKq2BynOHvfyERy3SR
         oHzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VKLQgCf8oXFXwJXuko35PzRcB8IQCpcRQaPpz0jBmYU=;
        b=jC+oq0xP002S7YHtwlHCQQ8XGiHIxGS49OxI1HTgJxfKO3p7z6TgvdTtLmHYbkyQ23
         oPNV7rJjZuTdTZO5averHWygTUbY6VtAd0H/3gghj4atn93DTUkT9LLY3zTkFK6n4V2X
         gQ3ZJEh2uppZ4SvoMwSvffo0XaU40Bj67SkphrXcsQtFkZt1ARtbvYNkixefrC1yHuNa
         47HVI05pTfvrSmwO5VFVQKjMLL65rPOv7x4CQNtWyP7MoxNSCQGnGZVQMvQyt9wtmryq
         gHjo1zFYnlD2kV7OHeMarPlR6AugmRiUYryO8Xm/gKNMPJT2gjcJFV2J3eXuF1A4pxOA
         HW3w==
X-Gm-Message-State: AFqh2koiFo1i4iDKx/+qJa07wG1M2cl8sopt3EqIcH9+uvqaRbbR/PxU
	RbbqiJiG4jPJAWCp7B/OC25rmeLeSBoLAw==
X-Google-Smtp-Source: AMrXdXs7Loy2lgY21rdwl+XSmyvBbwebExd3GlGGa+mw6Zuxdmk0vL36gDBNLZHPAY8qrhdFdFif3g==
X-Received: by 2002:a17:902:e84b:b0:194:ddc2:60e8 with SMTP id t11-20020a170902e84b00b00194ddc260e8mr29572157plg.48.1674717465903;
        Wed, 25 Jan 2023 23:17:45 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id c17-20020a170902b69100b00196025a34b9sm458815pls.159.2023.01.25.23.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 23:17:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 09/13] opensaf: Fix build with gcc13
Date: Wed, 25 Jan 2023 23:17:31 -0800
Message-Id: <20230126071735.2444745-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230126071735.2444745-1-raj.khem@gmail.com>
References: <20230126071735.2444745-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Jan 2023 07:17:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100791

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...1-include-cstdint-for-uintXX_t-types.patch | 43 ++++++++++++++
 ...-Werror-enum-int-mismatch-with-gcc13.patch | 59 +++++++++++++++++++
 .../opensaf/opensaf_5.22.01.bb                |  2 +
 3 files changed, 104 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/opensaf/opensaf/0001-include-cstdint-for-uintXX_t-types.patch
 create mode 100644 meta-networking/recipes-daemons/opensaf/opensaf/0002-Fix-Werror-enum-int-mismatch-with-gcc13.patch

diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/0001-include-cstdint-for-uintXX_t-types.patch b/meta-networking/recipes-daemons/opensaf/opensaf/0001-include-cstdint-for-uintXX_t-types.patch
new file mode 100644
index 0000000000..e36d4e0cdc
--- /dev/null
+++ b/meta-networking/recipes-daemons/opensaf/opensaf/0001-include-cstdint-for-uintXX_t-types.patch
@@ -0,0 +1,43 @@
+From 225891675b80beaa9d74ce56809e52c4451df72c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 25 Jan 2023 21:46:22 -0800
+Subject: [PATCH 1/2] include cstdint for uintXX_t types
+
+GCC-13 needs it [1]
+
+[1] https://www.gnu.org/software/gcc/gcc-13/porting_to.html
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/imm/immnd/ImmModel.h           | 1 +
+ src/osaf/consensus/consensus_env.h | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/src/imm/immnd/ImmModel.h b/src/imm/immnd/ImmModel.h
+index 44da470..0660431 100644
+--- a/src/imm/immnd/ImmModel.h
++++ b/src/imm/immnd/ImmModel.h
+@@ -22,6 +22,7 @@
+ #include <saImmOm.h>
+ #include <cstdarg>
+ #include <sys/types.h>
++#include <cstdint>
+ #include <string>
+ #include <vector>
+ #include <map>
+diff --git a/src/osaf/consensus/consensus_env.h b/src/osaf/consensus/consensus_env.h
+index df4f93a..89ccf46 100644
+--- a/src/osaf/consensus/consensus_env.h
++++ b/src/osaf/consensus/consensus_env.h
+@@ -15,6 +15,7 @@
+ #ifndef OSAF_CONSENSUS_CONSENSUS_ENV_H_
+ #define OSAF_CONSENSUS_CONSENSUS_ENV_H_
+ 
++#include <cstdint>
+ #include <string>
+ #include "base/mutex.h"
+ 
+-- 
+2.39.1
+
diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/0002-Fix-Werror-enum-int-mismatch-with-gcc13.patch b/meta-networking/recipes-daemons/opensaf/opensaf/0002-Fix-Werror-enum-int-mismatch-with-gcc13.patch
new file mode 100644
index 0000000000..e3288431eb
--- /dev/null
+++ b/meta-networking/recipes-daemons/opensaf/opensaf/0002-Fix-Werror-enum-int-mismatch-with-gcc13.patch
@@ -0,0 +1,59 @@
+From 5e5686de677c884d5d785254412ced3c9d2d1b08 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 25 Jan 2023 21:47:45 -0800
+Subject: [PATCH 2/2] Fix -Werror=enum-int-mismatch with gcc13
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/evt/agent/eda_hdl.h | 5 +++--
+ src/evt/evtd/eds_mds.h  | 3 +--
+ src/smf/smfnd/smfnd.h   | 8 ++++----
+ 3 files changed, 8 insertions(+), 8 deletions(-)
+
+--- a/src/evt/agent/eda_hdl.h
++++ b/src/evt/agent/eda_hdl.h
+@@ -31,6 +31,7 @@
+ #define EVT_AGENT_EDA_HDL_H_
+ 
+ #include "evt/agent/eda.h"
++#include "ais/include/saAis.h"
+ 
+ uint32_t eda_hdl_cbk_dispatch(EDA_CB *, EDA_CLIENT_HDL_REC *, SaDispatchFlagsT);
+ 
+@@ -68,11 +69,11 @@ EDA_CHANNEL_HDL_REC *eda_find_chan_hdl_r
+ 
+ void eda_msg_destroy(EDSV_MSG *msg);
+ 
+-uint32_t eda_extract_pattern_from_event(
++SaAisErrorT eda_extract_pattern_from_event(
+     SaEvtEventPatternArrayT *from_pattern_array,
+     SaEvtEventPatternArrayT **to_pattern_array);
+ 
+-uint32_t eda_allocate_and_extract_pattern_from_event(
++SaAisErrorT eda_allocate_and_extract_pattern_from_event(
+     SaEvtEventPatternArrayT *from_pattern_array,
+     SaEvtEventPatternArrayT **to_pattern_array);
+ 
+--- a/src/evt/evtd/eds_mds.h
++++ b/src/evt/evtd/eds_mds.h
+@@ -49,8 +49,7 @@ uint32_t eds_mds_msg_send(EDS_CB *cb, ED
+                           MDS_SEND_PRIORITY_TYPE prio);
+ 
+ uint32_t eds_mds_ack_send(EDS_CB *cb, EDSV_MSG *msg, MDS_DEST dest,
+-                          SaTimeT timeout, MDS_SEND_PRIORITY_TYPE prio);
+-
++                          SaTimeT timeout, uint32_t prio);
+ uint32_t eds_dec_subscribe_msg(NCS_UBAID *uba, long msg_hdl, uint8_t ckpt_flag);
+ 
+ uint32_t eds_dec_publish_msg(NCS_UBAID *uba, long msg_hdl, uint8_t ckpt_flag);
+--- a/src/smf/smfnd/smfnd.h
++++ b/src/smf/smfnd/smfnd.h
+@@ -76,7 +76,7 @@ extern "C" {
+ #endif
+ 
+ /* smfnd_amf.c */
+-extern uint32_t smfnd_amf_init(smfnd_cb_t *cb);
++extern SaAisErrorT smfnd_amf_init(smfnd_cb_t *cb);
+ 
+ /* smfnd_mds.c */
+ extern uint32_t smfnd_mds_init(smfnd_cb_t *cb);
diff --git a/meta-networking/recipes-daemons/opensaf/opensaf_5.22.01.bb b/meta-networking/recipes-daemons/opensaf/opensaf_5.22.01.bb
index 930755d624..3dd950c720 100644
--- a/meta-networking/recipes-daemons/opensaf/opensaf_5.22.01.bb
+++ b/meta-networking/recipes-daemons/opensaf/opensaf_5.22.01.bb
@@ -30,6 +30,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/releases/${BPN}-${PV}.tar.gz \
            file://0001-Use-correct-printf-format-for-__fsblkcnt_t.patch \
            file://0001-include-missing-array-header.patch \
            file://0002-configure-Disable-selected-warnings.patch \
+           file://0001-include-cstdint-for-uintXX_t-types.patch \
+           file://0002-Fix-Werror-enum-int-mismatch-with-gcc13.patch \
            "
 SRC_URI[sha256sum] = "f008d53c83087ce2014c6089bc4ef08e14c1b4091298b943f4ceade1aa6bf61e"
 
-- 
2.39.1


