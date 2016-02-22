Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id 48496771A3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 13:35:35 +0000 (UTC)
Received: by mail-qg0-f54.google.com with SMTP id y9so111993296qgd.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 05:35:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6bbJwBDw+B6EU8bi+q2/CH4ug3tHdVC2kxpffrqdmaM=;
	b=ld2vutnIJs0jOLjJro9Qawc2139uYlTtHpaJn4SslnmqMBO63E96C9hlagFeFYr+iT
	v2tMFCGJOPi2z8I8oX9bVsQU35mLvobeqpqby/IJKn+6s28LwBGyBp45qMd9amOheb8w
	ecwO3sibO79Kr2GIges0B+48NUkK1DN0jtbB5uTUVlVN9JL9vG2TLlNpf9HGsYQ/kxP2
	T/O+7RRdIaIwFt2M1R0zs9s0a/5gp7NFfUzkeZPl72sRTLccCz5UXrkoW8+uB64cmUgX
	SLuaqwPkQW94kxFlrLzUHcSToxcPNHgRBfDklQefxPuh6HajSWoWE3lKXesQ6VlmlM6Q
	/Lpw==
X-Gm-Message-State: AG10YOSxf8D0uBNNhmq7K/ITo2rl4oiu2rHvjoJC+m2EYkXdTeIsLm3stRRQActOPUQqfA==
X-Received: by 10.140.143.134 with SMTP id 128mr1842893qhp.25.1456148135931;
	Mon, 22 Feb 2016 05:35:35 -0800 (PST)
Received: from localhost.localdomain ([96.91.222.230])
	by smtp.gmail.com with ESMTPSA id w1sm10232368qha.3.2016.02.22.05.35.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Feb 2016 05:35:35 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Feb 2016 08:35:03 -0500
Message-Id: <1456148105-9644-9-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1456148105-9644-1-git-send-email-derek@asterius.io>
References: <1456148105-9644-1-git-send-email-derek@asterius.io>
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH 09/11] python-monotonic: update to 0.6
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
X-List-Received-Date: Mon, 22 Feb 2016 13:35:37 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-monotonic_0.4.bb => python-monotonic_0.6.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-monotonic_0.4.bb => python-monotonic_0.6.bb} (64%)

diff --git a/meta-python/recipes-devtools/python/python-monotonic_0.4.bb b/meta-python/recipes-devtools/python/python-monotonic_0.6.bb
similarity index 64%
rename from meta-python/recipes-devtools/python/python-monotonic_0.4.bb
rename to meta-python/recipes-devtools/python/python-monotonic_0.6.bb
index 875dee2..40207bf 100644
--- a/meta-python/recipes-devtools/python/python-monotonic_0.4.bb
+++ b/meta-python/recipes-devtools/python/python-monotonic_0.6.bb
@@ -2,8 +2,8 @@ SUMMARY = "An implementation of time.monotonic() for Python 2.0 through 3.2"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
 
-SRC_URI[md5sum] = "1919cc3aff2a1b907fe24c1f801343ef"
-SRC_URI[sha256sum] = "852f656adbf623ee859def6ca2f5498f4cae3256f8320d5c50570ee8a0592ab6"
+SRC_URI[md5sum] = "2f77ba5a56051b0442b1c74fd05dafb5"
+SRC_URI[sha256sum] = "2bc780a16024427cb4bfbfff77ed328484cf6937a787cc50055b83b13b653e74"
 
 inherit pypi setuptools
 
-- 
1.9.1


