Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19430.1793108990083882687
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 06:49:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=NxunSyQ/;
 spf=pass (domain: konsulko.com, ip: 209.85.128.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so23757405e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 06:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793108988; x=1793713788; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L6l32avuPbZLSsKXzM0Um+RGmeCrG0ZtIa4adp7yX3I=;
        b=NxunSyQ/QGQX1QGt6njxfXhDq93aC60KTivO4/CeOktGicBcJDtxEpOcPhfm48kHVv
         rndbMxJ6VBi+mH+g6C95wcQwI/qKNswG/UW74dEL2I5IqJCg/cxGpP9uaUhlla33hR3R
         VBBC/yjBXlI0y/ZOHyxbYwj3hshkDmsvnTdZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793108988; x=1793713788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L6l32avuPbZLSsKXzM0Um+RGmeCrG0ZtIa4adp7yX3I=;
        b=KPxMt+WLAngXowJHtKqQi2lICwK2ygW+8B+RHrHjRwcXdyhUFa+tMiumqnd71LykOM
         HWcfpg9dNSXjfjcBw5JtDU1UYPsYJsiNcXksDjC6ltDHgOcHy1yIRQNSuT1NCoOKrksJ
         Rw22v6WCmlGo6jtLsD9kSdW+EELIkQO3Fjt3FhkMuVhyoN8FM+E6+URTaz8e2e1n9yuy
         tDc0MDQcwDbmJ9+gIB934hQ+pDJNsTFpZrBpWXHW9NkRvnYMRLIvfGLqYVcy3H/MQPKz
         Y3hZsV81WBGYm/DMiNpAwldxrwlA52wkZSnmc3GdTG4GTrz9maTgH5EozadGvX1bhx0F
         L1kQ==
X-Gm-Message-State: AFq9FYLjLr1qzdJvc3ZQfikMcakMol28yBxCLYUJh4qsfar25scG2JhP
	pa/D4rf+e+bJUJk+XPOrV6qTCS5/RzfVdlem77Ablh97Knmj7cdroNl/93kshc2XdlTZQf3aqmq
	/YymL
X-Gm-Gg: AYBFou1NvxMN5yzUPVnOZ8Y9niUq/dc7gLIyJOE3oUGWVhqin0+L9ROm8+W/gZTCN2Y
	9TKBTWjGHWNT4J1yjcNt93ifdQNm5xcTo1TW2p+yMnOl6orTC4HM4lf0TeKAu6/UhyqwE2AptqA
	2AxliUoAQIceUKckGGiido2lJJh4MmKhcyW6eIVP0/4/UPP73yunt7fEVYcarzDzq5mBSAc3Ine
	Hq/n5R/N0hZdkh6+bxWNq7a4WTXLefp9R1jfbYnRZVOB/QPaesxs2sK5nDRQaw/ovzAVvoREmBV
	HEvcPyV9x3aCwSYfRWSbYJWWBBNr5iwebO2zQfHUHdJyc4ZM6v/ZZgn+2lhNHyEE89GR6Qhd8+n
	PoYB8nz/IcMVJI/OtApY9Ze4XTbgr3R908IdowG1umXFlj6ZNLg5sA0CDFkrdAkOcRsKYxmhxTG
	6ulGfXjmcmDGBoVgVC8Mly407fZRFLgkpkDjF/urNObW3yZXwxAXoOPbhOPq0rvVq4IxzreW0lX
	QmwtBu+WT3ltsFA2unh51kt6rkKWrZrEvOT3YtX/ma9rMuadt2y3Jknh0mrVXW/ZLiR+a4yWrJF
	ZO9n4AQ4fuQ2aksSK9tFJen5/jdR5qT4A8knJECVRU94EmKwZq9RerDs1xrseFuxMTYU6W/HrED
	tbIQYQXkQvZVZih/E2pkXG9EhvoA=
X-Received: by 2002:a05:600c:c171:b0:4a2:191f:7cb8 with SMTP id 5b1f17b1804b1-4a35ac94717mr187576245e9.17.1793108988256;
        Tue, 27 Oct 2026 06:49:48 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0bae01sm330941335e9.7.2026.10.27.06.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:49:47 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-networking][PATCH 2/7] libdaq: Upgrade 3.0.27 -> 3.0.28
Date: Tue, 27 Oct 2026 15:49:38 +0200
Message-ID: <20261027134943.1011404-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027134943.1011404-1-leon.anavi@konsulko.com>
References: <20261027134943.1011404-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 13:49:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131531
Content-Type: text/plain; charset="utf-8"

Upgrade to release 3.0.28:

- api: add DIOCTL_GET_DAQ_COUNTERS_SUMMARY for generic DAQ counter
  export
- api: QinQ outer vlan tag addition
- build: add fourth digit to daq version field
- daq: add drop_reason_str to DAQ_FlowStats_t

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../daq/libdaq/0001-example-Use-lm-for-the-fst-module.patch  | 5 +----
 .../daq/{libdaq_3.0.27.bb => libdaq_3.0.28.bb}               | 2 +-
 2 files changed, 2 insertions(+), 5 deletions(-)
 rename meta-networking/recipes-connectivity/daq/{libdaq_3.0.27.bb => libdaq_3.0.28.bb} (92%)

diff --git a/meta-networking/recipes-connectivity/daq/libdaq/0001-example-Use-lm-for-the-fst-module.patch b/meta-networking/recipes-connectivity/daq/libdaq/0001-example-Use-lm-for-the-fst-module.patch
index 7147c042a1..73215feaeb 100644
--- a/meta-networking/recipes-connectivity/daq/libdaq/0001-example-Use-lm-for-the-fst-module.patch
+++ b/meta-networking/recipes-connectivity/daq/libdaq/0001-example-Use-lm-for-the-fst-module.patch
@@ -1,4 +1,4 @@
-From 9357da2a5a829f7a0620e6c19835a65b7b02a8fb Mon Sep 17 00:00:00 2001
+From f85305b5185215962197f192faf45b1202e27e45 Mon Sep 17 00:00:00 2001
 From: Khawaja Shaheryar <behzadshaheryar@gmail.com>
 Date: Tue, 20 Feb 2024 21:03:26 +0500
 Subject: [PATCH] example: Use -lm for the fst module
@@ -27,6 +27,3 @@ index 0d5ca31..1eaa9e8 100644
  endif
  if BUILD_NETMAP_MODULE
  daqtest_static_CFLAGS += -DBUILD_NETMAP_MODULE
--- 
-2.34.1
-
diff --git a/meta-networking/recipes-connectivity/daq/libdaq_3.0.27.bb b/meta-networking/recipes-connectivity/daq/libdaq_3.0.28.bb
similarity index 92%
rename from meta-networking/recipes-connectivity/daq/libdaq_3.0.27.bb
rename to meta-networking/recipes-connectivity/daq/libdaq_3.0.28.bb
index fb45ad74b3..c9231100f8 100644
--- a/meta-networking/recipes-connectivity/daq/libdaq_3.0.27.bb
+++ b/meta-networking/recipes-connectivity/daq/libdaq_3.0.28.bb
@@ -12,7 +12,7 @@ inherit autotools pkgconfig
 SRC_URI = "git://github.com/snort3/libdaq.git;protocol=https;branch=master;tag=v${PV} \
            file://0001-example-Use-lm-for-the-fst-module.patch"
 
-SRCREV = "959b13d76aa3409acadfe22d1c30864698a297a7"
+SRCREV = "6e76888ae8ddc5dae1eb110363f2254d0f701b32"
 
 
 FILES:${PN} += "${libdir}/daq/*.so"
-- 
2.47.3

