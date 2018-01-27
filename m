Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 8D3DC78869
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Jan 2018 03:24:52 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id p1so1458401pfh.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jan 2018 19:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=vM7Tz7ePJGhMSFiGz3uEpHyJPnN71QVvrSsdetNa+60=;
	b=EyQA1flwCNjLvU2okYPoe77uumy5o2oa5KrG0DihjAi8LoL4PH6YYOpPoUyTjQRXKy
	HV5YEhqt3v87wD0E36iKEF4JDpXSlRgYBE+uLbLGbqx4YTf5ukw0GJ1ve2G/CTgXYVsg
	VtlrqFX1b6ILiP8tXZ8mejbFcS/AqEdIAqmjpcwBfMOlgBEAvyXUGTmiMVc67SO6poQH
	iqWwnlRqB5N58CQpoYDyckMEwBv76tG0tJ2Z+fR5mcg/2DP/COxCy1uvo7srgWGgLk/5
	aduF+bGvuS4gCmnyORt8prnauz3jQQPRlT55DLHf3WT70Ob73BvuKav8hYilyztuikpr
	AVBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=vM7Tz7ePJGhMSFiGz3uEpHyJPnN71QVvrSsdetNa+60=;
	b=a/RTOpUjSVCvfje6tehX3RIdYjS2eNQiPO0WIAAC0IrSLi029/h7xb2Bbg1MIiAJU7
	kBHknxUAzZ88pzpuick4E8x8vRn8mCBZ0nlUjASRw5Dwu97HRobMCxqTq52BrHUzwZUh
	AAWWTyvWx9FJR3kfcqHFjX8tcH9tOklYcB41hk/tIdl3SdMTS5H8tI1IwqV3iUkeOFs5
	8t5lPxyvdnrqGospM84SLRgxVjBGtsaxbWiNA7r5qKfLX3boIXBZpqe0rJ3L18WnK9cE
	0QOSjURdCi/A6wcpM2C2DELhvGWCoj56jgeFmbOeUX6eAVRl5ZPC7mRizXHCMuIFeY7m
	OqFw==
X-Gm-Message-State: AKwxytcLe11k/9fdnzg38l7d1M7JD6cGQb+ScnwX5SqVxd3A1zXEERQZ
	9ZhNus7AYItVPn0ITbmwL7k1Pw==
X-Google-Smtp-Source: AH8x2263MxONg4RDkP8hA7B+NWyPKe3eF8UMTTYlhuwt1m5yoMX4fC7cfXBDencQn8L6UY3A//LuwA==
X-Received: by 10.98.189.8 with SMTP id a8mr20863940pff.125.1517023493840;
	Fri, 26 Jan 2018 19:24:53 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:2999:2a82:b9b6:e74c])
	by smtp.gmail.com with ESMTPSA id
	v22sm6692206pfa.158.2018.01.26.19.24.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Jan 2018 19:24:53 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Fri, 26 Jan 2018 19:24:13 -0800
Message-Id: <4358636d29cdf59e1f18a8c24e8b48b440ac58bd.1517023286.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1517023286.git.akuster808@gmail.com>
References: <cover.1517023286.git.akuster808@gmail.com>
Subject: [PATCH 13/36] Allow native builds of python-asyn1crypto
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 27 Jan 2018 03:24:52 -0000

From: Jonathan Haigh <Jonathan.Haigh@arm.com>

Add "native" to BBCLASSEXTEND to allow native builds.

Signed-off-by: Jonathan Haigh <jonathan.haigh@arm.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit 89934c65922fca58a5e80e0e0ad9435cd457270c)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python-asn1crypto.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python-asn1crypto.inc b/meta-python/recipes-devtools/python/python-asn1crypto.inc
index 3bdb4b2..41b7342 100644
--- a/meta-python/recipes-devtools/python/python-asn1crypto.inc
+++ b/meta-python/recipes-devtools/python/python-asn1crypto.inc
@@ -10,3 +10,4 @@ SRC_URI[md5sum] = "97d54665c397b72b165768398dfdd876"
 SRC_URI[sha256sum] = "0874981329cfebb366d6584c3d16e913f2a0eb026c9463efcc4aaf42a9d94d70"
 
 inherit pypi
+BBCLASSEXTEND = "native"
-- 
2.7.4


