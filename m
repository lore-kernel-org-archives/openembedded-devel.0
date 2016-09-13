Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id DBCBF75E80
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Sep 2016 12:17:53 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id k12so7038531lfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Sep 2016 05:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=iNXrKcNL5stIqsmRcvXz4e3o0dY3sAOR51SVx8EAlO4=;
	b=gkA0N/AXlc9MAerVLUskF6Kr+03ySxCY+rN+ME9x5UoXMQ9S7K1LvsyewLBX6SiJ9o
	WgnE2XNqxxO+FA5WhmfsTN/r9Y8eeoex8zT8niUMQOOtTkjZOAwitU3SjF/sD9xztHYW
	8lTW8SD3xUn6w1dt+E38+7b88S0MEtmqQmsJ59nrQ5AoAWc5WM8HlG0/f+KHCgcDCo00
	7S6GJq9qmgMaS5QVxTWQT4byI2xco/GFU0hOUQbKx0ayobBVMkomIestUV72yl7N1xhU
	qvX5wEFhRIBalHAqRac8RPfcXi1Gb4D6xF5iG+Nn/IV1Mi+85K1/KkztGa2Y+h0mJc9/
	SI0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=iNXrKcNL5stIqsmRcvXz4e3o0dY3sAOR51SVx8EAlO4=;
	b=gMIrTpBgOF1xA4g8/DAWR1jd1XAKLoYTiZScAz65OCQtLxh4HaYcX1O9EizD+ExqDP
	JutFVPDmqFE/k9e1uv6UYm8Jsh2ZRU/LgqsWSIX+FStv1A/j0iFdhwxXbmWPXkq/mCDJ
	vjJHPTd/R4uyJAWtmqYEOlxjT4VmoLnlX9yIK07ZjFfTag/H/QyoOMabhBCwksxnm746
	DfsIyCLbOQAxBhSZZvxOSluOUjb3b2tZaDCvbM7IN25Oh7LXSWPYA9vrrVFjPQiOLYZy
	4GCRTmjA/oluZ1xlnXPLN30NqnOp2X0kNdqzpUgGn/5DOtyNsjSaxLs3Jsrnjogeys99
	xfqQ==
X-Gm-Message-State: AE9vXwPlMokUBZ9XDTL/2w3iF3SVXWIq0dF+4vATFTsU32Q44zLp5VPhlKzO10sh8ZbCew==
X-Received: by 10.25.206.80 with SMTP id e77mr6760419lfg.103.1473769073316;
	Tue, 13 Sep 2016 05:17:53 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id i80sm3910286lfg.6.2016.09.13.05.17.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Sep 2016 05:17:52 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Sep 2016 14:17:48 +0200
Message-Id: <20160913121749.11771-1-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.9.3
Subject: [meta-java][PATCH 1/2] xpp2: Remove bashism
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
X-List-Received-Date: Tue, 13 Sep 2016 12:17:54 -0000

ERROR: xpp2-2.1.10-r0 do_compile: Function failed: do_compile (log file
		is located at
/var/lib/jenkins/workspace/qt5022-cesium/build/tmp/work/all-poky-linux/xpp2/2.1.10-r0/temp/log.do_compile.6694)
ERROR: Logfile of failure stored in:
/var/lib/jenkins/workspace/qt5022-cesium/build/tmp/work/all-poky-linux/xpp2/2.1.10-r0/temp/log.do_compile.6694
Log data follows:
| DEBUG: Executing shell function do_compile
|
/var/lib/jenkins/workspace/qt5022-cesium/build/tmp/work/all-poky-linux/xpp2/2.1.10-r0/temp/run.do_compile.6694:
109:
/var/lib/jenkins/workspace/qt5022-cesium/build/tmp/work/all-poky-linux/xpp2/2.1.10-r0/temp/run.do_compile.6694:
Bad substitution
| WARNING: exit code 2 from a shell command.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 recipes-core/xml-commons/xpp2_2.1.10.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/recipes-core/xml-commons/xpp2_2.1.10.bb b/recipes-core/xml-commons/xpp2_2.1.10.bb
index d3baca436b60..32457ddf899c 100644
--- a/recipes-core/xml-commons/xpp2_2.1.10.bb
+++ b/recipes-core/xml-commons/xpp2_2.1.10.bb
@@ -18,8 +18,7 @@ do_compile() {
     mkdir -p build-oe
 
     sourcepath="src/java/drivers/jaxp11:src/java/drivers/sax2:src/java/impl/factory:src/java/impl/format:src/java/impl/node:src/java/impl/pullparser:src/java/impl/tag:src/java/intf"
-
-    findpath="${sourcepath//:/ }"
+    findpath="src/java/drivers/jaxp11 src/java/drivers/sax2 src/java/impl/factory src/java/impl/format src/java/impl/node src/java/impl/pullparser src/java/impl/tag src/java/intf"
 
     javac -sourcepath $sourcepath -d build-oe `find $findpath -name "*.java"`
 
-- 
2.9.3


