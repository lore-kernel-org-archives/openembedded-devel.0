Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55349CCD1BF
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 20:28:41 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.19694.1761683312386716656
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Oct 2025 13:28:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Fr7vIGxT;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47117f92e32so58850435e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 13:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761683311; x=1762288111; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=3qslUzpMGp1Q+gvnbjlR/4BOWlXO9l5RzjQnkWIAfAM=;
        b=Fr7vIGxTrxP2x/tj52cuweaXNgul/UmyhHlmPDmLN4tp9pdh+Sbxz0zbxlL3QzwFwl
         aYAXg9bkAgTg6Es/Hr/GgPNCxTMVZ4J4/zp2gzFNn5v9ECp7FhYf0MOJSz/KXAhs12nY
         VrBdL82rYSQhL2WDGa0Ww0Pa7pigND+SqT1eiAthlxn3M3B5ZkPH4kegoBCEABgfw0nW
         NA4koi3vFjWL98muowAAf7A5E59z7AGlpsiO3VANeUTTDAkLFDyzk+Xaz35rSd18Ewi4
         pux5XULWaoyMU/j2ey068SQJxSZm35aqvwKYidOtFatERGnRXjTDOM2LqxsizaCI5Sq4
         /M0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761683311; x=1762288111;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3qslUzpMGp1Q+gvnbjlR/4BOWlXO9l5RzjQnkWIAfAM=;
        b=Plx7Kos1Ysll2Leq/FQY8EOLmw2IWvsgXe39s4x0SU59zgrIPoMLfXXgz3ZOzFOSY3
         2w0QA/WyNqJWL9zrF8Qdz6dds+iX1k8UmhLCUlDTs88iQKNsxI54+ZcWJJRJK5sO1ekW
         gGITciQbKm6qvxkLiDo4GjZeVGMrK7Eu9XE4meKQdxNSz1Ye0bLzMtXgp4RAF0ABgFS2
         XbFX4xAsPGFP3OL7CnWpicobMvMXL8MM1OOiJE+vVxCmX5Qjq/LqXJPgh0GWjSJbuVbL
         S8qbAOcIO1SRzSjoKYfnkh3mDZHyqlXwL2np2pff6hUeKsu9eCkQowIaPG9wtlMxoGEM
         Gxyg==
X-Gm-Message-State: AOJu0YxLgLQXbLHQ1YXkkW503/sWWu1C2A3qSUDjLMTZIpmBTEquk0Kt
	URPIvXX3fjexaRXxYgSSORq2H3mHPthh+lojZCLoLeZsk/kD+s1fCiFDPtvp6ct/
X-Gm-Gg: ASbGncujljQ2Gp64lSSSfwEp0ice15+kjHMejZQR7vr6ihI8VRIJLMwc7a7DYaasu1H
	E28zn+V48hv1zP30DSxAyLU2no8yI1sNIWAwpD1Tz6XkHLC7X2yKnwTzP1vvnduSd1mYptAnanB
	6ZFjcwFTc9iOggnrYUB2iPyEKaBtw8ybO19nfTEExulgHHUfjFSWOolXI3KwixLCIyaE10dyT20
	JaWN+afIufa5j90oAHPVXG+/qUK/DjpKXgYuZMpOZtOZj1L09T6Ud3OA+FAgqyLaW0Z2pbWDvYA
	Ns2ylMn92EggnGFjTq9wKxbWveUVEIDRXHnr6AsH7r2Ep4NHJ3rKSAIwf1NcghtiRkTeJjBL6HT
	zWcgiMMFudRKH4Murgq6AyWsGRMZObuLx9A4UYpBEJRjnoVRcS1aplhaYF3gMOA0xnbHonvGMfA
	==
X-Google-Smtp-Source: AGHT+IF49B04V6SRhkv1XtPzYCjLJeTDvIgTmj3YxgI2jgGwmjh8UTMI3ErIjITJ4h31+kt77Jm8pA==
X-Received: by 2002:a05:600c:4e8f:b0:475:f16f:6f44 with SMTP id 5b1f17b1804b1-4771e3ac8eemr5673595e9.27.1761683310475;
        Tue, 28 Oct 2025 13:28:30 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4771e3a88fdsm10093355e9.10.2025.10.28.13.28.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 13:28:29 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 1/3] openl2tp: Fix ptests
Date: Tue, 28 Oct 2025 21:28:27 +0100
Message-ID: <20251028202829.2311091-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 20:28:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121099

From: Khem Raj <raj.khem@gmail.com>

- Detect active network interface to use, instead of asking user, this needs
  to run in automation
- Find the location of ppp_null.so with find instead of rpm, rpm is a distro choice
  it can be assumed to be always there.
- Add missing runtime deps for ptests
- Kill openl2tpd started by run-ptest script before exiting, otherwise
  ptest runner hangs forever.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d30427f475f273ab8c5dd83b2c076bb4fc8a9a82)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-protocols/openl2tp/openl2tp/run-ptest          | 7 +++----
 meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb | 1 +
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp/run-ptest b/meta-networking/recipes-protocols/openl2tp/openl2tp/run-ptest
index 01c9c7b447..b8fb08b758 100644
--- a/meta-networking/recipes-protocols/openl2tp/openl2tp/run-ptest
+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp/run-ptest
@@ -30,9 +30,7 @@ else
 fi
 
 #read -p "Please input the network interface you use to test(such as eth0, em1 etc):" ETH_TEST
-echo "Please input the network interface you use to test(such as eth0, em1 etc):"
-read ETH_TEST > /dev/null
-
+ETH_TEST=`ip route get 8.8.8.8 | awk -- '{print $5}'`
 if [ x"$ETH_TEST" = x ]; then
     exit_cus "The network interface cannot be null" 1
 fi
@@ -73,7 +71,7 @@ lsmod | grep l2tp_ppp > /dev/null || exit_cus "FAIL: Load module l2tp_ppp" 2
 
 # start openl2tpd
 ps aux | grep openl2tpd | grep -v grep > /dev/null && killall openl2tpd > /dev/null
-ppp_path=`rpm -ql openl2tp | grep ppp_null.so`
+ppp_path=`find / -name ppp_null.so`
 echo "test it here"
 /usr/sbin/openl2tpd -d all -D -f -p ${ppp_path} &  > /dev/null
 
@@ -95,3 +93,4 @@ else
 fi
 
 restore_file
+ps aux | grep openl2tpd | grep -v grep > /dev/null && killall openl2tpd > /dev/null
diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb b/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
index 15cebf40f1..fe6abf5b55 100644
--- a/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
@@ -92,3 +92,4 @@ do_install_ptest () {
 }
 
 RDEPENDS:${PN} = "ppp ppp-l2tp bash"
+RDEPENDS:${PN}-ptest += "rpcbind kernel-module-l2tp-ppp procps-ps tcl"

