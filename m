Return-Path: <andre.draszik@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2DFDA72ECD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Apr 2018 15:06:51 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id p6so15467160pfn.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Apr 2018 08:06:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pQNZGmjTYJPIk9gtJzzu2sb9ztMKT0TQ4Y6Obb3ljfc=;
	b=dUSTqmQzP9aIk8fRtcesn7j8sQSfp0h8zlVYElk3ZPduciqQ86sGQUz6dwJLLls9Qq
	yk9XZ/DEEN0Ahe96AbQVKeIaEbTLDzcOrzEYrgJ57MGHBxDZaihpuC1c0G1+NgWMLwzp
	9AdXzh4jETfhS80QKAr0k4jfHjTXl2o+Pgi1CDXaG/xq/5KAwIUFGcHjzE4AW6GW9iiX
	0khRdFRdIavLOgMJvjstY2S+dRNwgikOKLS0sjX9+ylTzn+VBRuEuMPIkGaiAP450nGv
	cX0VBsCkcmK6RkP2z01It1MS8LrXdeocPYoKiMwj+s4x0woSEVr1l9HBCyWq1Oo6PSB2
	cc/w==
X-Gm-Message-State: ALQs6tBDuFfOllzGTu6S+q/brdbVpAi2bfYU06mfE6rLFrYm+qJOtFkA
	SF1jKyaegCYrjdBLtw8ycLZZ9H6v
X-Google-Smtp-Source: AB8JxZruUopNv4NOF/QawfVLX0MRBB8Y3aWisSzfK7VNJkqM/vaTrqPx6vvq1wTv0H7FvdvhaADXcg==
X-Received: by 2002:a17:902:d88a:: with SMTP id
	b10-v6mr7414094plz.81.1524668813118; 
	Wed, 25 Apr 2018 08:06:53 -0700 (PDT)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	142sm21046002pgg.86.2018.04.25.08.06.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 Apr 2018 08:06:52 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Apr 2018 16:06:46 +0100
Message-Id: <20180425150646.9032-1-git@andred.net>
X-Mailer: git-send-email 2.16.2
MIME-Version: 1.0
Subject: [meta-java][PATCH] docs: add bootstrap-flow.txt
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
X-List-Received-Date: Wed, 25 Apr 2018 15:06:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

Summarises the bootstrap of the java envrionment, rather than having
to find this described in some wiki page that was copied over from
OE-classic and never updated.

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 docs/bootstrap-flow.txt | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 docs/bootstrap-flow.txt

diff --git a/docs/bootstrap-flow.txt b/docs/bootstrap-flow.txt
new file mode 100644
index 0000000..602eab7
--- /dev/null
+++ b/docs/bootstrap-flow.txt
@@ -0,0 +1,37 @@
+* first jikes-native is compiled
+  * a Java 1.4-capable compiler that does not need a runtime or
+    (strictly) a class library to work
+* jikes-initial-native is a wrapper around it
+
+* with this compiler we compile the initial (preliminary)
+  runtime (package virtual/java-initial-native)
+  * virtual/java-initial-native can be: cacao-initial-native (0.98)
+    or jamvm-initial-native (1.4.5)
+    * cacao is preferred, as it has a JIT, but doesn't compile
+      on all hosts
+    * cacao-initial-native and jamvm-initial-native both need
+      classpath-initial-native (0.93) and jikes-initial-native
+
+* now libecj-bootstrap-native is built
+  * this needs jikes-initial-native virtual/java-initial-native
+* now ecj-initial is built
+  * this needs libecj-bootstrap-native and
+    virtual/java-initial-native during runtime
+  * at that point we have a 1.5-capable compiler (ecj-initial)
+    running on a Java 1.4 compatible VM (cacao-inital-native
+    or jamvm-initial-native)
+
+* with this compiler (ecj-initial), we compile the final runtime
+  and compiler (virtual/java-native and virtual/javac-native)
+  * virtual/java-native can be: cacao-native (1.6.1) or
+    jamvm-native (2.0.0~pre)
+    * cacao vs jamvm as above
+    * cacao-native and jamvm-native both need
+      classpath-initial-native (0.93) and classpath-native (0.99)
+      and ecj-initial-native and virtual/java-initial-native
+  * virtual/javac-native can be: ecj-bootstrap-native
+    * ecj-bootstrap-native needs libecj-bootstrap-native
+      and virtual/java-native
+  * at that point we have a 1.5-capable compiler (ecj-bootstrap-native)
+    running on a Java 1.5 compatible VN (cacao-native or
+    jamvm-native)
-- 
2.16.2


