Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B1DED2B956
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:36:50 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web11.19496.1730817401322609010
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:36:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RzoH0mLx;
 spf=pass (domain: gmail.com, ip: 209.85.219.169, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e0875f1e9edso6980712276.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817400; x=1731422200; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eIhGm2xu2UYzxf8f6jUwi3RX+8As2JiRMMAVMo7gOiM=;
        b=RzoH0mLx1Xex0JjzbDgp9X0o/lHAV3fUwlQk5Wz+bL9TeIMmzs76JG9WzDbZZ3L97F
         CvYqlUUL+kXT1Rcbw+EYuFtDyJfdiJiC0QsB/ZYXNPZ4cQ1RCNmwGHqOa03wFAKa/uah
         EdKRk9TF9PppXhrAA00Yn91PmqYO9AY4+NqW708FgRcHfEJGfalk52UZAE4Uc+5bLZhV
         Dx6udFA0FAPCBMfh6ryumYVCKRQF9Ni8l2D7/shIkNL/Na6lwOt1OUcgUHilxloMeHBu
         bOv+gfG2ZFukNXZtyI7/EWSfrMH5OAjT/Arz//JIo0GmsBY+g37nqEc2T3FhqZMkrbbW
         bdow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817400; x=1731422200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eIhGm2xu2UYzxf8f6jUwi3RX+8As2JiRMMAVMo7gOiM=;
        b=dj62cCT8Vv5xchBvlsBFXZKwyzztpLD/LmOqtgShNJvUZpIo2eGwNuGVu8gaMxoYVJ
         HGPb7FK3fL14kUS4h4exiAPxekwYz32bRZwfWU0Te3Y5D3KMCVaw1ljXQlMj6dpkRzG0
         ATU/5EGiBqoQ0RdPqcdWqSoauSaYTA+rnP7rRSBNPkHFej+bETnUD+MbsODkMkymrP5I
         P7/fJaihvMRMPf1n8wwCacElYV73vi+7K7YO2RgBT1xSmB4faG/cn1+4v3tgMPb+kEvM
         nE3w2PeAO9RaqXzFluDw9/2r6ypNGGsfwRtukJQCBoufgRmJhusgZJsHsOgFfpOd5IaH
         Z1rA==
X-Gm-Message-State: AOJu0YxoRmxBYeXngC+NA4mNj2v23Vg5IbYdUmiwPCWzeNhNN1ueGMnY
	uwHvoLtb4iHwDc35WYQsxB+I59lo1udyzu5AXVdLvTRLgSAEzmPiwGMLog==
X-Google-Smtp-Source: AGHT+IFOQkx6NF0ZM4Fos3S5Yd5AeN622OicRgJuLYj+jg7fw1IOEedVL3DweF5Vj1WflI6gBKPDFQ==
X-Received: by 2002:a05:690c:ed3:b0:6e2:1527:446b with SMTP id 00721157ae682-6e9d896200bmr336844687b3.3.1730817400330;
        Tue, 05 Nov 2024 06:36:40 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:36:40 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 01/90] bdwgc: upgrade 8.2.6 -> 8.2.8
Date: Tue,  5 Nov 2024 09:34:26 -0500
Message-ID: <20241105143638.2301245-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:36:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113419

From: Wang Mingyu <wangmy@fujitsu.com>

Chaneglog:
=========
* Allow GC_size() argument to be null
* Disable backtrace saving at garbage collections if DONT_SAVE_TO_LAST_STACK
* Eliminate 'cast signed to bigger unsigned' CSA warnings in GC_find_limit
* Eliminate 'x might be clobbered by longjmp' gcc warning in setjmp_t.c
* Fix 'un-mprotect vdb failed' abort with out-of-memory reason on Linux
* Fix ADD_CALL_CHAIN() placement to follow GC_store_debug_info_inner call
* Fix GC_debug_realloc to support custom kind
* Fix GC_is_visible for case of arg pointing exactly to object upper bound
* Fix GC_print_trace_inner to print the last element of the circular buffer
* Fix cordtst2.tmp file deletion in cordtest on Windows
* Fix double lock in GC_malloc called from backtrace()
* Fix handling of page-unaligned boundaries in soft_set_grungy_pages
* Fix heap blocks size computation by GC_get_memory_use
* Fix indent of a closing curly braces in GC_apply_to_all_blocks
* Fix infinite resend lost signals if a thread is restarted by SIGQUIT
* Fix null pointer dereference in GC_is_visible if type_descr is null
* Fix per_object_helper() after changing hb_sz units
* Fix pointer relational comparison in GC_do_enumerate_reachable_objects
* Fix poor thread-local allocation performance because of double EXTRA_BYTES
* Fix potential GC_add_roots_inner call with an overflowed pointer (Win32)
* Fix potential address overflow in GC_add_to_heap
* Fix potential buffer overrun during read in GC_text_mapping
* Fix various typos in comments
* Prevent GC_noop_sink from scanning by the collector
* Prevent redirected malloc call from a garbage collection routine
* Redirect malloc_usable_size() in leak_detector.h
* Remove redundant dirty/reachable_here calls in GC_malloc_explicitly_typed
* Update and fix diagrams describing the tree structure for pointer lookups
* Use atomic store to set GC_first_nonempty in GC_do_parallel_mark
* Use atomic store to set entry id and update cache_ptr in slow_getspecific
* Workaround '.obj file not found' error reported by watcom wlib

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-support/bdwgc/{bdwgc_8.2.6.bb => bdwgc_8.2.8.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/bdwgc/{bdwgc_8.2.6.bb => bdwgc_8.2.8.bb} (96%)

diff --git a/meta-oe/recipes-support/bdwgc/bdwgc_8.2.6.bb b/meta-oe/recipes-support/bdwgc/bdwgc_8.2.8.bb
similarity index 96%
rename from meta-oe/recipes-support/bdwgc/bdwgc_8.2.6.bb
rename to meta-oe/recipes-support/bdwgc/bdwgc_8.2.8.bb
index a5a7a63657..fe51c1029d 100644
--- a/meta-oe/recipes-support/bdwgc/bdwgc_8.2.6.bb
+++ b/meta-oe/recipes-support/bdwgc/bdwgc_8.2.8.bb
@@ -23,7 +23,7 @@ LIC_FILES_CHKSUM = "file://README.QUICK;md5=dd27361ad00943bb27bc3e0589037075"
 
 DEPENDS = "libatomic-ops"
 
-SRCREV = "e340b2e869e02718de9c9d7fa440ef4b35785388"
+SRCREV = "ee59af3722e56de8404de6cd0c21c2493cc4d855"
 SRC_URI = "git://github.com/ivmai/bdwgc.git;branch=release-8_2;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.43.0


