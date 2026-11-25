Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37919.1795594064333404990
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 00:07:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Ic1AW4r3;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-38644aedba1so8366894eec.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594064; x=1796198864; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lahS4CoQ5/fNaX4cJZlcZupae23gBXDbB+6Oa3asNVA=;
        b=Ic1AW4r3gjcWi1jQqqZfaAhCQdbfJbIMObbNdxtxDwkzRnctK4fPyDfON2fPkRfzgv
         5wb/+ocQPUhZEJBy8nnbx64kKeVOozF1MhbWpuxtTAnYxfg00n9BgY+mEEyNK0NLQ1ri
         QWwk4IU3EJjt5AlSSEXqz2qgv4gxsTZuPC/q2qUG+7JVbzJ+ZbQNhMIsTMkk73RQZJvx
         xeuKCUIhY7LFzW0KtRvz3a/YQS5pK62Ks7vG0XLi2Jdwh9CmUUVGi/WovlQn+m8M9gHK
         x5uhNxlchOKORh2RILDfsGRPjcJ1nFo5ovZQCsDOa+6IORkDn2ysP3Vgg9L47kGP+I9N
         HoMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594064; x=1796198864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lahS4CoQ5/fNaX4cJZlcZupae23gBXDbB+6Oa3asNVA=;
        b=KGYBZmjI4D0bwlmz4JX/pG8MkaRcX4xx77JgcePSw5HFgSyrR4296ooP2EImEJPujb
         8D+zT/tGER2zb/+0vJecsubRtECRXFZDvvdnqaarbZOskmj1FJKUaBi0S8xH7x4TqpM7
         2loPlFn/2KFfilMI4HKYZL9HLQdrrXMR5Cd4mxBJJ6W+Tg5hkD0PeKtcD5mojaW6ps22
         OfpvNk1+swFnwWOVc3SwLkkahtytKUp23YlJ3Bgo+yySKxO1+APPZr6QFpPDLeNRO/7/
         bSd7MLAy6USzaEaS3k1VzG2JOevErFPGGExJv0H0lmINV1DgITumCtpV1/hDC+FhTPlN
         GOXg==
X-Gm-Message-State: APuU4Z+tXOm/jrSf16FR7cWqAVmzzVKxi2wlrFSnpS3cdABzOHP877VF
	+NRQ/f3M9jz9o4Gc8p2cYtadSN5CM9UljPVC/269PtixuHTZ5Oghhm4BWPDE1qcV
X-Gm-Gg: AZFdTZcFIX67CQM92jfM0o7U3OS3TZwGan4mb3xu22/4wSVSDnDP6K/QhHhfeqyQv3H
	NhOivQMgzZlM2/I/Eix8y41Iwlc/R8Y3SPhjhgH2TcPDVLg3iF/ea8myc+dYLvhH8cotA4dhY1C
	QAal4gR2Vnfr9f13M+wJ30yRHZ+EewOr93QcRmYmJZ7WpEyiLjTPnbfrtJ4xXlmVoRfUOQWtVMF
	Ke3ddJZeGXu6retDC87nGoXGLcnBdZX6KgGXOy/JSQNOerN+khsTN+eVODTMaGNYFVoChZgV3R/
	dZMau1xLxiWXqG1Lzr59h5zVYgMVGxe7uM01IlBzC+hnanafGPvE5wQgq4S37m2m+Dl1mfwfLlT
	xcT3dLbPxvJ0ZYTIEVYTxpdjgeYz7MH9h3tiAyEskMXf+QUvfFCHv0gRmKuIP4jthF9cNMwSPWH
	hZZJo4Ys+xNqAmyta+AhdRiRb+O1sQ7VJfTalJQam3hzk/2PDQ7IZSuAkPebSoxXm7380cTQ/H+
	aQiWAAIBEAuhjX5+sFIHlusnnXyndTjl0jXnqAV9hGa8nhL/oIPR2tKszilyeazP6stwPGuten4
	mrATvbinXjzUyQnXH8gGmL/wxqRHwqaQW6N8MBfdUYAWjBfXdVX+EVYGvgrN1/1EeD+8v7YYKVe
	FXjrY3ALkGT/+ooWonncFezwzaIDfdYFLoUnakoZcroSFvhqSQ/Be8c785jS69gZkN9vF691nBb
	zIAS34b3YidJoREAjm60ZlvQOz0STOK2dWYBC6Rpyz+JtSMM3716LH4imloehZzDUn24YOsXj8t
	pwnyVZHraG+wR0vUX45y4d56WtHiYPDvMxWRNLRfNEOiybt8jmehOFKAeG9hrrHD/PJoFY3u/YM
	C8MY
X-Received: by 2002:a05:693c:414d:20b0:386:9f89:aa80 with SMTP id 5a478bee46e88-3869f89aee3mr12895104eec.0.1795594063591;
        Wed, 25 Nov 2026 00:07:43 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm90997971eec.3.2026.11.25.00.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:07:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 4/5] arno-iptables-firewall: Fix upstream version check
Date: Wed, 25 Nov 2026 00:06:15 -0800
Message-ID: <20261125080732.2419614-5-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
References: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 08:07:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133002
Content-Type: text/plain; charset="utf-8"

UPSTREAM_CHECK_GITTAGREGEX requires a letter suffix, so plain release
tags such as 2.1.3 are never considered and the check stops at 2.1.2a.
Make the suffix optional and anchor the regex so the whole tag has to
match. The check now reports 2.1.3.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../arno-iptables-firewall/arno-iptables-firewall_2.1.2a.bb     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.1.2a.bb b/meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.1.2a.bb
index bd7f7a992e..4a6b601c56 100644
--- a/meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.1.2a.bb
+++ b/meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.1.2a.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://gpl_license.txt;md5=11c7b65c4a4acb9d5175f7e9bf99c403"
 SRCREV = "4651194df5f985ebfc989da0a20d62b9baecf314"
 SRC_URI = "git://github.com/arno-iptables-firewall/aif;branch=master;protocol=https;tag=${PV}"
 
-UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+(?:[a-z]))"
+UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+[a-z]?)$"
 
 inherit systemd
 
