Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 46339786BB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jan 2018 09:14:11 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id t74so332199wme.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jan 2018 01:14:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=2nYdMTSV4dL4cGKTkycIdPTqpTOW+b0/dirYzcFy4uw=;
	b=kIVxkyvZ0w+ZYSrkDLhychIj79D9snjgjqNVc/Y5j/a0P8QOUkjIrVV2grv9Wy1tdL
	CEEeEySDKPtU6tb3BkWe0mz5lWcCPTNLoEQSNshp8yHoU3bL2P+/9XZd1ICFDJglfAN4
	5otOaFrvqxSNiMOM3foesOewGzZVpuYS82UzGxMS7Xuh0sz1DPH2bl8pAiLQQR6V3ygL
	hBpdL5nQQYWiZovHGR4kiHyy9WCEDIi4ctxBa8a9RKDtq77FONPhOnqOxy4kmoP8hJDI
	iv0ZB0ShkycOxmCUX7ey2ggtTVfTjXdgVkyo+xOue5/YLpKXFQQintLb+REmBZ3vtUhb
	peVQ==
X-Gm-Message-State: AKGB3mKrD0xFwl1oA1GDi6G2cEzHMVQSRZUc1Pnr9LngZjbUvT8Y4puo
	YrgxYGt6LFYNHpYPxTMGB8j/j14V
X-Google-Smtp-Source: ACJfBou7q6NaZm8yB68YCVTCKWovpv/jlmyOpfYuemeA3IbcTwmaFGhg4aToM9X4IXmwRyKIzad0mQ==
X-Received: by 10.80.179.188 with SMTP id s57mr46047909edd.1.1516007652710;
	Mon, 15 Jan 2018 01:14:12 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	d3sm17254591edc.15.2018.01.15.01.14.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Jan 2018 01:14:12 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Jan 2018 09:14:04 +0000
Message-Id: <20180115091408.1133-4-git@andred.net>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180115091408.1133-1-git@andred.net>
References: <20180115091408.1133-1-git@andred.net>
MIME-Version: 1.0
Subject: [meta-python][PATCH 4/8] python-parse: use beginline= in LIC_FILES_CHKSUM
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
X-List-Received-Date: Mon, 15 Jan 2018 09:14:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

'startline' is not a recognised keyword, it's beginline.
Also, 'endline' was wrong.

  python-parse: The new md5 checksum is 5147afdd9b3615290ad8733f0137a1a1
  python-parse: Here is the selected license text:
  vvvvvvvvvvvvvvvvvvvvvvvvvvv beginline=1191 vvvvvvvvvvvvvvvvvvvvvvvvvvv
  # Copyright (c) 2012-2013 Richard Jones <richard@python.org>
  #
  # Permission is hereby granted, free of charge, to any person obtaining a copy
  # of this software and associated documentation files (the "Software"), to deal
  # in the Software without restriction, including without limitation the rights
  # to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  # copies of the Software, and to permit persons to whom the Software is
  # furnished to do so, subject to the following conditions:
  #
  #  The above copyright notice and this permission notice shall be included in
  #  all copies or substantial portions of the Software.
  #
  # THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  # IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  # FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  # AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  # LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  # OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  # SOFTWARE.
  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^ endline=1209 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 meta-python/recipes-devtools/python/python-parse_1.8.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-parse_1.8.2.bb b/meta-python/recipes-devtools/python/python-parse_1.8.2.bb
index 037221a3c..8e16372c5 100644
--- a/meta-python/recipes-devtools/python/python-parse_1.8.2.bb
+++ b/meta-python/recipes-devtools/python/python-parse_1.8.2.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Parse strings using a specification based on the Python format() syntax"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://parse.py;md5=a84b494563bba466a2f02b05f2e6ad4a;startline=1191;endline=1210"
+LIC_FILES_CHKSUM = "file://parse.py;beginline=1191;endline=1209;md5=5147afdd9b3615290ad8733f0137a1a1"
 
 SRC_URI[md5sum] = "42002338551bdfa0f01bbe4e679a17dd"
 SRC_URI[sha256sum] = "8048dde3f5ca07ad7ac7350460952d83b63eaacecdac1b37f45fd74870d849d2"
-- 
2.15.1


