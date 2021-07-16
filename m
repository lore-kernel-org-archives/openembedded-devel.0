Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web10.2938.1626416864574494192
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jul 2021 23:27:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=qDsP8ZAY;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1626416862; i=@fujitsu.com;
	bh=eQZgDUJewwp9DK+W0fT8F6/BZrtohcqXKPjrIoS8Wio=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=qDsP8ZAYWV5uStDhnPPeS9i9DmThgil9PFF66vcP8AsuXFxmKjQ4SeBKhDZmT+3nq
	 +P1Y/ZwkZmjWUqn7WPp02e/gCnMmgfUl/l2r/SmDYwk54KGk2SBwfFgyps2ZGV5Zcw
	 pytHm64H0qJM5K3/nUnJA31k4VAZD1xUREZp1tMeZk7lutOVFdQ3Nffu3vYiGFVNYm
	 jsPi9e2sgdtqrjgECzE667/uJz9qal9mXWw+6YJEOq9U0KjXuy/HosrbfXC0nvjugj
	 rtxsHm4INPDmJjXroDpTNhTC9oyAoeC/FF/U6D+gXcmBZ7p+6Z0hgdGOPbWGrn8l3K
	 Yu4mfI5p+E0TQ==
Received: from [100.112.192.137] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.symcld.net id 64/EF-31114-ED621F06; Fri, 16 Jul 2021 06:27:42 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupikeJIrShJLcpLzFFi42Kxs+GYontX7WO
  CQWe3lMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvFi/kP2gqU8FZdOvGZsYJzL3cXIxSEksI1J
  4s2k28wQzl5Gicb+r0AOJwebgK7Eucdr2UFsEQF9iaWz94DFhQX8JL7O2A0WZxFQlejo7GYEs
  XkFPCUeXf/NCmJLCChITHn4nhkiLihxcuYTFhCbWUBC4uCLF0BxDqAaRYnZ0+Uhyisl9szqZ5
  rAyDMLSccsJB0LGJlWMZonFWWmZ5TkJmbm6BoaGOgaGhrpGlqa6pqY6SVW6SbqpZbqlqcWl+g
  a6iWWF+sVV+Ym56To5aWWbGIEBlFKwWG9HYwT3nzQO8QoycGkJMp7+fOHBCG+pPyUyozE4oz4
  otKc1OJDjDIcHEoSvJ4KHxOEBItS01Mr0jJzgAENk5bg4FES4VUDSfMWFyTmFmemQ6ROMSpKi
  fNOVQVKCIAkMkrz4NpgUXSJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjDvcyWgKTyZeSVw01
  8BLWYCWqy95i3I4pJEhJRUA5NW1IvlGgzf+lZeUzKbdilVvuL4GkYhh+OCK/srcm8LWQhGt70
  LfeBb/UlNVkxxXW1WRumdAw2BLb2q7Xq3Li8XsVn442X01m8KM7a2Z76S/J3AtOLHjqxbWd9l
  X+jXVE5IX9eyZ5ZS/MyInwZzuCdO/2z3+vb76pgPDgv+/Nv8zclkY/2Exvh7sm//9z0/n/rdf
  cGJGX4nlTrFr32K2LmwJ3jl9SPnz19+5/T72oHJ7BMv/fD4c22qvqni27zfz+5rxn/mi5KMDF
  rQ+bLz6KYX2pcWs+S+Ca+5eP3+jMAHk5bdM1Q48qDt/aziDq2I4Oun5S/Ibpda97jqssKPu6s
  U5Llmv3q/IKZF/X/qW4+oVCWW4oxEQy3mouJEAF17hFUdAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-3.tower-267.messagelabs.com!1626416861!111001!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29790 invoked from network); 16 Jul 2021 06:27:41 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-3.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 16 Jul 2021 06:27:41 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16G6RZQn029550
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 16 Jul 2021 07:27:41 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 16 Jul 2021 07:27:33 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-protobuf: upgrade 3.17.0 -> 3.17.3
Date: Fri, 16 Jul 2021 14:27:28 +0800
Message-ID: <1626416848-107386-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain

C++
Introduce FieldAccessListener.
Stop emitting boilerplate {Copy/Merge}From in each ProtoBuf class
Fixed some uninitialized variable warnings in generated_message_reflection.cc.

Kotlin
Fix duplicate proto files error (#8699)

Java
Fixed parser to check that we are at a proper limit when a sub-message has
finished parsing.

General
Support M1 (#8557)

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-protobuf_3.17.0.bb => python3-protobuf_3.17.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-protobuf_3.17.0.bb => python3-protobuf_3.17.3.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_3.17.0.bb b/meta-python/recipes-devtools/python/python3-protobuf_3.17.3.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-protobuf_3.17.0.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_3.17.3.bb
index be846f7993..b3f9f6f21b 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_3.17.0.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_3.17.3.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=19e8f490f9526b1de8
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "05dfe9319939a8473c21b469f34f6486646e54fb8542637cf7ed8e2fbfe21538"
+SRC_URI[sha256sum] = "72804ea5eaa9c22a090d2803813e280fb273b62d5ae497aaf3553d141c4fdd7b"
 
 # http://errors.yoctoproject.org/Errors/Details/184715/
 # Can't find required file: ../src/google/protobuf/descriptor.proto
-- 
2.25.1

