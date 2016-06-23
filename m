Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0B4C66080F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jun 2016 20:48:13 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id j2so17847660qkf.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jun 2016 13:48:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=RJtuVgS4TDYCqBGXa1WjqmRJVkf6r6PZpuiYnDJh1DA=;
	b=NwZzuq/yoKBraCE2axlojhRKrnhWJwEmpyI1Y1vVtPO8x8s1OYS8MetuW/8zWR+y/h
	8gn/YrFdIOxCsr7pB4nHXMGkt9fMfkpJktpqBuWpgeeZyqUuiV4MbRy6OO3VBPUonJFk
	zCAYoAhObgWyFk2U1j5WIwaYZx1IcUrfyypFhyqYJtWULklS8ZnltMIr+sn84tGgO3oA
	WHnOPmLcC2iTO3nIDqsebFJiGGHXd0x5768wwH7QIOrhdQ4Vw5U0M0Zh0IT1N+VSut40
	WjFi674d7hIR/cn9n5bFbwI7XC8kTwJsg+sFRPTHFvGAFBoS0LgUMTk60X0F1KeFwgnD
	z22w==
X-Gm-Message-State: ALyK8tIasCJyBLOjww0VaTJqPbyyOWf6OoxzehKr7tNcg3txJNtT4wEJnwstQ6aZArIOhQ==
X-Received: by 10.55.154.136 with SMTP id c130mr573114qke.79.1466714894265;
	Thu, 23 Jun 2016 13:48:14 -0700 (PDT)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id x21sm753502qkx.12.2016.06.23.13.48.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Jun 2016 13:48:13 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Jun 2016 16:48:07 -0400
Message-Id: <1466714887-11968-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python-pyserial: update to version 3.1.1
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
X-List-Received-Date: Thu, 23 Jun 2016 20:48:14 -0000

 * Update license checksum for copyright year

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pyserial.inc             | 6 +++---
 .../python/{python-pyserial_3.0.1.bb => python-pyserial_3.1.1.bb}   | 0
 .../python/{python3-pyserial_3.0.1.bb => python3-pyserial_3.1.1.bb} | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyserial_3.0.1.bb => python-pyserial_3.1.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pyserial_3.0.1.bb => python3-pyserial_3.1.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pyserial.inc b/meta-python/recipes-devtools/python/python-pyserial.inc
index 08eef74..a4c7728 100644
--- a/meta-python/recipes-devtools/python/python-pyserial.inc
+++ b/meta-python/recipes-devtools/python/python-pyserial.inc
@@ -1,6 +1,6 @@
 SUMMARY = "Serial Port Support for Python"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=0051a0dc811ee3fdb17a2fd0be44f3ad"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=d476d94926db6e0008a5b3860d1f5c0d"
 
 # FIXME might stop packaging serialwin32 and serialjava files
 
@@ -10,7 +10,7 @@ RDEPENDS_${PN} = "\
     ${PYTHON_PN}-stringold \
 "
 
-SRC_URI[md5sum] = "c8521e49f8852196aac39431e0901703"
-SRC_URI[sha256sum] = "969cb6405d1d87f8960cf9c10f597ae58f85da2fb9769dba96f4aeeaade54656"
+SRC_URI[md5sum] = "2f72100de3e410b36d575e12e82e9d27"
+SRC_URI[sha256sum] = "d657051249ce3cbd0446bcfb2be07a435e1029da4d63f53ed9b4cdde7373364c"
 
 inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-pyserial_3.0.1.bb b/meta-python/recipes-devtools/python/python-pyserial_3.1.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pyserial_3.0.1.bb
rename to meta-python/recipes-devtools/python/python-pyserial_3.1.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-pyserial_3.0.1.bb b/meta-python/recipes-devtools/python/python3-pyserial_3.1.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pyserial_3.0.1.bb
rename to meta-python/recipes-devtools/python/python3-pyserial_3.1.1.bb
-- 
1.9.1


