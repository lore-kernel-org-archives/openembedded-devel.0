Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3280.1793581222456881892
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Nov 2026 17:00:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=YL53/mbg;
 spf=pass (domain: gmail.com, ip: 74.125.82.173, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36a315ed211so3030544eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 01 Nov 2026 17:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793581222; x=1794186022; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jvg/foa8v9KD4v8HxU1vK0rYeBumOiD6wmkK/eh3QYg=;
        b=YL53/mbg2r130GWHFarlusZtE6dJls5SQaSe9ghTzH76R6+ZcOrsLbpejPYSEhF0G3
         QUmKAbwWhetJJLuuWKyEaYG0U6DReeGxhDMu+f0tnknfEaMme2/qeNHB4gKLeoljhPSl
         muhp68pYxE5C0MWaJ5CsYHOT0Wa+UxVRSHgZjnhLc4ZasC4qYxEMtXO1LlGZmYj5aDX+
         z1ESpZ3t1vZCMK/KSuJtqlb75k5WS7nkA+ERMZU1G1UqUx1CtsoIBmwSZz+EfahXZh7W
         7wxcw7NiqQAp+SjyH8n7W89OL7dGRRiY1lG5EpnAtwHSnkalg9rxRBHayXYIQGDSHbA7
         Yelw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793581222; x=1794186022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jvg/foa8v9KD4v8HxU1vK0rYeBumOiD6wmkK/eh3QYg=;
        b=zEweN4T55YipR3ih0sx0sFVloWG/LSp35eumLF2U3hENOeswd71qCY3t5JsC3RZt5f
         XdPtPE1WmvxFu7bglSduKakLUETT4Ga7DnYKN22/V57bEnI6MzvtOmpHpALN83974j9e
         5i0jDnqf1QKmSGi8pdiK1mfr7v3AnjTkp8wEdXAGC6Yg3+DE+Mjql9SpkW+3YVIoXMcF
         kyUCG2ELDgxSLhOFYan3Rj2S3WF6S/9cKFqRkP4evnIiRdlLNoBvWHlUXa77R2Yg0Xgb
         xDuDSM0zPd0m6/Hs2jAHOKLmCWSdHLT6j3A9XoilJR4HCn+ZYkpspIulMcahMlTHWTZu
         NaZg==
X-Gm-Message-State: APuU4Z+UFLa39rEZitle6LJBySBsSHHzryC1FPSUwRneuVHohW7cWy6U
	PEYs6AZckFpqoDftUbrLJlaXeX0KgBolu1S8jebMXNXdQrJk24cQK3UnfzLwN4iyJEA=
X-Gm-Gg: AYBFou0w1KH32nV203rD0gYByYrP0AWH9Mm2Ev3qqUwpmBsY9CHnLtkmss7dUEWP/Je
	1uuBi1h61qYqJggGYc8MYSum4X1TSqin8NsqGs1gRUwAbWukmw/oI95ID5d1ceNzip7ltQxVKQn
	PQwLJS/gz97zHFD7OVKqrlKPvT3eT4h31ZO+WEr6V3rduMs4lIbx/lYCDJ9IXbtE3MMYW3es3jE
	uFm9qNMSLmuqm1opcVH9MxrGk4vYVwwFO15EPW8Aeo0GckOq3xrZ48WOZX5Xqd2ILLwi/xRDOHk
	a0TCeNaUpVUEh3jFdGsxYGcp83et5RqUDLyauOX26Cu6KeofqriYFl6r549yQ6nukVb2wojZlru
	TQw1LmfWj9VdtJSUjrBcjcaGX4FJPjS+JMZ4R4tDTf9xS2KdGcV5qZp07VQen3aizlOqg1MWQ3m
	gBLDFkC5+j4iRP0JwOE+lCWmRv7URS0JkfRyMn463W+wQXaXYzUEfxKeFqTA+61UcedscDm/kgE
	iihfXany4oC3jAx43O/NMZo0s6x6ftKUzG0R5nDFQ7Hq2NexjcHEGzv4PEzokM3+lbCFZ2xtn+Y
	YWTwBs2x0337/zYM8S5DfgxVrGKxZrLjbBfZbOC6jV/vvZ/3e1sXU7zTwuIv8m5eIf98Kpuj129
	JrX7BTmqwlwNLuMnTcDsdLCcDQZdk6fpLqQY71/RaaWL8GSVoKskh4QRJhH4TTayFccSisW+wAP
	TI7DpbszCiFfSYaXxVw/uLc8DwuvFO3dUEqZ3YMIlvr5Vbxr/+IPb/qVz4l+L3Ymsw+thua7U4W
	GzQPjqC7VDvULY5S4YKBkJbMqvfeqfEQmGPTM97SZVX3Ye4p8KrjME6beeRkaxsp2vJuS14w84d
	cjz4ToM9JD4f5Nw7L0PU6zWEDw==
X-Received: by 2002:a05:693c:880f:10b0:364:377c:cabe with SMTP id 5a478bee46e88-36a30078819mr16170984eec.24.1793581219085;
        Sun, 01 Nov 2026 17:00:19 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a61a0csm37163054eec.22.2026.11.01.17.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 17:00:18 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH] bearssl: Upgrade to tip of trunk
Date: Sun,  1 Nov 2026 17:00:15 -0800
Message-ID: <20261102010015.2796251-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 02 Nov 2026 01:00:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131734
Content-Type: text/plain; charset="utf-8"

Brings following changes

3c04036 Fix: make static ECDH selectable with the br_ssl_client_set_single_ec() helper function.
3d9be2f Added dependencies to better support parallel or shuffled compilation.
3479195 Fixed chunked decoding in case of errors (if decoding failed at some point, subsequent chunks should be ignored, trying to reenter the decoder after a failure is a recipe for Bad Thing). Impacted functions were not used over malicious on-the-wire data for "normal" SSL/TLS usage.
8f795e5 Fixed Makefile dependencies.
7bea48e Fixed bug in handling incoming records with invalid length (impacted CBC encryption with 3DES or with the aes_small or aes_big AES implementations; only 3DES was selectable by default).

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb b/meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb
index 561edb48e7..b61dbfa59f 100644
--- a/meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb
+++ b/meta-networking/recipes-connectivity/bearssl/bearssl_0.6.bb
@@ -24,7 +24,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1fc37e1037ae673975fbcb96a98f7191"

 PV .= "+git"
-SRCREV = "79c060eea3eea1257797f15ea1608a9a9923aa6f"
+SRCREV = "7bea48e5e850ab4cafbe68d3765cdaba13a86d6f"
 SRC_URI = "git://www.bearssl.org/git/BearSSL;protocol=https;branch=master \
            file://0002-test-test_x509.c-fix-potential-overflow-issue.patch \
            "
